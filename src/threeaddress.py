'''
Created on Feb 10, 2012

@author: Ivan Gozali

threeaddress.py

A collection of modules to convert specific parts of an AST into three address
code format. This module will take all statements while ignoring control flow, 
and convert them into three address format.

Workflow for threeaddress.py

1.  Receive AST

2.  AST is input into the function analyze_three_address(ast). A global
    Function object is retrieved, along with all other functions.

    This will traverse the AST, and create a tree of Function objects 
    (Function objects resemble frames that keep track of what statements 
    it has with a list). At the same time, relevant statements are added
    to the Function object's statement_list. All of this can be done in 1
    AST traversal.
    
    Relevant statements in this context are statements that only contain
    binary operators, unary operators, calls, dots, assignments, function
    declarations and return statements. Most of these relevant statements 
    are in SEMICOLON nodes and VAR nodes.
    
    We are not concerned about control flow, but we are concerned with the
    expressions that the control flow statements contain. Therefore, we 
    have to appropriately extract expression from these statements:
    -    The condition in IF statements
    -    The setup, condition, and update in FOR statements
    -    The condition in WHILE statements

3.  Three address code generation for each function objects.
    
    For each function, generate the three_address_list from the 
    statement_node_list it contains. Generation of the three_address_list 
    is lazily evaluated. The method of generating the three address code is
    by calling convert_to_three_address() on the function object, which will
    take care of the conversion of all statements. What this method does is:
    -    For each statement, check whether it falls into the categories 
         described in the method. If there is a possibility that the right 
         side contains nested expressions, the method reduce_rhs() will be 
         called to reduce the rhs into one single expression. 
    
    -    In the process of doing reduce_rhs(), three address statements will
         be generated as well and put into the three_statement_list.
         
    -    The method reduce_rhs() will be the heart of conversion into three
         address codes. convert_to_three_address() is simply an entrance to 
         using this function.

4.  After step 3, each Function object should have their own list of three
    address codes. We can simply traverse the tree and print them all, or 
    pass the global function object to the next phase of analysis.
    
5.  For the next phase for analysis, this module's input/output is as follows:
    Input   : alpha-renamed AST (alpharenamedAST)
    
    Process : global_fn = analyze_three_address(alpharenamedAST)
              convert_functions(global_fn)
              
    Output  : threeaddress.Function object (global_fn) which holds the three
              address codes for all functions inside the JavaScript module

FIXED: Fix undefined variable declarations.
FIXED: Add FOR, WHILE in analyze_three_address() -> added
FIXED: STILL FAILS FNARGS.JS - reduce_exp() on FUNCTION
FIXED: Return statements that don't return anything -> now returns null.
FIXED: FOR statements might not contain setup/update/condition -> using ifs.
FIXED: Handle STORE statements !!!!! Resolve lhs of ASSIGN node using 
       ref/derefs (create new function reduce_lhs()).

MAYBE FIXED: Running on adblock.js
MAYBE FIXED: Fix anonymous function handling. (Has to go through 
             alpharenamer + threeaddress check)
MAYBE FIXED: Take care of indexing (arr[0]) -> handled the same way as dots

TODO: Handle other assignment operators +=, -=, /=, etc.
TODO: Fix multiple variable declarations using COMMA.
TODO: Ternary operators. What do?
'''

from ucb import main as _main

import astutils
import fileutils
import os
import argparse

#NODE_TYPES      = ["SEMICOLON", "COMMA", "HOOK", "COLON", "OR", "AND",
#                   "BITWISE_OR", "BITWISE_XOR", "BITWISE_AND", "STRICT_EQ",
#                   "EQ", "ASSIGN", "STRICT_NE", "NE", "LSH", "LE", "LT",
#                   "URSH", "RSH", "GE", "GT", "INCREMENT", "DECREMENT",
#                   "PLUS", "MINUS", "MUL", "DIV", "MOD", "NOT", "BITWISE_NOT",
#                   "DOT", 
#              
#                   "RETURN", "FUNCTION", "VAR", "INDEX"]
#
#NODE_TOKENS     = [";", ",","?",":","||","&&","|","^","&","===","==","=","!==","!=",
#                   "<<","<=","<",">>>",">>",">=",">","++","--","+","-","*","/","%","!","~",".",
#               
#                   "return","function",":=","["]
#
#OPERATOR_DICT = dict()
#for i in range(len(NODE_TYPES)):
#    OPERATOR_DICT[NODE_TYPES[i]] = NODE_TOKENS[i]

