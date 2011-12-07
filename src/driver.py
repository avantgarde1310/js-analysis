import fileutils
import analyzer
import alpharenamer
import pynarcissus.jsparser
import pynarcissus.sexp
from ucb import main

from pygraph.classes.digraph import digraph
from pygraph.readwrite.dot import write

def generate_nodes_edges(frame):
    node_list = []
    
    def generate_node_helper(frame):
        node_list.append(frame.name)
    alpharenamer.traverse_frames(frame, generate_node_helper)

    call_tuple_list = []
    
    def generate_edges_helper(frame):
        for call in frame.callList:
            if call.name not in node_list:
                node_list.append(call.name)
            call_tuple = (frame.name, call.name)
            call_tuple_list.append(call_tuple)
    alpharenamer.traverse_frames(frame, generate_edges_helper)
    
    return (node_list, call_tuple_list)

def create_call_graph(node_list, edge_list):
    call_graph = digraph()
    
    call_graph.add_nodes(node_list)
    
    for edge in edge_list:
        call_graph.add_edge(edge)
    
    return call_graph

def isunknown(name):
    return name.endswith("?")

def clean_call_list(frame):
    for call in frame.callList[:]:
        if isunknown(call.name):
            frame.callList.remove(call)

def count_lambda(frame):
    count = [0]
    def count_lambda_helper(frame):
        if frame.islambda:
            count[0] += 1
    alpharenamer.traverse_frames(frame, count_lambda_helper)
    return count[0]

def count_chrome_reference(frame):
    count = [0]
    def count_chrome_reference_helper(frame):
        if frame.calls_chrome:
            count[0] += 1
    alpharenamer.traverse_frames(frame, count_chrome_reference_helper)
    return count[0]

#def trace(node, level):
#    print("# " * level + node.type + " " + getattr(node, "name", "None") + " " + str(getattr(node, "value", "None")))

@main
def run(*args):
#    """ Open and Create AST """
#    test_path = 'C:\\PythonProjects\\ExtensionAnalyzer\\src\\tests\\'
#    file = 'adblock.js'
#    ast = analyzer.create_AST(test_path + file)
    
    """ Open and Create AST from Extension """
    print "Combining extension .js files...",
    ext_path = 'C:\PythonProjects\\ExtensionAnalyzer\\Extensions\\'
    ext = 'oadboiipflhobonjjffjbfekfjcgkhco'
    file_list = fileutils.get_all_javascript_files_absolute(ext_path + ext)
    js_string = ""
    for filename in file_list:
        js_string += open(filename).read() + "\n\n\n"
    print "OK"
    
    print "Creating AST...",
    ast = analyzer.create_AST_from_string(js_string)
    print "OK"
    
    """ For AST debugging """
#    alpharenamer.traverse_AST_level(ast, trace, None)

    """ Create Frame object and execute alpha-rename """
    print "Creating frames...",
    fr = alpharenamer.create_frames(ast)
#    print("----BEFORE RENAME----")
#    print(fr)
    print "OK"
    print "Alpha-renaming...",
    fr = alpharenamer.alpha_rename(fr, ast)
#    print("----AFTER RENAME----")
#    print(fr)
    print "OK"

    """ Clean Call List """
##    print("----AFTER CLEANING----")
    print "Cleaning call list of frames...",
    alpharenamer.traverse_frames(fr, clean_call_list)
##    print(fr)
    print "OK"

    """ ------------------- OUTPUT PHASE ------------------- """
    
    out_path = "C:\\PythonProjects\\ExtensionAnalyzer\\results\\"
    
    """ Create Call Graph and DOT Format """
    print "Writing DOT file... ",
    call_gr = create_call_graph(*generate_nodes_edges(fr))
    dot_file = open(out_path + ext + "_dot.txt", "w")
    dot = write(call_gr)
    dot_file.write(dot)
    print "OK"
    
#    """ Write AST representation to file """
#    ast_out = open("ast_out_newTest2.txt", "w")
#    ast_out.write(str(ast))
    
    """ Print source code """
    print "Writing source code... ",
    try:
        source_out = open(out_path + ext + "_src_renamed.txt", "w")
        source = pynarcissus.sexp.convert(ast)
        source_out.write(source)
        print "OK"
    except Exception, e:
        print "An error occurred while writing the renamed source code."
    
    """ Generate log file """
    print "Generating log file..."
    log_string = ""
    log_string += "Extension " + ext + "\n"
    
    fn_count = fr.new_id
    lambda_count = count_lambda(fr)
    chrome_count = count_chrome_reference(fr)
    log_string += "Number of functions: " + str(fn_count) + "\n"
    log_string += "Number of anonymous functions: " + str(lambda_count) + "\n"
    log_string += "Number of named functions: " + str(fn_count - lambda_count) + "\n"
    log_string += "Number of functions that reference chrome: " + str(chrome_count) + "\n"
    
    print(log_string)
    log_file = open(out_path + ext + "_log.txt", "w")
    log_file.write(log_string)
    print "Generation of log file OK"
    print "Program successfully completed"