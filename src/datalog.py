'''
Created on Mar 10, 2012

@author: Ivan Gozali
'''

from ucb import main as _main

import argparse
import os

import threeaddress
import astutils
import fileutils

def retrieve_three_address_list(global_fn):
    """ Concatenates all the three address lists that each function
    contains into one single list.
    
    global_fn  : (threeaddress.Function) function object returned from 
                 threeaddress.py
    
    output     : (list) containing threeaddress.ThreeAddress objects 
                 described in threeaddress.py
    """
    tac_list = []
    
    def retrieve_helper(fn):
        if not fn._three_address_list:
            fn.convert_to_three_address()
        for threeaddress in fn.three_address_list:
            tac_list.append(threeaddress)
    
    threeaddress.traverse_function(global_fn, retrieve_helper, None)
    
    return tac_list

def generate_datalog_facts(tac_list):
    """ Generate Datalog facts given a threeaddress.Function object 
    which holds all the three address codes of the module. 
    
    Information on threeaddress.ThreeAddress objects:
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
    
    [ASSIGNMENT] # Primitive assignment
    lhs  : (str) variable to be assigned the value
    rhs1 : (None)
    rhs2 : (str) operand
    op   : (None)
    
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
    
    tac_list   : (list) containing threeaddress.ThreeAddress objects
                 as returned by retrieve_three_address_list() in this
                 module
    
    output     : (list) containing (str)s of Datalog facts.
    """
    datalog_facts = []
    
    for tac in tac_list:
        fact = []
        
        if tac.statement_type == "LOAD":
            datalog_facts.append("load({0},{1},{2}).".format(tac.lhs, tac.rhs1, tac.rhs2))
        elif tac.statement_type == "STORE":
            datalog_facts.append("store({0},{1},{2}).".format(tac.lhs[0], tac.lhs[1], tac.rhs1))
            
        elif tac.statement_type == "ASSIGNMENT":
            datalog_facts.append("assign({0},{1}).".format(tac.lhs, tac.rhs2))
        
        elif tac.statement_type == "RETURN":
            datalog_facts.append("callRet({0}).".format(tac.rhs2))
            
        elif tac.statement_type == "FUNCTIONDECL":
            datalog_facts.append("ptsTo({0},d_{0}).".format(tac.lhs))
            datalog_facts.append("heapPtsTo(d_{0},prototype,p_{0}).".format(tac.lhs))
            datalog_facts.append("funcDecl(d_{0}).".format(tac.lhs))
            datalog_facts.append("prototype(p_{0},h_FP).".format(tac.lhs))
            datalog_facts.append("methodRet(d_{0},{0}).".format(tac.lhs))
            for z, param in enumerate(tac.rhs2, start=1):
                datalog_facts.append("formal(d_{0},{1},{2}).".format(tac.lhs, z, param))
        else:
            fact = "datalog.py: statement_type:{0} not implemented".format(tac.statement_type)
    
    return datalog_facts
    
def generate_datalog_rules():
    rules_str = ""
    rules_str += "%% Basic Rules\n"
    rules_str += "ptsTo(v,h) :-\n        alloc(v,h).\n"
    rules_str += "ptsTo(v,h) :-\n        funcDecl(v,h).\n"
    rules_str += "ptsTo(v_1,h) :-\n        ptsTo(v_2,h),\n        assign(v_1, v_2).\n\n"
    
    rules_str += "directHeapStoresTo(h_1,f,h_2) :-\n        store(v_1,f,v_2),\n        ptsTo(v_1,h_1),\n        ptsTo(v_2,h_2).\n"
    rules_str += "directHeapPointsTo(h_1,f,h_2) :-\n        directHeapStoresTo(h_1,f,h_2).\n"
    rules_str += "ptsTo(v_2,h_2) :-\n        load(v_2,v_1,f),\n        ptsTo(v_1,h_1),\n        heapPtsTo(h_1,f,h_2).\n\n"
    
    rules_str += "heapPtsTo(h_1,f,h_2) :-\n        directHeapPointsTo(h_1,f,h_2).\n\n"
    
    # CALL NOT IMPLEMENTED
    rules_str += "%% Call graph\n"
    rules_str += "%% Call graph not implemented: need info on call site\n\n"
    
    rules_str += "%% Interprocedural assignments\n"
    rules_str += "%% Interprocedural assignments not implemented: need info on call site.\n\n"
    
    rules_str += "%% Prototype handling\n"
    rules_str += "heapPtsTo(h_1,f,h_2) :-\n        prototype(h_1,h),\n        heapPtsTo(h,f,h_2).\n"
    
    return rules_str

@_main
def main(*args):
    parser = argparse.ArgumentParser(prog="Datalog Facts Generator", description="datalog.py test module")
    
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
    
    global_fn = threeaddress.analyze_three_address(ast)
    
    threeaddress.convert_functions(global_fn)
    threeaddress.print_all_three_addresses(global_fn)
    
    tac_list = retrieve_three_address_list(global_fn)
    datalog_facts = generate_datalog_facts(tac_list)
    
    facts_str = ""
    for fact in datalog_facts:
        print fact
        facts_str += fact + "\n"
    rules_str = generate_datalog_rules()
    
    #Write Output---
    if results.outputpath:
        outputfile = open(outputpath + "\\datalog\\{0}.pl".format(filepath.split("\\")[-1][:-3]), "w")
        outputfile.write(rules_str + "\n\n" + facts_str)
        outputfile.close()
    