# DOT is not included in BINARY_OPS because it's a special case.

#Constants ----------------
BINARY_OPS      = ["OR", "AND", "BITWISE_OR", "BITWISE_XOR", "BITWISE_AND", 
                   "STRICT_EQ", "EQ", "STRICT_NE", "NE", "LSH", "LE", "LT",
                   "URSH", "RSH", "GE", "GT", 
                   "PLUS", "MINUS", "MUL", "DIV", "MOD"]

BINARY_TOKENS   = ["||", "&&", "|", "^", "&",
                   "===", "==", "!==", "!=", "<<", "<=", "<",
                   ">>>", ">>", ">=", ">",
                   "+", "-", "*", "/", "%"]

BINARY_DICT = dict()
for i in range(len(BINARY_OPS)):
    BINARY_DICT[BINARY_OPS[i]] = BINARY_TOKENS[i]
    
UNARY_OPS       = ["UNARY_MINUS", "INCREMENT", "DECREMENT", "NOT", "BITWISE_NOT"]

UNARY_TOKENS    = ["-", "++", "--", "!", "~"]

UNARY_DICT = dict()
for i in range(len(UNARY_OPS)):
    UNARY_DICT[UNARY_OPS[i]] = UNARY_TOKENS[i]

#Global Variables ----------------
lambda_counter = 0

#Classes ----------------

class Function(object):
    tempvar_counter = 0
    
    def __init__(self, name, parent_function=None):
        self.name = name
        
        self.parent_function = parent_function
        self.children_functions = []
        
        self.statement_node_list = []
        self.three_address_list = []
        self._three_address_list = False
    
    def create_temp(self):
        new_tempvar = "t" + str(Function.tempvar_counter)
        Function.tempvar_counter += 1
        return new_tempvar
    
    def reduce_lhs(self, node):
        from collections import deque
        operands_queue = deque([])
        
        def add_operand(node):
            if astutils.is_node_type(node, "IDENTIFIER"):
                operands_queue.append(node.value)
        
        astutils.traverse_AST(node, add_operand, None)
        
        # if only one operand in queue, return immediately
        if len(operands_queue) == 1:
            return operands_queue
        
        while len(operands_queue) > 2:
            lhs = self.create_temp()
            rhs1 = operands_queue.popleft()
            rhs2 = operands_queue.popleft()
            op = "."
            
            threeaddress = ThreeAddress("LOAD", lhs, rhs1, rhs2, op)
            self.three_address_list.append(threeaddress)
            
            operands_queue.appendleft(lhs)
        
        # Only 2 identifiers should remain in the queue
        assert len(operands_queue) == 2, "operands_queue has length > 2."
        return operands_queue
        
    def reduce_rhs(self, node, caller_lhs=None):
        """ Reduces the right hand side of an expression to a single variable.
        Very useful in generating three address codes.
        
        node  - an AST node representing the right hand side of an expression to
                be reduced
        lhs   - used for OBJECT_INIT, where the reduce_rhs function needs to know
                about the left hand side.
        """
        class Namespace(object): pass
        ns = Namespace()
        ns.in_block = []
        ns.in_function = False
        ns.in_object_init = False
        
        operands_stack = []
        
        def add_operand(node):
            #DEBUGGING Pre---
#            print "PRE  " + str(node.type) + " " + str(node.value) + " " + str(node.lineno)
            
            if len(ns.in_block) > 0:
                return 
            
            if astutils.is_node_type(node, "FUNCTION"):
                #DEBUGGING in_func---
