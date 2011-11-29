#!/usr/bin/python2.5

"""
 PyNarcissus S-expression converter.

 Converts a PyNarcissus parse tree into S-expressions.
"""

__author__ = "JT Olds"
__author_email__ = "jtolds@xnet5.com"
__date__ = "2009-03-24"
__all__ = ["convert", "UnknownNode", "OtherError", "ProgrammerError", "Error_"]

class Error_(Exception): pass
class UnknownNode(Error_): pass
class OtherError(Error_): pass
class ProgrammerError(OtherError): pass

import sys
import jsparser as js

# n : node
# i : indentLevel
def o(n, i, c, handledattrs=[]):
    attrs_ = {}
    for attr in handledattrs:
        attrs_[attr] = True
    subnodes_ = []
    had_error = False
    def check(attrs=[], optattrs=[], subnodes=0):
        if not (type(attrs) == list and type(optattrs) == list and
                type(subnodes) == int):
            raise ProgrammerError, "Wrong arguments to check(...)!"
        for attr in attrs: attrs_[attr] = True
        for attr in optattrs:
            if hasattr(n, attr): attrs_[attr] = True
        for i in xrange(subnodes):
            subnodes_.append(True)
    def props():
        return ""
    try:
        check(attrs=["append", "count", "extend", "filename", "getSource",
                    "indentLevel", "index", "insert", "lineno", "pop",
                    "remove", "reverse", "sort", "tokenizer", "type", "type_"],
                    optattrs=["end", "start", "value"])
        # Done
        if n.type == "ARRAY_INIT":
            check(subnodes=len(n))
            s = "["
            for index, x in enumerate(n):
                if x is not None:
                    if index != len(n)-1:
                        s += o(x,i,c) + ","
                    else:
                        s += o(x,i,c)
                else:
                    s += ""
            return s + "]"
        # Done
        elif n.type == "ASSIGN":
            check(subnodes=2)
            s = ""
            if getattr(n[0],"assignOp", None) is not None:
                s += "UPDATE"  + js.tokens[n[0].assignOp]
            else:
                s += "ASSIGN"
            return "%s = %s" % (o(n[0], i, c, handledattrs=["assignOp"]),
                    o(n[1], i, c))
        # Done
        elif n.type == "BLOCK":
            check(subnodes=len(n))
            if len(n) > 0:
                return "" + i + \
                        (";\n"+i).join((o(x,i+"  ",c) for x in n)) + ";"
            return ";"
        
        # Done
        elif n.type in ("BREAK", "CONTINUE"):
            check(attrs=["target"], optattrs=["label"])
            if hasattr(n,"label"):
                return "%s %s" % (n.value.lower(), n.label)
            return "%s" % (n.value.lower())
        
        elif n.type == "CALL":
            check(subnodes=2)
            return "%s(%s)" % (o(n[0], i, c), o(n[1], i, c))

        elif n.type == "CASE":
            check(attrs=["caseLabel","statements"])
            return "case %s: \n%s" % (o(n.caseLabel,i,c),
                    o(n.statements,i,c))

        elif n.type == "CATCH":
            check(attrs=["block","guard","varName"])
            if n.guard is not None:
                return "(GUARDED-CATCH%s %s %s %s)" % (props(), n.varName,
                        o(n.guard,i,c), o(n.block,i,c))
            return "(%s){\n%s\n}" % (n.varName, o(n.block,i,c))

        elif n.type == "COMMA":
            check(subnodes=2)
            return "(COMMA%s %s %s)" % (props(), o(n[0],i,c), o(n[1],i,c))

        elif n.type == "DEBUGGER":
            return "(DEBUGGER%s)" % props()

        elif n.type == "DEFAULT":
            check(attrs=["statements"])
            return "(DEFAULT%s %s)" % (props(), o(n.statements,i,c))

        elif n.type in ("DELETE", "TYPEOF", "NEW", "UNARY_MINUS", "NOT",
                "VOID", "BITWISE_NOT", "UNARY_PLUS"):
            check(subnodes=1)
            prefix_dict = {"UNARY_PLUS":"+","UNARY_MINUS":"-","NOT":"!", "BITWISE_NOT":"~"}
            if n.type in prefix_dict.keys():
                return "%s%s" % (prefix_dict[n.type], o(n[0],i,c))
            return "%s %s" % (n.type.lower(),o(n[0],i,c))

        elif n.type == "DO":
            check(attrs=["body", "condition", "isLoop"])
            assert n.isLoop
            return "(DO-WHILE%s %s %s)" % (props(), o(n.condition,i,c),
                    o(n.body,i,c))

        elif n.type == "DOT":
            check(subnodes=2)
            return "%s.%s" % (o(n[0],i,c), o(n[1],i,c))

        elif n.type == "FUNCTION":
            check(attrs=["functionForm","params","body"],
                    optattrs=["name"])
            if n.functionForm == 0:
                return "function %s(%s) {\n%s\n}" % (n.name,
                        ",".join("" + param for param in n.params),
                        o(n.body,i,c))
            else:
                return "function (%s) {\n%s\n}" % (",".join(n.params),
                        o(n.body,i,c))

        elif n.type == "FOR":
            check(attrs=["body","setup","condition","update","isLoop"])
            assert n.isLoop
            if n.setup is not None: setup = o(n.setup,i,c)
            else: setup = "(BLOCK)"
            if n.condition is not None: condition = o(n.condition,i,c)
            else: condition = "(BLOCK)"
            if n.update is not None: update = o(n.update,i,c)
            else: update = "(BLOCK)"
            if n.body is not None: body = o(n.body,i+"  ",c)
            else: body = "(BLOCK)"
            if setup.endswith(";"): setup = setup[:-1]
            
            return "for(%s;%s;%s){\n%s%s\n}" % (setup, condition,
                    update, i, body)

        elif n.type == "FOR_IN":
            check(attrs=["body","iterator","object","isLoop","varDecl"])
            assert n.isLoop
            s = "for("
            if n.varDecl:
                assert n.varDecl.type == "VAR"
                assert len(n.varDecl) == 1
                assert n.varDecl[0].type == "IDENTIFIER"
                assert n.varDecl[0].value == n.iterator.value
                s += "var "
            return s + "%s in %s){\n%s\n}" % (o(n.iterator,i,c),
                    o(n.object,i,c), o(n.body,i,c))

        elif n.type == "GROUP":
            check(subnodes=1)
            return o(n[0],i,c)
        
        # Done
        elif n.type == "HOOK":
            check(subnodes=3)
            return "%s ? %s :%s" % (o(n[0],i,c),o(n[1],i,c),
                    o(n[2],i,c))

        elif n.type == "IDENTIFIER":
            check(optattrs=["initializer","name","readOnly"])
