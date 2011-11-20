# Written in Python 2
# Ivan Gozali

import jsparser
import os
import sys
import inspect

# def parse(source, filename=None, starting_line_number=1)

# -------------- Other Utility Functions -----------------------

# Credits to John DeNero, CS61A Fall 2011 Instructor @ UC Berkeley
def main(fn):
    """Call fn with command line arguments.  Used as a decorator.

    The main decorator marks the function that starts a program. For example,
    
    @main
    def my_run_function():
        # function body
    
    Use this instead of the typical __name__ == "__main__" predicate.
    """
    if inspect.stack()[1][0].f_locals['__name__'] == '__main__':
        args = sys.argv[1:] # Discard the script name from command line
        fn(*args) # Call the main function

# -------------- Functions to work with files -------------------

def get_directory_tree(dir):
    """
    Returns a generator object containing the directory tree. 
    
    A directory tree is a sequence of 3-tuples, where each 3-tuple contains:
    - dirpath:   the absolute directory path of all the directories and 
                 subdirectories in dir
    - dirnames:  a list of relative subdirectories in the current dirpath
    - filenames: a list of relative filenames in the current dirpath
    
    dir - absolute directory path from which the directory tree object
          is to be obtained
    """
    
    return os.walk(dir)

def get_current_directory_tree():
    """
    Returns a generator object containing the current directory tree.
    
    A directory tree is a sequence of 3-tuples, where each 3-tuple contains:
    - dirpath:   the absolute directory path of all the directories and 
                 subdirectories in dir
    - dirnames:  a list of relative subdirectories in the current dirpath
    - filenames: a list of relative filenames in the current dirpath
    """
    return get_directory_tree(os.getcwd())

def print_directory_tree(dir_tree):
    """
    Prints a visual representation of the directory tree object returned
    by get_directory_tree (i.e. returned by os.walk()).
    
    dir_tree - generator object containing the directory tree
    """
    # NOT IMPLEMENTED YET
    return None

def is_file_type(filename, extension):
    """
    Checks whether a file is of a certain file type (by checking its
    extension). For example, to check whether file is JavaScript, 
    pass in the filename and extension will be ".js". Returns True/False.
    
    filename - the absolute/relative path to the file
    extension - a string specifying the extension of the file
    """
    file = str(filename)
    if extension == file[len(file)-len(extension):]:
        return True
    else:
        return False

def is_javascript_file(filename):
    return is_file_type(filename, ".js")

def get_chrome_extensions_path():
    chrome_path = "C:\Users\\" + os.getenv("USERNAME") + "\\AppData\\Local\\Google\\Chrome\\User Data\\Default\\Extensions"
    
    if os.path.exists(chrome_path):
        return chrome_path
    else:
        return "Directory does not exist."
    
def print_all_javascript_files_in_current_directory():
    dir_tree = get_current_directory_tree()
    
    for dirpath, dirnames, filenames in dir_tree:
        print("Current directory: {0}".format(dirpath))
        for i, file in enumerate(filenames):
            if is_javascript_file(file):
                print("File {0} : {1}".format(i, file))
        print("------------------------------------")

def get_all_javascript_files_absolute(dir):
    """
    Returns a list of absolute paths to JavaScript files.
    
    dir - absolute path to the directory to be analyzed
    """
    
    dir_tree = get_directory_tree(dir)
    js_list = []
    
    for dirpath, dirnames, filenames in dir_tree:
        for file in filenames:
            if is_javascript_file(file):
                js_list.append(str(os.path.join(dirpath, file)))
    
    return js_list
    
# -------------- Utilities to work with pynarcissus' Abstract Syntax Tree --------------------

class FunctionContainer(object):
    """
    This class is a container for the AST nodes whose type is FUNCTION.
    FunctionContainers have two important properties:
        1. They contain the function name
        2. They have, as a property, a list that contains all the call
           statements in the function.
    
    When an instance of a FunctionContainer is printed, it will print the 
    name and all the calls to Chrome API.
    """
    def __init__(self, name, node):
        self.name = name
        self.node = node
        self.call_list = self.get_call_statements(self.node)
        self.chrome_call_list = self.get_chrome_call_list()
    
    def get_call_statements(self, node):
        def is_call_node(node):
            if getattr(node, 'type', None) is not None:
                if node.type == 'CALL':
                    return True
            return False
            
        call_list = []
        
        def append_call_node(node):
            if is_call_node(node):
                call_list.append(node)
                
        traverse_AST(node, append_call_node)
        return call_list

    def get_chrome_call_list(self):
        chrome_calls = []
        for call in self.call_list:
            if "chrome" == call.getSource()[0:6]:
                chrome_calls.append(call)
        return chrome_calls
    
    def __str__(self):
        string = ""
        string += "Function " + self.name + "\n"
        if len(self.chrome_call_list) == 0:
            string += "---- No calls to Chrome API found in this function \n"
            return string
        for call in self.chrome_call_list:
            string += "---- " + call.getSource() + " at line " + str(call.lineno) + "\n"
        return string
    
