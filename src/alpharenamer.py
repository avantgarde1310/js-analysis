'''
Created on Nov 2, 2011

@author: Ivan Gozali
'''

from analyzer import main, create_AST
import jsparser
import sexp

DEBUGGING = False
SEPARATOR = '_R_'
FUNCSEP   = '_F_'

def debugprint(str=""):
    global DEBUGGING
    if DEBUGGING:
        print(str)

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
    """ Represents a frame in JavaScript. A frame could be the global
    scope, or a function scope. The frame network is represented as a
    tree, where each node has a reference to its parentFrame, and the 
    corresponding function. 
    
    The frame object contains the following information:
    name         - string representing the name. can be "global" or 
                   the name of the function represented by this frame.
    id           - a unique integer representing this frame. used for
                   renaming
    parentFrame  - reference to its parent frame
    function     - reference to the function node in the AST
    varDecls     - a list that contains Variable objects in the scope
    callList     - a list of all unique function calls in the scope
    identifierList - a list of all identifiers to be renamed in the frame
    childrenFrames - a list that contains children Frame objects 
    """
    new_id = 0
    
    def __init__(self, name="global", parentFrame=None, function=None):
        self.name = name
        
        self.id = Frame.new_id
        Frame.new_id += 1
        
        self.parentFrame = parentFrame
        self.function = function
        
        self.varDecls = list()
        self.callList = list()
        self.identifierList = list()
        self.childrenFrames = list()
        
        # Inserting renamed variables to frame's varDecls
        if function is not None and function.params != []:
            for var_name in function.params:
                self.varDecls.append(FormalParam(var_name, function.params))
    
    def add_variable(self, var):
        """Adds a Variable object to the current frame's varDecls
        
        var - A Variable object
        """
        self.varDecls.append(var)
    
    def add_call(self, call):
        self.callList.append(call)
    
    def add_identifier(self, identifier):
        self.identifierList.append(identifier)
    
    def lookup_variable(self, identifier):
        """Attempts to find a variable in the current frame. If 
        not found, will try to keep looking at the parentFrame 
        until it finds one, then returns the renamed identifier.
        If it reaches the global frame without finding the variable,
        return None.
        
        identifier - the identifier to find in the current frame
        """
        identifier_to_find = get_real_identifier(identifier)
        frame_ptr = self
        while frame_ptr is not None:
            var_list = [get_real_identifier(var.identifier) for var in frame_ptr.varDecls]
            debugprint(frame_ptr)
            debugprint(var_list)
            if identifier_to_find in var_list:
                return frame_ptr.varDecls[var_list.index(identifier_to_find)].identifier
            else:
                frame_ptr = frame_ptr.parentFrame
        
        return None
    
    def lookup_function(self, function_name):
        function_to_find = get_real_function_name(function_name)
        frame_ptr = self
        while frame_ptr is not None:
            function_list = [get_real_function_name(frame.name) for frame in frame_ptr.childrenFrames]

            if function_to_find in function_list:
                return frame_ptr.childrenFrames[function_list.index(function_to_find)].name
            else:
                frame_ptr = frame_ptr.parentFrame
        
        return None
    
    def set_name(self, new_name):
        self.name = new_name
        if self.function:
            self.function.name = new_name
        
    def get_global_frame(self):
        """ Call this method on any frame to get the top-most frame,
        a.k.a. the global frame.
        
        >>> frame = Frame()
        >>> frame1 = Frame("frame1", frame)
        >>> frame2 = Frame("frame2", frame1)
        >>> frame3 = Frame("frame3", frame)
        >>> frame3.get_global_frame().name
        'global'
        >>> frame2.get_global_frame().name
        'global'
        """
        
        frame_ptr = self
        while frame_ptr.parentFrame is not None:
            frame_ptr = frame_ptr.parentFrame
        return frame_ptr
    
    def __str__(self):
        result = ""
        
        result += "<<"
        result += self.name + "(" + str(self.id) + ")" + ", "
        result += (self.parentFrame.name if self.parentFrame is not None else "None") + ", "
        result += str(self.varDecls) + ", "
        result += str(self.callList) + ", "
        result += str(self.identifierList) + ", "
        
        result += "[\n\t"
        for frame in self.childrenFrames:
            result += str(frame)
            result += ", "
            result += "\n"
        result += "]"
        result += ">>"
        
        return result

