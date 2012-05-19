/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    SQL Subsystem                                      */
/*                                                       */
/*                                                       */
/*                                                       */
/*                    Fernando Saenz-Perez (c) 2004-2012 */
/*                                         GPD DISIA UCM */
/*             Please send comments, questions, etc. to: */
/*                                     fernan@sip.ucm.es */
/*                                Visit the Web site at: */
/*                           http://des.sourceforge.net/ */
/*                                                       */
/* Distributed under the GNU General Public License      */
/* http://www.gnu.org/copyleft/gpl.html                  */
/*********************************************************/

/*********************************************************/
/* Features:                                             */
/* - CREATE [OR REPLACE] TABLE                           */
/* - CREATE [OR REPLACE] VIEW                            */
/* - DROP TABLE                                          */
/* - DROP VIEW                                           */
/* - INSERT INTO ... VALUES ...                          */
/* - INSERT INTO ... SQL                                 */
/* - DELETE FROM ... [WHERE ...]                         */
/* - Subqueries defining relations                       */
/* - Relation and attribute autorenaming                 */
/* - Correlated subqueries in EXISTS and IN conditions   */
/* - UNION, INTERSECT, EXCEPT|MINUS                      */ 
/* - WITH for recursive views                            */
/* - Projection list wildcards: Relation.*, *            */
/* - Subqueries in comparisons (=, <, >, ...)            */
/* - Expressions in projection list                      */ 
/* - NULL values and outer joins following SQL-2 standard*/
/* - Aggregate functions in projection list and having   */
/*   condition                                           */
/* - GROUP BY clauses                                    */
/* - FROM-less statements for computing expressions      */
/* - Multiset answers: Enable duplicates with command    */
/*********************************************************/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SQL Grammar for Valid SQL statements:
% Here, terminal symbols are: parentheses, commas, semicolons, 
% single dots, asterisks, and apostrophes.
% Other terminal symbols are written in capitals.
% The notation T,...,T means one or more occurrences of T, comma-separated
% The notation T ... T means one or more occurrences of T, blank-separated

% CAVEAT: Computable SQL statements follow the grammar in the manual.
%         The following grammar parses extra features which cannot
%         be computed yet (all, order by, ...)

% SQLstmt ::=
%   DDLstmt[;]
%   |
%   DMLstmt[;]
%   |
%   DQLstmt[;]
%   |
%   ISLstmt[;]

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % DDL (Data Definition Language) statements
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DDLstmt ::=
%   CREATE [OR REPLACE] TABLE CompleteConstrainedSchema
%   |
%   CREATE [OR REPLACE] TABLE TableName LIKE TableName
%   |
%   CREATE [OR REPLACE] VIEW ViewSchema AS DQLstmt
%   |
%   RENAME TABLE TableName TO TableName
%   |
%   RENAME VIEW ViewName TO ViewName
%   |
%   DROP TABLE [IF EXISTS] TableName,...,TableName % Extended syntax following MySQL 5.6
%   |
%   DROP VIEW ViewName
%   |
%   DROP DATABASE
%   
% Schema ::=
%   RelationName
%   |
%   RelationName(Att,...,Att)
%   
% CompleteConstrainedSchema ::=
%   RelationName(Att Type [ColumnConstraint ... ColumnConstraint],...,Att Type [ColumnConstraint ... ColumnConstraint] [, TableConstraints])
%   
% CompleteSchema ::=
%   RelationName(Att Type,...,Att Type)

% Type ::=
%   CHAR(n)  % fixed-length string of n characters
%   |
% %   CHARACTER(n)  % equivalent to the former
% %   |
%   CHAR  % fixed-length string of 1 character
%   |
%   VARCHAR(n)  % variable-length string of up to n characters
%   |
%   VARCHAR2(n)  % Oracle's variable-length string of up to n characters
%   |
%   VARCHAR  % variable-length string of up to the maximum length of the underlying Prolog atom
%   |
%   STRING  % As VARCHAR
%   |
% %   CHARACTER VARYING(n)  % equivalent to the former
% %   |
%   INT
%   |
%   INTEGER  % equivalent to the former
%   |
% %   SMALLINT
% %   |
% %   NUMERIC(p,d) % a total of p digits, where d of those are in the decimal place
% %   |
%   REAL
%   |
% %   DOUBLE PRECISION  % equivalent to the former
% %   |
% %   FLOAT(n)  % with precision of at least n digits
% %   |
% %   DATE % four digit year, month and day
% %   |
% %   TIME % hours, minutes and seconds
% %   | 
% %   TIMESTAMP % combination of date and time


% ColumnConstraint ::=
%   NOT NULL
%   |
%   PRIMARY KEY
%   |
%   UNIQUE
%   |
%   CANDIDATE KEY
%   |
%   REFERENCES TableName[(Att)]
%   
% TableConstraints ::=
%   TableConstraint,...,TableConstraint

% TableConstraint ::=
%   UNIQUE (Att,...,Att)
%   |
%   CANDIDATE KEY (Att,...,Att)
%   |
%   PRIMARY KEY (Att,...,Att)
%   |
%   FOREIGN KEY (Att,...,Att) REFERENCES TableName[(Att,...,Att)]
%   
% RelationName is a user identifier for naming tables, views and aliases
% TableName is a user identifier for naming tables
% ViewName is a user identifier for naming views
% Att is a user identifier for naming relation attributes

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % DML (Data Manipulation Language) statements
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DMLstmt ::=
%   INSERT INTO TableName[(Att,...,Att)] VALUES (Cte,...,Cte)
%   |
%   INSERT INTO TableName[(Att,...,Att)] DQLstmt
%   |
%   DELETE FROM TableName
%   |
%   DELETE FROM TableName WHERE Condition
%   |
%   UPDATE TableName SET Att1=Expr1,...,Attn=Exprn WHERE Condition

% Cte is a constant

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % DQL (Data Query Language) statements:
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% DQLstmt ::=
%   (DQLstmt) 
%   |
%   UBSQL

% UBSQL ::= 
%   SELECTstmt
%   |
%   DQLstmt UNION [ALL] DQLstmt
%   |
%   DQLstmt EXCEPT DQLstmt
%   |
%   DQLstmt MINUS DQLstmt
%   |
%   DQLstmt INTERSECT DQLstmt
%   |
%   WITH LocalViewDefinition,...,LocalViewDefinition DQLstmt
%   |
%   ASSUME LocalAssumption,...,LocalAssumption DQLstmt

% LocalViewDefinition ::=
%   [RECURSIVE] CompleteSchema AS DQLstmt

% LocalAssumption ::=
%   DQLstmt IN CompleteSchema

% SELECTstmt ::=
%   SELECT [TOP Integer] [[ALL|DISTINCT]] SelectExpressionList
%   [FROM Rels
%    [WHERE WhereCondition]
%    [GROUP BY Atts]
%    [HAVING HavingCondition]
%    [ORDER BY OrderDescription]
%    [FETCH FIRST Integer ROWS ONLY]]

% Atts ::=
%   Att,...,Att

% OrderDescription ::=
%   Att [[ASC|DESC]],...,Att [[ASC|DESC]]

% SelectExpressionList ::= 
%   *
%   |
%   SelectExpression,...,SelectExpression

% SelectExpression ::=
%   UnrenamedSelectExpression
%   |
%   RenamedExpression

% UnrenamedSelectExpression ::=
%   Att
%   |
%   RelationName.Att
%   |
%   RelationName.*
%   |
%   ArithmeticExpression 
%   |
%   DQLstmt 

% RenamedExpression ::=
%   UnrenamedExpression [AS] Identifier

% ArithmeticExpression ::=
%   Op1 ArithmeticExpression
%   |
%   ArithmeticExpression Op2 ArithmeticExpression
%   |
%   ArithmeticFunction(ArithmeticExpression,...,
%                      ArithmeticExpression)
%   |
%   Number
%   |
%   Att
%   |
%   RelationName.Att
%   |
%   ArithmeticConstant
%   |
%   DQLstmt

% Op1 ::=
%   - | \ 

% Op2 ::=
%   ^ | ** | * | / | // | rem | \/ | # | + | - | /\ | << | >> 

% ArithmeticFunction ::=
%     sqrt/1 | ln/1 | log/1 | log/2 | sin/1 | cos/1 | tan/1 | cot/1
%   | asin/1 | acos/1 | atan/1 | acot/1 | abs/1 | float/1 
%   | integer/1 | sign/1 | gcd/2 | min/2 | max/2 | truncate/1 
%   | float_integer_part/1 | float_fractional_part/1 
%   | round/1 | floor/1 | ceiling/1

% Aggregate Functions:
% The argument may include a prefix "distinct" for all but "min" and "max":
%   avg/1 | count/1 | count/0 | max/1 | min/1 | sum/1 | times/1

% ArithmeticConstant ::=
%   pi | e

% Rels ::=
%   Rel,...,Rel

% Rel ::=
%   UnrenamedRel
%   |
%   RenamedRel

% UnrenamedRel ::=
%   TableName
%   |
%   ViewName
%   |
%   DQLstmt
%   |
%   JoinRel

% RenamedRel ::=
%   UnrenamedRel [AS] Identifier

% JoinRel ::=
%   Rel [NATURAL] JoinOp Rel [JoinCondition]

% JoinOp ::=
%   INNER JOIN
%   |
%   LEFT [OUTER] JOIN
%   |
%   RIGHT [OUTER] JOIN
%   |
%   FULL [OUTER] JOIN

% JoinCondition ::=
%   ON WhereCondition
%   |
%   USING (Atts)

% WhereCondition ::=
%   BWhereCondition
%   |
%   UBWhereCondition

% HavingCondition 
%   As WhereCondition, but including aggregate functions

% BWhereCondition ::=
%   (WhereCondition)

% UBWhereCondition ::=
%   TRUE
%   |
%   FALSE
%   |
%   EXISTS DQLstmt
%   |
%   NOT (WhereCondition)
%   |
%   (AttOrCte,...,AttOrCte) [NOT] IN DQLstmt
%   |
%   WhereExpression IS [NOT] NULL
%   |
%   WhereExpression [NOT] IN DQLstmt
%   |
%   WhereExpression Operator [[ALL|ANY]] WhereExpression 
%   |
%   WhereCondition [AND|OR] WhereCondition

% WhereExpression ::=
%   Att
%   |
%   Cte
%   |
%   ArithmeticExpression
%   |
%   DQLstmt

% AggrArithmeticExpression ::=
%   [AVG|MIN|MAX|SUM]([DISTINCT] Att)
%   |
%   COUNT([*|Att])

% AttOrCte ::=
%   Att 
%   |
%   Cte

% Operator ::=
%   = | <> | < | > | >= | <= 

% Cte ::=
%   Number
%   |
%   'String'
%   |
%   NULL

% Number is an integer or floating-point number

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ISL (Information Schema Language) statements
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ISLstmt ::=
%   SHOW TABLES
%   |
%   SHOW VIEWS
%   |
%   SHOW DATABASES
%   |
%   DESCRIBE [TableName|ViewName]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RDB external data sources via ODBC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Enabling external data sources amounts to add a datalog clause with body
% This body is responsible of providing tuples from the external DBMS

% datalog(Rule,NVs,RuleId,Lines,FileId,source)
enable_rdb_datasource :-
  current_db(Connection,_Handle),
  !,
  RDBDS = ':-'(    datalog(Rule,[],RuleId,[],rdb(Connection),source),
               datalog_rdb(Rule,[],RuleId,[],rdb(Connection),source)),
  (Connection\=='$des' ->
    (retract(RDBDS) -> true ; true),
    assertz(RDBDS)
   ;
    true).
enable_rdb_datasource.

% Disabling external data sources simply amounts to remove the datalog clause providing external tuples
disable_rdb_datasource(Connection) :-
  RDBDS = ':-'(    datalog(Rule,[],RuleId,[],rdb(Connection),source),
               datalog_rdb(Rule,[],RuleId,[],rdb(Connection),source)),
  retract(RDBDS).

% Data source for a single table/view
datalog_rdb(R,[],RuleId,[],rdb(Connection),source) :-
  nonvar(R),
  !,
  R \= ':-'(_H,_T),
  current_db(Connection,_Handle),
  Connection\=='$des',
  R=..[TableName|Columns],
  length(Columns,Arity),
  my_odbc_get_table_arity(TableName,Arity),
  prepare_rdb_ruleid(TableName),
  build_sql_rdb_datasource(TableName,Columns,SQLstr),
  my_odbc_dql_query_fetch_row(SQLstr,Row),
  Row=..[_AnswerRel|Columns],
  get_rdb_ruleid(TableName,RuleId).
%,nl,write(R),nl,write(RuleId),nl.
% Data source for all the tables in the RDB
datalog_rdb(R,[],RuleId,[],rdb(Connection),source) :-
  current_db(Connection,_Handle),
  Connection\=='$des',
  my_odbc_get_table_and_view_names(TableNames),
  my_member(TableName,TableNames),
  my_odbc_get_table_arity(TableName,Arity),
  length(Columns,Arity),
  R=..[TableName|Columns],
  length(Columns,Arity),
  datalog_rdb(R,[],RuleId,[],rdb(Connection),source).

prepare_rdb_ruleid(TableName) :-
  retractall(rdb_id(TableName,_)),
  assertz(rdb_id(TableName,0)).
  
get_rdb_ruleid(TableName,RuleId) :-
  retract(rdb_id(TableName,OID)),
  ID is OID+1,
  RuleId=rdb_id(TableName,ID),
  assertz(RuleId).
  
build_sql_rdb_datasource(TableName,Columns,SQLstr) :-
  my_odbc_get_colnames(TableName,Colnames),
  build_where_cond(Columns,Colnames,[],CondStr),
  name(TableName,StrTableName),
  my_odbc_get_dbms(DBMS),
  my_sql_left_quotation_mark(LQstr,DBMS),
  my_sql_right_quotation_mark(RQstr,DBMS),
  concat_lists(["SELECT * FROM ",LQstr,StrTableName,RQstr],SQLstr1),
  (CondStr=="TRUE" ->
    SQLstr=SQLstr1
   ;
    concat_lists([SQLstr1," WHERE ",CondStr],SQLstr)
  ).

build_where_cond([],[],ICondStr,OCondStr) :-
  append(ICondStr,"TRUE",OCondStr).  
build_where_cond([Col],[Name],ICondStr,OCondStr) :-
  nonvar(Col),
  !,
  name(Col,ColStr),
  (atom(Col)-> concat_lists(["'",ColStr,"'"],ValStr) ; ValStr=ColStr),
  name(Name,NameStr),
  concat_lists([ICondStr,NameStr,"=",ValStr],OCondStr).  
build_where_cond([Col,Col1|Cols],[Name,Name1|Names],ICondStr,OCondStr) :-
  nonvar(Col),
  !,
  build_where_cond([Col],[Name],ICondStr,T1CondStr),
  append(T1CondStr," AND ",T2CondStr),
  build_where_cond([Col1|Cols],[Name1|Names],T2CondStr,OCondStr).
% Aliases:
build_where_cond([Col|Cols],[Name|Names],ICondStr,OCondStr) :-
  find_var_colname(Col,Cols,Names,AName),
  !,
  name(Name,NameStr),
  name(AName,ANameStr),
  concat_lists([ICondStr,NameStr,"=",ANameStr],T1CondStr),  
  append(T1CondStr," AND ",T2CondStr),
  build_where_cond(Cols,Names,T2CondStr,OCondStr).
build_where_cond([_Col|Cols],[_Name|Names],ICondStr,OCondStr) :-
  build_where_cond(Cols,Names,ICondStr,OCondStr).
  
find_var_colname(Col,[Col1|_Cols],[Name|_Names],Name) :-
  Col==Col1,
  !.
find_var_colname(Col,[_Col1|Cols],[_Name|Names],Name) :-
  find_var_colname(Col,Cols,Names,Name).
  
  
% DBMS Identifier
% Either '$des' or the ODBC DBMS 
get_dbms('$des') :-
  current_db('$des',_Connection),
  !.
get_dbms(DBMS) :-
  my_odbc_get_dbms(DBMS).
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Database Schema
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% my_table(DB,RelationName,Arity)
:- dynamic(my_table/3).
% my_view(DB,RelationName,Arity,QuerySyntacticTree,Language,DatalogRules,CompiledRulesId,LocalViewDefinitions,StringConstants)
:- dynamic(my_view/9).
% my_attribute(DB,Position,RelationName,AttributeName,DataType)
:- dynamic(my_attribute/5).
% my_not_nullables(DB,TableName,AttributeNames)
:- dynamic(my_not_nullables/3).
% my_primary_key(DB,TableName,AttributeNames)
:- dynamic(my_primary_key/3).
% my_candidate_key(DB,TableName,AttributeNames)
:- dynamic(my_candidate_key/3).
% my_foreign_key(DB,TableName,AttributeNames,ForeignTableName,ForeignAttributeNames)
:- dynamic(my_foreign_key/5).
% my_functional_dependency(DB,TableName,AttributeNames,DependentAttributeNames)
:- dynamic(my_functional_dependency/4).
% my_integrity_constraint(DB,Predicates,Constraint,NVs,Rule)
:- dynamic(my_integrity_constraint/5).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predefined 'dual' table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_table('$des',dual,0).
%my_attribute('$des',dual,void,void).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parse_sql_query(SQLst). Parses a SQL string and gets its 
%   syntactic tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parse_sql_query(SQLst) -->
  {retractall(dictionary(_)),
   assertz(dictionary([]))}, % WARNING: ONLY FOR TEST CASE GENERATION
  my_sql_blanks_star, 
  my_SQL(SQLst),
  my_sql_blanks_star, 
  my_optional(";"), 
%  my_sql_blanks_star,
  !.  

% DQL Statement
my_SQL(SQLst) -->
  my_DQL(SQLst).
% DML Statement
my_SQL(SQLst) -->
  my_DML(SQLst).
% DDL Statement
my_SQL(SQLst) -->
  my_DDL(SQLst).
% ISL Statement
my_SQL(SQLst) -->
  my_ISL(SQLst).

% DDL Statements
% CREATE TABLE
my_DDL(CRTSchema) -->
  my_create_or_replace(CR),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks,
  my_complete_constrained_typed_schema(Schema,Ctrs),
  {atom_concat(CR,'_table',CRT),
   CRTSchema=..[CRT,Schema,Ctrs]}.
   
% CREATE TABLE
my_DDL(CRTSchema) -->
  my_create_or_replace(CR),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks,
  my_optional("("),
  my_sql_blanks_star,
  my_sql_user_identifier(TableName),
  my_sql_blanks,
  my_kw("LIKE"),
  my_sql_blanks,
  my_sql_user_identifier(ExistingTableName),
  my_sql_blanks_star,
  my_optional(")"),
  {atom_concat(CR,'_table_like',CRT),
   CRTSchema=..[CRT,TableName,ExistingTableName]}.
   
% RENAME TABLE
my_DDL(rename_table(TableName,NewTableName)) -->
  my_kw("RENAME"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks,
  my_sql_user_identifier(TableName),
  my_sql_blanks,
  my_kw("TO"),
  my_sql_blanks,
  my_sql_user_identifier(NewTableName).

% RENAME VIEW
my_DDL(rename_view(Viewname,NewViewname)) -->
  my_kw("RENAME"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks,
  my_sql_user_identifier(Viewname),
  my_sql_blanks,
  my_kw("TO"),
  my_sql_blanks,
  my_sql_user_identifier(NewViewname).

% CREATE VIEW
my_DDL(CRVSchema) -->
  my_create_or_replace(CR),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks,
  my_create_view_schema(Schema),
  my_sql_blanks,
  my_kw("AS"),
  my_sql_blanks,
  my_DQL((LSQLst,Schema)),
  {atom_concat(CR,'_view',CRVF),
   CRVSchema =.. [CRVF,sql,(LSQLst,_AS),Schema]}.
% my_DDL(CRVSchema) -->
%   my_create_or_replace(CR),
%   my_sql_blanks,
%   my_kw("VIEW"),
%   my_sql_blanks,
%   my_sql_user_identifier(_Name),
%   my_sql_blanks,
%   my_kw("AS"),
%   my_sql_blanks,
%   my_DQL((LSQLst,Schema)),
% %  {Schema=..[Name|_]}, % The schema should be built, but this information in not yet known
%   {atom_concat(CR,'_view',CRVF),
%    CRVSchema =.. [CRVF,(LSQLst,_AS),Schema]}.

% DROP TABLE
my_DDL(drop_table(Names,IfExists)) -->
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks,
  my_optional_if_exists(IfExists),
  my_sql_blanks_star,
  my_sql_user_identifier_tuple(Names).

% DROP VIEW
my_DDL(drop_view(Name)) -->
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks,
  my_sql_user_identifier(Name).

% DROP SCHEMA
my_DDL(drop_database) -->
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("DATABASE").

my_optional_if_exists(false) -->
  [].
my_optional_if_exists(true) -->
  my_kw("IF "),
  my_sql_blanks_star,
  my_kw("EXISTS ").

my_create_or_replace(create_or_replace) -->
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("OR"),
  my_sql_blanks,
  my_kw("REPLACE").
my_create_or_replace(create) -->
  my_kw("CREATE").

my_create_view_schema(Schema) -->
  my_complete_untyped_schema(Schema),
  {!}.
my_create_view_schema(Name) -->
  my_sql_user_identifier(Name).

  
my_complete_untyped_schema(Schema) -->
  my_sql_user_identifier(Name),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_untyped_columns(Cs),
  my_sql_blanks_star,
  ")",
  {Schema =.. [Name|Cs]}.

my_column_name_list([C]) --> 
  my_untyped_column(C).
my_column_name_list([C|Cs]) -->
  my_untyped_column(C),
  my_sql_blanks_star, 
  ",", 
  my_sql_blanks_star, 
  my_column_name_list(Cs).
 
my_untyped_columns([C:_T]) --> 
  my_untyped_column(C).
my_untyped_columns([C:_T|CTs]) -->
  my_untyped_column(C),
  my_sql_blanks_star, 
  ",", 
  my_sql_blanks_star, 
  my_untyped_columns(CTs).
 
my_untyped_column(C) --> 
  my_sql_user_identifier(C).

my_sql_user_identifier_tuple([C]) --> 
  my_sql_user_identifier(C).
my_sql_user_identifier_tuple([C|Cs]) -->
  my_sql_user_identifier(C),
  my_sql_blanks_star, 
  ",", 
  my_sql_blanks_star, 
  my_sql_user_identifier_tuple(Cs).

my_complete_constrained_typed_schema(Schema,Ctrs) -->
  my_sql_user_identifier(Name),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_constrained_typed_columns(Cs,CCtrs),
  my_sql_blanks_star,
  my_optional_table_constraints(TCtrs),
  my_sql_blanks_star,
  ")",
  {Schema =.. [Name|Cs],
   append(CCtrs,TCtrs,Ctrs)}.

my_constrained_typed_columns([C:T],Ctrs) --> 
  my_constrained_typed_column(C:T,Ctrs).
my_constrained_typed_columns([C:T|CTs],Ctrs) -->
  my_constrained_typed_column(C:T,CCtrs),
  my_sql_blanks_star, 
  ",", 
  my_sql_blanks_star, 
  my_constrained_typed_columns(CTs,RCtrs),
  {append(CCtrs,RCtrs,Ctrs)}.

my_constrained_typed_column(C:T,Ctrs) --> 
  my_sql_user_identifier(C),
  my_sql_blanks,
  my_sql_type(T),
  my_sql_blanks,
  my_column_constraints(C,Ctrs).
my_constrained_typed_column(C:T,[true]) --> 
  my_sql_user_identifier(C),
  my_sql_blanks,
  my_sql_type(T).

my_column_constraints(C,[Ctr]) -->
  my_column_constraint(C,Ctr).
my_column_constraints(C,[Ctr|Ctrs]) -->
  my_column_constraint(C,Ctr),
  my_sql_blanks,
  my_column_constraints(C,Ctrs).

my_column_constraint(C,not_nullables([C])) -->
  my_kw("NOT"),
  my_sql_blanks,
  my_kw("NULL").
my_column_constraint(C,primary_key([C])) -->
  my_kw("PRIMARY"),
  my_sql_blanks,
  my_kw("KEY").
my_column_constraint(C,candidate_key([C])) -->
  my_kw("UNIQUE").
my_column_constraint(C,candidate_key([C])) -->
  my_kw("CANDIDATE"),
  my_sql_blanks,
  my_kw("KEY").
my_column_constraint(C,foreign_key([C],TableName,[Att])) -->
  my_kw("REFERENCES"),
  my_sql_blanks,
  my_sql_user_identifier(TableName),
  my_sql_blanks_star, 
  "(",
  my_sql_blanks_star,
  my_untyped_column(Att),
  my_sql_blanks_star,
  ")".
my_column_constraint(C,foreign_key([C],TableName,[C])) -->
  my_kw("REFERENCES"),
  my_sql_blanks,
  my_sql_user_identifier(TableName).
my_column_constraint(C,default(C,Value)) -->
  my_kw("DEFAULT"),
  my_sql_blanks,
  my_sql_constant(Value).

my_optional_table_constraints(Ctrs) -->
  ",",
  my_sql_blanks_star,
  my_table_constraints(Ctrs).
my_optional_table_constraints([]) -->
  [].
  
my_table_constraints([Ctr]) -->
  my_table_constraint(Ctr).  
my_table_constraints([Ctr|Ctrs]) -->
  my_table_constraint(Ctr),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_table_constraints(Ctrs).  

my_table_constraint(primary_key(Cs)) -->
  my_kw("PRIMARY"),
  my_sql_blanks,
  my_kw("KEY"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Cs),
  my_sql_blanks_star,
  ")".
my_table_constraint(candidate_key(Cs)) -->
  my_kw("CANDIDATE"),
  my_sql_blanks,
  my_kw("KEY"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Cs),
  my_sql_blanks_star,
  ")".
my_table_constraint(candidate_key(Cs)) -->
  my_kw("UNIQUE"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Cs),
  my_sql_blanks_star,
  ")".
my_table_constraint(foreign_key(Cs,FTableName,FCs)) -->
  my_kw("FOREIGN"),
  my_sql_blanks,
  my_kw("KEY"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Cs),
  my_sql_blanks_star,
  ")",
  my_sql_blanks_star,
  my_kw("REFERENCES"),
  my_sql_blanks,
  my_sql_user_identifier(FTableName),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(FCs),
  my_sql_blanks_star,
  ")".
my_table_constraint(foreign_key(Cs,FTableName,Cs)) -->
  my_kw("FOREIGN"),
  my_sql_blanks,
  my_kw("KEY"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Cs),
  my_sql_blanks_star,
  ")",
  my_sql_blanks_star,
  my_kw("REFERENCES"),
  my_sql_blanks,
  my_sql_user_identifier(FTableName).
  
% Types
% char(n)
my_sql_type(string(char(N))) -->
  my_kw("CHAR"), 
  my_sql_blanks_star, 
  "(",
  my_sql_blanks_star, 
  my_positive_integer(N),
  my_sql_blanks_star, 
  ")".
% char  
my_sql_type(string(char(1))) -->
  my_kw("CHAR").
% varchar(n)
my_sql_type(string(varchar(N))) -->
  my_kw("VARCHAR"), 
  my_sql_blanks_star, 
  "(",
  my_sql_blanks_star, 
  my_positive_integer(N),
  my_sql_blanks_star, 
  ")".
my_sql_type(string(varchar(N))) -->
  my_kw("VARCHAR2"), 
  my_sql_blanks_star, 
  "(",
  my_sql_blanks_star, 
  my_positive_integer(N),
  my_sql_blanks_star, 
  ")".
my_sql_type(string(varchar)) -->
  my_kw("VARCHAR"). 
my_sql_type(string(varchar)) -->
  my_kw("STRING"). 
% integer
my_sql_type(number(integer)) -->
  my_kw("INTEGER"),
  my_optional_integer_range(_).
% int
my_sql_type(number(integer)) -->
  my_kw("INT"),
  my_optional_integer_range(_).
% real
my_sql_type(number(float)) -->
  my_kw("REAL").
  
my_optional_integer_range(R) -->
  my_sql_blanks_star,
  "(",
  my_positive_integer(R),
  ")".
my_optional_integer_range(_R) -->
  [].

% DML Statements
% DELETE FROM 
my_DML(delete_from(TableName,true)) -->
  my_kw("DELETE"),
  my_sql_blanks,
  my_kw("FROM"),
  my_sql_blanks,
  my_tablename(TableName).
% DELETE FROM ... WHERE 
my_DML(delete_from(TableName,Condition)) -->
  my_kw("DELETE"),
  my_sql_blanks,
  my_kw("FROM"),
  my_sql_blanks,
  my_tablename(TableName),
  my_sql_blanks,
  my_kw("WHERE"),
  my_sql_blanks,
  my_where_condition(Condition).

% INSERT INTO Table [VALUES(...) | SQL]
my_DML(insert_into(TableName,Colnames,Vs)) -->
  my_kw("INSERT"),
  my_sql_blanks,
  my_kw("INTO"),
  my_sql_blanks,
  my_tablename(TableName),
  my_sql_blanks,
  my_insert_values_sql(Vs),
  {get_table_untyped_arguments(TableName,Colnames)}.
% INSERT INTO Table(Columns) [VALUES(...) | SQL]
my_DML(insert_into(TableName,Colnames,Vs)) -->
  my_kw("INSERT"),
  my_sql_blanks,
  my_kw("INTO"),
  my_sql_blanks,
  my_tablename(TableName),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_column_name_list(Colnames),
  my_sql_blanks_star,
  ")",
  my_sql_blanks,
  my_insert_values_sql(Vs).

% UPDATE ... SET ... [WHERE ]
my_DML(update(TableName,Assignments,true)) -->
  my_kw("UPDATE"),
  my_sql_blanks,
  my_tablename(TableName),
  my_sql_blanks,
  my_kw("SET"),
  my_sql_blanks,
  my_update_assignments(Assignments).
my_DML(update(TableName,Assignments,Condition)) -->
  my_kw("UPDATE"),
  my_sql_blanks,
  my_tablename(TableName),
  my_sql_blanks,
  my_kw("SET"),
  my_sql_blanks,
  my_update_assignments(Assignments),
  my_sql_blanks,
  my_kw("WHERE"),
  my_sql_blanks,
  my_where_condition(Condition).
  
my_update_assignments([Column,Expression]) -->
  my_update_assignment(Column,Expression).
my_update_assignments([Column,Expression|Assignments]) -->
  my_update_assignment(Column,Expression),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_update_assignments(Assignments).

my_update_assignment(expr(ColumnName,_,string),Expression) -->
  my_column(attr(_T,ColumnName,_AS)),
  my_sql_blanks_star,
  "=",
  my_sql_blanks_star,
  my_sql_proj_expression(Expression,_Type).
  
my_insert_values_sql(Cs) -->
  my_kw("VALUES"),
  {!},
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_sql_constants(Cs),
  my_sql_blanks_star,
  ")".
my_insert_values_sql(SQLst) -->
  my_DQL(SQLst).

build_complete_values(TableName,Arity,Colnames,IVs,Vs,Error) :-
  length(Vs,Arity),
  length(IVs,Nbr_values),
  (length(Colnames,Nbr_values)
   ->
   Nbr_nulls is Arity-Nbr_values,
   length(NULLs,Nbr_nulls),
   build_null_list(Nbr_nulls,NULLs),
   concrete_nulls(NULLs,NULLs,_Grounded),
   get_att_positions(TableName,Colnames,Positions),
   replace_positions(Positions,IVs,Vs,Vs),
   list_between(1,Arity,AllPositions),
   my_set_diff(AllPositions,Positions,NullPositions),
   replace_positions(NullPositions,NULLs,Vs,Vs)
   ;
   write_error_log(['Incorrect number of values (must be ',Arity,').']),
   Error=true
  ).
  

% DQL Statements
my_DQL(SQLst) -->
  my_b_DQL(SQLst).
my_DQL(SQLst) -->
  my_ub_DQL(SQLst).
 
my_b_DQL(SQLst) -->
  "(",
  my_sql_blanks_star,
  my_DQL(SQLst),
  my_sql_blanks_star,
  ")".
  
% ASSUME
% my_ub_DQL((with(SQLst,[(ASQLst,Schema)]),_AS)) -->
%   my_kw("ASSUME"),
%   my_sql_blanks,
%   {!},
%   my_DQL((ASQLst,Schema)),
%   my_sql_blanks,
%   my_kw("IN"),
%   my_sql_blanks,
%   my_complete_untyped_schema(Schema),
%   my_sql_blanks,
%   my_DQL(SQLst).
my_ub_DQL((with(SQLst,SQLsts),_AS)) -->
  my_kw("ASSUME"),
  my_sql_blanks,
  {!},
  my_assume_list(SQLsts),
  my_sql_blanks,
%  my_DQL(SQLst).
  my_DQL(SQLst),
  {allowed_with_schemas(SQLsts)}.
% WITH
my_ub_DQL((with(SQLst,SQLsts),_AS)) -->
  my_kw("WITH"),
  my_sql_blanks,
  {!},
  my_local_view_definition_list(SQLsts),
  my_sql_blanks,
%  my_DQL(SQLst).
  my_DQL(SQLst),
  {allowed_with_schemas(SQLsts)}.
% SELECT
my_ub_DQL(SQLst) -->
  my_select_DQL(SQLst).
% UNION
my_ub_DQL((union(D,R1,R2),_AS)) -->
  my_b_DQL(R1),
  my_sql_blanks,
  my_union_stmt(D),
  my_DQL(R2).
my_ub_DQL((union(D,R1,R2),_AS)) -->
  my_select_DQL(R1),
  {deb},
  my_sql_blanks,
  my_union_stmt(D),
  my_DQL(R2).
% EXCEPT
my_ub_DQL((except(_D,R1,R2),_AS)) -->
  my_b_DQL(R1),
  my_sql_blanks,
  my_set_difference_kw, % EXCEPT or MINUS
  my_sql_blanks,
  my_DQL(R2).
my_ub_DQL((except(_D,R1,R2),_AS)) -->
  my_select_DQL(R1),
  my_sql_blanks,
  my_set_difference_kw, % EXCEPT or MINUS
  my_sql_blanks,
  my_DQL(R2).
% INTERSECT
my_ub_DQL((intersect(_D,R1,R2),_AS)) -->
  my_b_DQL(R1),
  my_sql_blanks,
  my_kw("INTERSECT"),
  my_sql_blanks,
  my_DQL(R2).
my_ub_DQL((intersect(_D,R1,R2),_AS)) -->
  my_select_DQL(R1),
  my_sql_blanks,
  my_kw("INTERSECT"),
  my_sql_blanks,
  my_DQL(R2).

allowed_with_schemas([]).
allowed_with_schemas([(_,S)|Schemas]) :-
  (member((_,S),Schemas)
   ->
    typed_schema_to_untyped_schema(S,US),
    my_raise_exception(generic,syntax(['Repeated schema: ',US]),[])
   ;
    (S==dual
     ->
      my_raise_exception(generic,syntax(['Cannot redefine built-in dual.']),[])
     ;
      allowed_with_schemas(Schemas)
    )
  ).


my_set_difference_kw -->
  my_kw("EXCEPT").
my_set_difference_kw -->
  my_kw("MINUS").
  
% Local view definitions in WITH
my_local_view_definition_list([V]) -->
  my_local_view_definition(V).
my_local_view_definition_list([V|Vs]) -->
  my_local_view_definition(V),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_local_view_definition_list(Vs).

my_local_view_definition((SQLst,Schema)) -->
  my_optional("RECURSIVE "),
%  my_complete_untyped_schema(Schema),
  my_create_view_schema(Schema),
  my_sql_blanks,
  my_kw("AS"),
  my_sql_blanks,
  my_DQL((SQLst,Schema)).

% Atoms and clauses assumed in ASSUME
my_assume_list([V]) -->
  my_assume(V).
my_assume_list([V|Vs]) -->
  my_assume(V),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_assume_list(Vs).

my_assume((SQLst,Schema)) -->
  my_DQL((SQLst,Schema)),
  my_sql_blanks,
  my_kw("IN"),
  my_sql_blanks,
  my_complete_untyped_schema(Schema),
  {!}.
my_assume((SQLst,Schema)) -->
  my_DQL((SQLst,Schema)),
  my_sql_blanks,
  my_kw("IN"),
  my_sql_blanks,
  my_sql_user_identifier(Name),
  {get_table_typed_schema(Name,Schema)}.

my_optional(KW) -->
  my_kw(KW),
  my_sql_blanks_star.
my_optional(_KW) -->
  [].

% SELECT
my_select_DQL((select(DistinctAll,TopN,ProjList,
               from(Relations),
               where(WhereCondition),
               group_by(GroupList),
               having(HavingCondition),
               order_by(OrderArgs,OrderSpecs)),_AS)) -->
  my_select_stmt(DistinctAll,TopN),
  my_projection_list(ProjList),
  my_sql_blanks,
  my_kw("FROM "),
  {!},
  my_sql_blanks_star,
  my_relations(Relations),
  my_where_clause(WhereCondition),
  my_group_by_clause(GroupList),
  my_having_clause(HavingCondition),
  my_order_by_clause(OrderArgs,OrderSpecs),
  my_optional_fetch_first(TopN),
  {set_topN_default(TopN)}.
% FROM-less SELECT
my_select_DQL((select(DistinctAll,TopN,ProjList,
               from([(dual,_Ren)]),
               where(true),
               group_by([]),
               having(true),
               order_by([],[])),_AS)) -->
  my_select_stmt(DistinctAll,TopN),
  my_projection_list(ProjList),
  {set_topN_default(TopN)}.


set_topN_default(top(all)) :-
  !.
set_topN_default(top(_N)).
  
my_where_clause(WhereCondition) -->
  my_sql_blanks,
  my_kw("WHERE"),
  my_sql_blanks,
  {!},
  my_where_condition(WhereCondition).
my_where_clause(true) -->
  [].

my_group_by_clause(GroupList) -->
  my_sql_blanks,
  my_kw("GROUP"),
  my_sql_blanks,
  my_kw("BY"),
  my_sql_blanks,
  {!},
  my_column_list(GroupList).
my_group_by_clause([]) -->
  [].

my_having_clause(HavingCondition) -->
  my_sql_blanks,
  my_kw("HAVING"),
  my_sql_blanks,
  {!},
  my_having_condition(HavingCondition).
my_having_clause(true) -->
  [].

my_order_by_clause(OrderArgs,OrderSpecs) -->
  my_sql_blanks,
  my_kw("ORDER"),
  my_sql_blanks,
  my_kw("BY"),
  my_sql_blanks,
  {!},
  my_order_list(OrderArgs,OrderSpecs).
my_order_by_clause([],[]) -->
  [].
  
my_optional_fetch_first(top(N)) -->
  my_sql_blanks,
  my_kw("FETCH"),
  my_sql_blanks,
  {!},
  my_kw("FIRST"),
  my_sql_blanks,
  my_integer(N),
  my_sql_blanks,
  my_kw("ROWS"),
  my_sql_blanks,
  my_kw("ONLY").
my_optional_fetch_first(top(_N)) -->
  [].

% my_select_stmt(all,top(all)) -->
%   my_kw("SELECT ").
my_select_stmt(DistinctAll,TopN) -->
  my_kw("SELECT "),
  my_sql_blanks_star,
  my_optional_select_modifiers(DistinctAll,TopN).

% my_optional_select_modifiers(all,top(all)) -->
%   [],
%   !.
my_optional_select_modifiers(DistinctAll,TopN) -->
  my_select_distinct_all(DistinctAll),
  my_select_top_n(TopN),
  !.
my_optional_select_modifiers(DistinctAll,TopN) -->
  my_select_top_n(TopN),
  my_select_distinct_all(DistinctAll),
  !.
my_optional_select_modifiers(DistinctAll,top(_N)) -->
  my_select_distinct_all(DistinctAll),
  !.
my_optional_select_modifiers(all,TopN) -->
  my_select_top_n(TopN),
  !.
my_optional_select_modifiers(all,top(_N)) -->
  my_sql_blanks_star,
  !.
    
my_select_top_n(top(N)) -->
  my_sql_blanks_star,
  my_kw("TOP "),
  my_sql_blanks_star,
  my_integer(N),
  my_blank,
  {!},
  my_sql_blanks_star.
% my_select_top_n(top(_N)) -->
%   [].

my_select_distinct_all(all) -->
  my_sql_blanks_star,
  my_kw("ALL "),
  {!},
  my_sql_blanks_star.
my_select_distinct_all(distinct) -->
  my_sql_blanks_star,
  my_kw("DISTINCT "),
  {!},
  my_sql_blanks_star.
% my_select_distinct_all(all) -->
%   [].

my_union_stmt(DistinctAll) -->
  my_kw("UNION"),
  my_sql_blanks,
  my_union_distinct_all(DistinctAll).

my_union_distinct_all(all) -->
  my_kw("ALL"),
  my_sql_blanks,
  {!}.
my_union_distinct_all(distinct) -->
  my_kw("DISTINCT"),
  my_sql_blanks,
  {!}.
my_union_distinct_all(distinct) -->
  [].

my_sql_constants([C|Cs]) -->
  my_sql_constant(C),
  my_sql_blanks_star, 
  my_remaining_sql_constants(Cs).

my_remaining_sql_constants(Cs) -->
  my_sql_blanks_star,
  ",", 
  {!},
  my_sql_blanks_star, 
  my_sql_constants(Cs).
my_remaining_sql_constants([]) -->
  [].

my_relations([R|Rs]) --> 
  my_p_ren_relation(R), 
  my_remaining_relations(Rs).

my_remaining_relations(Rs) -->
  ",", 
%  {!},   Does not work with WITH statements, where commas separate local view definitions
  my_sql_blanks_star, 
  my_relations(Rs).
my_remaining_relations([]) -->
  [].

my_p_ren_relation(R) --> 
  my_relation(R).
my_p_ren_relation(R) --> 
  my_ren_relation(R).

my_ren_relation((R,[I|Args])) -->
  my_optional_opening_parentheses(N),
  my_relation((R,[I|Args])),
  my_sql_blanks, 
  my_optional("AS "),
  my_sql_user_identifier(I),
  my_optional_closing_parentheses(N).

my_relation(R) --> 
  my_optional_opening_parentheses(N),
  my_ub_relation(R),
  my_optional_closing_parentheses(N).
  
% my_relation(R) --> 
%   my_b_relation(R).
% my_relation(R) --> 
%   my_ub_relation(R).

% my_b_relation(R) --> 
%   "(",
%   my_sql_blanks_star,
%   my_relation(R),
%   my_sql_blanks_star,
%   ")".

my_ub_relation((R,_AS)) --> 
  my_join_relation(R).
%,
%  {!}.
my_ub_relation(R) --> 
  my_non_join_relation(R).

% The following clause overrides next two clauses
my_non_join_relation((T,_)) -->
  my_sql_user_identifier(T).
% my_non_join_relation((T,_)) -->
%   my_tablename(T).
% %  , {!}. % This is commented because of SQL statements in the FROM list
% my_non_join_relation((T,_)) -->
%   my_viewname(T).
% %,  {!}.
my_non_join_relation((R,AS)) -->
  my_DQL((R,AS)).

% my_optional_as -->
%   my_kw("AS"),  
%   my_sql_blanks,
%   {!}.
% my_optional_as -->
%   [].

my_join_relation(JR,SIn,SOut) :-
  look_ahead_join_op(JOp,SIn,SOut1),
  my_list_diff(SIn,SOut1,SDiff),
  my_p_ren_relation(LR,SDiff,[]),
  my_remainder_join_relation(LR,JOp,JR,SOut1,SOut).

% look_ahead_join_op looks the input list for a join operator. 
% This way, my_ub_join_relation may fail in advance and avoid cycling
look_ahead_join_op(JOp,SIn,SOut) :-
  my_chars(_Cs,SIn,SOut),
  my_sql_blanks(SOut,SOut1),
  my_kw("NATURAL",SOut1,SOut2),
  my_sql_blanks(SOut2,SOut3),
  my_join_operator(JOp,SOut3,_SOut4).
look_ahead_join_op(JOp,SIn,SOut) :-
  my_chars(_Cs,SIn,SOut),
  my_sql_blanks(SOut,SOut1),
  my_join_operator(JOp,SOut1,_SOut2).

% L1-L2=LO LO+L2=L1
my_list_diff(L1,L2,LO) :- 
  append(LO,L2,L1).

% NATURAL
my_remainder_join_relation(LR,JOp,JR) -->
  my_sql_blanks,
  my_kw("NATURAL"),
  my_sql_blanks,
  my_join_operator(JOp),
  my_sql_blanks,
  my_p_ren_relation(RR),
  {JR =.. [JOp,LR,RR,equijoin(natural)]}.
% ON
my_remainder_join_relation(LR,JOp,JR) -->
  my_sql_blanks,
  my_join_operator(JOp),
  my_sql_blanks,
  my_p_ren_relation(RR),
  my_join_condition(Cond),
  {JR =.. [JOp,LR,RR,Cond]}.

my_join_operator(inner_join) -->
  my_kw("INNER"),
  my_sql_blanks,
  my_kw("JOIN").
my_join_operator(Outer_join) -->
  my_outer_kind(Outer_join),
  my_optional("OUTER "),
  my_kw("JOIN").

my_outer_kind(left_join) -->
  my_kw("LEFT"),
  my_sql_blanks,
  {!}.
my_outer_kind(right_join) -->
  my_kw("RIGHT"),
  my_sql_blanks,
  {!}.
my_outer_kind(full_join) -->
  my_kw("FULL"),
  my_sql_blanks.

% my_optional_outer -->
%   my_kw("OUTER"),
%   my_sql_blanks,
%   {!}.
% my_optional_outer -->
%   [].
    
my_join_condition(Condition) -->
  my_sql_blanks,
  my_kw("ON"),
  my_sql_blanks,
  {!},
  my_on_condition(Condition).
my_join_condition(equijoin(Atts)) -->
  my_sql_blanks,
  my_kw("USING"),
  my_sql_blanks_star,
  "(",
  {!},
  my_sql_blanks_star,
  my_column_list(Atts),
  my_sql_blanks_star,
  ")".
my_join_condition(true) -->
  [].

my_where_condition(C) --> 
  my_sql_condition(C).

my_on_condition(C) --> 
  my_sql_condition(C).

my_having_condition(C) --> 
  my_sql_condition(C).

% my_sql_condition(C) --> 
%   my_b_condition(C).
% %    % WARNING
% %  {!}.
% my_sql_condition(C) --> 
%   my_ub_condition(C).
my_sql_condition(E) --> 
  my_cterm(T),
  my_sql_condition_r(T,E).
%   ,
%   {!}. 
  % WARNING. Cut is used to avoid mixing conditions in a select "where" with outermost conditions as in 
  % "true and select 1 from t where true or false", which should be read as 
  % "true and (select 1 from t where true or false)", instead of
  % "true and (select 1 from t where true) or false"  
  
my_sql_condition_r(E0,E) --> 
  my_once_sql_blanks_star, 
  {my_priority_cond_operator(low,SOP,OP)}, 
  my_kw(SOP),
  my_once_sql_blanks_star, 
  my_cterm(T),
  {TOP =.. [OP,E0,T]},
  my_sql_condition_r(TOP,E).
my_sql_condition_r(E,E) -->
  [].
  
my_cterm(T) --> 
  my_cpower(P),
  my_cterm_r(P,T).
  
my_cterm_r(T0,T) --> 
  my_once_sql_blanks_star, 
  {my_priority_cond_operator(medium,SOP,OP)}, 
  my_kw(SOP),
  my_once_sql_blanks_star, 
  my_cpower(P),
  {TOP =.. [OP,T0,P]},
  my_cterm_r(TOP,T).
my_cterm_r(T,T) -->
  [].

my_cpower(P) --> 
  my_cond_factor(F),
  my_cpower_r(F,P).
  
my_cpower_r(P0,TOP) --> 
  my_once_sql_blanks_star, 
  {my_priority_cond_operator(high,SOP,OP)}, 
  my_kw(SOP), 
  my_once_sql_blanks_star, 
  my_cond_factor(P1),
  {TOP =.. [OP,P0,P]},
  my_cpower_r(P1,P).
my_cpower_r(P,P) -->
  [].
  
my_cond_factor(E) -->
  "(",
  my_once_sql_blanks_star,
  my_sql_condition(E),
  my_once_sql_blanks_star,
  ")".
my_cond_factor(true) --> 
  my_kw("TRUE").
my_cond_factor(false) --> 
  my_kw("FALSE").
my_cond_factor(not(C)) -->
  my_kw("NOT"),
  my_once_sql_blanks, 
  my_cond_factor(C).
my_cond_factor(exists(R)) --> 
  my_kw("EXISTS("),
  my_sql_blanks_star,
  my_DQL(R),
  ")".
my_cond_factor(exists(R)) --> 
  my_kw("EXISTS"),
  my_once_sql_blanks,
  my_DQL(R).
my_cond_factor(in(L,R)) --> 
  my_column_or_constant_tuple(L),
  my_sql_blanks,
  my_kw("IN"),
  my_sql_blanks,
  my_DQL(R).
my_cond_factor(not_in(L,R)) --> 
  my_column_or_constant_tuple(L),
  my_sql_blanks,
  my_kw("NOT"),
  my_sql_blanks,
  my_kw("IN"),
  my_sql_blanks,
  my_DQL(R).
my_cond_factor(C) --> 
  my_sql_expression(L,_LT), 
  my_once_sql_blanks_star, 
  my_relop(O), 
  my_once_sql_blanks_star, 
  my_sql_expression(R,_RT),
  {C=..[O,L,R]}.

my_priority_cond_operator(medium,"AND",and).
my_priority_cond_operator(low,"OR",or).

my_column_or_constant_tuple(Cs) --> 
  "(",
  my_sql_blanks_star,
  my_column_or_constant_list(Cs),
  my_sql_blanks_star,
  ")".
my_column_or_constant_tuple([C]) --> 
  my_column_or_constant(C).

my_column_list([C,C2|Cs]) -->
  my_column(C),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_column_list([C2|Cs]).
my_column_list([C]) -->
  my_column(C).

my_column_or_constant_list([C,C2|Cs]) -->
  my_column_or_constant(C),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_column_or_constant_list([C2|Cs]).
my_column_or_constant_list([C]) -->
  my_column_or_constant(C).

my_column_or_constant(C) --> 
  my_column(C).
my_column_or_constant(C) --> 
  my_sql_constant(C).

my_order_list([C,C2|Cs],[O,O2|Os]) -->
  my_column_order(C,O),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  my_order_list([C2|Cs],[O2|Os]).
my_order_list([C],[O]) -->
  my_column_order(C,O).

my_column_order(C,asc) -->
  my_column(C),
  my_sql_blanks,
  my_kw("ASC").
my_column_order(C,desc) -->
  my_column(C),
  my_sql_blanks,
  my_kw("DESC").
my_column_order(C,asc) -->
  my_column(C).

my_relop(RO) --> 
  my_set_op(RO).
my_relop(RO) --> 
  my_tuple_op(RO).

my_set_op(SO) -->
  my_tuple_op(TO),
  my_sql_blanks_star,
  my_kw("ALL"),
  {atom_concat(TO,'_all',SO)}.
my_set_op(SO) -->
  my_tuple_op(TO),
  my_sql_blanks_star,
  my_kw("ANY"),
  {atom_concat(TO,'_any',SO)}.
  
my_tuple_op(RO) --> 
  {map_cond(RO,_), 
   name(RO,SRO)},
  my_string(SRO).

my_projection_list(*) --> 
  "*".
my_projection_list([A|As]) --> 
  my_p_ren_argument(A), 
  my_sql_blanks_star, 
  ",", 
%  {!},  % It could be part of a WITH definition, so no cut is allowed
  my_sql_blanks_star, 
  my_projection_list(As).
my_projection_list([A]) --> 
  my_p_ren_argument(A).

my_p_ren_argument(A) --> 
  my_ren_argument(A).
my_p_ren_argument(A) --> 
  my_sql_argument(A,_AS).

my_ren_argument(Arg) -->
  my_sql_argument(Arg,AS),
  my_sql_blanks, 
  my_optional("AS "), 
  my_sql_user_identifier(AS).

%my_sql_argument(attr(R,C,AS),AS) --> % Identifers are assumed to be references to table or view attributes, even when they do not exist already (because of the view construction)
%  my_column(attr(R,C,AS)).           % In sql_to_ra, references to expressions are known, so that incorrectly assumed attributes can be changed to such references
my_sql_argument((R,(*)),'$') -->  % Cannot be renamed
  my_relname(R),
  ".*".
my_sql_argument(E,AS) -->
  my_sql_proj_expression(E,AS).
  
my_sql_proj_expression(expr(E,AS,Type),AS) -->
  my_sql_expression(E,Type).

my_column(attr(R,C,_AS)) --> 
  my_relname(R),
  ".",
  my_colname(C).
my_column(attr(_T,C,_AS)) --> 
  my_colname(C).
%   ,
%   {\+ my_sql_identifier(C)}.

my_relname(T) --> 
  my_sql_user_identifier(T).
%   ,
%   {\+ my_sql_identifier(T)}. % But allow [sql_identifier] as a table name (Access)

my_tablename(T) --> 
  my_sql_user_identifier(T).
% The following is omitted to work without schema (due to ODBC connections)
%   {my_table('$des',T,_TA),
%    my_not(my_view('$des',T,_VA,_Q,_L,_DLs,_ODLIds,_LVDs,_SCs))}.

my_viewname(V) --> 
  my_sql_user_identifier(V).
%  {my_view('$des',V,_VA,_SQL,_,_DLs,_ODLIds,_LVDs,_SCs)}. % Maybe under construction and not yet known

my_colname(C) --> 
  my_sql_user_identifier(C).
%  {my_attribute('$des',_Pos,_T,C,_Type)}. % Maybe from a view under construction and not yet known

allowed_schema(Schema) :-
  Schema =.. [TableName|ColnameTypeList],
  allowed_tablename(TableName),
  allowed_colnametype_list(ColnameTypeList).
  
allowed_colnametype_list(ColnameTypeList) :-
  my_unzip(ColnameTypeList,Colnames,_Types),
  allowed_colnames(Colnames).

allowed_tablename(TableName) :-
  (my_sql_identifier(TableName)
   ->
   my_raise_exception(unallowed_identifier(table,TableName),syntax(['']),[])
   ;
   true
  ).

allowed_viewname(Viewname) :-
  (my_sql_identifier(Viewname)
   ->
   my_raise_exception(unallowed_identifier(view,Viewname),syntax(['']),[])
   ;
   true
  ).

allowed_colname(Colname) :-
  var(Colname),
  !.
allowed_colname(Colname) :-
  (my_sql_identifier(Colname)
   ->
   my_raise_exception(unallowed_identifier(column,Colname),syntax(['']),[])
   ;
   true
  ).

allowed_colnames(Colnames) :-
  my_apply_1(allowed_colname,Colnames),
  my_remove_duplicates_sort(Colnames,SColnames),
  length(Colnames,L),
  (length(SColnames,L)
   ->
    true
   ;
    my_raise_exception(generic,syntax(['Duplicated column names.']),[])
    %write_error_log(['Duplicated column names.'])
   ).
%my_user_identifier: An identifier either: 
% - starting by a letter, followed by letters, digits or underscores
% - characters enclosed between marks
% - starting with $, a system-generated identifier
% Returns an atom
my_sql_user_identifier(DolarI) --> 
  "$",
  my_sql_user_identifier(I),
  {atom_concat('$',I,DolarI)}.
my_sql_user_identifier(I) --> 
  my_alfa(A),
  my_alfanums(Is),
  {name(I,[A|Is])}.
%   ,
%   {name(I,[A|Is]),
%    \+ my_sql_identifier(I)
%   }.

%    (my_sql_identifier(I)
%     ->
%     my_raise_exception(generic,syntax(['Incorrect use of built-in [',I,'] as an user identifier.']),[])
%     ;
%     true
%    )
%  }.
my_sql_user_identifier(I) --> 
  my_sql_left_quotation_mark(Mark),
  my_mark_enclosed_chars(Mark,Is),
  my_sql_right_quotation_mark(Mark),
  {name(I,Is)}.
%   ,
%   {name(I,Is),
%    \+ my_sql_identifier(I)
%   }.

%    (my_sql_identifier(I)
%     ->
%     my_raise_exception(generic,syntax(['Incorrect use of built-in [',I,'] as an user identifier.']),[])
%     ;
%     true
%    )
%  }.
  