#                print "in function" + node.name
                
                ns.in_block.append("IN_FUNCTION_" + node.name)            

            if astutils.is_node_type(node, "OBJECT_INIT"):
                assert caller_lhs is not None, "reduce_rhs needs information about lhs for OBJECT_INIT"
                
                for object_property in node:
                    lhs1 = caller_lhs
                    lhs2 = object_property[0].value
                    lhs = (lhs1, lhs2)
                    rhs = self.reduce_rhs(object_property[1])
                    
                    threeaddress = ThreeAddress("STORE", lhs, rhs, None, None)
                    self.three_address_list.append(threeaddress)
                
                #DEBUGGING in_obj_init---
#                print "in object init"

                ns.in_block.append("IN_OBJECT_INIT")
            
            if astutils.is_node_type(node, ["THIS", "IDENTIFIER", "NUMBER", "STRING", "TRUE", "FALSE", "REGEXP"]):    
                operands_stack.append(node.value)
        # END add_operand
        
        def reduce_exp(node):
            # The heart of three address code generation. Reduces
            # complex expressions on the right hand side of an assignment
            # statement into one temporary variable.
            
#            print operands_stack
            
            #DEBUGGING Post---
#            print "POST " + str(node.type) + " " + str(node.value) + " " + str(node.lineno)
            if len(ns.in_block) > 0:
                if astutils.is_node_type(node, "FUNCTION"):
                    # Every function will have a name, even anonymous functions
                    # because the alpharenamer phase gives names to all function
                    # nodes regardless.
                    if ns.in_block[-1] == "IN_FUNCTION_" + node.name:
                        ns.in_block.pop()
                        lhs = node.name
                        operands_stack.append(lhs)
                    
                        #DEBUGGING out_func---
#                    print "out of function " + node.name
                         
                elif astutils.is_node_type(node, "OBJECT_INIT"):
                    if ns.in_block[-1] == "IN_OBJECT_INIT":
                        ns.in_block.pop()
                        operands_stack.append("__objectInit__")
                        
                        #DEBUGGING out_obj_init---
#                    print "out of obj_init"
            
            else:
            # Perform reduction only when not inside a function or object
            # initialization , because functions are handled separately.
                if astutils.is_node_type(node, "CALL"):
                    arglist = []
                    for _ in range(len(node[1])):
                        arglist.append(operands_stack.pop())

                    arglist.reverse()
                    #DEBUGGING print_three_address---
#                    print "---------------TAC-----------------"
#                    for t in self.three_address_list:
#                        print t
#                    print "---------------TAC-----------------"
                    call_operand = operands_stack.pop()

                    operator = "("
                    lhs = self.create_temp()
                    
                    threeaddress = ThreeAddress("CALL", lhs, call_operand, arglist, operator)
                    self.three_address_list.append(threeaddress)
                    operands_stack.append(lhs)
                
                elif astutils.is_node_type(node, ["DOT", "INDEX"]) and len(operands_stack) >= 2:
                    operator = "."
                    rhs2 = operands_stack.pop()
                    rhs1 = operands_stack.pop()
                    lhs = self.create_temp()
                    
                    threeaddress = ThreeAddress("LOAD", lhs, rhs1, rhs2, operator)
                    self.three_address_list.append(threeaddress)
                    operands_stack.append(lhs)
                
                # Handle reduction of binary operators.
                elif astutils.is_node_type(node, BINARY_OPS) and len(operands_stack) >= 2:
                    operator = BINARY_DICT[node.type]
                    rhs2 = operands_stack.pop()
                    rhs1 = operands_stack.pop()
                    lhs = self.create_temp()
                    
                    threeaddress = ThreeAddress("ASSIGNMENT", lhs, rhs1, rhs2, operator)
                    self.three_address_list.append(threeaddress)
                    operands_stack.append(lhs)
                
                # Handle reduction of unary operators.
                elif astutils.is_node_type(node, UNARY_OPS) and len(operands_stack) >= 1:
                    operator = UNARY_DICT[node.type]
                    rhs2 = operands_stack.pop()
                    rhs1 = None
                    lhs = self.create_temp()
                    
                    threeaddress = ThreeAddress("ASSIGNMENT", lhs, rhs1, rhs2, operator)
                    
                    self.three_address_list.append(threeaddress)
                    operands_stack.append(lhs)
                
        # END reduce_exp()
        
        astutils.traverse_AST(node, add_operand, reduce_exp)
        
        #DEBUGGING print_three_address---
