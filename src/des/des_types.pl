/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    Type Subsystem                                     */
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

%
% This file contains:
% - A description of types as documentation
% - Type checking system
% - Type inferencing system

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENTATION
%
% We distinguish 3 signatures for types:
% - DLType: Internal representations for types
% - DatalogType: User-provided type names for predicates
% - SQLType: A subset of SQL standard type names
%
% DLType is the internal representation for 
%  Datalog and SQL user types
%
% DLType ::= 
%           string(varchar)
%           | 
%           string(varchar(N))
%           | 
%           string(char(N)) 
%           | 
%           number(integer)
%           | 
%           number(float) 
%          
% Notes:
% - N is an integer number denoting the maximun length a string can take
% - string(varchar(N)) and string(char(N)) are considered equivalent
% - string(varchar) represents strings with unbounded length (maximum length is the minimum the maximum length of atoms supported by the underlying Prolog system)
%
% Currently, allowed Datalog types are:
%
% DatalogType ::=
%   string
%   |
%   varchar
%   |
%   varchar(N)
%   |
%   char(N)
%   |
%   char
%   |
%   int
%   |
%   integer
%   |
%   float
%   |
%   real
%
% Notes:
% - string and varchar are considered equivalent 
% - char is equivalent to char(1)
% - int and integer are considered equivalent 
% - float and real are considered equivalent
%
% Currently, allowed SQL types (see also SQL grammar at des_sql.pl) are:
% SQLType ::=
%   STRING      % As VARCHAR
%   |
%   VARCHAR     % Variable-length string of up to the maximum length of the underlying Prolog atom
%   |
%   VARCHAR(n)  % Variable-length string of up to n characters
%   |
%   VARCHAR2(n) % Oracle's variable-length string of up to n characters
%   |
%   CHAR(n)     % Fixed-length string of n characters
%   |
%   CHAR        % Fixed-length string of 1 character
%   |
%   INT         % Integer number
%   |
%   INTEGER     % Equivalent to the former
%   |
%   REAL        % Real number
% 
% The following table shows corresponding types,
% where each cell contain type aliases:
%
%  Internal Rep.      |  Datalog        SQL
%  ---------------------------------------------------------
%  string(varchar)    |  string      |  STRING
%                     |  varchar     |  VARCHAR
%  ---------------------------------------------------------
%  string(varchar(N)) |  varchar(N)  |  VARCHAR(n)
%  string(char(N))    |  char(N)     |  VARCHAR2(n)
%                     |              |  CHAR(n)
%  ---------------------------------------------------------
%  char(1)            |  char        |  CHAR
%  ---------------------------------------------------------
%  number(integer)    |  int         |  INT
%                     |  integer     |  INTEGER
%  ---------------------------------------------------------
%  number(float)      |  float       |  REAL
%                     |  real        |
%  ---------------------------------------------------------
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type_equivalence(string(varchar),string,string).
type_equivalence(string(varchar),string,varchar).
type_equivalence(string(varchar),varchar,string).
type_equivalence(string(varchar),varchar,varchar).
type_equivalence(IRvarcharN,DLvarcharN,SQLvarcharN) :-
  ir_type_varcharN(IRvarcharN),
  dl_type_varcharN(DLvarcharN),
  sql_type_varcharN(SQLvarcharN).
type_equivalence(char(1),char,char).
type_equivalence(number(integer),int,int).
type_equivalence(number(integer),int,integer).
type_equivalence(number(integer),integer,int).
type_equivalence(number(integer),integer,integer).
type_equivalence(number(float),float,real).
type_equivalence(number(float),real,real).

ir_type_varcharN(string(varchar(_N))).
ir_type_varcharN(string(char(_N))).

dl_type_varcharN(varchar(_N)).
dl_type_varcharN(char(_N)).

sql_type_varcharN(varchar(_N)).
sql_type_varcharN(varchar2(_N)).
sql_type_varcharN(char(_N)).

