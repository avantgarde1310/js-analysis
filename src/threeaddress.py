'''
Created on Feb 10, 2012

@author: Ivan Gozali

threeaddress.py

A collection of modules to convert specific parts of an AST into three address
code format. This module will take all statements while ignoring control flow, 
and converting them into three address format.
'''

from ucb import main as _main

import astutils
import fileutils
import os
import argparse

counter = 0
NODE_TYPES = ["SEMICOLON", "COMMA", "HOOK", "COLON", "OR", "AND",
              "BITWISE_OR", "BITWISE_XOR", "BITWISE_AND", "STRICT_EQ",
              "EQ", "ASSIGN", "STRICT_NE", "NE", "LSH", "LE", "LT",
              "URSH", "RSH", "GE", "GT", "INCREMENT", "DECREMENT",
              "PLUS", "MINUS", "MUL", "DIV", "MOD", "NOT", "BITWISE_NOT",
              "DOT", 
              
              "RETURN", "FUNCTION", "VAR", "INDEX"]

NODE_TOKENS = [";", ",","?",":","||","&&","|","^","&","===","==","=","!==","!=",
               "<<","<=","<",">>>",">>",">=",">","++","--","+","-","*","/","%","!","~",".",
               
               "return","function",":=","["]

OPERATOR_DICT = dict()
for i in range(len(NODE_TYPES)):
    OPERATOR_DICT[NODE_TYPES[i]] = NODE_TOKENS[i]

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
    
    def reduce_rhs(self, node):
        class Namespace(object): pass
        ns = Namespace()
        ns.in_function = False
        
        operands_stack = []
        
        def add_operand(node):
            if astutils.is_node_type(node, ["IDENTIFIER", "NUMBER", "STRING"]):
                operands_stack.append(node.value)
                
            elif astutils.is_node_type(node, "FUNCTION"):
                operands_stack.append(node.name)
                ns.in_function = True
        
        def reduce_exp(node):
#            print operands_stack
            
            if astutils.is_node_type(node, "FUNCTION"):
                operands_stack.pop()
                lhs = node.name
                
                operands_stack.append(lhs)
                
                ns.in_function = False
                
                
            elif astutils.is_node_type(node, "CALL"):
                arglist = []
                for _ in range(len(node[1])):
                    arglist.append(operands_stack.pop())
#                print "redexp arglist : " + str(arglist)
                arglist.reverse()
                
                call_operand = operands_stack.pop()
#                print "redexp callop : " + call_operand
                
                operator = "(" + str(arglist) + ")"
                lhs = self.create_temp()
                
                
                threeaddress = ThreeAddress(lhs, call_operand, None, operator)
                if not ns.in_function:
                    self.three_address_list.append(threeaddress)
                operands_stack.append(lhs)
                
            elif astutils.is_node_type(node, NODE_TYPES) and len(operands_stack) >= 2:
                operator = OPERATOR_DICT[node.type]
                rhs2 = operands_stack.pop()
                rhs1 = operands_stack.pop()
                lhs = self.create_temp()
                
                threeaddress = ThreeAddress(lhs, rhs1, rhs2, operator)
                if not ns.in_function:
                    self.three_address_list.append(threeaddress)
                operands_stack.append(lhs)
        
        astutils.traverse_AST(node, add_operand, reduce_exp)
        
        return operands_stack[0]
        
    def convert_to_three_address(self):
        if not self._three_address_list:
            for statement_node in self.statement_node_list:
                if astutils.is_node_type(statement_node, "VAR"):
                    lhs = statement_node[0].value
                    rhs = self.reduce_rhs(statement_node[0].initializer)
                    
                    threeaddress = ThreeAddress(lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
                
                elif astutils.is_node_type(statement_node, "ASSIGN"):
                    lhs = statement_node[0].value
                    rhs = self.reduce_rhs(statement_node[1])
                    
                    threeaddress = ThreeAddress(lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
                
                elif astutils.is_node_type(statement_node, "FUNCTION"):
                    lhs = statement_node.name
                    rhs = "function(" + str(statement_node.params) + "){...}"
                    
                    threeaddress = ThreeAddress(lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
                
                elif astutils.is_node_type(statement_node, "RETURN"):
                    operator = "return"
                    rhs = self.reduce_rhs(statement_node.value)
                    
                    threeaddress = ThreeAddress(None, None, rhs, operator)
                    self.three_address_list.append(threeaddress)
                    
                else:
                    lhs = self.create_temp()
                    rhs = self.reduce_rhs(statement_node)
                    
                    threeaddress = ThreeAddress(lhs, None, rhs, None)
                    self.three_address_list.append(threeaddress)
            
            self._three_address_list = True
                
    def print_three_address(self):
        if self._three_address_list:
            for three_address in self.three_address_list:
                print three_address
        else:
            raise Exception()
    
    def __repr__(self):
        return "Function(name:{0}, parent:{1})".format(self.name, 
                                                       self.parent_function.name if self.parent_function else "None")

class ThreeAddress(object):   
    def __init__(self, lhs, rhs1, rhs2, operator):
        self.lhs = lhs
        self.rhs1 = rhs1
        self.rhs2 = rhs2
        self.operator = operator
        
    def __repr__(self):
        return "ThreeAddress({0}, {1}, {2}, {3})".format(self.lhs, self.rhs1, self.rhs2, self.operator)
    
    def __str__(self):
        result = ""
        if self.lhs:
            result += str(self.lhs) + " := "
        if self.rhs1:
            result += str(self.rhs1) + " "
        if self.operator:
            result += str(self.operator) + " "
        if self.rhs2:
            result += str(self.rhs2)
        
        return result

def analyze_three_address(ast):
    class Namespace(object): pass
    ns = Namespace()
    ns.current_function = Function("__global__")
    
    def pre_helper(node):
        if astutils.is_node_type(node, "VAR"):
            ns.current_function.statement_node_list.append(node)
        elif astutils.is_node_type(node, "IF"):
            ns.current_function.statement_node_list.append(node.condition)
        elif astutils.is_node_type(node, "SEMICOLON"):
            ns.current_function.statement_node_list.append(node.expression)
        elif astutils.is_node_type(node, "RETURN"):
            ns.current_function.statement_node_list.append(node)
        elif astutils.is_node_type(node, "FUNCTION"):
            ns.current_function.statement_node_list.append(node)
            
            new_function = Function(node.name, ns.current_function)
            ns.current_function.children_functions.append(new_function)
            ns.current_function = new_function
    
    def post_helper(node):
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

def traverse_functions(fn):
    print fn
    fn.print_three_address()
    print "----------------------------------------\n"
    for child_fn in fn.children_functions:
        traverse_functions(child_fn)
    

@_main
def main(*args):
    #Parsing Arguments---------------------------------------------------------------------------
    parser = argparse.ArgumentParser(description="threeaddress.py test module")
    
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
        
    #Start Doing Stuff With AST------------------------------------------------------------------ 
    ASTstring = str(ast)
    
    print "Three Address Code Module\nIvan Gozali\n"
    
    global_fn = analyze_three_address(ast)
    convert_functions(global_fn)
    traverse_functions(global_fn)
    
    #Output Stuff--------------------------------------------------------------------------------
    outputfile = open(outputpath + "\\threeaddress_out.txt", "w")
    outputfile.write(ASTstring)
    outputfile.close()