#        print "---------------TAC-----------------"
#        for t in self.three_address_list:
#            print t
#        print "---------------TAC-----------------"
        assert len(operands_stack) == 1, "Junk data exists in operand_stack: " + str(operands_stack)
        return operands_stack[0]
    
    # END reduce_rhs()    
        
    def convert_to_three_address(self):
        #DEBUGGING print_fn_name---
#        print "function name -------------" + self.name
        if not self._three_address_list:
            # All the statement nodes at this point should only be
            # relevant statements.
            for statement_node in self.statement_node_list:
                if astutils.is_node_type(statement_node, "VAR"):
                    lhs = statement_node[0].value
                    if hasattr(statement_node[0], "initializer"):
                        rhs = self.reduce_rhs(statement_node[0].initializer, lhs)
                    else:
                        rhs = "__undefined__"
                    
                    threeaddress = ThreeAddress("VARDECL", lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
                
                elif astutils.is_node_type(statement_node, "ASSIGN"):
                    lhs = self.reduce_lhs(statement_node[0])
                    rhs = self.reduce_rhs(statement_node[1], lhs)
                    
                    if len(lhs) == 2:
                        threeaddress = ThreeAddress("STORE", tuple(lhs), rhs, None, None)
                    elif len(lhs) == 1:
                        threeaddress = ThreeAddress("ASSIGNMENT", lhs[0], None, rhs, None)
                    
                    self.three_address_list.append(threeaddress)
                
                # Interesting to note that functions that occur as relevant 
                # statements cannot be anonymous, because there's no point 
                # in an anonymous function declaration.
                elif astutils.is_node_type(statement_node, "FUNCTION"):
                    lhs = statement_node.name
                    params = statement_node.params
                    operator = "{...}"
                    threeaddress = ThreeAddress("FUNCTIONDECL", lhs, "function", params, operator)
                    self.three_address_list.append(threeaddress)
                
                elif astutils.is_node_type(statement_node, "RETURN"):
                    operator = "return"
                    
                    # Handle return statements that return nothing
                    if statement_node.value == "return":
                        rhs = "null"
                    else:
                        rhs = self.reduce_rhs(statement_node.value)
                        
                    threeaddress = ThreeAddress("RETURN", None, None, rhs, operator)
                    self.three_address_list.append(threeaddress)
                
                else:
                    #DEBUGGING print_else_node---
#                    print statement_node
                    lhs = self.create_temp()
#                    print "lhs ------ " + lhs
                    rhs = self.reduce_rhs(statement_node)
                    
                    threeaddress = ThreeAddress("ASSIGNMENT", lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
            
            self._three_address_list = True
    
    def print_relevant_statement_types(self):
        for node in self.statement_node_list:
            print "RelevantStatement(type:{0})".format(getattr(node, "type", "__unknowntype__"))
                
    def print_three_address(self):
        if self._three_address_list:
            for three_address in self.three_address_list:
                print "- " + str(three_address)
        else:
            raise Exception()
    
    def __repr__(self):
        return "Function(name:{0}, parent:{1})".format(self.name, 
                                                       self.parent_function.name if self.parent_function else "None")

class ThreeAddress(object):
    """ Holds three address code information about a program. 
    Here are some of the expected forms of ThreeAddress objects 
    for various AST nodes:
    
    [ASSIGNMENT] # Binary Operators
    lhs  : (str) variable to be assigned the value
    rhs1 : (str) first operand
    rhs2 : (str) second operand
    op   : (str) binary operator
    
    [ASSIGNMENT] # Unary Operators
    lhs  : (str) variable to be assigned the value
    rhs1 : (None)
    rhs2 : (str) operand
    op   : (str) unary operator
    
    [RETURN]
    lhs  : (None)
    rhs1 : (None)
    rhs2 : (str/int) value to be returned
    op   : (str) "return"
    
    [CONSTRUCTOR]
    
    [CALL]
    lhs  : (str) variable to be assigned the value
    rhs1 : (str) call operand (object to be called)
    rhs2 : (list) arguments of type str 
    op   : (str) "("
    
    [LOAD/INDEX]
    lhs  : (str) variable to be assigned the value
    rhs1 : (str) object to be accessed
    rhs2 : (str) object member
    op   : (str) "."
    
    [STORE]
    lhs  : (tuple) object and member to be stored the value (both strs)
    rhs1 : (str) value to be stored
    rhs2 : (None)
    op   : (None)
    
    [FUNCTIONDECL]
    lhs  : (str) function name
    rhs1 : (None) 
    rhs2 : (list) function parameters of type string 
    op   : (str) "function"
    """   
    def __init__(self, statement_type, lhs, rhs1, rhs2, operator):
        self.statement_type = statement_type
        self.lhs = lhs
        self.rhs1 = rhs1
        self.rhs2 = rhs2
        self.operator = operator
        
    def __repr__(self):
        return "ThreeAddress({0}, {1}, {2}, {3})".format(self.lhs, self.rhs1, self.rhs2, self.operator)
    
    def __str__(self):
        if self.statement_type == "CALL":
            argstr = ""
            for arg in self.rhs2:
                argstr += str(arg) + ", "
            # remove the trailing ", " at the end
            argstr = argstr[:-2]
            
            return str(self.lhs) + " := " + str(self.rhs1) + "(" + argstr + ")"
        
        elif self.statement_type == "FUNCTIONDECL":
            paramstr = ""
            for param in self.rhs2:
                paramstr += str(param) + ", "
            # remove the trailing ", " at the end
            paramstr = paramstr[:-2]
            
            return self.lhs + " := " + self.rhs1 + "(" + paramstr + "){...}"
        
        elif self.statement_type == "LOAD":
            return str(self.lhs) + " := " + str(self.rhs1) + "." + str(self.rhs2)
        
        elif self.statement_type == "STORE":
            return str(self.lhs[0]) + "." + str(self.lhs[1]) + " := " + str(self.rhs1)
        
        else:
            result = ""
            if self.lhs is not None:
                result += str(self.lhs) + " := "
            if self.rhs1 is not None:
                result += str(self.rhs1) + " "
            if self.operator is not None:
                result += str(self.operator) + " "
            if self.rhs2 is not None:
                result += str(self.rhs2)
            
            return result

#Modules ----------------
def analyze_three_address(ast):
    class Namespace(object): pass
    ns = Namespace()
    ns.current_function = Function("__global__")
    
    def pre_helper(node):
        # Perform the main function of analyze_three_address, which is
        # to create the tree of Frame objects. In addition, add the 
        # statement node so the position where the function was declared
        # is not lost.
        if astutils.is_node_type(node, "FUNCTION"):
            ns.current_function.statement_node_list.append(node)
            
            if hasattr(node, "name"):
                fn_name = node.name
            else:
                global lambda_counter
                fn_name = "lambda" + str(lambda_counter)
                # Modifies AST node to contain a name. This line should only
                # be called if AST hasn't been alpha-renamed
                node.name = fn_name
                lambda_counter += 1
            
            new_function = Function(fn_name, ns.current_function)
            ns.current_function.children_functions.append(new_function)
            ns.current_function = new_function
        
        # Most of the relevant statements are in VAR and SEMICOLON
        elif astutils.is_node_type(node, "VAR"):
            # For VAR, take the whole thing
            ns.current_function.statement_node_list.append(node)
        elif astutils.is_node_type(node, "SEMICOLON"):
            # For SEMICOLON, take the expression
            ns.current_function.statement_node_list.append(node.expression)
        
        # Retrieve RETURN nodes
        elif astutils.is_node_type(node, "RETURN"):
            ns.current_function.statement_node_list.append(node)
        
        # Extract relevant expressions from IF, FOR, WHILE
        elif astutils.is_node_type(node, ["IF", "WHILE", "DO"]):
            ns.current_function.statement_node_list.append(node.condition)
        elif astutils.is_node_type(node, "FOR"):
            if node.condition is not None:
                ns.current_function.statement_node_list.append(node.condition)
            if node.setup is not None:
                ns.current_function.statement_node_list.append(node.setup)
            if node.update is not None:
                ns.current_function.statement_node_list.append(node.update)
                
    def post_helper(node):
        # Helper function to help keep track of the current_function
        if astutils.is_node_type(node, "FUNCTION"):
            ns.current_function = ns.current_function.parent_function
    
    astutils.traverse_AST(ast, pre_helper, post_helper)
    
    return ns.current_function

def pre_print_type(node):
    print "pre " + getattr(node, "type", "Node has no type.")

def post_print_type(node):
    print "post " + getattr(node, "type", "Node has no type.") 

def convert_functions(fn):
    fn.convert_to_three_address()
    for child_fn in fn.children_functions:
        convert_functions(child_fn)

def print_all_three_addresses(fn):
    print fn
#    fn.print_relevant_statement_types()
    fn.print_three_address()
    print "----------------------------------------\n"
    for child_fn in fn.children_functions:
        print_all_three_addresses(child_fn)
    
@_main
def main(*args):
    #Parsing Arguments-----------------------------------------------------------------------
    parser = argparse.ArgumentParser(prog="Three Address Generator", description="threeaddress.py test module")
    
    parser.add_argument("filepath", action="store", help="the path to JavaScript file or the file")
    parser.add_argument("-o", action="store", dest="outputpath", help="output path (not file!)")
    parser.add_argument("-e", action="store_true", default=False, dest="isextension", help="set if the path given is an extension path")
    
    results = parser.parse_args()
    
    filepath = results.filepath
    
    if results.outputpath:
        outputpath = results.outputpath
        if not os.path.exists(outputpath):
            os.mkdir(outputpath)
    else:
        outputpath = os.getcwd()
    
    isextension = results.isextension

    if isextension:
        from driver import get_extension_name

        ext_name = get_extension_name(filepath)
        print "Extension Name: ", ext_name
        ext_id = filepath.split("\\")[-1]
        print "Extension ID: ", ext_id
        print
#        jsout = open(outputpath + "\\jsout.js", "w")
#        jsout.write(js_string)
#        jsout.close()
        
        js_string = fileutils.combine_js_files(filepath)
        ast = astutils.create_AST_from_string(js_string)
    else:    
        ast = astutils.create_AST(filepath)
        
    #Start Doing Stuff With AST-------------------------------------------------------------- 
    print "Three Address Code Module\nIvan Gozali\n"
    
    print "Creating frame structure...",
    #ThreeAddressAnalyze---
    global_fn = analyze_three_address(ast)
    print "OK"
    
    print "Converting statements into three address codes...",
    convert_functions(global_fn)
    print "OK\n"
    
    print_all_three_addresses(global_fn)
#    
    #Output Stuff----------------------------------------------------------------------------
    if results.outputpath:
        ASTstring = str(ast)
        outputfile = open(outputpath + "\\threeac_ast_out.txt", "w")
        outputfile.write(ASTstring)
        outputfile.close()
        
        import asttrimmer
        trimmed_AST = asttrimmer.trim_AST_string(ASTstring)
        outputfile = open(outputpath + "\\threeac_ast_trimmed_out.txt", "w")
        outputfile.write(trimmed_AST)
        outputfile.close()