#            if getattr(n,"readOnly",False): assert hasattr(n,"initializer")
            if hasattr(n,"name"): assert n.name == n.value
            if hasattr(n,"initializer"):
                return "var%s %s = %s" % (props(), n.value,
                        o(n.initializer, i, c))
            return str(n.value)

        elif n.type == "IF":
            check(attrs=["condition","thenPart","elsePart"])
            if n.elsePart:
                return "if (%s){\n%s%s\n} else {\n%s%s\n})" % (o(n.condition,i,c), i, o(n.thenPart,i+"  ",c), i,
                        o(n.elsePart, i+"  ", c))
            return "if (%s){\n%s%s\n})" % (o(n.condition,i,c), i,
                    o(n.thenPart, i+"  ",c))
        # Done!
        elif n.type in ("INCREMENT", "DECREMENT"):
            check(optattrs=["postfix"], subnodes=1)
            if getattr(n, "postfix", False):
                return "%s%s" % (o(n[0], i, c),"++" if n.type == "INCREMENT" else "--")
            return "%s%s" % ("++" if n.type == "INCREMENT" else "--", o(n[0], i, c))

        elif n.type == "INDEX":
            check(subnodes=2)
            return "%s[%s]" % (o(n[0],i,c), o(n[1],i,c))

        elif n.type == "LABEL":
            check(attrs=["label","statement"])
            return "(LABELED-STATEMENT%s %s\n  %s%s)" % (props(), n.label, i,
                    o(n.statement, i+"  ", c))

        elif n.type == "LIST":
            check(subnodes=len(n))
            return ','.join(('' + o(x, i, c) for x in n))

        elif n.type == "NEW_WITH_ARGS":
            check(subnodes=2)
            return "(%s%s %s %s)" % (n.value.upper(), props(), o(n[0],i,c),
                    o(n[1],i,c))
        
        # Need fix for binary literals
        elif n.type in ("NUMBER", "TRUE", "FALSE", "THIS", "NULL"):
            return str(n.value).lower()

        elif n.type == "OBJECT_INIT":
            check(subnodes=len(n))
            if len(n) > 0:
                return ("{%s" % i +
                        (","+i).join(o(x,i+"  ",c) for x in n) + "}")
            return "{}"

        elif n.type in ("PLUS", "LT", "EQ", "AND", "OR", "MINUS", "MUL", "LE",
                "NE", "STRICT_EQ", "DIV", "GE", "INSTANCEOF", "IN", "GT",
                "BITWISE_OR", "BITWISE_AND", "BITWISE_XOR", "STRICT_NE", "LSH",
                "RSH", "URSH", "MOD"):
            oper_kwd = ["PLUS", "LT", "EQ", "AND", "OR", "MINUS", "MUL", "LE",
                "NE", "STRICT_EQ", "DIV", "GE", "INSTANCEOF", "IN", "GT",
                "BITWISE_OR", "BITWISE_AND", "BITWISE_XOR", "STRICT_NE", "LSH",
                "RSH", "URSH", "MOD"]
            oper_list = ["+", "<", "==", "&&", "||", "-", "*", "<=", "!=", "===",
                         "/", ">=", "instanceof", "in", ">", "|", "&", "^", "!==",
                         "<<", ">>", ">>>", "%"]
            
            check(subnodes=2)
            return "%s %s %s" % (o(n[0],i,c), oper_list[oper_kwd.index(n.type)],
                    o(n[1],i,c))

        elif n.type == "PROPERTY_INIT":
            check(subnodes=2)
            return "%s:%s" % (o(n[0],i,c), o(n[1],i,c))

        elif n.type == "REGEXP":
            return "(REGEXP%s %r %r)" % (props(), n.value["regexp"],
                    n.value["modifiers"])

        elif n.type == "RETURN":
            if type(n.value) == str and n.value == 'return':
                return "return"
            if type(n.value) == str:
                return "return %r" % (n.value)
            return "return %s" % (o(n.value, i, c))

        elif n.type == "SCRIPT":
            check(attrs=["funDecls","varDecls"], subnodes=len(n))
