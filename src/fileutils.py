"""
Module fileutils

A file utility module to work with files and directories. In particular,
this module is used to work in conjunction with the ExtensionAnalyzer.
"""

import os

# ------- General Functions -------

def get_directory_tree(dir = os.getcwd()):
    """
    Returns a generator object containing the directory tree. If no arguments
    are specified, the function returns a directory tree for the current 
    directory.
    
    A directory tree is a sequence of 3-tuples, where each 3-tuple contains:
    - dirpath:   the absolute directory path of all the directories and 
                 subdirectories in dir
    - dirnames:  a list of relative subdirectories in the current dirpath
    - filenames: a list of relative filenames in the current dirpath
    
    dir - absolute directory path from which the directory tree object
          is to be obtained
    """
    return os.walk(dir)

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

def convert_abs_to_rel(filepath):
    if os.path.isabs(filepath):
        return os.path.split(filepath)[1]
    
    return filepath

# ------- Functions Specific to ExtensionAnalyzer -------

def is_javascript_file(filename):
    return is_file_type(filename, ".js")

# TODO Have to make this work across OS
def get_chrome_extensions_path():
    chrome_path = "C:\Users\\" + os.getenv("USERNAME") + "\\AppData\\Local\\Google\\Chrome\\User Data\\Default\\Extensions"
    
    if os.path.exists(chrome_path):
        return chrome_path
    else:
        return "Directory does not exist."

def get_chrome_extensions_path_list(ext_dir=None):
    """
    Gets the absolute paths of the extensions inside an Extension directory.
    An extension directory is the directory that contains the folders of the
    extensions with unique names that are 32 characters long.
    """
    # If no arguments are specified, try to look for Chrome 
    # extensions path inside computer.
    if ext_dir is None:
        ext_dir = get_chrome_extensions_path()
    
    dir_tree = get_directory_tree(ext_dir)
    path_list = []
    
    for dirname in tuple(dir_tree)[0][1]:
        path_list.append(str(ext_dir) + "\\" + str(dirname))
    
    return path_list

def print_all_javascript_files_in_current_directory():
    dir_tree = get_directory_tree()
    
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