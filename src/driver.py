#!/usr/bin/python

"""
driver.py

Created on Apr 27, 2012

@author: Ivan Gozali
"""

import alpharenamer
import threeaddress
import datalog
import astutils
import fileutils
import pynarcissus.jsparser

import os
import sys
import argparse

from ucb import main as _main

# Global Variables
VERBOSE = False

def print_stack_trace():
    import traceback
    exc_str = traceback.format_exc()
    sys.stderr.write(exc_str)

# Main Function
@_main
def main(*args):
    ########################################################################### 
    # Phase 0. Argument Parsing                                               #
    ########################################################################### 

    parser = argparse.ArgumentParser(prog="driver.py", 
                 description='''The main driver of the complete suite of the
                 jsAnalyzer JavaScript static analysis utility. This utility will
                 perform three operations on a JavaScript file or extension:
                 alpha-renaming, three-address generation, and Datalog facts
                 generation.''')

    # Positional Arguments
    parser.add_argument("filepath", action="store", 
                        help="""the JavaScript file to be analyzed""")

    # Optional Arguments
    parser.add_argument("--output-path", "-o", action="store", 
                        dest="outputpath", default=None,
                        help="""the output directory. files will be created in 
                             this directory""")

    #parser.add_argument("--stop-phase", "-S", action="store", 
    #                    dest="stopphase", default="last",
    #                    help="""select the analysis phase to stop at (options:
    #                         alpharenamer, threeaddress, datalog, last)""")

    parser.add_argument("--skip-phase", "-s", action="store", 
                        dest="skipphase", default=None,
                        help="""select the analysis phase to skip (options:
                             alpharenamer, threeaddress, datalog, all)""")
    
    parser.add_argument("--write-files", "-w", action="store", 
                        dest="writefiles", default="all",
                        help="""set the files to write (options: combinedjs, 
                        ast, datalogfacts, all)""")

    parser.add_argument("--extension", "-e", action="store_true", 
                        dest="extension", default=False,
                        help="""set if the file specified is an extension folder
                             """)

    parser.add_argument("--verbose", "-v", action="store_true", 
                        dest="verbose", default=False,
                        help="""set to print verbose debugging messages""")

    results = parser.parse_args()

    ########################################################################### 
    # Phase 0.5. Input + Setup Phase                                          #
    ########################################################################### 

    # If filepath does not exist, raise Exception
    if results.extension and not os.path.exists(results.filepath):
        #raise IOError("the specified extension folder does not exist")
        sys.stdout.write("the specified extension folder does not exist\n")
        print_stack_trace()
        sys.exit(1)
    if not os.path.exists(results.filepath):
        #raise IOError("the specified JavaScript file does not exist")
        sys.stderr.write("the specified JavaScript file does not exist\n")
        print_stack_trace()
        sys.exit(1)

    # If filepath is a directory to a Google Chrome extension 
    if results.extension == True:
        ext_name = fileutils.get_extension_name(results.filepath)
        ext_ID = fileutils.get_extension_id(results.filepath)
        print "Extension Name : " + ext_name
        print "Extension ID   : " + ext_ID
        
        combinedjs = fileutils.combine_js_files(results.filepath)
        
        try:
            ast = astutils.create_AST_from_string(combinedjs)
        except Exception, e:
            sys.stderr.write("error occurred when creating AST from combined JavaScript file\n")
            print_stack_trace()
            sys.exit(2)

    # Else, filepath is a JavaScript file (e.g. sample.js)
    else:
        print "File : " + results.filepath

        js_file = open(results.filepath, "r") 
        combinedjs = js_file.read()
        js_file.close()

        try:
            ast = astutils.create_AST(results.filepath)
        except Exception, e:
            sys.stderr.write("error occurred when creating AST from JavaScript file\n")
            print_stack_trace()
            sys.exit(3)
    
    if results.verbose:
        global VERBOSE
        VERBOSE = True

        alpharenamer.VERBOSE = True
        threeaddress.VERBOSE = True
        datalog.VERBOSE = True

    skip_alpharenamer, skip_threeaddress, skip_datalog = False, False, False
    if results.skipphase is not None:
        skipphase = results.skipphase.split(",")
        if "alpharenamer" in skipphase:
            skip_alpharenamer = True
        if "threeaddress" in skipphase:
            skip_threeaddress = True
        if "datalog" in skipphase:
            skip_datalog = True
        if "all" in skipphase:
            skip_alpharenamer = True
            skip_threeaddress = True
            skip_datalog = True
    ########################################################################### 
    # Phase 1. Alpha-Renaming                                                 # 
    ########################################################################### 

    if not skip_alpharenamer:
        try:
            frame_object = alpharenamer.create_frames(ast)
            frame_object = alpharenamer.alpha_rename(frame_object, ast)
        except Exception, e:
            sys.stderr.write("error occurred in alpha-renaming\n")
            print_stack_trace()
            sys.exit(4)
            
    ########################################################################### 
    # Phase 2. Three-Address Code Generation                                  # 
    ########################################################################### 

    if not skip_threeaddress:
        try:
            global_function_object = threeaddress.analyze_three_address(ast)

            threeaddress.convert_functions(global_function_object)
            if VERBOSE: threeaddress.print_all_three_addresses(global_function_object)
        except Exception, e:
            sys.stderr.write("error occurred in three-address code generation\n")
            print_stack_trace()
            sys.exit(5)

    ########################################################################### 
    # Phase 3. Datalog Facts Generation                                       # 
    ########################################################################### 

    if not skip_datalog:
        try:
            tac_list = datalog.retrieve_three_address_list(global_function_object)
            
            datalog_facts = datalog.generate_datalog_facts(tac_list)
            datalog_string = datalog.generate_datalog_string(datalog_facts)
        except Exception, e:
            sys.stderr.write("error occurred in datalog facts generation\n")
            print_stack_trace()
            sys.exit(6)

    ########################################################################### 
    # Phase 4. Output                                                         # 
    ########################################################################### 

    if results.outputpath:
        if not os.path.exists(results.outputpath):
            os.mkdir(results.outputpath)

        if results.extension:
            outputname = ext_ID
        else:
            outputname = fileutils.extract_filename(results.filepath)

        writefiles = results.writefiles.split(",")
        write_combinedjs, write_ast, write_datalogfacts = False, False, False
        if "combinedjs" in writefiles:
            write_combinedjs = True
        if "ast" in writefiles:
            write_ast = True
        if "datalogfacts" in writefiles:
            write_datalogfacts = True
        if "all" in writefiles:
            write_combinedjs = True
            write_ast = True
            write_datalogfacts = True

        if write_ast:
            outputfile = open(os.path.join(results.outputpath, outputname + "_ast.txt"), "w")
            outputfile.write(str(ast))
            outputfile.close()

        if write_combinedjs:
            outputfile = open(os.path.join(results.outputpath, outputname + "_combined.js"), "w")
            outputfile.write(combinedjs)
            outputfile.close()

        if write_datalogfacts:
            outputfile = open(os.path.join(results.outputpath, outputname + "_datalog.pl"), "w")
            outputfile.write(datalog_string)
            outputfile.close()

    sys.exit(0)
