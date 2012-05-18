'''
Created on Jan 30, 2012

@author: Ivan Gozali
'''

from ucb import main as _main
import os
import fileutils
import argparse

def extract_data_from_text(text):
    """
    text - a string in the format below:
    
    Extension Name: Clip to Evernote
    Extension Identifier: pioclpoplcdbaefihamjohnefbikjilc
    Number of functions: 4241
    Number of anonymous functions: 4009
    Number of named functions: 232
    Number of functions that reference chrome: 170
    """
    def get_text_after_colon(str):
        return str[str.index(":") + 1:]
    
    data = text.split("\n")
    ext_name = get_text_after_colon(data[0]).strip()
    total_functions = get_text_after_colon(data[2]).strip()
    chrome_refs = get_text_after_colon(data[5]).strip()
    percentage_refs = float(chrome_refs) / float(total_functions) * 100
    
    # return a string of the format "Clip to Evernote & 4241 & 170 & 4.0 \\ \hline"
    return ext_name + " & " + total_functions + " & " + chrome_refs + " & " + \
        "{:.1f}".format(percentage_refs) + " \\\\ \\hline"
        

def extract_data(filelist):
    str = ""
    for txtpath in filelist:
        text = open(txtpath).read()
        str += extract_data_from_text(text) + "\n"
    return str

@_main
def main(*args):
    parser = argparse.ArgumentParser(description="Module to convert log files into table format.")
    
    parser.add_argument("path", action="store", help="a file to be read in current directory or a directory containing files to be read")
    parser.add_argument("-o", action="store", dest="outputfile", default="outputfile.txt", help="specifies output file name (default: outputfile.txt)")
    
    argobj = parser.parse_args()
    
    if os.path.isdir(argobj.path):
        filelist = fileutils.get_all_files_in_directory(argobj.path)
    if os.path.isfile(os.getcwd() + "\\" + argobj.path):
        filelist = [os.getcwd() + "\\" + argobj.path]
    
    outputfile = open(argobj.outputfile, "w")
    output_str = extract_data(filelist)
    outputfile.write(output_str)