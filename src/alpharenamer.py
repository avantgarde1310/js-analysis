'''
Created on Nov 2, 2011

@author: Ivan Gozali
'''

from analyzer import main, create_AST
import jsparser

def traverse_AST_level(node, fn, level=0):
    """
    Traverses the whole AST passed in as node, and applies the function fn
    to each node.
    
    This function WILL NOT TRAVERSE THE varDecls attribute of the AST, because
    the varDecls attribute is of type list, and as such does not get included.
    
    If we call count_nodes on the AST, the result will be the number of nodes 
    in the AST minus the number of nodes in the AST's varDecl.
    
    node - The head node of the AST
    fn   - A function that will be applied to every node in the AST.
    """
    fn(node, level)
    
    # If the current node has a list, then the elements of the list
    # will be of type jsparser.Node. Traverse all of them.
    if len(node) != 0:
        for elem in node:
            traverse_AST_level(elem, fn, level+1)
    
    # Regardless of whether it has a list, it might contain a 
    # body or expression attribute. Try to look for them also.
    for key in node.__dict__.keys():
        attr = getattr(node, str(key))
        
        # Special handling for looping statements, otherwise it 
        # will recurse infinitely (especially the CONTINUE statement)
        if key == "target":
            continue
        
        if type(attr) == jsparser.Node:
            traverse_AST_level(attr, fn, level+1)

class Frame(object):
    
    new_id = 0
    
    def __init__(self, name="global", parentFrame=None):
        self.name = name
        
        self.id = Frame.new_id
        Frame.new_id += 1
        
        self.parentFrame = parentFrame
        self.varDecls = list()
        self.childrenFrames = list()
    
    def add_variable(self, var):
        self.varDecls.append(var)
    
    def __str__(self):
        result = ""
        
        result += "<<"
        result += self.name + "(" + str(self.id) + ")" + ", "
        result += (self.parentFrame.name if self.parentFrame is not None else "None") + ", "
        result += str(self.varDecls) + ", "
        
        result += "[\n\t"
        for frame in self.childrenFrames:
            result += str(frame)
            result += ", "
            result += "\n"
        result += "]"
        result += ">>"
        
        return result

class Variable(object):
    def __init__(self, var_node):
        self.identifier = var_node[0].value
        self.value = var_node[0].initializer.value
        self.node = var_node

    def __str__(self):
        return "{0}:{1}".format(self.identifier, self.value)
    
    def set_identifier(self, new_identifier):
        self.identifier = new_identifier
        self.node[0].value = new_identifier
        self.node[0].name = new_identifier
    
    __repr__ = __str__

def get_all_variables(ast):
    # Closure trick in Python 2.7
    class Namespace(object): pass
    ns = Namespace()
    ns.frame = Frame()
    ns.current_frame = ns.frame
    ns.current_level = 1
    
    
    def is_variable_node(node):
        if getattr(node, "type", None) is not None and node.type == "VAR":
            return True
        return False
    
    def is_function_node(node):
        if getattr(node, "type", None) is not None and node.type == "FUNCTION":
            return True
        return False
    
    def get_variable(node, level):
        if is_function_node(node):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            
            # TEMPORARY LAMBDA HANDLING
            # NEED TO CONSULT WITH PRATEEK
            new_frame = Frame((node.name if getattr(node, "name", None) is not None else "lambda"), ns.current_frame)
            ns.current_frame.childrenFrames.append(new_frame)
            ns.current_frame = new_frame
            
            ns.current_level += 2
            
        if is_variable_node(node):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            
            var = Variable(node)
            print("Before add variable: ", ns.current_frame)
            ns.current_frame.add_variable(var)
    
    traverse_AST_level(ast, get_variable)
    return ns.frame

def traverse_frames(frame, fn):
    fn(frame)
    
    for childrenFrame in frame.childrenFrames:
        traverse_frames(childrenFrame, fn)
    
    return

def alphaRename(frame):
    """
    Executes the alpha-renaming (or alpha-conversion) process on
    the AST and the scope tree.
    
    var assignment statements are assignment statements that use the 
    var keyword. 
    
    To alpha-rename:
    1)  For all var assignment statements, change the left operand 
        to a unique identifier (oldname_frameID). Do this for all 
        assignment statements of this type.
    2)  For all var assignment statements, evaluate the right operand
        through the scope tree.
    3)  For all other assignment statements, evaluate the left operand
        through the scope tree.
    4)  For all other assignment statements, evaluate the left operand
        through the scope tree.
    """
    
    # Phase 1: Rename the left operands of assignment statements
    #          containing the var keyword.
    def rename_identifier_var(frame):
        if type(frame) == Frame:
            for var in frame.varDecls:
                var.set_identifier(var.identifier + "_" + str(frame.id))
    
    traverse_frames(frame, rename_identifier_var)
    
    # Phase 2: Rename the right operands of assignment statements
    #          containing the var keyword
    def evaluate_operand_var(frame):
        pass
    return frame
                

@main
def run(*args):
    ast_out = open("ast_out_newTest2.txt", "w")
    ast = create_AST("C:\\PythonProjects\\ExtensionAnalyzer\\src\\newTest2.js")
    
    fr = get_all_variables(ast)
    fr = alphaRename(fr)
    print(fr)
    ast_out.write(str(ast))