% my_mark_enclosed_chars: one or more characters enclosed between SQL delimiter marks
my_mark_enclosed_chars(Mark,[C]) -->
  my_non_mark_char(Mark,C).
my_mark_enclosed_chars(Mark,[C|Cs]) -->
  my_non_mark_char(Mark,C),
  my_mark_enclosed_chars(Mark,Cs).

% my_non_quote_char: one character inside a quoted atom
my_non_mark_char(Mark,C) --> % A pair of marks inside a marked atom denoting a single mark
  my_sql_left_quotation_mark(Mark),
  my_sql_left_quotation_mark(Mark),
  {my_sql_left_quotation_mark(Mark,[C],[])}.
my_non_mark_char(Mark,C) --> % A pair of marks inside a marked atom denoting a single mark
  my_sql_right_quotation_mark(Mark),
  my_sql_right_quotation_mark(Mark),
  {my_sql_right_quotation_mark(Mark,[C],[])}.
my_non_mark_char(Mark,C) --> % A single mark is not allowed inside a mark-delimited atom
  [C],
  {\+ my_sql_left_quotation_mark(Mark,[C],[]),
   \+ my_sql_right_quotation_mark(Mark,[C],[])}.

my_sql_left_quotation_mark(square_brackets) -->
  "[".
my_sql_left_quotation_mark(double_quotes) -->
  """".
my_sql_left_quotation_mark(back_quotes) -->
  "`".

my_sql_left_quotation_mark("[",ACCESS) :-
  to_uppercase(ACCESS,'ACCESS'),
  !. 
my_sql_left_quotation_mark("""",SQLSERVER) :-
  to_uppercase(SQLSERVER,'SQLSERVER'),
  !. 