def get_real_identifier(identifier):
    """ Returns the real identifier of a renamed identifier. 
    If the identifier passed in is already real, then return itself
    
    The format of a renamed identifier is:
        <REAL_IDENTIFIER><SEPARATOR><FRAME_ID>
    Where separator is defined in this module as a global variable
    
    Examples:
        a_R_0
        chrome_R_1
    
    >>> get_real_identifier('a_R_0')
    'a'
    >>> get_real_identifier('chrome_R_27')
    'chrome'
    >>> get_real_identifier('foo')
    'foo'
    """
    global SEPARATOR
    if SEPARATOR in identifier:
        return identifier[:identifier.index(SEPARATOR)]
    return identifier

def get_real_function_name(name):
    global FUNCSEP
    if FUNCSEP in name:
        return name[:name.index(FUNCSEP)]
    return name

def isrenamed(name):
    return FUNCSEP in name or SEPARATOR in name

class Call(object):
    """ Represents a call statement in JavaScript """
    def __init__(self, node):
        self.name = node[0].value
        self.node = node
    
    def set_name(self, new_name):
        self.name = new_name
        self.node[0].value = new_name
    
    def __str__(self):
        return str(self.name)
    __repr__ = __str__
    
class Variable(object):
    """
    Represents a generic variable container. It has an identifier and a
    value.
    
    """
    def __init__(self, identifier, value):
        self.identifier = identifier
        self.value = value

    def __str__(self):
        return "{0}:{1}".format(self.identifier, self.value)
    __repr__ = __str__
    
    def set_identifier(self, new_identifier):
        self.identifier = new_identifier
    
    def set_value(self, new_value):
        self.value = new_value
        
class VarAssign(Variable):
    """
    Represents a variable assignment statement in JavaScript preceded by
    the var keyword. For example:
        var a = 5;
    
    This object also keeps track of its node in the AST.
    
    TODO: The current implementation doesn't support variable assignment
          statements of this form (that contains dot operators):
              var b = c.attr;
              var c = $(selector.attribute);
    """
    def __init__(self, var_node):
        try:
            init_val = var_node[0].initializer.value
        except AttributeError, err:
            init_val = "undefined"
            
        Variable.__init__(self, var_node[0].value, init_val)
        self.node = var_node
    
    def set_identifier(self, new_identifier):
        Variable.set_identifier(self, new_identifier)
        self.node[0].value = new_identifier
        self.node[0].name = new_identifier
    
    def set_value(self, new_value):
        Variable.set_value(self, new_value)
        self.node[0].initializer.value = new_value
        
    __repr__ = Variable.__str__

class FormalParam(Variable):
    def __init__(self, identifier, param_list):
        Variable.__init__(self, identifier, "__fparam__")
        self.param_list = param_list
    
    def set_identifier(self, new_identifier):
        old_identifier = self.identifier    
        index = self.param_list.index(old_identifier)

        Variable.set_identifier(self, new_identifier)
        self.param_list[index] = new_identifier
    
    def set_value(self, new_value):
        pass

class Identifier(object):
    """ Represents an identifier in JavaScript. An Identifier object
    knows its own name, its AST node and in which frame its located.
    """
    
    def __init__(self, node):
        self.name = node.value
        self.node = node
    
    def __str__(self):
        return self.name
    __repr__ = __str__
    
    def set_name(self, new_name):
        self.name = new_name
        self.node.value = new_name

