'''
Created on Mar 1, 2012

@author: Ivan Gozali

Module for debugging purposes. Trims the output AST file so that it 
shows only the information we need. 
'''

def trim_AST_string(AST_string):
    new_AST_string = ""
    
    AST_lines = AST_string.split("\n")
    for line in AST_lines:
        if "lineno" in line:
            continue
        elif "tokenizer" in line:
            continue
        elif "start" in line:
            continue
        elif "end" in line:
            continue
        elif "length" in line:
            continue
        
        new_AST_string += line + "\n"
    
    return new_AST_string