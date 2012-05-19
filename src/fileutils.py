"""
fileutils.py

Created on Oct 12, 2011.

@author: Ivan Gozali

A file utility module to work with files and directories. In particular,
this module is used to work in conjunction with the ExtensionAnalyzer, which
explains why some of the functions have very specific uses.
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

def get_all_files_in_directory(directory):
    """
    Return the list of absolute paths to all files in the directory.
    
    dir - directory to find files in
    """
    
    dir_tree = get_directory_tree(directory)
    dirpath, filenames = None, None
    
    # get the first tuple of the elements in dir_tree, whose first 
    # element will be referring to the current directory
    for _dirpath, _dirnames, _filenames in dir_tree:
        dirpath = _dirpath
        filenames = _filenames
        break
    
    return [dirpath+ "\\" + filename for filename in filenames]
    
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

def extract_filename(filepath):
    """ Tries to extract a filename from a path to a file. If the path 
    provided is not a filename, raise an exception.

    """
    if not os.path.isfile(filepath):
        raise TypeError("the argument is not a file, or the file doesn't exist")

    return os.path.splitext(os.path.split(filepath)[1])[0]

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
    """Gets the absolute paths of the extensions inside an Extension directory.
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
    """Prints all the JavaScript file names in the current directory in a tidy
    fashion.
    """
    dir_tree = get_directory_tree()
    
    for dirpath, dirnames, filenames in dir_tree:
        print("Current directory: {0}".format(dirpath))
        for i, file in enumerate(filenames):
            if is_javascript_file(file):
                print("File {0} : {1}".format(i, file))
        print("------------------------------------")

def get_all_javascript_files_absolute(dir):
    """Returns a list of absolute paths to JavaScript files.
    
    dir - absolute path to the directory to be analyzed
    """
    
    dir_tree = get_directory_tree(dir)
    js_list = []
    
    for dirpath, dirnames, filenames in dir_tree:
        for file in filenames:
            if is_javascript_file(file):
                js_list.append(str(os.path.join(dirpath, file)))
    
    return js_list

def combine_js_files(path):
    """Given a path, combines all the JavaScript files found in that path into
    one huge string.
    
    path     - a directory where the JavaScript files are contained
    """
    file_list = get_all_javascript_files_absolute(path)
    js_string = ""
    
    for filename in file_list:
        current_file = open(filename)

        js_string += "//" + filename + "\n\n"
        js_string += current_file.read() + "\n\n\n"

        current_file.close() 

    return js_string

def get_extension_name(path):
    """Given an extension directory, tries to extract the extension name
    from the manifest.json files, or _locales/en folder
    
    path    - an extension directory (e.g. gighgighmmpiobklfepjocnamgkkbiglidom)
    """
    try:
        #print "Trying to find name in manifest.json... ",
        for dirpath, dirnames, filenames in get_directory_tree(path):
            for filename in filenames:
                if filename == "manifest.json":
                    tempstr = open(dirpath + os.sep + filename).read()
                    tempstr = tempstr[tempstr.index("\"name\""):]
                    tempstr = tempstr[:tempstr.index("\n")]
                    tempstr = tempstr[9:-2]
                    if "__MSG" not in tempstr:
                        #print "OK"
                        return tempstr
                    else:
                        #print "Extension name not found in manifest.json"
                        raise Exception(tempstr)
    # __MSG_name__
    except Exception, e:
        tag = e[0][6:-2]
        #print "Trying _locales" + os.sep + "en folder...",
        for dirpath, dirnames, filenames in get_directory_tree(path):
            if dirpath.endswith("_locales" + os.sep + "en") and "__MACOSX" not in dirpath:
                tempstr = open(dirpath + os.sep + "messages.json").read()
                tempstr = tempstr[tempstr.index("\"" + tag + "\": {\n      "):]
                tempstr = tempstr[:tempstr.index("}")]
                tempstr = tempstr[tempstr.index("\"message\""):]
                tempstr = tempstr[:tempstr.index("\n")]
                tempstr = tempstr[12:-1]
                #print "OK"
                return tempstr
        #print "Name not found."
        return None

def get_extension_id(path):
    """Given an extension path, tries to extract the ID of the extension.
    Otherwise, returns the string "unknownID".

    path    - an extension directory (e.g. gighmmpiobklfepjocnamgkkbiglidom)
    """
    split_path = path.split(os.sep)

    # Handles the case where path is like below:
    # /../extensions/gighmmpiobklfepjocnamgkkbiglidom
    ext_id = split_path[-1]
    if ext_id is not None and len(ext_id) == 32:
        return ext_id

    # Handles the case where the path has an extra slash at the end
    # /../extensions/gighmmpiobklfepjocnamgkkbiglidom/
    ext_id = split_path[-2]
    if ext_id is not None and len(ext_id) == 32:
        return ext_id 

    return "unknownID"
    