my_sql_left_quotation_mark("""",ORACLE) :-
  to_uppercase(ORACLE,'ORACLE'),
  !. 
my_sql_left_quotation_mark("`",MYSQL) :-
  to_uppercase(MYSQL,'MYSQL'),
  !.
my_sql_left_quotation_mark("""",_).
  
my_sql_right_quotation_mark(square_brackets) -->
  "]".
my_sql_right_quotation_mark(double_quotes) -->
  """".
my_sql_right_quotation_mark(back_quotes) -->
  "`".

my_sql_right_quotation_mark("]",ACCESS) :-
  to_uppercase(ACCESS,'ACCESS'),
  !. 
my_sql_right_quotation_mark("""",SQLSERVER) :-
  to_uppercase(SQLSERVER,'SQLSERVER'),
  !. 
my_sql_right_quotation_mark("""",ORACLE) :-
  to_uppercase(ORACLE,'ORACLE'),
  !. 
my_sql_right_quotation_mark("`",MYSQL) :-
  to_uppercase(MYSQL,'MYSQL'),
  !.
my_sql_right_quotation_mark("""",_).

my_sql_identifier(I) :-
  to_uppercase(I,CI),
  sql_identifier(CI).

sql_identifier('ALL').
sql_identifier('AND').
sql_identifier('ANSWER').
sql_identifier('AS').
sql_identifier('ASSUME').
sql_identifier('CREATE').
sql_identifier('DELETE').
sql_identifier('DISTINCT').
sql_identifier('DROP').
sql_identifier('EXCEPT').
sql_identifier('EXISTS').
sql_identifier('FALSE').
sql_identifier('FROM').
sql_identifier('FULL').
sql_identifier('IN').
sql_identifier('INNER').
sql_identifier('INSERT').
sql_identifier('INTERSECT').
sql_identifier('INTO').
sql_identifier('JOIN').
sql_identifier('LEFT').
sql_identifier('NATURAL').
sql_identifier('NOT').
sql_identifier('NULL').
sql_identifier('ON').
sql_identifier('OR').
sql_identifier('OUTER').
sql_identifier('RECURSIVE').
sql_identifier('REPLACE').
sql_identifier('RIGHT').
sql_identifier('SELECT').
sql_identifier('TABLE').
sql_identifier('TRUE').
sql_identifier('UNION').
sql_identifier('USING').
sql_identifier('VALUES').
sql_identifier('VIEW').
sql_identifier('WHERE').
sql_identifier('WITH').
sql_identifier(C) :-
  arithmetic_constant(_Value,LC,_Text),
  to_uppercase(LC,C).
sql_identifier(F) :-
  arithmetic_function(LF,_PrologF,_Text,_Kind,_Type,_Arity),
  to_uppercase(LF,F).

my_alfanums([A|As]) --> 
  my_alfanum(A),
  {!},
  my_alfanums(As).
my_alfanums([]) --> 
  [].

my_alfa(C) --> 
  my_lowercase(C).
my_alfa(C) --> 
  my_uppercase(C).

my_alfanum(C) --> 
  my_alfa(C).
my_alfanum(C) --> 
  my_digit(C).
my_alfanum(C)--> 
  "_",
  {"_" = [C]}.

my_sql_non_arithmetic_constant(cte(C,string(S))) -->
  my_sql_string_constant(cte(C,string(S))).
my_sql_non_arithmetic_constant(cte('$NULL'(N),_T)) -->
  my_kw("NULL"),
  {get_null_id(N)}.
  
my_sql_constant(cte(C,number(N))) --> 
  my_number(C),
  {float(C) -> N=float ; true}.
my_sql_constant(cte(C,T)) --> 
  my_sql_non_arithmetic_constant(cte(C,T)).
% my_sql_constant(cte(C,string(S))) --> 
%   my_sql_string_constant(cte(C,string(S))).
% my_sql_constant(cte('$NULL'(N),_T)) --> 
%   my_kw("NULL"),
%   {get_null_id(N)}.

my_sql_string_constant(cte(C,string(_S))) --> 
  "'",
  my_sql_string(Cs),
%  {name(C,Cs)},
  {atom_codes(C,Cs)},
  "'",
  {add_to_dictionary(C)}. % WARNING: ONLY FOR TEST CASE GENERATION
  
% SQL strings allowing escaped single quotes
my_sql_string([]) -->
  [].
my_sql_string([C|Cs]) -->
  [C],
  {"'" =\= [C]},
  my_sql_string(Cs).
my_sql_string([Q|Cs]) -->
  [Q,Q],
  {"'" = [Q]},
  my_sql_string(Cs).
  
:- dynamic(dictionary/1). 
add_to_dictionary(SC) :-
  (retract(dictionary(SCs)) ->
   (my_member(SC,SCs) ->
     assertz(dictionary(SCs))
    ;
     assertz(dictionary([SC|SCs]))
   )
   ;
   assertz(dictionary([SC]))).
   
% my_optional_semicolon -->
%   ";",
%   {!}.
% my_optional_semicolon -->
%   [].

% SHOW TABLES
my_ISL(show_tables) -->
  my_kw("SHOW"),
  my_sql_blanks,
  my_kw("TABLES").

% SHOW VIEWS
my_ISL(show_views) -->
  my_kw("SHOW"),
  my_sql_blanks,
  my_kw("VIEWS").

% SHOW DATABASES
my_ISL(show_databases) -->
  my_kw("SHOW"),
  my_sql_blanks,
  my_kw("DATABASES").

% DESCRIBE
my_ISL(describe(Name)) -->
  my_kw("DESCRIBE"),
  my_sql_blanks,
  my_sql_user_identifier(Name).



%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parsing SQL expressions
%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_sql_expression(cte(C,T),T) -->
  my_sql_non_arithmetic_constant(cte(C,T)).
my_sql_expression(E,_Type) -->
  my_sql_arithmetic_expression(E).

% Arithmetic expressions

% my_sql_arithmetic_expression(E) --> 
%   "(",
%   my_sql_blanks_star,
%   my_sql_arithmetic_expression(E),
%   my_sql_blanks_star,
%   ")".
% my_sql_arithmetic_expression(E) --> 
%   my_ub_sql_arithmetic_expression(E).
%   
% my_ub_sql_arithmetic_expression(E) --> 
%   "(",
%   my_sql_blanks_star,
%   my_sql_arithmetic_expression(T),
%   my_sql_blanks_star,
%   ")",
%   my_sql_arithmetic_expression_r(T,E).
% my_ub_sql_arithmetic_expression(E) --> 
%   my_sql_aterm(T),
%   %my_sql_blanks_star, % WARNING
%   my_sql_arithmetic_expression_r(T,E).
  
my_sql_arithmetic_expression(E) --> 
  my_sql_aterm(T),
  my_sql_arithmetic_expression_r(T,E).
  
% my_sql_arithmetic_expression_r(E0,E) --> 
%   my_sql_blanks_star,
%   {my_priority_operator(low,SOP,OP)}, 
%   my_string(SOP),
%   my_sql_blanks_star,
%   my_optional_opening_parentheses(N), 
%   my_sql_aterm(T),
%   {(N > 0
%     ->
%      TOP=T,
%      E =.. [OP,E0,E1]
%     ;
%      TOP =.. [OP,E0,T],
%      E1 = E
%    )},
%   my_sql_arithmetic_expression_r(TOP,E1),
%   my_optional_closing_parentheses(N).
my_sql_arithmetic_expression_r(E0,E) --> 
  my_sql_blanks_star,
  {my_priority_operator(low,SOP,OP)}, 
  my_string(SOP),
  my_sql_blanks_star,
  my_sql_aterm(T),
  {TOP=..[OP,E0,T]},
  my_sql_arithmetic_expression_r(TOP,E).
my_sql_arithmetic_expression_r(E,E) -->
  [].

my_optional_opening_parentheses(N) -->
  my_optional_opening_parentheses(0,N).
  
my_optional_opening_parentheses(N,NN) -->
  "(",
  my_sql_blanks_star,
  {N1 is N+1},
  my_optional_opening_parentheses(N1,NN).
my_optional_opening_parentheses(N,N) -->
  [].
  
my_optional_closing_parentheses(N) -->
  my_optional_closing_parentheses(0,N).
  
my_optional_closing_parentheses(N,NN) -->
  my_sql_blanks_star,
  ")",
  {N1 is N+1},
  my_optional_closing_parentheses(N1,NN).
my_optional_closing_parentheses(N,N) -->
  [].
  
% my_sql_aterm(T) --> 
%   "(",
%   my_sql_blanks_star,
%   my_sql_aterm(T),
%   my_sql_blanks_star,
%   ")".
% my_sql_aterm(T) --> 
%   my_ub_sql_aterm(T).

% my_ub_sql_aterm(T) --> 
% %my_sql_aterm(T) --> 
%   my_sql_power(P),
%   my_sql_aterm_r(P,T).
  
my_sql_aterm(T) --> 
  my_sql_power(P),
  my_sql_aterm_r(P,T).
  
my_sql_aterm_r(T0,T) --> 
  my_sql_blanks_star,
  {my_priority_operator(medium,SOP,OP)}, 
  my_string(SOP),
  my_sql_blanks_star, 
  my_sql_power(P),
  my_sql_blanks_star, 
  {TOP =.. [OP,T0,P]},
  my_sql_aterm_r(TOP,T).
my_sql_aterm_r(T,T) -->
  [].

my_sql_power(P) --> 
  my_sql_factor(F),
  my_sql_power_r(F,P).
  
my_sql_power_r(P0,TOP) --> 
  my_sql_blanks_star,
  {my_priority_operator(high,SOP,OP)}, 
  my_string(SOP), 
  my_sql_blanks_star, 
  my_sql_factor(P1),
  my_sql_blanks_star,
  {TOP =.. [OP,P0,P]},
  my_sql_power_r(P1,P).
my_sql_power_r(P,P) -->
  [].

my_sql_factor('$NULL'(ID)) -->
  my_kw("NULL"),
  {get_null_id(ID)}.
my_sql_factor(cte(N,number(_T))) -->
  my_number(N).
my_sql_factor(C) -->
  my_arithmetic_constant(C).
my_sql_factor(C) -->
  my_column(C).
my_sql_factor(Aggr) -->
  my_sql_special_aggregate_function(Aggr).
my_sql_factor(T) --> 
  {my_arithmetic_function(SF,F,Arity),
   to_uppercase_char_list(SF,USF)},
  my_kw(USF), 
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_sql_function_arguments(Arity,As),
  my_sql_blanks_star,
  ")",
  {!,
   T=..[F|As]}.
my_sql_factor(E) -->
  "(",
  my_blanks_star,
  my_sql_arithmetic_expression(E),
  my_blanks_star,
  ")",
  {!}. % WARNING
my_sql_factor(T) --> 
  {my_unary_operator(SOP,OP)},
  my_string(SOP),
  my_sql_blanks_star, 
  my_sql_arithmetic_expression(E),
  {!,
   T=..[OP,E]}.
my_sql_factor(E) --> 
  my_DQL(E).

my_sql_function_arguments(1,[E]) -->
  !,
  my_sql_arithmetic_expression(E).
my_sql_function_arguments(A,[E|Es]) -->
  {A>1},
  my_sql_arithmetic_expression(E),
  my_sql_blanks_star,
  ",",
  my_sql_blanks_star,
  {A1 is A-1},
  my_sql_function_arguments(A1,Es).

% COUNT(*)
my_sql_special_aggregate_function(count) -->
  my_kw("COUNT"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  "*",
  my_sql_blanks_star,
  ")".
% MIN/MAX(DISTINCT Column) behaves as MIN/MAX(Column), as allowed by SQL2 Standard
my_sql_special_aggregate_function(min(C)) -->
  my_kw("MIN"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_kw("DISTINCT"),
  my_sql_blanks,
  my_column(C),
  my_sql_blanks_star,
  ")".
my_sql_special_aggregate_function(max(C)) -->
  my_kw("MAX"),
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_kw("DISTINCT"),
  my_sql_blanks,
  my_column(C),
  my_sql_blanks_star,
  ")".
% Aggr(DISTINCT Column)
my_sql_special_aggregate_function(T) -->
  {my_aggregate_function(_,PF,1),
   atom_concat(F,'_distinct',PF),
   name(F,SF),
   to_uppercase_char_list(SF,USF)},
  my_kw(USF), 
  my_sql_blanks_star,
  "(",
  my_sql_blanks_star,
  my_kw("DISTINCT"),
  my_sql_blanks,
  my_column(C),
  my_sql_blanks_star,
  ")",
  {T=..[PF,C]}.
  
my_sql_distinct_aggregate_function(min_distinct).
my_sql_distinct_aggregate_function(max_distinct).
my_sql_distinct_aggregate_function(count_distinct).
my_sql_distinct_aggregate_function(avg_distinct).
my_sql_distinct_aggregate_function(sum_distinct).
my_sql_distinct_aggregate_function(times_distinct).

% SQL Separators:

my_sql_blanks -->
  parse_multi_line_remark,
  my_blanks_star.
my_sql_blanks -->
  parse_sql_single_line_remark,
  my_blanks_star.  
my_sql_blanks -->
  my_blanks.
  
my_sql_blanks_star -->
  parse_multi_line_remark,
  my_blanks_star.
my_sql_blanks_star -->
  parse_sql_single_line_remark,
  my_blanks_star.  
my_sql_blanks_star -->
  my_blanks_star.

my_once_sql_blanks_star -->
  my_sql_blanks_star,
  {!}.

my_once_sql_blanks -->
  my_sql_blanks,
  {!}.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solve_sql_query(+SQLstr,+SQLst) Solves a SQL query
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solve_sql_query(QueryStr,Query) :-
  (current_db('$des',_Handle) ->
    solve_des_sql_query(Query)
   ;
    solve_rdb_sql_query(QueryStr,Query)).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solve_rdb_sql_query(+SQLst) Solves an RDB SQL query
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solve_rdb_sql_query(QueryStr,Query) :-
  is_dql_statement(QueryStr,Query),
  !,
  my_odbc_dql_query(QueryStr,Schema,Rows),
  store_elapsed_time(computation),
  display_answer_schema(Schema),
  display_solutions(Rows),
  display_elapsed_time,
  write_tapi_eot.
solve_rdb_sql_query(QueryStr,Query) :-
  is_dml_statement(QueryStr,Query,Type),
  !,
  processC(clear_et,[],_NVs,yes),
  my_odbc_dml_query(QueryStr,NumberOfRows),
  store_elapsed_time(computation),
  display_nbr_of_tuples(NumberOfRows,Type,_Error),
  display_elapsed_time.
solve_rdb_sql_query(QueryStr,Query) :-
  (is_ddl_statement(QueryStr,Query,Message)
   ;
   is_isl_statement(QueryStr,Query,Message)
  ),
  !,
  my_odbc_ddl_query(QueryStr),
  store_elapsed_time(computation),
  write_verb_list(['Info: ',Message,'.',nl]),
  processC(clear_et,[],_NVs,yes),
  display_elapsed_time.
  

% A DQL query: select, union, except, intersect
is_dql_statement(_,(SELECT,_Ren)) :-
  SELECT=..[select|_],
  !.
is_dql_statement(_,(with(_,_),_Ren)).
is_dql_statement(_,(union(_,_,_),_Ren)).
is_dql_statement(_,(except(_,_,_),_Ren)).
is_dql_statement(_,(intersect(_,_,_),_Ren)).
is_dql_statement(QueryStr,unknown) :-
  my_guessed_dql_statement(QueryStr,_Remainder),
  !.
  
% A DML query: insert, delete or update
is_dml_statement(_,insert_into(_,_,_),inserted).
is_dml_statement(_,delete_from(_,_),deleted).
is_dml_statement(_,update(_,_,_),updated).
is_dml_statement(QueryStr,unknown,Message) :-
  my_guessed_dml_statement(Message,QueryStr,_Remainder),
  !.

% A DDL query: create table, rename table, drop table ...
is_ddl_statement(_,create_table(_,_),'Table created').
is_ddl_statement(_,create_or_replace_table(_,_),'Table created').
is_ddl_statement(_,rename_table(_,_),'Table renamed').
is_ddl_statement(_,rename_view(_,_),'View renamed').
is_ddl_statement(_,create_view(_,_,_),'View created').
is_ddl_statement(_,create_or_replace_view(_,_,_),'View created').
is_ddl_statement(_,drop_table(_,_),'Table dropped').
is_ddl_statement(_,drop_view(_),'View dropped').
is_ddl_statement(_,drop_database,'Database dropped').
is_ddl_statement(QueryStr,unknown,Message) :-
  my_guessed_ddl_statement(Message,QueryStr,_Remainder),
  !.

% An ISL query: show, describe
is_isl_statement(QueryStr,unknown,Message) :-
  my_guessed_isl_statement(Message,QueryStr,_Remainder),
  !.
  
% Guess whether it is a SQL statement
my_guessed_sql_statement -->
  my_guessed_dql_statement.
my_guessed_sql_statement -->
  my_guessed_dml_statement(_).
my_guessed_sql_statement -->
  my_guessed_isl_statement(_).
my_guessed_sql_statement -->
  my_guessed_sgbd_statement.
my_guessed_sql_statement -->
  my_guessed_ddl_statement(X),
  {
   !,
   X\=='Statement has been executed'
  }.


% Guess whether it is a DQL statement
my_guessed_dql_statement -->
  my_sql_blanks_star,
  my_opening_parenthesis_star,
  my_sql_blanks_star,
  my_kw("SELECT"),
  my_sql_blanks.
my_guessed_dql_statement -->
  my_sql_blanks_star,
  my_opening_parenthesis_star,
  my_sql_blanks_star,
  my_kw("WITH"),
  my_sql_blanks.
my_guessed_dql_statement -->
  my_sql_blanks_star,
  my_opening_parenthesis_star,
  my_sql_blanks_star,
  my_kw("ASSUME"),
  my_sql_blanks.
  
% Guess whether it is a DML statement
my_guessed_dml_statement(inserted) -->
  my_sql_blanks_star,
  my_kw("INSERT"),
  my_sql_blanks.
my_guessed_dml_statement(deleted) -->
  my_sql_blanks_star,
  my_kw("DELETE"),
  my_sql_blanks.
my_guessed_dml_statement(updated) -->
  my_sql_blanks_star,
  my_kw("UPDATE"),
  my_sql_blanks.
  
% Guess whether it is a DDL statement
my_guessed_ddl_statement('Table created') -->
  my_sql_blanks_star,
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks.
my_guessed_ddl_statement('Table created') -->
  my_sql_blanks_star,
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("OR"),
  my_sql_blanks,
  my_kw("REPLACE"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks.
my_guessed_ddl_statement('View created') -->
  my_sql_blanks_star,
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks.
my_guessed_ddl_statement('View created') -->
  my_sql_blanks_star,
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("OR"),
  my_sql_blanks,
  my_kw("REPLACE"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks.
my_guessed_ddl_statement('Database created') -->
  my_sql_blanks_star,
  my_kw("CREATE"),
  my_sql_blanks,
  my_kw("DATABASE"),
  my_sql_blanks.
my_guessed_ddl_statement('Table renamed') -->
  my_sql_blanks_star,
  my_kw("RENAME"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks.
my_guessed_ddl_statement('View renamed') -->
  my_sql_blanks_star,
  my_kw("RENAME"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks.
my_guessed_ddl_statement('Table dropped') -->
  my_sql_blanks_star,
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks.
my_guessed_ddl_statement('View dropped') -->
  my_sql_blanks_star,
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("VIEW"),
  my_sql_blanks.
my_guessed_ddl_statement('Database dropped') -->
  my_sql_blanks_star,
  my_kw("DROP"),
  my_sql_blanks,
  my_kw("DATABASE"),
  my_sql_blanks_star.
my_guessed_ddl_statement('Table modified') -->
  my_sql_blanks_star,
  my_kw("ALTER"),
  my_sql_blanks,
  my_kw("TABLE"),
  my_sql_blanks.
% Other (unknown) statements will be sent without expecting any result set  
my_guessed_ddl_statement('Statement has been executed') -->
  [].

% Guess whether it is a ISL statement
my_guessed_isl_statement('Statement has been executed') -->
  my_sql_blanks_star,
  my_kw("SHOW"),
  my_sql_blanks.
my_guessed_isl_statement('Statement has been executed') -->
  my_sql_blanks_star,
  my_kw("DESCRIBE"),
  my_sql_blanks.

my_guessed_sgbd_statement -->
  my_sql_blanks_star,
  my_kw("USE"),
  my_sql_blanks,
  my_sql_user_identifier(_DB),
  my_sql_blanks_star.

my_opening_parenthesis_star -->
  "(",
  my_sql_blanks_star,
  my_opening_parenthesis_star.
my_opening_parenthesis_star -->
  [].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solve_des_sql_query(+SQLst) Solves a DES SQL query
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DDL Statements
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% CREATE TABLE TableName
solve_des_sql_query(create_table(Schema,Ctrs)) :-
  allowed_schema(Schema),
  functor(Schema,TableName,_Arity),
  (des_relation_exists(TableName) -> 
   write_error_log(['Relation "',TableName,'" already defined.'])
   ;
   create_table(Schema,Ctrs),
   store_elapsed_time(computation),
   display_elapsed_time,
   write_tapi_success
  ).
% CREATE OR REPLACE TABLE TableName
solve_des_sql_query(create_or_replace_table(Schema,Ctrs)) :-
  allowed_schema(Schema),
  functor(Schema,TableName,_Arity),
  (des_table_exists(TableName) -> 
   drop_table_k(TableName)
   ;
   true
  ),
  create_table(Schema,Ctrs),
  store_elapsed_time(computation),
  display_elapsed_time,
  write_tapi_success.
% CREATE TABLE TableName LIKE TableName
solve_des_sql_query(create_table_like(TableName,ExistingTableName)) :-
  exist_table(ExistingTableName),
  (TableName == ExistingTableName
   ->
   write_warning_log(['Table not created: both table identifiers are the same.'])
   ;
   allowed_tablename(TableName),
   (des_relation_exists(TableName)
    -> 
     write_error_log(['Relation "',TableName,'" already defined.'])
    ;
     create_table_like(TableName,ExistingTableName),
     store_elapsed_time(computation),
     display_elapsed_time,
     write_tapi_success
   )
  ).
% CREATE OR REPLACE TABLE TableName LIKE TableName
solve_des_sql_query(create_or_replace_table_like(TableName,ExistingTableName)) :-
  exist_table(ExistingTableName),
  (TableName == ExistingTableName
   ->
    write_warning_log(['Table not created: both table identifiers are the same.'])
   ;
    allowed_tablename(TableName),
    (des_relation_exists(TableName)
     -> 
      drop_table_k(TableName)
     ;
      true
    ),
    create_table_like(TableName,ExistingTableName),
    store_elapsed_time(computation),
    display_elapsed_time,
    write_tapi_success
  ).
% CREATE VIEW Schema/ViewName
solve_des_sql_query(create_view(Lang,SQLst,Schema)) :-
  (atom(Schema) ->
    TableName = Schema
   ;
    allowed_schema(Schema)
  ),  
  translate_trusted_views(SQLst,Schema,TSQLst,TSchema),
  TSchema=..[TableName|_Args],
  (my_table('$des',TableName,_) -> 
   write_error_log(['Relation ',TableName,' already defined.'])
   ;
   create_view(Lang,TSQLst,TSchema,[]),
   store_elapsed_time(computation),
   display_elapsed_time,
   write_tapi_success
  ).
% CREATE OR REPLACE VIEW ViewName
solve_des_sql_query(create_or_replace_view(Lang,SQLst,Schema)) :-
  allowed_schema(Schema),
  translate_trusted_views(SQLst,Schema,TSQLst,TSchema),
  create_or_replace_view(Lang,TSQLst,TSchema),
  store_elapsed_time(computation),
  display_elapsed_time,
  write_tapi_success.
% RENAME TABLE TableName TO TableName
solve_des_sql_query(rename_table(ExistingTableName,NewTableName)) :-
  exist_table(ExistingTableName),
  (NewTableName == ExistingTableName
   ->
   write_warning_log(['Table not renamed: both table identifiers are the same.'])
   ;
   allowed_tablename(NewTableName),
   (des_relation_exists(NewTableName) -> 
    write_error_log(['Relation "',NewTableName,'" already defined.'])
    ;
    rename_table(ExistingTableName,NewTableName),
    store_elapsed_time(computation),
    display_elapsed_time,
    write_tapi_success
   )
  ).
% RENAME VIEW Viewname TO Viewname
solve_des_sql_query(rename_view(ExistingViewname,NewViewname)) :-
  exist_view(ExistingViewname),
  (NewViewname == ExistingViewname
   ->
   write_warning_log(['View not renamed: both table identifiers are the same.'])
   ;
   allowed_viewname(NewViewname),
   (des_relation_exists(NewViewname) -> 
    write_error_log(['Relation "',NewViewname,'" already defined.'])
    ;
    rename_view(ExistingViewname,NewViewname),
    store_elapsed_time(computation),
    display_elapsed_time,
    write_tapi_success
   )
  ).
% DROP TABLE TableName
solve_des_sql_query(drop_table(TableNames,IfExists)) :-
  drop_table_if_exists_list(TableNames,IfExists,_Dropped).
  
% DROP VIEW ViewName
solve_des_sql_query(drop_view(TableName)) :-
  (my_not(my_view('$des',TableName,_A,_SQL,_L,_DL,_ODLIds,_LVs,_StrCs)) -> 
   write_error_log(['View not defined.']),
   display_view_alternatives(TableName)
   ;
   drop_view(TableName),
   store_elapsed_time(computation),
   display_elapsed_time,
   write_tapi_success
  ).

% DROP DATABASE
solve_des_sql_query(drop_database) :-
  tapi(on),
  !,
  drop_database,
  write_tapi_success.
solve_des_sql_query(drop_database) :-
  write_log_list(['Info: This will drop all views, tables, constraints and Datalog rules.',nl,'      Do you want to proceed? (y/n) [n]: ']),
  user_input_string(Str),
  (Str==[] ->
    write_verb_list(['Info: Nothing dropped',nl])
   ;
    (Str == "y" ->
      reset_elapsed_time,
      store_elapsed_time(parsing),
      drop_database,
      store_elapsed_time(computation),
      display_elapsed_time
     ;
      write_info_verb_log(['Nothing dropped'])
    ) 
  ).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DML Statements
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INSERT INTO TableName VALUES(...)
solve_des_sql_query(insert_into(TableName,Cs,IVs)) :-
  my_is_list(IVs),
  !,
  (my_not(my_view('$des',TableName,_Arity,_SQLst,_L,_DLs,_ODLIds,_LVDs,_SCs))
   ->
   exist_table(TableName,Arity),
   exist_atts(TableName,Cs),
   my_nf_bagof(Cte,Type^my_member(cte(Cte,Type),IVs),CVs),
   build_complete_values(TableName,Arity,Cs,CVs,Vs,Error),
   (var(Error)
    ->
    (length(Vs,Arity) 
     ->
     Tuple=..[TableName|Vs],
     assert_rule((Tuple,[]),[simplify],_,Error),
     store_elapsed_time(computation),
     functor(G,TableName,Arity),
     (var(Error) -> 
       my_idx_retractall(complete_flag(G,_CF)),
       display_nbr_of_tuples([Tuple],inserted,Error)
      ;
       display_nbr_of_tuples([],inserted,Error) 
     ),
     display_elapsed_time
     ;
     write_error_log(['Incorrect number of values (must be ',Arity,').'])
    )
   ;
   true
   )
  ;
  write_error_log(['Cannot insert into views.'])
  ).
% INSERT INTO TableName SQLStmt
solve_des_sql_query(insert_into(TableName,Colnames,SQLst)) :-
  exist_table(TableName,Arity),
  exist_atts(TableName,Colnames),
  (my_not(my_view('$des',TableName,Arity,_SQLst,_L,_DLs,_ODLIds,_LVDs,_SCs))
   ->
   solve_des_sql_query_k(sql,SQLst,_Schema,ColTypes,_TableRen,_Query,_DLsts,_Undefined),
   length(Colnames,NbrColumns),
   (length(ColTypes,NbrColumns)
    ->
    insert_tuples(TableName,Arity,NbrColumns,Colnames),
    clear_et,
    store_elapsed_time(computation),
    display_elapsed_time
    ;
    write_error_log(['Incorrect number of values (must be ',NbrColumns,').'])
   )
   ;
   write_error_log(['Cannot insert into views.'])
  ).

% DELETE FROM
solve_des_sql_query(delete_from(TableName,Condition)) :-
  (my_not(my_view('$des',TableName,Arity,_SQLst,_L,_DLs,_ODLIds,_LVDs,_SCs)) ->
   (my_table('$des',TableName,Arity) ->
    solve_des_sql_query_k(sql,(select(all,_TopN,*,from([(TableName,_Ren)]),where(Condition),group_by([]),having(true),order_by([],[])),_AS),_Schema,_ColTypes,_TableRen,_Query,_DLsts,_Undefined),
    delete_tuples(TableName,Arity),
    clear_et,
    store_elapsed_time(computation),
    display_elapsed_time,
    abolishET 
%    rollup_stratification(_Rules)
    ;
%     write_log_list(['Error: Table ',TableName,' does not exist.',nl]),
%     display_table_alternatives(TableName)
    my_raise_exception(unknown_table(TableName),syntax(''),[])
   )
   ;
   write_error_log(['Cannot delete from views.'])).
  
% UPDATE 
solve_des_sql_query(update(TableName,Assignments,Condition)) :-
  (my_not(my_view('$des',TableName,Arity,_SQLst,_L,_DLs,_ODLIds,_LVDs,_SCs)) ->
   (my_table('$des',TableName,Arity) ->
    % The following will leave in the ET tuples for the updated table with the following information:
    %   Table name and arity, and the column names and values of tuples that need to be updated: 
    %    answer(OldVal1,...,OldValArity,
    %           Colname1,NewValI1,...,ColnameN,ValIM) : I1,...,IM in {1..Arity}
    solve_des_sql_query_k(sql,(select(all,_TopN,[(TableName,(*))|Assignments],from([(TableName,_Ren)]),where(Condition),group_by([]),having(true),order_by([],[])),_AS),_Schema,_ColTypes,_TableRen,_Query,_DLsts,_Undefined),
    update_tuples(TableName,Arity),
    clear_et,
    store_elapsed_time(computation),
    display_elapsed_time,
    abolishET 
%    rollup_stratification(_Rules)
    ;
%     write_log_list(['Error: Table ',TableName,' does not exist.',nl]),
%     display_table_alternatives(TableName)
   my_raise_exception(unknown_table(TableName),syntax(''),[])
   )
   ;
   write_error_log(['Cannot update views.'])).
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ISL Statements
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SHOW TABLES
solve_des_sql_query(show_tables) :-
  processC(list_tables,[],_NVs,yes).

% SHOW VIEWS
solve_des_sql_query(show_views) :-
  processC(list_views,[],_NVs,yes).

% SHOW DATABASES
solve_des_sql_query(show_databases) :-
  processC(show_dbs,[],_NVs,yes).

% DESCRIBE
solve_des_sql_query(describe(Name)) :-
  processC(dbschema,[Name],_NVs,yes).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DQL Statements
%%%%%%%%%%%%%%%%%%%%%%%%%%%

solve_des_sql_query(SQLst) :-
  solve_des_sql_query(sql,SQLst).
  
solve_des_sql_query(Lang,SQLst) :-
  save_et(ET),
  (solve_des_sql_query_k(Lang,SQLst,Schema,ColTypes,TableRen,Query,DLsts,Undefined) ->
    store_elapsed_time(computation),
    display_compiled_sql(DLsts),
    display_answer_schema(Schema,ColTypes,TableRen),
    display_solutions(Query,Undefined),
    display_elapsed_time,
    write_tapi_eot,
    restore_et(ET)
   ;
    restore_et(ET),
    fail
  ).
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Displaying
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Display compiled statements as Datalog clauses
% From SQL:
display_compiled_sql(DLs) :-
  display_compiled_language('SQL',DLs).
% From RA:
display_compiled_ra(DLs) :-
  display_compiled_language('RA',DLs).

display_compiled_language(RLanguage,DLs) :-
  language(DLanguage),
  (DLanguage == datalog -> SLanguage = RLanguage ; SLanguage=DLanguage),
  to_uppercase(SLanguage,Language),
  (show_compilations(on),
   tapi(off)
   ->
    (Language == 'SQL' 
     ->
      Sentence = statement 
     ;
      (Language == 'RA'
       ->
        Sentence = expression
       ;
        Sentence = 'UNKNOWN'
      )
    ),
    write_log_list(['Info: ',Language,' ',Sentence,' compiled to:',nl]),
    nl_compact_log,
    display_rules_list(DLs,0),
    nl_compact_log
   ;
    true).
  
% delete_tables used by des_tc.pl
delete_tables([]).
delete_tables([T|Ts]) :-
  solve_des_sql_query(delete_from(T,true)),
  delete_tables(Ts).
  
% Display answer schema for ODBC RDB
display_answer_schema(Schema) :-
  write_log_list([Schema,' ->',nl]).

% Display answer schema for DES DDB
% No arguments in the schema (propositional table):
display_answer_schema([_TableName],_TableRen) :-
  write_log_list(['answer ->',nl]),
  !.
% Arguments in the schema (relational table):
display_answer_schema([_|Args],ColTypes,TableRen) :-
  get_answer_schema(answer,Args,ColTypes,TableRen,Answer),
  (tapi(off)
   ->
   write_log_list([Answer,' ->',nl])
   ;
   Answer=..[answer|ColNamesColTypes],
   display_tapi_answer_schema(answer,ColNamesColTypes)
   ).
  
get_answer_schema(RelationName,Args,ColTypes,TableRen,Answer) :-
  get_table_dot_colname_from_proj_schema(Args,TableRen,ColNames),
  my_zipWith(':',ColNames,ColTypes,ColNamesColTypes),
  Answer=..[RelationName|ColNamesColTypes].
   
get_table_dot_colname_from_proj_schema(Args,TableRen,ColNames) :-
  (development(on) ->
    HArgs=Args
    ;
    hide_nulls(Args,HArgs)),
  internal_colnames_to_colnames(HArgs,TableRen,ColNames).

display_tapi_answer_schema(Relation,ColNamesColTypes) :-
  write_log_list([Relation,nl]),
  member(ColName:ColType,ColNamesColTypes),
  write_log_list([ColName,nl,ColType,nl]),
  fail.
display_tapi_answer_schema(_Relation,_ColNamesColTypes).  


internal_colnames_to_colnames([],_TableRen,[]).
internal_colnames_to_colnames([IColName|IColNames],TableRen,[ColName|ColNames]) :-
  internal_colname_to_colname(IColName,TableRen,ColName),
  internal_colnames_to_colnames(IColNames,TableRen,ColNames).
  
internal_colname_to_colname(expr(expr_ref(_Rel,A),_AS,_Type),_TableRen,A) :-
  !.
internal_colname_to_colname(expr(attr(RT,C,R),_AS,_Type),TableRen,ColName) :-
  !,
  internal_colname_to_colname(attr(RT,C,R),TableRen,ColName).
internal_colname_to_colname(expr(_E,AS,_Type),_TableRen,AS).
internal_colname_to_colname(attr(RT,C,_R),TableRen,ColName) :-
  find_table_name(RT,TableRen,TableRen,T),
%  setof((T,RT2),my_member((T,RT2),TableRen),[(T,RT2)]), % Unambiguous only-one occurrence of table T in the renaming
  setof((T,RT),my_member((T,RT),TableRen),TRT), % Unambiguous only-one occurrence of table T in the renaming
  TRT=[(T,RT)], % Instead of simply putting [(T,RT)] as the last argument of the above setof, this is needed because GNU-Prolog otherwise fails
  !,
  atom_concat_list([T,'.',C],ColName).
internal_colname_to_colname(attr(RT,C,_R),TableRen,ColName) :-
  find_table_name(RT,TableRen,TableRen,T),
  !,
  (atom_concat('$t',_N,T) ->
   ColName=C
  ;
   atom_concat('$t',N,RT),
   atom_concat_list([T,'_',N,'.',C],ColName)
  ).
internal_colname_to_colname(attr(T,C,_R),_TableRen,ColName) :- % Lost renamings
  (atom_concat('$t',_N,T) ->
   ColName=C
  ;
   atom_concat_list([T,'.',C],ColName)
  ).  
  
find_table_name(RT,[(T,RT)|_RTTs],_TableRen,T) :-
  my_not(atom_concat('$',_,T)),
  !.
find_table_name(RT,[(RT,RT1)|_RTTs],TableRen,T) :-
  atom_concat('$',_,RT),
  find_table_name(RT1,TableRen,TableRen,T).
find_table_name(RT,[(RT2,_RT1)|RTTs],TableRen,T) :-
  RT \= RT2,
  find_table_name(RT,RTTs,TableRen,T).
  
% Solving SQL queries, untouching ET
% WITH
% Regular local view: 
% - Do not store schema 
% - Create prototype view
% - Create view schema (prototype view is dropped)
% - Compute view
% - Drop view
% Hypothetical local view with the name of an existing TABLE: 
% - Store the table schema 
% - Create prototype view (local view with table schema is dropped)
% - Create view schema (prototype view is dropped)
% - Compute view
% - Drop view
% - Restore table schema
% Hypothetical local view with the name of an existing VIEW: 
% - Store the view schema (...,my_view). It will not be removed up to the final drop view
% - Prototype local view is not created
% - View schema is created
% - Compute view
% - Drop view
% - Restore view schema
solve_des_sql_query_k(Lang,(with(SQLst,SQLsts),_AS),Schema,ColTypes,TableRen,Query,DLsts,Undefined) :-
%  !,
  create_prototype_view_list(SQLsts,NewViewNames,OldSchemas),
  (create_or_replace_view_list_k(Lang,SQLsts,NewViewNames) ->
  (catch(
    solve_des_sql_query_k(Lang,SQLst,Schema,ColTypes,TableRen,Query,DLsts,Undefined),
    Message,
    (
     !,
     drop_view_k_list(SQLsts),
     assertz_list(OldSchemas),
     throw(Message)
    )
       ),
   drop_view_k_list(SQLsts),
   assertz_list(OldSchemas)
   )
  ;
   drop_view_k_list(SQLsts),
   assertz_list(OldSchemas),
   !,
   throw(des_exception(''))
  ).

% SELECT, ...
solve_des_sql_query_k(sql,SQLst,Schema,ColTypes,TableRen,Query,DLsts,Undefined) :-
  sql_to_dl(SQLst,Schema,TableRen,UDLsts),
  UDLsts=[':-'(Head,_)|_],
  functor(Head,Pred,Arity),
  replace_predicate_names_and_assert(Pred,Arity,answer,UDLsts,DLsts,DVs,ODLIds,Error),
  abolishET, 
  drilldown_stratification(DVs),
  (var(Error) 
   ->
   ruleNV_to_rule_list(DVs,Rs),
   (infer_types_list(Rs,InferredTypes,_ITypedArgs,_ExtraTypes)
    ->
    swap_uct_ict(ColTypes,InferredTypes),
    functor(Query,answer,Arity),
    solve_datalog_query(Query,Undefined)
    ;
    retract_rule_by_id_list(ODLIds,_Error),
    throw(des_exception(''))
    )
   ;
   true),
  retract_source_dlrules_list(DVs).
  
retract_source_dlrules_list(DVs) :-
  get_object_dlrules_list(DVs,SDVs),
  retract_dlrule_list(SDVs,_Error).

%%%%%%%%%%%%%%%%%
% Create table
%%%%%%%%%%%%%%%%%
create_table(Schema,Ctrs) :-
  Schema =.. [TableName|Args],
  assert_table_schema(TableName,Args),
  (post_table_constraints(TableName,Ctrs,no_check,Error),Error\==true ->
    write_info_verb_log(['Table created.'])
    ;
    drop_table_k(TableName),
    write_error_log(['Imposing constraints.'])
  ).

assert_table_schema(TableName,ColnameTypes) :-
  length(ColnameTypes,Arity),
  assertz(my_table('$des',TableName,Arity)),
  assert_attr_types(TableName,ColnameTypes).

post_table_constraints(_TableName,[],_Check,_Error).   
post_table_constraints(TableName,[Ctr|Ctrs],Check,Error) :-
  post_table_constraint(TableName,Ctr,Check,Error),
  post_table_constraints(TableName,Ctrs,Check,Error).   
  
post_table_constraint(_TableName,true,_Check,_Error).  
post_table_constraint(_TableName,default(_,_),_Check,_Error).  
%
% Not nullables
%
post_table_constraint(TableName,not_nullables(Atts),Check,_Error) :-
  exist_atts(TableName,Atts),
  nn_consistent(TableName,Atts),
  ((Check==no_check ; check_ctr(my_not_nullables('$des',TableName,Atts))) 
   ->
    retractall(my_not_nullables('$des',TableName,_)),
    my_quicksort(Atts,OAtts),
    assertz(my_not_nullables('$des',TableName,OAtts))
   ;
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,not_nullables(_Atts),_Check,true).
%
% Primary key
%
post_table_constraint(TableName,primary_key(Atts),Check,_Error) :-
  exist_atts(TableName,Atts),
  pk_consistent(TableName,Atts),
  ((Check==no_check ; check_ctr(my_primary_key('$des',TableName,Atts))) ->
    retractall(my_primary_key('$des',TableName,_)),
    my_quicksort(Atts,OAtts),
    assertz(my_primary_key('$des',TableName,OAtts))
   ;
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,primary_key(_Atts),_Check,true).
%
% Candidate key
%
post_table_constraint(TableName,candidate_key(Atts),Check,_Error) :-
  exist_atts(TableName,Atts),
  ck_consistent(TableName,Atts),
  ((Check==no_check ; check_ctr(my_candidate_key('$des',TableName,Atts)),
   \+ my_candidate_key('$des',TableName,Atts)) ->
    my_quicksort(Atts,OAtts),
    assertz(my_candidate_key('$des',TableName,OAtts))
   ;
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,candidate_key(_Atts),_Check,true).
%
% Foreign key
%
post_table_constraint(TableName,foreign_key(Atts,FTableName,FAtts),Check,_Error) :-
  (my_table('$des',FTableName,_Arity) ->
   true
   ;
   write_error_log(['Table ',FTableName,' is unknown.']),
   fail),
  (my_not(my_view('$des',FTableName,_A,_S,_La,_D,_ODLIds,_L,_SC)) ->
   true
   ;
   write_error_log(['Referenced object ',FTableName,' is a view, not a table.']),
   fail),
  (TableName\==FTableName ->
   true
   ;
   write_error_log(['Autoreference for ',TableName,' is not allowed.']),
   fail),
  exist_atts(TableName,Atts),
  remove_duplicates(Atts,RAtts),
  length(Atts,L),
  (length(RAtts,L) ->
   true
   ;
   write_error_log(['Duplicated columns in column list ',TableName,'.',Atts,'.']),
   fail),
  exist_atts(FTableName,FAtts),
  remove_duplicates(FAtts,RFAtts),
  length(FAtts,FL),
  (length(RFAtts,FL) ->
   true
   ;
   write_error_log(['Duplicated columns in referenced column list ',FTableName,'.',FAtts,'.']),
   fail),
  (L==FL ->
   true
   ;
   write_error_log(['Different number of arguments in referenced colummn list ',FTableName,'.',FAtts,'.']),
   fail),
  same_type_atts(TableName,Atts,FTableName,FAtts),
  (my_primary_key('$des',FTableName,FAtts) ->
   true
   ;
   write_error_log(['Referenced column list ',FTableName,'.',FAtts,' is not a primary key.']),
   fail),
  (my_foreign_key('$des',TableName,Atts,FTableName,FAtts) ->
    write_error_log(['Trying to reassert an existing integrity constraint.']),
    fail
   ;
    true
  ),
  ((Check==no_check ; check_ctr(my_foreign_key('$des',TableName,Atts,FTableName,FAtts))) ->
    my_quicksort(Atts,OAtts),
    my_quicksort(FAtts,OFAtts),
    assertz(my_foreign_key('$des',TableName,OAtts,FTableName,OFAtts))
   ;
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,foreign_key(_Atts,_FTableName,_FAtts),_Check,true).  
%
% Functional dependency
%
post_table_constraint(TableName,functional_dependency(Atts,DepAtts),Check,_Error) :-
  (my_functional_dependency('$des',TableName,Atts,DepAtts) ->
    write_error_log(['Trying to reassert an existing integrity constraint.']),
    fail
   ;
    true
  ),
  exist_atts(TableName,Atts),
  exist_atts(TableName,DepAtts),
  ((Check==no_check ; check_ctr(my_functional_dependency('$des',TableName,Atts,DepAtts))) ->
    my_quicksort(Atts,OAtts),
    my_quicksort(DepAtts,ODepAtts),
    assertz(my_functional_dependency('$des',TableName,OAtts,ODepAtts))
   ;
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,functional_dependency(_Atts,_DepAtts),_Check,true).
%
% User-defined integrity constraints
%
post_table_constraint(_TableName,my_integrity_constraint('$des',Preds,Constraint,NVs,Head),Check,_Error) :-
  (my_integrity_constraint('$des',Preds,Constraint,NVs,_) ->
    write_error_log(['Trying to reassert an existing integrity constraint.']),
    fail
   ;
    true
  ),
  check_ic(CheckStatus),
  set_flag(check,off),
  assert_rule((':-'(Head,Constraint),NVs),_,_,_),
  set_flag(check,CheckStatus),
  compute_stratification,
  ((Check==no_check ; check_ctr(my_integrity_constraint('$des',Preds,Constraint,NVs,Head))) ->
    assertz(my_integrity_constraint('$des',Preds,Constraint,NVs,Head)),
    write_verb_list(['Info: User-defined integrity constraint successfully imposed.',nl])
   ;
    (retract_source_rule(':-'(Head,Constraint),_ErrorRetract) -> true ; true),
    tapi(off),
    write_log_list(['Info: Constraint has not been asserted.',nl]),
    fail
  ).
post_table_constraint(_TableName,my_integrity_constraint('$des',_Preds,_Constraint,_NVs,_Head),_Check,true).


%%%%%%%%%%%%%%%%%
% Rename table
%%%%%%%%%%%%%%%%%

rename_table(TableName,NewTableName) :-
  my_table('$des',TableName,Arity),
  % Change view definitions involving the old table name
  rename_goals_in_view_definitions(TableName/Arity,NewTableName),
  % Change name
  retract(my_table('$des',TableName,Arity)),
  assertz(my_table('$des',NewTableName,Arity)),
  % Change attributes
  (
   retract(my_attribute('$des',Pos,TableName,Att,Type)),
   assertz(my_attribute('$des',Pos,NewTableName,Att,Type)),
   fail
  ;
   true
  ),
  % Change predefined integrity constraints:
  % - Not nullables
  (
   retract(my_not_nullables('$des',TableName,NNAtts)),
   assertz(my_not_nullables('$des',NewTableName,NNAtts)),
   fail
  ;
   true
  ),
  % - Primary key
  (
   retract(my_primary_key('$des',TableName,PKAtts)),
   assertz(my_primary_key('$des',NewTableName,PKAtts)),
   fail
  ;
   true
  ),
  % - Candidate keys
  (
   retract(my_candidate_key('$des',TableName,CKAtts)),
   assertz(my_candidate_key('$des',NewTableName,CKAtts)),
   fail
  ;
   true
  ),
  % - Foreign keys
  (
   retract(my_foreign_key('$des',TableName,PAtts,FKTableName,FKAtts)),
   assertz(my_foreign_key('$des',NewTableName,PAtts,FKTableName,FKAtts)),
   fail
  ;
   true
  ),
  % - Referenced by other table's foreign keys
  (
   retract(my_foreign_key('$des',OtherTableName,PAtts,TableName,FKAtts)),
   assertz(my_foreign_key('$des',OtherTableName,PAtts,NewTableName,FKAtts)),
   fail
  ;
   true
  ),
  % - Functional dependency
  (
   retract(my_functional_dependency('$des',TableName,AttNames,DepAttNames)),
   assertz(my_functional_dependency('$des',NewTableName,AttNames,DepAttNames)),
   fail
  ;
   true
  ),
  % Change user-defined integrity constraints
  (
   my_integrity_constraint('$des',Preds,Constraint,NVs,Head),
   my_member_chk(TableName/Arity,Preds),
   replace_functor_dlrules_from(head,Head,TableName,NewTableName),
   replace_functor(TableName,NewTableName,Preds,NewPreds),
   replace_functor(TableName,NewTableName,Constraint,NewConstraint),
   retract(my_integrity_constraint('$des',Preds,Constraint,NVs,Head)),
   assertz(my_integrity_constraint('$des',NewPreds,NewConstraint,NVs,Head)),
   fail
  ;
   true
  ), 
  % Change tuples
  (
   length(Args,Arity),
   Fact=..[TableName|Args],
   datalog(Fact,NVs,RId,Ls,FId,Rs),
   NewFact=..[NewTableName|Args],
   functor(NewFact,NewTableName,Arity),
   retract(datalog(Fact,NVs,RId,Ls,FId,Rs)),
   assertz(datalog(NewFact,NVs,RId,Ls,FId,Rs)),
   fail
  ;
   true
  ).
  
% Rename goals in bodies of view definitions that include calls to RelationName/Arity, where TableName is
% being changed to NewTableName
rename_goals_in_view_definitions(RelationName/Arity,NewRelationName) :-
  dependent_relations(RelationName/Arity,Preds),
  replace_functor_dlrules_from_list(namearity,Preds,RelationName,NewRelationName),
  change_dependent_relations_in_view_list(Preds,RelationName,NewRelationName).
  
change_dependent_relations_in_view_list([],_RelationName,_NewRelationName).
change_dependent_relations_in_view_list([Viewname/Arity|Preds],RelationName,NewRelationName) :-
  change_dependent_relations_in_view(Viewname/Arity,RelationName,NewRelationName),
  change_dependent_relations_in_view_list(Preds,RelationName,NewRelationName).

change_dependent_relations_in_view(Viewname/Arity,RelationName,NewRelationName) :-
  retract(my_view('$des',Viewname,Arity,SQL,Lang,DL,ODLIds,LVs,StrCs)),
  !,
  replace_functor(RelationName,NewRelationName,SQL,NewSQL),
  replace_functor(RelationName,NewRelationName,DL,NewDL),
  assertz(my_view('$des',Viewname,Arity,NewSQL,Lang,NewDL,ODLIds,LVs,StrCs)).
change_dependent_relations_in_view(_Viewname/_Arity,_RelationName,_NewRelationName).

% Get tables/relations relations that directly depend on predicate RelationName/Arity, i.e., there exist an arc in the pdg connecting them
dependent_relations(RelationName/Arity,Preds) :-
  !,
  get_pdg((_Nodes,Arcs)),
  findall(Pred,(member(Pred+RelationName/Arity,Arcs) ; member(Pred-RelationName/Arity,Arcs)),UPreds),
  my_quicksort(UPreds,Preds).
dependent_relations(RelationName,RelationNames) :-
  !,
  get_pdg((_Nodes,Arcs)),
  findall(Name,(member(Name/NArity+RelationName/Arity,Arcs) ; member(Name/NArity-RelationName/Arity,Arcs)),URelationNames),
  my_quicksort(URelationNames,RelationNames).

% Get tables/relations with foreign keys referencing the given RelationName/Arity
referenced_relations(RelationName/Arity,Preds) :-
  !,
  findall(OtherTableName/OtherArity,
          (my_foreign_key('$des',OtherTableName,_PAtts,RelationName,_FKAtts),
           my_table('$des',RelationName,Arity),
           my_table('$des',OtherTableName,OtherArity)),
          UPreds),
  my_quicksort(UPreds,Preds).
referenced_relations(RelationName,RelationNames) :-
  !,
  findall(OtherTableName,
          my_foreign_key('$des',OtherTableName,_PAtts,RelationName,_FKAtts),
          URelationNames),
  my_quicksort(URelationNames,RelationNames).

%%%%%%%%%%%%%%%%%
% Rename view
%%%%%%%%%%%%%%%%%

rename_view(Viewname,NewViewname) :-
  % Change table name
  retract(my_table('$des',Viewname,Arity)),
  assertz(my_table('$des',NewViewname,Arity)),
  % Change attributes
  (
   retract(my_attribute('$des',Pos,Viewname,Att,Type)),
   assertz(my_attribute('$des',Pos,NewViewname,Att,Type)),
   fail
  ;
   true
  ),
  % Change view
  retract(my_view('$des',Viewname,Arity,SQL,Lang,DL,ODLIds,LVs,StrCs)),
  replace_functor(Viewname,NewViewname,SQL,NewSQL),
  replace_functor(Viewname,NewViewname,DL,NewDL),
  assertz(my_view('$des',NewViewname,Arity,NewSQL,Lang,NewDL,ODLIds,LVs,StrCs)),
  replace_functor_dlrules_from_list(name,[Viewname|LVs],Viewname,NewViewname),
  % Change view definitions involving the old view name
  rename_goals_in_view_definitions(Viewname/Arity,NewViewname).
  

%%%%%%%%%%%%%%%%%%%%
% Create table LIKE
%%%%%%%%%%%%%%%%%%%%

create_table_like(NewTableName,TableName) :-
  my_table(_,TableName,Arity),
  assertz(my_table('$des',NewTableName,Arity)),
  % Create attributes
  (
   my_attribute('$des',Pos,TableName,Att,Type),
   assertz(my_attribute('$des',Pos,NewTableName,Att,Type)),
   fail
  ;
   true
  ),
  % Create predefined integrity constraints:
  % - Not nullables
  (
   my_not_nullables('$des',TableName,NNAtts),
   assertz(my_not_nullables('$des',NewTableName,NNAtts)),
   fail
  ;
   true
  ),
  % - Primary key
  (
   my_primary_key('$des',TableName,PKAtts),
   assertz(my_primary_key('$des',NewTableName,PKAtts)),
   fail
  ;
   true
  ),
  % - Candidate keys
  (
   my_candidate_key('$des',TableName,CKAtts),
   assertz(my_candidate_key('$des',NewTableName,CKAtts)),
   fail
  ;
   true
  ),
  % - Foreign keys
  (
   my_foreign_key('$des',TableName,PAtts,FKTableName,FKAtts),
   assertz(my_foreign_key('$des',NewTableName,PAtts,FKTableName,FKAtts)),
   fail
  ;
   true
  ),
  % - Referenced by other table's foreign keys
  (
   my_foreign_key('$des',OtherTableName,PAtts,TableName,FKAtts),
   assertz(my_foreign_key('$des',OtherTableName,PAtts,NewTableName,FKAtts)),
   fail
  ;
   true
  ),
  % - Functional dependency
  (
   my_functional_dependency('$des',TableName,AttNames,DepAttNames),
   assertz(my_functional_dependency('$des',NewTableName,AttNames,DepAttNames)),
   fail
  ;
   true
  ),
  % Create user-defined integrity constraints
  (
   my_integrity_constraint('$des',Preds,Constraint,NVs,Head),
   my_member_chk(TableName/Arity,Preds),
   replace_functor_dlrules_from(head,Head,TableName,NewTableName),
   replace_functor(TableName,NewTableName,Preds,NewPreds),
   replace_functor(TableName,NewTableName,Constraint,NewConstraint),
   my_integrity_constraint('$des',Preds,Constraint,NVs,Head),
   assertz(my_integrity_constraint('$des',NewPreds,NewConstraint,NVs,Head)),
   fail
  ;
   true
  ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checking integrity constraints in the context of the database
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check database w.r.t. its integrity constraints
% A database may become inconsistent w.r.t. its integrity constraints if 
% constraint checking is disabled and inconsistent tuples and/or integrity 
% constraints are added along this
check_db :-
  current_db('$des',_),
  !,
  push_flag(check_ic,on,CF),
  write_info_log(['Checking type constraints...']),
  get_type_ctrs(TCtrs),
  check_type_ctr_list(TCtrs),
  write_info_log(['Checking existency constraints...']),
  findall(my_not_nullables('$des',A,B),my_not_nullables('$des',A,B),NNCtrs),
  check_ctr_failing_list(NNCtrs),
  write_info_log(['Checking primary key constraints...']),
  findall(my_primary_key('$des',A,B),my_primary_key('$des',A,B),PKCtrs),
  check_ctr_failing_list(PKCtrs),
  write_info_log(['Checking candidate key constraints...']),
  findall(my_candidate_key('$des',A,B),my_candidate_key('$des',A,B),CKCtrs),
  check_ctr_failing_list(CKCtrs),
  write_info_log(['Checking foreign key constraints...']),
  findall(my_foreign_key('$des',A,B,C,D),my_foreign_key('$des',A,B,C,D),FKCtrs),
  check_ctr_failing_list(FKCtrs),
  write_info_log(['Checking functional dependency constraints...']),
  findall(my_functional_dependency('$des',A,B,C),my_functional_dependency('$des',A,B,C),FDCtrs),
  check_ctr_failing_list(FDCtrs),
  write_info_log(['Checking user-defined integrity constraints...']),
  findall(my_integrity_constraint('$des',A,B,C,D),my_integrity_constraint('$des',A,B,C,D),ICCtrs),
  check_ctr_failing_list(ICCtrs),
  pop_flag(check_ic,CF).
check_db :-
  write_error_log(['This command does not support ODBC connections, yet']).

get_type_ctrs(TCtrs) :-
  get_tablenames(TableNames),
  get_type_ctr_list(TableNames,TCtrs).
  
get_type_ctr_list([],[]).
get_type_ctr_list([TableName|TableNames],[my_types('$des',TableName,ColnamesTypes)|TCtrs]) :-
  get_table_typed_arguments(TableName,ColnamesTypes),
  get_type_ctr_list(TableNames,TCtrs).
  
check_type_ctr_list([]).
check_type_ctr_list([TCtr|TCtrs]) :- 
  check_type_ctr(TCtr),  
  check_type_ctr_list(TCtrs).
  
check_type_ctr(my_types('$des',TableName,ColnameTypes)) :-
  length(ColnameTypes,Arity),
  % Remove the type schema:
  pop_type_declaration(TableName,Arity,_DeclaredTypes,_ColnameTypes),
  % Check whether the types are consistent with the loaded database
  (check_ctr(my_types('$des',TableName,ColnameTypes)) ->
    % Consistent
    true
   ;
    Schema=..[TableName,ColnameTypes],
    write_error_log(['In type constraint: ',Schema,nl])
  ),
  push_type_declaration(TableName,Arity,ColnameTypes).
  
%
% Types
%
% check_ctr(my_types('$des',TableName,ColnameTypes)) :-
%   (verbose(on) -> write_log_list(['Info: Checking types over database for relation ''',TableName,'''.',nl]) ; true),
%   length(ColnameTypes,Arity),
%   get_object_dlrules(namearity,TableName/Arity,DLs),
%   dlrule_to_rule_list(DLs,Rules),
%   findall(Types,my_member(_Colname:Types,ColnameTypes),DeclaredTypes),
%   check_rule_types_list(TableName,Rules,DeclaredTypes).

check_ctr(my_types('$des',TableName,ColnameTypes)) :-
  check_ic(on),
  !,
  (verbose(on) -> write_log_list(['Info: Checking types over database for relation ''',TableName,'''.',nl]) ; true),
  findall(Types,my_member(_Colname:Types,ColnameTypes),DeclaredTypes),
  length(ColnameTypes,Arity),
  check_pred_types(TableName/Arity,DeclaredTypes).
check_ctr(my_types('$des',_TableName,_ColnameTypes)).

%
% Nullability
%
check_ctr(my_not_nullables('$des',TableName,NN_AttNames)) :-
  check_ic(on),
  !,
  (verbose(on) -> write_log_list(['Info: Checking nullability over database for relation ''',TableName,'''.',nl]) ; true),
  my_table('$des',TableName,Arity),
  functor(Fact,TableName,Arity),
  build_PK_goal(Fact,TableName,NN_AttNames,NN_Vars,Goal),
  Head=..[nn|NN_Vars],
  my_list_to_list_of_lists(NN_Vars,NN_Vars_List),
  my_univ_list('is_null',NN_Vars_List,Conditions),
  my_list_to_disjunction(Conditions,Condition),
  Query=':-'(Head,(Goal,Condition)),
  get_answer(Query,Facts),
  (bagof(NN,my_member(NN,Facts),NNs) ->
    write_error_log(['Null values found for ',TableName,'.',NN_AttNames,nl,
                     '       Offending values in database: ',NNs]),
    !,
    fail
   ;
    true
  ).
check_ctr(my_not_nullables('$des',_TableName,_NN_AttNames)).
  
%
% Primary Key
%
check_ctr(my_primary_key('$des',TableName,PK_AttNames)) :-
  check_ctr(my_unique_key('$des',TableName,PK_AttNames),pk).
%
% Candidate Key
%
check_ctr(my_candidate_key('$des',TableName,K_AttNames)) :-
  check_ctr(my_unique_key('$des',TableName,K_AttNames),ck).
%
% Foreign Key
%
check_ctr(my_foreign_key('$des',TableName,FK_AttNames,FTableName,PK_AttNames)) :-
  check_ic(on),
  !,
  (verbose(on) -> write_log_list(['Info: Checking foreign key over database for relation ''',TableName,'''.',nl]) ; true),
  my_table('$des',TableName,Arity),
%  length(FK_AttNames,Arity),
  functor(TableGoal,TableName,Arity),
  build_FK_goal(TableGoal,FK_AttNames,FTableName,PK_AttNames,FK_Vars,FTableGoal),
  Head=..[fk|FK_Vars],
  Query=':-'(Head,(TableGoal,not(group_by(FTableGoal,FK_Vars,true)))),
  get_answer(Query,Facts),
  (bagof(FK,my_member(FK,Facts),FKs) ->
    write_error_log(['Foreign key violation ',TableName,'.',FK_AttNames,'->',FTableName,'.',PK_AttNames,nl,
                     '       Offending values in database: ',FKs]),
    !,
    fail
   ;
    true
  ).
check_ctr(my_foreign_key('$des',_TableName,_FK_AttNames,_FTableName,_PK_AttNames)).

%
% Functional Dependency
%
check_ctr(my_functional_dependency('$des',TableName,AttNames,DepAttNames)) :-
  check_ic(on),
  !,
  (verbose(on) -> write_log_list(['Info: Checking functional dependency over database for relation ''',TableName,'''.',nl]) ; true),
  my_table('$des',TableName,Arity),
  functor(Fact,TableName,Arity),
  build_FD_goal(Fact,AttNames,DepAttNames,FDGoal),
  FDGoal=':-'(H,B),
  Goal=':-'(H,(Fact,B)),
  get_answer(Goal,FDs),
  (FDs == [] ->
    true
   ;
    write_error_log(['Functional dependency violation ',TableName,'.',AttNames,'->',TableName,'.',DepAttNames,nl,
                     '       Offending values in database: ',FDs]),
    !,
    fail
  ).
check_ctr(my_functional_dependency('$des',_TableName,_AttNames,_DepAttNames)).

%
% User-defined Integrity Constraint
%
check_ctr(my_integrity_constraint('$des',_Preds,Constraint,NVs,Head)) :-
  check_ic(on),
  !,
  (verbose(on) -> 
    write_log_list(['Info: Checking user-defined integrity constraint over database.',nl]),
    write_datalog_rule((':-'(Constraint),NVs),7),
    nl_log
   ; 
    true
  ),
  get_answer(Head,Witnesses),
  (Witnesses==[] ->
    true
   ;
    write_error_log(['Integrity constraint violation.',nl]),
    (development(on) ->
      RHead=Head,
      RWitnesses=Witnesses
     ;
      replace_functor_term_list([Head|Witnesses],ic,[RHead|RWitnesses])
    ),
    write_datalog_rule((':-'(RHead,Constraint),NVs),7),
    nl_log,
    functor(Head,_,A),
    (A>0 -> % There are relevant variables to show
      write_log_list(['       Offending values in database: ',RWitnesses,nl]),
      write_tapi_eot
     ; 
      true
    ),
    !,
    fail
  ).
check_ctr(my_integrity_constraint('$des',_Preds,_Constraint,_NVs,_Head)).
    
%
% Unique Key
%
check_ctr(my_unique_key('$des',TableName,AttNames),Kind) :-
  check_ic(on),
  !,
  (Kind=pk ->
    Message='primary key',
    UMessage='Primary key'
   ;
    Message='candidate key',
    UMessage='Candidate key'
  ),
  check_ctr(my_not_nullables('$des',TableName,AttNames)),
  (verbose(on) -> write_log_list(['Info: Checking ',Message,' over database for relation ''',TableName,'''.',nl]) ; true),
  my_table('$des',TableName,Arity),
  functor(Fact,TableName,Arity),
  build_PK_goal(Fact,TableName,AttNames,UK_Vars,Goal),
  Head=..[Kind|UK_Vars],
  Query=':-'(Head,group_by(Goal,UK_Vars,count>1)),
  get_answer(Query,Facts),
  (bagof(UK,my_member(UK,Facts),UKs) ->
    write_error_log([UMessage,' violation ',TableName,'.',AttNames,nl,
                     '       Offending values in database: ',UKs]),
    !,
    fail
   ;
    true
  ).
check_ctr(my_unique_key('$des',_TableName,_AttNames),_Kind).

check_tuple_type_ctr_list([]).  
check_tuple_type_ctr_list([Fact|Facts]) :-
%  infer_rule_types(Fact,_,_),
  check_rule_types(Fact),
  !,
  check_tuple_type_ctr_list(Facts).
check_tuple_type_ctr_list([Fact|_Facts]) :-
  functor(Fact,T,_A),
  get_table_types(T,DeclTypes),
  write_error_log(['Type mismatch ',DeclTypes,' (table declaration)',nl,
                   '       Witness fact: ',Fact]),
  !,
  fail.
  
  
% Testing whether a given table exists for current connection
% Used for syntax checking. An exception is raised should the arguments do not exist
exist_table(TableName) :-
  exist_table(TableName,_Arity).
  
exist_table(TableName,Arity) :-
  current_db('$des',_Handle),
  !,
  (des_table_exists(TableName,Arity)
   ->
   true
   ;
   my_raise_exception(unknown_table(TableName),syntax(''),[])
  ).
exist_table(TableName,_Arity) :-
  (my_odbc_exists_table(TableName)
   ->
   true
   ;
   my_raise_exception(unknown_table(TableName),syntax(''),[])
  ).
  
des_table_exists(TableName) :-
  des_table_exists(TableName,_Arity).

des_table_exists(TableName,Arity) :-
  my_table('$des',TableName,Arity),
  \+ my_view('$des',TableName,_A,_S,_La,_D,_ODLIds,_L,_SC).


des_relation_exists(Relationname) :-
  des_relation_exists(Relationname,_Arity).

des_relation_exists(Relationname,Arity) :-
  my_table('$des',Relationname,Arity).

% Testing whether a given view exists for current connection
% Used for syntax checking. An exception is raised should the arguments do not exist
exist_view(Viewname) :-
  exist_view(Viewname,_Arity).
  
exist_view(Viewname,Arity) :-
  current_db('$des',_Handle),
  !,
  (my_view('$des',Viewname,Arity,_S,_La,_D,_ODLIds,_L,_SC)
   ->
   true
   ;
   my_raise_exception(unknown_view(Viewname),syntax(''),[])
  ).
exist_view(Viewname,_Arity) :-
  (my_odbc_exists_view(Viewname)
   ->
   true
   ;
   my_raise_exception(unknown_view(Viewname),syntax(''),[])
  ).

% Testing whether a given relation exists for current connection
% Used for syntax checking. An exception is raised should the arguments do not exist
exist_relation(Relation) :-
  exist_relation(Relation,_Arity).
  
exist_relation(Relation,Arity) :-
  current_db('$des',_Handle),
  !,
  (my_table('$des',Relation,Arity) 
   ->
   true
   ;
   my_raise_exception(unknown_relation(Relation),syntax(''),[])
  ).
exist_relation(Viewname,_Arity) :-
  (my_odbc_exists_view(Viewname)
   ->
   true
   ;
   my_raise_exception(unknown_view(Viewname),syntax(''),[])
  ).

% Testing whether a given predicate (Functor/Arity) exists for current connection
% Used for syntax checking. An exception is raised should the arguments do not exist
exist_user_predicate(Predicate) :-
  pdg_user_predicates(UserPredicates),
  (member(Predicate,UserPredicates) 
   ->
   true
   ;
   my_raise_exception(unknown_user_predicate(Predicate),syntax(''),[])
  ).

% Testing whether a given set of arguments does exist for a given table for '$des'
% Used for syntax checking. An exception is raised should the arguments do not exist
exist_atts(_TableName,[]).  
exist_atts(TableName,[Att|Atts]) :-
  (my_attribute('$des',_Pos,TableName,Att,_Type) ->
   exist_atts(TableName,Atts)
  ;
%    write_log_list(['Error: Unknown column ',Att,'.',nl]),
%    !,
%    fail).
   my_raise_exception(unknown_column(TableName,Att),syntax(''),[])
  ).

% Testing whether a given relation does exist in the current connection
relation_exists(Relation) :-
  current_db('$des',_Handle),
  !,
  my_table('$des',Relation,_Arity).
relation_exists(Relation) :-
  my_odbc_exists_table(Relation).
relation_exists(Relation) :-
  my_odbc_exists_view(Relation).
  

nn_consistent(_Pred,_NN_AttNames) :-   
  % WARNING: TODO
  !,
  true.
nn_consistent(Pred,NN_AttNames) :-   
  write_error_log(['Not null assertion failed for relation ',Pred,nl,
                   '        There are null values for columns ',NN_AttNames]).

pk_consistent(_Pred,_PK_AttNames) :-   
  % WARNING: TODO
  !,
  true.
pk_consistent(Pred,PK_AttNames) :-   
  write_error_log(['Primary key assertion failed for relation ',Pred,nl,
                   '        There are repeated entries for columns ',PK_AttNames]).

ck_consistent(Pred,PK_AttNames) :-   
  pk_consistent(Pred,PK_AttNames).

same_type_atts(_TableName,[],_FTableName,[]).
same_type_atts(TableName,[Att|Atts],FTableName,[FAtt|FAtts]) :-
  my_attribute('$des',_Pos,TableName,Att,Type),
  my_attribute('$des',_FPos,FTableName,FAtt,FType),
  (Type==FType ->
   same_type_atts(TableName,Atts,FTableName,FAtts)
   ;
   write_error_log(['Type mismatch ',TableName,'.',Att,':',Type,' <> ',FTableName,'.',FAtt,':',FType,'.']),
   !,
   fail).

assert_attr_types(Table,TypedAttrs) :-
  assert_attr_types(1,Table,TypedAttrs).
        
assert_attr_types(_I,_Table,[]) :- !.
assert_attr_types(I,Table,[C:T|CTs]) :-
  assertz(my_attribute('$des',I,Table,C,T)),
  I1 is I+1,
  assert_attr_types(I1,Table,CTs).

% Create view
create_view(Lang,SQLst,Schema,LVDs) :-
  create_view_k(Lang,SQLst,Schema,LVDs),
  abolishET, 
  compute_stratification.
  
% Create view, untouching ET, no stratification computation
% drop table schema, create view schema, compute view, restore table schema
create_view_k(Lang,(with(SQLst,SQLsts),Schema),Schema,_LVDs) :-
  !,
  create_prototype_view_list(SQLsts,LocalViewDefs,_OldSchemas),
  catch((create_or_replace_view_list_k(Lang,SQLsts,LocalViewDefs),
         create_view_k(Lang,SQLst,Schema,LocalViewDefs)),
        Message,
        (Schema =.. [ViewName|_Args],
         drop_viewname_k_list([ViewName|LocalViewDefs]),
         !,
         throw(Message))
        ).
% Schema-less view definition: only view name
create_view_k(Lang,(SQLst,Schema),ViewName,LocalViewDefs) :-
  atom(ViewName),
  TableName=ViewName,
  catch(compile_to_dl(Lang,SQLst,Schema,DLsts),
        Message,
        (
         create_view_k_error(ViewName),
         !,
         throw(Message)
        )
       ),
  DLsts=[':-'(Head,_)|_],
  (functor(Head,Pred,Arity) 
   ->
   replace_predicate_names_and_assert(Pred,Arity,TableName,DLsts,RDLsts,DVs,ODLIds,_Error1),
   length(TypedArgs,Arity),
   display_compiled_sql(RDLsts),
   dictionary(SCs),
   schema_to_colnametypes(Schema,TypedArgs),
   allowed_colnametype_list(TypedArgs),
   (infer_types_and_assert(DVs,TypedArgs)
    ->
     assertz(my_view('$des',TableName,Arity,SQLst,Lang,DVs,ODLIds,LocalViewDefs,SCs)),
     write_verb_list(['Info: View created.',nl])
    ;
     !,
     retract_rule_by_id_list(ODLIds,_Error2),
     create_view_k_error(ViewName),
     fail
   )
   ;
   create_view_k_error(ViewName),
   my_raise_exception(generic,syntax(['Incorrect number of columns in data provider (must be ',Arity,').']),[])
  ),
  !.
create_view_k(Lang,(SQLst,AS),Schema,LocalViewDefs) :-
  functor(Schema,TableName,Arity),
  % Assert provisional schema for view if not yet available: colnames given but no types yet
  % This is needed for the translation from SQL to Datalog
  (my_table('$des',TableName,Arity) ->
   get_table_typed_arguments(TableName,TypedArgs),
   (Schema =.. [TableName|TypedArgs] ->
     true
    ;
     SchemaM =.. [TableName|TypedArgs],
     write_error_log(['Schema mismatch: ',Schema,' : ', SchemaM])
   )
   ;
   assertz(my_table('$des',TableName,Arity)),
   Schema =.. [TableName|TypedArgs],
   assert_attr_types(TableName,TypedArgs)
  ),
  catch(compile_to_dl(Lang,SQLst,AS,DLsts),
        Message,
        (
%         create_view_k_error(AS),
         create_view_k_error(Schema),
         !,
         throw(Message)
        )
       ),
  % Remove provisional schema for view
  % Needed for asserting rules and avoid inferring types with provisional schema
  retract(my_table('$des',TableName,Arity)),
  retractall(my_attribute('$des',_Pos,TableName,_Colname,_DVs)),
  retractall(my_view('$des',TableName,Arity,_,_,_,_,_,_)),
  DLsts=[':-'(Head,_)|_],
  (functor(Head,Pred,Arity) 
   ->
   replace_predicate_names_and_assert(Pred,Arity,TableName,DLsts,RDLsts,DVs,ODLIds,_Error1),
   display_compiled_sql(RDLsts),
   dictionary(SCs),
   (infer_types_and_assert(DVs,TypedArgs)
    ->
     assertz(my_view('$des',TableName,Arity,SQLst,Lang,DVs,ODLIds,LocalViewDefs,SCs)),
     write_verb_list(['Info: View created.',nl])
    ;
     %write_error_log(['Type conflict(s).']),
     !,
     retract_rule_by_id_list(ODLIds,_Error2),
     create_view_k_error(Schema),
     fail
%     throw(des_exception(''))
   )
   ;
   create_view_k_error(Schema),
   my_raise_exception(generic,syntax(['Incorrect number of columns in data provider (must be ',Arity,').']),[])
  ).
create_view_k(_Lang,_SQLst,Schema,_LVDs) :-
  create_view_k_error(Schema),
  !,
  fail.
  
create_view_k_error(Schema) :-
  Schema =.. [TableName|_Args],
  (retract(my_view('$des',TableName,_ArityV,_SQLst,_Lang,_DVs,_ODLIds,LocalViewDefs,_SCs))
   ->
    drop_view_k_list([TableName|LocalViewDefs])
   ;
    retractall(my_table('$des',TableName,_ArityT)),
    retractall(my_attribute('$des',_Pos,TableName,_Att,_Type))
  ).

% Compiling to Datalog from either SQL or RA
compile_to_dl(sql,SQLst,Schema,DLsts) :-
  sql_to_dl((SQLst,_AS),Schema,_TableRen,DLsts).
compile_to_dl(ra,RAst,Schema,DLsts) :-
  ra_to_sql(RAst,(SQLst,AS)),
  sql_to_dl((SQLst,AS),Schema,_TableRen,DLsts).
  
% Try to infer types and assert schema on success
% infer_types_and_assert(+DVs,?TypedArgs)
infer_types_and_assert(DVs,TypedArgs) :-
  ruleNV_to_rule_list(DVs,Rs),
  Rs=[R|_TRs],
  get_rule_table_name_arity(R,TableName,Arity),
  infer_types_list(Rs,InferredTypes,ITypedArgs,_ExtraTypes),
%  (nonvar(TypedArgs) -> type_to_coltype_list(DeclaredTypes,TypedArgs) ; true),
  type_to_coltype_list(DeclaredTypes,TypedArgs),
  ((\+ my_ground(TypedArgs)
    ;
    type_subsumed_list(InferredTypes,DeclaredTypes)
   )
   ->
    swap_ucnt_icnt(TypedArgs,ITypedArgs),
    assertz(my_table('$des',TableName,Arity)),
    assert_attr_types(TableName,TypedArgs)
   ;
    write_error_log(['Type mismatch ',InferredTypes,' (inferred types) vs. ',DeclaredTypes,' (declared types).']),
    !,
    fail
  ).


% Predicate,Arity,NewPredicate,Rules,ReplacedRules,RNVss,Error
replace_predicate_names_and_assert(P,Arity,Q,DLsts,RDLsts,DVs,ODLIds,Error) :-
  replace_functor(P,Q,DLsts,ARDLsts),
  number_codes(Arity,SArity),
  "_"=[US],
  atom_codes(AArity,[US|SArity]),
  atom_codes(P,[P1,P2|_]),
  atom_codes(AP,[P1,P2]),
  atom_concat(Q,AArity,NQ),
  atom_concat(NQ,'_',NLV),
  replace_functor_substring(AP,NLV,ARDLsts,RDLsts),
%  unfold_rules(RDLsts,UDLsts),
%  assign_variable_names_list(UDLsts,DVs),
  assign_variable_names_list(RDLsts,DVs),
  disable_safety_warnings(SW),
  assert_rules(DVs,[simplify,no_safety],ODLIds,Error),
  restore_safety_warnings(SW).

% Create views in a list, untouching ET, no stratification computation
create_or_replace_view_list_k(_Lang,[],_NewViewNames).
create_or_replace_view_list_k(Lang,[(SQLst,Schema)|Schemas],NewViewNames) :-
  create_or_replace_view_k(Lang,(SQLst,Schema),Schema,NewViewNames),
  create_or_replace_view_list_k(Lang,Schemas,NewViewNames).

% Create prototype views from SQL schemas. 
% Return the list of new view names (existing ones correspond to hypothetical query), 
% and defines the prototype view schema as facts
create_prototype_view_list(Schemas,NewViewnames,OldSchemas) :-
  check_complete_schemas(Schemas),
  check_no_redefinitions(Schemas),
  old_schemas(Schemas,OldSchemas),
  build_prototype_view_list(Schemas,NewViewnames).

check_complete_schemas([]).
check_complete_schemas([(_SQLst,Schema)|Vs]) :-
  (atom(Schema)
   ->
    my_raise_exception(generic,syntax(['Complete schema required for local view definition: ',Schema]),[])
   ;
    check_complete_schemas(Vs)).

check_no_redefinitions(_Schemas) :-
  hypothetical(on),
  !.
check_no_redefinitions([]).
check_no_redefinitions([(_SQLst,Schema)|Vs]) :-
  functor(Schema,TableName,_Arity),
  check_no_redefinition(TableName),
  check_no_redefinitions(Vs).

check_no_redefinition(TableName) :-
  (my_table('$des',TableName,Arity) -> 
   my_raise_exception(generic,syntax(['Syntax error. Trying to redefine ',TableName,'/',Arity]),[])
  ;
   true).
    
old_schemas(_Schemas,[]) :-
  hypothetical(off),
  !.
old_schemas([],[]).
old_schemas([(_SQLst,Schema)|Schemas],OldSchemas) :-
  functor(Schema,TableName,Arity),
  Table=my_table('$des',TableName,Arity),
  call(Table), % Hypothetical
  !,
  findall(my_attribute('$des',Pos,TableName,Attr,Type),my_attribute('$des',Pos,TableName,Attr,Type),Atts),
  View=my_view('$des',TableName,Arity,_,_,_RNVss,_,_,_),
  (call(View)
   ->
%   get_object_dlrules_list(RNVss,ODLs),
%   append([Table,View|Atts],ODLs,OldSchema)
    OldSchema=[Table,View|Atts]
   ;
    OldSchema=[Table|Atts]
  ),
  old_schemas(Schemas,OldSchemas1),
  append(OldSchema,OldSchemas1,OldSchemas).
old_schemas([_Schema|Schemas],OldSchemas) :-
  old_schemas(Schemas,OldSchemas).
    
% Build new prototype schemas
% If hypothetical enabled schema might exist already
% Returns new view names, but not existing ones 
build_prototype_view_list([],[]).
build_prototype_view_list([(_SQLst,Schema)|Vs],TableNames) :-
  functor(Schema,TableName,Arity),
  my_table('$des',TableName,Arity), % Hypothetical. Existing view
  my_view('$des',TableName,Arity,_SQL,_Lang,_DVs,_ODLIds,_LVDs,_SCs),
  !,
  build_prototype_view_list(Vs,TableNames).
build_prototype_view_list([(_SQLst,Schema)|Vs],TableNames) :-
  functor(Schema,TableName,Arity),
  my_table('$des',TableName,Arity), % Hypothetical. Existing table
  !,
  build_prototype_view_list(Vs,TableNames).
build_prototype_view_list([(_SQLst,Schema)|Vs],[TableName|TableNames]) :-
  Schema =.. [TableName|Args],
  assertz(my_table('$des',TableName,Arity)),
  assert_attr_types(TableName,Args),
  assertz(my_view('$des',TableName,Arity,_SQL,sql,_DVs,_ODLIds,_LVDs,_SCs)),
  build_prototype_view_list(Vs,TableNames).

% Create or replace view
create_or_replace_view(Lang,(SQLst,AS),Schema) :-
  Schema=..[TableName|_Args],
  (my_table('$des',TableName,_) -> 
   drop_view_k(TableName),
   !
   ;
   true),
  create_view(Lang,(SQLst,AS),Schema,[]).
  
% Create or replace view, untouching ET, no stratification computation
create_or_replace_view_k(Lang,(SQLst,Schema),Schema,NewViewNames) :-
  functor(Schema,Viewname,_Arity),
  (my_table('$des',Viewname,_) -> 
   ((member(Viewname,NewViewNames)
     ;
     hypothetical(off)
    )
    ->
    drop_view_k(Viewname)
    ;
    true
   ),
   !
   ;
   true),
  create_view_k(Lang,(SQLst,Schema),Schema,[]).


% Drop tables if exists
drop_table_if_exists_list([],_IfExists,Dropped) :-
  (Dropped==true
   ->
    abolishET, 
    compute_stratification
   ;
    true).
drop_table_if_exists_list([TableName|TableNames],IfExists,Dropped) :-
  drop_table_if_exists(TableName,IfExists,Dropped),
  drop_table_if_exists_list(TableNames,IfExists,Dropped).
  
drop_table_if_exists(TableName,IfExists,Dropped) :-
  (my_not(my_table('$des',TableName,_Arity))
   -> 
    (IfExists==false
     ->
      write_error_log(['Table ''',TableName,''' not defined.'])
     ;
      true
    )
   ;
    drop_table_k(TableName),
    Dropped=true,
    store_elapsed_time(computation),
    display_elapsed_time,
    write_tapi_success
  ).
% Drop table
drop_table(TableName) :-
  my_table('$des',TableName,Arity),
  retractall(my_table('$des',TableName,Arity)),
  retractall(my_attribute('$des',_Pos,TableName,_Attr,_Type)),
  retractall(my_not_nullables('$des',TableName,_NNAtts)),
  retractall(my_primary_key('$des',TableName,_PKAtts)),
  retractall(my_candidate_key('$des',TableName,_CKAtts)),
  retractall(my_foreign_key('$des',TableName,_PAtts,_FKTableName,_FKAtts)),
  retractall(my_functional_dependency('$des',TableName,_FDAtts,_FDDetAtts)),
  get_object_dlrules(namearity,TableName/Arity,ODLs),
  retract_dlrule_list(ODLs,_Error),
  abolishET, 
  rollup_stratification(_DLsts),
  write_verb_list(['Info: Table ''',TableName,''' dropped.',nl]).

% Drop table, untouching ET, no stratification computation
drop_table_k(TableName) :-
  my_table('$des',TableName,Arity),
  retractall(my_table('$des',TableName,Arity)),
  retractall(my_attribute('$des',_Pos,TableName,_Attr,_Type)),
  retractall(my_not_nullables('$des',TableName,_NNAtts)),
  retractall(my_primary_key('$des',TableName,_PKAtts)),
  retractall(my_candidate_key('$des',TableName,_CKAtts)),
  retractall(my_foreign_key('$des',TableName,_PAtts,_FKTableName,_FKAtts)),
  retractall(my_foreign_key('$des',_TableName,_Atts,TableName,_FAtts)),
  retractall(my_functional_dependency('$des',TableName,_FDAtts,_FDDetAtts)),
  get_object_dlrules(namearity,TableName/Arity,ODLs),
  retract_dlrule_list(ODLs,_Error),
  write_verb_list(['Info: Table ''',TableName,''' dropped.',nl]).

% Drop view
drop_view(TableName) :-
  my_table('$des',TableName,Arity),
  retractall(my_table('$des',TableName,Arity)),
  retractall(my_attribute('$des',_Pos,TableName,_Attr,_Type)),
  my_view('$des',TableName,Arity,SQLst,Lang,RNVss,ODLIds,LVDs,SCs),
  drop_viewname_k_list(LVDs),
%  get_object_dlrules_list(RNVss,ODLs),
%  retract_dlrule_list(ODLs,_Error),
  retract_rule_by_id_list(ODLIds,_Error),
  retractall(my_view('$des',TableName,Arity,SQLst,Lang,RNVss,ODLIds,LVDs,SCs)),
  abolishET, 
  rollup_stratification(RNVss),
  write_verb_list(['Info: View ''',TableName,''' dropped.',nl]).

% Drop view, untouching ET, no stratification computation
drop_view_k(TableName) :-
  my_table('$des',TableName,Arity),
  retractall(my_table('$des',TableName,Arity)),
  retractall(my_attribute('$des',_Pos,TableName,_Attr,_Type)),
  my_view('$des',TableName,Arity,SQLst,Lang,RNVss,ODLIds,LVDs,SCs),
  drop_viewname_k_list(LVDs),
%  get_object_dlrules_list(RNVss,ODLs),
%  retract_dlrule_list(ODLs,_Error),
  retract_rule_by_id_list(ODLIds,_Error),
  retractall(my_view('$des',TableName,Arity,SQLst,Lang,RNVss,ODLIds,LVDs,SCs)),
  write_verb_list(['Info: View ''',TableName,''' dropped.',nl]).
drop_view_k(_TableName).

% Drop views in a list
%drop_view_list([]).
%drop_view_list([(_SQLst,Schema)|Vs]) :-
%  Schema =.. [TableName|_Args],
%  solve_des_sql_query(drop_view(TableName)),
%  drop_view_list(Vs).

% Drop views in a list, untouching ET
drop_view_k_list([]).
drop_view_k_list([(_SQLst,Schema)|Vs]) :-
  Schema =.. [TableName|_Args],
  drop_view_k(TableName),
  drop_view_k_list(Vs).

% Drop view names in a list, untouching ET
drop_viewname_k_list([]).
drop_viewname_k_list([ViewName|VNs]) :-
  drop_view_k(ViewName),
  drop_viewname_k_list(VNs).

% Drop database
drop_database :-
  reset_database.
%   get_viewnames(AllViewNames),
%   get_localviewnames(LocalViewNames),
%   my_set_diff(AllViewNames,LocalViewNames,ViewNames),
%   drop_viewname_k_list(ViewNames),
%   get_tablenames(TableNames),
%   drop_tablename_k_list(TableNames),
%   reset_database,
%   rollup_stratification(_),
%   write_info_verb_log(['Database dropped.']).

drop_tablename_k_list([]).
drop_tablename_k_list([TableName|TableNames]) :-
  drop_table_k(TableName),
  drop_tablename_k_list(TableNames).

get_tablenames(TableNames) :-
  get_tablenames(_TableName,TableNames).

get_viewnames(ViewNames) :-
  get_viewnames(_ViewName,ViewNames).

% Testing whether the des database is empty
empty_des_rdb :-
  get_tablenames(Ts),
  !,
%  (Ts==[] ; Ts==[dual]),
  Ts==[],
  get_viewnames(Vs),
  !,
  Vs==[].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Database Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*********************************************************************/
/* Listing tables: list_tables/0                                     */
/*********************************************************************/

list_tables :-
  get_tablenames(_Name,UnorderedTableNames),
  my_quicksort(UnorderedTableNames,TableNames),
  display_lines(TableNames),
  write_tapi_eot.

/*********************************************************************/
/* Listing table schema: list_table_schemas/0                        */
/*********************************************************************/

list_table_schemas :-
  get_tablenames(_Name,UnorderedTableNames),
  my_quicksort(UnorderedTableNames,TableNames),
  list_table_schema_list(TableNames),
  write_tapi_eot.

/*********************************************************************/
/* Listing tables: list_views/0                                      */
/*********************************************************************/

list_views :-
  get_viewnames(_Name,UnorderedViewNames),
  my_quicksort(UnorderedViewNames,ViewNames),
  display_lines(ViewNames),
  write_tapi_eot.

/*********************************************************************/
/* Listing view schema: list_view_schemas/0                          */
/*********************************************************************/

list_view_schemas :-
  get_viewnames(_Name,UnorderedViewNames),
  my_quicksort(UnorderedViewNames,ViewNames),
  list_table_schema_list(ViewNames),
  write_tapi_eot.

/*********************************************************************/
/* Listing the DB schema: list_schema/0                              */
/*********************************************************************/

list_schema :-
  list_schema(_N).

/*********************************************************************/
/* Listing the DB schema for either the whole database, or a given   */
/* table or view: list_schema/1                                      */
/*********************************************************************/

:- dynamic(boolean/1).

list_schema(Name) :-
  get_tablenames(Name,UnorderedTableNames),
  my_quicksort(UnorderedTableNames,TableNames),
  (TableNames \== [] ->
   (var(Name)
    -> 
     write_notapi_log_list(['Info: Table(s):',nl])
    ;
     write_notapi_log_list(['Info: Table:',nl])
   ),
   list_schema_list(TableNames)
   ;
   (var(Name) -> 
     (tapi(off)
      ->
       write_log_list(['Info: No tables.',nl])
      ;
       true
     )
     ;
     TableNotFound=true)
  ),
  get_viewnames(Name,UnorderedViewNames),
  my_quicksort(UnorderedViewNames,ViewNames),
  (ViewNames \== [] ->
   (var(Name)
    -> 
     write_notapi_log_list(['Info: View(s):',nl])
    ;
     write_notapi_log_list(['Info: View:',nl])
   ),
   list_schema_list(ViewNames)
   ;
   (var(Name) -> 
     write_notapi_log_list(['Info: No views.',nl])
     ;
     ViewNotFound=true)
  ),
  (nonvar(Name), TableNotFound == true, ViewNotFound == true ->
     write_error_log(['No table or view found with name "',Name,'".'])
     ;
     true
   ),
  (var(Name) ->
    set_flag(boolean,false),
    (
     my_integrity_constraint('$des',Preds,Constraint,NVs,Head),
     findall(Table/Arity,my_table('$des',Table,Arity),DefPreds),
     my_set_diff(Preds,DefPreds,[_|_]),
     (boolean(false) -> write_log_list(['Info: Integrity constraint(s):',nl]) ; true),
     set_flag(boolean,true),
     write_integrity_constraint(my_integrity_constraint('$des',Preds,Constraint,NVs,Head),3),
     fail
    ;
     true
    ),
    (boolean(false)
     ->
      write_notapi_log_list(['Info: No integrity constraints.',nl]) 
     ;
      true)
   ;
    true
  ),
  write_tapi_eot.

% Get table names. First argument, if bound, represent a table for which it is asked if exists
% First clause deals with '$des' database   
get_tablenames(Name,TableNames) :-
  current_db('$des',_),
  !,
  my_nf_bagof(Name,
        Arity^SQLst^Lang^DLs^ODLIds^LVDs^SCs^
        (my_table('$des',Name,Arity),
         Name/Arity\==dual/0,
         my_not(my_view('$des',Name,Arity,SQLst,Lang,DLs,ODLIds,LVDs,SCs))),
        TableNames).
% Next clauses deal with ODBC databases
get_tablenames(Name,TableNames) :-
  var(Name),
  !,
  my_odbc_get_tablenames(TableNames).
get_tablenames(Name,[Name]) :-
  my_odbc_exists_table(Name),
  !.
get_tablenames(_Name,[]).

get_viewnames(Name,ViewNames) :-
  current_db('$des',_),
  !,
  my_nf_bagof(Name,
        Arity^SQLst^Lang^DLs^ODLIds^LVDs^SCs^
        my_view('$des',Name,Arity,SQLst,Lang,DLs,ODLIds,LVDs,SCs),
        ViewNames).
% Next clauses deal with ODBC databases
get_viewnames(Name,ViewNames) :-
  var(Name),
  !,
  my_odbc_get_viewnames(ViewNames).
get_viewnames(Name,[Name]) :-
  my_odbc_exists_view(Name),
  !.
get_viewnames(_Name,[]).

get_localviewnames(ViewNames) :-
  current_db('$des',_),
  !,
  my_nf_bagof(LVDs,
        Name^Arity^SQLst^Lang^DLs^ODLIds^SCs^
        my_view('$des',Name,Arity,SQLst,Lang,DLs,ODLIds,LVDs,SCs),
        ListViewNames),
  concat_lists(ListViewNames,DViewNames),
  remove_duplicates(DViewNames,ViewNames).
get_localviewnames([]).


% List the schema of a list of tables
% Schema: table(col:type,...,col:type)
list_table_schema_list([]).
list_table_schema_list([TableName|TableNames]) :-
  get_table_typed_schema(TableName,Table),
  write_log_list([Table,nl]),
  list_table_schema_list(TableNames).

% List the schema of a relation
list_relation_schema(RelationName) :-
  tapi(on),
  !,
   get_table_typed_arguments(RelationName,ColnameTypes),
   (my_view(_DB,RelationName,_Arity,_SQLst,_Lang,_RNVss,_ODLIds,_LVDs,_SCs) -> 
     write_log_list(['$view',nl]) 
    ;
     write_log_list(['$table',nl]) 
   ),
   write_log_list([RelationName,nl]),
   (repeat,
     (
      (member(Colname:Type,ColnameTypes),
       write_log_list([Colname,nl,Type,nl]),
       fail
      )
     ;
      true
     )
   ).
list_relation_schema(RelationName) :-
   get_table_typed_schema(RelationName,Relation),
%   write_log_list([ColnameTypes,nl])
   write_log_list([Relation,nl]).


list_schema_list([]).
list_schema_list([TableName|TableNames]) :-
%  get_table_typed_schema(TableName,Table),
  (my_view(_DB,TableName,_Arity,Query,Language,RNVss,_ODLIds,LVDs,_SCs) -> 
    Type = view 
   ;
    Type = table),
%  write_notapi_log_list([' * ',Table,nl]), 
  write_notapi_log_list([' * ']), 
  list_relation_schema(TableName),
  (tapi(on)
   ->
   Tab=0
   ;
   Tab=8
  ),
  (Type==view -> 
   write_tapi_delimiter,
   (Language == sql
    ->
     write_notapi_log_list(['    - Defining SQL statement:',nl]),
     display_sql(Query,Tab)
    ;
     Language == ra,
     write_notapi_log_list(['    - Defining RA statement:',nl]),
     display_ra(Query,Tab)
   ),
   write_tapi_delimiter,
   write_notapi_log_list(['    - Datalog equivalent rules:',nl]),
   (development(off) ->
    ORNVss=RNVss
    ;
    get_object_dlrules_list(RNVss,ODLs),
    dlrule_to_ruleNV_list(ODLs,ORNVss)),
   display_ruleNVs_list(ORNVss,Tab),
   (LVDs \== [] ->
     write_notapi_log_list(['    - Local view definitions:',nl,'        ',LVDs,nl])
    ;
     true)
   ; 
   true),
  write_tapi_delimiter,
  list_table_constraints(TableName),
  list_schema_list(TableNames).

list_table_constraints(TableName) :-
  ((my_not_nullables('$des',TableName,NNAtts),
    (tapi(off) 
     ->
     write_log_list(['    - NN: ',NNAtts,nl])
     ;
     write_log_list([NNAtts,nl])
    ),
    fail)% To undo bindings in NNAtts
   ;
   true),
  !,
  write_tapi_delimiter,
  (my_primary_key('$des',TableName,Atts),
   (tapi(off) 
    ->
    write_log_list(['    - PK: ',Atts,nl])
    ;
    write_log_list([Atts,nl])
   ),
   fail % To undo bindings in Atts
   ;
   true),
  write_tapi_delimiter,
  ((my_candidate_key('$des',TableName,CKAtts),
   (tapi(off) 
    ->
    write_log_list(['    - CK: ',CKAtts,nl])
    ;
    write_log_list([CKAtts,nl])
    ),
    fail)
   ;
   true),
  write_tapi_delimiter,
  ((my_foreign_key('$des',TableName,FKAtts,FTableName,RFKAtts),
    (tapi(off) 
     ->
     write_log_list(['    - FK: ',TableName,'.',FKAtts,' -> ',FTableName,'.',RFKAtts,nl])
     ;
     write_log_list([TableName,'.',FKAtts,' -> ',FTableName,'.',RFKAtts,nl])
    ),
    fail)
   ;
   true),
  write_tapi_delimiter,
  ((my_functional_dependency('$des',TableName,Atts,DepAtts),
    (tapi(off) 
     ->
     write_log_list(['    - FD: ',Atts,' -> ',DepAtts,nl])
     ;
     write_log_list([Atts,' -> ',DepAtts,nl])
    ),
    fail)
   ;
   true),
  write_tapi_delimiter,
  ((my_integrity_constraint('$des',Preds,Constraint,NVs,Head),
    my_table('$des',TableName,Arity),
    my_member_chk(TableName/Arity,Preds),
    (tapi(off) 
     ->
     write_log_list(['    - IC:',nl]),
     write_integrity_constraint(my_integrity_constraint('$des',Preds,Constraint,NVs,Head),6)
     ;
     write_integrity_constraint(my_integrity_constraint('$des',Preds,Constraint,NVs,Head),0)
    ),
    fail)
   ;
   true).   

write_integrity_constraint(IC) :-
  write_integrity_constraint(IC,0).
   
write_integrity_constraint(my_integrity_constraint('$des',_Preds,Constraint,NVs,_Head),_I) :-
  tapi(on),
  !,
  pretty_print(PP),
  set_flag(pretty_print,off),
  write_datalog_rule((':-'(Constraint),NVs),0),
  nl_log,
  set_flag(pretty_print,PP).
write_integrity_constraint(my_integrity_constraint('$des',_Preds,Constraint,NVs,Head),I) :-
    (development(off) ->
      write_datalog_rule((':-'(Constraint),NVs),I),
      nl_log
     ;
      list_rules_from_head_wo_number(Head,I),
      nl_log
    ).

   
get_table_untyped_schema(TableName,Table) :-
  get_table_untyped_arguments(TableName,Colnames),
  Table =.. [TableName|Colnames].
  
get_table_typed_schema(TableName,Table) :-
  get_table_typed_arguments(TableName,ColnamesTypes),
  Table =.. [TableName|ColnamesTypes].

get_table_untyped_arguments(TableName,Colnames) :-
  current_db('$des',_Handle),
  !,
  my_nf_setof((Pos,Colname),Type^my_attribute('$des',Pos,TableName,Colname,Type),PosColnames),
  findall(Colname,(my_member((Pos,Colname),PosColnames)),Colnames).
%  my_nf_bagof(Colname,Pos^(my_member((Pos,Colname),PosColnames)),Colnames).
get_table_untyped_arguments(TableName,Colnames) :-
  my_odbc_get_colnames(TableName,Colnames).
  
get_table_typed_arguments(TableName,ColnameTypes) :-
  current_db('$des',_Handle),
  !,
  my_nf_setof((Pos,Colname,Type),Type^my_attribute('$des',Pos,TableName,Colname,Type),PosColnameTypes),
  findall(Colname:Type,(my_member((Pos,Colname,Type),PosColnameTypes)),ColnameTypes).
get_table_typed_arguments(TableName,ColnameTypes) :-
  my_odbc_get_table_typed_arguments(TableName,ColnameTypes).
  
get_table_types(TableName,TypeNames) :-
  current_db('$des',_Handle),
  !,
  my_nf_setof((Pos,Colname,Type),Type^my_attribute('$des',Pos,TableName,Colname,Type),PosColnameTypes),
  findall(Type,(my_member((Pos,Colname,Type),PosColnameTypes)),TypeNames).
get_table_types(TableName,TypeNames) :-
  my_odbc_get_table_typenames(TableName,TypeNames).

get_relation_arity(Relation,Arity) :-
  current_db('$des',_Handle),
  !,
  my_table('$des',Relation,Arity). % Both tables and views
get_relation_arity(Relation,Arity) :-
  my_odbc_get_table_arity(Relation,Arity).
  
attr_internal_representation(ColName,attr(_R,ColName,_Type)).

attr_internal_representation_list([],[]). 
attr_internal_representation_list([ColName|ColNames],[Attr|Attrs]) :-
  attr_internal_representation(ColName,Attr),
  attr_internal_representation_list(ColNames,Attrs).
%% List constraint rules %%

list_constraint_rules :-
  list_type_rules,
  list_nn_rules,
  list_pk_rules,
  list_ck_rules,
  list_fk_rules,
  list_fd_rules,
  list_ic_rules.
  
list_type_rules :-
  get_tablenames(TableNames),
  my_nf_setof(
    [':-'(type(Schema)),'.',nl], 
    TableName^IRTableTypes^ColumnName^ColumnType^IRColumnType^TypedColumns^TypedColumns^
    (
    my_member(TableName,TableNames),
    get_table_typed_arguments(TableName,IRTableTypes),
    findall(ColumnName:ColumnType,
            (
             my_member(ColumnName:IRColumnType,IRTableTypes),
             ((type_equivalence(IRColumnType,ColumnType,_) % From a Datalog declaration
              ;
               type_equivalence(IRColumnType,_,ColumnType)  % From a SQL declaration
              ;
               IRColumnType=ColumnType)                     % From an external ODBC datasource (unlisted type)
              -> true ; fail)
            ),
            TypedColumns),
    Schema=..[TableName|TypedColumns]
    ),
    TypeCtrs),
  my_apply_1(write_quoted_log_list,TypeCtrs).
  
list_nn_rules :-
  my_nf_setof([':-'(nn(TableName,Atts)),'.',nl], my_not_nullables('$des',TableName,Atts), NNs),
  my_apply_1(write_quoted_log_list,NNs).

list_pk_rules :-
  my_nf_setof([':-'(pk(TableName,Atts)),'.',nl], my_primary_key('$des',TableName,Atts), PKs),
  my_apply_1(write_quoted_log_list,PKs).

list_ck_rules :-
  my_nf_setof([':-'(ck(TableName,Atts)),'.',nl], my_candidate_key('$des',TableName,Atts), CKs),
  my_apply_1(write_quoted_log_list,CKs).

list_fk_rules :-
  my_nf_setof([':-'(fk(TableName,FKAtts,FTableName,RFKAtts)),'.',nl], my_foreign_key('$des',TableName,FKAtts,FTableName,RFKAtts), FKs),
  my_apply_1(write_quoted_log_list,FKs).

list_fd_rules :-
  my_nf_setof([':-'(fd(TableName,Atts,DepAtts)),'.',nl], my_functional_dependency('$des',TableName,Atts,DepAtts), FDs),
  my_apply_1(write_quoted_log_list,FDs).

list_ic_rules :-
  my_nf_setof(my_integrity_constraint('$des',Preds,Constraint,NVs,Head), my_integrity_constraint('$des',Preds,Constraint,NVs,Head), ICs),
  my_apply_1(write_integrity_constraint,ICs).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sql_to_dl(+SQLst,-Schema,-TableRen,-DLsts) 
% Translates a SQL Syntactic Tree
% into a list of Datalog Syntactic Trees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sql_to_dl(SQLst,Schema,TableRen,Rs) :-
  write_info_verb_log(['Compiling SQL statement to Datalog rules...']),
  sql_to_ra1(SQLst,RAst,[],TableRen),
  (RAst = (_RA,Schema) ; true),
  ra_to_cra(RAst,CRAst),
  !,
  cra_to_dl(CRAst,0,_,[],_OMap,TableRen,_ORen,DDLsts),
  schema_ren_to_colnametypes(Schema,TypedArgs),
  allowed_colnametype_list(TypedArgs),
  no_input_arguments_list(DDLsts,IArgsListi),
  rule_to_ruleNV_list(DDLsts,[],DRuleNVsList),
  disjunctive_to_conjunctive_ruleNVs_list(DRuleNVsList,CRuleNVsList,IArgsListi,_IArgsListo,_Exploded),
  ruleNV_to_rule_list(CRuleNVsList,CRs),
  force_simplify_rules(CRs,SRs,_Simplified),
  reorder_goals_by_efficiency_rule_list(SRs,URs),
  unfold_rules(URs,Rs),
  !,
  write_info_verb_log(['SQL statement successfully compiled.']).

  
sql_to_ra1((SQLst,[RR|RArgs]),RAst,IRen,ORen) :-
  nonvar(RArgs),
  !,
  get_renamings_schema(RArgs,Renamings1),
  sql_to_ra((SQLst,[RR|_]),(RRAst,[RR|Args]),IRen,ORen),
  get_renamings_schema(Args,Renamings2),
  replace_functors(Renamings2,Renamings1,(RRAst,[RR|Args]),RAst).
sql_to_ra1((SQLst,[RR|RArgs]),RAst,IRen,ORen) :-
  sql_to_ra((SQLst,[RR|RArgs]),RAst,IRen,ORen).
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sql_to_ra(+SQLst,-RAst,+IRen,-ORen) 
% Translates a SQL Syntactic Tree (SQLST)
% into an (Extended) Relational Algebra Syntactic Tree (RAST)
% Table and subquery autorenaming is done for unrenamed 
% tables and subqueries. All renamings are annotated in ORen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SQLst ::=
%   (
%    with(SQLst,SQLsts),
%    Renaming
%   )
%
%   |
%
%   (
%    select(AllDistinct, 
%           TopN,
%           Args,
%           from(Rels),
%           where(Cond),
%           group_by(Cols),
%           having(Cond),
%           order_by(Cols,OrderSpecs)
%          ),
%    Renaming
%   )
%   |
%   (
%    union(AllDistinct,SQL,SQL),
%    Renaming
%   )
%   |
%   (
%    except(_,SQL,SQL),
%    Renaming
%   )
%   |
%   (
%    intersect(_,SQL,SQL),
%    Renaming
%   )
%
% AllDistinct ::=
%   all
%   |
%   distinct
%
% Args ::=
%   *
%   |
%   [Arg,...,Arg]
%
% Arg ::=
%   attr(RelName,Attr,Renaming)
%   |
%   expr(Expression,Renaming,Type)
%
% Expression ::=
%   Arithmetic expression
%   |
%   SQLstmt
%
% Rels ::=
%   [Rel,...,Rel]
%
% Rel ::=
%   (Table,Renaming)
%   |
%   SQLst
%   |
%   JoinOp(Rel,Rel,JoinCond)
%
% JoinCond ::=
%   Cond
%   |
%   equijoin(natural)
%   |
%   equijoin([Attr,...,Attr])
%
% JoinOp ::=
%   inner_join
%   |
%   left_join
%   |
%   right_join
%   |
%   full_join
%
% Cond ::=
%   exists(SQLst)
%   |
%   in([AttrCte,...,AttrCte],SQLst)
%   |
%   not_in([AttrCte,...,AttrCte],SQLst)
%   |
%   AttrCte Operator AttrCte 
%   |
%   AttrCte Operator SQLst
%   |
%   SQLst Operator AttrCte
%   |
%   SQLst Operator SQLst
%   |
%   and(Cond,Cond)
%   |
%   or(Cond,Cond)
%   |
%   not(Cond)
%   |
%   true
%   |
%   false

sql_to_ra((union(D,R1,R2),[RR|RAS]),(union(D,AR1,AR2),[RR|RAS]),IRen,ORen) :-
  !,
  sql_to_ra1(R1,AR1,IRen,Ren),
  sql_to_ra1(R2,AR2,Ren,ORen),
  compatible_schemas(AR1,AR2),
  relation_autorenaming(RR),
  relation_arguments(AR1,RAS),
  arguments_autorenaming(RR,RAS).
sql_to_ra((except(D,R1,R2),[RR|RAS]),(minus(D,AR1,AR2),[RR|RAS]),IRen,ORen) :-
  !,
  sql_to_ra1(R1,AR1,IRen,Ren),
  sql_to_ra1(R2,AR2,Ren,ORen),
  compatible_schemas(AR1,AR2),
  relation_autorenaming(RR),
  relation_arguments(AR1,RAS),
  arguments_autorenaming(RR,RAS).
sql_to_ra((intersect(D,R1,R2),[RR|RAS]),(intersect(D,AR1,AR2),[RR|RAS]),IRen,ORen) :-
  !,
  sql_to_ra1(R1,AR1,IRen,Ren),
  sql_to_ra1(R2,AR2,Ren,ORen),
  compatible_schemas(AR1,AR2),
  relation_autorenaming(RR),
  relation_arguments(AR1,RAS),
  arguments_autorenaming(RR,RAS).
sql_to_ra((select(DistinctAll,
            TopN,
            UProjList,
            from(SQLRelations),
            where(WhereCondition),
            group_by(GroupList),
            having(HavingCondition),
            order_by(OrderArgs,OrderSpecs)),
           [RR|_RArgs]),
           (pi(DistinctAll,
               TopN,
               SProjList,
               sigma(RACondition,RARelation),
               group_by(GroupList),
               having(RAHavingCondition),
               order_by(OrderArgs,OrderSpecs)),
           [RR|SProjList]),
           IRen,ORen) :-
  !,
  sqlcond2racond(WhereCondition,RACondition,IRen,Ren11),
  sqlcond2racond(HavingCondition,RAHavingCondition,Ren11,Ren1),
  sqlrel2rarel(SQLRelations,RARelation,Ren1,Ren2),
  relation_autorenaming(RR),
  simplify_arglist_expr(UProjList,SSProjList),
  arguments_completion(SSProjList,RARelation,SSProjList,Ren2,ORen,ProjList),
  arguments_autorenaming(RR,ProjList), 
  arguments_autorenaming(_GR,GroupList),
  arguments_autorenaming(_OR,OrderArgs),
%  arguments_autorenaming(RR,UProjList), 
  simplify_arglist_expr(ProjList,SProjList).
sql_to_ra((inner_join(LRel,RRel,SQLCondition),[RR|_RArgs]),
           (pi(all,
               top(all),
               ProjList,
               sigma(RACondition,RARelation),
               group_by([]),
               having(true),
               order_by([],[])),[RR|ProjList]),
           IRen,ORen) :-
  !,
  sqlrel2rarel([LRel,RRel],RARelation,IRen,Ren1),
  RARelation = times((_RALR,LAS),(_RARR,RAS)),
  arguments_completion(*,RARelation,[],Ren1,Ren2,Atts),
  relation_autorenaming(RR),
  arguments_autorenaming(RR,Atts),
  sqljoincond2racond(SQLCondition,RACondition,LAS,RAS,Atts,ProjList,Ren2,ORen).
sql_to_ra((left_join(LRel,RRel,SQLCondition),[RR|_RArgs]),
           (pi(all,
               top(all),
               ProjList,
               sigma(true,left_join((RALR,LAS),(RARR,RAS),RACondition)),
               group_by([]),
               having(true),
               order_by([],[])),[RR|ProjList]),
           IRen,ORen) :-
  !,
  sqlrel2rarel([LRel,RRel],RARelation,IRen,Ren1),
  RARelation = times((RALR,LAS),(RARR,RAS)),
  arguments_completion(*,RARelation,[],Ren1,Ren2,Atts),
  relation_autorenaming(RR),
  arguments_autorenaming(RR,Atts),
  sqljoincond2racond(SQLCondition,RACondition,LAS,RAS,Atts,ProjList,Ren2,ORen).
sql_to_ra((right_join(LRel,RRel,SQLCondition),[RR|_RArgs]),
           (pi(all,
               top(all),
               ProjList,
               sigma(true,right_join((RALR,LAS),(RARR,RAS),RACondition)),
               group_by([]),
               having(true),
               order_by([],[])),[RR|ProjList]),
           IRen,ORen) :-
  !,
  sqlrel2rarel([LRel,RRel],RARelation,IRen,Ren1),
  RARelation = times((RALR,LAS),(RARR,RAS)),
  arguments_completion(*,RARelation,[],Ren1,Ren2,Atts),
  relation_autorenaming(RR),
  arguments_autorenaming(RR,Atts),
  sqljoincond2racond(SQLCondition,RACondition,LAS,RAS,Atts,ProjList,Ren2,ORen).
sql_to_ra((full_join(LRel,RRel,SQLCondition),[RR|_RArgs]),
           (pi(all,
               top(all),
               ProjList,
               sigma(true,full_join((RALR,LAS),(RARR,RAS),RACondition)),
               group_by([]),
               having(true),
               order_by([],[])),[RR|ProjList]),
           IRen,ORen) :-
  !,
  sqlrel2rarel([LRel,RRel],RARelation,IRen,Ren1),
  RARelation = times((RALR,LAS),(RARR,RAS)),
  arguments_completion(*,RARelation,[],Ren1,Ren2,Atts),
  relation_autorenaming(RR),
  arguments_autorenaming(RR,Atts),
  sqljoincond2racond(SQLCondition,RACondition,LAS,RAS,Atts,ProjList,Ren2,ORen).
sql_to_ra((T,[RR|RArgs]),(T,[RR|RArgs]),Ren,[(T,RR)|Ren]) :-
  my_table('$des',T,_Arity),
  !,
  relation_autorenaming(RR),
  get_table_untyped_arguments(T,Args),
  build_ren_arguments(T,Args,RArgs),
  arguments_autorenaming(RR,RArgs).
sql_to_ra((T,[_RR|_RArgs]),_RA,_IRen,_ORen) :-
%   write_log_list(['Error: Unknown table/view ',T,nl]),
%   display_relation_alternatives(T),
%   !,
%   fail.
  my_raise_exception(unknown_relation(T),syntax(''),[]).

compatible_schemas((_SQLst1,S1),(_SQLst2,S2)) :-
  length(S1,L),
  length(S2,L),
  !.
compatible_schemas(_,_) :-
  my_raise_exception(generic,syntax(['Incompatible schemas in set operation.']),[]).

% Show alternatives (dwim) which are spelled similar to the given one, i.e.:
% - Equal up to case
% - Equal up to one char (case insensitive) for at least 4 characters
% - Equal but one char (one of the characters is missing, case insensitive) for at least 4 characters

display_user_predicate_alternatives(_Name) :-
  tapi(on),
  !.
display_user_predicate_alternatives(Name) :-
  display_object_alternatives(user_predicate,Name).
  
display_relation_alternatives(_Name) :-
  tapi(on),
  !.
display_relation_alternatives(Name) :-
  display_object_alternatives(relation,Name).
  
display_table_alternatives(_Name) :-
  tapi(on),
  !.
display_table_alternatives(Name) :-
  display_object_alternatives(table,Name).
  
display_view_alternatives(_Name) :-
  tapi(on),
  !.
display_view_alternatives(Name) :-
  display_object_alternatives(view,Name).
  
display_column_alternatives(_TableName,_Name) :-
  tapi(on),
  !.
display_column_alternatives(TableName,Name) :-
  display_object_alternatives(column(TableName),Name).
  
display_object_alternatives(Object,T) :-
  atom_length(T,L),
  to_uppercase(T,UT),
  findall(T1, %Arity^UT1^SQL^DL^ODLIds^Loc^StrC^Position^DataType^
        (possible_name(Object,T1),
         to_uppercase(T1,UT1),
         (
          % Equal up to case
          UT1==UT
         ;
          L>3,
          equal_up_to_one_char(UT,UT1)
         ;
          L>3,
          equal_but_one_char(UT,UT1)
         ;
          L>1,
          equal_but_swapped_chars(UT,UT1)
         )
        ),
        UTs),
  my_remove_duplicates_sort(UTs,[T1|Ts]), % At least, one alternative for displaying
  (Object\==command -> CaseMsg=' (respect case): ' ; CaseMsg=': '),
  (Ts==[] -> Pl='' ; Pl='s'),
  write_log_list(['Info: Possible ',Object,Pl,CaseMsg,[T1|Ts],nl]),
  !.
display_object_alternatives(_O,_T).

% +Object (Var,table,view,column(TableName),command), -Name. 
possible_name(Object,T1) :-
        (
          Object==relation,
          my_table('$des',T1,_)
         ;
          Object==table, 
          my_table('$des',T1,_),
          \+ my_view('$des',T1,_,_,_,_,_,_,_)
         ;
          Object==view, 
          my_view('$des',T1,_,_,_,_,_,_,_)
         ;
          Object==column(TableName), 
          my_attribute('$des',TableName,_,T1,_)
         ;
          Object==command, 
          command(_,_,_,T1,_,_,_)
         ;
          Object==builtin,
          my_builtin_preds(Preds),
          member(T1/_,Preds)
         ;
          Object==user_predicate,
          pdg_user_predicates(Preds),
          member(T1/_,Preds)
         ).
         
pdg_user_predicates(Preds) :-
  pdg((Preds,_Arcs)),
  !.
pdg_user_predicates(Preds) :-
  user_predicates(Preds).
         
equal_up_to_one_char(T,T1) :-
  atom_codes(T,Ts),
  atom_codes(T1,T1s),
  equal_up_to_one_char_string(Ts,T1s).
  
%equal_up_to_one_char_string([_C],[]).
equal_up_to_one_char_string([],[]).
equal_up_to_one_char_string([X|Xs],[X|Ys]) :-
  !,
  equal_up_to_one_char_string(Xs,Ys).
equal_up_to_one_char_string([_X|Xs],[_Y|Xs]).
  
equal_but_one_char(T,T1) :-
  atom_codes(T,Ts),
  atom_codes(T1,T1s),
  equal_but_one_char_string(Ts,T1s).
  
equal_but_one_char_string([_C],[]).
equal_but_one_char_string([],[_C]).
equal_but_one_char_string([X|Xs],[X|Ys]) :-
  !,
  equal_but_one_char_string(Xs,Ys).
equal_but_one_char_string([_X|Xs],Xs).
equal_but_one_char_string(Xs,[_Y|Xs]).

equal_but_swapped_chars(T,T1) :-
  name(T,ST),
  name(T1,ST1),
  my_quicksort(ST,OST),
  my_quicksort(ST1,OST).
  
  
build_ren_arguments(_T,[],[]).
build_ren_arguments(T,[A|As],[attr(T,A,_RA)|RAs]) :-
  build_ren_arguments(T,As,RAs).

relation_arguments((_R,[_RR|RAS]),RAS).

relation_autorenaming(AS) :-
  (var(AS) ->
   get_new_predicate_name(t,AS)
   ;
   true).

get_renamings_schema([],[]).
get_renamings_schema([Arg|Args],[Renaming|Renamings]) :-
  (Arg=attr(_,_,Renaming)
  ;
   Arg=expr(_,Renaming,_)),
  get_renamings_schema(Args,Renamings).
  
arguments_autorenaming(Rel,RArgs) :-
  arguments_autorenaming1(Rel,_Renamings,RArgs).
  
arguments_autorenaming(Rel,Args,RArgs) :-
  get_renamings_schema(Args,Renamings),
  !,
  arguments_autorenaming1(Rel,Renamings,RArgs).
   
arguments_autorenaming1(_RR,[],[]) :-
  !.
arguments_autorenaming1(Rel,[AS|Renamings],[expr(E,AS,_Type)|Args]) :-
  argument_autorenaming(AS),
  !,
  expr_arguments_autorenaming(E),
  arguments_autorenaming1(Rel,Renamings,Args).
arguments_autorenaming1(Rel,[AS|Renamings],[attr(Rel,_A,AS)|Args]) :-
  argument_autorenaming(AS),
  !,
  arguments_autorenaming1(Rel,Renamings,Args).
arguments_autorenaming1(RR,[AS|Renamings],[attr(_Rel,_A,AS)|Args]) :-
  argument_autorenaming(AS),
  !,
  arguments_autorenaming1(RR,Renamings,Args).
arguments_autorenaming1(RR,[_AS|Renamings],[_|Args]) :-
  arguments_autorenaming1(RR,Renamings,Args).

expr_arguments_autorenaming(E) :-
  var(E),
  !.
expr_arguments_autorenaming(E) :-
  (number(E) ; atom(E)),
  !.
expr_arguments_autorenaming(expr_ref(_Rel,_AS)) :- 
  !.
expr_arguments_autorenaming(attr(_Rel,_A,AS)) :- 
  !,
  argument_autorenaming(AS).
expr_arguments_autorenaming(E) :- 
  E =.. [_F|Args],
  !, 
  expr_arguments_autorenaming_list(Args).

expr_arguments_autorenaming_list([]) :-
  !.
expr_arguments_autorenaming_list([E|Es]) :-
  !, 
  expr_arguments_autorenaming(E), 
  expr_arguments_autorenaming_list(Es).

argument_autorenaming(AS) :-
  (var(AS) ->
   get_new_predicate_name(a,AS)
   ;
   true).

arguments_completion(*,(pi(_D,_T,ProjList,_S,_G,_H,_O),[RR|RArgs]),_PL,IRen,ORen,RRArgs) :-
  !,
%  simplify_arglist_expr(ProjList,SProjList), %::: Warning 2011-10-13
  replace_exprs_by_refs(RR,RArgs,RRArgs),
  rel_ren_projlist(ProjList,RR,IRen,ORen).
arguments_completion(*,(T,[AS|_RArgs]),_PL,Ren,Ren,ProjList) :-
  my_table('$des',T,_Arity),
  !,
  my_nf_bagof(attr(AS,C,CRen),
             I^Type^(my_attribute('$des',I,T,C,Type),
                     argument_autorenaming(CRen)),
             ProjList).
arguments_completion(*,(_Rel,[_AS|RArgs]),_PL,Ren,Ren,RArgs) :-
  !.
arguments_completion(*,times(T1,T2),_PL,IRen,ORen,ProjList) :-
  arguments_completion(*,T1,[],IRen,Ren1,PL1),
  arguments_completion(*,T2,[],Ren1,ORen,PL2),
  append(PL1,PL2,ProjList).
arguments_completion([],_RAst,_PL,Ren,Ren,[]) :-
  !.
arguments_completion([(Rel,(*))|As],(RAst,[Rel|RArgs]),PL,IRen,ORen,CAs) :-
  !,
  arguments_completion(As,RAst,PL,IRen,ORen,CA1s),
  append(RArgs,CA1s,CAs).
arguments_completion([(Rel,(*))|As],RAst,PL,IRen,ORen,CAs) :-
  !,
  rel_arguments(Rel,RAst,IRen,Ren1,RAs),
  arguments_completion(As,RAst,PL,Ren1,ORen,CA1s),
  append(RAs,CA1s,CAs).
% An incorrectly assumed attribute (which is in fact a reference to an expression)
% is translated into a reference to an expression
%arguments_completion([attr(_Rel,A,AS)|As],RAst,PL,IRen,ORen,[expr(expr_ref(A),AS,_Type)|CAs]) :-
arguments_completion([attr(Rel,A,AS)|As],RAst,PL,IRen,ORen,[expr(expr_ref(Rel,A),AS,_Type)|CAs]) :-
  pl_expr_member(expr(_E,A,_T),PL),
  !,
  arguments_completion(As,RAst,PL,IRen,ORen,CAs).
% References to renamed attributes
arguments_completion([attr(_Rel,A,AS)|As],RAst,PL,IRen,ORen,[attr(R,C,AS)|CAs]) :-
  pl_attr_member(attr(R,C,A),PL),
  !,
  arguments_completion(As,RAst,PL,IRen,ORen,CAs).
arguments_completion([attr(Rel,A,AS)|As],RAst,PL,IRen,ORen,[attr(Rel,A,AS)|CAs]) :-
  argument_completion(attr(Rel,A,AS),RAst),
  !,
  arguments_completion(As,RAst,PL,IRen,ORen,CAs).
arguments_completion([expr(E,AS,Type)|As],RAst,PL,IRen,ORen,[expr(RE,AS,Type)|CAs]) :-
  expr_argument_completion(E,RAst,PL,IRen,IRen1,RE),
  arguments_completion(As,RAst,PL,IRen1,ORen,CAs).
arguments_completion([attr(Rel,A,_AS)|_As],_RAst,_PL,_IRen,_ORen,_) :-
  my_raise_exception(unknown_column(Rel,A),syntax(''),[]).

replace_exprs_by_refs(_Rel,[],[]).
replace_exprs_by_refs(Rel,[expr(_E,AS,T)|Args],[expr(expr_ref(Rel,AS),AAS,T)|RArgs]) :-
  !,
  argument_autorenaming(AAS),
  replace_exprs_by_refs(Rel,Args,RArgs).
replace_exprs_by_refs(Rel,[attr(T,C,_R)|Args],[attr(T,C,AS)|RArgs]) :-
  argument_autorenaming(AS),
  replace_exprs_by_refs(Rel,Args,RArgs).

% Projection list member. Checks whether the attribute attr(Rel,A,AS) can be found in the projection list.
% Note that the attribute can be a variable
% Reference to the attribute name:
pl_attr_member(attr(Rel,A,_AS),[attr(Rel,Arg,_RArg)|_PL]) :-
  A==Arg,
  !.
% Reference to the attribute renaming:
pl_attr_member(attr(Rel,A,AS),[attr(Rel,A,RArg)|_PL]) :-
  AS==RArg,
  !.
pl_attr_member(attr(Rel,A,AS),[_Attr|PL]) :-
  pl_attr_member(attr(Rel,A,AS),PL).
  
pl_expr_member(expr(E,A,Type),[expr(E,AS,Type)|_PL]) :-
  A==AS,
  !.
pl_expr_member(expr(E,A,Type),[_Arg|PL]) :-
  pl_expr_member(expr(E,A,Type),PL).

% expr_argument_completion(expr(attr(R,C,A),_,_),RAst,PL,IRen,ORen,E) :- 
%   expr_argument_completion(attr(R,C,A),RAst,PL,IRen,ORen,E).
expr_argument_completion(E,_RAst,_PL,Ren,Ren,E) :- 
  (number(E) ; atom(E)),
  !.
%expr_argument_completion(attr(_Rel,A,_AS),_RAst,PL,expr_ref(A)) :- 
expr_argument_completion(attr(Rel,A,_AS),_RAst,PL,Ren,Ren,expr_ref(Rel,A)) :- 
  var(Rel),
  pl_expr_member(expr(_E,A,_Type),PL),
  !.
%expr_argument_completion(attr(_Rel,A,_AS),_RAst,PL,attr(R,C,A)) :- 
expr_argument_completion(attr(Rel,A,_AS),_RAst,PL,Ren,Ren,attr(R,C,A)) :- 
  var(Rel),
  pl_attr_member(attr(R,C,A),PL),
  !.
% expr_argument_completion(attr(R,A,AS),_RAst,PL,Ren,Ren,attr(R,A,AS)) :- 
% deb,
%   var(R),
%   member(attr(R,A,AS),PL),
%   !.
%expr_argument_completion(cte(Cte,Type),_RAst,_PL,cte(Cte,Type)) :- 
expr_argument_completion(cte(Cte,Type),_RAst,_PL,Ren,Ren,cte(Cte,Type)) :- 
  !.
expr_argument_completion(attr(Rel,A,AS),RAst,_PL,Ren,Ren,attr(Rel,A,AS)) :- 
  argument_completion(attr(Rel,A,AS),RAst),
  !.
expr_argument_completion(attr(Rel,A,_AS),_RAst,_PL,Ren,Ren,_CA) :- 
%   write_log_list(['Error: Unknown column ',A,nl]),
%   !,
%   fail.
  my_raise_exception(unknown_column(Rel,A),syntax(''),[]).
expr_argument_completion((SQLst,RR),_RAst,_PL,IRen,ORen,RAst) :-
  var(RR),
  !,
  sql_to_ra1((SQLst,RR),RAst,IRen,ORen).  
expr_argument_completion(E,RAst,PL,IRen,ORen,RE) :- 
  E =.. [F|Args],
  !, 
  expr_argument_completion_list(Args,RAst,PL,IRen,ORen,RArgs),
  RE =.. [F|RArgs].
  
  
expr_argument_completion_list([],_RAst,_PL,Ren,Ren,[]) :-
  !.
expr_argument_completion_list([E|Es],RAst,PL,IRen,ORen,[RE|REs]) :-
  !, 
  expr_argument_completion(E,RAst,PL,IRen,IRen1,RE), 
  expr_argument_completion_list(Es,RAst,PL,IRen1,ORen,REs).

argument_completion(attr(Rel,A,AS),RAst) :-
  (var(Rel) -> argument_completion_ng(attr(Rel,A,AS),RAst) ; true).

argument_completion_ng(attr(RT,C,_AS),(T,[RT|_RArgs])) :-
  my_attribute('$des',_Nth,T,C,_Type),
  !.
argument_completion_ng(A,times(R1,R2)) :-
  argument_completion_ng(A,R1),
  !
  ;
  argument_completion_ng(A,R2),
  !.
argument_completion_ng(attr(AS,A,_AS),(pi(_D,_T,ProjList,_S,_G,_H,_O),[AS|_Args])) :-
  find_argument(A,ProjList),
  !.
%argument_completion_ng(expr(_Expr,ExprAS,_Type),(pi(_D,_T,ProjList,_S,_G,_H,_O),[_AS|_Args])) :-
argument_completion_ng(attr(AS,ExprAS,_AS),(pi(_D,_T,ProjList,_S,_G,_H,_O),[AS|_Args])) :-
  find_expr_renaming(ExprAS,ProjList),
  !.
argument_completion_ng(attr(AS,A,_AS),(_,[AS|ProjList])) :-
  find_argument(A,ProjList),
  !.
% argument_completion_ng(attr(_T,C,_AS),_CA) :-
%   write_log_list(['Error: Unknown column ARG COMPL. ',C,nl]),
%   !,
%   fail.

  
find_argument(A,[attr(_Rel,A,_RenA)|_As]) :-
  !.
find_argument(RenA,[attr(_Rel,_A,RenA)|_As]) :-
  !.
find_argument(A,[_|As]) :-
  find_argument(A,As).
  
find_expr_renaming(ExprAS,[expr(_Expr,ExprAS,_Type)|_As]) :-
  !.
find_expr_renaming(A,[_|As]) :-
  find_expr_renaming(A,As).
  
rel_ren_projlist([],_AS,Ren,Ren).
rel_ren_projlist([attr(Rel,_Col,_ColRen)|As],AS,IRen,ORen) :-
  member((AS,Rel),IRen),
  !,
  rel_ren_projlist(As,AS,IRen,ORen).
rel_ren_projlist([attr(Rel,_Col,_ColRen)|As],AS,IRen,ORen) :-
  rel_ren_projlist(As,AS,[(AS,Rel)|IRen],ORen).
rel_ren_projlist([_|As],AS,IRen,ORen) :- % Expressions
  rel_ren_projlist(As,AS,IRen,ORen).
%rel_ren_projlist([expr(attr(Rel,C,_RC),AS,_Type)|As],AS,IRen,ORen) :-  %::: Warning 2011-10-14
%  rel_ren_projlist(As,AS,IRen,ORen).

rel_arguments(Rel,RAst,IRen,ORen,RAs) :-
  arguments_completion(*,RAst,[],IRen,ORen,ProjList),
  (my_member((Rel,RelId),ORen) -> true ; RelId = Rel),
  filter_rel_arg(RelId,ProjList,RAs).

filter_rel_arg(_RelId,[],[]).
filter_rel_arg(RelId,[attr(RelId,A,AS)|RAs],[attr(RelId,A,AS)|FRAs]) :-
  !, 
  filter_rel_arg(RelId,RAs,FRAs).
filter_rel_arg(RelId,[_|RAs],FRAs) :-
  filter_rel_arg(RelId,RAs,FRAs).

% SQL condition to RA condition
%sqlcond2racond(not(exists(Rel)),not(exists(RRel)),IRen,ORen) :-
%  !,
%  sql_to_ra(Rel,RRel,IRen,ORen).
sqlcond2racond(exists(Rel),exists(RRel),IRen,ORen) :-
  !,
  sql_to_ra1(Rel,RRel,IRen,ORen).
sqlcond2racond(not_in(Args,Rel),not_in(Args,RRel),IRen,ORen) :-
  !,
  sql_to_ra1(Rel,RRel,IRen,ORen).
sqlcond2racond(in(Args,Rel),in(Args,RRel),IRen,ORen) :-
  !,
  arguments_autorenaming(_RR,Args),
  sql_to_ra1(Rel,RRel,IRen,ORen).
sqlcond2racond(is_null(Rel),is_null(RRel),IRen,ORen) :-
  !,
  sqlcond2racond(Rel,RRel,IRen,ORen).
sqlcond2racond(not(C),not(RC),IRen,ORen) :-
  !,
  sqlcond2racond(C,RC,IRen,ORen).
sqlcond2racond((SQLst,RR),RAst,IRen,ORen) :-
  var(RR),
  !,
  sql_to_ra1((SQLst,RR),RAst,IRen,ORen).
sqlcond2racond(SQLC,RAC,IRen,ORen) :-
  SQLC =.. [Op,L,R],
% WARNING: UNREMARKED because of "select * from t where a <> null"
%  my_sql_op(Op),
  my_sql_op(Op),
  !,
  sqlcond2racond(L,LRRel,IRen,Ren),
  sqlcond2racond(R,RRRel,Ren,ORen),
  RAC =.. [Op,LRRel,RRRel].
% sqlcond2racond(A,A,Ren,Ren) :-
%   arguments_autorenaming(_R,[A]),
%   !.
% sqlcond2racond(C,C,Ren,Ren).
sqlcond2racond(E,E,Ren,Ren) :-
  expr_arguments_autorenaming(E).
  
% expr_arguments_autorenaming(A) :-
%   arguments_autorenaming(_R,[A]),
%   !.
% expr_arguments_autorenaming(E) :-
%   E=..[_F|Args],
%   expr_arguments_autorenaming_list(Args).
% 
% expr_arguments_autorenaming_list([]).
% expr_arguments_autorenaming_list([A|As]):-
%   expr_arguments_autorenaming(A),
%   expr_arguments_autorenaming_list(As).

% SQL join condition to RA condition
% sqljoincond2racond(equijoin(natural),C,_LAS,_RAS,IProjList,OProjList,Ren,Ren) :-
%   !,
%   eq_common_atts(IProjList,OProjList,C).
sqljoincond2racond(equijoin(natural),C,[_|LArgs],[_|RArgs],_IProjList,OProjList,Ren,Ren) :-
  !,
  append(LArgs,RArgs,Args),
  eq_common_atts(Args,OProjList,C).
sqljoincond2racond(equijoin(Atts),C,LAS,RAS,ProjList,ProjList,Ren,Ren) :-
  !,
  build_equijoin(Atts,LAS,RAS,ProjList,C).
sqljoincond2racond(SQLCondition,RACondition,_LAS,_RAS,ProjList,ProjList,IRen,ORen) :-
  sqlcond2racond(SQLCondition,RACondition,IRen,ORen).

% IAtts: Input attribute list
% OAtts: Output attribute list (common attributes removed)
% EqCommonAtts: Output conjunctive equality condition on common attributes
eq_common_atts(IAtts,OAtts,EqCommonAtts) :-
  list_eq_common_atts(IAtts,OAtts,LEqCommonAtts),
  conjunctive_cond(LEqCommonAtts,EqCommonAtts).

% list_eq_common_atts(+IAtts,-OAtts,-EqCommonAtts).
list_eq_common_atts([],[],[]).
list_eq_common_atts([LArg|IAtts],[LArg|OAtts],[LArg=RArg|EqAtts]) :-
  same_arg_name(LArg,IAtts,RArg),
  !,
  my_remove(RArg,IAtts,RAtts),
  list_eq_common_atts(RAtts,OAtts,EqAtts).
list_eq_common_atts([Att|Atts],[Att|OAtts],EqAtts) :-
  list_eq_common_atts(Atts,OAtts,EqAtts).
  
same_arg_name(LArg,IAtts,RArg) :-
  arg_name_or_ren(LArg,Name),
  arg_name_or_ren(RArg,Name),
  member(RArg,IAtts).
  
arg_name_or_ren(attr(_,Name,_),Name).
arg_name_or_ren(attr(_,_,Name),Name).
arg_name_or_ren(expr(_,Name,_),Name).

build_equijoin([],_LAS,_RAS,_ProjList,true).
build_equijoin([attr(_RAtt,Att,_ArrRen)],[LAS|_LRArgs],[RAS|_RRArgs],ProjList,attr(LAS,Att,RA)=attr(RAS,Att,RB)) :-
  my_member(attr(LAS,Att,RA),ProjList),
  my_member(attr(RAS,Att,RB),ProjList).
build_equijoin([Att1,Att2|Atts],LAS,RAS,ProjList,and(C1,C2)) :-
  build_equijoin([Att1],LAS,RAS,ProjList,C1),
  build_equijoin([Att2|Atts],LAS,RAS,ProjList,C2).

% Building a conjunctive condition from a list of conditions
conjunctive_cond([],true) :-
  !.
conjunctive_cond([C],C) :-
  !.
conjunctive_cond([C1,C2],and(C1,C2)) :- 
  !.
conjunctive_cond([C|Cs],and(C,CC)) :- 
  conjunctive_cond(Cs,CC).

% SQL relation to RA relation
sqlrel2rarel([R],CR,IRen,ORen) :-
  sql_to_ra1(R,CR,IRen,ORen).
sqlrel2rarel([A,B|Rs],times(CA,RRs),IRen,ORen) :-
  sql_to_ra1(A,CA,IRen,Ren),
  sqlrel2rarel([B|Rs],RRs,Ren,ORen).
         

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ra_to_cra(+RAst,-CRAst) Translates a 
% Relational Algebra Syntactic Tree into a
% Canonical Relational Algebra Syntactic Tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EXISTS condition
ra_to_cra((pi(D,T,As,sigma(exists(Rel),Rs),G,H,O),AS),
          (pi(D,T,As,sigma(exists(CRel),CRs),G,H,O),AS)) :-
  !,
  ra_to_cra(Rel,CRel),
  ra_to_cra(Rs,CRs).

% IN condition
ra_to_cra((pi(D,T,As,sigma(in(Args,Rel),Rs),G,H,O),AS),
          (pi(D,T,As,sigma(in(Args,CRel),CRs),G,H,O),AS)) :-
  !,
  ra_to_cra(Rel,CRel),
  ra_to_cra(Rs,CRs).

% NOT IN condition
ra_to_cra((pi(D,T,As,sigma(not_in(Args,Rel),Rs),G,H,O),AS),
          (pi(D,T,As,sigma(not_in(Args,CRel),CRs),G,H,O),AS)) :-
  !,
  ra_to_cra(Rel,CRel),
  ra_to_cra(Rs,CRs).

% IS NULL condition
ra_to_cra((pi(D,T,As,sigma(is_null(Rel),Rs),G,H,O),AS),
          (pi(D,T,As,sigma(is_null(CRel),CRs),G,H,O),AS)) :-
  !,
  ra_to_cra(Rel,CRel),
  ra_to_cra(Rs,CRs).

% Sigma condition
ra_to_cra((pi(D,T,As,sigma(C,Rs),G,H,O),AS),
          (pi(D,T,As,sigma(SC,Rs),G,H,O),AS)) :-
  !,
  simplify_cond(C,SC).
    
% TIMES
ra_to_cra(times(R1,R2),times(CR1,CR2)) :-
  !,
  ra_to_cra(R1,CR1),
  ra_to_cra(R2,CR2).

% OUTER JOINS
ra_to_cra(left_join(R1,R2,C),left_join(CR1,CR2,C)) :-
  !,
  ra_to_cra(R1,CR1),
  ra_to_cra(R2,CR2).
ra_to_cra(right_join(R1,R2,C),right_join(CR1,CR2,C)) :-
  !,
  ra_to_cra(R1,CR1),
  ra_to_cra(R2,CR2).  
ra_to_cra(full_join(R1,R2,C),full_join(CR1,CR2,C)) :-
  !,
  ra_to_cra(R1,CR1),
  ra_to_cra(R2,CR2).
  
% Table
ra_to_cra((T,AS),(T,AS)) :-
  my_table('$des',T,_),
  !.

% UNION operator
ra_to_cra((union(D,RA1,RA2),AS),(union(D,CRA1,CRA2),AS)) :-
  !,
  ra_to_cra(RA1,CRA1),
  ra_to_cra(RA2,CRA2). 

% MINUS operator
ra_to_cra((minus(D,RA1,RA2),AS),(minus(D,CRA1,CRA2),AS)) :-
  !,
  ra_to_cra(RA1,CRA1),
  ra_to_cra(RA2,CRA2). 

% INTERSECT operator
ra_to_cra((intersect(D,RA1,RA2),AS),(intersect(D,CRA1,CRA2),AS)) :-
  !,
  ra_to_cra(RA1,CRA1),
  ra_to_cra(RA2,CRA2). 


% Argument
ra_to_cra(A,A) :-
  !.

% Basic condition
%basic_condition(true) :-
%  !.
%basic_condition(false) :-
%  !.
%basic_condition(C) :-
%  C=..[Op,LA,RA],
%  map_cond(Op,_),
%  my_sql_constant_or_column(LA),
%  my_sql_constant_or_column(RA),
%  !.
%basic_condition(not(C)) :-
%  basic_condition(C),
%  !.

% Simplify condition
simplify_cond(true,true) :-
  !.
simplify_cond(false,false) :-
  !.
simplify_cond(not(true),false) :-
  !.
simplify_cond(not(false),true) :-
  !.
simplify_cond(not(not(C)),SC) :-
  !,
  simplify_cond(C,SC).
simplify_cond(not(and(C1,C2)),SC) :-
  !,
  complement_cond(C1,NC1),
  complement_cond(C2,NC2),
  simplify_cond(or(NC1,NC2),SC).
simplify_cond(not(or(C1,C2)),SC) :-
  !,
  complement_cond(C1,NC1),
  complement_cond(C2,NC2),
  simplify_cond(and(NC1,NC2),SC).
simplify_cond(not(C),CC) :-
  complement_cond(C,CC),
  !.
simplify_cond(and(C1,C2),and(SC1,SC2)) :-
  !,
  simplify_cond(C1,SC1),
  simplify_cond(C2,SC2).
simplify_cond(or(C1,C2),or(SC1,SC2)) :-
  !,
  simplify_cond(C1,SC1),
  simplify_cond(C2,SC2).
simplify_cond(C,C).
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cra_to_dl(+CRAst,+Number,-LastNbr,+Mapping,-OMapping,
%             +Renaming,-ORenaming,-DLsts) 
% Translates a Canonical Relational Algebra Syntactic Tree 
% CRAst into a list of Datalog Syntactic Trees DLsts
% Mapping holds the correspondence between table columns and
% goal arguments 
% Renaming holds the already computed table and subquery renamings 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cra_to_dl((union(distinct,R1,R2),[RR|RArgs]),N,LN,IMap,OMap,IRen,ORen,[':-'(L,distinct(G))|DLsts]) :-
  !,
  get_new_predicate_name(p,N,N1,P),
  cra_to_dl((union(all,R1,R2),[RR|RArgs]),N1,LN,IMap,OMap,IRen,ORen,DLsts),
  DLsts=[':-'(H,_B)|_],
  functor(H,F,A),
  length(Args,A),
  G=..[F|Args],
  L=..[P|Args].
cra_to_dl((union(all,R1,R2),[RR|RArgs]),N,LN,IMap,OMap,IRen,ORen,DLsts) :-
  !,
  N1 is N+1,
  cra_to_dl(R1,N1,N2,IMap,Map1,IRen,SRen,DLsts1),
  N3 is N2+1,
  DLsts1 = [':-'(H1,_)|_],
  cra_to_dl(R2,N3,LN,IMap,_Map2,SRen,ORen,DLsts2),
  DLsts2 = [':-'(H2,_)|_],
  H1 =.. [_|A1s],
  H2 =.. [_|A2s],
  get_new_predicate_name(p,N,_,PN),
  HH1 =.. [PN|A1s],
  HH2 =.. [PN|A2s],
  append([':-'(HH1,H1),':-'(HH2,H2)|DLsts1],DLsts2,DLsts),
  simplify_arglist_expr(RArgs,SRArgs),
  map_rel_id_var(RR,SRArgs,A1s,Map1,OMap).
cra_to_dl((minus(_D,R1,R2),[RR|RArgs]),N,LN,IMap,OMap,IRen,ORen,DLsts) :-
  !,
  N1 is N+1,
  cra_to_dl(R1,N1,N2,IMap,Map1,IRen,SRen,DLsts1),
  N3 is N2+1,
  DLsts1 = [':-'(SG1,_)|_],
  cra_to_dl(R2,N3,LN,Map1,Map2,SRen,ORen,DLsts2),
  DLsts2 = [':-'(H2,_)|_],
  SG1 =.. [_|A1s],
  H2 =.. [P2|_],
  SG2 =.. [P2|A1s],
  get_new_predicate_name(p,N,_,PN),
  HH1 =.. [PN|A1s],
  append([':-'(HH1,(SG1,not(SG2)))|DLsts1],DLsts2,DLsts),
  simplify_arglist_expr(RArgs,SRArgs),
  map_rel_id_var(RR,SRArgs,A1s,Map2,OMap).
cra_to_dl((intersect(_D,R1,R2),[RR|RArgs]),N,LN,IMap,OMap,IRen,ORen,DLsts) :-
  !,
  N1 is N+1,
  cra_to_dl(R1,N1,N2,IMap,Map1,IRen,SRen,DLsts1),
  N3 is N2+1,
  DLsts1 = [':-'(SG1,_)|_],
  cra_to_dl(R2,N3,LN,Map1,Map2,SRen,ORen,DLsts2),
  DLsts2 = [':-'(H2,_)|_],
  SG1 =.. [_|A1s],
  H2 =.. [P2|_],
  SG2 =.. [P2|A1s],
  get_new_predicate_name(p,N,_,PN),
  HH1 =.. [PN|A1s],
  append([':-'(HH1,(SG1,SG2))|DLsts1],DLsts2,DLsts),
  simplify_arglist_expr(RArgs,SRArgs),
  map_rel_id_var(RR,SRArgs,A1s,Map2,OMap).
% Build the datalog rule for a pi operator:
% - rel_subgoals builds the conjunction of source relations (times)
%   It also computes the mapping of variables' subgoals to columns
% - exprs_subgoals builds the subgoals for expressions in the projection list
% - map_cols maps the projection list (ArgList) with the head arguments
% - build_id generates the name of the predicate (head)
% - cond_subgoals adds the condition to the subgoals
cra_to_dl((pi(DistinctAll,TopN,ArgList,
           sigma(Condition,Relation),
           group_by(GroupByList),
           having(HavingCondition),
           order_by(OrderByList,_OrderingList)),
           [RR|ArgList]),
            N,LN,IMap,OMap,IRen,ORen,[':-'(Head,Body)|DLsts]) :-
  !,
  get_new_predicate_name(p,N,N1,PN),
  rel_subgoals(Relation,N1,N2,RSGs,DLsts1,IMap,Map1,IRen,Ren1),
  simplify_arglist_expr(ArgList,SArgList),
  exprs_subgoals(SArgList,RR,IsAggr,N2,N21,Map1,Map2,Ren1,Ren11,DLsts11,ESGs),
%   exprs_subgoals(SArgList,RR,IsAggr,Map1,Map2,Ren1,DLsts11,ESGs),
%   Ren11=Ren1, Ren11=Ren1, N21=N2,
  map_cols(SArgList,Map2,Ren1,Args),
  map_cols(GroupByList,Map2,Ren1,GroupByArgs),
  map_cols(OrderByList,Map2,Ren1,_OrderByArgs),
  Head =.. [PN|Args],
  cond_subgoals(sigma,Condition,N21,N3,Map2,Map3,Ren11,Ren2,DLsts2,WSGs),
  cond_subgoals(having,HavingCondition,N3,N4,Map3,OMap,Ren2,ORen,DLsts3,HSGs),
  concat_lists([DLsts1,DLsts11,DLsts2,DLsts3],DLsts5),
%   append(DLsts1,DLsts2,DLsts4),
%   append(DLsts3,DLsts4,DLsts5),
  (GroupByList=[] -> true ; IsAggr=true),
  build_body(IsAggr,RSGs,ESGs,WSGs,HSGs,GroupByArgs,Body1),
  apply_distinct(DistinctAll,N4,LN,Args,Body1,Body2,DLsts5,DLsts),
  apply_top(TopN,Body2,Body).
  
build_body(IsAggr,RSGs,ESGs,WSGs,_HSGs,_GroupByArgs,Body) :-
  var(IsAggr),
  !, 
  append_goals(RSGs,ESGs,SGs1),
  append_goals(SGs1,WSGs,SGs),
  reorder_goals(SGs,Body).
build_body(true,RSGs,ESGs,WSGs,HSGs,GroupByArgs,group_by(OGSGs,GroupByArgs,OCSGs)) :-
  append_goals(RSGs,WSGs,GSGs),
  reorder_goals(GSGs,OGSGs),
  append_goals(ESGs,HSGs,CSGs),
  reorder_goals(CSGs,OCSGs).

apply_distinct(all,N,N,_Args,Body,Body,DLsts,DLsts).
apply_distinct(distinct,N,N,Args,Goal,distinct(Goal),DLsts,DLsts) :-
  my_literal(Goal),
  my_term_variables(Args,Vars1),
  my_term_variables(Goal,Vars2),
  Vars1==Vars2,
  !.
apply_distinct(distinct,N,LN,Args,Body,distinct(Head),DLsts,[':-'(Head,Body)|DLsts]) :-
  get_new_predicate_name(p,N,LN,PN),
  Head =.. [PN|Args].
  
apply_top(top(all),Body,Body) :-
  !.
apply_top(top(TopN),Body,top(TopN,Body)).
  
% Simplification of the projection list  
simplify_arglist_expr(*,*).
simplify_arglist_expr([],[]).
simplify_arglist_expr([expr(attr(Rel,C,_RC),AS,_Type)|Args],[attr(Rel,C,AS)|SArgs]) :-
  !,
  simplify_arglist_expr(Args,SArgs).
simplify_arglist_expr([Arg|Args],[Arg|SArgs]) :-
  !,
  simplify_arglist_expr(Args,SArgs).

% Subgoals built for the expressions in the projection list
exprs_subgoals(ArgList,RR,IsAggr,N,LN,IMap,OMap,IRen,ORen,DLs,SGs) :-
  build_exprs_mappings(ArgList,RR,IMap,IMap1),
  build_exprs_subgoals(ArgList,IsAggr,N,LN,IMap1,OMap,IRen,ORen,DLs,SGs).

build_exprs_mappings([],_RR,Map,Map).
build_exprs_mappings([expr(_SQLExpr,AS,_Type)|Args],RR,IMap,OMap) :-
  build_exprs_mappings(Args,RR,[(_Var,RR,AS)|IMap],OMap).
build_exprs_mappings([_Arg|Args],RR,IMap,OMap) :-
  build_exprs_mappings(Args,RR,IMap,OMap).

build_exprs_subgoals([],_IsAggr,N,N,Map,Map,Ren,Ren,[],true).
build_exprs_subgoals([expr(SQLExpr,AS,Type)|Args],IsAggr,N,LN,IMap,OMap,IRen,ORen,DLs,SGs) :-
  !,
  build_expr_subgoals(expr(SQLExpr,AS,Type),IsAggr,N,N1,IMap,IMap1,IRen,IRen1,EDLs,ESGs),
  build_exprs_subgoals(Args,IsAggr,N1,LN,IMap1,OMap,IRen1,ORen,NDLs,NSGs),
  append(EDLs,NDLs,DLs),
  append_goals(ESGs,NSGs,SGs).
build_exprs_subgoals([_Arg|Args],IsAggr,N,LN,IMap,OMap,IRen,ORen,DLs,SGs) :-
  build_exprs_subgoals(Args,IsAggr,N,LN,IMap,OMap,IRen,ORen,DLs,SGs).

build_expr_subgoals(expr(SQLExpr,AS,_Type),IsAggr,N,LN,IMap,OMap,IRen,ORen,EDLsts,SGs) :-
  translate_expr_varcte(SQLExpr,IsAggr,N,LN,IMap,OMap,IRen,ORen,EDLsts,DLExpr,ESGs),
  (var(DLExpr) ->
   Var=DLExpr,
   SGs=ESGs
   ;
   append_goals((Var=DLExpr),ESGs,SGs)
  ),
%  translate_expr(SQLExpr,DLExpr,IsAggr,Map,Ren),
  ((var(DLExpr),    % Expression reference
    my_member((Var,_,AS),OMap),
    DLExpr\==Var)   % Avoid autoreferences
  ;
   my_member((Var,_,AS),OMap)).
% build_expr_subgoals(expr(SQLExpr,AS,Type),IsAggr,Map,Ren,SG) :-
%   translate_expr(SQLExpr,DLExpr,IsAggr,Map,Ren),
%   my_member((Var,_,AS),Map),
%   (Type = number(_N) ->
%     ((abstract_nulls(DLExpr,NDLExpr),my_ground(NDLExpr)) ->
%      Var is DLExpr,
%      SG=true
%     ;
%      SG=is(Var,DLExpr))
%    ;
%     SG='='(Var,DLExpr)
%    ).

translate_expr(cte(Cte,_Type),Cte,_IsAggr,_Map,_Ren) :-
  !.
translate_expr(attr(Rel,Col,AS),Var,_IsAggr,Map,Ren) :-
  !,
  map_cols([attr(Rel,Col,AS)],Map,Ren,[Var]).
% Reference to an expression
translate_expr(expr_ref(Rel,AS),Var,_IsAggr,Map,_Ren) :-
  !,
  my_member((Var,Rel,AS),Map).
% % CRA statement
% translate_expr(CRA,DLE,IsAggr,Map,Ren) :- 
%   is_CRA(CRA),
%   !, 
%   cra_to_dl(CRA,DLE,IsAggr,1,_LN,[],Map,[],Ren,DLE).
% Expressions, possibly including aggregates, CRAs, ctes, columns
translate_expr(SQLE,DLE,IsAggr,Map,Ren) :- 
  SQLE =.. [F|SQLArgs],
  !, 
  length(SQLArgs,A),
  (arithmetic_function(F,_,_,aggregate,_,A) ->
   IsAggr=true
   ;
   true
  ),
  translate_expr_list(SQLArgs,DLArgs,IsAggr,Map,Ren),
  DLE =.. [F|DLArgs].

translate_expr_list([],[],_IsAggr,_Map,_Ren) :-
  !.
translate_expr_list([T|Ts],[RT|RTs],IsAggr,Map,Ren) :-
  !, 
  translate_expr(T,RT,IsAggr,Map,Ren), 
  translate_expr_list(Ts,RTs,IsAggr,Map,Ren).

% Testing whether input is a Canonical Relational algebra syntax tree
% (Soft test)
% is_CRA((pi(D,T,As,sigma(exists(CRel),CRs),G,H,O),AS)).
% is_CRA((union(D,CRA1,CRA2),AS)).
% is_CRA((minus(D,CRA1,CRA2),AS)).
% is_CRA((intersect(D,CRA1,CRA2),AS)).

% Subgoals for the SQL relation
rel_subgoals(times(RelA,B),N,LN,(SGA,As),DLsts,IMap,OMap,IRen,ORen) :-
  !, 
  build_subgoal(RelA,N,N1,SGA,DLsts1,IMap,SGMap,IRen,SRen), 
  rel_subgoals(B,N1,LN,As,DLsts2,SGMap,OMap,SRen,ORen),
  append(DLsts1,DLsts2,DLsts).
rel_subgoals(left_join(RelA,RelB,C),N,LN,lj(SGA,SGB,SGC),DLsts,IMap,OMap,IRen,ORen) :-
  !, 
  build_subgoal(RelA,N,N1,SGA,DLstsA,IMap,Map1,IRen,Ren1), 
  build_subgoal(RelB,N1,N2,SGB,DLstsB,Map1,Map2,Ren1,Ren2), 
  on_subgoals(C,N2,LN,Map2,OMap,Ren2,ORen,DLstsC,SGC),
  concat_lists([DLstsA,DLstsB,DLstsC],DLsts).
rel_subgoals(right_join(RelA,RelB,C),N,LN,rj(SGA,SGB,SGC),DLsts,IMap,OMap,IRen,ORen) :-
  !, 
  build_subgoal(RelA,N,N1,SGA,DLstsA,IMap,Map1,IRen,Ren1), 
  build_subgoal(RelB,N1,N2,SGB,DLstsB,Map1,Map2,Ren1,Ren2), 
  on_subgoals(C,N2,LN,Map2,OMap,Ren2,ORen,DLstsC,SGC),
  concat_lists([DLstsA,DLstsB,DLstsC],DLsts).
rel_subgoals(full_join(RelA,RelB,C),N,LN,fj(SGA,SGB,SGC),DLsts,IMap,OMap,IRen,ORen) :-
  !, 
  build_subgoal(RelA,N,N1,SGA,DLstsA,IMap,Map1,IRen,Ren1), 
  build_subgoal(RelB,N1,N2,SGB,DLstsB,Map1,Map2,Ren1,Ren2), 
  on_subgoals(C,N2,LN,Map2,OMap,Ren2,ORen,DLstsC,SGC),
  concat_lists([DLstsA,DLstsB,DLstsC],DLsts).
rel_subgoals(Rel,N,LN,SG,DLsts,IMap,OMap,IRen,ORen) :-
  build_subgoal(Rel,N,LN,SG,DLsts,IMap,OMap,IRen,ORen).

build_subgoal((Table,[TableId|RArgs]),N,N,SG,[],IMap,OMap,Ren,Ren) :-
  my_table('$des',Table,Arity), 
  !,
  Length is Arity+1, 
  length(SGs,Length),
  SGs=[Table|Vars], 
  SG=..SGs, 
  get_renamings_schema(RArgs,ARens),
  map_table_id_var((Table,TableId),Vars,ARens,1,IMap,OMap,Ren).
build_subgoal((pi(D,T,ArgList,R,G,H,O),[RR|RArgs]),N,LN,SG,DLsts,IMap,OMap,IRen,ORen) :-
  !,
  N1 is N+1,
  cra_to_dl((pi(D,T,ArgList,R,G,H,O),[RR|RArgs]),N1,LN,IMap,Map1,IRen,ORen,DLsts),
  DLsts = [':-'(SG,_)|_],
  SG=..[_|Vars],
  map_rel_id_var(RR,ArgList,Vars,Map1,OMap).
build_subgoal(Rel,N,LN,SG,DLsts,IMap,OMap,IRen,ORen) :-
  N1 is N+1,
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,DLsts),
  DLsts = [':-'(SG,_)|_].
 
% map_rel_id_var(+AS,+ArgList,+Vars,+IMap,-OMap)
% Maps a SQL relation id to a variable
map_rel_id_var(_AS,[],[],Mapping,Mapping).
% map_rel_id_var(AS,[attr(_,Col,ColRen)|Cols],[Var|Vars],IMap,OMap) :-
%   !,
%   map_rel_id_var(AS,Cols,Vars,[(Var,AS,Col),(Var,AS,ColRen)|IMap],OMap).
map_rel_id_var(AS,[attr(Rel,Col,ColRen)|Cols],[Var|Vars],IMap,OMap) :-
  !,
  Map1 = (Var,AS,Col,ColRen),
  Map2 = (Var,Rel,Col,ColRen),
  add_to_mapping_list([Map1,Map2],IMap,IMap1),
  map_rel_id_var(AS,Cols,Vars,IMap1,OMap).
map_rel_id_var(AS,[expr(_E,Ren,_Type)|Cols],[Var|Vars],IMap,OMap) :-
  Map = (Var,AS,Ren),
  (\+ member(Map,IMap) -> IMap1=[Map|IMap] ; IMap1=IMap),
  map_rel_id_var(AS,Cols,Vars,IMap1,OMap).

  
add_to_mapping_list([],Map,Map).
add_to_mapping_list([Map|Maps],IMap,OMap) :-
  add_to_mapping(Map,IMap,IMap1),
  add_to_mapping_list(Maps,IMap1,OMap).
  
add_to_mapping(Map,IMap,OMap) :-
  (\+ member(Map,IMap) -> OMap=[Map|IMap] ; OMap=IMap).
  
% map_table_id_var(+(Table,TableId),+Vars,+AttrRen,+Nth,+IMap,-OMap,+Renaming)
% Maps a table (or table id) to a variable
map_table_id_var((_Table,_TableId),[],[],_,Mapping,Mapping,_Renaming).
map_table_id_var((Table,TableId),[Var|Vars],[ARen|ARens],N,Mapping,Mapping,Renaming) :-
  my_member((Table,TableId),Renaming),
  my_attribute('$des',N,Table,Col,_Type), 
  my_member((Var,TableId,Col,ARen),Mapping), 
  !,
  N1 is N+1, 
  map_table_id_var((Table,TableId),Vars,ARens,N1,Mapping,Mapping,Renaming).
map_table_id_var((Table,TableId),[Var|Vars],[ARen|ARens],N,IMapping,OMapping,Renaming) :-
  my_member((Table,TableId),Renaming),
  my_attribute('$des',N,Table,Col,_Type), 
  N1 is N+1, 
  map_table_id_var((Table,TableId),Vars,ARens,N1,[(Var,TableId,Col,ARen)|IMapping],OMapping,Renaming).

% map_cols(+Cols,+Mapping,+Renaming,-Arguments)
% maps a list of projected arguments with the arguments of the head
map_cols([],_Mapping,_Renaming,[]).
map_cols([attr(TableId,Col,ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,TableId,Col,ColRen),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(TableId,_Col,ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,TableId,_,ColRen),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(TableId,Col,_ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,TableId,Col,_),Mapping), 
%  my_last_member((Var,TableId,Col),Mapping), % WARNING: To select outermost matching relation in syntax tree. Works with sql debugger
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(TableId,Col,_ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,TableId,_,Col),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(Table,Col,_ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Table,TableId),Renaming),
  my_member((Var,TableId,Col,_),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(Table,Col,_ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((TableId,Table),Renaming),
  my_member((Var,TableId,Col,_),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
% References to expressions:
map_cols([attr(Table,Col,_ColRen)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,Table,Col),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([expr(_Expr,ColRen,_Type)|Cols],Mapping,Renaming,[Var|Xs]) :-
  my_member((Var,_TableId,ColRen),Mapping), 
  !, 
  map_cols(Cols,Mapping,Renaming,Xs).
% map_cols([Constant|Cols],Mapping,Renaming,[Constant|Xs]) :-
%   atomic(Constant), 
map_cols([cte(Constant,_Type)|Cols],Mapping,Renaming,[Constant|Xs]) :-
  map_cols(Cols,Mapping,Renaming,Xs).
map_cols([attr(Table,Col,_ColRen)|_Cols],_Mapping,_Renaming,_Xs) :-
  my_raise_exception(unknown_column(Table,Col),syntax(''),[]).

my_last_member(X,Xs) :-
  my_reverse(Xs,RXs),
  my_member(X,RXs).

% Subgoals for the ON condition (JOIN clauses)
on_subgoals(C,N,LN,IMap,OMap,IRen,ORen,DLsts,SGs) :-
  cond_subgoals(on,C,N,LN,IMap,OMap,IRen,ORen,DLsts,SGs).
  %,
  %(CSGs == ('.') -> OSGs = true ; OSGs = CSGs).

% Subgoals for the WHERE condition (SELECT statements)
cond_subgoals(SOH,C,N,LN,IMap,OMap,IRen,ORen,DLsts,SGs) :-
  translate_cond(SOH,C,N,LN,IMap,OMap,IRen,ORen,DLsts,SGs).

translate_cond(_SOH,true,N,N,Map,Map,Ren,Ren,[],true) :- 
  !.
translate_cond(_SOH,false,N,N,Map,Map,Ren,Ren,[],(false)) :- 
  !.
% translate_cond(sigma,'='(A,B),N,N,Map,Map,Ren,Ren,[],(true)) :-
%  map_cols([A,B],Map,Ren,[VA,VB]),
%  (var(VA); var(VB)), !,
%  VA=VB.
translate_cond(SOH,not(exists(Rel)),N,LN,IMap,OMap,IRen,ORen,DLsts,not(top(1,Goal))) :-
  translate_cond(SOH,exists(Rel),N,LN,IMap,OMap,IRen,ORen,DLsts,Goal).
translate_cond(SOH,not(C),N,LN,IMap,OMap,IRen,ORen,DLsts,not(NC)) :-
  !,
  translate_cond(SOH,C,N,LN,IMap,OMap,IRen,ORen,DLsts,NC).
translate_cond(_SOH,and(C1,C2),N,LN,IMap,OMap,IRen,ORen,DLsts,NC) :-
  translate_cond(SOH,C1,N,N1,IMap,Map1,IRen,Ren1,DLsts1,NC1),
  translate_cond(SOH,C2,N1,LN,Map1,OMap,Ren1,ORen,DLsts2,NC2),
  append_goals(NC1,NC2,NC),
  append(DLsts1,DLsts2,DLsts).
translate_cond(SOH,or(C1,C2),N,LN,IMap,OMap,IRen,ORen,DLsts,(NC1;NC2)) :-
  translate_cond(SOH,C1,N,N1,IMap,Map1,IRen,Ren1,DLsts1,NC1),
  translate_cond(SOH,C2,N1,LN,Map1,OMap,Ren1,ORen,DLsts2,NC2),
  append(DLsts1,DLsts2,DLsts).
translate_cond(_SOH,exists(Rel),N,LN,IMap,OMap,IRen,ORen,DLsts,Goal) :-
  !,
  N1 is N+1,
  get_new_predicate_name(p,N1,_,_PN),
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,UDLsts),
  UDLsts=[':-'(Head,_)|_],
  functor(Head,H,_),
  replace_head_list(H,H,UDLsts,RUDLsts),
  add_correlated_vars(IMap,RUDLsts,DLsts),
  DLsts=[':-'(Goal,_)|_].
translate_cond(_SOH,not_in(Args,Rel),N,LN,IMap,OMap,IRen,ORen,DLsts,not(Goal)) :-
  !,
  N1 is N+1,
  get_new_predicate_name(p,N1,_,_PN),
  map_cols(Args,IMap,IRen,Vars),
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,UDLsts),
  add_correlated_vars(IMap,UDLsts,CDLsts),
  CDLsts = [':-'(Goal,_)|_],
  Goal =.. [_F|GVars],
  append(Vars,_CorrVars,GVars),
  copy_term(CDLsts,DLsts).
translate_cond(_SOH,in(Args,Rel),N,LN,IMap,OMap,IRen,ORen,DLsts,(Goal)) :-
  !,
  N1 is N+1,
  get_new_predicate_name(p,N1,_,_PN),
  map_cols(Args,IMap,IRen,Vars),
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,UDLsts),
  add_correlated_vars(IMap,UDLsts,DLsts),
  DLsts = [':-'(Goal,_)|_],
  Goal =.. [_F|GVars],
  append(Vars,_CorrVars,GVars).
%translate_cond(_SOH,is_null(Arg),N,N,Map,Map,Ren,Ren,[],(Var='$NULL'(_ID))) :-
translate_cond(_SOH,is_null(Arg),N,N,Map,Map,Ren,Ren,[],(is_null(Var))) :-
  my_sql_constant_or_column(Arg),
  !,
  map_cols([Arg],Map,Ren,[Var]).
translate_cond(_SOH,is_null(Rel),N,LN,IMap,OMap,IRen,ORen,DLsts,(Goal,GVar='$NULL'(_ID))) :-
  !,
  N1 is N+1,
  get_new_predicate_name(p,N1,_,_PN),
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,UDLsts),
  add_correlated_vars(IMap,UDLsts,DLsts),
  DLsts = [':-'(Goal,_)|_],
  Goal =.. [_F,GVar].
translate_cond(_SOH,C,N,LN,IMap,OMap,IRen,ORen,DLsts,Goals) :-
  C=..[RelOp,Exp1,Exp2],
  map_cond(RelOp,DLOp),
  !,
  translate_expr_varcte(Exp1,N,N1,IMap,Map1,IRen,Ren1,UDLsts1,VarCte1,UGoals1),
  add_correlated_vars(IMap,UDLsts1,DLsts1),
  add_correlated_vars_goals(UGoals1,DLsts1,Goals1),
  translate_expr_varcte(Exp2,N1,LN,Map1,OMap,Ren1,ORen,UDLsts2,VarCte2,UGoals2),
  add_correlated_vars(IMap,UDLsts2,DLsts2),
  add_correlated_vars_goals(UGoals2,DLsts2,Goals2),
  append(DLsts1,DLsts2,DLsts),
  append_goals(Goals1,Goals2,Goals3),
  % WARNING: VarCte1=VarCte2. Incorrect for unions
  % :-type(t(a:int,b:int)),type(s(a:int,b:int))
  % select a from s where b not in ((select a from t where t.a=s.a) union (select a from t where b=1))
  (false,RelOp=(=),var(VarCte1),var(VarCte2) ->
    VarCte1=VarCte2,
    Goals=Goals3
   ;
    NC=..[DLOp,VarCte1,VarCte2],
    append_goals(Goals3,NC,Goals)
  ),
  !.
 
add_correlated_vars_goals(true,_DLs,true) :-
  !.
add_correlated_vars_goals((UGoal,UGoals),DLs,(Goal,Goals)) :-
  !,
  add_correlated_vars_subgoal(UGoal,DLs,Goal),
  add_correlated_vars_goals(UGoals,DLs,Goals).
add_correlated_vars_goals(UGoal,DLs,Goal) :-
  add_correlated_vars_subgoal(UGoal,DLs,Goal).
  
add_correlated_vars_subgoal(UGoal,DLs,Goal) :-
  UGoal=..[F|_UArgs],
  my_member(':-'(Goal,_),DLs),
  !,
  Goal=..[F|_Args].
add_correlated_vars_subgoal(Goal,_DLs,Goal).
 
translate_expr_varcte(Exp,N,N1,IMap,OMap,IRen,ORen,DLsts,VarCte,Goals) :-
  translate_expr_varcte(Exp,_IsAggr,N,N1,IMap,OMap,IRen,ORen,DLsts,VarCte,Goals).
   
translate_expr_varcte(Exp,IsAggr,N,N1,IMap,OMap,IRen,ORen,DLsts,VarCte,Goals) :-   
  translate_expr(Exp,IsAggr,N,N1,IMap,OMap,IRen,ORen,DLsts,DLExp,Goals1),
  (my_var_or_constant(DLExp) ->
    VarCte=DLExp,
    Goals=Goals1
    ;
%    tuple_append(VarCte is DLExp,Goals1,Goals)).
    append_goals(VarCte = DLExp,Goals1,Goals)).
   
my_var_or_constant(T) :-
  (var(T) ; number(T) ; atom(T) ; T='$NULL'(_ID)), !.
  
% Translating SQL expressions
% Constant or Column:
translate_expr(C,_IsAggr,N,N,Map,Map,Ren,Ren,[],Var,true) :-
  my_sql_constant_or_column(C),
  !,
  map_cols([C],Map,Ren,[Var]).
% Renaming:
translate_expr(attr(Rel,Col,_As),_IsAggr,N,N,Map,Map,Ren,Ren,[],Var,true) :-
  (my_member((Var,Rel,Col,_),Map)
  ;
   my_member((Var,Rel,_,Col),Map)
  ;
   my_member((Var,Rel,Col),Map)
  ),
  !.
% Unknown attribute
translate_expr(attr(R,C,_As),_IsAggr,_N,_LN,_IMap,_OMap,_IRen,_ORen,_DLsts,_DLE,_Goals) :- 
  my_raise_exception(unknown_column(R,C),syntax(''),[]).
% Reference to an expression
translate_expr(expr_ref(Rel,AS),_IsAggr,N,N,Map,Map,Ren,Ren,[],Var,true) :-
  !,
  my_member((Var,Rel,AS),Map).
translate_expr(expr(expr_ref(Rel,AS),_,_),_IsAggr,N,N,Map,Map,Ren,Ren,[],Var,true) :-
  !,
  my_member((Var,Rel,AS),Map).
% DQL statement
translate_expr(Rel,_IsAggr,N,LN,IMap,OMap,IRen,ORen,DLsts,Var,Goal) :-
  my_dql_relation(Rel),
  !,
  N1 is N+1,
  get_new_predicate_name(p,N1,_,_PN),
  cra_to_dl(Rel,N1,LN,IMap,OMap,IRen,ORen,DLsts),
  DLsts=[':-'(Goal,_Body)|_Rules],
  Goal =.. [_F,Var].
% SQL aggregate expression
translate_expr(SQLE,IsAggr,N,LN,IMap,OMap,IRen,ORen,DLsts,DLE,Goals) :- 
  SQLE =.. [F|SQLArgs],
  !, 
  length(SQLArgs,A),
  (arithmetic_function(F,_,_,aggregate,_,A) ->
   IsAggr=true
   ;
   true
  ),
  translate_expr_list(SQLArgs,IsAggr,N,LN,IMap,OMap,IRen,ORen,DLsts,DLArgs,Goals),
  DLE =.. [F|DLArgs].

%translate_expr_list([],N,N,Map,Map,Ren,Ren,[],[],('.')) :-
translate_expr_list([],_IsAggr,N,N,Map,Map,Ren,Ren,[],[],true) :-
  !.
translate_expr_list([T|Ts],IsAggr,N,LN,IMap,OMap,IRen,ORen,DLsts,[RT|RTs],Goals) :-
  !, 
  translate_expr(T,IsAggr,N,N1,IMap,Map1,IRen,Ren1,DLsts1,RT,Goals1), 
  translate_expr_list(Ts,IsAggr,N1,LN,Map1,OMap,Ren1,ORen,DLsts2,RTs,Goals2),
  append(DLsts1,DLsts2,DLsts),
%  tuple_append(Goals1,Goals2,Goals).
  append_goals(Goals1,Goals2,Goals).
  
my_dql_relation((_SQLst,RR)) :-
  RR \= (_C,_R).

my_sql_constant_or_column(Arg) :-
  my_sql_constant(Arg).
my_sql_constant_or_column(Arg) :-
  my_sql_column(Arg).
  
my_sql_constant(cte(_Cte,_Type)).
my_sql_column(attr(_RT,C,_R)) :-
  my_attribute('$des',_P,_T,C,_Type),
  !.

my_sql_op(Op) :-
  map_cond(Op,_).
my_sql_op(and).
my_sql_op(or).
%my_sql_op(not).
%my_sql_op(in).
%my_sql_op(exists).
%my_dl_op(Op) :-
%  map_cond(_,Op).

% map_cond(+RelationalOperator,-DatalogOperator).
map_cond('<=','=<').
map_cond('=','=').
map_cond('<>','\\='). 
map_cond('>=','>=').
map_cond('>','>').
map_cond('<','<').

map_cond('<=_all','=<').
map_cond('=_all','=').
map_cond('<>_all','\\='). 
map_cond('>=_all','>=').
map_cond('>_all','>').
map_cond('<_all','<').

map_cond('<=_any','=<').
map_cond('=_any','=').
map_cond('<>_any','\\='). 
map_cond('>=_any','>=').
map_cond('>_any','>').
map_cond('<_any','<').

% complement
complement_cond(true,false) :-
  !.
complement_cond(false,true) :-
  !.
complement_cond(not(C),CC) :-
  simplify_cond(C,CC),
  !.
complement_cond(and(C1,C2),or(CC1,CC2)) :-
  !,
  complement_cond(C1,CC1),
  complement_cond(C2,CC2).
complement_cond(or(C1,C2),and(CC1,CC2)) :-
  !,
  complement_cond(C1,CC1),
  complement_cond(C2,CC2).
complement_cond(C,NC) :-
  C=..[Op|As],
  map_cond(Op,_),
  !,
  complement_RA_op(Op,NOp),
  NC=..[NOp|As].

% complemented RA operator
complement_RA_op('<=','>').
complement_RA_op('=','<>').
complement_RA_op('<>','='). 
complement_RA_op('>=','<').
complement_RA_op('>','<=').
complement_RA_op('<','>=').

% adds correlated variables
add_correlated_vars(Map,UDLsts,DLsts) :-
  my_term_variables(Map,MapVars),
  lfp_add_rule_correlated_vars(MapVars,[],CHs,[':-'('$p0','$p1')|UDLsts],[_|CDLsts]),
  add_head_correlated_void_vars_list(CDLsts,CHs,DLsts).

add_head_correlated_void_vars_list([],_CHs,[]).
add_head_correlated_void_vars_list([':-'(H,B)|UDLsts],CHs,[':-'(CH,B)|TDLsts]) :-
  add_head_correlated_void_vars(H,CHs,CH),
  add_head_correlated_void_vars_list(UDLsts,CHs,TDLsts).
add_head_correlated_void_vars_list([H|UDLsts],CHs,[H|TDLsts]) :-
  add_head_correlated_void_vars_list(UDLsts,CHs,TDLsts).

add_head_correlated_void_vars(H,CHs,CH) :-
  functor(H,F,A),
  my_member((F,A1,Vs),CHs),
  !,
  length(Vs,LVs),
  N is A1+LVs-A,
  void_list(N,Voids),
  H=..[F|Args],
  append(Args,Voids,ExtArgs),
  CH=..[F|ExtArgs].
add_head_correlated_void_vars(H,_CHs,H).

void_list(0,[]) :-
  !.
void_list(N,[void|Voids]) :-
  N1 is N-1,
  void_list(N1,Voids).

lfp_add_rule_correlated_vars(MapVars,CHsi,CHso,DLstsi,DLstso) :-
  add_head_correlated_vars_list(MapVars,DLstsi,CHsi,CHs1,DLsts1),
%  set_head_void_args_list(DLsts1,DLsts2),
  DLsts1=DLsts2,
  add_body_correlated_vars_list(DLsts2,CHs1,DLsts3),
  (DLstsi==DLsts3 ->
   DLstso=DLsts3,
   CHso=CHsi
   ;
   lfp_add_rule_correlated_vars(MapVars,CHs1,CHso,DLsts3,DLstso)).

add_head_correlated_vars_list(_MapVars,[],CPs,CPs,[]).
add_head_correlated_vars_list(MapVars,[':-'(H,B)|UDLsts],ICPs,OCPs,[':-'(CH,B)|TDLsts]) :-
  !,
  add_head_correlated_vars(MapVars,H,B,ICPs,NICPs,CH),
  add_head_correlated_vars_list(MapVars,UDLsts,NICPs,OCPs,TDLsts).
add_head_correlated_vars_list(MapVars,[H|UDLsts],ICPs,OCPs,[CH|TDLsts]) :-
  add_head_correlated_vars(MapVars,H,true,ICPs,NICPs,CH),
  add_head_correlated_vars_list(MapVars,UDLsts,NICPs,OCPs,TDLsts).

add_head_correlated_vars(MapVars,H,B,ICPs,OCPs,CH) :-
  my_term_variables(H,HVars),
  my_term_variables(B,BVars),
  my_subtract_var(BVars,HVars,FCVars),
  my_intersect_var(FCVars,MapVars,CVars),  
  functor(H,F,A),
  (my_member((F,AI,Vs),ICPs) ->
    my_union_var(Vs,CVars,UOCVars),
    my_quicksort_pred(UOCVars,'@<',OCVars),
    add_atom_vars(OCVars,H,AI,CH),
    replace_list((F,AI,Vs),(F,AI,OCVars),ICPs,OCPs)
    ;
    my_quicksort_pred(CVars,'@<',OCVars),
    add_atom_vars(OCVars,H,A,CH),
    OCPs=[(F,A,OCVars)|ICPs]).
  
add_atom_vars(Vars,H,A,HC) :-
  H =.. [P|HVars],
  take_N(A,HVars,OVars),
  append(OVars,Vars,HCVars),
  HC =.. [P|HCVars].

% set_head_void_args_list([],[]).
% set_head_void_args_list([':-'(CH,B)|UDLsts],[':-'(VCH,B)|TDLsts]) :-
%   !,
%   set_head_void_args(CH,B,VCH),
%   set_head_void_args_list(UDLsts,TDLsts).
% set_head_void_args_list([CH|UDLsts],[VCH|TDLsts]) :-
%   set_head_void_args(CH,true,VCH),
%   set_head_void_args_list(UDLsts,TDLsts).

% set_head_void_args(CH,B,VCH) :-
%   my_term_variables(CH,CHVars),
%   my_term_variables(B,BVars),
%   my_subtract_var(CHVars,BVars,UVars),
%   replace_unsafe_vars(CH,UVars,VCH).
%   
% replace_unsafe_vars(CH,UVars,VCH) :-
%   CH=..[F|Args],
%   replace_unsafe_vars_list(Args,UVars,RArgs),
%   VCH=..[F|RArgs].

% replace_unsafe_vars_list([],_UVars,[]).
% replace_unsafe_vars_list([A|Args],UVars,[void|RArgs]) :-
%   my_membervar(A,UVars),
%   !,
%   replace_unsafe_vars_list(Args,UVars,RArgs).
% replace_unsafe_vars_list([A|Args],UVars,[A|RArgs]) :-
%   replace_unsafe_vars_list(Args,UVars,RArgs).

add_body_correlated_vars_list([],_CHs,[]).
add_body_correlated_vars_list([':-'(H,B)|UDLsts],CHs,[':-'(H,CB)|TDLsts]) :-
  !,
  add_body_correlated_vars(B,CHs,CB),
  add_body_correlated_vars_list(UDLsts,CHs,TDLsts).
add_body_correlated_vars_list([H|UDLsts],CHs,[H|TDLsts]) :-
  add_body_correlated_vars_list(UDLsts,CHs,TDLsts).

add_body_correlated_vars((B,Bs),CHs,(CB,CBs)) :-
  !,
  add_body_correlated_vars(B,CHs,CB),
  add_body_correlated_vars(Bs,CHs,CBs).
add_body_correlated_vars(B,CHs,CB) :-
  B=distinct(G),
  !,
  G=..[F|As],
  (my_member((F,AI,Vs),CHs),
   add_atom_vars(Vs,G,AI,CG),
   G\==CG   
    ->
    CB=distinct(As,CG)
    ;
    CB=B).
add_body_correlated_vars(B,CHs,CB) :-
  B=distinct(DVs,G),
  !,
  G=..[F|_As],
  (my_member((F,AI,Vs),CHs) ->
   add_atom_vars(Vs,G,AI,CG),
   CB=distinct(DVs,CG)
  ;
   CB=B
  ).
add_body_correlated_vars(B,CHs,CB) :-
  (B=not(G),
   CB=not(CG)
  ;
   G=B,
   CB=CG
   ),
  !,
  functor(G,F,_A),
  (my_member((F,AI,Vs),CHs) ->
    add_atom_vars(Vs,G,AI,CG)
    ;
    CG=G).
  

% meta_pred(not/1).
% meta_pred(distinct/1).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% disjunctive_to_conjunctive_ruleNVs_list(+DRuleNVsList,
%   -CRuleNVsList,+IArgsListi,-IArgsListo,-Exploded) 
% Translates a list of Datalog rules with disjunctions (DRuleNVsList)
% into a list of Datalog rules without disjunctions (CRuleNVsList)
% True goals are removed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disjunctive_to_conjunctive_ruleNVs_list([],[],[],[],_Exploded).
disjunctive_to_conjunctive_ruleNVs_list([DRuleNVs|DRuleNVsList],CRuleNVsList,[IArgs|IArgsListi],IArgsListo,Exploded) :-
  DRuleNVs = (':-'(H,B),NVs),
  !,
  disjunctive_to_conjunctive_rule(H,('.'),B,NVs,IArgs,[],RuleNVsList,[],IArgsList1,Exploded),
  disjunctive_to_conjunctive_ruleNVs_list(DRuleNVsList,TRuleNVsList,IArgsListi,IArgsList2,Exploded),
  append(RuleNVsList,TRuleNVsList,CRuleNVsList),
  append(IArgsList1,IArgsList2,IArgsListo).
disjunctive_to_conjunctive_ruleNVs_list([RuleNVs|DRuleNVsList],[RuleNVs|CRuleNVsList],[IArgs|IArgsListi],[IArgs|IArgsListo],Exploded) :-
  disjunctive_to_conjunctive_ruleNVs_list(DRuleNVsList,CRuleNVsList,IArgsListi,IArgsListo,Exploded).
  
disjunctive_to_conjunctive_rule(H,LBs,(B,RBs),NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded) :-
  !,
  disjunctive_to_conjunctive_rule_6(H,LBs,B,RBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded).
disjunctive_to_conjunctive_rule(H,Bs,B,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded) :-
  disjunctive_to_conjunctive_rule_6(H,Bs,B,('.'),NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded).

disjunctive_to_conjunctive_rule_6(H,LBs,(LB,RB),RBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded) :-
  !,
  tuple_append(RB,RBs,NRBs),
  disjunctive_to_conjunctive_rule_6(H,LBs,LB,NRBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded).
disjunctive_to_conjunctive_rule_6(H,LBs,(LB;RB),RBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,true) :-
  !,
  copy_term((H,LBs,LB,RBs,NVs),(CLH,CLLBs,CLLB,CLRBs,CLNVs)),
  disjunctive_to_conjunctive_rule(CLH,CLLBs,(CLLB,CLRBs),CLNVs,IArgs,RuleNVsListi,RuleNVsList1,IArgsListi,IArgsList1,Exploded),
  copy_term((H,LBs,RB,RBs,NVs),(CRH,CRLBs,CRLB,CRRBs,CRNVs)),
  disjunctive_to_conjunctive_rule(CRH,CRLBs,(CRLB,CRRBs),CRNVs,IArgs,RuleNVsList1,RuleNVsListo,IArgsList1,IArgsListo,Exploded).
disjunctive_to_conjunctive_rule_6(H,LBs,B,('.'),NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,_Exploded) :-  
  !,
  tuple_append(LBs,B,NLBs),
  append(RuleNVsListi,[(':-'(H,NLBs),NVs)],RuleNVsListo),
  append(IArgsListi,[IArgs],IArgsListo).
disjunctive_to_conjunctive_rule_6(H,LBs,B,RBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded) :-  
  !,
  tuple_append(LBs,B,NLBs),
  disjunctive_to_conjunctive_rule(H,NLBs,RBs,NVs,IArgs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tracing 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tracing Datalog predicates

trace_datalog(Query,NVs,Ordering) :-
  processC(clear_et,[],_NVs,_Yes),
  my_term_to_string(Query,QueryStr,NVs),
  output(Output),
  set_flag(output,off),
  process_datalog(QueryStr),
  set_flag(output,Output),
  functor(Query,Predicate,Arity),
  trace(datalog,Predicate/Arity,Ordering).
 
% Tracing SQL Views
 
trace_sql(ViewName,Ordering) :-
  (view_arity(ViewName,Arity) ->
   length(Args,Arity),
   Query=..[ViewName|Args],
   my_term_to_string(Query,QueryStr),
   output(Output),
   set_flag(output,off),
   process_datalog(QueryStr),
   set_flag(output,Output),
   trace(sql,ViewName/Arity,Ordering)
  ;
%    write_log_list(['Error: View ''',ViewName,''' does not exist.',nl]),
%    display_view_alternatives(ViewName)
  my_raise_exception(unknown_view(ViewName),syntax(''),[])
  ).

 
trace(Language,Name/Arity,Ordering) :-
  pdg(PDG),
  sub_pdg(Name/Arity,PDG,SubPDG),
  pdg_to_pdt(Name/Arity,SubPDG,PDT),
  pdt_traverse_order(Ordering,PDT,OrderedNodes),
  (Language==sql ->
    filter_views_and_tables(OrderedNodes,Nodes)
   ;
    (development(on) ->
      Nodes=OrderedNodes
     ;
      filter_sources(OrderedNodes,Nodes)
    )
  ),
  trace_nodes(Language,Nodes).
  
% Find an order for visiting nodes  
pdt_traverse_order(postorder,node(N/A,[]),[N/A]) :-
  !.
pdt_traverse_order(postorder,node(N/A,Children),NAs) :-
  pdt_traverse_order_list(postorder,Children,TNAs),
  append(TNAs,[N/A],NAs).

pdt_traverse_order(preorder,node(N/A,[]),[N/A]) :-
  !.
pdt_traverse_order(preorder,node(N/A,Children),[N/A|NAs]) :-
  pdt_traverse_order_list(preorder,Children,NAs).

pdt_traverse_order_list(postorder,[],[]).
pdt_traverse_order_list(postorder,[PDT|PDTs],NAs) :-
  pdt_traverse_order(postorder,PDT,NAs1),
  pdt_traverse_order_list(postorder,PDTs,NAs2),
  append(NAs1,NAs2,NAs).

pdt_traverse_order_list(preorder,[],[]).
pdt_traverse_order_list(preorder,[PDT|PDTs],NAs) :-
  pdt_traverse_order(preorder,PDT,NAs1),
  pdt_traverse_order_list(preorder,PDTs,NAs2),
  append(NAs1,NAs2,NAs).

filter_views_and_tables([],[]).
filter_views_and_tables([N/A|NAs],[N/A|Vs]) :-
  (view_arity(N,A)
   ;
   table_arity(N,A)
  ),
  !,
  filter_views_and_tables(NAs,Vs).
filter_views_and_tables([_NA|NAs],Vs) :-
  filter_views_and_tables(NAs,Vs).

filter_sources([],[]).
filter_sources([N/A|NAs],[N/A|Vs]) :-
  length(Args,A),
  Head=..[N|Args],
  (Rule=Head ; Rule=':-'(Head,_Body)),
  (datalog(Rule,_,_,_,_,source),
   !
   ;
   my_not(datalog(Rule,_,_,_,_,_)),
   my_not(my_builtin_pred(N)),
   !
  ),
  filter_sources(NAs,Vs).
filter_sources([_NA|NAs],Vs) :-
  filter_sources(NAs,Vs).

trace_nodes(Language,[]) :-
  node_type(Language,NodeType),
  write_log_list(['Info: No more ',NodeType,'s to trace.',nl]).
trace_nodes(Language,[N/A|NAs]) :-
  node_type(Language,NodeType),
  write_log_list(['Info: Tracing ',NodeType,' ''',N,'''.',nl]),
  ((Language==sql, verbose(on)) -> list_schema_list([N]) ; true),
  list_et_answers(N/A),
  (NAs==[] ->
    trace_nodes(Language,[])
   ;
    write_log_list(['Info:  Remaining ',NodeType,'s: ',NAs,nl]),
    write_log_list(['Input: Continue? (y/n) [y]: ']),
    user_input_string(Str),
    ((Str=[] ; Str=="y" ; Str=="Y") ->
      trace_nodes(Language,NAs)
      ;
      true
    )
  ).
  
node_type(Language,NodeType) :-  
  (Language==sql ->
    NodeType=view
   ;
    NodeType=predicate).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Debugging SQL Views
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% debug_sql(ViewName,Options) :-
%   get_debug_sql_options(Options,TrustTables,TrustFile,Order),
%   !,
%   debug_sql(ViewName,TrustTables,TrustFile,Order).
% debug_sql(_ViewName,Options) :-
%   write_error_log(['Incorrect arguments: ',Options]).

% get_debug_sql_options(Options,trust_tables(TT),trust_file(TF),order(O)) :-  
%   get_cmd_options(Options,[trust_tables(TT),trust_file(TF),order(O)],
%                           [debug_sql_trust_tables_option_test,debug_sql_trust_file_option_test,debug_sql_order_option_test],
%                           [trust_tables(yes),trust_file(no(file)),order(preorder)]).
%   
% get_cmd_options([],Defaults,_Tests,Defaults).
% get_cmd_options([CmdOption|CmdOptions],AllowedOptions,Tests,Defaults) :-
%   remove_option(CmdOption,Test,AllowedOptions,NAllowedOptions,Tests,NTests,Defaults,NDefaults),
%   !,
%   my_apply(Test,[CmdOption]),
%   get_cmd_options(CmdOptions,NAllowedOptions,NTests,NDefaults).
% get_cmd_options([CmdOption|_CmdOptions],_AllowedOptions,_Tests,_Defaults) :-
%   write_error_log(['Incorrect argument: ',CmdOption]).
%   
% % Removing an option
% remove_option(X,T,[X|Xs],Xs,[T|Ts],Ts,[_U|Us],Us).
% remove_option(X,T,[Y|Xs],[Y|Ys],[TY|Ts],[TY|Ss],[U|Us],[U|Vs]) :-
%   remove_option(X,T,Xs,Ys,Ts,Ss,Us,Vs).

% % Tests for debug_sql command options
% debug_sql_trust_tables_option_test(trust_tables(O)) :-
%   my_member(O,[yes,no]),
%   !.
% debug_sql_trust_tables_option_test(trust_tables(O)) :-
%   write_error_log(['Incorrect trust table option ''',O,'''.']),
%   fail.

% debug_sql_trust_file_option_test(trust_file(F)) :-
%   my_file_exists_with_default_extensions(F,['.sql'],_FP),
%   !.
% debug_sql_trust_file_option_test(trust_file(_F)) :-
%   % write_log_list(['Error: File ''',F,''' does not exist.',nl]),
%   fail.

% debug_sql_order_option_test(order(O)) :-
%   my_member(O,[preorder,'dq']),
%   !.
% debug_sql_order_option_test(order(O)) :-
%   write_error_log(['Incorrect order option ''',O,'''.']),
%   fail.

%      
% debug_sql(ViewName,trust_tables(TrustTablesYN),trust_file(FileName),order(Order)) :-
%   set_flag(trusted_views,[]),
%   (view_arity(ViewName,Arity) ->
%    pdg(PDG),
%    sub_pdg(ViewName/Arity,PDG,SubPDG),
%    (FileName==no(file) ->
%      TrustFileYN=no
%     ;
%      set_flag(trusting,on),
%      (verbose(off) -> (output(Output),set_flag(output,off)) ; true),
%      processC(process,[FileName],_NVs,_Continue),
%      (verbose(off) -> set_flag(output,Output) ; true),
%      set_flag(trusting,off),
%      TrustFileYN=yes
%    ),
%    debug_sql(ViewName/Arity,TrustTablesYN,TrustFileYN,Order,SubPDG),
%    drop_trusted_views
%   ;
% %    write_log_list(['Error: View ''',ViewName,''' does not exist.',nl]),
% %    display_view_alternatives(ViewName)
%   my_raise_exception(unknown_view(ViewName),syntax(''),[])
%   ).
%   
% % Drop trusted views after trusted debugging. The extension table is cleared if there are such views
% drop_trusted_views :-
%   trusted_views(VNs),
%   drop_viewname_k_list(VNs),
%   (VNs\==[] -> 
%     processC(clear_et,[],_NVs,_Yes)
%    ;
%     true
%   ).
%   
%   
% debug_sql(ViewName/Arity,TrustTablesYN,TrustFileYN,Order,PDG) :-
%   pdg_to_rdt(ViewName/Arity,PDG,RDT),
%   debug_sql_pdt_traverse_order(Order,TrustTablesYN,TrustFileYN,RDT,ViewName/Arity,[(ViewName/Arity,no)],_NodeTagListO,BuggyNode,NodeType),
%   (var(BuggyNode) ->
%     write_log_list(['Warning: Unable to find a buggy node.',nl])
%    ;
%     (BuggyNode==abort ->
%       write_log_list(['Info: Debugging aborted.',nl])
%      ;
%       BuggyNode=N/A,
%       write_log_list(['Info: Buggy ',NodeType,' found: ',N/A,'.',nl])
%     )
%   ).
%   
% % debug_sql_pdt_traverse_order(+Ordering,
% %                              +TrustTablesYN (yes/no),
% %                              +TrustFileYN   (yes/no),
% %                              +PDT,
% %                              +ParentNode (Name/Arity),
% %                              +NodeTagListInput  ([(Name/Arity,Valid)]),
% %                              +NodeTagListOutput ([(Name/Arity,Valid)]),
% %                              +BuggyNode  (Name/Arity),
% %                              +NodeType   (view|table)
% %                             )
% debug_sql_pdt_traverse_order(preorder,TrustTablesYN,TrustFileYN,node(N/A,[]),Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
%   !,
%   debug_sql_node(TrustTablesYN,TrustFileYN,N/A,Type,Parent,NodeTagListI,Valid),
%   add_node_tag(N/A,Valid,NodeTagListI,NodeTagListO),
%   ((Valid==no, debug_object(N/A)) ->
%     BuggyNode=N/A,
%     NodeType=Type
%    ;
%     true
%   ).
% debug_sql_pdt_traverse_order(preorder,TrustTablesYN,TrustFileYN,node(N/A,Children),Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
%   debug_sql_node(TrustTablesYN,TrustFileYN,N/A,Type,Parent,NodeTagListI,Valid),
%   add_node_tag(N/A,Valid,NodeTagListI,NodeTagList2),
%   (Valid==yes ->
%     NodeTagListO=NodeTagList2
%    ;
%     (Valid==abort ->
%       BuggyNode=abort
%      ;
%       % N/A is nonvalid
%       debug_sql_pdt_traverse_order_list(preorder,TrustTablesYN,TrustFileYN,Children,N/A,NodeTagList2,NodeTagListO,BuggyNode,NodeType),
%       ((var(BuggyNode),debug_object(N/A)) ->
%         % If N/A has no buggy children, N/A is the buggy node
%         BuggyNode=N/A,
%         NodeType=Type
%        ;
%         true
%       )
%     )
%   ).

%   
% debug_sql_pdt_traverse_order('dq',_TrustTablesYN,_TrustFileYN,node(N/A,[]),_Parent,NodeTagList,NodeTagList,N/A,NodeType) :-
%   !,
%   sql_node_type(N/A,NodeType).
% debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,PDT,Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
%   divide_tree(PDT,LPDT,RPDT),
%   RPDT=node(N/A,_Children),
%   debug_sql_node(TrustTablesYN,TrustFileYN,N/A,_Type,Parent,NodeTagListI,Valid),
%   add_node_tag(N/A,Valid,NodeTagListI,NodeTagList2),
%       % Abort debugging
%   (Valid==abort ->
%     BuggyNode=abort
%    ;
%       % N/A is valid
%     (Valid==yes -> 
%       debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,LPDT,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
%      ;
%       % N/A is nonvalid
%       debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,RPDT,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
% %       ((var(BuggyNode),debug_object(N/A)) ->
% %         % If N/A has no buggy children, N/A is the buggy node
% %         BuggyNode=N/A,
% %         NodeType=Type
% %        ;
% %         true
% %       )
%     )
%   ).
%   
%     
% add_node_tag(_N/_A,Valid,NodeTagList,NodeTagList) :-
%   var(Valid),
%   !.  
% add_node_tag(N/A,Valid,NodeTagListI,NodeTagListO) :-
%   (my_member_chk((N/A,Valid),NodeTagListI) ->
%     NodeTagListO=NodeTagListI
%    ;
%     NodeTagListO=[(N/A,Valid)|NodeTagListI]).
%   
% debug_object(N/A) :-
%   view_arity(N,A),
%   !. 
% debug_object(N/A) :-
%   table_arity(N,A).

% debug_sql_pdt_traverse_order_list(_Order,_TrustTablesYN,_TrustFileYN,[],_Parent,NodeTagList,NodeTagList,_BuggyNode,_NodeType).
% debug_sql_pdt_traverse_order_list(Order,TrustTablesYN,TrustFileYN,[PDT|PDTs],Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
%   debug_sql_pdt_traverse_order(Order,TrustTablesYN,TrustFileYN,PDT,Parent,NodeTagListI,NodeTagList2,BuggyNode,NodeType),
%   (var(BuggyNode) ->
%     debug_sql_pdt_traverse_order_list(Order,TrustTablesYN,TrustFileYN,PDTs,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
%    ;
%     NodeTagListO=NodeTagList2
%   ).

% debug_sql_node(TrustTablesYN,TrustFileYN,N/A,NodeType,Parent,NodeTagList,Valid) :-
%   % Check what object is (table or view). If tables are trusted, fail and use default case (which does nothing)
%   sql_node_type(N/A,NodeType),
%   (TrustTablesYN==yes ->
%     NodeType==view  % Fails if NodeType is table
%    ;
%     true
%   ),
%   % Check whether the node has been already visited and checked 
%   (my_member_chk((N/A,Valid),NodeTagList) ->
%     true
%    ;
%     % Check whether a trust file is used. If so, try to find the trusted object (it may not exists)
%     (TrustFileYN==yes ->
%       name_trusted(N,TrustObjectName),
%       pdg((Nodes,_Arcs)),
%       (my_member_chk(TrustObjectName/A,Nodes) ->
%         TrustObjectFound=yes,
%         write_verb_list(['Info: Trusting ',NodeType,'''',N,''' from trust file.',nl])
%        ;
%         TrustObjectFound=no
%       )
%      ;
%       TrustObjectFound=no 
%     ),
%     !,
%     write_log_list(['Info: Debugging ',NodeType,' ''',N,'''.',nl]),
%     (verbose(off) -> set_flag(output,off) ; true),
%     list_schema_list([N]),
%     length(Args,A),
%     Query=..[N|Args],
%     my_term_to_string(Query,QueryStr),
%     write_log_list(['Info: Outcome of ',NodeType,' ''',N,''':',nl]),
%     ((verbose(off), TrustObjectFound==no) -> set_flag(output,on) ; true),
%     process_datalog(QueryStr),
%     (verbose(off) -> set_flag(output,off) ; true),
%     (TrustObjectFound==yes ->
%       TrustQuery=..[TrustObjectName|Args],
%       my_term_to_string(TrustQuery,TrustQueryStr),
%       process_datalog(TrustQueryStr),
%       (verbose(off) -> set_flag(output,on) ; true),
%       (same_meaning(N,TrustObjectName,A) ->
%         TrustValid=yes,
%         write_log_list(['Info: ',NodeType,' ''',N,''' is valid w.r.t. the trusted file.',nl])
%        ;
%         TrustValid=no,
%         write_log_list(['Info: ',NodeType,' ''',N,''' is nonvalid w.r.t. the trusted file.',nl])
%       )
%      ;
%       TrustValid=unknown
%     ),
%     (verbose(off) -> set_flag(output,on) ; true),
%     % If no trust object is found, then ask the user for the validity of the debugged object 
%     (TrustValid==unknown ->
%       write_log_list(['Input: Is this ',NodeType,' valid? (y/n/a) [y]: ']),
%       flush_output,
%       readln(Str,_),
%       (batch(_,_,_) -> inc_line, write_string_log(Str), nl_log ; true),
%       (\+ batch(_,_,_),log(_,_) -> write_only_to_log(Str), nl_only_to_log ; true),
%       ((Str=[] ; Str=="y" ; Str=="Y") ->
%         Valid=yes
%         ;
%         (Str=="n" ->
%           Valid=no
%          ;
%           (Str=="a" ->
%             Valid=abort
%            ;
%             write_error_log(['Invalid input. Use ''y'' for setting this node as valid, ''n'' for nonvalid or ''a'' for aborting.']),
%             debug_sql_node(TrustTablesYN,TrustFileYN,N/A,NodeType,Parent,NodeTagList,Valid)
%           )
%         )
%       )
%      ;
%     % Otherwise, validity corresponds to the equivalence between meanings of the object and trusted object
%       Valid=TrustValid 
%     )
%  ).
% % The following corresponds to the root node (a view)  
% debug_sql_node(_TT,_TF,_N/_A,view,_Parent,_NodeTagList,_Valid).
%   
% sql_node_type(N/A,NodeType) :-
%   view_arity(N,A), 
%   NodeType=view,
%   !.
% sql_node_type(N/A,NodeType) :-
%   table_arity(N,A),
%   NodeType=table.
%      
% % Test whether two predicates P1 and P2 of arity A have the same meaning
% same_meaning(P1,P2,A) :-
%   get_et_facts(P1/A,P1Facts),
%   get_et_facts(P2/A,P2Facts),
%   length(P1Facts,L),
%   length(P2Facts,L),
%   (L==0 ->
%     true
%    ;
%     P1Facts=[Fact|_Facts],
%     Fact=..[F|_Args],
%     replace_functor_term_list(P2Facts,F,RP2Facts),
%     my_sort(P1Facts,OFacts),
%     my_sort(RP2Facts,OFacts)
%   ).
%   
%   
% % Divide a tree with two or more nodes from its centre
% divide_tree(node(N1/A1,[node(N2/A2,[])]),node(N1/A1,[]),node(N2/A2,[])) :-
%   !.
% divide_tree(PDT,LPDT,RPDT) :-
%   nbr_pdt_nodes(PDT,Nbr),
%   compute_pdt_weights(PDT,Nbr,Nbr,Min,WPDT),
%   divide_tree(PDT,WPDT,Min,LPDT,RPDT).
%   
% % pdg_to_pdt(a/1,([a/1,b/2],[a/1+b/2]),PDT),divide_tree(PDT,LPDT,RPDT).
% % pdg_to_pdt(a/1,([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+a/1]),PDT),divide_tree(PDT,LPDT,RPDT).
%   
% compute_pdt_weights(node(N/A,Children),Nbr,CMin,Min,node(N/A,W,WChildren)) :-
%   nbr_pdt_nodes(node(N/A,Children),Size),
%   W is abs((Nbr-Size)-Size),
%   my_min(W,CMin,Min1),
%   compute_pdt_weights_list(Children,Nbr,Min1,Min,WChildren).
%   
% compute_pdt_weights_list([],_Nbr,Min,Min,[]).
% compute_pdt_weights_list([Child|Children],Nbr,CMin,Min,[WChild|WChildren]) :-
%   compute_pdt_weights(Child,Nbr,CMin,Min1,WChild),
%   compute_pdt_weights_list(Children,Nbr,Min1,Min,WChildren).
%   
% nbr_pdt_nodes(node(_NA,Children),Nbr) :-
%   nbr_pdt_nodes_list(Children,LNbr),
%   Nbr is LNbr+1.
%   
% nbr_pdt_nodes_list([],0).
% nbr_pdt_nodes_list([Child|Children],Nbr) :-
%   nbr_pdt_nodes(Child,CNbr),
%   nbr_pdt_nodes_list(Children,LNbr),
%   Nbr is CNbr+LNbr.
%    
% divide_tree(node(N/A,Children),node(N/A,_Min,WChildren),Min,node(N/A,LChildren),Center) :-
%   divide_tree_list(Children,WChildren,Min,LChildren,Center).
%   
% divide_tree_list([],[],_Min,[],_CenterNotFound).
% divide_tree_list([node(N/A,Children)|Nodes],[node(N/A,Min,_WChildren)|_WNodes],Min,Nodes,node(N/A,Children)) :-
%   !.
% divide_tree_list([node(N/A,Children)|Nodes],[node(N/A,W,WChildren)|WNodes],Min,[node(N/A,LChildren)|LNodes],Center) :-
%   divide_tree(node(N/A,Children),node(N/A,W,WChildren),Min,node(N/A,LChildren),Center),
%   (var(Center) -> 
%     divide_tree_list(Nodes,WNodes,Min,LNodes,Center)
%    ;
%     LNodes=Nodes).
    
% pdg_to_pdt(a/1,([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+a/1]),PDT),compute_pdt_weights(PDT,WPDT).
% pdg_to_pdt(a/1,([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+a/1]),PDT),nbr_pdt_nodes(PDT,Nbr),compute_pdt_weights(PDT,Nbr,Nbr,Min,WPDT),divide_tree(WPDT,Min,LPDT,RPDT).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ancillary stuff for tracing Datalog and SQL queries and debugging SQL views  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicate dependency graph to Relation (views or tables) dependency tree
pdg_to_rdt(ViewName/Arity,PDG,RDT) :-
  pdg_to_pdt(ViewName/Arity,PDG,PDT),
  pdt_to_rdt(PDT,RDT).
  


% Predicate dependency graph to Predicate dependency tree
% Recursive calls do not occur in the tree
pdg_to_pdt(N/A,PDG,PDT) :-
  recursive_predicates_from_pdg(PDG,RNAs),
  pdg_to_pdt(N/A,PDG,PDT,RNAs,[],_Visited).
  
% Non-empty pdt  
% pdt ::= node(N,nodes)
% nodes ::= [pdt1,...,pdtn] , where pdti, i>=0, are children of N
pdg_to_pdt(N/A,(_NAs,[]),node(N/A,[]),RNAs,V,V) :-
  !,
  my_not((visited_predicate(N/A,V),
          recursive_predicate(N/A,RNAs))).
pdg_to_pdt(N/A,(NAs,Es),node(N/A,Children),RNAs,Vin,Vout) :-
  my_nf_setof(DN/DA,
    (
     (my_member(N/A+DN/DA,Es)
       ;
      my_member(N/A-DN/DA,Es))
     ,
     my_not((visited_predicate(DN/DA,[N/A|Vin]), 
             recursive_predicate(DN/DA,RNAs)))
    ),
    DNDAs),
  pdg_to_pdt_list(DNDAs,(NAs,Es),Children,RNAs,[N/A|Vin],Vout).

pdg_to_pdt_list([],_PDG,[],_RNAs,V,V).
pdg_to_pdt_list([N/A|NAs],PDG,PDT,RNAs,Vin,Vout) :-
  visited_predicate(N/A,Vin),
  recursive_predicate(N/A,RNAs),
  !,
  pdg_to_pdt_list(NAs,PDG,PDT,RNAs,Vin,Vout).
pdg_to_pdt_list([N/A|NAs],PDG,[PDT|PDTs],RNAs,Vin,Vout) :-  
  pdg_to_pdt(N/A,PDG,PDT,RNAs,Vin,Vout1),
  pdg_to_pdt_list(NAs,PDG,PDTs,RNAs,Vout1,Vout).
  
visited_predicate(N/A,V) :- 
  my_member_chk(N/A,V).
  
recursive_predicate(N/A,RNAs) :- 
  my_member_chk(N/A,RNAs).
  
  
% PDG = ([a/1,b/2],[a/1+b/2])  -> []
% PDG = ([a/1,b/2],[a/1+a/1])  -> [a/1]
% PDG = ([a/1,b/2],[a/1+b/2,b/2+a/1])  -> [a/1,b/2]
% PDG = ([a/1,b/2,c/3],[a/1+b/2,b/2+a/1])  -> [a/1,b/2]
% PDG = ([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6])  -> []
% PDG = ([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+d/4])  -> [d/4,f/6]
% PDG = ([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+a/1])  -> [a/1,d/4,f/6]
% Get the recursive predicates in the form [N/A,...] from a PDG
recursive_predicates_from_pdg((NAs,Es),RNAs) :-
  lfp_recursive_predicates_from_pdg(NAs,Es,RNAs).

lfp_recursive_predicates_from_pdg(NAs,Es,RNAs) :-
  recursive_predicates_from_pdg(NAs,Es,NAso,Eso),
  (NAs==NAso ->
    RNAs=NAs
   ;
    lfp_recursive_predicates_from_pdg(NAso,Eso,RNAs)).

recursive_predicates_from_pdg([],Es,[],Es) :-
  !.
% Remove (non-recursive) nodes with no incoming edges  
recursive_predicates_from_pdg([N/A|NAs],Esi,NAso,Eso) :-
  no_incoming_edges(N/A,Esi),
  !,
  remove_edges_from_node(N/A,Esi,Eso1),
  recursive_predicates_from_pdg(NAs,Eso1,NAso,Eso).
recursive_predicates_from_pdg([NA|NAs],Esi,[NA|NAso],Eso) :-
  recursive_predicates_from_pdg(NAs,Esi,NAso,Eso).

no_incoming_edges(N/A,Es) :-
  my_not((my_member_chk(N/A+_,Es)
          ;
          my_member_chk(N/A-_,Es))).
          
remove_edges_from_node(_NA,[],[]) :-
  !.
remove_edges_from_node(N/A,[_NA+N/A|Esi],Eso) :-
  !,
  remove_edges_from_node(N/A,Esi,Eso).
remove_edges_from_node(N/A,[NAt+NAf|Esi],[NAt+NAf|Eso]) :-
  !,
  remove_edges_from_node(N/A,Esi,Eso).
remove_edges_from_node(N/A,[_NA-N/A|Esi],Eso) :-
  !,
  remove_edges_from_node(N/A,Esi,Eso).
remove_edges_from_node(N/A,[NAt-NAf|Esi],[NAt-NAf|Eso]) :-
  !,
  remove_edges_from_node(N/A,Esi,Eso).
         
  
% pdt_to_rdt(PDT,RDT)

% Node N/A is assumed to be a relation
pdt_to_rdt(node(N/A,Children),node(N/A,RChildren)) :-
  pdt_to_rdt_list(Children,RChildren).

pdt_to_rdt_list([],[]).
pdt_to_rdt_list([node(N/A,Children)|Nodes],[node(N/A,RChildren)|RNodes]) :-
  sql_node_type(N/A,_NodeType),
  !,
  pdt_to_rdt_list(Children,RChildren),
  pdt_to_rdt_list(Nodes,RNodes).
pdt_to_rdt_list([node(_NA,Children)|Nodes],ONodes) :-
  pdt_to_rdt_list(Children,RChildren),
  pdt_to_rdt_list(Nodes,RNodes),
  append(RChildren,RNodes,TNodes),
  remove_duplicates(TNodes,ONodes).


% Get the view arity, if exists the view. Otherwise, it fails  
view_arity(ViewName,Arity) :-
  current_db('$des',_),
  !,
  my_view('$des',ViewName,Arity,_,_,_,_,_,_).
view_arity(ViewName,Arity) :-
  my_odbc_get_table_arity(ViewName,Arity).
  
% Get the table arity, if exists the table. Otherwise, it fails  
table_arity(TableName,Arity) :-
  current_db('$des',_),
  !,
  my_table('$des',TableName,Arity).
table_arity(TableName,Arity) :-
  my_odbc_get_table_arity(TableName,Arity).
  
% Translate each original, trusted view name View into $trust_View
translate_trusted_views(SQLst,Schema,TSQLst,TSchema) :- %:: WARNING
  trusting(on),
  !,
  translate_trusted_schema(Schema,ViewName,TSchema),
  translate_trusted_sql_st(SQLst,ViewName,TSQLst).
translate_trusted_views(SQLst,Schema,SQLst,Schema).

% The view name is translated into a trusted version provided 
% there is an existing view with the same name
translate_trusted_schema(Schema,ViewName,TSchema) :-
  Schema=..[ViewName|Args],
%  length(Args,Arity),
  (my_view(_,ViewName,_Arity,_,_,_,_,_,_) ->
    name_trusted(ViewName,TViewName)
   ;
    TViewName=ViewName),
  TSchema=..[TViewName|Args],
  add_to_trusted_list(TViewName).

% Add the trusted view to the list of all the trusted views 
% (they will be eventually droped after trusted debugging)
add_to_trusted_list(TViewName) :-
  retract(trusted_views(TVNs)),
  assertz(trusted_views([TViewName|TVNs])).
  
% Replaces each view name with its trusted version name 
% (currently, preceding the original name by '$trust_')
translate_trusted_sql_st(T,_V,T) :- 
  var(T),
  !.
translate_trusted_sql_st(attr(Rel,Name,Ren),_V,attr(Rel,Name,Ren)) :- 
  var(Rel),
  !.
translate_trusted_sql_st(attr(Rel,Name,Ren),V,attr(TRel,Name,Ren)) :- 
  !,
  translate_trusted_relation(Rel,V,TRel).
translate_trusted_sql_st((Rel,Ren),V,(TRel,Ren)) :- 
  atom(Rel),
  !,
  translate_trusted_relation(Rel,V,TRel).
translate_trusted_sql_st((Rel,Ren),_V,(Rel,Ren)) :- 
  var(Rel),
  !.
translate_trusted_sql_st(T,_V,T) :- 
  (number(T) ; atom(T)),
  !.
translate_trusted_sql_st(C,V,RC) :- 
  C =.. [F|As],
  !, 
  translate_trusted_sql_st_list(As,V,RAs),
  RC =.. [F|RAs].

translate_trusted_sql_st_list([],_V,[]) :-
  !.
translate_trusted_sql_st_list([T|Ts],V,[RT|RTs]) :-
  translate_trusted_sql_st(T,V,RT), 
  translate_trusted_sql_st_list(Ts,V,RTs).
  
% The relation name is translated into a trusted version provided 
% there is an existing view with the same trusted name
translate_trusted_relation(Rel,V,TRel) :-
  Rel==V,
  !,
  name_trusted(Rel,TRel).
translate_trusted_relation(Rel,_V,TRel) :-
  name_trusted(Rel,TRel),
  my_view(_,TRel,_A,_,_,_,_,_,_),
  !.
translate_trusted_relation(Rel,_V,Rel).
  
name_trusted(ViewName,TViewName) :-
  atom_concat('$trust_',ViewName,TViewName).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ancillary Stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conversion

typed_schema_to_untyped_schema(TSchema,USchema) :-
  TSchema=..[F|ColnameTypes],
  coltype_to_col_list(ColnameTypes,Colnames),
  USchema=..[F|Colnames].
  
coltype_to_col_list([],[]).
coltype_to_col_list([Col:_Type|ColTypes],[Col|Cols]) :-
  coltype_to_col_list(ColTypes,Cols).
  
schema_to_colnametypes(Schema,ColTypes) :-
  schema_to_colnametypes(noren,Schema,ColTypes).

schema_ren_to_colnametypes(Schema,ColTypes) :-
  schema_to_colnametypes(ren,Schema,ColTypes).
  
schema_to_colnametypes(Ren,[_Table|Args],ColTypes) :-
  proj_expr_to_coltype_list(Ren,Args,ColTypes),
  !.
schema_to_colnametypes(_Ren,Schema,ColTypes) :-
  Schema=..[_|ColTypes].
  
proj_expr_to_coltype_list(_,[],[]).
proj_expr_to_coltype_list(Ren,[Arg|Args],[ColType|ColTypes]) :-
  proj_expr_to_coltype(Ren,Arg,ColType),
  proj_expr_to_coltype_list(Ren,Args,ColTypes).
  
% Return renamings (for queries)
proj_expr_to_coltype(ren,attr(_,_,ColRen),ColRen:_Type) :-
  !.
proj_expr_to_coltype(_,expr(_,ColRen,_),ColRen:_Type) :-
  !.
% Return view schema (for view creation)
proj_expr_to_coltype(_,attr(_,Col,ColRen),Col:_Type) :-
  atom_concat('$',_,ColRen).
proj_expr_to_coltype(_,attr(_,_Col,ColRen),ColRen:_Type).
%proj_expr_to_coltype(_,expr(_,ColRen,_),ColRen:_Type). % As above

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get_new_predicate_name(+Name,+InputId,-OutputId,-IdName) 
% Returns an identifier of the form: '$<Name><InputId>' and
% also the next Id number .
% e.g., get_new_predicate_name(p,1,2,'$p1')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_new_predicate_name(O,IId,OId,Id) :-
  OId is IId+1,
  atom_concat('$',O,TO),
  atom_codes(TO,STO),
  number_codes(IId,SIId),
  append(STO,SIId,SId),
  atom_codes(Id,SId).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get_new_predicate_name(+Name,-IdName) 
% Returns an identifier of the form: '$<Name><Id>' s.t.
% there is no other such predicate already defined
% e.g., get_new_predicate_name(p,'$p1')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_new_predicate_name(O,Id) :-
  get_pred_id(O,OId),
  build_predicate_name_id(O,OId,PId),
  (O==p, (datalog(P,_,_,_,_,_);datalog(':-'(P,_),_,_,_,_,_)), functor(P,PId,_) ->
   get_new_predicate_name(O,Id)
   ;
   Id=PId
  ).
  
build_predicate_name_id(O,OId,Id) :-
  atom_concat('$',O,TO),
  atom_codes(TO,STO),
  number_codes(OId,SOId),
  append(STO,SOId,SId),
  atom_codes(Id,SId).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% is_empty_relation(+RelationName)) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

is_empty_relation(Relation) :-
  get_relation_arity(Relation,Arity),
  functor(Query,Relation,Arity),
  get_answer(Query,[]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% insert_tuples(+TableName,+Arity,+NbrColumns,+ColNames)) 
% Insert computed tuples (kept in the extension table)
% from a SQL statement into a table
% NbrColumns is the number of columns for which values are 
% expected, as provided
% by the user in an INSERT INTO table(Col1,...,ColN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insert_tuples(TableName,Arity,NbrColumns,Colnames) :-
  length(Args,NbrColumns),
  Witness=..[answer|Args],
  et(Witness,_Ids),
  !,
  bagof((Fact,[]),
        Ids^IVs^Vs^ETFact^BError^(
        (
        length(IVs,NbrColumns),
        ETFact=..[answer|IVs],
        (et(ETFact,Ids)
         ; 
         et(not(ETFact),Ids)
        ),
        build_complete_values(TableName,Arity,Colnames,IVs,Vs,BError),
        Fact=..[TableName|Vs]
        ) 
        ),
        Bag),
  assert_rules(Bag,[simplify,no_safety],_ODLIds,Error),
  (var(Error)
   -> 
   display_nbr_of_tuples(Bag,inserted,Error)
   ;
   display_nbr_of_tuples([],inserted,Error)
  ).
insert_tuples(_TableName,_Arity,_NbrColumns,_Colnames) :-
  write_warning_log(['No tuple met the ''where'' condition for inserting.']).

% Replaces all occurrences of a head matching a given functor in a list of rules by a term
replace_head_list(_O,_N,[],[]).
replace_head_list(O,N,[':-'(H,B)|DLs],[':-'(N,B)|RDLs]) :-
  functor(H,O,_),
  !,
  replace_head_list(O,N,DLs,RDLs).
replace_head_list(O,N,[H|DLs],[N|RDLs]) :-
  H \= ':-'(_,_),
  functor(H,O,_),
  !,
  replace_head_list(O,N,DLs,RDLs).
replace_head_list(O,N,[DL|DLs],[DL|RDLs]) :-
  replace_head_list(O,N,DLs,RDLs).
  
% Replaces all occurrences in a term T of functors starting by O by the same functor but replacing N by O
replace_functor_substring(_O,_N,T,T) :- 
  (number(T) ; var(T)),
  !.
replace_functor_substring(O,N,O,N) :- 
  atom(O),
  !.
replace_functor_substring(O,N,C,RC) :- 
  C =.. [F|As],
  !, 
  (atom_concat(O,R,F) -> atom_concat(N,R,RF) ; RF = F),
  replace_functor_substringL(O,N,As,RAs),
  RC =.. [RF|RAs].

replace_functor_substringL(_O,_N,[],[]) :-
  !.
replace_functor_substringL(O,N,[T|Ts],[RT|RTs]) :-
  !, 
  replace_functor_substring(O,N,T,RT), 
  replace_functor_substringL(O,N,Ts,RTs).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% delete_tuples(+TableName,+Arity)) 
% Delete computed tuples (kept in the extension table)
% from a SQL statement from a table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

delete_tuples(TableName,Arity) :-
  N=answer,
  et(R,_Ids),
  functor(R,N,A),
  !,
  (A==Arity 
   ->
   bagof((Fact,[]),
         F^Ids^(
         (et(Fact,Ids), functor(Fact,N,A)); 
         (et(Fact,Ids), (Fact=not(F)), functor(F,N,A)) 
         ),
         Set),
   replace_functor(N,TableName,Set,RSet),
   retract_rule_list(RSet,Error),
   display_nbr_of_tuples(RSet,deleted,Error)
   ;
   write_error_log(['Incorrect number of values (must be ',Arity,').'])
  ).
delete_tuples(_TableName,_Arity) :-
  write_warning_log(['No tuple met the ''where'' condition for deleting.']).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% update_tuples(+TableName,+Arity)) 
% Update computed tuples kept in the extension table as 
%   answer(OldVal1,...,OldValArity,
%          Colname1,NewValI1,...,ColnameN,ValIM) 
%   : I1,...,IM in {1..Arity}
% from a SQL statement in a table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

update_tuples(TableName,Arity) :-
  bagof(
        ((OldFact,[]),(NewFact,[])),
        Answer^Ids^A^Args^OldValues^Assignments^NewValues^
         (
          (et(Answer,Ids) ; (et(A,Ids), A=not(Answer))),
          Answer=..[answer|Args],
          split_list(Arity,Args,OldValues,Assignments),
          build_new_values(TableName,Assignments,OldValues,NewValues),
          OldFact=..[TableName|OldValues],
          NewFact=..[TableName|NewValues]
         ),
        Bag
       ),
  bagof(DelTuple,NewTuple^my_member((DelTuple,NewTuple),Bag),DelTuples),
  bagof(InsTuple,OldTuple^my_member((OldTuple,InsTuple),Bag),InsTuples),
  retract_rule_list(DelTuples,Error),
  (var(Error) -> 
    assert_rules(InsTuples,[simplify,no_safety],_ODLIds,Error),
    (var(Error) -> 
      display_nbr_of_tuples(InsTuples,updated,Error)
     ;
      write_error_log(['Inserting modified tuples.']))
   ;
    write_error_log(['When deleting tuples during updating.'])).
update_tuples(_TableName,_Arity) :-
  write_warning_log(['No tuple met the ''where'' condition for updating.']).
  
build_new_values(TableName,Assignments,OldValues,NewValues) :-
  split_list_odd_even(Assignments,ColumnNames,Values),
  get_att_positions(TableName,ColumnNames,Positions),
  replace_positions(Positions,Values,OldValues,NewValues).
  
replace_positions(Positions,Values,OldValues,NewValues) :-
  my_zipWith(',',Positions,Values,PosVals),
  my_quicksort(PosVals,OPosVals),
  my_unzip(OPosVals,OPositions,OValues),
  replace_positions(OPositions,OValues,1,OldValues,NewValues).

replace_positions([],[],_Position,Xs,Xs) :-
  !.
replace_positions([Position|Positions],[Value|Values],Position,[_X|Xs],[Value|Ys]) :-
  !,
  NewPosition is Position+1,
  replace_positions(Positions,Values,NewPosition,Xs,Ys).
replace_positions(Positions,Values,Position,[X|Xs],[X|Ys]) :-
  NewPosition is Position+1,
  replace_positions(Positions,Values,NewPosition,Xs,Ys).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tuple_append(+Tuple1,+Tuple2,-Tuple) Appends the two input
%   tuples, returning a concatenated tuple
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tuple_append(('.'), A, A) :- !.
tuple_append(A, ('.'), A) :- !.
tuple_append((A,B), C, (A,D)) :-
  !, 
  tuple_append(B, C, D).
tuple_append(A, B, (A,B)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% append_goals(+Goals1,+Goals2,-Goals) Appends the two input
%   goals, returning a concatenated goal and excluding
%   true goals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

append_goals(true, (A,B), C) :-
  !,
  append_goals(A,B,C).
append_goals((A,B), true, C) :-
  !,
  append_goals(A,B,C).
append_goals(true, true, true) :-
  !.
append_goals(true, A, A) :-
  !.
append_goals(A,true, A) :-
  !.
append_goals((A,B), C, E) :-
  !, 
  append_goals(B, C, D),
  append_goals(A, D, E).
append_goals(A, (B,C), (A,D)) :-
  !,
  append_goals(B, C, D).
append_goals(A, B, (A,B)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display a SQL statement from its syntactic tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%display_sql(SQL) :-
%  display_sql(SQL,0).

display_sql(SQL,I) :-
  (pretty_print(off) -> write_indent(I) ; true),
  write_sql(SQL,I),
  write_log(';'),
  nl_log.

write_sql((SQL,_C),I) :-
  !,
  write_sql(SQL,I).
write_sql(create_view(sql,SQLst,Schema),I) :-
  !,
  pp_indent(I),
  write_string_log("CREATE VIEW "),
  typed_schema_to_untyped_schema(Schema,USchema),
  write_log_list([USchema,' AS']),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(SQLst,I1).
write_sql(with(SQLst,SQLsts),I) :-
  !,
  pp_indent(I),
  write_string_log("WITH "),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql_list(SQLsts,I1),
  pp_nl_or_blank,
  write_sql(SQLst,I).
write_sql(select(DistinctAll,top(N),As,from(Rs),where(Cs),group_by(G),having(H),order_by(OAs,OSs)),I) :-
  !,
  pp_indent(I),
  write_string_log("SELECT "),
  (DistinctAll=distinct -> write_string_log("DISTINCT ") ; write_string_log("ALL ")),
  write_proj_list(As,I),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log("FROM "),
  I1 is I+2,
  write_rel_list(Rs,I1),
  (Cs == true ->
   true
   ;
   pp_nl_or_blank,
   pp_indent(I),
   write_string_log("WHERE "),
   write_sql_cond(Cs,I1)
   ),
  (G==[] ->
   true
   ;
    pp_nl_or_blank,
    pp_indent(I),
    write_string_log("GROUP BY "),
    write_attr_list(G)),
  (H==true ->
   true
   ;
    pp_nl_or_blank,
    pp_indent(I),
    write_string_log("HAVING "),
    write_sql_cond(H,I1)),
  (OAs==[]
   ->
   true
   ;
    pp_nl_or_blank,
    pp_indent(I),
    write_string_log("ORDER BY "),
    write_attr_ord_list(OAs,OSs)),
  (N==all
   ->
   true
   ;
    pp_nl_or_blank,
    pp_indent(I),
    write_string_log("FETCH FIRST "),
    write_log_list([N]),
    write_string_log(" ROWS ONLY")
  ).
write_sql(SetSQL,I) :-
  SetSQL =.. [SetOp,ALL,LSQLst,RSQLst],
  set_operator_name(SetOp,ALL,SetOps),
  !,
  I1 is I+2,
  pp_indent_or_blank(I),
  write_log('('),
  pp_nl_or_blank,
  write_sql(LSQLst,I1),
  pp_nl_or_blank,
  pp_indent(I),
  write_log(')'),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log(SetOps),
  pp_nl_or_blank,
  pp_indent(I),
  write_log('('),
  pp_nl_or_blank,
  write_sql(RSQLst,I1),
  pp_nl_or_blank,
  pp_indent(I),
  write_log(')').

write_sql_list([],_I).
write_sql_list([(SQLst,AS)],I) :-
  pp_indent_or_blank(I),
  write_log_list([AS,' AS']),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql((SQLst,AS),I1).
write_sql_list([(SQLst,AS),SQLst2|SQLsts],I) :-
  write_sql_list([(SQLst,AS)],I),
  write_log(','),
  pp_nl_or_blank,
  write_sql_list([SQLst2|SQLsts],I).
  
pp_indent(I) :-
  (pretty_print(on) -> write_indent(I) ; true).

pp_indent_or_blank(I) :-
  (pretty_print(on) -> write_indent(I) ; write_log(' ')).

pp_nl_or_blank :-
  (pretty_print(on)
    -> 
     nl_log
    ;
     write_log(' ')
  ).

pp_blank :-
  (pretty_print(on)
    -> 
     write_log(' ')
    ;
     true
  ).

pp_nl :-
  (pretty_print(on) -> 
     nl_log
     ;
     true
  ).

% verbose(on) shows table names from autorenaming

write_proj_list(*,_I) :-
  write_log(*).
write_proj_list([],_I).
write_proj_list([expr(E,AS,_Type)],I) :-
  !,
  write_expr(E,I),
  (nonvar(AS) -> 
    (atom_concat('$',_,AS), verbose(off) -> 
     true 
     ;
     write_log(' AS '),
     write_log(AS)
    )
  ;
   true
  ).
write_proj_list([attr(T,A,R)],_I) :-
  !,
  write_attr(attr(T,A,R)).
write_proj_list([cte(Cte,_Type)],_I) :-
  write_log(Cte).
write_proj_list([(T,(*))],_I) :-
  !,
  write_log_list([T,'.',*]).
write_proj_list([A],_I) :-
  write_log(A).
write_proj_list([A1,A2|As],I) :-
  write_proj_list([A1],I),
  write_log(','),
  pp_blank,
  write_proj_list([A2|As],I).

write_attr_ord_list([],[]).  
write_attr_ord_list([A],[O]) :-
  write_attr(A),
  to_uppercase(O,UO),
  write_log_list([' ',UO]).
write_attr_ord_list([A1,A2|As],[O1,O2|Os]) :-
  write_attr_ord_list([A1],[O1]),
  write_log(', '),
  write_attr_ord_list([A2|As],[O2|Os]).
    
write_attr_list([]).  
write_attr_list([A]) :-
  write_attr(A).  
write_attr_list([A1,A2|As]) :-
  write_attr(A1),
  write_log(', '),
  write_attr_list([A2|As]).
    
write_attr(attr(T,A,_R)) :-
  var(T),
  !,
  write_log(A).
write_attr(attr(T,A,_R)) :-
  (atom_concat('$',_,T), verbose(off) -> 
   true 
   ;
   write_log(T),
   write_log('.')),
  write_log(A).

write_expr(cte('$NULL'(ID),_Type),_I) :-
  !,
  ((development(on) ; var(ID)) -> 
   write_log('$NULL'(ID)) 
   ;
   write_log(null)).
write_expr(cte(N,number(_N)),_I) :-
  !,
  write_log(N).
write_expr(cte(S,string(_S)),_I) :-
  !,
  write_log_list(['''',S,'''']).
write_expr(attr(Rel,A,AS),_I) :- 
  !,
  write_attr(attr(Rel,A,AS)).
write_expr(E,I) :- 
  E =.. [Op,Arg],
  unary_operator(Op,_POp,_D),
  !,
  write_log_list([Op,'(']),
  write_expr(Arg,I),
  write_log(')').
write_expr(E,I) :- 
  is_DQL(E),
  !,
  write_log('('),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(E,I1),
  write_log(' )').
write_expr(E,I) :- 
  E =.. [Op,Arg1,Arg2],
  my_infix_arithmetic(Op,POp,_T,_D,_P),
  POp\==low,
  !,
  write_infix_arg_expr(Arg1,I),
  write_log_list([' ',Op,' ']),
  write_infix_arg_expr(Arg2,I).
write_expr(E,I) :- 
  E =.. [Op,Arg1,Arg2],
  my_infix_arithmetic(Op,_POp,_T,_D,_P),
  !,
  write_expr(Arg1,I),
  write_log_list([' ',Op,' ']),
  write_expr(Arg2,I).
write_expr(E,I) :- 
  E =.. [F,Arg],
  my_sql_distinct_aggregate_function(F),
  !, 
  atom_concat(NF,'_distinct',F),
  write_log_list([NF,'(DISTINCT ']),
  write_expr(Arg,I),
  write_log(')').
write_expr(E,I) :- 
  E =.. [F,Arg1|Args],
  !, 
  write_log_list([F,'(']),
  write_expr_list([Arg1|Args],I),
  write_log(')').
write_expr(E,_I) :- 
  write_log(E).

write_expr_list([E],I) :-
  write_expr(E,I).
write_expr_list([E1,E2|Es],I) :-
  !, 
  write_expr(E1,I),
  write_log(','), 
  write_expr_list([E2|Es],I).

write_infix_arg_expr(T,I) :-
  nonvar(T),
  functor(T,F,2),
  my_priority_operator(low,_SF,F),
  !,
  write_log('('), 
  write_expr(T,I),
  write_log(')').
write_infix_arg_expr(T,I) :-
  write_expr(T,I).

write_sql_arg_list([attr(T,A,_R)],I) :-
  !,
  (nonvar(T) ->
    (atom_concat('$',_,T), verbose(off) -> 
     true 
     ;
     write_log(T),
     write_log('.')
    )
  ;
   true
  ),
  write_sql_arg(A,I).
write_sql_arg_list([A],I) :-
  write_sql_arg(A,I).
write_sql_arg_list([A1,A2|As],I) :-
  write_sql_arg_list([A1],I),
  write_log(', '),
  write_sql_arg_list([A2|As],I).

write_sql_arg(cte(N,number(_T)),_I) :-
  !,
  write_log(N).
write_sql_arg(cte(S,string(_S)),_I) :-
%   atomic(A), 
%   sql_cte(A),
  !,
  write_log_list(['\'',S,'\'']).
write_sql_arg((SQLst,RR),I) :-
  !,
  pp_nl,
  pp_indent(I),
  write_log('('),
  pp_nl,
  I1 is I+2,
  write_sql((SQLst,RR),I1),
  write_log(')').
write_sql_arg(A,_I) :-
  write_log(A).

% sql_cte(C) :-
%   my_not(sql_object(C)).

% sql_object(C) :-
%   my_attribute('$des',_P,_T,C,_Type),
%   !.
% sql_object(C) :-
%   my_table('$des',C,_A).

write_rel_list([],_I).
write_rel_list([R],I) :-
  write_pren_rel(R,I).
write_rel_list([R1,R2|Rs],I) :-
  write_pren_rel(R1,I),
  write_log(', '),
  write_rel_list([R2|Rs],I).
  
write_pren_rel((R,[RR|_RArgs]),I) :-
  !,
  write_rel(R,I),
  (nonvar(RR) ->
    (atom_concat('$',_,RR), verbose(off) -> 
     true
     ;
     write_log(' AS '),
     write_log(RR)
    )
  ;
   true
  ).
write_pren_rel(R,_I) :-
  write_log(R).

write_par_rel(I,_I1,(TableOrView,AS)) :-
  my_table('$des',TableOrView,_Arity),
  !,
  write_pren_rel((TableOrView,AS),I).
write_par_rel(_I,I1,(R,AS)) :-
  R=..[J,_,_,_],
  join_name(J,_),
  !,
  write_rel((R,AS),I1).
write_par_rel(_I,I1,R) :-
  pp_nl,
  pp_indent(I1),
  write_log('('),
  write_rel(R,I1),
  pp_nl,
  pp_indent(I1),
  write_log(')').
  
write_rel((SQL,_C),I) :-
  !,
  write_rel(SQL,I).
write_rel(TableOrView,I) :-
  my_table('$des',TableOrView,_Arity),
  !,
  pp_nl,
  pp_indent(I),
  write_log(TableOrView).
write_rel(JoinRel,I) :-
  JoinRel=..[J,LR,RR,equijoin(natural)],
  join_name(J,JN),
  !,
  I1 is I+2,
  write_log('('),
  write_par_rel(I,I1,LR),
  pp_nl_or_blank,
  pp_indent(I),
  write_log('NATURAL '),
  write_string_log(JN),
  write_log(' '),
  write_par_rel(I,I1,RR),
  pp_nl,
  pp_indent(I),
  write_log(')').
write_rel(JoinRel,I) :-
  JoinRel=..[J,LR,RR,equijoin(Attrs)],
  join_name(J,JN),
  !,
  I1 is I+2,
  write_log('('),
  write_par_rel(I,I1,LR),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log(JN),
  write_log(' '),
  write_par_rel(I,I1,RR),
  pp_nl_or_blank,
  pp_indent(I),
  write_log('USING ('),
  write_attr_list(Attrs),
  write_log(')'),
  pp_nl,
  pp_indent(I),
  write_log(')').
write_rel(JoinRel,I) :-
  JoinRel=..[J,LR,RR,C],
  join_name(J,JN),
  !,
  I1 is I+2,
  pp_nl,
  pp_indent(I),
  write_log('('),
  write_par_rel(I,I1,LR),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log(JN),
  write_log(' '),
  write_par_rel(I,I1,RR),
  (C==true ->
    true
   ;
    pp_nl_or_blank,
    pp_indent(I),
    write_log('ON '),
    write_sql_cond(C,I)),
  pp_nl,
  pp_indent(I),
  write_log(')').
write_rel(SQL,I) :-
%  I1 is I+2,
  pp_nl,
  write_sql(SQL,I),
  !.
write_rel(Rel,_I) :-
  write_log(Rel).

join_name(inner_join,"INNER JOIN").
join_name(left_join,"LEFT JOIN").
join_name(right_join,"RIGHT JOIN").
join_name(full_join,"FULL JOIN").

set_operator_name(union,distinct,"UNION").
set_operator_name(union,all,"UNION ALL").
set_operator_name(except,_,"EXCEPT").
set_operator_name(intersect,_,"INTERSECT").

write_sql_cond(and(C1,C2),I) :-
  write_log('('),
  write_sql_cond(C1,I),
  write_log(' AND '),
  write_sql_cond(C2,I),
  write_log(')').
write_sql_cond(or(C1,C2),I) :-
  write_log('('),
  write_sql_cond(C1,I),
  write_log(' OR '),
  write_sql_cond(C2,I),
  write_log(')').
write_sql_cond(exists((SQL,_C)),I) :-
  write_log('EXISTS ('),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(SQL,I1),
  write_log(' )').
write_sql_cond(in(Args,SQL),I) :-
  write_log('('),
  write_sql_arg_list(Args,I),
  write_log(') IN ('),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(SQL,I1),
  write_log(' )').
write_sql_cond(not_in(Args,SQL),I) :-
  write_log('('),
  write_sql_arg_list(Args,I),
  write_log(') NOT IN ('),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(SQL,I1),
  write_log(' )').
write_sql_cond(not(C),I) :-
  write_log('NOT'),
  write_log('('),
  write_sql_cond(C,I),
  write_log(')').
write_sql_cond(C,I) :-
  C =.. [Op,A1,A2],
  !,
  write_expr(A1,I),
  write_log(' '),
  write_op(Op),
  write_log(' '),
  write_expr(A2,I).
write_sql_cond(is_null(SQL),I) :-
  is_DQL(SQL),
  !,
  write_log('('),
  pp_nl_or_blank,
  I1 is I+2,
  write_sql(SQL,I1),
  write_log(' ) IS NULL').
write_sql_cond(is_null(Expr),I) :-
  !,
  write_expr(Expr,I),
  write_log(' IS NULL').
write_sql_cond(C,_I) :-
  write_log(C).

is_DQL((_SQL,_AS)).
  
write_op(Op) :-
  atom_concat(ROP,'_all',Op),
  !,
  write_log_list([ROP,' ALL']).  
write_op(Op) :-
  atom_concat(ROP,'_any',Op),
  !,
  write_log_list([ROP,' ANY']).
write_op(Op) :-
  write_log(Op).
  
%write_ra_cond(exists((_RA,AS,_SQL)),I) :-
%  !,
%  write_indent(I),
%  write_log('EXISTS ('),
%  write_log(AS),
%  write_log(')').
%write_ra_cond(C,I) :-
%  write_sql_cond(C,I).

write_indent(0) :-
  !.
write_indent(I) :- 
  write_log(' '),
  I1 is I-1,
  write_indent(I1).


%%%%%%%%%%%%%%%  END des_sql.pl  %%%%%%%%%%%%%%%
