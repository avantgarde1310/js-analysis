/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    Relational Algebra Processor                       */
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARSING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extended Relational Algebra Grammar. 
% Builds on [Diet01]  Understanding Relational Database Query Languages, S. W. Dietrich, Prentice Hall, 2001.
% Adds:
% - Theta join
% - Outer joins
% - Distinct
% - Group by
% - Recursion

% Relational Algebra statement:
% RAstmt ::= 
%   SELECT WhereCondition (RArel)        % Selection (sigma)
%   |
%   PROJECT SelectExpressionList (RArel) % Projection (pi)
%   |
%   RENAME Schema (RArel)                % Renaming (rho)
%   |
%   DISTINCT (RArel)                     % Duplicate elimination
%   |
%   RArel PRODUCT RArel                  % Cartesian Product
%   |
%   RArel UNION RArel                    % Set union
%   |
%   RArel DIFFERENCE RArel               % Set difference
%   |
%   RArel INTERSECT RArel                % Set intersection
%   |
%   RArel NJOIN RArel                    % Natural join
%   |
%   RArel ZJOIN WhereCondition RArel     % Zeta join
%   |
%   RArel LJOIN WhereCondition RArel     % Left outer join
%   |
%   RArel RJOIN WhereCondition RArel     % Right outer join 
%   |
%   RArel FJOIN WhereCondition RArel     % Full outer join 
%   |
%   GROUP_BY Atts SelectExpressionList HavingCondition (RArel)
%                                        % Grouping
%   
% RArel ::=
%   RAstmt
%   |
%   Relation
%   
% View definition (assignment statement):
% RAview ::=
%   Schema := [RAstmt | Relation]

% Schema ::=
%   ViewName
%   |
%   ViewName(ColName,...,ColName)

% WhereCondition, SelectExpressionList and HavingCondition are as in SQL grammar

 
% Parsing RA statements
parse_ra_query(RAst) -->
  my_sql_blanks_star, 
  my_RA(RAst),
  my_sql_blanks_star, 
  my_optional(";").

% RA Statement
%   DDL Statement
my_RA(RAst) -->
  my_RA_DDL(RAst).
%   DQL Statement
my_RA(RAst) -->
  my_RA_DQL(RAst).

% RA DDL Statement
my_RA_DDL(assign(select(true,Relation),Schema)) -->
  my_create_view_schema(Schema),
  my_sql_blanks_star, 
  ":=",
  my_sql_blanks_star, 
  my_RA_relation(Relation).
my_RA_DDL(assign(RAst,Schema)) -->
  my_create_view_schema(Schema),
  my_sql_blanks_star, 
  ":=",
  my_sql_blanks_star, 
  my_RA_DQL(RAst).

% RA DQL Statement
% infix operator
%   RArel op RArel 
%   op ::= product | union | difference | intersect | njoin 
my_RA_DQL(E) -->
  my_term_RA_DQL(T),
  my_RA_DQL_r(T,E).
  
my_RA_DQL_r(E0,E) --> 
  my_once_sql_blanks_star, 
  {my_infix_ra_operator(OP,SOP,low)},
  my_kw(SOP),
  my_possible_join_condition(OP,E0,T,TOP),
  my_once_sql_blanks_star, 
  my_term_RA_DQL(T),
  my_RA_DQL_r(TOP,E).
my_RA_DQL_r(E,E) -->
  [].

my_term_RA_DQL(E) -->
  my_factor_RA_relation(T),
  my_term_RA_DQL_r(T,E).
  
my_term_RA_DQL_r(E0,E) --> 
  my_once_sql_blanks_star, 
  {my_infix_ra_operator(OP,SOP,medium)},
  my_kw(SOP),
  my_possible_join_condition(OP,E0,T,TOP),
  my_once_sql_blanks_star, 
  my_factor_RA_relation(T),
  my_term_RA_DQL_r(TOP,E).
my_term_RA_DQL_r(E,E) -->
  [].

my_possible_join_condition(OP,E0,T,TOP) -->
  {ra_conditional_join(OP),
   !},
  my_once_sql_blanks,
  my_sql_condition(Cond),
  {TOP =.. [OP,Cond,E0,T]}.
my_possible_join_condition(OP,E0,T,TOP) -->
  [],
  {TOP =.. [OP,E0,T]}.
  
% Parenthesesed RA DQL
my_factor_RA_relation(RA) -->
  my_b_RA_DQL(RA).
%   select Cond RArel
my_factor_RA_relation(select(Cond,RA)) -->
  my_kw("SELECT"),
  my_sql_blanks,
  my_sql_condition(Cond),
  my_sql_blanks_star,
  my_b_RA_DQL(RA).
