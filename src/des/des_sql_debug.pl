/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    SQL Debugger                                       */
/*                                                       */
/*                                                       */
/*                              Yolanda Garcia-Ruiz (*)  */
/*                          Rafael Caballero-Roldan (*)  */
/*                             Fernando Saenz-Perez (**) */
/*                                         (c) 2004-2012 */
/*                                   GPD DSIC, DISIA UCM */
/*             Please send comments, questions, etc. to: */
/*                                     fernan@sip.ucm.es */
/*                                Visit the Web site at: */
/*                           http://des.sourceforge.net/ */
/*                                                       */
/* Distributed under the GNU General Public License      */
/* http://www.gnu.org/copyleft/gpl.html                  */
/*********************************************************/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Debugging SQL Views
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

debug_sql(ViewName,Options) :-
  get_debug_sql_options(Options,TrustTables,TrustFile,Order),
  !,
  debug_sql(ViewName,TrustTables,TrustFile,Order).
debug_sql(_ViewName,Options) :-
  write_error_log(['Incorrect arguments: ',Options]).

get_debug_sql_options(Options,trust_tables(TT),trust_file(TF),order(O)) :-  
  get_cmd_options(Options,[trust_tables(TT),trust_file(TF),order(O)],
                          [debug_sql_trust_tables_option_test,debug_sql_trust_file_option_test,debug_sql_order_option_test],
                          [trust_tables(yes),trust_file(no(file)),order(preorder)]).
  
get_cmd_options([],Defaults,_Tests,Defaults).
get_cmd_options([CmdOption|CmdOptions],AllowedOptions,Tests,Defaults) :-
  remove_option(CmdOption,Test,AllowedOptions,NAllowedOptions,Tests,NTests,Defaults,NDefaults),
  !,
  my_apply(Test,[CmdOption]),
  get_cmd_options(CmdOptions,NAllowedOptions,NTests,NDefaults).
get_cmd_options([CmdOption|_CmdOptions],_AllowedOptions,_Tests,_Defaults) :-
  write_error_log(['Incorrect argument: ',CmdOption]).
  
% Removing an option
remove_option(X,T,[X|Xs],Xs,[T|Ts],Ts,[_U|Us],Us).
remove_option(X,T,[Y|Xs],[Y|Ys],[TY|Ts],[TY|Ss],[U|Us],[U|Vs]) :-
  remove_option(X,T,Xs,Ys,Ts,Ss,Us,Vs).

% Tests for debug_sql command options
debug_sql_trust_tables_option_test(trust_tables(O)) :-
  my_member(O,[yes,no]),
  !.