class GlobalContainer(object):
    def __init__(self, node):
        self.node = node
        self.call_list = self.get_call_list()
        self.chrome_call_list = self.get_chrome_call_list()
    
    def get_elem_list(self):
        elements = []
        for elem in self.node:
            if elem.type != "FUNCTION":
                elements.append(elem)
        return elements
    
    def get_call_statements(self, node):
        def is_call_node(node):
            if getattr(node, 'type', None) is not None:
                if node.type == 'CALL':
                    return True
            return False
            
        call_list = []
        
        def append_call_node(node):
            if is_call_node(node):
                call_list.append(node)
                
        traverse_AST(node, append_call_node)
        return call_list
    
    def get_call_list(self):
        calls = []
        for elem in self.get_elem_list():
            calls.extend(self.get_call_statements(elem))
        return calls

    def get_chrome_call_list(self):
        chrome_calls = []
        for call in self.get_call_list():
            if "chrome" == call.getSource()[0:6]:
                chrome_calls.append(call)
        return chrome_calls
    
    def __str__(self):
        string = ""
        string += "Global Frame \n"
        if len(self.chrome_call_list) == 0:
            string += "---- No calls to Chrome API found in the global frame \n"
            return string
        for call in self.chrome_call_list:
            string += "---- " + call.getSource() + " at line " + str(call.lineno) + "\n"
        return string
    
        
def get_all_functions_in_global(ast):
    """
    Return a list of FunctionContainers nodes which are in 
    the global frame of js file.
    
    ast - the AST generated by pynarcissus' parse() function
    """
    # If ast is in global, then this ast will be of type "SCRIPT"
    # and will contain funDecls attribute.
    functions = []
    for function in ast.funDecls:
        functions.append(FunctionContainer(function.name, function))
    return functions

def create_AST(js_path):
    """
    Returns the AST corresponding to the JavaScript file specified as js_path.
    js_path can be relative or absolute.
    """
    
    if os.path.exists(js_path):
        if os.path.isabs(js_path):
            js_file = os.path.split(js_path)[1]
        else:
            js_file = js_path
    else:
        return "File does not exist."
    
    if is_javascript_file(js_file):
        return jsparser.parse(open(js_path, "r").read(), js_file)
    
# traverse_AST done. Need to check for missed nodes, though.
def traverse_AST(node, fn):
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
    #fn(node)
    
    # If the current node has a list, then the elements of the list
    # will be of type jsparser.Node. Traverse all of them.
    if len(node) != 0:
        for elem in node:
            traverse_AST(elem, fn)
    
    # Regardless of whether it has a list, it might contain a 
    # body or expression attribute. Try to look for them also.
    for key in node.__dict__.keys():
        attr = getattr(node, str(key))

        # Special handling for looping statements, otherwise it 
        # will recurse infinitely (especially the CONTINUE statement)
        if key == "target":
            continue
        
        if type(attr) == jsparser.Node:
            traverse_AST(attr, fn)

def get_node_count(ast):
    count = {'val':0}
    def count_nodes(node):
        print(node.type)
        count['val'] += 1
    traverse_AST(ast, count_nodes)
    return count['val']

@main
def begin(*args):
    """
    Launches the analyzer with the following specifications.
    
    Usage:
    
    
    """
    # Test Path Test Case
#    test_path = "C:\\PythonProjects\\ExtensionAnalyzer\\src\\test.js"    
#    ast = create_AST(test_path)
#    print("Count: {0}".format(get_node_count(ast)))
#    f = open("output.txt", "w")
#    f.write(str(ast))
    
#    glob = GlobalContainer(ast)
#    def p(x):
#        print(x.lineno)
#        print(x.type)
        
#    traverse_AST(ast, p)
#    fn_list = get_all_functions_in_global(ast)
    
#    for f in fn_list:
#        print(f)
    
    # Chrome Path Test Case
    
#    chrome_path = get_chrome_extensions_path()
#    extension_path = os.path.join(chrome_path, "gighmmpiobklfepjocnamgkkbiglidom")
    extension_path = '/home/devdatta/.config/chromium/Default/Extensions/gighmmpiobklfepjocnamgkkbiglidom'
    js_list = get_all_javascript_files_absolute(extension_path)
    
    total = 0
    
    print("Current extension directory: {0}".format(extension_path))
    for js in js_list:
        ast = create_AST(js)
        print("JavaScript file: {0}".format(os.path.split(js)[1]))
        
        # Print information about the global frame
        glob = GlobalContainer(ast)
        print(glob)
        total += len(glob.chrome_call_list)
        
        # Print information about all functions
        fn_list = get_all_functions_in_global(ast)
        for f in fn_list:
            print(f)
            total += len(f.chrome_call_list)
    
    print("Total Chrome calls found: " + str(total))