%   project Exprs RArel
my_factor_RA_relation(project(ProjList,RA)) -->
  my_kw("PROJECT"),
  my_sql_blanks,
  my_projection_list(ProjList),
  my_sql_blanks_star,
  my_b_RA_DQL(RA).
% rename
my_factor_RA_relation(rename(Schema,RA)) -->
  my_kw("RENAME"),
  my_sql_blanks,
  my_complete_untyped_schema(TSchema),
  my_sql_blanks_star,
  my_b_RA_DQL(RA),
  {typed_schema_to_untyped_schema(TSchema,Schema),
   Schema=..[TableName|_],
   check_no_redefinition(TableName)
  }.
% distinct
my_factor_RA_relation(distinct(RA)) -->
  my_kw("DISTINCT"),
  my_sql_blanks_star,
  my_b_RA_DQL(RA).
% group_by
my_factor_RA_relation(group_by(GroupList,ProjList,Cond,RA)) -->
  my_kw("GROUP_BY"),
  my_sql_blanks,
  my_column_list_or_nil(GroupList),
  my_sql_blanks,
  my_projection_list(ProjList),
  my_sql_blanks,
  my_having_condition(Cond),
  my_sql_blanks_star,
  my_b_RA_DQL(RA).
% Relation name (table or view)
my_factor_RA_relation(Relation) -->
  my_RA_relation(Relation).
 
% RA Relation: Table or View  
my_RA_relation(Relation) -->
  my_relname(Relation).
  
% Bracketed RA DQL
my_b_RA_DQL(RA) -->
  "(",
  my_sql_blanks_star,
  my_RA_DQL(RA),
  my_sql_blanks_star,
  ")".
  
my_column_list_or_nil(Cs) -->
  my_column_list(Cs).
my_column_list_or_nil([]) -->
  "[]".
  
ra_conditional_join(zjoin).  
ra_conditional_join(ljoin).  
ra_conditional_join(rjoin).  
ra_conditional_join(fjoin).  

my_infix_ra_operator(product,    "PRODUCT",   medium).
my_infix_ra_operator(union,      "UNION",     low).
my_infix_ra_operator(difference, "DIFFERENCE",low).
my_infix_ra_operator(intersect,  "INTERSECT", low).
my_infix_ra_operator(njoin,      "NJOIN",     low).
my_infix_ra_operator(zjoin,      "ZJOIN",     low).
my_infix_ra_operator(ljoin,      "LJOIN",     low).
my_infix_ra_operator(rjoin,      "RJOIN",     low).
my_infix_ra_operator(fjoin,      "FJOIN",     low).

my_prefix_ra_operator("SELECT").
my_prefix_ra_operator("DISTINCT").
my_prefix_ra_operator("RENAME").
my_prefix_ra_operator("PROJECT").
my_prefix_ra_operator("GROUP_BY").

ra_sql_outer_join(ljoin,left_join).
ra_sql_outer_join(rjoin,right_join).
ra_sql_outer_join(fjoin,full_join).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPILING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