#            sys.stderr.write("WARNING: skipping funDecls and varDecls\n")
            if len(n) > 0:
                return ("" + i +
                        ("\n  "+i).join((o(x,i+"  ",c) for x in n)))
            return ""

        elif n.type == "SEMICOLON":
            check(attrs=["expression"])
            if not n.expression: return "(BLOCK)"
            return o(n.expression, i, c)

        elif n.type == "STRING":
            return repr(n.value)

        elif n.type == "SWITCH":
            check(attrs=["cases", "defaultIndex", "discriminant"])
            assert (n.defaultIndex == -1 or
                    n.cases[n.defaultIndex].type == "DEFAULT")
            return "switch (%s) {\n  %s%s}" % (o(n.discriminant,i,c), i,
                    ("\n  "+i).join(o(x,i+"  ",c) for x in n.cases))

        elif n.type == "THROW":
            check(attrs=["exception"])
            return "(THROW%s %s)" % (props(), o(n.exception,i,c))

        elif n.type == "TRY":
            check(attrs=["catchClauses","tryBlock"], optattrs=["finallyBlock"])
            if hasattr(n,"finallyBlock"):
                return "try {\n" + i + ("\n  "+i).join(
                        [o(n.tryBlock,i+"  ",c)]) + "}\n" + i + "catch" + ("\n  "+i).join([o(x,i+"  ",c) for x in n.catchClauses]) + \
                        "finally{\n"+("\n  "+i).join([o(n.finallyBlock,i+"  ",c)]) + i + "\n}"
            return "try {\n" + i + ("\n  "+i).join(
                    [o(n.tryBlock,i+"  ",c)]) + "catch" + ("\n  "+i).join([o(x,i+"  ",c)
                    for x in n.catchClauses])

        elif n.type in ("VAR", "CONST"):
            check(subnodes=len(n))
            return " ".join((o(x,i,c) for x in n))

        elif n.type == "WITH":
            check(attrs=["body", "object"])
            sys.stderr.write("WARNING: A bad person wrote the code being "
                    "parsed. Don't use 'with'!\n")
            return "(WITH%s %s %s)" % (props(), o(n.object,i,c), o(n.body,i,c))

        elif n.type == "WHILE":
            check(attrs=["condition","body","isLoop"])
            assert n.isLoop
            return "while(%s){\n  %s%s}" % (o(n.condition,i,c), i,
                    o(n.body, i+"  ",c))

        else:
            raise UnknownNode, "Unknown type %s" % n.type
    except Exception, e:
        had_error = True
        raise OtherError("%s\nException in node %s on line %s" % (e, n.type,
                getattr(n, "lineno", None)))
    finally:
        if not had_error:
            realkeys = [x for x in dir(n) if x[:2] != "__"]
            for key in realkeys:
                if key not in attrs_:
                    raise ProgrammerError, "key '%s' unchecked on node %s!" % (
                            key, n.type)
            if len(realkeys) != len(attrs_):
                for key in attrs_:
                    if key not in realkeys:
                        raise ProgrammerError, ("key '%s' checked "
                                "unnecessarily on node %s!" % (key, n.type))
            if len(subnodes_) != len(n):
                raise ProgrammerError, ("%d subnodes out of %d checked on node "
                        "%s" % (len(subnodes_), len(n), n.type))

def convert(parsetree, include_props=False):
    """Takes a PyNarcissus parse tree and returns a string of S-expressions

    Args:
        parsetree: the PyNarcissus parse tree
        include_props: if true, the s-expressions have additional information
            included via @ attribute expressions, such as line-number.
    Returns:
        string
    Raises:
        UnknownNode: if a node hasn't been properly accounted for in the
            conversion
        ProgrammerError: if the conversion routine wasn't written with the best
            understanding of the parse tree
        OtherError: if some other error happened we didn't understand.
    """

    return o(parsetree, "", {"include_props": include_props}) + "\n"

if __name__ == "__main__":
    try:
        include_props = (sys.argv[1] == "--props")
    except:
        include_props = False

    sys.stdout.write(convert(js.parse(sys.stdin.read()), include_props))
