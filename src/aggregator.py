#!/usr/bin/python
"""
@file aggregator.py
@brief A simple Python script which combines JavaScript files in a directory.

This Python script scans through all the JavaScript files recursively in a 
directory, and combines all of them into one JavaScript file. Useful to "pack"
a Chrome extension into one file.

One of the options allow you to pack all the extensions in a extension
directory.

Ivan Gozali <gozaliivan@berkeley.edu>
"""
import argparse
import sys
import os

import fileutils

from ucb import main as _main

@_main
def main(*args):
    parser = argparse.ArgumentParser(prog="aggregator.py", 
                 description='''A simple aggregator script, used to collect all 
                 the js files in a directory recursively and combine them into 
                 one js file.''')

    parser.add_argument("filepath", action="store", 
                        help="""filepath to be used in the program""")

    parser.add_argument("-e", action="store_true", 
                        dest="extension", default=False,
                        help="""indicates that filepath is a path to a single 
                        extension (e.g. extensions/aapbdbdomjkkjkaonfhkkikfgjllcleb)""")

    parser.add_argument("-ec", action="store_true",
                        dest="extension_collections", default=False,
                        help="""indicates that filepath is a path to a collection
                        of extensions (e.g. extensions/)""")

    parser.add_argument("-o", action="store",
                        dest="outputpath", default="None",
                        help="""the output path (it must already exist)""")

    results = parser.parse_args()

    if not results.extension and not results.extension_collections:
        print "Either -e or -ec has to be specified."
        sys.exit(1)

    if results.extension:
        ext_path = os.path.join(results.filepath, directory)
        js_str = fileutils.combine_js_files(ext_path)
        ext_id = fileutils.get_extension_id(ext_path)
        print "Extension ID: " + ext_id
        
        outfile = open(os.path.join(results.outputpath, ext_id) + "_combined.js", "w")
        outfile.write(js_str)
        outfile.close()

    elif results.extension_collections:
        for directory in fileutils.get_directories(results.filepath):
            print directory
            js_str = fileutils.combine_js_files(directory)
            ext_id = fileutils.get_extension_id(directory)
            print "Extension ID: " + ext_id
            
            outfile = open(os.path.join(results.outputpath, ext_id) + "_combined.js", "w")
            outfile.write(js_str)
            outfile.close()
    
    sys.exit(0)

    