% Internal representation of types. Type synonyms
ir_type_synonym(string(varchar(N)),string(char(N))).
ir_type_synonym(string(char(N)),string(varchar(N))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TYPE CHECKING
%

% check_pred_types(+Pred,+DeclaredTypes)
% Checks whether the rules of the given predicate
% match the given types.
% New types can be inferred along the way and 
% could be asserted (TODO).
check_pred_types(_Tablename/0,[]) :-
  !.
check_pred_types(Tablename/Arity,DeclaredTypes) :-
  infer_dl_types(Tablename/Arity,InferredTypes,_ExtraTypes),
  (type_subsumed_list(InferredTypes,DeclaredTypes) ->
    true
    %assert_extra_types(Tablename,ExtraTypes)
   ;
    write_error_log(['Type mismatch ',InferredTypes,' (inferred types)']),
    !,
    fail
  ).
check_pred_types(Tablename/Arity,_DeclaredTypes) :-
  write_error_log(['No type tuple covers all the loaded rules for ',Tablename/Arity,':',nl]),
  list_rules(Tablename,Arity,7),
  write_tapi_eot,
  !,
  fail.


% check_rule_types(+Rule)
% Checks whether the types of a defining Rule for a predicate P
% is subsumed by declared types for P
% Types for P are assumed to be declared
% Fails if types are not subsumed
% If succeeds, it is possible to infer new types, which could
% added to the metadata schema (TODO)

% Propositional rules
check_rule_types(Rule) :-
  get_rule_table_name_arity(Rule,_Tablename,0).
% Relational rules
check_rule_types(Rule) :-
  get_rule_table_name_arity(Rule,Tablename,_Arity),
  get_table_types(Tablename,DeclaredTypes),
  infer_rule_types(Rule,InferredTypes,_,_ExtraTypes),
  type_subsumed_list(InferredTypes,DeclaredTypes).
  % assert_extra_types(Tablename,ExtraTypes).

% assert_extra_types(+Tablename,+ExtraTypes)
% Tested and OK
% Assert the types ExtraTypes inferred in addition to a
% user-given type declaration for Tablename
% Inferred types for Tablename are not asserted
assert_extra_types(Tablename,ExtraTypes) :-
  my_remove(my_types('$des',Tablename,_ColnameTypes),ExtraTypes,RExtraTypes),
  assert_type_list(RExtraTypes),
  (RExtraTypes==[] ->
    true
   ;
    ctr_type_to_schema_list(RExtraTypes,Schemas),
    write_log_list(['Info: Types inferred and asserted: ',Schemas,nl])).

ctr_type_to_schema_list([],[]).
ctr_type_to_schema_list([Type|Types],[Schema|Schemas]) :-
  ctr_type_to_schema(Type,Schema),
  ctr_type_to_schema_list(Types,Schemas).
  
ctr_type_to_schema(my_types('$des',Tablename,ColnameTypes),Schema) :-
  Schema=..[Tablename|ColnameTypes].
  
assert_type_list([]).
assert_type_list([my_types('$des',Tablename,ColnameTypes)|Types]) :-
  % Exists already
  length(ColnameTypes,Arity),
  my_table('$des',Tablename,Arity),
  !,
  assert_type_list(Types).
assert_type_list([my_types('$des',Tablename,ColnameTypes)|Types]) :-
  assert_table_schema(Tablename,ColnameTypes),
  assert_type_list(Types).

%type_subsumed_list(+ConcreteTypes,+GeneralTypes)
% Succeed if each element of the list ConcreteTypes is 
% a type subsumed by the corresponding element in GeneralTypes
type_subsumed_list([],[]).
type_subsumed_list([CT|CTs],[GT|GTs]) :-
  type_subsumed(CT,GT),
  type_subsumed_list(CTs,GTs).

% type_subsumed(+ConcreteType,+GeneralType)
% Succeed if ConcreteType is a type subsumed by GeneralType
% ConcreteType can be nonground for string types
% Constraints over length of string types can be pending
type_subsumed(string(CT),string(GT)) :-
  !,
  type_subsumed(CT,GT).
type_subsumed(T,varchar) :-
  !,
  (var(T)
  ;
   \+ T=number(_)).
type_subsumed(varchar(N),varchar(M)) :-
  !,
  N#=<M.
type_subsumed(char(N),varchar(M)) :-
  !,
  N#=<M.
type_subsumed(varchar(N),char(M)) :-
  !,
  N#=<M.
type_subsumed(char(N),char(M)) :-
  !,
  N#=<M.
type_subsumed(number(T),number(T)) :-
  !.
  
% check_rule_types_list(Tablename,Rules,DeclaredTypes)
% Checks whether the user-declared types for a predicate Tablename/Arity
% are consistent with the given rules (already loaded in the database)
% for such predicate.
% Fails if types are not subsumed
% If succeeds, it is possible to infer new types, which could be
% added to the metadata schema (TODO)
check_rule_types_list(_Tablename,[],_DeclaredTypes) :-
  !.
check_rule_types_list(_Tablename,Rules,DeclaredTypes) :-
  infer_types_list(Rules,InferredTypes,_TypedArgs,[],_ExtraTypes),
  (type_subsumed_list(InferredTypes,DeclaredTypes) ->
    %assert_extra_types(Tablename,ExtraTypes)
    true
   ;
    write_error_log(['Type mismatch ',InferredTypes,' (inferred types)']),
    !,
    fail
  ).
check_rule_types_list(Tablename,_Rules,DeclaredTypes) :-
  write_error_log(['No type tuple covers all the loaded rules for ',Tablename,':',nl]),
  length(DeclaredTypes,Arity),
  list_rules(Tablename,Arity,7),
  write_tapi_eot,
  !,
  fail.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TYPE INFERENCE
% 
% Infer Datalog types as internal representations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% infer_rule_types(+Rule,-Types,-ColnameTypes,-ExtraTypes)
% Infer types (Types) for a given rule (Rule)
% Also returns a complete schema (ColnameTypes) as a list of colname:type
% Also returns extra inferred types in a list of my_types('$des',Pred,ColnameTypes)
infer_rule_types(Rule,Types,ColnameTypes,ExtraTypes) :-
  infer_types_list([Rule],Types,ColnameTypes,ExtraTypes).  
  
infer_types_list(Rules,Types,ColnameTypes,ExtraTypes) :-
  infer_types_list(Rules,Types,ColnameTypes,[],ExtraTypes).
  
infer_types_list(Rs,InferredTypes,TypedArgs,Tis,ExtraTypes) :-
  copy_term(Rs,CRs),
  annotate_types_term_list(CRs,TCRs,Tis,ExtraTypes),
  CRs=[CR|_],
  get_rule_table_name_arity(CR,Tablename,Arity),
%   Rs=[R|_],
%   annotate_types_term_list(Rs,TCRs,Tis,ExtraTypes),
%   get_rule_table_name_arity(R,Tablename,Arity),
  my_nf_bagof(Types,
             Body^Pattern^
             (functor(Pattern,Tablename,Arity),
              (my_member(':-'(Pattern,Body),TCRs)
               ;
               my_member(Pattern,TCRs)),
              Pattern=..[Tablename|Types]),
             TypesList),
  most_concrete_types_list(TypesList,InferredTypes),
%   get_internal_type_list(InferredTypes,UInferredTypes),
%   get_internal_my_type_list(ExtraTypes,UExtraTypes),
  type_to_coltype_list(InferredTypes,TypedArgs).
 
  
%most_concrete_types_list([],[]).
most_concrete_types_list([Types],Types).
most_concrete_types_list([Types1,Types2|TypesLists],CTypes) :-
  most_concrete_type_list(Types1,Types2,Types3),
  most_concrete_types_list([Types3|TypesLists],CTypes).

most_concrete_type_list([],[],[]).
most_concrete_type_list([Type1|Types1],[Type2|Types2],[CType|CTypes]) :-
  most_concrete_type(Type1,Type2,CType),
  most_concrete_type_list(Types1,Types2,CTypes).

type_to_coltype_list([],[]).
type_to_coltype_list([Type|Types],[_C:Type|TypedArgs]) :-
  type_to_coltype_list(Types,TypedArgs).
  
  
annotate_types_term_list(Rs,TRs,Tis,ExtraTypes) :-
  annotate_types_term_list_aux(Rs,TRs,Tis,ETs1), 
%  my_remove_non_ground(ETs1,ETs2),
  my_remove_duplicates_sort(ETs1,ExtraTypes).
  
annotate_types_term_list_aux([],[],ETs,ETs).
annotate_types_term_list_aux([T|Ts],[TT|TTs],ETis,ETos) :-
  annotate_types_term(T,TT,ETis,ETs), 
  annotate_types_term_list_aux(Ts,TTs,ETs,ETos).

% annotate_types_term(+T,-AT,+NewTypes,-ExtraTypes)
% Annotate term T with types either inferred or declared
% New inferred types (ExtraTypes) are added to NewTypes
% This predicate may fail if no type covers a given argument
% as, e.g., no built-in type covers the rules: p(1) and p(a)

% A variable, no info, no extra inferred types
annotate_types_term(T,T,Ts,Ts) :- 
  var(T),
  !.
% A rule. ::WARNING: For avoiding name clashes between strings and identifiers, 
% this should be specialized to detect where identifiers can occur
annotate_types_term(':-'(H,B),':-'(RH,RB),Tis,Tos) :-
  !,
  annotate_types_term(H,RH,Tis,Ts),
  annotate_types_term(B,RB,Ts,Tos).
% An already typed variable
annotate_types_term(T,T,Ts,Ts) :-
  nonvar(T), 
  is_type(T),
  !.
% Lists:
annotate_types_term(L,Ts,Tis,Tos) :- 
  my_is_list(L),
  !,
  annotate_types_term_list(L,Ts,Tis,Tos).
% NULL
annotate_types_term('$NULL'(_ID),_T,Ts,Ts) :- 
  !.
% Numbers:
annotate_types_term(T,number(integer),Ts,Ts) :- 
  integer(T),
  !.
annotate_types_term(T,number(float),Ts,Ts) :- 
  float(T),
  !.
% Already declared propositional relation
annotate_types_term(T,T,Ts,Ts) :- 
  T =.. [Tablename],
  my_table('$des',Tablename,0),
  !.
% Predefined relation identifiers
annotate_types_term(T,T,Ts,Ts) :- 
  T =.. [answer],
  !.
% Atom (string)
annotate_types_term(T,string(varchar(N)),Ts,Ts) :- 
  atom(T),
  !,
  atom_length(T,L),
  N #>= L.
% is/2 infix
annotate_types_term(is(L,R),is(NT,NT),Ts,Ts) :- 
  !,
  NT=number(_T),
  (var(L) -> L=NT; true),
  get_expr_type(L,NT),
  (get_expr_type(R,NT),
   !
   ;
   get_expr_type(R,RT),
   %3.0 my_raise_exception(generic,syntax(['Type mismatch ',NT,' vs. ',RT,'.']),[])
	write_error_log(['Type mismatch ',NT,' vs. ',RT,'.']),
	!,
	fail
  ).
% Infix comparison
annotate_types_term(Comp,TComp,Ts,Ts) :- 
  my_infix_comparison(Op,_),
  Comp=..[Op,L,R],
  !,
  TComp=..[Op,TL,TR],
  (var(L) -> L=TR ; true),
  (var(R) -> R=TL ; true),
  get_expr_type(L,TL),
  (get_expr_type(R,TL),
   TL=TR,
   !
   ;
   get_expr_type(R,TR),
   %3.0 my_raise_exception(generic,syntax(['Type mismatch ',TL,' vs. ',TR,'.']),[])
	write_error_log(['Type mismatch ',TL,' vs. ',TR,'.']),
	!,
	fail
  ).
% User-declared typed relation
annotate_types_term(C,RC,Ts,Ts) :- 
  C =.. [Tablename|As],
  length(As,Arity),
  my_table('$des',Tablename,Arity),
  !, 
  annotate_types_arg_list(Tablename,1,As,TAs),
  RC =.. [Tablename|TAs].
% Aggregate relations:
annotate_types_term(C,RC,Tis,Tos) :- 
  C =.. [F|As],
  length(As,Arity),
  A is Arity-1, % Listed arities does not include the hidden group_by argument 
  my_builtin_relation(F,A,_M,aggregate),
  !, 
  annotate_types_aggregate_relation(C,RC,Tis,Tos).
% Built-in predicates:
annotate_types_term(C,RC,Tis,Tos) :- 
  C =.. [F|As],
  length(As,A),
  my_builtin_preds(BIPreds),
  my_member(F/A,[(',')/2|BIPreds]),
  !, 
  annotate_types_term_list(As,RAs,Tis,Tos),
  RC =.. [F|RAs].
% User-defined relations: Types already inferred in Tis
annotate_types_term(C,RC,Tis,Tos) :- 
  C =.. [F|As],
  length(As,A),
  length(ColnameTypes,A),
  my_member(my_types('$des',F,ColnameTypes),Tis),
  !,
  annotate_types_term_list(As,RAs,Tis,Tos),
  RC =.. [F|RAs],
  types_colnametypes(RAs,ColnameTypes).
% User-defined relations: Types to be inferred in Tos
annotate_types_term(C,RC,Tis,[my_types('$des',F,ColnameTypes)|Ts]) :- 
  C =.. [F|As],
  annotate_types_term_list(As,RAs,Tis,Ts),
  RC =.. [F|RAs],
  build_default_attr_name_type_list(RAs,ColnameTypes).
    
    
% Annotate types for aggregate relations:
annotate_types_aggregate_relation(count(G,GBVs,O),count(RG,GBVs,O),Tis,Tos) :-
  % Count(*) 
  annotate_types_term(G,RG,Tis,Tos),
  get_aggregate_function_type(count,O).
annotate_types_aggregate_relation(Aggr,RAggr,Tis,Tos) :-
  % Other aggregates include an additional argument: the attribute w.r.t the aggregation is computed
  Aggr=..[AF,G,V,GBVs,O],
  my_aggregate_relation(AF,4),
  annotate_types_term(G,RG,Tis,Tos),
  F=..[AF,V],
  get_aggregate_function_type(F,O),
  RAggr=..[AF,RG,V,GBVs,O].

% is_type(+Term)
is_type(number(integer)) :-
  !.
is_type(number(float)) :-
  !.
is_type(string(varchar)) :-
  !.
is_type(string(varchar(N))) :-
  var(N),
  !.
is_type(string(varchar(N))) :-
  (integer(N), N>0 ->
    true
   ;
%3.0    my_raise_exception(string(varchar(N)),type,[])
   fail
  ).
is_type(string(char(N))) :-
  var(N),
  !.
is_type(string(char(N))) :-
  (integer(N), N>0 ->
    true
   ;
%3.0    my_raise_exception(string(varchar(N)),type,[])
    fail
  ).

is_string_type(string(_)).


annotate_types_arg_list(_Tablename,_I,[],[]).
annotate_types_arg_list(Tablename,I,[A|As],[TA|TAs]) :-
  annotate_types_arg(Tablename,I,A,TA),
%WARNING: This cut could be replaced by an explicit Error variable  
  !,
  I1 is I+1,
  annotate_types_arg_list(Tablename,I1,As,TAs).

% annotate_types_arg(Tablename,I,A,Type) :-
%   my_attribute('$des',I,Tablename,_Colname,Type),
%   (var(A) -> A=Type ; true).
annotate_types_arg(Tablename,I,A,TA) :-
  my_attribute('$des',I,Tablename,Colname,Type),
  (var(A) ->
    A=TA,
    get_internal_type(Type,TA)
   ;
    get_expr_type(A,T),
    (most_concrete_type(T,Type,TA)
     ->
      true
     ;
%3.0      my_raise_exception(generic,syntax(['Type mismatch ',Tablename,'.',Colname,':',Type,' vs. ',T,'.']),[])
      write_error_log(['Type mismatch ',Tablename,'.',Colname,':',Type,' vs. ',T,'.',nl]),
      !,
      fail
    )
  ).

% All the internal representations coincide but non-limited strings
% get_internal_type(UserType,InternalType) :-
%   var(UserType),
%   !,
%   UserType=InternalType.
% get_internal_type(string(varchar),string(varchar(_N))) :-
%   !.
% get_internal_type(string(char),string(varchar(_N))) :-
%   !.
get_internal_type(string(varchar),string(varchar(N))) :-
  var(N),
  !.
get_internal_type(string(char),string(varchar(N))) :-
  var(N),
  !.
get_internal_type(string(varchar),string(char(N))) :-
  var(N),
  !.
get_internal_type(Type,Type).

get_internal_type_list([],[]).
get_internal_type_list([UT|UTs],[IT|ITs]) :-
  get_internal_type(UT,IT),
  get_internal_type_list(UTs,ITs).
    
get_internal_my_type_list([],[]).
get_internal_my_type_list([my_types(DB,P,UCTs)|UTs],[my_types(DB,P,ICTs)|ITs]) :-
  swap_ucnt_icnt(UCTs,ICTs),
  get_internal_my_type_list(UTs,ITs).

swap_ucnt_icnt([],[]).
swap_ucnt_icnt([C:UT|UCTs],[C:IT|ICTs]) :-
  get_internal_type(UT,IT),
  swap_ucnt_icnt(UCTs,ICTs).

swap_uct_ict([],[]).
swap_uct_ict([UT|UTs],[IT|ITs]) :-
  get_internal_type(UT,IT),
  swap_uct_ict(UTs,ITs).

  
% get_expr_type(+Expr,-Type)
% Get the built-in type Type of expression Expr
% Returned type can be either ground if a concrete 
% built-in type is found, or partially ground otherwise
% as, e.g., number(integer) for 1, and 
% string(varchar(_)) for 'a', resp.
get_expr_type(A,_T) :-
  var(A),
  !.
get_expr_type(true,boolean).
get_expr_type(false,boolean).
get_expr_type(C,TC) :- 
  C =.. [F|As],
  length(As,Arity),
  arithmetic_function(F,_,_,aggregate,_,Arity),
  !, 
  get_aggregate_function_type(C,TC).
get_expr_type(C,T) :- 
  C =.. [F|As],
  length(As,Arity),
  arithmetic_function(F,_,_,arithmetic,T,Arity),
  !.
get_expr_type(T,string(char(N))) :- 
  atom(T),
  atom_length(T,L),
  N#>=L.
get_expr_type(T,string(varchar(N))) :- 
  atom(T),
  !,
  atom_length(T,L),
  N#>=L.
% get_expr_type(T,string(varchar)) :- 
%   atom(T),
%   !.
% get_expr_type(T,string(varchar(N))) :- 
%   atom(T),
%   !,
%   atom_length(T,L),
%   N#>=L.
get_expr_type(A,number(integer)) :-
  integer(A),
  !.
get_expr_type(A,number(float)) :-
  float(A),
  !.
get_expr_type('$NULL'(_ID),_T) :-
  !.
% An infix with known type
get_expr_type(C,T) :- 
  C =.. [F,_L,_R],
  my_infix_arithmetic(F,_PO,T,_D,_P),
  my_ground(T),
  !.
% An infix with a type depending on its arguments
get_expr_type(C,T) :- 
  C =.. [F,L,R],
  my_infix_arithmetic(F,_PO,T,_D,_P),
  !,
  get_expr_type(L,TL),
  get_expr_type(R,TR),
  expr_number_type(TL,TR,T).
get_expr_type(C,boolean) :- 
  C =.. [F,_L,_R],
  (my_infix_comparison(F,_)
   ;
   F==(',')
   ;
   F==(';')
  ),
  !.
get_expr_type(A,A) :- % A type already substituted
  !.
  
% Type of an expression involving numbers
expr_number_type(number(integer),number(integer),number(integer)) :-
  !.
expr_number_type(_TL,_TR,number(float)).
  

% Get the type of aggregate functions:
get_aggregate_function_type(count,number(integer)) :-
  !.
get_aggregate_function_type(count(_A),number(integer)) :-
  !.
get_aggregate_function_type(count_distinct(_A),number(integer)) :-
  !.
get_aggregate_function_type(SUM_TIMES,Var) :-
  (SUM_TIMES = sum(Var)   ; SUM_TIMES = sum_distinct(Var) ; 
   SUM_TIMES = times(Var) ; SUM_TIMES = times_distinct(Var)),
  !,
  (Var=number(_) ->
    true
   ;
    fail).
%3.0   my_raise_exception(SUM_TIMES,type,[])).
get_aggregate_function_type(AVG,number(float)) :-
  (AVG = avg(Var) ; AVG = avg_distinct(Var)),
  !,
  (Var=number(_) ->
    true
   ;
    fail).
