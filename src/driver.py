import analyzer
import alpharenamer
import pynarcissus.jsparser
import pynarcissus.sexp
from ucb import main

from pygraph.classes.digraph import digraph
from pygraph.readwrite.dot import write

def generate_nodes(frame):
    node_list = []
    
    def helper(frame):
        if type(frame) == alpharenamer.Frame:
            node_list.append(frame.name)
    alpharenamer.traverse_frames(frame, helper)
    return node_list

def generate_edges(frame):
    call_tuple_list = []
    
    def helper(frame):
        if type(frame) == alpharenamer.Frame:
            for call in frame.callList:
                call_tuple = (frame.name, call.name)
                call_tuple_list.append(call_tuple)
    alpharenamer.traverse_frames(frame, helper)
    return call_tuple_list

def create_call_graph(node_list, edge_list):
    call_graph = digraph()
    
    call_graph.add_nodes(node_list)
    
    for edge in edge_list:
        call_graph.add_edge(edge)
    
    return call_graph

@main
def run(*args):
    # Open and Create AST
    ast = analyzer.create_AST("C:\\PythonProjects\\ExtensionAnalyzer\\src\\tests\\newTest2.js")
    
    # Create Frame object and execute alpha-rename
    fr = alpharenamer.create_frames(ast)
    fr = alpharenamer.alpha_rename(fr, ast)
#    print(fr)

    # Create Call Graph and DOT Format
    call_gr = create_call_graph(generate_nodes(fr), generate_edges(fr))
    dot = write(call_gr)
    print(dot)
    
#    # Write AST representation to file
#    ast_out = open("ast_out_newTest2.txt", "w")
#    ast_out.write(str(ast))
    
#    # Print source code
#    source = pynarcissus.sexp.convert(ast)
#    print(source)
    
#@main
#def run(*args):
#    import doctest
#    doctest.testmod(verbose=True)

#@main
#def run(*args):
#    gr = graph()
#    
#    gr.add_nodes(["A", "B", "C", "D"])
#    
#    gr.add_edge(("A", "B"))
#    gr.add_edge(("C", "D"))
#    
#    dot = write(gr)
#    print(dot)