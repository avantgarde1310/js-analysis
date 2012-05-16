import fileutils
import alpharenamer
import astutils
import pynarcissus.jsparser
import pynarcissus.sexp

import os
import argparse

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

def get_extension_name(path):
    try:
        print "Trying to find name in manifest.json... ",
        for dirpath, dirnames, filenames in fileutils.get_directory_tree(path):
            for filename in filenames:
                if filename == "manifest.json":
                    tempstr = open(dirpath + os.sep + filename).read()
                    tempstr = tempstr[tempstr.index("\"name\""):]
                    tempstr = tempstr[:tempstr.index("\n")]
                    tempstr = tempstr[9:-2]
                    if "__MSG" not in tempstr:
                        print "OK"
                        return tempstr
                    else:
                        print "Extension name not found in manifest.json"
                        raise Exception(tempstr)
    # __MSG_name__
    except Exception, e:
        tag = e[0][6:-2]
        print "Trying _locales" + os.sep + "en folder...",
        for dirpath, dirnames, filenames in fileutils.get_directory_tree(path):
            if dirpath.endswith("_locales" + os.sep + "en") and "__MACOSX" not in dirpath:
                tempstr = open(dirpath + os.sep + "messages.json").read()
                tempstr = tempstr[tempstr.index("\"" + tag + "\": {\n      "):]
                tempstr = tempstr[:tempstr.index("}")]
                tempstr = tempstr[tempstr.index("\"message\""):]
                tempstr = tempstr[:tempstr.index("\n")]
                tempstr = tempstr[12:-1]
                print "OK"
                return tempstr
        print "Name not found."
        return None
    
@main
def run(*args):
    parser = argparse.ArgumentParser(prog="jsAnalyzer Driver", description="a driver for jsAnalyzer")
    
    parser.add_argument("filepath", action="store", help="the path to JavaScript file or the file itself")
    parser.add_argument("-o", action="store", dest="outputpath", help="output path (not the file!)")
    parser.add_argument("-e", action="store_true", default=False, dest="isextension", help="set if filepath is a path to an extension")
    
    results = parser.parse_args()

    filepath = results.filepath
    if results.outputpath:
        outputpath = results.outputpath
        if not os.path.exists(outputpath):
            os.mkdir(outputpath)
    isextension = results.isextension

    if isextension:
        ext_path = filepath
        ext = ext_path.split(os.sep)[-1]
        out_path = outputpath

    import os
    print "Ext Path: ", ext_path, " Exists:", os.path.exists(ext_path)
    print "Ext: ", ext, " Exists:", os.path.exists(ext_path + "\\" + ext)
    print "Out Path: ", out_path, " Exists:", os.path.exists(out_path)
    
    """ Open and Create AST from Extension """
    print "\n-----------------JavaScript Static Analyzer 1.0-----------------"
#    ext_path = 'C:\\PythonProjects\\ExtensionAnalyzer\\Extensions\\CSPfied'
#    ext = 'aapbdbdomjkkjkaonfhkkikfgjllcleb'
    
    try:
        ext_name = get_extension_name(ext_path + "\\" + ext)
        if ext_name is None:
            raise Exception()
    except:
        ext_name = "Unknown"
    print(ext_name)
    
    print "Combining extension .js files...",
    js_string = fileutils.combine_js_files(ext_path + "\\" + ext)
    print "OK"
    
    print "Creating AST...",
    ast = astutils.create_AST_from_string(js_string)
    print "OK"
    
    """ Create Frame object and execute alpha-rename """
    print "Creating frames...",
    fr = alpharenamer.create_frames(ast)
    print "OK"
    
    print "Alpha-renaming...",
    fr = alpharenamer.alpha_rename(fr, ast)
    print "OK"

    """ Clean Call List """
    print "Cleaning call list of frames...",
    alpharenamer.traverse_frames(fr, clean_call_list)
    print "OK"

    """ ------------------- OUTPUT PHASE ------------------- """
#    out_path = "C:\\PythonProjects\\ExtensionAnalyzer\\newresults"
    
    """ Create Call Graph and DOT Format """
    print "Writing DOT file... ",
    # node_list : list of all the function calls in the source
    # edge_list : list of tuples denoting edges between calls
    node_list, edge_list = generate_nodes_edges(fr)
    call_gr = create_call_graph(node_list, edge_list)
    dot_file = open(out_path + "\\" + ext + "_dot.txt", "w")
    dot = write(call_gr)
    dot_file.write(dot)
    print "OK"
    
    """ Create Separate Chrome API Calls """
    print "Writing Unique Chrome API Calls...",
    chromecalls_file = dot_file = open(out_path + "\\" + ext + "_chromecalls.txt", "w")
    chrome_call_str = ""
    for chromecall in node_list:
        if "chrome" in chromecall and chromecall not in chrome_call_str:
            chrome_call_str += chromecall + "\n"
    chromecalls_file.write(chrome_call_str)
    print "OK"
    
#    """ Write AST representation to file """
#    ast_out = open("ast_out_newTest2.txt", "w")
#    ast_out.write(str(ast))
    
    """ Print Source Code """
    print "Writing source code... ",
    try:
        source_out = open(out_path + "\\" + ext + "_src_renamed.txt", "w")
        source = pynarcissus.sexp.convert(ast)
        source_out.write(source)
        print "OK"
    except Exception, e:
        print "An error occurred while writing the renamed source code."
    
    """ Generate log file """
    print "Generating log file..."
    log_string = ""
    log_string += "Extension Name: " + ext_name + "\n"
    log_string += "Extension Identifier: " + ext + "\n"
    
    fn_count = fr.new_id
    lambda_count = count_lambda(fr)
    chrome_count = count_chrome_reference(fr)
    log_string += "Number of functions: " + str(fn_count) + "\n"
    log_string += "Number of anonymous functions: " + str(lambda_count) + "\n"
    log_string += "Number of named functions: " + str(fn_count - lambda_count) + "\n"
    log_string += "Number of functions that reference chrome: " + str(chrome_count) + "\n"
    
    print(log_string)
    log_file = open(out_path + "\\" + ext + "_log.txt", "w")
    log_file.write(log_string)
    print "Generation of log file OK"
    print "Program successfully completed"