debug_sql_trust_tables_option_test(trust_tables(O)) :-
  write_error_log(['Incorrect trust table option ''',O,'''.']),
  fail.

debug_sql_trust_file_option_test(trust_file(F)) :-
  my_file_exists_with_default_extensions(F,['.sql'],_FP),
  !.
debug_sql_trust_file_option_test(trust_file(_F)) :-
  % write_log_list(['Error: File ''',F,''' does not exist.',nl]),
  fail.

debug_sql_order_option_test(order(O)) :-
  my_member(O,[preorder,'dq']),
  !.
debug_sql_order_option_test(order(O)) :-
  write_error_log(['Incorrect order option ''',O,'''.']),
  fail.

     
debug_sql(ViewName,trust_tables(TrustTablesYN),trust_file(FileName),order(Order)) :-
  set_flag(trusted_views,[]),
  (view_arity(ViewName,Arity) ->
   pdg(PDG),
   sub_pdg(ViewName/Arity,PDG,SubPDG),
   (FileName==no(file) ->
     TrustFileYN=no
    ;
     set_flag(trusting,on),
     (verbose(off) -> (output(Output),set_flag(output,off)) ; true),
     processC(process,[FileName],_NVs,_Continue),
     (verbose(off) -> set_flag(output,Output) ; true),
     set_flag(trusting,off),
     TrustFileYN=yes
   ),
   debug_sql(ViewName/Arity,TrustTablesYN,TrustFileYN,Order,SubPDG),
   drop_trusted_views
  ;
%    write_log_list(['Error: View ''',ViewName,''' does not exist.',nl]),
%    display_view_alternatives(ViewName)
  my_raise_exception(unknown_view(ViewName),syntax(''),[])
  ).
  
% Drop trusted views after trusted debugging. The extension table is cleared if there are such views
drop_trusted_views :-
  trusted_views(VNs),
  drop_viewname_k_list(VNs),
  (VNs\==[] -> 
    processC(clear_et,[],_NVs,_Yes)
   ;
    true
  ).
  
  
debug_sql(ViewName/Arity,TrustTablesYN,TrustFileYN,Order,PDG) :-
  pdg_to_rdt(ViewName/Arity,PDG,RDT),
  debug_sql_pdt_traverse_order(Order,TrustTablesYN,TrustFileYN,RDT,ViewName/Arity,[(ViewName/Arity,no)],_NodeTagListO,BuggyNode,NodeType),
  (var(BuggyNode) ->
    write_log_list(['Warning: Unable to find a buggy node.',nl])
   ;
    (BuggyNode==abort ->
      write_log_list(['Info: Debugging aborted.',nl])
     ;
      BuggyNode=N/A,
      write_log_list(['Info: Buggy ',NodeType,' found: ',N/A,'.',nl])
    )
  ).
  
% debug_sql_pdt_traverse_order(+Ordering,
%                              +TrustTablesYN (yes/no),
%                              +TrustFileYN   (yes/no),
%                              +PDT,
%                              +ParentNode (Name/Arity),
%                              +NodeTagListInput  ([(Name/Arity,Valid)]),
%                              +NodeTagListOutput ([(Name/Arity,Valid)]),
%                              +BuggyNode  (Name/Arity),
%                              +NodeType   (view|table)
%                             )
debug_sql_pdt_traverse_order(preorder,TrustTablesYN,TrustFileYN,node(N/A,[]),Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
  !,
  debug_sql_node(TrustTablesYN,TrustFileYN,N/A,Type,Parent,NodeTagListI,Valid),
  add_node_tag(N/A,Valid,NodeTagListI,NodeTagListO),
  ((Valid==no, debug_object(N/A)) ->
    BuggyNode=N/A,
    NodeType=Type
   ;
    true
  ).
debug_sql_pdt_traverse_order(preorder,TrustTablesYN,TrustFileYN,node(N/A,Children),Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
  debug_sql_node(TrustTablesYN,TrustFileYN,N/A,Type,Parent,NodeTagListI,Valid),
  add_node_tag(N/A,Valid,NodeTagListI,NodeTagList2),
  (Valid==yes ->
    NodeTagListO=NodeTagList2
   ;
    (Valid==abort ->
      BuggyNode=abort
     ;
      % N/A is nonvalid
      debug_sql_pdt_traverse_order_list(preorder,TrustTablesYN,TrustFileYN,Children,N/A,NodeTagList2,NodeTagListO,BuggyNode,NodeType),
      ((var(BuggyNode),debug_object(N/A)) ->
        % If N/A has no buggy children, N/A is the buggy node
        BuggyNode=N/A,
        NodeType=Type
       ;
        true
      )
    )
  ).

  
debug_sql_pdt_traverse_order('dq',_TrustTablesYN,_TrustFileYN,node(N/A,[]),_Parent,NodeTagList,NodeTagList,N/A,NodeType) :-
  !,
  sql_node_type(N/A,NodeType).
debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,PDT,Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
  divide_tree(PDT,LPDT,RPDT),
  RPDT=node(N/A,_Children),
  debug_sql_node(TrustTablesYN,TrustFileYN,N/A,_Type,Parent,NodeTagListI,Valid),
  add_node_tag(N/A,Valid,NodeTagListI,NodeTagList2),
      % Abort debugging
  (Valid==abort ->
    BuggyNode=abort
   ;
      % N/A is valid
    (Valid==yes -> 
      debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,LPDT,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
     ;
      % N/A is nonvalid
      debug_sql_pdt_traverse_order('dq',TrustTablesYN,TrustFileYN,RPDT,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
%       ((var(BuggyNode),debug_object(N/A)) ->
%         % If N/A has no buggy children, N/A is the buggy node
%         BuggyNode=N/A,
%         NodeType=Type
%        ;
%         true
%       )
    )
  ).
  
    
add_node_tag(_N/_A,Valid,NodeTagList,NodeTagList) :-
  var(Valid),
  !.  
add_node_tag(N/A,Valid,NodeTagListI,NodeTagListO) :-
  (my_member_chk((N/A,Valid),NodeTagListI) ->
    NodeTagListO=NodeTagListI
   ;
    NodeTagListO=[(N/A,Valid)|NodeTagListI]).
  
debug_object(N/A) :-
  view_arity(N,A),
  !. 
debug_object(N/A) :-
  table_arity(N,A).

debug_sql_pdt_traverse_order_list(_Order,_TrustTablesYN,_TrustFileYN,[],_Parent,NodeTagList,NodeTagList,_BuggyNode,_NodeType).
debug_sql_pdt_traverse_order_list(Order,TrustTablesYN,TrustFileYN,[PDT|PDTs],Parent,NodeTagListI,NodeTagListO,BuggyNode,NodeType) :-
  debug_sql_pdt_traverse_order(Order,TrustTablesYN,TrustFileYN,PDT,Parent,NodeTagListI,NodeTagList2,BuggyNode,NodeType),
  (var(BuggyNode) ->
    debug_sql_pdt_traverse_order_list(Order,TrustTablesYN,TrustFileYN,PDTs,Parent,NodeTagList2,NodeTagListO,BuggyNode,NodeType)
   ;
    NodeTagListO=NodeTagList2
  ).

debug_sql_node(TrustTablesYN,TrustFileYN,N/A,NodeType,Parent,NodeTagList,Valid) :-
  % Check what object is (table or view). If tables are trusted, fail and use default case (which does nothing)
  sql_node_type(N/A,NodeType),
  (TrustTablesYN==yes ->
    NodeType==view  % Fails if NodeType is table
   ;
    true
  ),
  % Check whether the node has been already visited and checked 
  (my_member_chk((N/A,Valid),NodeTagList) ->
    true
   ;
    % Check whether a trust file is used. If so, try to find the trusted object (it may not exists)
    (TrustFileYN==yes ->
      name_trusted(N,TrustObjectName),
      pdg((Nodes,_Arcs)),
      (my_member_chk(TrustObjectName/A,Nodes) ->
        TrustObjectFound=yes,
        write_verb_list(['Info: Trusting ',NodeType,'''',N,''' from trust file.',nl])
       ;
        TrustObjectFound=no
      )
     ;
      TrustObjectFound=no 
    ),
    !,
    write_log_list(['Info: Debugging ',NodeType,' ''',N,'''.',nl]),
    (verbose(off) -> set_flag(output,off) ; true),
    list_schema_list([N]),
    length(Args,A),
    Query=..[N|Args],
    my_term_to_string(Query,QueryStr),
    write_log_list(['Info: Outcome of ',NodeType,' ''',N,''':',nl]),
    ((verbose(off), TrustObjectFound==no) -> set_flag(output,on) ; true),
    process_datalog(QueryStr),
    (verbose(off) -> set_flag(output,off) ; true),
    (TrustObjectFound==yes ->
      TrustQuery=..[TrustObjectName|Args],
      my_term_to_string(TrustQuery,TrustQueryStr),
      process_datalog(TrustQueryStr),
      (verbose(off) -> set_flag(output,on) ; true),
      (same_meaning(N,TrustObjectName,A) ->
        TrustValid=yes,
        write_log_list(['Info: ',NodeType,' ''',N,''' is valid w.r.t. the trusted file.',nl])
       ;
        TrustValid=no,
        write_log_list(['Info: ',NodeType,' ''',N,''' is nonvalid w.r.t. the trusted file.',nl])
      )
     ;
      TrustValid=unknown
    ),
    (verbose(off) -> set_flag(output,on) ; true),
    % If no trust object is found, then ask the user for the validity of the debugged object 
    (TrustValid==unknown ->
      write_log_list(['Input: Is this ',NodeType,' valid? (y/n/a) [y]: ']),
      flush_output,
      readln(Str,_),
      (batch(_,_,_) -> inc_line, write_string_log(Str), nl_log ; true),
      (\+ batch(_,_,_),log(_,_) -> write_only_to_log(Str), nl_only_to_log ; true),
      ((Str=[] ; Str=="y" ; Str=="Y") ->
        Valid=yes
        ;
        (Str=="n" ->
          Valid=no
         ;
          (Str=="a" ->
            Valid=abort
           ;
            write_error_log(['Invalid input. Use ''y'' for setting this node as valid, ''n'' for nonvalid or ''a'' for aborting.']),
            debug_sql_node(TrustTablesYN,TrustFileYN,N/A,NodeType,Parent,NodeTagList,Valid)
          )
        )
      )
     ;
    % Otherwise, validity corresponds to the equivalence between meanings of the object and trusted object
      Valid=TrustValid 
    )
 ).
% The following corresponds to the root node (a view)  
debug_sql_node(_TT,_TF,_N/_A,view,_Parent,_NodeTagList,_Valid).
  
sql_node_type(N/A,NodeType) :-
  view_arity(N,A), 
  NodeType=view,
  !.
sql_node_type(N/A,NodeType) :-
  table_arity(N,A),
  NodeType=table.
     
  
% Divide a tree with two or more nodes from its centre
divide_tree(node(N1/A1,[node(N2/A2,[])]),node(N1/A1,[]),node(N2/A2,[])) :-
  !.
divide_tree(PDT,LPDT,RPDT) :-
  nbr_pdt_nodes(PDT,Nbr),
  compute_pdt_weights(PDT,Nbr,Nbr,Min,WPDT),
  divide_tree(PDT,WPDT,Min,LPDT,RPDT).
  
% pdg_to_pdt(a/1,([a/1,b/2],[a/1+b/2]),PDT),divide_tree(PDT,LPDT,RPDT).
% pdg_to_pdt(a/1,([a/1,b/2,c/3,d/4,e/5,f/6],[a/1+b/2,a/1+c/3,a/1+d/4,c/3+e/5,d/4+f/6,f/6+a/1]),PDT),divide_tree(PDT,LPDT,RPDT).
  
compute_pdt_weights(node(N/A,Children),Nbr,CMin,Min,node(N/A,W,WChildren)) :-
  nbr_pdt_nodes(node(N/A,Children),Size),
  W is abs((Nbr-Size)-Size),
  my_min(W,CMin,Min1),
  compute_pdt_weights_list(Children,Nbr,Min1,Min,WChildren).
  
compute_pdt_weights_list([],_Nbr,Min,Min,[]).
compute_pdt_weights_list([Child|Children],Nbr,CMin,Min,[WChild|WChildren]) :-
  compute_pdt_weights(Child,Nbr,CMin,Min1,WChild),
  compute_pdt_weights_list(Children,Nbr,Min1,Min,WChildren).
  
nbr_pdt_nodes(node(_NA,Children),Nbr) :-
  nbr_pdt_nodes_list(Children,LNbr),
  Nbr is LNbr+1.
  
nbr_pdt_nodes_list([],0).
nbr_pdt_nodes_list([Child|Children],Nbr) :-
  nbr_pdt_nodes(Child,CNbr),
  nbr_pdt_nodes_list(Children,LNbr),
  Nbr is CNbr+LNbr.
   
divide_tree(node(N/A,Children),node(N/A,_Min,WChildren),Min,node(N/A,LChildren),Center) :-
  divide_tree_list(Children,WChildren,Min,LChildren,Center).
  
divide_tree_list([],[],_Min,[],_CenterNotFound).
divide_tree_list([node(N/A,Children)|Nodes],[node(N/A,Min,_WChildren)|_WNodes],Min,Nodes,node(N/A,Children)) :-
  !.
divide_tree_list([node(N/A,Children)|Nodes],[node(N/A,W,WChildren)|WNodes],Min,[node(N/A,LChildren)|LNodes],Center) :-
  divide_tree(node(N/A,Children),node(N/A,W,WChildren),Min,node(N/A,LChildren),Center),
  (var(Center) -> 
    divide_tree_list(Nodes,WNodes,Min,LNodes,Center)
   ;
    LNodes=Nodes).
    
  