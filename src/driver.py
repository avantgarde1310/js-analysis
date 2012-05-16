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

    #parser.add_argument("--skip-phase", "-s", action="store", 
    #                    dest="skipphase", default=None,
    #                    help="""select the analysis phase to skip (options:
    #                         alpharenamer, threeaddress, datalog, all)""")
    
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
        raise IOError("the specified extension folder does not exist")
    if not os.path.exists(results.filepath):
        raise IOError("the specified JavaScript file does not exist")

    # If filepath is a directory to a Google Chrome extension 
    if results.extension == True:
        ext_name = fileutils.get_extension_name(results.filepath)
        ext_ID = fileutils.get_extension_id(results.filepath)
        print "Extension Name : " + ext_name
        print "Extension ID   : " + ext_ID
        
        combinedjs = fileutils.combine_js_files(results.filepath)
        
        ast = astutils.create_AST_from_string(combinedjs)
    # Else, filepath is a JavaScript file (e.g. sample.js)
    else:
        js_file = open(results.filepath, "r") 
        combinedjs = js_file.read()
        js_file.close()

        ast = astutils.create_AST(results.filepath)
    
    if results.verbose:
        global VERBOSE
        VERBOSE = True

        alpharenamer.VERBOSE = True
        threeaddress.VERBOSE = True
        datalog.VERBOSE = True

    ########################################################################### 
    # Phase 1. Alpha-Renaming                                                 # 
    ########################################################################### 

    frame_object = alpharenamer.create_frames(ast)
    frame_object = alpharenamer.alpha_rename(frame_object, ast)

    ########################################################################### 
    # Phase 2. Three-Address Code Generation                                  # 
    ########################################################################### 

    global_function_object = threeaddress.analyze_three_address(ast)

    threeaddress.convert_functions(global_function_object)
    threeaddress.print_all_three_addresses(global_function_object)

    ########################################################################### 
    # Phase 3. Datalog Facts Generation                                       # 
    ########################################################################### 

    tac_list = datalog.retrieve_three_address_list(global_function_object)
    
    datalog_facts = datalog.generate_datalog_facts(tac_list)
    datalog_string = datalog.generate_datalog_string(datalog_facts)

    ########################################################################### 
    # Phase 4. Output                                                         # 
    ########################################################################### 

    if results.outputpath:
        if not os.path.exists(results.outputpath):
            os.mkdir(outputpath)

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