%3.0   my_raise_exception(AVG,type,[])).
get_aggregate_function_type(A,Var) :-
  A=..[F,Var],
  (F == min ; F == max).

most_concrete_type(T1,T2,T2) :-
  my_var_or_fd_var(T1),
  !,
%  \+ \+ T1#=T2. % Possibly pending constraints
  \+ \+ my_fd_eq(T1,T2). % Possibly pending constraints
most_concrete_type(T1,T2,T1) :-
  my_var_or_fd_var(T2),
  !,
%  \+ \+ T1#=T2. % Possibly pending constraints
  \+ \+ my_fd_eq(T1,T2). % Possibly pending constraints
most_concrete_type(T1,T2,T1) :-
  T1==T2,
  !.
most_concrete_type(number(T1),number(T2),number(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(string(T1),string(T2),string(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(char(T1),char(T2),char(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(char(T1),varchar(T2),varchar(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(char(T),varchar,char(T)) :-
  !.
most_concrete_type(varchar(T1),varchar(T2),varchar(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(varchar(T1),char(T2),varchar(T)) :-
  most_concrete_type(T1,T2,T),
  !.
most_concrete_type(varchar(T),varchar,varchar(T)) :-
  !.
most_concrete_type(varchar,varchar(T),varchar(T)) :-
  !.
most_concrete_type(varchar,char(T),char(T)) :-
  !.
  

% infer_dl_types(+Pred/Arity,-InferredTypes,-ExtraTypes)
% Given a predicate Pred/Arity, infer its types InferredTypes and 
% types of all other predicates on which such predicate depends on.
% Types are stored in the schema database.
% First, find the sub pdg from Atom
% Second, find a topological order
% Finally, infer types in such an order
% If types has been previously declared by the user,
% these definitions are used instead of inferring
% Inferred types can contain string(char(N)) and string(varchar(N)),
% where N is an FD variable constrained by N#>=C, where C is a 
% constant of the longest string found during inferring the type 
% for a given argument

infer_dl_types(Pred/A,PredTypes,ExtraTypes) :-
  pdg(G),
  sub_pdg(Pred/A,G,SG),
  topological_order(SG,Preds),
  (my_member(Pred/A,Preds) -> TPreds=Preds ; TPreds=[Pred/A|Preds]),
  infer_preds_types(TPreds,ExtraTypes),
  my_member(my_types('$des',Pred,ColnameTypes),ExtraTypes),
  types_colnametypes(UnboundTypes,ColnameTypes),
  bind_string_types(UnboundTypes,PredTypes),
  length(PredTypes,A).

% bind_string_types replaces nonground types 
% constrained with FD vars
% Only string(char(N)) and string(varchar(N)) are expected;
% they are replaced by string(varchar)
bind_string_types([],[]).
bind_string_types([T|Ts],[T|BTs]) :-
  var(T),
  !,
  bind_string_types(Ts,BTs).
bind_string_types([T|Ts],[string(varchar(Min))|BTs]) :-
  (T=string(char(N))
   ;
   T=string(varchar(N))
  ),
  my_var_or_fd_var(N),
  !,
  my_fd_min(N,Min),
  bind_string_types(Ts,BTs).
bind_string_types([T|Ts],[T|BTs]) :-
  bind_string_types(Ts,BTs).
  
% types_colnametypes(Types,ColnameTypes) :-
%   findall(Type,my_member(_Colname:Type,ColnameTypes),Types).
  
types_colnametypes([],[]).
types_colnametypes([Type|Types],[_Colname:Type|ColnameTypes]) :-
  !,
  types_colnametypes(Types,ColnameTypes).
types_colnametypes([LType|Types],[_Colname:RType|ColnameTypes]) :-
  ir_type_synonym(LType,RType),
  types_colnametypes(Types,ColnameTypes).
  
% topological_order(+PDG,-Preds)
% Given a pdg, return a list of predicates in
% topological order. 
% Order is based on dependencies:
% First come predicates with no (other-predicate) incoming edges
% Mutually recursive predicates have no defined order among them
topological_order(([],[]),[]) :-
  !.
topological_order(PDG,OPreds) :-
  no_others_incoming_edges_preds(PDG,Preds),
  Preds\==[],
  !,
  remove_preds_from_pdg(Preds,PDG,NPDG),
  topological_order(NPDG,NOPreds),
  append(Preds,NOPreds,OPreds).
topological_order((NAs,_Es),NAs).

% Find those predicates with no (other-predicate) incoming edges
no_others_incoming_edges_preds((NAs,Es),Preds) :-
  findall(NA,
          (my_member(NA,NAs),
           no_others_incoming_edges(NA,Es)
          ),
          Preds).

% Find out whether a predicate has not (other-predicate) incoming edges
no_others_incoming_edges(N/A,Es) :-
  my_not((my_member_chk(N/A+NO/_,Es),
          N\==NO
          ;
          my_member_chk(N/A-NO/_,Es),
          N\==NO)).

% Remove predicates (as well as their edges) from a pdg and return the reduced pdg
remove_preds_from_pdg(Preds,(NAs,Es),(RNAs,REs)) :-
  my_set_diff(NAs,Preds,RNAs),
  remove_edges_from_node_list(RNAs,Es,REs).
  
remove_edges_from_node_list([],Es,Es).
remove_edges_from_node_list([NA|NAs],Es,REs) :-
  remove_edges_from_node(NA,Es,TREs),
  remove_edges_from_node_list(NAs,TREs,REs).
  
  
% Infer types of predicates in the given order
infer_preds_types(Preds,DLTypes) :-
  infer_preds_types(Preds,[],DLTypes).
  
infer_preds_types([],Ts,Ts).
infer_preds_types([Pred|Preds],Tsi,Tso) :-
  infer_pred_types(Pred,Tsi,Ts),
  infer_preds_types(Preds,Ts,Tso).

% infer_pred_types(+Pred/Arity,+TypesIn,+TypesOut)
% Infer predicate types
% If user-declared, then do nothing
infer_pred_types(Tablename/Arity,Ts,Ts) :-
  my_table('$des',Tablename,Arity),
  !.
% If built-in, then do nothing
infer_pred_types(Tablename/Arity,Ts,Ts) :-
  my_builtin_preds(BIPreds),
  my_member(Tablename/Arity,BIPreds),
  !.
% Predicates with user-defined rules
infer_pred_types(Tablename/Arity,Tis,[my_types('$des',Tablename,ColnameTypes)|ExtraTypes]) :-
  get_object_dlrules(namearity,Tablename/Arity,DLs),
  DLs\==[],
  !,
  dlrule_to_rule_list(DLs,Rules),
  infer_types_list(Rules,InferredTypes,_TypedArgs,Tis,ExtraTypes),
  build_default_attr_name_type_list(InferredTypes,ColnameTypes).
% Predicates without user-defined rules
infer_pred_types(Tablename/Arity,Tis,[my_types('$des',Tablename,ColnameTypes)|Tis]) :-
  length(TopTypes,Arity),
  build_default_attr_name_type_list(TopTypes,ColnameTypes).
  
% pop_type_declaration(+Tablename,+Arity,-DeclaredTypes,-DeclaredColnameTypes)
% Retract type declaration for Tablename/Arity, and returns its list of types and its list of colname:types
% If no types are declared already, return a var
pop_type_declaration(Tablename,Arity,DeclaredTypes,DeclaredColnameTypes) :-
  get_table_typed_arguments(Tablename,DeclaredColnameTypes),
  get_table_types(Tablename,DeclaredTypes),
  retract(my_table('$des',Tablename,Arity)),
  retractall(my_attribute('$des',_I,Tablename,_C,_T)),
  !.
pop_type_declaration(_Tablename,_Arity,_DeclaredTypes,_DeclaredColnameTypes).
  
  
% push_type_declaration(+Tablename,+Arity,+ColnameTypes)
% Assert type declaration for Tablename/Arity
% Do nothing if no types are given
push_type_declaration(_Tablename,_Arity,ColnameTypes) :-
  var(ColnameTypes),
  !.
push_type_declaration(Tablename,Arity,ColnameTypes) :-
  assertz(my_table('$des',Tablename,Arity)),
  assert_attr_types(Tablename,ColnameTypes).

%%%%%%%%%%%%%%%  END des_types.pl  %%%%%%%%%%%%%%%