% project
ra_to_sql(
  project(ProjList,Relation)
  ,
  (
   select(all, 
          top(all),
          ProjList,
          from([(SQL,Schema1)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(Relation,(SQL,Schema1)).
% select
ra_to_sql(
  select(Cond,Relation)
  ,
  (
   select(all, 
          top(all),
          *,
          from([(SQL,Schema1)]),
          where(Cond),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(Relation,(SQL,Schema1)).
% product
ra_to_sql(
  product(LRelation,RRelation)
  ,
  (
   select(all, 
          top(all),
          *,
          from([(LSQL,LSchema),(RSQL,RSchema)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(LRelation,(LSQL,LSchema)),
  ra_rel_to_sql(RRelation,(RSQL,RSchema)).
% union 
ra_to_sql(SetExpr,SQL) :-
  SetExpr =.. [SetOp,LRelation,RRelation],
  ra_set_operator(SetOp,SQLSetOp,_),
  !,
  SetSQL =.. 
   [
    SQLSetOp,
    all,
    (select(all, 
          top(all),
          *,
          from([(LSQL,LSchema)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
    _LSchema    
    )
    ,
    (select(all, 
          top(all),
          *,
          from([(RSQL,RSchema)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
    _RSchema    
    )
   ],
  SQL=(SetSQL, _Schema),
  ra_rel_to_sql(LRelation,(LSQL,LSchema)),
  ra_rel_to_sql(RRelation,(RSQL,RSchema)).
% rename
ra_to_sql(
  rename(Schema,Relation)
  ,
  (
   select(all, 
          top(all),
          *,
          from(
           [(SQL,Schema1)]
           ),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   [RelName|ExprList]
  )
  ) :-
  !,
  ra_rel_to_sql(Relation,(SQL,Schema1)),
  Schema =.. [RelName|AttrNames],
  build_proj_list(AttrNames,ExprList).
% njoin
ra_to_sql(
  njoin(LRelation,RRelation)
  ,
  (
   select(all, 
          top(all),
          *,
          from([(inner_join((LSQL,LSchema),(RSQL,RSchema),equijoin(natural)),_)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(LRelation,(LSQL,LSchema)),
  ra_rel_to_sql(RRelation,(RSQL,RSchema)).
% zjoin
ra_to_sql(
  zjoin(Cond,LRelation,RRelation)
  ,
  (
   select(all, 
          top(all),
          *,
          from([(LSQL,LSchema),(RSQL,RSchema)]),
          where(Cond),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(LRelation,(LSQL,LSchema)),
  ra_rel_to_sql(RRelation,(RSQL,RSchema)).
% outer joins: ljoin, rjoin, fjoin
ra_to_sql(
  RAOuterJoinExpr
  ,
  (
   select(all, 
          top(all),
          *,
          from([(SQLOuterJoinExpr,_Schema1)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  RAOuterJoinExpr =.. [RAOuterJoin,Cond,LRelation,RRelation],
  ra_sql_outer_join(RAOuterJoin,SQLOuterJoin),
  !,
  SQLOuterJoinExpr =.. [SQLOuterJoin,(LSQL,LSchema),(RSQL,RSchema),Cond],
  ra_rel_to_sql(LRelation,(LSQL,LSchema)),
  ra_rel_to_sql(RRelation,(RSQL,RSchema)).
% distinct
ra_to_sql(
  distinct(Relation)
  ,
  (
   select(distinct, 
          top(all),
          *,
          from([(SQL,Schema1)]),
          where(true),
          group_by([]),
          having(true),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(Relation,(SQL,Schema1)).
% group_by
ra_to_sql(
  group_by(GroupList,ProjList,Cond,Relation)
  ,
  (
   select(all, 
          top(all),
          ProjList,
          from([(SQL,Schema1)]),
          where(true),
          group_by(GroupList),
          having(Cond),
          order_by([],[])
         ),
   _Schema
  )
  ) :-
  !,
  ra_rel_to_sql(Relation,(SQL,Schema1)).

% A relation as a RA expression. Not part of original RA
% ra_to_sql(
%   (Relation,
%    [RR|RAS])
%   ,
%   (
%    select(all, 
%           top(all),
%           *,
%           from([Relation]),
%           where(true),
%           group_by([]),
%           having(true),
%           order_by([],[])
%          ),
%    [RR|RAS]
%   )
%   ).

  
% build_proj_list([],_RelName,[]).
% %build_proj_list([AttrName|AttrNames],RelName,[expr(attr(RelName,AttrName,_),_,_)|Exprs]) :-
% build_proj_list([AttrName|AttrNames],RelName,[attr(RelName,AttrName,AttrName)|Exprs]) :-
%   build_proj_list(AttrNames,RelName,Exprs).
  
build_proj_list([],[]).
%build_proj_list([AttrName|AttrNames],[expr(attr(_,_,_),AttrName,_)|Exprs]) :-
build_proj_list([AttrName|AttrNames],[attr(_,AttrName,AttrName)|Exprs]) :-
  build_proj_list(AttrNames,Exprs).
  
% Relation untouched
ra_rel_to_sql(RA,(SQL,Schema)) :-
  ra_to_sql(RA,(SQL,Schema)),
  !.
ra_rel_to_sql(Relation,(Relation,Schema)) :-
  relation_autorenaming(Ren),
  Schema = [Ren|_].

% Guess whether a string starts as an RA statement  
my_guessed_ra_statement -->
  my_guessed_ra_ddl_statement.
my_guessed_ra_statement -->
  my_guessed_ra_dql_statement.
  
% Guess whether it is a DDL statement
my_guessed_ra_ddl_statement -->
  my_create_view_schema(_),
  my_sql_blanks_star,
  ":=".
  
% Guess whether it is a DQL statement
my_guessed_ra_dql_statement -->
  {my_prefix_ra_operator(SOP)},
  my_sql_blanks_star,
  my_opening_parenthesis_star,
  my_sql_blanks_star,
  my_kw(SOP),
  my_sql_blanks.
my_guessed_ra_dql_statement -->
  {my_infix_ra_operator(_,SOP,_)},
  find_kw(SOP).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLVING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% rename (create view)
solve_ra_query(assign(RAst,Schema)) :-
  solve_des_sql_query(create_or_replace_view(ra,(RAst,_AS),Schema)).

% query
solve_ra_query(RAst) :-
  ra_to_sql(RAst,(SQLst,Schema)),
  solve_des_sql_query((SQLst,Schema)).

create_or_replace_ra_view(RAst,Schema) :-
  solve_des_sql_query(create_or_replace_view(ra,RAst,Schema)).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DISPLAYING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
display_ra(RA,I) :-
  (pretty_print(off) -> write_indent(I) ; true),
  write_ra(RA,I),
  write_log(';'),
  nl_log.

% select
write_ra(select(Cond,Relation),I) :-
  !,
  pp_indent(I),
  write_string_log("select "),
  I1 is I+2,
  write_sql_cond(Cond,I1),
  pp_nl_or_blank,
  write_ra_bracketed_relation(Relation,I1).
% project 
write_ra(project(AttrList,Relation),I) :-
  !,
  pp_indent(I),
  write_string_log("project "),
  I1 is I+2,
  write_proj_list(AttrList,I1),
  pp_nl_or_blank,
  write_ra_bracketed_relation(Relation,I1).
% rename
write_ra(rename(Schema,Relation),I) :-
  !,
  pp_indent(I),
  write_string_log("rename "),
  write_log_list([Schema]),
  pp_nl_or_blank,
  I1 is I+2,
  write_ra_bracketed_relation(Relation,I1).
% infix operator for relations: set operators (union, difference, intersect), product and njoin
write_ra(Expr,I) :-
  Expr =.. [Op,LRelation,RRelation],
  (ra_set_operator(Op,StrOp)
   ;
   Op==product
   ;
   Op==njoin
  ),
  name(Op,StrOp),
  !,
  write_ra_bracketed_relation(LRelation,I),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log(StrOp),
  pp_nl_or_blank,
  write_ra_bracketed_relation(RRelation,I).
% other joins: njoin and outer joins (ljoin, rjoin, fjoin)
write_ra(Expr,I) :-
  Expr =.. [Op,Cond,LRelation,RRelation],
  (Op==njoin
   ;
   Op==ljoin
   ;
   Op==rjoin
   ;
   Op==fjoin
  ),
  name(Op,StrOp),
  !,
  write_ra_bracketed_relation(LRelation,I),
  pp_nl_or_blank,
  pp_indent(I),
  write_string_log(StrOp),
  I1 is I+2,
  write_sql_cond(Cond,I1),
  pp_nl_or_blank,
  write_ra_bracketed_relation(RRelation,I).
% distinct
write_ra(distinct(Relation),I) :-
  !,
  pp_indent(I),
  write_string_log("distinct"),
  I1 is I+2,
  pp_nl_or_blank,
  write_ra_bracketed_relation(Relation,I1).
% group_by
write_ra(group_by(GroupList,ProjList,Cond,Relation),I) :-
  !,
  pp_indent(I),
  write_string_log("group_by "),
  write_attr_list(GroupList),
  write_log(' '),
  write_proj_list(ProjList,I1),
  write_log(' '),
  write_sql_cond(Cond,I1),
  pp_nl_or_blank,
  I1 is I+2,
  write_ra_bracketed_relation(Relation,I1).

ra_set_operator(Operator) :-
  ra_set_operator(Operator,_).

ra_set_operator(Op,StrOp) :-
  ra_set_operator(Op,_SQLOp,StrOp).

ra_set_operator(union,union,"union").
ra_set_operator(difference,except,"difference").
ra_set_operator(intersect,intersect,"intersect").
  
write_ra_bracketed_relation(Relation,I) :-
  atom(Relation),
  pp_indent(I),
  write_string_log("("),
  write_log(Relation),
  write_string_log(")").
write_ra_bracketed_relation(Relation,I) :-
  pp_indent(I),
  write_string_log("("),
  pp_nl,
  I1 is I+2,
  write_ra_rel(Relation,I1),
  pp_indent(I),
  pp_nl,
  pp_indent(I),
  write_string_log(")").

write_ra_rel(RA,I) :-
  write_ra(RA,I),
  !.
write_ra_rel(RA,I) :-
  pp_indent(I),
  write_log_list([RA]).

  
% DES-SQL> create table f(a int, b int)             
% DES-SQL> /assert f(1,2)
% DES-SQL> /assert f(2,3)
% DES-SQL> /ra
% DES-RA> v(a,b):=(project v.a,f.b (select v.b=f.a ((v) product (f)))) union (select true (f))
% Info: RA expression compiled to:
% v(A,B) :-
%   v(A,C),
%   f(C,B).
% v(A,B) :-
%   f(A,B).
% DES-RA> select true (v)                                                                     
% Info: SQL statement compiled to:            
% answer(A,B) :-
%   v(A,B).
% answer(v.a:number(integer),v.b:number(integer)) ->
% {
%   answer(1,2),
%   answer(1,3),
%   answer(2,3)
% }
% Info: 3 tuples computed.          

  