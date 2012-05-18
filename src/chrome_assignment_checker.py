'''
Created on Feb 6, 2012

@author: Ivan Gozali
'''

import argparse
import os

import astutils
import fileutils
from ucb import main as _main

class Var(object):
    """
    A Var object might contain multiple assignments at once. This class
    has been designed to take care of this possibility.
    """
    def __init__(self, var_node):
        self.node = var_node
        self.vardict = {}
        self.left_operand_list = []
        self.right_operand_list = []
        
        for varasgn in var_node:
            self.left_operand_list.append(varasgn.value)
            if hasattr(varasgn, "initializer"):
                self.vardict[varasgn.value] = astutils.construct_expression(varasgn.initializer)
                self.right_operand_list.append(astutils.construct_expression(varasgn.initializer))
            else:
                self.vardict[varasgn.value] = None
                self.right_operand_list.append(None)

    def right_operand_contains_chrome(self):
        for right_operand in self.right_operand_list:
            if type(right_operand) == str and "chrome" == right_operand[0:6]:
                return True
        return False
    
    def get_chrome_in_right_operand(self):
        assert len(self.left_operand_list) == len(self.right_operand_list), "Length of operand lists not equal"
        chrome_list = []
        for i in range(len(self.left_operand_list)):
            if type(self.right_operand_list[i]) == str and "chrome" == self.right_operand_list[i][0:6]:
                chrome_list.append("var " + self.left_operand_list[i] + " = " + self.right_operand_list[i])
        return chrome_list    
        
    def __repr__(self):
        return "Var({0})".format(self.vardict)
    
class Assignment(object):
    def __init__(self, asgn_node):
        self.node = asgn_node
        self.left_operand = astutils.construct_expression(asgn_node[0])
        self.right_operand = astutils.construct_expression(asgn_node[1])
    
    def right_operand_contains_chrome(self):
        return type(self.right_operand) == str and "chrome" == self.right_operand[0:6]
    
    def __str__(self):
        return self.left_operand + " = " + self.right_operand
    
    def __repr__(self):
        return "Assignment({0}, {1})".format(self.left_operand, self.right_operand)
    
def process_assignment_list(assignment_list):
    new_list = []
    for asgn_node in assignment_list:
        new_list.append(Assignment(asgn_node))
    return new_list

def process_varassign_list(varassign_list):
    new_list = []
    for var_node in varassign_list:
        new_list.append(Var(var_node))
    return new_list

@_main
def main(*args):
    parser = argparse.ArgumentParser(description="A checker that finds variables" +
        " that chrome are assigned to")
    
    parser.add_argument("filepath", action="store", help="the JavaScript filepath")
    parser.add_argument("-o", action="store", dest="outputpath", help="output path")
    parser.add_argument("-e", action="store_true", default=False, dest="isextension", help="set if the path given is an extension path")
    
    # Parsing Complete ------------------------------------------------------------------
    
    results = parser.parse_args()
    
    filepath = results.filepath
    
    if (results.outputpath):
        outputpath = results.outputpath + "\\chromeassigns"
        if not os.path.exists(outputpath):
            os.mkdir(outputpath)
    else:
        outputpath = os.getcwd()
    
    isextension = results.isextension
    
    # Loading Objects Complete ----------------------------------------------------------
    
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

    varassign_list = astutils.get_node_list(ast, "VAR")
    varassign_list = process_varassign_list(varassign_list)
    varassign_list = [x for x in varassign_list if x.right_operand_contains_chrome()]
    chrome_vars = []
    for vardict in varassign_list:
        chrome_vars.extend(vardict.get_chrome_in_right_operand())
    
    assignment_list = astutils.get_node_list(ast, "ASSIGN")
    assignment_list = process_assignment_list(assignment_list)
    assignment_list = [x for x in assignment_list if x.right_operand_contains_chrome()]
    
    resultstr = ""
    
    resultstr += "Var Assignment List Containing Chrome\n"
    if len(chrome_vars) == 0:
        resultstr += "-----EMPTY-----\n"
    else:
        isnone = True
        for chrome_var in chrome_vars:
            if chrome_var[-1] != ")": # make sure that it's not a call to Chrome API
                isnone = False
                resultstr += ">   " +  chrome_var + "\n"
        if isnone:
            resultstr += "-----CALLS TO CHROME API ASSIGNED TO LOCAL VARIABLES-----\n"
            resultstr += "-----BUT NO CHROME API INSTANCE IS ASSIGNED TO A VAR-----\n"
        
    resultstr += "\nAssignment List Containing Chrome\n"
    if len(assignment_list) == 0:
        resultstr += "-----EMPTY-----\n"
    else:
        isnone = True
        for assignment in assignment_list:
            asgn_str = str(assignment)
            if asgn_str[-1] != ")": # make sure that it's not a call to Chrome API
                isnone = False
                resultstr += ">   " + str(assignment) + "\n"
        if isnone:
            resultstr += "-----   CALLS TO CHROME API ASSIGNED TO VARIABLES   -----\n"
            resultstr += "-----BUT NO CHROME API INSTANCE IS ASSIGNED TO A VAR-----\n"
    print resultstr
    print outputpath + "\\" + ext_id + "_chromeassigns.txt"
    resultfile = open(outputpath + "\\" + ext_id + "_chromeassigns.txt", "w")
    resultfile.write(resultstr)
    resultfile.close()
    
    
    