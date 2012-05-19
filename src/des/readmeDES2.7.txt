==============================
DES INSTALLATION (quick guide)
==============================

==============================
Windows Binary Distribution
==============================
- Double-click on deswin.exe for starting the Windows application
- Execute des.exe for starting the console application

==============================
Linux Binary Distribution
==============================
- Start ./des from its installation path

==============================
Windows Source Distributions
==============================
1. Create a shortcut in the desktop for running the Prolog 
   interpreter of your choice. 
2. Modify the start directory in the "Properties" dialog box 
   of the shortcut to the installation directory for DES. 
   This allows the system to consult the needed files at startup.
3. Append the following options to the Prolog executable complete 
   filename, depending on the Prolog interpreter you use:
   (a) Ciao Prolog: -l ciaorc
   (b) GNU Prolog: --entry-goal ['des.pl']
   (c) SICStus Prolog: -l des.pl
   (d) SWI Prolog: -g "ensure_loaded(des)" (remove --win_app if present)
Another alternative is to write a batch file similar to the 
script file described just in the above section.
    
==============================
Linux Source Distributions
==============================
You can write a script for starting DES according to the 
selected Prolog interpreter, as follows:
(a) Ciao Prolog: 
    $CIAO -l ciaorc 
    Provided that $CIAO is the variable which holds the
    absolute filename of the Ciao Prolog executable.
(b) GNU Prolog: 
    $GNU --entry-goal ['des.pl'] 
    Provided that $GNU is the variable which holds the 
    absolute filename of the GNU Prolog executable.
(c) SICStus Prolog: 
    $SICSTUS -l des.pl 
    Provided that $SICSTUS is the variable which holds 
    the absolute filename of the SICStus Prolog executable.
(d) SWI Prolog: 
    $SWI -g "ensure_loaded(des)"
    Provided that $SWI is the variable which holds the 
    absolute filename of the SWI Prolog executable.

==============================
More Information: 
==============================

- See User Manual
  'Documentation' entry in 
  http://www.fdi.ucm.es/profesor/fernan/des/html/download.html
- http://des.sourceforge.net


Version 2.7 of DES (released on January, 3rd, 2012)

* Enhancements:
  o Extended relational algebra processor including all the original operators but division, and extended operators for dealing with outer joins, duplicate elimination, recursion, and grouping with aggregates
  o Multi-line input is also allowed in addition to the current single-line input. Long inputs as typical SQL statements can be spanned over several lines. When multi-line is enabled with the command /multiline on, Datalog inputs must end with a dot (.), and SQL and RA inputs with a semicolon (;). When disabled, each line is considered as a single (Datalog, SQL or RA) input and ending characters are optional
  o When multi-line input is enabled, remarks enclosed between /* and */ can span over several lines and can be nested as well
  o Single-line (--) and multi-line (/**/) remarks can be included in SQL statements at any place a separating blank can occur
  o SQL statement CREATE TABLE can include LIKE for creating a table with the same schema as an existing one
  o SQL statement DROP TABLE can include IF EXISTS clause and can apply to a list of tables
  o New (non-standard) SQL metadata statements (catalogued under ISL, Information Schema Language):
    + SHOW TABLES; List table names. TAPI enabled
    + SHOW VIEWS; List view names. TAPI enabled
    + SHOW DATABASES; List database names. TAPI enabled
    + DESCRIBE Relation;  Display schema for Relation, as /dbschema command does. TAPI enabled
  o New commands:
    + /list_tables List table names. TAPI enabled
    + /list_views List view names. TAPI enabled
    + /multiline Display whether multi-line input is enabled
    + /multiline Switch Enable or disable  multi-line input (on or off resp.)
    + /ra Switch to RA interpreter
    + /ra Query Execute an RA query
    + /referenced_relations Name Display relations directly referenced by a foreign key in Name
    + /referenced_relations Name/Arity Display relations directly referenced by a foreign key in Name/Arity
  o Last line in a processed file must not end with a carriage return for its processing
  o Faster abolish command and drop database SQL statement 
  o Display of the number of consulted constraints, if any
  o Exceptions during constraint checking when consulting files are caught
  o Faster parsing of Datalog rules and SQL statements
  o A pivot variable that does not occur in the aggregate relation raises a syntax error 
  o Views are not required to be created with given column names
  o Submitting a query or creating a view with duplicated columns is rejected
  o Language command error messages instead of just  "Input processing error"
  o Improved compilation of EXISTS SQL clauses, using Datalog built-in top/2, which allows to prune the number of computed tuples
* Changes:
  o The system prompt for Datalog language changes to the old prompt DES>, as almost any input can be handled from this setting. The only inputs that must explicitly submitted to a language processor are those that can be handled by several language processors
  o Null identifiers are not wasted as eagerly as in previous versions
  o Negation algorithm et_not do not longer rely on computations by strata
  o New organization of system files: 
    + des_sql_debug.pl (debugger extracted from former des_sql.pl)
    + des_dl_debug.pl (replaces des_debug.pl), and 
    + des_ra.pl (includes RA processor)
* Fixed bugs:
  o Listings of SQL statements including Top-N queries failed
  o After submitting an incorrect SQL view, all of its temporary schema was not cleaned up
  o Variable names in consulted Datalog constraints were lost
  o New schema names defined in the list of local definitions inside a WITH or ASSUME SQL statement were not handled appropriately. Bug introduced in version 2.6
  o Only one blank was allowed after a SELECT statement. Bug introduced in version 2.6
  o Operator precedence in SQL conditions and Datalog bodies was not correctly handled (parentheses were needed to ensure correct operator applications)
  o Renamed relations could not be enclosed between parentheses
  o A renamed argument in a nested query was not visible for the WHERE condition of its outer query
  o Expressions in nested SQL queries could not be referenced from outermost queries
  o Type inference failed in some situations for equivalent internal string types (cf. russell.sql). Bug introduced in version 2.6
  o Underscored variables in a head rule made rule assertion fail
  o The Prolog interpreter did not handle conjunctive and disjunctive queries