def create_frames(ast):
    # Closure trick in Python 2.7
    class Namespace(object): pass
    ns = Namespace()
    ns.frame = Frame()
    ns.current_frame = ns.frame
    ns.current_level = 1
    
    def is_node_type(node, type):
        if getattr(node, "type", None) == type:
            return True
        return False
    
    def create_frames_helper(node, level):
        if is_node_type(node, "FUNCTION"):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            
            # Frame Creation
            # TODO: Temporary lambda handling
            new_name = node.name if getattr(node, "name", None) is not None else "lambda"
            parent_frame = ns.current_frame
            function = node
            
            new_frame = Frame(new_name, parent_frame, function)
            ns.current_frame.childrenFrames.append(new_frame)
            # End Frame Creation
            
            # Update current_frame and go into deeper level.
            ns.current_frame = new_frame
            
            ns.current_level += 2
            
        if is_node_type(node, "VAR"):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            
            var = VarAssign(node)
            # debugprint("Before add variable: ", ns.current_frame)
            ns.current_frame.add_variable(var)
        
        # TODO: Put identifiers in a list inside the corresponding frame.
        if is_node_type(node, "IDENTIFIER"):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            # TODO: Need to filter out renamed identifiers.
            # Question: Do we put identifiers here during frame creation, 
            # or after we rename everything?
            identifier = Identifier(node)
            ns.current_frame.add_identifier(identifier)
        
        if is_node_type(node, "CALL"):
            if ns.current_level > level:
                level_difference = ns.current_level - level
                for _ in range(level_difference // 2):
                    ns.current_frame = ns.current_frame.parentFrame
                
                ns.current_level = level
            
            call = Call(node)
            ns.current_frame.add_call(call)
            
        
    traverse_AST_level(ast, create_frames_helper)
    return ns.frame

def traverse_frames(frame, fn):
    fn(frame)
    
    for childrenFrame in frame.childrenFrames:
        traverse_frames(childrenFrame, fn)
    
    return

def alpha_rename(frame):
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
    
    # TODO: Handle infix expressions.
    # TODO: Need to evaluate identifiers that are not part of assignment
    #       statements
    
    # Phase 1: Rename the left operands of assignment statements
    #          containing the var keyword.
    def rename_identifier_var(frame):
        global SEPARATOR
        if type(frame) == Frame:
            for var in frame.varDecls:
                new_identifier = var.identifier + SEPARATOR + str(frame.id)
                debugprint("Renaming variable " + var.identifier + " to " + new_identifier)
                var.set_identifier(new_identifier)
    
    debugprint("Phase 1")
    traverse_frames(frame, rename_identifier_var)
    
    # Phase 2: Rename all functions
    def rename_function(frame):
        global FUNCSEP
        if type(frame) == Frame:
            new_name = frame.name + FUNCSEP + str(frame.id)
            frame.set_name(new_name)
    
    traverse_frames(frame, rename_function)
    
    # Phase 3: Rename the right operands of assignment statements
    #          containing the var keyword
    def evaluate_operand_var(frame):
        if type(frame) == Frame:
            for var in frame.varDecls:
                value = var.value
                
                if isprimitive(value):
                    debugprint("Value {0} is primitive, skipping.".format(value))
                    continue
                
                debugprint("Renaming {0}".format(value))
                new_value = frame.lookup_variable(value)
                debugprint("Lookup variable successful. {0}".format(new_value))
                var.set_value(new_value if new_value is not None else "unknown")
    
    debugprint("Phase 3")
    traverse_frames(frame, evaluate_operand_var)
    
    # Phase 4: Rename calls
    def rename_calls(frame):
        if type(frame) == Frame:
            for call in frame.callList:
                name = call.name
                
                # TODO: Might want to add isprimitive
                
                new_name = frame.lookup_function(name)
                call.set_name(new_name if new_name is not None else "unknown")
    debugprint("Phase 4")
    traverse_frames(frame, rename_calls)
    
    # Phase 5: Rename unrenamed identifiers
                
    return frame
                
def isprimitive(token):
    """ Returns True if token is a primitive. 
    
    Update: So that this function recognizes formal parameters of
    a function, __fparam__ will be considered a primitive as
    well.
    
    >>> isprimitive('5')
    True
    >>> isprimitive(5)
    True
    >>> isprimitive(0)
    True
    >>> isprimitive('-4.43')
    True
    >>> isprimitive('false')
    True
    >>> isprimitive('lambda')
    False
    """
    primitive_list = ['true', 'false',
                      '__fparam__', 'undefined',
                      'document', 'console']
    if token in primitive_list:
        return True
    try:
        float(token)
        return True
    except ValueError, TypeError:
        return False

@main
def run(*args):
    ast_out = open("ast_out_newTest2.txt", "w")
    ast = create_AST("C:\\PythonProjects\\ExtensionAnalyzer\\src\\tests\\newTest2.js")
    
    fr = create_frames(ast)
    fr = alpha_rename(fr)
    debugprint()
    debugprint("Rename successful.")
    debugprint()
    print(fr)
    ast_out.write(str(ast))
    
    
    s = sexp.convert(ast)
    print(s)
    
#    import doctest
#    doctest.testmod(verbose=True)