/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    MAIN PROGRAM                                       */
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
/* - Multi-query language: Datalog, SQL, Prolog          */
/* - Arithmetic expressions                              */
/* - Stratified negation                                 */
/* - Null value support                                  */
/* - Outer join builtin relations (lj,rj,fj)             */
/* - Aggregate builtin functions and predicates          */
/*   (count,sum,min,...)                                 */
/* - GROUP BY and HAVING support (see User Manual)       */
/* - Disjunctive bodies                                  */
/* - Type inferring/checking system                      */
/* - Datalog and SQL Declarative debuggers               */
/* - SQL test case generator                             */
/* - Memoization (tabling)                               */
/* - Terminating computations modulo arithmetics (is/2)  */
/* - RDB connections via ODBC                            */
/* - Duplicates                                          */
/* - Strong constraints                                  */
/*********************************************************/


/*********************************************************************/
/* Notes about the implementation                                    */
/*********************************************************************/

% 1. Rule representation:
%    * Rule:    ':-'(Head,Body) or simply Head
%    * ruleNVs: (Rule,NVs), where NVs=['Varname1'=Var1,...]
%    * dlrule:  datalog(Rule,NVs,RuleId,Lines,FileId,source)
%               datalog(Rule,NVs,RuleId,Lines,FileId,compilation(SourceRule,SourceNVs,[RuleIds]))
%               datalog(Rule,NVs,RuleId,Lines,FileId,compiled)
%      'source' means that the rule has not been compiled
%      'compilation' means that the source rule SourceRule has been compiled into the rules identified by [RuleId|RuleIds]. 
%                    RuleId is arbitrarily chosen as a representative 
%      'compiled' means that the rule is the result of a compilation
%      RuleId is the rule identifier (an integer) used for managing duplicates
%      Lines are the lines in the source text program where the rule occurs: (FromLine-ToLine)
%      FileID is the file identifier (an integer) where the rule is defined

/*********************************************************************/
/* Autorun information from Prolog interpreters (only as a reference)*/
/*********************************************************************/

%Autorun:
% Sicstus:
%  -l des.pl
% SWI-Prolog:
%  -g "ensure_loaded(des)"
% GNU-Prolog:
%  --entry-goal ['des.pl']
% CIAO Prolog:
%  -l ciaorc

% The following is needed since GNU 1.3.1 does not support ensure_loaded 
% ISO directive. A prelude for this system is prepended to this file, 
% containing a call to consult instead of to ensure_loaded.
my_ensure_loaded(X) :-
  ensure_loaded(X).

  
/*********************************************************************/
/* DES version number                                                */
/*********************************************************************/

des_version('2.7').


/*********************************************************************/
/* Specific files                                                    */
/*********************************************************************/

:- include('des_dcg.pl').                            % DCG translator

%:- initialization(my_ensure_loaded('des_glue.pl')).  % Prolog system-dependent predicates
%:- initialization(my_ensure_loaded('des_dl_debug.pl')).  % Datalog declarative debugger
%:- initialization(my_ensure_loaded('des_sql_debug.pl')). % SQL declarative debugger
%:- initialization(my_ensure_loaded('des_sql.pl')).   % SQL query processor
%:- initialization(my_ensure_loaded('des_ra.pl')).    % AR query processor
%:- initialization(my_ensure_loaded('des_tc.pl')).    % Test case generator
%:- initialization(my_ensure_loaded('des_types.pl')). % Type system

/*********************************************************************/
/* Auto-start after loading                                          */
/*********************************************************************/

% The cut after start is a workaround for allowing Ciao 1.10p5 to terminate DES
%:- initialization((start, !)).

/*********************************************************************/
/* Predicate for debugging when developing                           */
/*********************************************************************/

deb.

/*********************************************************************/
/* Dynamic Predicates                                                */
/*********************************************************************/

:- dynamic(log/2).            % Log file information (filename and associated stream)
:- dynamic(verbose/1).        % Verbose mode flag 
:- dynamic(pretty_print/1).   % Pretty print for listings (takes more lines to print)
:- dynamic(batch/3).          % Batch mode flag 
:- dynamic(consult/2).        % Consult mode flag 
%:- dynamic(et/2).             % Extension Table 
:- dynamic(et/3).             % Extension Table 
%:- dynamic(called/1).         % Call Patterns
:- dynamic(called/2).         % Call Patterns
:- dynamic(et_flag/1).        % Extension Table flag 
:- dynamic(complete_flag/3).  % Complete computation flag 
:- dynamic(datalog/6).        % Datalog Rule Database 
:- dynamic(strata/1).         % Result from a stratification
:- dynamic(pdg/1).            % Predicate Dependency Graph
:- dynamic(null_id/1).        % Integer identifier for nulls, represented as '$NULL'(i), where 'i' is the null identifier
:- dynamic(rule_id/1).        % Integer identifier for rules, represented as datalog(Rule,NVs,i,Lines,FileId,Kind), where 'i' is the rule identifier
:- dynamic(pred_id/2).        % Integer identifier for system predicates built along compilations: '$pi', where 'i' is the identifier
:- dynamic(neg/1).            % Flag indicating the negation algorithm: et_not [SD91] or strata (optimized)
:- dynamic(duplicates/1).     % Flag indicating whether duplicates are enabled
:- dynamic(timing/1).         % Flag indicating elapsed time display: on, off or detailed
:- dynamic(time/3).           % Elapsed times for parsing, computation and display
:- dynamic(error/0).          % Flag indicating whether there was an error
:- dynamic(safe/1).           % Flag indicating whether program transformation for safe rules is allowed
:- dynamic(simplification/1). % Flag indicating whether program simplification for performance is allowed
:- dynamic(language/1).       % Flag indicating the current default query language
:- dynamic(start_path/1).     % Path on first initialization
:- dynamic(development/1).    % Flag indicating a development session. Listings and consultings show source and compiled rules
:- dynamic(safety_warnings/1).% Flag indicating whether safety warnings are enabled
:- dynamic(last_autoview/1).  % Flag indicating the last autoview executed. This autoview should be retracted upon exceptions
:- dynamic(current_db/2).     % Flag indicating the current opened DB
:- dynamic(rdb_id/2).         % Identifier for RDB tuples (coming from tables or views)
:- dynamic(trusting/1).       % Flag indicating whether a trust file is being processed
:- dynamic(trusted_views/1).  % Predicate containing trusted view names
:- dynamic(output/1).         % Flag indicating whether output is enabled (on or off)
:- dynamic(check_ic/1).       % Flag indicating whether integrity constraint checking is enabled (on or off)
:- dynamic(my_odbc_query_handle/1). % Flag indicating the handle to the last ODBC query
:- dynamic(compact_listings/1).  % Flag indicating whether compact listings are enabled
:- dynamic(show_compilations/1). % Flag indicating whether SQL to DL compilations are displayed
:- dynamic(state/1).          % States for various flags to be restored upon exceptions
:- dynamic(running_info/1).   % Flag indicating whether running info is to be displayed (number of consulted rules)
:- dynamic(tapi/1).           % Flag indicating whether a tapi command is being processed
:- dynamic(hypothetical/1).   % Flag indicating whether hypothetical queries are enabled (on or off)
:- dynamic(indexing/1).       % Flag indicating whether indexing on extension table is enabled (on or off)
:- dynamic(computed_tuples/1).% Flag with the number of computed tuples during fixpoint computation (for running info display)
:- dynamic(computed_tuples/2).% Flag with the number of computed tuples during fixpoint computation for a given goal (for top N queries)
:- dynamic(display_answer/1). % Flag indicating whether answers are to be displayed upon solving (on or off)
:- dynamic(multiline/1).      % Flag indicating whether multiline input is enabled (on or off)

/*********************************************************************/
/* Initial Status                                                    */
/*********************************************************************/

set_initial_status :-
  % Status defined by user-configurable flags:
  set_flag(verbose(off)),        % Verbose output disabled
  set_flag(pretty_print(on)),    % Pretty print activated
  set_flag(duplicates(off)),     % Duplicates disabled
  set_flag(neg(strata)),         % Default algorithm for solving negation
  set_flag(timing(off)),         % Elapsed time display disabled
  set_flag(safe(off)),           % Program transformation disabled
  set_flag(simplification(off)), % Program simplification disabled
  set_flag(language(datalog)) ,  % Default interpreter language (possible values are: datalog, prolog, sql)
  set_flag(development(off)),    % Development session on/off
  set_flag(safety_warnings(on)), % Safety warnings on/off, no command for changing it
  set_flag(trusting(off)),       % No trust file processing
  set_flag(output(on)),          % Output enabled
  set_flag(display_answer(on)),  % Display of answers is enabled
  set_flag(multiline(off)),      % Multiline input is disabled
  set_flag(check_ic(on)),        % Integrity constraint checking enabled
  set_flag(compact_listings(off)),  % Compact listings disabled
  set_flag(show_compilations(off)), % Compilation listings disabled
  set_flag(running_info(on)),    % Running info display enabled
  set_flag(tapi(off)),           % TAPI disabled
  set_flag(hypothetical(on)),    % Hypothetical queries enabled
  set_flag(indexing(on)),        % Hash indexing enabled
  % System initial status:
  set_default_db,               % Set '$des' as the current database
  flag_et_no_change.            % Set 'change on et' to 'no'
  
  
% Displaying the system status

display_status :-
  processC(version,[],_,_),
  processC(prolog_system,[],_,_),
  processC(timing,[],_,_),
  processC(verbose,[],_,_),
  processC(development,[],_,_),
  processC(pretty_print,[],_,_),
  processC(compact_listings,[],_,_),
  processC(show_compilations,[],_,_),
  processC(running_info,[],_,_),
  processC(log,[],_,_), 
  processC(negation,[],_,_),
  processC(safe,[],_,_),
  processC(simplification,[],_,_),
  processC(tc_size,[],_,_),
  processC(tc_domain,[],_,_),
  processC(output,[],_,_),
  processC(display_answer,[],_,_),
  processC(multiline,[],_,_),
  processC(check,[],_,_),
  processC(hypothetical,[],_,_),
  processC(indexing,[],_,_),
  processC(pwd,[],_,_).

% Datalog DB ($des) is the default DB. No connection data ($void)
set_default_db :-
  (current_db(DB,_)
   ->
    (DB \== '$des'
     ->
      processC(close_db,[],_,_)            % Resetting an opened RDB
     ;
      true
     )
   ;
    set_flag(current_db('$des','$void')) % Startup
  ).
    
% save_state/0. Push current state of several flags to be restored upon exceptions
save_state :-
  language(L),
  compact_listings(CL),
  (state(_State)
   ->
   true
   ; 
   assertz(state([language(L),compact_listings(CL)]))
  ).
  
% restore_state/0. Restore a saved state upon exception
restore_state :-
  retract(state(State)),
  my_member(Flag,State),
  set_flag(Flag),
  fail.
restore_state.
  
/*********************************************************************/
/* 'dual' Predefined Predicate                                       */
/*********************************************************************/

dual.

/*********************************************************************/
/* Starting the System from scratch: start                           */
/*********************************************************************/

start :- 
  flush_output,
  init_des, 
%  display_status,
  des.

% System initialization on start-up
init_des :- 
  set_start_path,
  retractall(log(_,_)),
  retractall(batch(_,_,_)),
  retractall(consult(_,_)),
  retractall(rule_id(_)),
  set_initial_status,
  processC(abolish,[],_NVs,_Continue),
  display_banner, 
  process_batch. %If des.ini exists, their entries are processed as command prompt inputs
  
set_start_path :-
  (start_path(D) -> 
    cd_path(D)
   ; 
    my_working_directory(D), 
    assertz(start_path(D))).

% Entry execution point
des :-
  repeat, 
  catch(exec_des(Continue), M, (my_exception_handling(M), complete_pending_tasks(M))), 
  ((M == '$aborted'
    ;
    M == 'control_c' 
    ;
    Continue==no
   )
   ->
    true
   ;
    fail).

% Completing pending tasks upon exceptions
% WARNING: Other views/rules might be removed upon exceptions. Hint: Use answer as a view and follow the dependencies
complete_pending_tasks(des_exception(syntax(_Message))) :- % Nothing to do for syntax errors. WARNING: Maybe pending compilations in WITH SQL statements
  !,
  (tapi(on) -> true ; nl_compact_log),
  restore_state.
complete_pending_tasks(_Message) :-
  my_odbc_dangling_query_close,
  (retract(last_autoview(V)) ->
      catch(
       (get_object_dlrules(rule,V,OVDLs),
        retract_dlrule_list(OVDLs,_Error2)),
       _M,
       true)
   ;
    true),
  abolishET,
  catch(compute_stratification, NM, my_exception_handling(NM)),
  (tapi(on) -> true ; nl_compact_log),
  restore_state,
  !.
  

% Exception handling
my_exception_handling(M) :- 
   (consult(_,CSt) ->    % Closes the program file currently loading, if any
    retractall(consult(_,_)),
    try_close(CSt)
    ; 
    true), 
  (
   M = des_exception(DESM)  % If thrown by des, it is already displayed
   ->
    (DESM == user_break
     ->
      nl_compact_log,
      write_log('Info: User break. Exit to top-level? (y/n) [n]: '),
      user_input_string(Str),
      ((Str=="y" ; Str=="Y") ->
        throw('$aborted')
       ;
        true
      )
     ;
      true
    )
   ;
    my_exception_message_display(error,M)
   ),
  (batch(_,_,_) -> 
   repoint_batch_file;
   true).

% Display exception messages
my_exception_message_display(_,'$aborted') :- 
  !.
% If thrown by des, it is already displayed:
my_exception_message_display(_,des_exception(_)) :- 
  !.
% An ODBC error:
my_exception_message_display(_,M) :-
  my_display_odbc_error(M),
  !.
% Other:
my_exception_message_display(_,M) :-
  write_log_list(['Exception: ',M,nl]).

% Relocating the pointer to the batch file
repoint_batch_file :- 
   batch(L,F,S),
  (my_current_stream(S) -> try_close(S);true),
  open(F,read,S1),
  set_input(S1),
  retractall(batch(_,_,_)),
  assertz(batch(L,F,S1)), 
  my_skip_line(L).       % Skip the offending line

my_skip_line(0) :- 
  !.
my_skip_line(N) :- 
  readln(_,_),
  N1 is N-1,
  my_skip_line(N1).
  
% Processing the batch file des.ini at the distribution directory
process_batch :-
  F = 'des.ini',
  my_file_exists(F),
  process_batch(F,'initialization batch').
process_batch.

process_batch(F) :-
  my_file_exists_with_default_extensions(F,['.sql','.ra','.ini'],FP),
  process_batch(FP,'file'),
  !.
process_batch(F) :-
  write_error_log(['When processing file ''',F,'''']).

my_file_exists_with_default_extensions(F,_Exts,CF) :-
  (my_file_exists(F) ->
    CF=F
   ;
    my_working_directory(D),
    atom_concat(D,F,CF),
    my_file_exists(CF)
  ),
  !.
my_file_exists_with_default_extensions(F,Exts,FP) :- 
  my_file_exists_with_default_extension_list(F,Exts,FP).

my_file_exists_with_default_extension_list(F,[],_FP) :-  
  write_error_log(['File ''',F,''' not found.']), 
  !,
  fail.
my_file_exists_with_default_extension_list(F,[Ext|_Exts],FP) :-  
  atom_concat(F,Ext,FExt),
  (my_file_exists(FExt) ->
    FP=FExt
   ;
    my_working_directory(D),
    atom_concat(D,FExt,FP),
    my_file_exists(FP)
  ),
  !.
my_file_exists_with_default_extension_list(F,[_Ext|Exts],FP) :-  
  my_file_exists_with_default_extension_list(F,Exts,FP).
  
process_batch(F,M) :-
  my_absolute_filename(F,CFN),
  seeing(OldInput),   % Current input stream
  open(CFN,read,BSt), % Open initialization batch
  set_input(BSt),
  assertz(batch(0,CFN,BSt)),
  write_info_log(['Processing ',M,' ''',F,''' ...']), 
  nl_compact_log,
  process_batch_file_lines(OldInput).

process_batch_file_lines(OldInput) :-
 deb,
  repeat,
    read_input_str(S,E,Lines),
    inc_lines(Lines),
    write_prompt,
    write_string_log(S), 
    nl_log, 
    catch(process_input(S,_), M, (my_exception_handling(M), complete_pending_tasks(M))), 
    E == end_of_file,     % Repeat until end of file
  batch(_,_,BSt),
  try_close(BSt),         % Close the input batch file
  see(OldInput),          % Restore current input stream
  retractall(batch(_,_,_)),
  write_info_log(['Batch file processed.']).
      
inc_lines(N) :-
  retract(batch(L,F,S)),
  L1 is L+N,
  assertz(batch(L1,F,S)).
  
/*********************************************************************/
/* Informative banner                                                */
/*********************************************************************/

display_banner :-
  write_log('*********************************************************'), nl_log,
  write_log('*                                                       *'), nl_log,
  write_log('*        DES: Datalog Educational System v.2.7          *'), nl_log,
  write_log('*                                                       *'), nl_log,
  write_log('*                                                       *'), nl_log,
  write_log('* Type "/help" for help about commands                  *'), nl_log,
  write_log('* Type "des." to continue if you get out of DES         *'), nl_log,
  write_log('*   from a Prolog interpreter                           *'), nl_log,
  write_log('*                                                       *'), nl_log,
  write_log('*                    Fernando Saenz-Perez (c) 2004-2012 *'), nl_log,
  write_log('*                                         GPD DISIA UCM *'), nl_log,
  write_log('*             Please send comments, questions, etc. to: *'), nl_log,
  write_log('*                                     fernan@sip.ucm.es *'), nl_log,
  write_log('*                                             Web site: *'), nl_log,
  write_log('*                           http://des.sourceforge.net/ *'), nl_log,
  write_log('*********************************************************'), nl_log, nl_log.


/*********************************************************************/
/* Datalog Prompt                                                    */
/*********************************************************************/

exec_des(Continue) :-
  write_prompt,
  flush_output, 
  read_input_str(S,E,_L),
% The following is needed for SWI-Prolog in order to avoid failure
% when closing the application in Windows  
  (E == end_of_file ->
    Continue = no
   ;
    write_only_to_log(S),
    nl_only_to_log,
    process_input(S,Continue)
  ), 
  !.
exec_des(yes) :-
  write_error_log(['Input processing error.']),
  nl_tapi_log.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prompt display
 
write_prompt :- 
  tapi(on),
  !,
  set_flag(tapi,off).
write_prompt :- 
  language(L),
%  (L==datalog -> write_log('DES-Datalog> ') ; true),
  (L==datalog -> write_log('DES> ') ; true),
  (L==prolog  -> write_log('DES-Prolog> ')  ; true),
  (L==sql     -> write_log('DES-SQL> ')     ; true),
  (L==ra      -> write_log('DES-RA> ')     ; true).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read_input_str(-String,-EOI,-Lines). 
% Read an input string from the current input stream
% (console, by default). Informs whether the line ends with an
% 'end of file' or 'end of line' character (end of input). 
% Return the number of lines in the input.
% Call to readln, if multiline is disabled
% Call to read_input/3, if multiline is enabled
% An input ends with:
% - EOL, if a command (starting with /)
% - A dot(.)+EOL, if Datalog
% - A semicolon(;)+EOL, if SQL 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
read_input_str(String,Error,1) :-
  multiline(off),
  !,
  readln(String,Error). 
read_input_str(String,Error,Lines) :-
  read_input(String,Error,Lines),
  !.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read_input(-String,-EOF,-Lines). Read an input from the current input stream
% (console, by default). Informs whether the line ends with an
% 'end of file' or 'end of line' character. Returns the number of lines in the input
% An input ends with:
% - EOL, if a command (starting with /)
% - A dot(.)+EOL, if Datalog
% - A semicolon(;)+EOL, if SQL 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

read_input(Str,E,L) :-
  read_input(Str,E,0,L).

read_input(Str,E,Li,Lo) :-
  current_input(HIn),
  read_skip_non_tokens(HIn,C,E,Li,Li1),
  ([C] == "%"
   ->
    readln(S,E),
    Lo is Li1+1,
    Str=[C|S]
   ;
    ([C] == "-"
     ->
      my_get0(HIn,C1),
      (C1 == C
       ->
        readln(S1,E),  % A SQL -- remark
        Lo is Li1+1,
        S=[C1|S1],
        Str=[C|S]
       ;
        "."=[EOI],     % A minus followed by something different from a minus (it should be a Datalog input)
        read_EOI_chars(HIn,EOI,C1,S1,E,Li1,Lo),
        S=[C1|S1],
        Str=[C|S]
      )
     ;
      ((end_of_file(C);C==end_of_file)
       ->     % End of file reached
        Str=[],
        Lo=Li1,
        E=C
       ;      % Else, either a Datalog, or RA or SQL input
       ([C] == "."
        ->    
         my_get0(HIn,C1),
         (end_of_line(C1)
          ->  % Empty input ended with a dot
           Str=[C],
           Lo=Li1
          ;
           read_up_to_EOI2(HIn,[C,C1],S,E,Li1,Lo),
           Str=[C,C1|S]
         )
        ;
         read_up_to_EOI2(HIn,[C],S,E,Li1,Lo),
         Str=[C|S]
       )
      )
    )
  )
   .

% Unknown terminator
read_up_to_EOI2(HIn,[Slash],[C|S],E,Li,Lo) :-
  [Slash]="/",
  my_get0(HIn,C),
  ([C]=="*"
   ->             % Multiline remark
     my_get0(HIn,C1),
     nbr_input_lines(C1,LC),
     Li1 is Li+LC,
     read_up_to_end_of_multiline_remark(HIn,C1,S,E,Li1,Lo,1,_R)
   ;
    readln(S,E),   % Command
    Lo is Li+1
  ).
read_up_to_EOI2(HIn,Cs,S,E,Li,Lo) :-
  my_get0(HIn,C),
  nbr_input_lines(C,LC),
  Li1 is Li+LC,
  append(Cs,[C],CCs),
  read_EOI_chars2(HIn,C,CCs,S,E,Li1,Lo).
  
%read_EOI_chars2(+HIn,+C,+Cs,-S,-E,+Li,-Lo)
read_EOI_chars2(_HIn,C,_Cs,[],end_of_file,L,L) :-
  end_of_file(C),
  !.
read_EOI_chars2(HIn,C,Cs,[C|S],E,Li,Lo) :-
  ";" == [C],
  my_guessed_sql_statement(Cs,_),
  !,
  read_EOI_chars(HIn,C,C,S,E,Li,Lo).
read_EOI_chars2(HIn,C,Cs,[C|S],E,Li,Lo) :-
  ";" == [C],
  my_guessed_ra_statement(Cs,_),
  !,
  read_EOI_chars(HIn,C,C,S,E,Li,Lo).
read_EOI_chars2(HIn,C,Cs,[C|S],E,Li,Lo) :-
  "." == [C],
  \+ my_guessed_sql_statement(Cs,_),
  \+ my_guessed_ra_statement(Cs,_),
  !,
  read_EOI_chars(HIn,C,C,S,E,Li,Lo).
read_EOI_chars2(HIn,C,Cs,[C|S],E,Li,Lo) :-
  read_up_to_EOI2(HIn,Cs,S,E,Li,Lo).


% Nested remarks
read_up_to_end_of_multiline_remark(_HIn,C,[],end_of_file,L,L,R,R) :-
  end_of_file(C),
  !.
read_up_to_end_of_multiline_remark(HIn,C,S,E,Li,Lo,Ri,Ro) :-
  [C]=="/",
  !,
  my_get0(HIn,C1),
  ([C1]=="*"
   ->
    Ri1 is Ri+1,
    my_get0(HIn,C2),
    nbr_input_lines(C2,LC),
    Li1 is Li+LC,
    read_up_to_end_of_multiline_remark(HIn,C2,S1,E,Li1,Lo,Ri1,Ro),
    S=[C,C1|S1]
   ;
    nbr_input_lines(C1,LC),
    Li1 is Li+LC,
    S=[C,C1|S1],
    read_up_to_end_of_multiline_remark(HIn,C1,S1,E,Li1,Lo,Ri,Ro)
  ).
% End of multiline remark
read_up_to_end_of_multiline_remark(HIn,C,S,E,Li,Lo,Ri,Ro) :-
  [C]=="*",
  !,
  my_get0(HIn,C1),
  ([C1]=="/"
   ->
    S=[C,C1|S1],
    Ri1 is Ri-1,
    (Ri1=<0
     ->  % All multiline remarks are closed
      read_after_EOR(HIn,S1,E,Li,Lo)
     ;   % There are pending multiline remarks to close
      my_get0(HIn,C2),
      nbr_input_lines(C2,LC),
      Li1 is Li+LC,
      read_up_to_end_of_multiline_remark(HIn,C2,S1,E,Li1,Lo,Ri1,Ro)
    )
   ;
    nbr_input_lines(C1,LC),
    Li1 is Li+LC,
    S=[C,C1|S1],
    read_up_to_end_of_multiline_remark(HIn,C1,S1,E,Li1,Lo,Ri,Ro)
  ).
% Read chars inside a multiline remark
read_up_to_end_of_multiline_remark(HIn,C,[C|S1],E,Li,Lo,Ri,Ro) :-
  my_get0(HIn,C1),
  nbr_input_lines(C1,LC),
  Li1 is Li+LC,
  read_up_to_end_of_multiline_remark(HIn,C1,S1,E,Li1,Lo,Ri,Ro).
  
% Read after an end of (multiline) remark    
read_after_EOR(_HIn,S,E,Li,Lo) :-
  readln(S,E),
  Lo is Li+1.

% Read up to end of input (a char code EOI).
% Return the input string
% Known terminator
read_up_to_EOI(HIn,EOI,Cs,E,Li,Lo) :-
  my_get0(HIn,C),
  read_EOI_chars(HIn,EOI,C,Cs,E,Li,Lo).
  
%read_EOI_chars(+HIn,+EOI,+C,-Cs,-E)
% Known terminator EOI
% First clause: 
% - EOI reached, skip blanks and get EOI
% - If EOI not found, continue reading
% Second clause: 
% read_EOI_chars(HIn,EOI,EOI,Cs,E,Li,Lo) :-
%   !,
%   read_skip_blanks(HIn,Bs,C),
%   (my_end_of_input(C,E)
%    ->
%     Lo is Li+1, 
%     Cs=[]
%    ;
%     read_up_to_EOI(HIn,EOI,TCs,E,Li,Lo),
%     append([C|Bs],TCs,Cs)
%   ).
read_EOI_chars(_HIn,_,C,[],end_of_file,L,L) :-
  end_of_file(C),
  !.
read_EOI_chars(HIn,EOI,EOI,Cs,E,Li,Lo) :-
  !,
  readln(S,E),
  (nonvar(E)
   ->
    Lo is Li+1, 
    Cs=S
   ;
    read_up_to_EOI(HIn,EOI,TCs,E,Li,Lo),
    append(S,TCs,Cs)
  ).
% read_EOI_chars(HIn,EOI,C,[C|Cs],E,Li,Lo) :- % SQL
%   [EOI]==";",
%   !,
%   my_get0(HIn,C1),
%   ([C,C1]=="--"
%    ->
%     read_line_remark
%   read_up_to_EOI(HIn,EOI,Cs,E,Li,Lo).
read_EOI_chars(HIn,EOI,C,[C|Cs],E,Li,Lo) :- % Datalog
  read_up_to_EOI(HIn,EOI,Cs,E,Li,Lo).


% Return the first non-blank character read from input
read_skip_blanks(HIn,C) :-
  read_skip_blanks(HIn,_Bs,C).

% Return the first non-blank character read from input 
% and the blanks as a string
read_skip_blanks(HIn,Bs,C) :- 
  my_get0(HIn,GC),
  ([GC]==" "
   ->
    Bs=[GC|TBs],
    read_skip_blanks(HIn,TBs,C)
   ;
    C=GC,
    Bs=[]).
  
% Return the first token character read from input 
% (skip blanks, line feeds and carriage returns)
read_skip_non_tokens(HIn,C,E,Li,Lo) :-
  my_get0(HIn,GC),
  ([GC]==" "
   ->
    read_skip_non_tokens(HIn,C,E,Li,Lo)
   ;
    (my_end_of_input(GC,E1)
     ->
      (E1==end_of_line
       ->
        Li1 is Li+1,
        read_skip_non_tokens(HIn,C,E,Li1,Lo)
       ; % End of file
        Lo is Li+1,
        C=E1
      )
     ;
      C=GC,
      Lo=Li
    )
  ).

% Number of lines for a given character
% end_of_line and end_of_file amount 1 line
% Other characters amount 0 lines  
nbr_input_lines(C,1) :-
  end_of_line(C),
  !.
nbr_input_lines(C,1) :-
  end_of_file(C),
  !.
nbr_input_lines(_C,0).

% End of input: either end_of_line or end_of_file  
my_end_of_input(C,end_of_line) :-
  end_of_line(C),
  !. 
my_end_of_input(C,end_of_file) :-
  end_of_file(C),
  !. 
  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% readln(-String,-EOF). Read a line from the current input stream
% (console, by default). Informs whether the line ends with an
% 'end of file' or 'end of line' character.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

readln(S,E) :-
  current_input(HIn),
  readln(HIn,S,E).

readln(HIn,Cs,E) :-
  my_get0(HIn,C),
  read_chars(HIn,C,Cs,E).

read_chars(_HIn,C,[],end_of_line) :-
  end_of_line(C), 
  !.
read_chars(_HIn,C,[],end_of_file) :-
  end_of_file(C), 
  !.
read_chars(HIn,C,[C|Cs],E) :-
  readln(HIn,Cs,E).

end_of_line(C) :-
  (C = 13
   ;
   C = 10),
  my_skip_line.

end_of_file(C) :-
  (C = 26
   ;
   C = -1).


/******************************************************************************/
/* Preprocessing                                                              */
/* preprocess(+(Rule,NVs),                                                    */
/*            -SimplifiedRuleNVsList,                                         */
/*            -SafedRuleNVsList,                                              */
/*            -ExplodedRuleNVsList,                                           */
/*            +InputArgs      % Arg. positions known to be ground at run-time */
/*            +InputArgsList  % List of arg. positions inferred to be ground  */
/*                              at run-time for transformed rules             */
/*            +Action,        % 'exec','assert','consult'                     */
/*            +Object,        % 'view','autoview','rule'                      */
/*            -Causes,        % 'transformed','simplification','safety','exploded'          */
/*            -Tasks,         % 'simplify' (force simplification),            */
/*                            % 'no_safety' (disable safety transformations)  */
/*            -Error)         % 'true', if an error is found, var otherwise   */
/******************************************************************************/

% Preprocessing consists of source-to-source transformations for:
% - 'distinct' calls
% - not(Primitive) -> Negated Primitive, as: not(is_null(G)) -> is_not_null(G)
% - Negated compound goals, as not((a,b)) and not((a;b))
% - Grouped aggregates
% - Disjunctive bodies
% - Outer joins. May deliver conditions which can be further simplified
% - Simplification of equality (=), true, not(true) and not(false) goals
%
% preprocess(+RuleNVs,-SRuleNVsList,-SRuleNVsList,-SRuleNVsList,+IArgs,-IArgsList,+NVs,-SNVs,+Action,+Object,-Causes,+Tasks,-Error)

preprocess(RuleNVs,SiRuleNVsList,SfRuleNVsList,ExRuleNVsList,IArgs,IArgsList,Action,Object,Causes,Tasks,Error) :-
  copy_term(RuleNVs,CRuleNVs),
  remove_underscored_head_variables_from_rule(CRuleNVs,Action,RCRuleNVs,Transformed),
  replace_not_primitive(RCRuleNVs,RNRuleNVs),
  translate_top_calls_list([RNRuleNVs],TRuleNVsList,[IArgs],NArgsList,Exploded0),
  translate_distinct_calls_list(TRuleNVsList,DRuleNVsList,NArgsList,DArgsList,Exploded1),
  translate_negated_compound_calls_list(DRuleNVsList,NCRuleNVsList,DArgsList,NCArgsList,Exploded2),
  translate_aggregates_ruleNVs_list(NCRuleNVsList,TARuleNVsList,NCArgsList,TAIArgsList,Simplified1,Exploded3,Error),
  disjunctive_to_conjunctive_ruleNVs_list(TARuleNVsList,CRuleNVsList,TAIArgsList,CIArgsList,Exploded4),
  preprocess_task(Tasks,simplify,Simplify),
  simplify_ruleNVs_list(CRuleNVsList,SiRuleNVsList,Simplify,Simplified2), % WARNING: IArgsList should be passed to this
  (Exploded4==true -> Object1 = view ; Object1 = Object),
  preprocess_task(Tasks,no_safety,Safety),
  make_safe_list(SiRuleNVsList,SfRuleNVsList,CIArgsList,Action,Object1,Safety,Safed,Error),
  translate_outer_joins_list(SfRuleNVsList,ORuleNVsList,CIArgsList,TIArgsList,_Exploded5),
  disjunctive_to_conjunctive_ruleNVs_list(ORuleNVsList,CRuleNVsList2,TIArgsList,IArgsList,_Exploded6),
  simplify_ruleNVs_list(CRuleNVsList2,ExRuleNVsList,Simplify,Simplified3), % WARNING: IArgsList should be passed to this
  (Transformed==true -> TCauses=[transformed] ; TCauses=[]),
  ((Simplified1==true ; Simplified2==true ; Simplified3==true) -> SCauses=[simplification|TCauses] ; SCauses=TCauses),
  (Safed==true -> SfCauses = [safety|SCauses] ; SfCauses=SCauses),
  ((Exploded0==true ; Exploded1==true ; Exploded2==true ; Exploded3==true ; Exploded4==true) -> Causes = [exploded|SfCauses] ; Causes=SfCauses).

% Remove underscored variables from queries
remove_underscored_head_variables_from_rule((H,NVs),assert,(H,NVs),_T) :- 
  !.
remove_underscored_head_variables_from_rule((':-'(H,B),NVs),_Action,(':-'(TH,B),NVs),T) :- 
  !,
  remove_underscored_head_variables_from_head(H,NVs,TH),
  (H==TH -> true ; T=true).
remove_underscored_head_variables_from_rule((H,NVs),_Action,(TH,NVs),T) :- 
  remove_underscored_head_variables_from_head(H,NVs,TH),
  (H==TH -> true ; T=true).

remove_underscored_head_variables_from_head(Head,NVs,NHead) :-
  Head=..[F|Args],
  remove_underscored_variables_list(Args,NVs,NArgs),
  NHead =.. [F|NArgs].
  
remove_underscored_variables_list([],_NVs,[]).
remove_underscored_variables_list([V|Args],NVs,NArgs) :-
  var(V),
  find_var_name(V,N,NVs),
  atom_concat('_',_,N),
  !,
  remove_underscored_variables_list(Args,NVs,NArgs).
remove_underscored_variables_list([Arg|Args],NVs,[Arg|NArgs]) :-
  remove_underscored_variables_list(Args,NVs,NArgs).

no_input_arguments_list(DLs,IArgsList) :-
  length(DLs,N),
  length(IArgsList,N),
  my_member_chk([],IArgsList).

preprocess_task(Tasks,Task,Task) :-
  my_member(Task,Tasks),
  !.
preprocess_task(_Tasks,_Task,_Var).

% Replaces all occurrences of not(is_null(S)) by is_not_null(S) in a term T
% not(null(T)) has to be avoided because of computation by strata
replace_not_primitive(T,T) :- 
  (number(T) ; var(T) ; atom(T)),
  !.
replace_not_primitive(not(not(T)),RT) :- 
  !,
  replace_not_primitive(T,RT).
replace_not_primitive(not(is_null(T)),is_not_null(T)) :- 
  !.
replace_not_primitive(not(is_not_null(T)),is_null(T)) :- 
  !.
replace_not_primitive(not(G),NotG) :-
  G=..[DLop,L,R],
  complement_DL_op(DLop,CDLop),
  !,
  NotG=..[CDLop,L,R].
replace_not_primitive(C,RC) :- 
  C =.. [F|As],
  !, 
  replace_not_primitive_list(As,RAs),
  RC =.. [F|RAs].

replace_not_primitive_list([],[]) :-
  !.
replace_not_primitive_list([T|Ts],[RT|RTs]) :-
  !, 
  replace_not_primitive(T,RT), 
  replace_not_primitive_list(Ts,RTs).

% complemented DL operator
complement_DL_op('=<','>').
complement_DL_op('=','\\=').
complement_DL_op('\\=','='). 
complement_DL_op('>=','<').
complement_DL_op('>','=<').
complement_DL_op('<','>=').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translating top calls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% translate_top_calls_list(+RuleNVsList,-DRuleNVsList,+IArgsList,-DArgsList,-Exploded)
translate_top_calls_list(RuleNVsList,DRuleNVsList,IArgsList,DArgsList,Exploded) :-
  translate_top_calls_list(RuleNVsList,IArgsList,[],[],DRuleNVsList,DArgsList,Exploded).
  
% translate_top_calls_list(+RuleNVsList,+IArgsList,+DRuleNVsList1,+DIArgsList1,-DRuleNVsList2,-DIArgsList2,-Exploded)
translate_top_calls_list([],[],DRuleNVsList,DIArgsList,DRuleNVsList,DIArgsList,_Exploded).
translate_top_calls_list([RuleNVs|RuleNVsList],[IArgs|IArgsList],DRuleNVsListi,DIArgsListi,DRuleNVsListo,DIArgsListo,Exploded) :-
  translate_top_calls(RuleNVs,IArgs,DRuleNVsList1,DIArgsList1,Exploded),
  translate_top_calls_list(RuleNVsList,IArgsList,DRuleNVsList1,DIArgsList1,DRuleNVsList2,DIArgsList2,Exploded),
  append(DRuleNVsListi,DRuleNVsList2,DRuleNVsListo),
  append(DIArgsListi,DIArgsList2,DIArgsListo).

translate_top_calls((Rule,NVs),IArgs,[(TRule,TNVs)|NCRuleNVsList],[IArgs|IArgsList],Exploded) :-
  translate_top_calls(Rule,TRule,NVs,IArgs,Exploded,[],NCRuleNVsList,[],IArgsList),
  my_term_variables(TRule,TVs),
  my_var_name_list(TVs,NVs,TNVs).

translate_top_calls(T,T,_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  (number(T) ; var(T) ; atom(T)),
  !.
translate_top_calls(top(N,B),top(N,B),_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  my_atom(B),
  functor(B,F,A),
  \+ my_aggregate_relation(F,A),
  \+ my_outer_join_relation(F/A),
  !.
translate_top_calls(top(N,B),top(N,H),NVs,_IArgs,true,RuleNVsListi,[(':-'(H,TB),TNVs)|RuleNVsListo],IArgsListi,[[]|IArgsListo]) :- 
  !,
  relevant_vars(B,Vs),
  build_head_from_body(Vs,[],_,H),
  %WARNING: Build new IArgs appropriately
  translate_top_calls(B,TB,NVs,[],_,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  my_term_variables([H,TB],TVs),
%  var_names(TVs,NVs,TNVs).
  my_var_name_list(TVs,NVs,TNVs).
translate_top_calls(C,RC,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :- 
  C =.. [F|As],
  !, 
  translate_top_calls_list(As,RAs,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  RC =.. [F|RAs].

translate_top_calls_list([],[],_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :-
  !.
translate_top_calls_list([T|Ts],[RT|RTs],NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :-
  !, 
  translate_top_calls(T,RT,NVs,IArgs,E,RuleNVsListi,RuleNVsList1,IArgsListi,IArgsList1), 
  translate_top_calls_list(Ts,RTs,NVs,IArgs,E,RuleNVsList1,RuleNVsListo,IArgsList1,IArgsListo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translating distinct calls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% translate_distinct_calls_list(+RuleNVsList,-DRuleNVsList,+IArgsList,-DArgsList,-Exploded)
translate_distinct_calls_list(RuleNVsList,DRuleNVsList,IArgsList,DArgsList,Exploded) :-
  translate_distinct_calls_list(RuleNVsList,IArgsList,[],[],DRuleNVsList,DArgsList,Exploded).
  
% translate_distinct_calls_list(+RuleNVsList,+IArgsList,+DRuleNVsList1,+DIArgsList1,-DRuleNVsList2,-DIArgsList2,-Exploded)
translate_distinct_calls_list([],[],DRuleNVsList,DIArgsList,DRuleNVsList,DIArgsList,_Exploded).
translate_distinct_calls_list([RuleNVs|RuleNVsList],[IArgs|IArgsList],DRuleNVsListi,DIArgsListi,DRuleNVsListo,DIArgsListo,Exploded) :-
  translate_distinct_calls(RuleNVs,IArgs,DRuleNVsList1,DIArgsList1,Exploded),
  translate_distinct_calls_list(RuleNVsList,IArgsList,DRuleNVsList1,DIArgsList1,DRuleNVsList2,DIArgsList2,Exploded),
  append(DRuleNVsListi,DRuleNVsList2,DRuleNVsListo),
  append(DIArgsListi,DIArgsList2,DIArgsListo).

translate_distinct_calls((Rule,NVs),IArgs,[(TRule,TNVs)|NCRuleNVsList],[IArgs|IArgsList],Exploded) :-
  translate_distinct_calls(Rule,TRule,NVs,IArgs,Exploded,[],NCRuleNVsList,[],IArgsList),
  my_term_variables(TRule,TVs),
%  var_names(TVs,NVs,TNVs).
  my_var_name_list(TVs,NVs,TNVs).

translate_distinct_calls(T,T,_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  (number(T) ; var(T) ; atom(T)),
  !.
translate_distinct_calls(distinct(B),distinct(TB),NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :- 
  my_term_variables(B,Vs),
  translate_distinct_calls(distinct(Vs,B),distinct(Vs,TB),NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo).
translate_distinct_calls(distinct(Vs,B),distinct(Vs,B),_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  my_atom(B),
  functor(B,F,A),
  \+ my_aggregate_relation(F,A),
  \+ my_outer_join_relation(F/A),
  !.
translate_distinct_calls(distinct(Vs,B),distinct(Vs,H),NVs,_IArgs,true,RuleNVsListi,[(':-'(H,TB),TNVs)|RuleNVsListo],IArgsListi,[[]|IArgsListo]) :- 
  !,
  %WARNING: Build new IArgs appropriately
  build_head_from_body(Vs,[],_,H),
  translate_distinct_calls(B,TB,NVs,[],_,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  my_term_variables([H,TB],TVs),
%  var_names(TVs,NVs,TNVs).
  my_var_name_list(TVs,NVs,TNVs).
translate_distinct_calls(C,RC,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :- 
  C =.. [F|As],
  !, 
  translate_distinct_calls_list(As,RAs,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  RC =.. [F|RAs].

translate_distinct_calls_list([],[],_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :-
  !.
translate_distinct_calls_list([T|Ts],[RT|RTs],NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :-
  !, 
  translate_distinct_calls(T,RT,NVs,IArgs,E,RuleNVsListi,RuleNVsList1,IArgsListi,IArgsList1), 
  translate_distinct_calls_list(Ts,RTs,NVs,IArgs,E,RuleNVsList1,RuleNVsListo,IArgsList1,IArgsListo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translating negated calls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% translate_negated_compound_calls_list(+RuleNVsList,-DRuleNVsList,+IArgsList,-DArgsList,-Exploded)
translate_negated_compound_calls_list(RuleNVsList,DRuleNVsList,IArgsList,DArgsList,Exploded) :-
  translate_negated_compound_calls_list(RuleNVsList,IArgsList,[],[],DRuleNVsList,DArgsList,Exploded).
  
% translate_negated_compound_calls_list(+RuleNVsList,+IArgsList,+DRuleNVsList1,+DIArgsList1,-DRuleNVsList2,-DIArgsList2,-Exploded)
translate_negated_compound_calls_list([],[],DRuleNVsList,DIArgsList,DRuleNVsList,DIArgsList,_Exploded).
translate_negated_compound_calls_list([RuleNVs|RuleNVsList],[IArgs|IArgsList],DRuleNVsListi,DIArgsListi,DRuleNVsListo,DIArgsListo,Exploded) :-
  translate_negated_compound_calls_ruleNVs(RuleNVs,IArgs,DRuleNVsList1,DIArgsList1,Exploded),
  translate_negated_compound_calls_list(RuleNVsList,IArgsList,DRuleNVsList1,DIArgsList1,DRuleNVsList2,DIArgsList2,Exploded),
  append(DRuleNVsListi,DRuleNVsList2,DRuleNVsListo),
  append(DIArgsListi,DIArgsList2,DIArgsListo).

% translate_negated_compound_calls_ruleNVs(+RuleNVs,+IArgs,-RuleNVsList,-IArgsList,-Exploded)
translate_negated_compound_calls_ruleNVs((Rule,NVs),IArgs,[TRuleNVs|NCRuleNVsList],[IArgs|IArgsList],Exploded) :-
  translate_negated_compound_calls_rule(Rule,TRuleNVs,NVs,IArgs,Exploded,NCRuleNVsList,IArgsList).
  
translate_negated_compound_calls_rule(':-'(H,B),(TRule,NVs),NVs,IArgs,Exploded,NCRuleNVsList,IArgsList) :-
  !,
  translate_negated_compound_calls(':-'(H,B),TRule,NVs,IArgs,Exploded,[],NCRuleNVsList,[],IArgsList).
translate_negated_compound_calls_rule(H,(H,NVs),NVs,_IArgs,_Exploded,[],[]).
  
translate_negated_compound_calls(T,T,_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  (number(T) ; var(T) ; atom(T)),
  !.
% translate_negated_compound_calls(not(not(B)),TB,IArgs,Exploded,DLsi,DLso,IArgsListi,IArgsListo) :- 
%   !,
%   translate_negated_compound_calls(B,TB,IArgs,Exploded,DLsi,DLso,IArgsListi,IArgsListo).
translate_negated_compound_calls(not(B),not(B),_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :- 
  my_atom(B),
  functor(B,F,A),
  \+ my_aggregate_relation(F,A),
  \+ my_outer_join_relation(F/A),
  !.
translate_negated_compound_calls(not(B),not(H),NVs,_IArgs,true,RuleNVsListi,[(':-'(H,TB),TNVs)|RuleNVsListo],IArgsListi,[[]|IArgsListo]) :- 
  !,
  %WARNING: Build new IArgs appropriately
  build_head_from_body(B,[],_,H),
  translate_negated_compound_calls(B,TB,NVs,[],_,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  my_term_variables([H,TB],TVs),
%  var_names(TVs,NVs,TNVs).
  my_var_name_list(TVs,NVs,TNVs).
translate_negated_compound_calls(C,RC,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :- 
  C =.. [F|As],
  !, 
  translate_negated_compound_calls_list(As,RAs,NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo),
  RC =.. [F|RAs].

translate_negated_compound_calls_list([],[],_NVs,_IArgs,_E,RuleNVsList,RuleNVsList,IArgsList,IArgsList) :-
  !.
translate_negated_compound_calls_list([T|Ts],[RT|RTs],NVs,IArgs,E,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo) :-
  !, 
  translate_negated_compound_calls(T,RT,NVs,IArgs,E,RuleNVsListi,RuleNVsList1,IArgsListi,IArgsList1), 
  translate_negated_compound_calls_list(Ts,RTs,NVs,IArgs,E,RuleNVsList1,RuleNVsListo,IArgsList1,IArgsListo).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translating aggregates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
% Translate aggregate predicates with compound goals, as in min((p(X,Y),X>Y),X,M) and group_by((p(X,Y),q(Y,Z)),[X],R=max(X))
translate_aggregates_ruleNVs_list([],[],[],[],_Simplified,_Exploded,_Error).
translate_aggregates_ruleNVs_list([RuleNVs|RuleNVsList],RuleNVsListo,[IArgs|IArgsList],IArgsListo,Simplified,Exploded,Error) :-
  translate_aggregates(RuleNVs,IArgs,RuleNVsList1,IArgsList1,Simplified,Exploded,Error),
  translate_aggregates_ruleNVs_list(RuleNVsList,RuleNVsList2,IArgsList,IArgsList2,Simplified,Exploded,Error),
  append(RuleNVsList1,RuleNVsList2,RuleNVsListo),
  append(IArgsList1,IArgsList2,IArgsListo).

translate_aggregates((':-'(H,B),NVs),IArgs,[(':-'(H,TB),RNVs)|RuleNVsList],[IArgs|IArgsList],Simplified,Exploded,Error) :-
  !,
  my_term_variables(H,HVs),
  translate_body_aggregates(B,TB,HVs,NVs,[],TRuleNVsList,[],IArgsList,Simplified,Exploded,Error),
  my_term_variables([H,TB],RVs),
%  var_names(RVs,NVs,RNVs),
  my_var_name_list(RVs,NVs,RNVs),
  reorder_goals_by_efficiency_ruleNVs_list(TRuleNVsList,RuleNVsList).
translate_aggregates((H,NVs),IArgs,[(H,NVs)],[IArgs],_Simplified,_Exploded,_Error).

translate_body_aggregates(T,T,_HVs,_NVs,RuleNVsList,RuleNVsList,IArgsList,IArgsList,_Simplified,_Exploded,_Error) :-
  (atomic(T) ; var(T)),
  !.
translate_body_aggregates(group_by(P,GBVs,C),group_by(TP,GBVs,TC),HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Simplified,Exploded,Error) :-
  !,
  translate_aggregate_goal(P,TP,HVs,NVs,RuleNVsListi,RuleNVsListi1,IArgsListi,IArgsListi1,Exploded,Error),
  translate_aggregate_cond(C,TC,HVs,NVs,RuleNVsListi1,RuleNVsListo,IArgsListi1,IArgsListo,Simplified,Exploded,Error).
translate_body_aggregates(G,TG,HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,_Simplified,Exploded,Error) :-
  G=..[AF,P|Args],
  length([P|Args],Arity),
%  (my_aggregate_relation(AF,Arity) ; (AF,Arity)==(group_by,3)),
  my_aggregate_relation(AF,Arity),
  !,
  translate_aggregate_goal(P,TP,HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Exploded,Error),
  my_term_variables(P,PVs),
  my_intersect_var(HVs,PVs,GBVs),
  insert_into_last_but_one_pos(Args,GBVs,RArgs),
  TG=..[AF,TP|RArgs].
translate_body_aggregates(G,TG,HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Simplified,Exploded,Error) :- 
  G =.. [F|As],
  !, 
  translate_body_aggregates_list(As,RAs,HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Simplified,Exploded,Error),
  TG =.. [F|RAs].
      
translate_body_aggregates_list([],[],_HVs,_NVs,RuleNVsList,RuleNVsList,IArgsList,IArgsList,_Simplified,_Exploded,_Error).
translate_body_aggregates_list([T|Ts],[TT|TTs],HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Simplified,Exploded,Error) :-
  !, 
  translate_body_aggregates(T,TT,HVs,NVs,RuleNVsListi,RuleNVsListi1,IArgsListi,IArgsList1,Simplified,Exploded,Error), 
  translate_body_aggregates_list(Ts,TTs,HVs,NVs,RuleNVsListi1,RuleNVsListo,IArgsList1,IArgsListo,Simplified,Exploded,Error).

translate_aggregate_goal(G,G,_HVs,_NVs,RuleNVsList,RuleNVsList,IArgsList,IArgsList,_Exploded,_Error) :-
  my_literal(G),
  !.
translate_aggregate_goal(G,TP,HVs,NVs,RuleNVsListi,[(':-'(CTP,CTG),CNVs)|RuleNVsListo],IArgsListi,[[]|IArgsListo],true,Error) :-
  translate_body_aggregates(G,TG,HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,_Simplified,_Exploded,Error),
  my_term_variables(G,Vs),
  'Vs2NVs'(Vs,NVs,GNVs),
  remove_non_relevant_vars(TG,GNVs,URNVs),
  filter(GNVs,URNVs,RNVs),
  get_new_predicate_name(p,P),
  build_head(P,RNVs,TP),
  copy_term([TP,TG,NVs],[CTP,CTG,CCNVs]),
  my_term_variables([CTP,CTG],CVs),
  filter_NVs(CCNVs,CVs,CNVs).

translate_aggregate_cond(C,TC,_HVs,NVs,RuleNVsListi,RuleNVsListo,IArgsListi,IArgsListo,Simplified,Exploded,Error) :-
  replace_and_get_aggregates_equalities(C,[],LEQs,NSBody),
  (LEQs == [] ->
    EQs=true
   ;
    my_list_to_tuple(LEQs,EQs)),
  simplify_body(NSBody,Body),
  build_head_from_body(Body,NVs,IArgs,Head),
  Rule = ':-'(Head,Body),
  my_term_variables(Rule,RVs),
%  var_names(RVs,NVs,RNVs),
  my_var_name_list(RVs,NVs,RNVs),
  preprocess((Rule,RNVs),_SiRuleNVList,SfRuleNVList,ExRuleNVList,IArgs,IArgsList1,exec,view,Causes,[],Error),
  (my_member_chk(exploded,Causes) ->
    append_goals(EQs,Head,TC),
    append(RuleNVsListi,ExRuleNVList,RuleNVsListo),
    append(IArgsListi,IArgsList1,IArgsListo),
    Exploded=true
   ;
   (my_member_chk(simplified,Causes) ->
    SfRuleNVList=[(':-'(_TH,TB),_TNVs)],
    append_goals(EQs,TB,TC),
    RuleNVsListo=RuleNVsListi,
    IArgsListo=IArgsListi,
    Simplified=true
    ;
    append_goals(EQs,Body,TC),
    RuleNVsListo=RuleNVsListi,
    IArgsListo=IArgsListi)).

% All variables in the head are input arguments
build_head_from_body(Body,NVs,IArgs,Head) :-  
  my_term_variables(Body,BVs),
  my_reverse(BVs,RBVs),
  my_var_name_list(RBVs,NVs,BNVs),
  remove_non_relevant_vars(Body,BNVs,RNVs), % Non-relevant vars are set vars in aggregates, as X in avg(p(X),X,Y)
  get_new_predicate_name(p,P),
  filter(BNVs,RNVs,ORNVs), % Keep the same order as NVs
  build_head(P,ORNVs,Head),
  my_term_variables(ORNVs,HeadVars),
  get_arg_position_list(HeadVars,HeadVars,IArgs).
    
% Gets equalities aggregate(Variable)=Result from a term including aggregates. It also replaces aggregate(Variable) by Result in the term
replace_and_get_aggregates_equalities(T,Eqs,Eqs,T) :- 
  var(T),
  !.
replace_and_get_aggregates_equalities('$NULL'(ID),Eqs,Eqs,'$NULL'(ID)) :- 
  !.
% replace_and_get_aggregates_equalities(V1=V2,Eqs,Eqs,V1=V2) :- 
%   var(V1),
%   var(V2),
%   !.
replace_and_get_aggregates_equalities(R=C,Eqs,Eqs,R=C) :- 
  var(R),
  var(C),
  !.
replace_and_get_aggregates_equalities(R=C,Eqsi,Eqso,NR=R) :- 
  var(R),
  C =.. [F,_V],
  arithmetic_function(F,_,_,aggregate,_,1),
  !,
  (my_member_var(C,R=C,Eqsi) ->
    Eqso=Eqsi
   ;
    Eqso=[NR=C|Eqsi]).
replace_and_get_aggregates_equalities(C=R,Eqsi,Eqso,NR=R) :- 
  var(R),
  C =.. [F,_V],
  arithmetic_function(F,_,_,aggregate,_,1),
  !,
  (my_member_var(C,R=C,Eqsi) ->
    Eqso=Eqsi
   ;
    Eqso=[NR=C|Eqsi]).
replace_and_get_aggregates_equalities(R=C,Eqsi,Eqso,NR=R) :- 
  var(R),
  atom(C),
  arithmetic_function(C,_,_,aggregate,_,0),
  !,
  (my_member_var(C,R=C,Eqsi) ->
    Eqso=Eqsi
   ;
    Eqso=[NR=C|Eqsi]).
replace_and_get_aggregates_equalities(C=R,Eqsi,Eqso,NR=R) :- 
  var(R),
  atom(C),
  arithmetic_function(C,_,_,aggregate,_,0),
  !,
  (my_member_var(C,R=C,Eqsi) ->
    Eqso=Eqsi
   ;
    Eqso=[NR=C|Eqsi]).
replace_and_get_aggregates_equalities(C,Eqsi,Eqso,R) :- 
  C =.. [F|_Vs],
  arithmetic_function(F,_,_,aggregate,_,_Arity),
  !,
  (my_member_var(C,R=C,Eqsi) ->
    Eqso=Eqsi
   ;
    Eqso=[R=C|Eqsi]).
replace_and_get_aggregates_equalities(T,Eqs,Eqs,T) :- 
  atomic(T),
  !.
replace_and_get_aggregates_equalities(C,Eqsi,Eqso,RC) :- 
  C =.. [F|As],
  replace_and_get_aggregates_equalities_list(As,Eqsi,Eqso,RAs),
  RC =.. [F|RAs].

replace_and_get_aggregates_equalities_list([],Eqs,Eqs,[]) :-
  !.
replace_and_get_aggregates_equalities_list([T|Ts],Eqsi,Eqso,[RT|RTs]) :-
  replace_and_get_aggregates_equalities(T,Eqsi,Eqsi1,RT), 
  replace_and_get_aggregates_equalities_list(Ts,Eqsi1,Eqso,RTs).
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translating outer joins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% translate_outer_joins_list
translate_outer_joins_list([],[],[],[],_Exploded).
translate_outer_joins_list([RNVs|RNVsList],TRNVsList,[IArgs|IArgsListi],IArgsListo,Exploded) :-
  translate_outer_joins(RNVs,IArgs,TRNVsList1,IArgsList1,Exploded),
  translate_outer_joins_list(RNVsList,TRNVsList2,IArgsListi,IArgsList2,Exploded),
  append(TRNVsList1,TRNVsList2,TRNVsList),
  append(IArgsList1,IArgsList2,IArgsListo).

translate_outer_joins((':-'(Head,Body),NVs),IArgs,[(':-'(Head,TBody),TNVs)|RNVsList],[IArgs|IArgsList],Exploded) :-
  !,
  %WARNING: IArgs should be adequately projected
  translate_body_outer_joins(Body,TBody,NVs,[],TRNVsList,[],IArgsList,Exploded),
  my_term_variables([Head,TBody],RVs),
%  var_names(RVs,NVs,TNVs),
  my_var_name_list(RVs,NVs,TNVs),
  reorder_goals_by_efficiency_ruleNVs_list(TRNVsList,RNVsList).
translate_outer_joins(HNVs,IArgs,[HNVs],[IArgs],_Exploded).

translate_body_outer_joins(OJG,TG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo,Exploded) :-
  OJG =.. [OJ,_L,_R,_C],
  my_outer_join_relation(OJ/_Arity),
  !,
  translate_outer_join_argument(OJG,TG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo,Exploded).
translate_body_outer_joins((G,Gs),(TG,TGs),NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo,Exploded) :-
  !,
  translate_body_outer_joins(G,TG,NVs,RNVsListi,RNVsList1,IArgsListi,IArgsList1,Exploded),
  translate_body_outer_joins(Gs,TGs,NVs,RNVsList1,RNVsListo,IArgsList1,IArgsListo,Exploded).
translate_body_outer_joins(G,G,_NVs,RNVsList,RNVsList,IArgsList,IArgsList,_Exploded).
  
my_outer_join_relation(lj/3).
my_outer_join_relation(rj/3).
my_outer_join_relation(fj/3).

translate_outer_join_argument(OJG,TOJG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo,true) :-
  OJG =.. [OJ,L,R,C],
  my_outer_join_relation(OJ/3),
  OJ \== fj,
  !,
  translate_outer_join_argument(L,TL,NVs,RNVsListi,RNVsListL,IArgsListi,IArgsListL,_ExploededL),
  translate_outer_join_argument(R,TR,NVs,RNVsListL,RNVsListR,IArgsListL,IArgsListR,_ExploededR),
  get_new_predicate_name(p,P),
  TL =.. [LF|LFs],
  TR =.. [RF|RFs],
  (my_outer_join_relation(LF/_LFAr) -> (LFs=[XL], XL=..[_XLF|LArgs]) ; TL =.. [_LFT|LArgs]),
  (my_outer_join_relation(RF/_RFAr) -> (RFs=[XR], XR=..[_XRF|RArgs]) ; TR =.. [_RFT|RArgs]),
  append(LArgs,RArgs,Args),
  TG =.. [P|Args],
  TOJG =.. [OJ,TG],
  build_outer_join_tuple(OJ,LArgs,RArgs,NArgs),
  TNG =.. [P|NArgs],
  build_datalog_rules_outer_join(OJ,TG,TL,TR,C,TNG,NVs,RNVsListR,RNVsListo,IArgsListR,IArgsListo).
translate_outer_join_argument(fj(L,R,C),TOJG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo,true) :-
  !,
  translate_outer_join_argument(L,TL,NVs,RNVsListi,RNVsListL,IArgsListi,IArgsListL,_ExploededL),
  translate_outer_join_argument(R,TR,NVs,RNVsListL,RNVsListR,IArgsListL,IArgsListR,_ExploededR),
  get_new_predicate_name(p,P),
  TL =.. [LF|LFs],
  TR =.. [RF|RFs],
  (my_outer_join_relation(LF/_LFAr) -> (LFs=[XL], XL=..[_LFX|LArgs]) ; TL =.. [_LFT|LArgs]),
  (my_outer_join_relation(RF/_RFAr) -> (RFs=[XR], XR=..[_RFX|RArgs]) ; TR =.. [_RFT|RArgs]),
  append(LArgs,RArgs,Args),
  TG =.. [P|Args],
  TOJG =.. [fj,TG],
  build_outer_join_tuple(lj,LArgs,RArgs,LNArgs),
  build_outer_join_tuple(rj,LArgs,RArgs,RNArgs),
  LTNG =.. [P|LNArgs],
  RTNG =.. [P|RNArgs],
  build_datalog_rules_outer_join(fj,TG,TL,TR,C,LTNG,RTNG,NVs,RNVsListR,RNVsListo,IArgsListR,IArgsListo).
translate_outer_join_argument(L,L,_NVs,RNVsList,RNVsList,IArgsList,IArgsList,_Exploded) :-
  my_atom(L),
  !.
translate_outer_join_argument(L,L,_NVs,RNVsList,RNVsList,IArgsList,IArgsList,_Exploded) :-
  my_raise_exception(L,basic_goal,[]).

build_datalog_rules_outer_join(lj,TG,TL,TR,C,TNG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo) :-
  TG =.. [_G|Args],
  get_new_predicate_name(p,P),
  TG1 =.. [P|Args],
  (C == true ->
   copy_term(([':-'(TG,TG1),':-'(TNG,(TL,not(TG1))),':-'(TG1,(TL,TR))],NVs),(Rs,CNVs))
   ;
   copy_term(([':-'(TG,TG1),':-'(TNG,(TL,not(TG1))),':-'(TG1,(TL,TR,C))],NVs),(Rs,CNVs))
  ),
  rule_to_ruleNV_list(Rs,CNVs,RNVsList),
  append(RNVsList,RNVsListi,RNVsListo),
  no_input_arguments_list(Rs,IArgsList), % WARNING: IArgs should be projected.
  append(IArgsList,IArgsListi,IArgsListo).
build_datalog_rules_outer_join(rj,TG,TL,TR,C,TNG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo) :-
  build_datalog_rules_outer_join(lj,TG,TR,TL,C,TNG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo).
build_datalog_rules_outer_join(fj,TG,TL,TR,C,LTNG,RTNG,NVs,RNVsListi,RNVsListo,IArgsListi,IArgsListo) :-
  TG =.. [_G|Args],
  get_new_predicate_name(p,P),
  TG1 =.. [P|Args],
  (C == true ->
   copy_term([':-'(TG,TG1),':-'(LTNG,(TL,not(TG1))),':-'(RTNG,(TR,not(TG1))),':-'(TG1,(TL,TR))],Rs)
   ;
   copy_term([':-'(TG,TG1),':-'(LTNG,(TL,not(TG1))),':-'(RTNG,(TR,not(TG1))),':-'(TG1,(TL,TR,C))],Rs)
  ),
  rule_to_ruleNV_list(Rs,NVs,RNVsList),
  append(RNVsList,RNVsListi,RNVsListo),
  no_input_arguments_list(Rs,IArgsList), % WARNING: IArgs should be projected.
  append(IArgsList,IArgsListi,IArgsListo).

build_outer_join_tuple(lj,LArgs,RArgs,Args) :-
  length(RArgs,N),
  build_null_list(N,NULLs),
  append(LArgs,NULLs,Args).
build_outer_join_tuple(rj,LArgs,RArgs,Args) :-
  length(LArgs,N),
  build_null_list(N,NULLs),
  append(NULLs,RArgs,Args).

build_null_list(0,[]) :-
  !.
build_null_list(N,['$NULL'(_ID)|NULLs]) :-
  N1 is N-1,
  build_null_list(N1,NULLs).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simplify_rules(+DDLsts,-DLsts,?Simplify,-Simplified) 
% Simplifies a list of Datalog rules with equalities
% Equality goals are removed and their arguments unified
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For rules along with NVs
simplify_ruleNVs_list(RuleNVsList,SRuleNVsList,Simplify,Simplified) :-
  my_unzip(RuleNVsList,RuleList,NVsList),
  simplify_rules(RuleList,SRuleList,Simplify,Simplified),
  my_zipWith(',',SRuleList,NVsList,SRuleNVsList).

% For rules 
simplify_rules(Rs,SRs,Simplify,Simplified) :-
  ((simplification(on) ; Simplify==simplify) ->
    force_simplify_rules(Rs,SRs,Simplified)
   ;
    SRs=Rs).

force_simplify_rules([],[],_S).
force_simplify_rules([R|Rs],[SR|SRs],S) :-
  force_simplify_rule(R,SR,S),
  force_simplify_rules(Rs,SRs,S).

%force_simplify_rule(R,SR) :-
%  force_simplify_rule(R,SR,_S).
  
force_simplify_rule(R,SR,S) :-
  R = ':-'(H,B),
  !,
  simplify_body(B,SB,S),
  (SB==true -> SR=H ; SR = ':-'(H,SB)).
force_simplify_rule(R,R,_S).
  
simplify_body(Body,SBody,Simplified) :-
  simplify_body(Body,SBody),
  (Body==SBody ->
   true
   ;
   Simplified=true).

simplify_body((true;Bs),SBs) :-
  !,
  simplify_body(Bs,SBs).
simplify_body((Bs;true),SBs) :-
  !,
  simplify_body(Bs,SBs).
simplify_body((dual;Bs),SBs) :-
  !,
  simplify_body(Bs,SBs).
simplify_body((Bs;dual),SBs) :-
  !,
  simplify_body(Bs,SBs).
% simplify_body((B1s;B2s),SBs) :-
%   !,
%   simplify_body(B1s,SB1s),
%   simplify_body(B2s,SB2s),
%   (SB1s == true ->
%    SBs = SB2s
%    ;
%    (SB2s == true ->
%     SBs = SB1s
%     ;
%     SBs = (SB1s;SB2s))).
simplify_body((B,Bs),SBody) :-
  !,
  simplify_goal(B,SB),
  simplify_body(Bs,SBs),
  append_goals(SB,SBs,SBody).
simplify_body(B,SB) :-
  !,
  simplify_goal(B,SB).
    
% Simplify goal:
% - 'Var is CteExpr' is simplified to 'Var=CteExpr',
%   where CteExpr is ground
simplify_goal(A is B,G) :-
  my_ground(B),
  !,
  eval_expr(B,EB,_),
  simplify_goal(A=EB,G).
% - Expressions in equalities are evaluated
% - Equalities relating variables are unified
% - Equalities relating variables and constants 
%   are NOT unified in order to keep track of types
%   along type inference
simplify_goal(A=B,G) :-
  !,
  (my_ground(A) -> eval_expr(A,EA,_) ; EA = A),
  (my_ground(B) -> eval_expr(B,EB,_) ; EB = B),
  (my_noncompound_term(EA),
   my_noncompound_term(EB),
   \+ (var(EA),
       my_ground(EB)
        ;
       var(EB),
       my_ground(EA))
   ->
    (EA=EB -> G=true ; G=false)
   ;
    G=(EA=EB)).
simplify_goal(not(true),false) :-
  !.
simplify_goal(not(dual),false) :-
  !.
simplify_goal(not(false),true) :-
  !.
simplify_goal(dual,true) :-
  !.
% simplify_goal(not(G),NotG) :-
%   G=..[DLop,L,R],
%   complement_DL_op(DLop,CDLop),
%   !,
%   NotG=..[CDLop,L,R].
simplify_goal(G,G).
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unfold_rules(+DLsts,-UDLsts) 
% Unfold a list of Datalog rules 
% A predicate p with only one rule and one goal so that no 
% negated call to p occurs in other rule is unfolded
% Adapted from 'The Art of Prolog', Sterling & Shapiro, 1986
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

unfold_rules(Program,UProgram) :-
  get_reducibles_transformations(Program,Reducibles,Transformations),
  findall(ReducedRule,
          (my_member(Rule,Reducibles), partial_reduction(Rule,Transformations,ReducedRule)),
          UProgram).
          
partial_reduction(':-'(H,B),Transformations,':-'(RH,RB)) :-  
  !,
  partial_reduction(B,Transformations,RB),
  partial_reduction(H,Transformations,RH).
partial_reduction(true,_Transformations,true) :-
  !.
partial_reduction((A,B),Transformations,Residue) :-
  !,
  partial_reduction(A,Transformations,RA),
  partial_reduction(B,Transformations,RB),
  combine_reductions(RA,RB,Residue).
partial_reduction(A,Transformations,B) :-
  should_fold(A,Transformations,B),
  !.
partial_reduction(A,Transformations,Residue) :-
  should_unfold(A,Transformations),
  !,
  (my_member(':-'(A,B),Transformations)
   ;
   my_member(A,Transformations), B=true
  ),
  partial_reduction(B,Transformations,Residue).
partial_reduction(distinct(A),Transformations,Residue) :-
  should_unfold(A,Transformations),
  (my_member(':-'(A,B),Transformations)
   ;
   my_member(A,Transformations), 
   B=true
  ),
  partial_reduction(B,Transformations,RB),
  my_atom(RB),
  !,
  my_term_variables(A,AVs),
  my_term_variables(B,BVs),
  (my_set_diff(BVs,AVs,[]) ->
    Residue=distinct(RB)
   ;
    Residue=distinct(AVs,RB)).
partial_reduction(distinct(Vs,A),Transformations,distinct(Vs,RB)) :-
  should_unfold(A,Transformations),
  (my_member(':-'(A,B),Transformations)
   ;
   my_member(A,Transformations), B=true
  ),
  partial_reduction(B,Transformations,RB),
  my_atom(RB),
  !.
partial_reduction(A,_Transformations,A).

combine_reductions(true,B,B) :-
  !.
combine_reductions(A,true,A) :-
  !.
combine_reductions(A,B,(A,B)).

should_unfold(A,Transformations) :-
  my_member(':-'(A,_),Transformations).
  
should_fold(_A,_,_B) :-  
  fail.
  
get_reducibles_transformations(Program,Reducibles,Transformations) :-
  get_reducibles_transformations(Program,Program,Reducibles,Transformations).
  
get_reducibles_transformations(_Program,[],[],[]).
get_reducibles_transformations(Program,[Rule|Rules],Reducibles,[Rule|Transformations]) :-
  should_reduce(Rule,Program),
  !,
  get_reducibles_transformations(Program,Rules,Reducibles,Transformations).
get_reducibles_transformations(Program,[Rule|Rules],[Rule|Reducibles],Transformations) :-
  get_reducibles_transformations(Program,Rules,Reducibles,Transformations).

should_reduce(Rule,Program) :-
  Rule=':-'(H,_),
  functor(H,F,A),
  functor(UH,F,A),
  % Check Rule is the only clause for a predicate:
  findall(UH,(my_member(UH,Program) ; my_member(':-'(UH,_),Program)),[UH]),
  % Check that there is at least one positive call for that predicate:
%  findall(UH,(my_member(':-'(_,B),Program),my_list_to_tuple(Bs,B),my_member(UH,Bs)),[_|_]),
  my_member(':-'(_,B),Program),
  my_list_to_tuple(Bs,B),
  my_member(Bi,Bs),
  (Bi=UH ; Bi=distinct(UH) ; Bi=distinct(_,UH))
  ,
  % Check that there are no negated calls for that predicate:
  findall(UH,(my_member(':-'(_,B),Program),my_list_to_tuple(Bs,B),my_member(not(UH),Bs)),[]),
  % Check that the body is not compound if called from a distinct metapredicate:
  ((Bi=distinct(UH) ; Bi=distinct(_,UH)) ->
    no_compound_unfolded_body(UH,Program)
   ;
    true).
  
no_compound_unfolded_body(UH,Program) :-
  my_member(':-'(UH,(_B,_Bs)),Program),
  !,
  fail.
no_compound_unfolded_body(UH,Program) :-
  my_member(':-'(UH,B),Program),
  !,
  no_compound_unfolded_body(B,Program).
no_compound_unfolded_body(_UH,_Program).

% program([:-(accept(Xs1),(initial(Q1),accept(Xs1,Q1,[]))),
%          :-(accept([X2|Xs2],Q2,S2), (delta(Q2,X2,S2,Q12,S12),accept(Xs2,Q12,S12))),
%          :-(accept([],_Q3,[]),true)]).

% reducibles([initial(push),
%             final(pop),
%             delta(push,X,S,push,[X|S]),
%             delta(push,X,S,pop,[X|S]),
%             delta(push,_X,S,pop,S),
%             delta(pop,X,[X|S],pop,S)]).

% should_unfold(A,_) :- 
%   my_member(A,[initial(_Q),              
%                final(_Q),            
%                delta(_A,_B,_C,_D,_E)]).

% should_fold(A,_,B) :-
%   my_member(':-'(A,B),[':-'(accept(Q,Xs,Q1),palindrome(Q,Xs,Q1)),
%                        ':-'(accept(Xs),palindrome(Xs))]).

% program(Program) :-
%   reducibles(Reducibles),
%   transformations(Transformations),
%   append(Reducibles,Transformations,Program).
%   
% program_reducibles_transformations(_Program,Reducibles,Transformations) :-
%   reducibles(Reducibles),
%   transformations(Transformations).
% reducibles([:-(a,b),:-(e,f)]).
% transformations([:-(b,c),:-(c,d),:-(d,e)]).

% test1 :-  
%   program(Program),
%   program_reducibles_transformations(Program,Reducibles,Transformations),
%   my_member(Rule,Reducibles),
%   partial_reduction(Rule,Transformations,ReducedRule),
%   nl,
%   write(ReducedRule),
%   nl,
%   fail.
% test1.  
  

/*********************************************************************/
/* Input Processing                                                  */
/* process_input(+String,-ContinueInputProcessing)                   */
/*********************************************************************/

process_input(end_of_file,yes) :-
  !.
process_input(SInput,Continue) :-
  reset_elapsed_time,
  remove_ending_blanks(SInput,Input),
%  save_state,
  % tapi, cd, ls and dir commands can end with a mandatory dot (e.g., "cd ." or "cd ..")
  ((
    is_tapi_command(Input)
    ;
    ((Command=cd ; Command=ls ; Command=dir), 
     (parse_command(Command,[..],_NVsT,Input,[]); 
      parse_command(Command,[.],_NVsF,Input,[]))
    )
   ) 
   -> 
    CInput=Input, 
    !
   ;
   (append(CInput,".",Input), % Inputs are allowed to end with an optional dot
    !
    ; 
    CInput=Input)
  ),
   ( 
     is_command(CInput),
     !,
     process_command(CInput,Continue)
    ; 
     (
      nl_compact_log,
      save_state,
      (
       blank_input(CInput),
       store_elapsed_time(parsing),
       store_elapsed_time(computation),
       !
      ; 
       process_single_line_remark(CInput), 
       !
      ; 
       process_multi_line_remark(CInput), 
       !
      ;
       language(datalog), 
       (process_datalog(CInput) ->
         true
        ;
         try_to_process_sql(CInput)
        ;
         try_to_process_ra(CInput)
       ),
       !
      ; 
       language(prolog),  
       process_prolog(CInput), 
       !
      ; 
       language(sql),     
       process_sql(CInput), 
       !
      ; 
       language(ra),
       process_ra(CInput),
       !
      ;
       invalid_input(CInput)
      ),
      nl_tapi_log,
      restore_state
     )
   ),
   !.

% remove_ending_blanks   
remove_ending_blanks(L1,L2):-
  remove_ending_blanks(L2,_,L1).

remove_ending_blanks([],X,X) :-
  my_blanks_star(X,[]),
  !.
remove_ending_blanks([X|Xs],Y,[X|Zs]) :-
  remove_ending_blanks(Xs,Y,Zs).
   
% When Datalog prompt is enabled, maybe the user types a SQL statement
% Then, try to process it
try_to_process_sql(CInput) :-
  my_guessed_sql_statement(CInput,_),
  !,
  processC(sql,[],_,_),
  (process_sql(CInput) ->
    processC(datalog,[],_,_)
   ;
    processC(datalog,[],_,_),
    fail
  ).
  
% When Datalog prompt is enabled, maybe the user types a RA expression
% Then, try to process it
try_to_process_ra(CInput) :-
  my_guessed_ra_statement(CInput,_),
  !,
  processC(ra,[],_,_),
  (process_ra(CInput) ->
    processC(datalog,[],_,_)
   ;
    processC(datalog,[],_,_),
    fail
  ).
  
process_command(SCommand,yes) :- 
  lang_interpreter_cmd(Language,SCommand,CInput),
%  my_not(my_blanks_star(CInput,[])),
  CInput\==[],
  !,
  nl_compact_log,
  atom_concat('process_',Language,F),
  P=..[F,CInput],
  (call(P)
   ->
    nl_compact_log
   ;
    process_command_error).
process_command(SCommand,Continue) :- 
  ((parse_command(Command,Arguments,NVs,SCommand,CInput),
    my_blanks_star(CInput,[])) -> 
    store_elapsed_time(parsing),
    nl_tapi_log(Command),
    processC(Command,Arguments,NVs,Continue),
    nl_tapi_log(Command)
   ; 
    nl_compact_log,
    process_command_error
  ).

process_command_error :-
  write_error_log(['Syntax error in command and/or its argument. Type /help for help on commands']),
  nl_compact_log.

process_datalog(CInput) :-
  reset_pred_id,
  (my_blanks_star(CInput,[]) ->  % Switch to Datalog command prompt, empty argument
    true
    ;
    write_verb_list(['Info: Parsing query...',nl])),
  (process_datalog_constraint(CInput),
   !
  ;
   process_datalog_query(CInput), 
   !
  ; 
   process_view(CInput), 
   !
  ; 
   process_autoview(CInput)
  ).

% Processing a Prolog goal  
process_prolog(CInput) :-
  write_verb_list(['Info: Parsing goal...',nl]),
  parse_body(Goal,[],NVs,CInput,[]), 
  write_verb_list(['Info: Goal successfully parsed.',nl]),
  store_elapsed_time(parsing),
  solve_prolog(Goal,NVs).

% Processing a SQL query
process_sql(QueryStr) :-
  write_verb_list(['Info: Parsing query...',nl]),
  parse_sql_query(Query,QueryStr,[]), 
  write_verb_list(['Info: Query successfully parsed.',nl]),
  store_elapsed_time(parsing),
  reset_pred_id,
  solve_sql_query(QueryStr,Query).
% Failing DES SQL parsing of a statement to an ODBC connection does not definitely mean that the statement is wrong
% It will be submitted to the ODBC controller, which will raise an exception if the statement is actually wrong
process_sql(QueryStr) :-
  current_db(Connection,_Handle),
  Connection\=='$des',
  write_verb_list(['Info: Giving up parsing to ODBC controller.',nl]),
  store_elapsed_time(parsing),
  solve_sql_query(QueryStr,unknown).

% Processing a RA query
process_ra(QueryStr) :-
  write_verb_list(['Info: Parsing query...',nl]),
  parse_ra_query(Query,QueryStr,[]), 
  write_verb_list(['Info: Query successfully parsed.',nl]),
  store_elapsed_time(parsing),
  reset_pred_id,
  solve_ra_query(Query).
  
% Processing a Datalog query
process_datalog_query(SBody) :-  
  parse_datalog_query(Body,NVs,SBody,[]),
  write_verb_list(['Info: Query successfully parsed.',nl]),
  store_elapsed_time(parsing),
  compute_datalog_query(Body,NVs,user).  % In response to a user input, output enabled
  
% Aggregates and distinct at the system prompt
compute_datalog_query(Body,NVs,Origin) :-
  functor(Body,AF,Arity),
  (my_aggregate_relation(AF,Arity)
   ;
   (AF,Arity)==(group_by,3)
   ;
   (AF,Arity)==(top,2)
   ;
   (AF,Arity)==(distinct,1)
   ;
   (AF,Arity)==(distinct,2)
  ),
  !,
  remove_non_relevant_vars(Body,NVs,URNVs), % Non-relevant vars are set vars in aggregate predicates, as X in avg(p(X),X,Y)
  filter(NVs,URNVs,RNVs),
  build_head(answer,RNVs,Head),
  Rule = ':-'(Head,(Body,0=0)),
  retract(simplification(S)),
  assertz(simplification(on)),
  retractall(last_autoview(_)),
  assertz(last_autoview(Rule)),
  process_rule((Rule,NVs),Origin,autoview),
  retract(simplification(on)), 
  assertz(simplification(S)).
% Primitives at the system prompt: is/2 and comparison operators (=, <, >, ...)
%   Do not follow et mechanism
compute_datalog_query(Query,NVs,Origin) :-
  is_primitive(Query),
  !,
  build_head(answer,NVs,Head),
  preprocess((':-'(Head,Query),NVs),_SiRNVsList,_SfRNVsList,_ExRNVsList,[],_IArgsList,exec,query,_Causes,[],Error),
  (Error==true ->
    true
   ;
    (compute_primitive(Query,Query) ->
      my_idx_assertz(et(Query,[(-1,[])])),
      ground_nulls, % Needed for, e.g.,  X is null in development mode 
      Success=true
     ;
      Success=false),
    (Origin==user ->
      store_elapsed_time(computation),
      display_solutions(Query,[]),
      display_elapsed_time,
      write_tapi_eot,
      (Success==true -> 
        my_idx_retract(et(Query,[(-1,[])])) 
       ; 
        true
      )
     ;
      true  % If Origin is system, the answer does persist
    )
  ).
% A non-aggregate, non-primitive query
compute_datalog_query(Body,NVs,Origin) :-
  remove_non_relevant_vars(Body,NVs,URNVs), % Non-relevant vars are set vars in aggregates, as X in avg(p(X),X,Y)
  filter(NVs,URNVs,RNVs),
  build_head(answer,RNVs,Head),
  retractall(last_autoview(_)),
  Rule = ':-'(Head,Body),
  process_rule((Rule,NVs),Origin,query).

% Compute the meaning of a given query. No output to the user
compute_datalog(Rule) :-
  Rule=':-'(_H,_B),
  !,
  assign_NVs(Rule,NVs),
  compute_datalog_view((Rule,NVs),system,view).
compute_datalog(Body) :-
  assign_NVs(Body,NVs),
  compute_datalog_query(Body,NVs,system).

% Test whether two predicates P1 and P2 of arity A have the same meaning
same_meaning(P1,P2,A) :-
  et_entries_by_name_arity(P1,A,P1Facts),
  et_entries_by_name_arity(P2,A,P2Facts),
  length(P1Facts,L),
  length(P2Facts,L),
  (L==0 ->
    true
   ;
    P1Facts=[Fact|_Facts],
    Fact=..[F|_Args],
    replace_functor_term_list(P2Facts,F,RP2Facts),
    my_sort(P1Facts,OFacts),
    my_sort(RP2Facts,OFacts)
  ).

% Processing a Datalog constraint
process_datalog_constraint(SConstraint) :-  
  parse_datalog_constraint(Constraint,NVs,SConstraint,[]),
  write_verb_list(['Info: Constraint successfully parsed.',nl]),
  store_elapsed_time(parsing),
  process_datalog_constraints(Constraint,NVs,[],0,exec,_Error).

% Processing a Datalog view
process_view(SRule) :-
  name(':-',[S,D]),
  my_appendfind(SHead,[S,D|SBody],SRule), 
  (parse_head(Head,[],V,SHead,[]) 
   -> 
   true
   ;
   my_raise_exception(generic,syntax(['Syntax error in rule head.']),V)
  ),
  (parse_body(Body,V,NVs,SBody,[])
   -> 
   true
   ; 
   my_raise_exception(generic,syntax(['Syntax error in rule body.']),NVs)
  ),
  write_verb_list(['Info: View successfully parsed.',nl]),
  store_elapsed_time(parsing),
  Rule = ':-'(Head,Body),
  compute_datalog_view((Rule,NVs),user,view).
  
compute_datalog_view((Rule,NVs),Origin,QueryType):-
  retractall(last_autoview(_)),
  assertz(last_autoview(Rule)),
  process_rule((Rule,NVs),Origin,QueryType).

% Processing a Datalog autoview
process_autoview(SBody) :-
  parse_body(Body,[],NVs,SBody,[]),
  remove_non_relevant_vars(Body,NVs,URNVs), 
  filter(NVs,URNVs,RNVs),
  build_head(answer,RNVs,Head),
  write_verb_list(['Info: Query successfully parsed.',nl]),
  store_elapsed_time(parsing),
  Rule = ':-'(Head,Body),
  compute_datalog_view((Rule,NVs),user,autoview).
  
% Processing a Datalog rule (either returning error condition or not)
process_rule(RuleNVs,Origin,QueryType) :-
  process_rule(RuleNVs,Origin,QueryType,_Error).
  
process_rule(RuleNVs,Origin,QueryType,Error) :-
  preprocess(RuleNVs,SiRuleNVsList,SfRuleNVsList,ExRuleNVsList,[],_IArgsList,exec,QueryType,Causes,[],Error),
  (Error==true ->
   true
   ;
   process_compiled_rule(RuleNVs,SiRuleNVsList,SfRuleNVsList,ExRuleNVsList,Origin,QueryType,Causes)
  ).

process_compiled_rule((ORule,NVs),_SiRuleNVsList,SfRuleNVsList,ExRuleNVsList,Origin,QueryType,Causes) :-
  ORule =.. [':-',_OHead,OBody],
  ExRuleNVsList = [_TRuleNVs|RTRuleNVsList],
  SfRuleNVsList = [(SRule,SNVs)|_RSRuleNVsList],
  (SRule =.. [':-',Head,SBody] ; SRule=Head),
  !,
  (basic_query(QueryType,RTRuleNVsList) ->      
    (member(transformed,Causes) ->                 % Basic query with removed anonymous variables from the head
     my_datetime(X),
     build_datalog_rules((':-'(Head,OBody),NVs),ExRuleNVsList,[],asserted(X),DLs),
     my_assertz_list(DLs,Error)
     ;
     true                                          % Basic query: No rules have been added
    )
   ;
   (strata(CurrentStrata),                         % Increased program, compute stratification
    pdg(CurrentPDG),
    my_datetime(X),
    build_datalog_rules((ORule,NVs),ExRuleNVsList,[],asserted(X),DLs),
    my_assertz_list(DLs,Error),
    my_idx_retractall(complete_flag(_G,_CF))
   )
  ),
  (basic_query(QueryType,RTRuleNVsList), \+ member(transformed,Causes) ->         % Basic query: No rules have been added/transformed
    (nonvar(SBody) -> 
      Query = SBody 
     ;
      Query = OBody
    ),
    display_undeclared_predicate(Query)
   ;
    (Query=Head,
%     (functor(Head,F,A),functor(OHead,F,A) -> Head=OHead ; true), % Recover head variable names
     (Origin==system ->                             % Only to compute the meaning, no output to the user
       true
      ;
       write_info_log(['Processing:']),    % A transformed query and/or conjunctive query
       (my_member(exploded,Causes) ->
         write_log('  '),
         write_with_NVs(Query,SNVs),
         write_log_list([nl,'in the program context of the exploded query:',nl]),
         (development(on) -> (DRuleNVsList=ExRuleNVsList) ; (DRuleNVsList=SfRuleNVsList))
         ;
         (development(on) -> (DRuleNVsList=ExRuleNVsList) ; (DRuleNVsList=[(SRule,SNVs)]))
       ),
       display_ruleNVs_list(DRuleNVsList,2)
     ),
     compute_stratification
    )
  ),
  % Simplification may end up with a primitive:
  (is_primitive(Query) ->
     compute_datalog_query(Query,SNVs,Origin)
   ;    
    (
     write_info_verb_log(['Solving query...']),
     solve_datalog_query(Query,Undefined),
     (Origin==system ->                               % Only to compute the meaning, no output
       true
      ;
       store_elapsed_time(computation),
       write_info_verb_log(['Displaying query answer...']),
       display_solutions(Query,Undefined),
       display_elapsed_time,
       write_tapi_eot
     ),
     (basic_query(QueryType,RTRuleNVsList) ->
      (member(transformed,Causes) ->                  % Basic query with removed anonymous variables from the head
       retract_list(DLs,Error),
       reset_et(Origin,CurrentStrata,CurrentPDG)
       ;
       true                                           % Basic query: No rules have been added
      )
      ;
       retract_list(DLs,Error),                       % Transformed query: Added rules have to be removed
       reset_et(Origin,CurrentStrata,CurrentPDG)
     )
    )
  ).

reset_et(QueryOrigin,CurrentStrata,CurrentPDG) :-
	(QueryOrigin==user ->
	 abolishET,                                     % Decrease program, compute stratification
	 load_stratification(CurrentStrata,CurrentPDG)  % TODO: Restore previous state
	;
	 true                                         % ET is kept for system 
	).

basic_query(QueryType,TRules) :-
  QueryType==query, 
  TRules==[].
  
  
build_head(Functor,NVs,Head) :-
  'NVs2Vs'(NVs,Vs),
  Head =.. [Functor|Vs].
  

% Non-relevant vars are set vars in aggregates, as X and Y in avg(p(X,Y),X,Z)
% Consider also: X in count((e(X,Y),avg(f(U,Y),U,A)),X,C)
remove_non_relevant_vars(Body,NVs,RelNVs) :-
  find_non_relevant_vars(Body,NVs,[],RelNVs,[],_NRNVs).

% Relevant vars
relevant_vars(Body,RelVs) :-
  find_non_relevant_vars(Body,[],[],RelNVs,[],_NRNVs),
  my_term_variables(RelNVs,RelVs).

  
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,NRNVs,NRNVs) :-
  var(T),    % Variable
  !,
%  find_var_name_list([T],NVs,RNVs),
  my_var_name_list([T],NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,_NVs,RNVs,RNVs,NRNVs,NRNVs) :-
  atomic(T), % Constant
  !. 
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[Count,_Rel,P,R], % count(Relation,GroupBy,Result)
  atom_concat(count,_Distinct,Count),
  var(P),
  !,                                % Example:     count(e(X,Y,Z),Y,A) : COUNT(y)   - Pivot, no group by
  my_term_variables(T,AllVs),       % All          [X,Y,Z,A]
  my_term_variables([R],RelVs),     % Relevant     [A]
  my_subtract_var(AllVs,RelVs,Vs),  % Non-relevant [X,Y,Z] = All - Relevant
%  find_var_name_list(Vs,NVs,NRNVs),
  my_var_name_list(Vs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[Count,_Rel,GB,R], % count(Relation,GroupBy,Result)
  atom_concat(count,_Distinct,Count),
  my_is_list(GB),
  !,                                % Example:     count(e(X,Y,Z),[Z],A) : COUNT(*) - No pivot, group by
  my_term_variables(T,AllVs),       % All          [X,Y,Z,A]
  my_term_variables([GB,R],RelVs),  % Relevant     [A,Z]
  my_subtract_var(AllVs,RelVs,Vs),  % Non-relevant [X,Y] = All - Relevant
%  find_var_name_list(Vs,NVs,NRNVs),
  my_var_name_list(Vs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[Count,_Rel,R], % count(Relation,Result)
  atom_concat(count,_Distinct,Count),
  !,                                % Example:     count(e(X,Y,Z),A) : COUNT(*)     - No pivot, No group by
  my_term_variables(T,AllVs),       % All          [X,Y,Z,A]
  my_term_variables([R],RelVs),     % Relevant     [A]
  my_subtract_var(AllVs,RelVs,Vs),  % Non-relevant [X,Y,Z] = All - Relevant
%  find_var_name_list(Vs,NVs,NRNVs),
  my_var_name_list(Vs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[AF,_Rel,_P,GB,R], % avg(Relation,Pivot,GroupBy,Result)
  my_aggregate_relation(AF,4),
  !,                                % Example:     avg(e(X,Y,Z),X,[Z],A)            - Pivot, group by (applies also to count)
  my_term_variables(T,AllVs),       % All          [X,Y,Z,A]
  my_term_variables([GB,R],RelVs),  % Relevant     [A,Z]
  my_subtract_var(AllVs,RelVs,Vs),  % Non-relevant [X,Y] = All - Relevant
%  find_var_name_list(Vs,NVs,NRNVs),
  my_var_name_list(Vs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[AF,_Rel,_P,R], % avg(Relation,Pivot,Result)
  my_aggregate_relation(AF,3),
  !,                                % Example:     avg(e(X,Y,Z),X,A)                - Pivot, no group by
  my_term_variables(T,AllVs),       % All          [X,Y,Z,A]
  my_term_variables([R],RelVs),     % Relevant     [A]
  my_subtract_var(AllVs,RelVs,Vs),  % Non-relevant [X,Y,Z] = All - Relevant
%  find_var_name_list(Vs,NVs,NRNVs),
  my_var_name_list(Vs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[group_by,R,GBVs,_H],
  !,                                 % Example:     group_by(employee(N,D,S), [D], R=count(S))
  my_term_variables(T,AllVs),        % All          [N,D,S,R]
  my_term_variables(R,RVs),          % Relevant     [D,R] = All-Non-relevant(Rel)+GB=[N,D,S,R]-[N,D,S]+[D]
  my_subtract_var(AllVs,RVs,SVs),    % Non-relevant [N,S] = All-Relevant
  my_union_var(SVs,GBVs,RelVs),
  my_subtract_var(AllVs,RelVs,NRelVs),
%  find_var_name_list(NRelVs,NVs,NRNVs),
  my_var_name_list(NRelVs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T=..[distinct,GBVs,R],
  !,                                 % Example:     distinct([D],employee(N,D,S))
  my_term_variables(T,AllVs),        % All          [N,D,S]
  my_term_variables(R,RVs),          % Relevant     [D] = All-Non-relevant(Rel)+GB=[N,D,S,R]-[N,D,S]+[D]
  my_subtract_var(AllVs,RVs,SVs),    % Non-relevant [N,S] = All-Relevant
  my_union_var(SVs,GBVs,RelVs),
  my_subtract_var(AllVs,RelVs,NRelVs),
%  find_var_name_list(NRelVs,NVs,NRNVs),
  my_var_name_list(NRelVs,NVs,NRNVs),
  my_union_var(INRNVs,NRNVs,ONRNVs),
%  find_var_name_list(RelVs,NVs,RNVs),
  my_var_name_list(RelVs,NVs,RNVs),
  my_union_var(IRNVs,RNVs,ORNVs).
find_non_relevant_vars(T,NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :- 
  T =.. [_F|As],
  !, 
  find_non_relevant_vars_list(As,NVs,IRNVs,ORNVs,INRNVs,ONRNVs).

find_non_relevant_vars_list([],_NVs,RNVs,RNVs,NRNVs,NRNVs) :-
  !.
find_non_relevant_vars_list([T|Ts],NVs,IRNVs,ORNVs,INRNVs,ONRNVs) :-
  !, 
  find_non_relevant_vars(T,NVs,IRNVs,TRNVs,INRNVs,TNRNVs), 
  find_non_relevant_vars_list(Ts,NVs,TRNVs,ORNVs,TNRNVs,ONRNVs).

% find_non_relevant_vars(e(X,Y),['X'=X,'Y'=Y],[],RVs,[],Vs).      
% Vs = [],
% RVs = ['X'=X,'Y'=Y] ? 

% find_non_relevant_vars((e(X,Y),X>Y),['X'=X,'Y'=Y],[],RVs,[],Vs).
% Vs = [],
% RVs = ['X'=X,'Y'=Y,'X'=X,'Y'=Y] ? 

% find_non_relevant_vars(avg(e(X,Y),X,A),['X'=X,'Y'=Y,'A'=A],[],RVs,[],Vs).
% Vs = ['X'=X,'Y'=Y],
% RVs = ['A'=A] ? 

% find_non_relevant_vars(avg((e(X,Y),X>Y),X,A),['X'=X,'Y'=Y,'A'=A],[],RVs,[],Vs).
% Vs = ['X'=X,'Y'=Y],
% RVs = ['A'=A] ? 

% find_non_relevant_vars(count((f(U,X),avg((e(X,Y),X>Y),X,A)),U,C),['X'=X,'Y'=Y,'A'=A,'U'=U,'C'=C],[],RVs,[],Vs).
% Vs = ['U'=U,'X'=X,'Y'=Y,'A'=A],
% RVs = ['C'=C] ? 

% find_non_relevant_vars(count((f(U,X),avg((e(X,U),X>U),U,A)),U,C),['X'=X,'A'=A,'U'=U,'C'=C],[],RVs,[],Vs).
% Vs = ['U'=U,'X'=X,'A'=A],
% RVs = ['C'=C] ? 

process_single_line_remark(SRemark) :-
  parse_single_line_remark(SRemark,[]), 
  !.

process_multi_line_remark(SRemark) :-
  parse_multi_line_remark(SRemark,[]), 
  !.

blank_input(SBlanks) :-
  my_blanks_star(SBlanks,[]).  

invalid_input(StrInput) :-
  balanced_parentheses(StrInput),
  invalid_input_message.
invalid_input(_StrInput).
  
balanced_parentheses(StrInput) :-
  balanced_parentheses(StrInput,[]),
  !.
balanced_parentheses(_StrInput) :-
  write_error_log(['Unbalanced parentheses.']),
  !,
  fail. 
  
balanced_parentheses -->
  my_chars_but_parentheses.
balanced_parentheses -->
  my_chars_but_parentheses,
  "(",
  balanced_parentheses,
  ")",
  balanced_parentheses. 

my_chars_but_parentheses -->
  [C],
  { [C] \== "(" ,
    [C] \== ")" },
  my_chars_but_parentheses.
my_chars_but_parentheses -->
  [].
    
my_chars_but_opening_parenthesis -->
  [C],
  { [C] \== "(" },
  my_chars_but_opening_parenthesis.
my_chars_but_opening_parenthesis -->
  [].
  
my_chars_but_closing_parenthesis -->
  [C],
  { [C] \== ")" },
  my_chars_but_closing_parenthesis.
my_chars_but_closing_parenthesis -->
  [].
  
invalid_input_message :-
  tapi(on),
  !,
  write_error_log(['Input syntax error']).
invalid_input_message :-
  language(datalog),
  !,
  write_log('Error: Input not recognized as a valid Datalog query, view, autoview or command.'), nl_log, 
  write_log('  Queries  : Atom      |'), nl_log, 
  write_log('             not(Atom) |'), nl_log, 
  write_log('             X Infix Y '), nl_log, 
  write_log('  Views    : Head :- Body'), nl_log, 
  write_log('  Autoviews: Body'), nl_log, 
  write_log('  Commands : /Command Argument(s)'), nl_log, 
  write_log('Queries, views and commands can optionally end with a dot.'), nl_log.
invalid_input_message :-
  language(sql),
  !,
  write_log('Error: Input not recognized as a valid SQL statement or command.'), nl_log, 
  write_log('  Queries : Consult the manual for syntax'), nl_log, 
  write_log('  Commands: /Command Argument(s)'), nl_log, 
  write_log('Queries and commands can optionally end with a semicolon and a dot, resp.'), nl_log.
invalid_input_message :-
  language(ra),
  !,
  write_log('Error: Input not recognized as a valid RA expression or command.'), nl_log, 
  write_log('  Queries : Consult the manual for syntax'), nl_log, 
  write_log('  Commands: /Command Argument(s)'), nl_log, 
  write_log('Queries and commands can optionally end with a semicolon and a dot, resp.'), nl_log.
invalid_input_message :-
  language(prolog),
  !,
  write_log('Error: Input not recognized as a valid Prolog goal or command.'), nl_log, 
  write_log('  Goals   : Atom      |'), nl_log, 
  write_log('            not(Atom) |'), nl_log, 
  write_log('            X Infix Y '), nl_log, 
  write_log('  Commands: /Command Argument(s)'), nl_log, 
  write_log('Queries and commands can optionally end with a dot.'), nl_log.

%% BEGIN TAPI commands and statements
processC(tapi,[Input],_NVs,yes) :-
  !,
  save_state,
  set_flag(tapi,on),
  set_flag(compact_listings,on),
  name(Input,InputStr),
  process_input(InputStr,_Continue),
  restore_state.
processC(test_tapi,[],_NVs,yes) :-
  !,
  write_log_list(['$success',nl]).
%  write_tapi_success.
%% END TAPI commands and statements

processC(sql_left_delimiter,[],_NVs,yes) :-
  !,
  get_dbms(DBMS),
  my_sql_left_quotation_mark(LQstr,DBMS),
  write_string_log(LQstr),
  nl_log.
processC(sql_right_delimiter,[],_NVs,yes) :-
  !,
  get_dbms(DBMS),
  my_sql_right_quotation_mark(RQstr,DBMS),
  write_string_log(RQstr),
  nl_log.

processC(Quit,[],_NVs,no) :- 
  (Quit=q; Quit=quit; Quit=e; Quit=exit; Quit=halt), 
  !, 
  (log(_F,_S) -> processC(nolog,[],_,no) ; true),
  current_db(C,_H),
  (C\=='$des', processC(close_db,[],_,_), fail
   ;
   true),
  halt.
processC(Terminate,[],_NVs,no) :- 
  (Terminate=terminate ; Terminate=t), 
  !.
processC(debug,[],_NVs,yes) :- 
  !,
  debug.
processC(Spy,[Predicate],_NVs,yes) :- 
  Spy=(spy), 
  !,
  my_spy(Predicate).
processC(NoSpyAll,[],_NVs,yes) :- 
  NoSpyAll=nospyall, 
  !,
  my_nospyall.
processC(NoSpy,[Predicate],_NVs,yes) :- 
  NoSpy=nospy, 
  !,
  my_nospy(Predicate).
processC(system,[Goal],_NVs,yes) :- 
  !, 
  (call(Goal) ->
    true
   ;
    write_log_list(['no',nl])
  ).
processC(Shell,[C],_NVs,yes) :- 
  (Shell=shell; Shell=s), 
  !, 
  my_shell(C,S),
  (S=0 -> 
    write_verb_list(['Info: Operating system command executed.',nl])
   ;
    write_log_list([nl,'Error: Operating system command returned exit status: ',S,nl])
  ).
processC(Help,[],_NVs,yes) :- 
  (Help=h; Help=help), 
  !,
  display_help.
processC(Help,[KW],_NVs,yes) :- 
  (Help=h ; Help=help ; Help=apropos), 
  !,
  display_help(KW).
processC(save_ddb,[File],NVs,yes) :-
  !, 
  (my_file_exists(File) ->
    write_log('Info: File exists already. Overwrite? (y/n) [n]: '),
    user_input_string(Str),
    ((Str=="y" ; Str=="Y") ->
      Continue=yes
      ;
     Continue=no)
   ;
    Continue=yes
  ),
  (Continue==yes ->
    processC(save_ddb,[force,File],NVs,yes)
   ;
    true
  ).
processC(save_ddb,[force,File],_NVs,yes) :-
  (log(F,S) ->
    try_close(S), 
    retract(log(F,S))
   ;
    true
  ),
  output(OutputFlag),
  set_flag(output,off),
  processC(log,[write,silent,File],[],yes),
  list_rules_wo_number(0,_DLs),
  list_constraint_rules,
  log(FS,SS),
  try_close(SS), 
  retract(log(FS,SS)),
  (var(F) ->
    true
   ;
    processC(log,[append,silent,F],[],yes)
  ),
  set_flag(output,OutputFlag).
processC(Cat,[File],_NVs,yes) :-
  (Cat=cat ; Cat=type), 
  !, 
  (my_file_exists(File) ->
    cat_file(File),
    nl_log
   ;
    write_warning_log(['File not found ''',File,'''.'])
   ).
processC(Consult,Files,_NVs,yes) :-
  (Consult=consult ; Consult=c ; Consult=restore_ddb), 
  !, 
  (Files=[] ->
    write_warning_log(['Nothing consulted.'])
    ;
    reset_database,
    remove_duplicates_var(Files,UFiles),
    consult_DL_list(UFiles,Success),
    (Success -> compute_stratification ; true)),
    write_tapi_eot.
processC(Reconsult,Files,_NVs,yes) :-
  (Reconsult=reconsult; Reconsult=r), !, 
  (Files=[] ->
    write_warning_log(['Nothing reconsulted.'])
    ;
    abolishET, 
    remove_duplicates_var(Files,UFiles),
    consult_DL_list(UFiles,Success),
    (Success -> compute_stratification ; true)),
    write_tapi_eot.
processC(assert,[T],NVs,yes) :-
  !, 
  assert_rule((T,NVs),[],_ODLIds,Error),
  (Error==true -> 
    true
    ;
    abolishET, 
    drilldown_stratification([T]),
    write_info_verb_log(['Rule asserted.'])
  ).
processC(retract,[R],_NVs,yes) :-
  !, 
  retract_source_rule(R,_Error).
processC(retractall,[H],_NVs,yes) :-
  !, 
  get_source_dlrules(head,H,SDLs),
  (SDLs==[] -> 
    write_warning_log(['Nothing retracted.'])
   ;
    retract_source_dlrule_list(SDLs,RSDLs,RODLs,_Error),
    (RSDLs\==[] ->
      abolishET,
      compute_stratification
     ;
      true
    ),
    display_tuples_and_nbr_info(RSDLs,RODLs)
  ).
processC(abolish,[],_NVs,yes) :-
  !, 
  drop_database.
%   reset_database,
%   reset_stratification,
%   write_info_verb_log(['Program abolished.']).
processC(abolish,[N/A],_NVs,yes) :-
  !,
  get_object_dlrules(namearity,N/A,ODLs),
  (ODLs==[] -> 
    write_warning_log(['Nothing abolished.'])
    ;
    get_source_dlrules(namearity,N/A,SDLs),
    retract_dlrule_list(ODLs,_Error),
    abolishET, 
    rollup_stratification(_Rs),
    display_tuples_and_nbr_info(SDLs,ODLs)
   ).
processC(abolish,[N],_NVs,yes) :-
  !,
  get_object_dlrules(name,N,ODLs),
  (ODLs==[] -> 
    write_warning_log(['Nothing abolished.'])
   ;
    get_source_dlrules(name,N,SDLs),
    retract_dlrule_list(ODLs,_Error),
    abolishET, 
    rollup_stratification(_Rs),
    display_tuples_and_nbr_info(SDLs,ODLs)
  ).
processC(drop_ic,[Constraint],NVs,yes) :-
  !,
  drop_ic(Constraint,NVs).
processC(listing,[],_NVs,yes) :-
  !,
  list_rules(0),
  display_elapsed_time.
processC(listing,[N/A],_NVs,yes) :-
  !,
  list_rules(N,A,0),
  display_elapsed_time.
processC(listing,[N],_NVs,yes) :-
  atom(N),
  !,
  list_rules(N,0),
  display_elapsed_time.
processC(listing,[H],_NVs,yes) :-
  H\=':-'(_H,_T),
  !,
  list_rules_from_head(H,0),
  display_elapsed_time.
processC(listing,[R],_NVs,yes) :-
  !,
  list_rules_from_rule(R,0),
  display_elapsed_time.
processC(list_tables,[],_NVs,yes) :-
  !,
  list_tables.
processC(list_table_schemas,[],_NVs,yes) :-
  !,
  list_table_schemas.
processC(list_views,[],_NVs,yes) :-
  !,
  list_views.
processC(list_view_schemas,[],_NVs,yes) :-
  !,
  list_view_schemas.
processC(list_table_constraints,[Tablename],_NVs,yes) :-
  !,
  exist_table(Tablename),
  list_table_constraints(Tablename),
  write_tapi_eot.
processC(relation_schema,[Relation],_NVs,yes) :-
  !,
  exist_relation(Relation),
  list_relation_schema(Relation),
  write_tapi_eot.
processC(check_db,[],_NVs,yes) :-
  !,
  check_db.
processC(dbschema,[],_NVs,yes) :-
  !,
  list_schema.
processC(dbschema,[N],_NVs,yes) :-
  !,
  exist_relation(N),
  list_schema(N).
processC(list_et,[],_NVs,yes) :-
  !,
  list_et.
processC(list_et,[N/A],_NVs,yes) :-
  !,
  list_et(N/A).
processC(list_et,[N],_NVs,yes) :-
  !,
  list_et(N).
processC(clear_et,[],_NVs,yes) :- 
  !,
  clear_et,
  write_info_verb_log(['Extension table cleared.']).
processC(builtins,[],_NVs,yes) :-
  !,
  list_builtins.
processC(datalog,[],_NVs,yes) :-
  !,
  set_flag(language(datalog)),
  write_info_verb_log(['Switched to Datalog interpreter.']).
processC(prolog,[],_NVs,yes) :-
  !,
  set_flag(language(prolog)),
  write_info_verb_log(['Switched to Prolog interpreter.']).
processC(sql,[],_NVs,yes) :-
  !,
  set_flag(language(sql)),
  write_info_verb_log(['Switched to SQL interpreter.']).
processC(ra,[],_NVs,yes) :-
  !,
  set_flag(language(ra)),
  write_info_verb_log(['Switched to RA interpreter.']).
% processC(sql,[Query],_NVs,yes) :-
%   !,
%   retract(simplification(S)),
%   assertz(simplification(on)),
%   reset_pred_id,
%   solve_sql_query(Query),
%   retract(simplification(on)), % WARNING: If Query fails, simplification mode is lost
%   assertz(simplification(S)).
processC(cd,[],_NVs,yes) :-
  !,
  start_path(Path),
  cd_path(Path).
processC(cd,[Path],_NVs,yes) :-
  !,
  cd_path(Path).
processC(pwd,[],_NVs,yes) :-
  !,
  pwd_path.
processC(LS,[],_NVs,yes) :-
  (LS=ls; LS=dir),
  !,
  ls.
processC(LS,[P],_NVs,yes) :-
  (LS=ls; LS=dir),
  !,
  ls(P).
processC(RM,[FileName],_NVs,yes) :-
  (RM=rm; RM=del),
  !,
  rm_file(FileName).
processC(show_compilations,[],_NVs,yes) :-
  !, 
  show_compilations(Switch),
  write_info_log(['Display of compilations is ', Switch, '.']).
processC(show_compilations,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(show_compilations,'Display of compilations is',Switch).
processC(running_info,[],_NVs,yes) :-
  !, 
  running_info(Switch),
  write_info_log(['Display of running info is ', Switch, '.']).
processC(running_info,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(running_info,'Display of running info is',Switch).
processC(verbose,[],_NVs,yes) :-
  !, 
  verbose(Switch),
  write_info_log(['Verbose output is ', Switch, '.']).
processC(verbose,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(verbose,'Verbose output is',Switch).
processC(duplicates,[],_NVs,yes) :-
  !, 
  duplicates(Switch),
  write_info_log(['Duplicates are ', Switch, '.']).
processC(duplicates,[Switch],_NVs,yes) :-
  !,
  (duplicates(off), Switch==on -> my_idx_retractall(complete_flag(_G,_CF)) ; true),
  process_set_binary_flag(duplicates,'Duplicates are',Switch).
processC(compact_listings,[],_NVs,yes) :-
  !, 
  compact_listings(Switch),
  write_info_log(['Compact listings are ', Switch, '.']).
processC(compact_listings,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(compact_listings,'Compact listings are',Switch).
processC(negation,[],_NVs,yes) :-
  !, 
  neg(Algorithm),
  write_info_log(['Algorithm ''', Algorithm, ''' selected for solving negation.']).
processC(negation,[Algorithm],_NVs,yes) :-
  !, 
  ((Algorithm == strata; Algorithm == et_not) ->
    retractall(neg(_)), 
    assertz(neg(Algorithm)),
    write_info_verb_log(['Algorithm ''', Algorithm, ''' selected for solving negation.'])
    ;
    write_error_log(['Algorithm ''', Algorithm, ''' is not supported. Use ''strata'' or ''et_not''.'])
    ).
processC(timing,[],_NVs,yes) :-
  !, 
  timing(Switch),
  write_info_log(['Elapsed time display is ', Switch, '.']).
processC(timing,[Switch],_NVs,yes) :-
  !, 
  ((Switch == on ; Switch == off ; Switch == detailed ) ->
    retractall(timing(_)), 
    assertz(timing(Switch)),
    (verbose(on) -> processC(timing,[],_,_) ; true)
    ;
    write_error_log(['Incorrect switch. Use ''on'', ''off'' or ''detailed'''])
    ).
processC(pretty_print,[],_NVs,yes) :-
  !, 
  pretty_print(Switch),
  write_info_log(['Pretty print is ', Switch, '.']).
processC(pretty_print,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(pretty_print,'Pretty print is',Switch).
processC(safe,[],_NVs,yes) :-
  !, 
  safe(Switch),
  write_info_log(['Program transformation for safety is ', Switch, '.']).
processC(safe,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(safe,'Program transformation for safety is',Switch).
processC(simplification,[],_NVs,yes) :-
  !, 
  simplification(Switch),
  write_info_log(['Program simplification is ', Switch, '.']).
processC(simplification,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(simplification,'Program simplification is',Switch).
processC(output,[],_NVs,yes) :-
  !, 
  output(Switch),
  write_info_log(['Output is ', Switch, '.']).
processC(output,[Switch],_NVs,yes) :-
  !, 
  ((Switch == on; Switch == off) ->
    retractall(output(_)), 
    assertz(output(Switch)),
    (verbose(on) -> processC(output,[],_,_) ; true)
    ;
   write_error_log(['Incorrect switch. Use ''on'' or ''off'''])
  ).
processC(display_answer,[],_NVs,yes) :-
  !, 
  display_answer(Switch),
  write_info_log(['Display of answers is ', Switch, '.']).
processC(display_answer,[Switch],_NVs,yes) :-
  !, 
  ((Switch == on; Switch == off) ->
    retractall(display_answer(_)), 
    assertz(display_answer(Switch)),
    (verbose(on) -> processC(display_answer,[],_,_) ; true)
    ;
   write_error_log(['Incorrect switch. Use ''on'' or ''off'''])
  ).
processC(multiline,[],_NVs,yes) :-
  !, 
  multiline(Switch),
  write_info_log(['Multiline input is ', Switch, '.']).
processC(multiline,[Switch],_NVs,yes) :-
  !, 
  ((Switch == on; Switch == off) ->
    retractall(multiline(_)), 
    assertz(multiline(Switch)),
    (verbose(on) -> processC(multiline,[],_,_) ; true)
    ;
   write_error_log(['Incorrect switch. Use ''on'' or ''off'''])
  ).
processC(indexing,[],_NVs,yes) :-
  !, 
  indexing(Switch),
  write_info_log(['Hash indexing on extension table is ', Switch, '.']).
processC(indexing,[Switch],_NVs,yes) :-
  !, 
  ((Switch == on; Switch == off) ->
    retractall(indexing(_)), 
    assertz(indexing(Switch)),
    (verbose(on) -> processC(indexing,[],_,_) ; true)
    ;
   write_error_log(['Incorrect switch. Use ''on'' or ''off'''])
  ).
processC(check,[],_NVs,yes) :-
  !, 
  check_ic(Switch),
  write_info_log(['Integrity constraint checking is ', Switch, '.']).
processC(check,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(check_ic,'Integrity constraint checking is',Switch).
processC(hypothetical,[],_NVs,yes) :-
  !, 
  hypothetical(Switch),
  write_info_log(['Hypothetical queries are ', Switch, '.']).
processC(hypothetical,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(hypothetical,'Hypothetical queries are',Switch).
processC(strata,[],_NVs,yes) :-
  !, 
  (strata(S) 
   -> 
   my_quicksort_pred(S,stratum_compare,OS),
   write_log_list([OS,nl])
   ; 
   write_warning_log(['Strata not yet computed.'])
  ).
processC(dependent_relations,[RelationName/Arity],_NVs,yes) :-
%  exist_relation(RelationName),
  dependent_relations(RelationName/Arity,Preds),
  write_list_log(Preds),
  write_tapi_eot.
processC(dependent_relations,[RelationName],_NVs,yes) :-
%  exist_relation(RelationName),
  dependent_relations(RelationName,RelationNames),
  write_list_log(RelationNames),
  write_tapi_eot.
processC(referenced_relations,[RelationName/Arity],_NVs,yes) :-
%  exist_relation(RelationName),
  referenced_relations(RelationName/Arity,Preds),
  write_list_log(Preds),
  write_tapi_eot.
processC(referenced_relations,[RelationName],_NVs,yes) :-
%  exist_relation(RelationName),
  referenced_relations(RelationName,RelationNames),
  write_list_log(RelationNames),
  write_tapi_eot.
processC(pdg,[],_NVs,yes) :-
  !, 
  (pdg((Ns,As))
   -> 
   write_log_list(['Nodes: ',Ns,nl,'Arcs : ',As,nl])
   ; 
   write_info_log(['Predicate dependency graph not yet computed.'])
  ).
processC(pdg,[N/A],_NVs,yes) :-
  !, 
  display_sub_pdg_for(N/A).
processC(pdg,[N],_NVs,yes) :-
  !, 
  display_sub_pdg_for(N/_A).
processC(log,[],_NVs,yes) :-
  !, 
  (log(F,_S)
   -> 
   write_info_log(['Currently logging to ',F,'.'])
   ;
   write_info_log(['Logging disabled.'])
  ).
processC(log,[Mode,Output,File],_NVs,yes) :-
  !, 
  (log(CF,_S) -> 
    write_warning_log(['Currently logging to ''',CF,'''. First, use /nolog for disabling the current log.'])
   ;
   (my_absolute_filename(File,AFN),
    my_dir_file(AFN,AP,_FN),
    (my_directory_exists(AP) ->
      open(AFN,Mode,S),
      assertz(log(AFN,S)), 
      (Output==silent
       ->
       true
       ;
       write_info_verb_log(['Logging enabled to ',AFN,'.'])
      )
     ;
      write_warning_log(['Directory ',AP,' does not exist.'])
    )
   )
  ). 
processC(nolog,[],_NVs,yes) :-
  !, 
  (log(F,S) -> 
   (flush_output(S),
    try_close(S), 
    retract(log(F,S)), 
    write_info_verb_log(['Logging to ', F, ' disabled.']))
   ;
    write_warning_log(['Logging already disabled.'])
  ).
processC(Process,[F],_NVs,yes) :-
  (Process=process ; Process=p), 
  !,
  process_batch(F).
processC(version,[],_NVs,yes) :-
  !, 
  des_version(V), 
  write_info_log(['DES version ',V,'.']).
processC(prolog_system,[],_NVs,yes) :-
  !, 
  prolog_system(_P,V), 
  write_info_log(['Prolog engine: ',V,'.']).
processC(status,[],_NVs,yes) :-
  !, 
  display_status.
processC(open_db,[NewConnection|Opts],_NVs,yes) :-
  !, 
  current_db(CurrentConnection,_Handle),
  (CurrentConnection == '$des' ->
    (empty_des_rdb ->
      my_open_odbc(NewConnection,Opts),
      % The following enables an RDB data source for Datalog queries and programs
      enable_rdb_datasource,
      write_tapi_success
     ;
      write_error_log(['The current DES relational database is not empty. First, use ''drop database'' for removing the current database.'])
    )
   ;
    (CurrentConnection==NewConnection 
     ->
      write_error_log(['The database ''',CurrentConnection,''' is already opened.'])
     ;
     (tapi(off) 
      ->
      write_warning_log(['The database ''',CurrentConnection,''' is still opened.']),
      write_log_list(['         Do you want to close ''',CurrentConnection,''' and open ''',NewConnection,'''? (y/n) ']),
      user_input_string(Str),
      (Str=="" ->
        true
       ;
        ((Str=="y" ; Str=="Y") ->
          processC(close_db,[],[],yes),
          processC(open_db,[NewConnection|Opts],[],yes)
         ;
          true
        )
      )
    )
   ;
    write_error_log(['The database ''',CurrentConnection,''' is still opened.'])
   )
  ).
processC(close_db,[],NVs,yes) :-
  !, 
  current_db(Connection,_Handle),
  (Connection=='$des' ->
    write_warning_log(['There is no opened ODBC database.'])
   ;
    my_close_odbc(Connection),
    processC(clear_et,[],NVs,yes),
    compute_stratification,
    write_tapi_success
  ).
% TODO: Unremark the following when multiple connections are allowed
% processC(close_db,[Connection],_NVs,yes) :-
%   !, 
%   my_close_odbc(Connection).
processC(current_db,[],_NVs,yes) :-
  !, 
  current_db(Connection,_Handle),
  (Connection=='$des' ->
    write_warning_log(['There is no opened ODBC database.'])
   ;
    my_odbc_get_dbms(DBMS),
    write_notapi_info_log(['The current ODBC database is ''',Connection,'''. DBMS: ',DBMS]),
    write_tapi_log_list([Connection,nl,DBMS,nl])).
processC(show_dbs,[],_NVs,yes) :-
  !, 
  current_db(Connection,_Handle),
  write_log_list([Connection,nl]),
  write_tapi_eot.
processC(relation_exists,[Relation],_NVs,yes) :-
  !, 
  (relation_exists(Relation)
   ->
   write_tapi_true
   ;
   write_tapi_false
  ).
processC(is_empty,[Relation],_NVs,yes) :-
  !, 
  exist_relation(Relation),
  (is_empty_relation(Relation)
   ->
   write_tapi_true
   ;
   write_tapi_false
  ).
processC(use_db,[Connection],_NVs,yes) :-
  !, 
  (current_db(Connection,_Handle) 
   ->
   write_warning_log(['Database already in use.'])
   ;
   write_error_log(['Only one database is allowed to be opened at a time.'])
  ).
processC(trace_sql,[ViewName],_NVs,yes) :-
  !, 
  exist_view(ViewName),
  trace_sql(ViewName,preorder).
processC(trace_sql,[ViewName,Ordering],_NVs,yes) :-
  !, 
  exist_view(ViewName),
  trace_sql(ViewName,Ordering).
processC(trace_datalog,[Query],NVs,yes) :-
  !, 
  functor(Query,F,A), 
  exist_user_predicate(F/A),
  trace_datalog(Query,NVs,preorder).
processC(trace_datalog,[Query,Ordering],NVs,yes) :-
  !, 
  trace_datalog(Query,NVs,Ordering).
processC(debug_datalog,[Goal],NVs,yes) :-
  !, 
  functor(Goal,F,A),
  exist_user_predicate(F/A),
  debugGoalLevel(Goal,'p',NVs).
processC(debug_datalog,[Goal,Level],NVs,yes) :-
  !, 
  debugGoalLevel(Goal,Level,NVs).
processC(debug_sql,[ViewName|Options],_NVs,yes) :-
  !, 
  exist_view(ViewName),
  debug_sql(ViewName,Options).
processC(test_case,[ViewName|Options],_NVs,yes) :-
  !, 
  process_test_case(ViewName,Options).
processC(tc_size,[],_NVs,yes) :-
  !, 
  tc_size(Min,Max),
  write_info_log(['Test case size is set between ', Min, ' and ', Max, '.']).
processC(tc_size,[Min,Max],NVs,yes) :-
  !, 
  (number(Min), number(Max), Min>0, Min=<Max ->
    set_flag(tc_size,Min,Max),
    (verbose(on) -> processC(tc_size,[],NVs,_) ; true)
   ;
    write_error_log(['Incorrect parameter(s).'])).
processC(tc_domain,[],_NVs,yes) :-
  !, 
  tc_domain(Min,Max),
  write_info_log(['Test case domain is set between ', Min, ' and ', Max, '.']).
processC(tc_domain,[Min,Max],NVs,yes) :-
  !, 
  (number(Min), number(Max), Min=<Max ->
    set_flag(tc_domain,Min,Max),
    (verbose(on) -> processC(tc_domain,[],NVs,_) ; true)
   ;
    write_error_log(['Incorrect parameter(s).'])).
processC(development,[],_NVs,yes) :-
  !, 
  development(Switch),
  write_info_log(['Development listings are ', Switch, '.']).
processC(development,[Switch],_NVs,yes) :-
  !, 
  process_set_binary_flag(development,'Development listings are',Switch).
processC(Command,_L,_NVs,yes) :-
  !, 
  write_error_log(['Unknown command or incorrect number of arguments. Use /help or /help keyword for help.']),
  display_object_alternatives(command,Command).

  
% Sets a binary flag (on, off values). Called from processC
process_set_binary_flag(FlagFunctor,Message,Switch) :-
  Flag=..[FlagFunctor,VarSwitch],
  ((Switch == on; Switch == off) ->
    (Switch == on, call(Flag), VarSwitch==on ->
      write_info_log(['',Message,' already enabled.'])
     ;
      (Switch == off, call(Flag), VarSwitch==off ->
        write_info_log(['',Message,' already disabled.'])
       ;
        set_flag(FlagFunctor,Switch),
        write_info_verb_log(['',Message,' ', Switch, '.'])
      )
    )
   ;
    write_error_log(['Incorrect switch. Use ''on'' or ''off'''])
  ).
  
% Help system
% Commands
% CategoryOrder allows ordered listings. It should not be viewed as a category identifier
% command_category(CategoryOrder,CategoryName).
command_category(10,'DES Database').
command_category(20,'ODBC Database').
command_category(30,'Debugging and Test Case Generation').
command_category(40,'Tabling').
command_category(50,'Operating System').
command_category(60,'Log').
command_category(70,'Informative').
command_category(80,'Query Languages').
command_category(85,'TAPI').
command_category(90,'Miscellanea').
command_category(100,'Implementors').
% command(CategoryOrder,CommandOrder,CommandType:(c)ommand|(s(Cmd))horthand|(s(Cmd))ynonim),Command,Arguments,ShortDescription,ExtendedDescription)
% CommandOrder allows ordered listings. It should not be viewed as a command identifier
command(10,10,c,'[','Filenames]','Consult Datalog files, abolishing previous rules','Load the Datalog programs found in the comma-separated list [Filenames], discarding the rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed. Arguments in the list are comma-separated').
command(10,20,c,'[+','Filenames]','Consult Datalog files, keeping previous rules','Load the Datalog programs found in the comma-separated list Filenames, keeping rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed.').
command(10,30,c,'abolish','','Abolish all Datalog rules','Delete all the loaded rules, including those which are the result of SQL compilations. User-defined integrity constraints are removed. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,40,c,'abolish','Name','Abolish all Datalog rules matching a predicate name','Delete all the loaded rules for the predicates matching Name, including those which are the result of SQL compilations. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,50,c,'abolish','Name/Arity','Abolish all Datalog rules matching the pattern','Delete all the loaded rules for the predicate matching the pattern Name/Arity, including those which are the result of SQL compilations. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,60,c,'assert','Head:-Body','Assert a rule. :-Body is optional (for facts)','Add a Datalog rule. If Body is not specified, it is simply a fact. Rule order is irrelevant for Datalog computation. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,70,c,'consult','Filename','Consult a Datalog file, abolishing previous rules','Load the Datalog program found in the file Filename, discarding the rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed. The default extension .dl for Datalog programs can be omitted').
command(10,75, s(consult,'Filename'),'c','Filename','Shorthand for /consult Filename','Load the Datalog program found in the file Filename, discarding the rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed. The default extension .dl for Datalog programs can be omitted').
command(10,80,c,'check_db','','Check database consistency w.r.t. declared integrity constraints','Check database consistency w.r.t. declared integrity constraints (types, existency, primary key, candidate key, foreign key, functional dependency, and user-defined). Displays a report with the outcome').
command(10,85,c,'drop_ic','Constraint','Drop an integrity constraint','Drop the specified integrity constraint, which starts with '':-'' (either one of :-nn(Table,Columns), :-pk(Table,Columns), :-ck(Table,Columns), :-fk(Table,Columns,RTable,RColumns), :-fd(Table,Columns,DColumns), :-Goal, where Goal specifies a user-defined integrity constraint). Only one constraint can be dropped at a time. TAPI enabled').
command(10,90,c,'listing','listing','List the loaded Datalog rules','List the loaded Datalog rules. Neither integrity constraints nor SQL views and metadata are displayed').
command(10,100,c,'listing','Name','List the loaded Datalog rules matching Name','List the loaded Datalog rules matching Name. Neither integrity constraints nor SQL views and metadata are displayed').
command(10,110,c,'listing','Name/Arity','List Datalog rules matching the pattern','List the loaded Datalog rules matching the pattern Name/Arity. Neither integrity constraints nor SQL views and metadata are displayed').
command(10,120,c,'listing','Head','List Datalog rules whose head is subsumed by Head','List the Datalog loaded rules whose heads are subsumed by the head Head. Neither integrity constraints nor SQL views and metadata are displayed').
command(10,130,c,'listing','Head:-Body','List Datalog rules that are subsumed by Head:-Body','List the Datalog loaded rules that are subsumed by Head:-Body. Neither integrity constraints nor SQL views and metadata are displayed').
command(10,140,c,'reconsult','Filename','Consult a Datalog file, keeping previous rules','Load a Datalog program found in the file Filename, keeping the rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,150,s(reconsult,'Filename'),'r','Filename','Shorthand for /reconsult Filename','Load a Datalog program found in the file Filename, keeping the rules already loaded. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,160,c,'restore_ddb','Filename','Restore the Datalog database in Filename','Restore the Datalog database in the given Filename (same as consult). Constraints (type, not nullables, primary key, candidate key, functional dependency, foreign key, and user-defined) are also restored, if present in Filename').
command(10,170,c,'retract','Head:-Body','Retract a rule. :-Body is optional (for facts)','Delete the first Datalog rule that unifies with Head:-Body (or simply with Head, if Body is not specified. In this case, only facts are deleted). The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,180,c,'retractall','Head','Retract all rules matching the given head','Delete all the Datalog rules whose heads unify with Head. The extension table is cleared, and the predicate dependency graph and strata are recomputed').
command(10,190,c,'save_ddb','[force] Filename','Save the current Datalog database to a file','Save the current Datalog database to the file Filename. If option ''force'' is included, no question is asked to the user should the file exists already. Constraints (type, not nullables, primary key, candidate key, functional dependency, foreign key, and user-defined) are also saved').
command(20,200,c,'open_db','Conn [Opts]','Open and set the current ODBC connection','Open and set the current ODBC connection to Name, where Opts=[user(Username)] [password(Password)]. This connection must be already defined at the OS layer. TAPI enabled').
command(20,210,c,'close_db','','Close the current ODBC connection','Close the current ODBC connection. TAPI enabled').
command(20,220,c,'current_db','','Display the current ODBC connection info','Display the current ODBC connection name and DSN provider. TAPI enabled').
%command(20,225,c,'show_dbs','','Display the current opened databases','Display the current opened databases, handled by DES and external DBMS''s').
%command(20,225,c,'use_db','Conn','Make Conn the current database','Make Conn the current database, handled by DES or by an external DBMS').
command(30,230,c,'debug_datalog','Goal [Level]','Debug a Datalog basic goal','Start the debugger for the basic goal Goal at predicate or clause levels, which is indicated with the options p and c for Level, respectively. Default is p').
command(30,240,c,'debug_sql','View [Opts]','Debug a SQL view','Debug a SQL view where:\n           Opts=[trust_tables([yes|no])] [trust_file(FileName)] [order([dq|preorder])].\n           Defaults are: trust tables, no trust file, and preorder').
command(30,250,c,'trace_datalog','Goal [Order]','Trace a Datalog basic goal','Trace a Datalog goal in the given order (postorder or the default preorder)').
command(30,260,c,'trace_sql','View [Order]','Trace a SQL view in preorder (default) or postorder','Trace a SQL view in the given order (postorder or the default preorder)').
command(30,270,c,'test_case','View [Opts]','Generate test case classes for the given view','Generate test case classes for the view View. Options may include a class and/or an action parameters. The test case class is indicated by the values all (positive-negative, the default), positive, or negative in the class parameter. The action is indicated by the values display (only display tuples, the default), replace (replace contents of the involved tables by the computed test case), or add (add the computed test case to the contents of the involved tables) in the action parameter').
command(30,280,c,'tc_size','Min Max','Bound the test case size','Set the minimum and maximum number of tuples generated for a test case').
command(30,290,c,'tc_size','','Display the test case size bounds','Display the minimum and maximum number of tuples generated for a test case').
command(30,300,c,'tc_domain','Min Max','Set the domain of values for test cases','Set the domain of values for test cases between Min and Max').
command(30,310,c,'tc_domain','','Display the domain of values for test cases','Display the domain of values for test cases').
command(40,320,c,'clear_et','','Clear the extension table','Delete the contents of the extension table').
command(40,330,c,'list_et','','List extension table contents','List the contents of the extension table in lexicographical order. First, answers are displayed, then calls').
command(40,340,c,'list_et','Name','List extension table contents matching a name','List the contents of the extension table matching Name. First, answers are displayed, then calls').
command(40,350,c,'list_et','Name/Arity','List extension table contents matching the pattern','List the contents of the extension table matching the pattern Name/Arity. First, answers are displayed, then calls').
command(50,360,c,'cat','Filename','Type the contents of Filename','Type the contents of Filename enclosed between the following lines: %% BEGIN AbsoluteFilename %% %% END   AbsoluteFilename %%').
command(50,370,c,'cd','Path','Set the current directory to Path','Set the current directory to Path').
command(50,380,c,'cd','','Set current directory to the one DES was started from','Set the current directory to the directory where DES was started from').
command(50,385,y(rm,'Filename'),'del','Filename','Synonym for /rm Filename','Synonym for /rm Filename').
command(50,390,y(ls,''),'dir','','Synonym for /ls','Synonym for /ls').
command(50,400,y(ls,'Path'),'dir','Path','Synonym for /ls Path','Synonym for /ls Path').
command(50,410,c,'ls','','Display the contents of the current directory','Display the contents of the current directory in alphabetical order. First, files are displayed, then directories').
command(50,420,c,'ls','Path','Display the contents of the given directory','Display the contents of the given directory in alphabetical order. It behaves as /ls').
command(50,430,c,'pwd','','Display the current directory','Display the absolute filename for the current directory').
command(50,435,c,'rm','Filename','Delete Filename','Delete (remove) Filename').
command(50,440,c,'shell','Command','Submit Command to the OS shell','Submit Command to the operating system shell\nNotes for platform specific issues:\n* Windows users:\n  command.exe is the shell for Windows 98, whereas cmd.exe is the one for Windows NT/2000/2003/XP/Vista/7.\n* Ciao users:\n  The environment variable SHELL must be set to the required shell.\n* SICStus users:\n  Under Windows, if the environment variable SHELL is defined, it is expected to name a Unix like shell, which will be invoked with the option -c Command. If SHELL is not defined, the shell named by COMSPEC will be invoked with the option /C Command.\n* Windows and Linux/Unix executable users:\n  The same note for SICStus is applied.').
command(50,450,s(shell,'Command'),'s','Command','Shorthand for /shell','Shorthand for /shell').
command(50,460,y(cat,'Filename'),'type','Filename','Synonym for /cat Filename','Synonym for /cat Filename').
command(60,470,c,'log','','Display the current log file, if any','Display the current log file, if any').
command(60,480,c,'log','[Mode] Filename','Set the current log to the given filename','Set the current log to the given filename and mode: write (overwrite existing file, if any, or creates a new one) or append (append to the contents of the existing file)').
command(60,490,c,'nolog','','Disable logging','Disable logging').
command(70,500,y(help,'Keyword'),'apropos','Keyword','Shorthand for /help Keyword','Shorthand for /help Keyword').
command(70,510,c,'builtins','','List predefined operators, functions, and predicates','List predefined operators, functions, and predicates').
command(70,520,c,'check','','Display whether integrity constraint checking is enabled','Display whether integrity constraint checking is enabled').
command(70,525,c,'compact_listings','','Display whether compact listings are enabled','Display whether compact listings are enabled (on) or not (off)').
command(70,530,c,'dbschema','','Display the database schema','Display the database schema: Tables, views and constraints').
command(70,535,c,'dbschema','Name','Display the database schema for the given view or table','Display the database schema for the given view or table name. TAPI enabled').
command(70,540,c,'dependent_relations','Name','Display relations that directly depend on relation Name','Display the names of relations that directly depend on relation Name. TAPI enabled').
command(70,545,c,'dependent_relations','Name/Arity','Display relations that directly depend on relation Name/Arity','Display in format Name/Arity those relations that directly depend on relation Name/Arity. TAPI enabled').
command(70,550,c,'development','','Display whether development listings are enabled','Display whether development listings are enabled').
command(70,555,c,'development','Switch','Enable or disable development listings','Enable or disable development listings (on or off, resp.). These listings show the source-to-source translations needed to handle null values, Datalog outer join built-ins, and disjunctive literals').
command(70,560,c,'display_answer','','Display whether display of computed tuples is enabled','Display whether display of computed tuples is enabled').
command(70,565,c,'display_answer','Switch','Enable or disable display of computed tuples','Enable or disable display of computed tuples (on or off, resp.) The number of tuples is still displayed').
command(70,570,c,'duplicates','','Display whether duplicates are enabled','Display whether duplicates are enabled').
command(70,580,c,'help','','Display this help','Display detailed help').
command(70,590,s(help,''),'h','','Shorthand for /help','Shorthand for /help').
command(70,600,c,'help','Keyword','Detailed help on Keyword','Detailed help on Keyword, which can be a command or built-in').
command(70,610,s(help,'Keyword'),'h','Keyword','Shorthand for /help Keyword','Shorthand for /help Keyword').
command(70,611,c,'hypothetical','','Display whether whether hypothetical SQL queries are enabled','Display whether hypothetical SQL queries are enabled (on) or not (off)').
command(70,612,c,'is_empty','Name','Display whether the given relation is empty','Display $true if the given relation is empty, and $false otherwise. TAPI enabled').
command(70,614,c,'list_table_schemas','','List table schemas','List table schemas. TAPI enabled').
command(70,616,c,'list_table_constraints','Name','List table constraints for the given table name','List table constraints for the given table name. TAPI enabled').
command(70,617,c,'list_tables','','List table names','List table names. TAPI enabled').
command(70,618,c,'list_view_schemas','','List view schemas','List view schemas. TAPI enabled').
command(70,619,c,'list_views','','List views','List view schemas. TAPI enabled').
command(70,620,c,'negation','','Display the selected algorithm for solving negation','Display the selected algorithm for solving negation (strata or et_not)').
command(70,625,c,'output','','Display whether display output is enabled','Display whether display output is enabled (on) or not (off)').
command(70,630,c,'pdg','','Display the current predicate dependency graph','Display the current predicate dependency graph').
command(70,632,c,'pdg','N','Display the predicate dependency graph restricted to predicate N','Display the current predicate dependency graph restricted to predicate N').
command(70,632,c,'pdg','N/A','Display the predicate dependency graph restricted to predicate N/A','Display the current predicate dependency graph restricted to predicate N/A').
command(70,635,c,'pretty_print','','Display whether pretty print listings is enabled','Display whether pretty print listings is enabled').
command(70,640,c,'pretty_print','Switch','Enable or disable pretty print','Enable or disable pretty print for listings (on or off, resp.)').
command(70,642,c,'referenced_relations','Name','Display relations directly referenced by a foreign key in Name','Display the name of relations that are directly referenced by a foreign key in relation Name. TAPI enabled').
command(70,644,c,'referenced_relations','Name/Arity','Display relations directly referenced by a foreign key in Name/Arity','Display the name of relations that are directly referenced by a foreign key in relation Name/Arity. TAPI enabled').
command(70,646,c,'relation_exists','Name','Display whether relation Name exists','Display $true if the given relation exists, and $false otherwise. TAPI enabled').
command(70,650,c,'relation_schema','Name','Display relation schema of relation Name','Display relation schema of relation Name. TAPI enabled').
command(70,652,c,'running_info','','Display whether running information is to be displayed','Display whether running information (as the incremental number of consulted rules as they are read) is to be displayed').
command(70,653,c,'running_info','Switch','Enable display of running information','Enable or disable display of running information, as, e.g., the incremental number of consulted rules as they are read (on or off, resp.)').
command(70,655,c,'prolog_system','','Display the underlying Prolog engine version','Display the underlying Prolog engine version').
command(70,660,c,'safe','','Display whether safety transformation is enabled','Display whether safety transformation is enabled').
command(70,665,c,'show_compilations','','Display whether compilations are to be displayed','Display whether compilations from SQL DQL statements to Datalog rules are to be displayed').
command(70,668,c,'show_compilations','Switch','Enable display of compilations','Enable or disable display of extended information about compilation of SQL DQL statements to Datalog clauses (on or off, resp.)').
command(70,670,c,'simplification','','Display whether program simplification is enabled','Display whether program simplification is enabled').
command(70,672,c,'sql_left_delimiter','','Display the SQL left delimiter of current DBMS','Display the SQL left delimiter as defined by the current database manager (either DES or the external DBMS via ODBC). TAPI enabled').
command(70,675,c,'sql_right_delimiter','','Display the SQL right delimiter of current DBMS','Display the SQL right delimiter as defined by the current database manager (either DES or the external DBMS via ODBC). TAPI enabled').
command(70,680,c,'status','','Display the current status of the system','Display the current system status, i.e., verbose mode, the selected negation algorithm, logging, elapsed time display, program transformation, and system version').
command(70,690,c,'strata','','Display the currente stratification','Display the current stratification as a list of pairs (PredName/Arity, Stratum)').
command(70,700,c,'timing','','Display whether elapsed time display is enabled','Display whether elapsed time display is enabled').
command(70,710,c,'timing','Switch','Sets the required level of elapsed time display','Disable or enable either a basic or detailed elapsed time display (off, on, detailed, resp.)').
command(70,720,c,'verbose','','Display whether verbose output is enabled','Display whether verbose output is either enabled or disabled (on or off, resp.)').
command(70,730,c,'verbose','Switch','Enable or disable verbose output messages','Enable or disable verbose output messages (on or off, resp.)').
command(70,740,c,'version','','Display the current DES system version','Display the current DES system version').
command(80,750,c,'datalog','','Switch to Datalog interpreter','Switch to Datalog interpreter (all queries are parsed and executed first by Datalog engine. If it is not a Datalog query, then it is tried first as a SQL statement. If it is neither SQL, finally it is tried as an RA expression)').
command(80,760,c,'datalog','Query','Trigger Datalog evaluation for Query','Trigger Datalog resolution for the query Query (the query is parsed and executed in Datalog, but if a parsing error is found, it is tried first as a SQL statement and second as an RA expression)').
command(80,770,c,'prolog','','Switch to Prolog interpreter','Switch to Prolog interpreter (all queries are parsed and executed in Prolog)').
command(80,780,c,'prolog','Goal','Trigger Prolog evaluation for Goal','Trigger Prolog''s SLD resolution for the goal Goal.').
command(80,782,c,'ra','','Switch to RA interpreter','Switch to RA interpreter (all queries are parsed and executed by RA processor)').
command(80,785,c,'ra','RA_expression','Trigger RA evaluation for RA_expression','Trigger RA evaluation for RA_expression').
command(80,790,c,'sql','','Switch to SQL interpreter','Switch to SQL interpreter (all queries are parsed and executed by SQL processor)').
command(80,795,c,'sql','SQL_statement','Trigger SQL evaluation for SQL_statement','Trigger SQL resolution for SQL_statement').
command(80,800,c,'hypothetical','Switch','Enable or disable SQL hypothetical queries','Enable or disable hypothetical SQL queries (on or off, resp.)').
command(85,802,c,'tapi','Input','Process Input and format its output for TAPI communication','Process Input (either a command or query) and format its output for TAPI communication').
command(85,805,c,'test_tapi','','Test the current TAPI connection','Test the current TAPI connection. Return $success upon a successful communication. TAPI enabled').
command(90,808,c,'check','Switch','Enable or disable integrity constraint checking','Enable or disable integrity constraint checking (on or off, resp.)').
command(90,810,c,'compact_listings','Switch','Enable or disable compact listings','Enable or disable compact listings (on or off, resp.)').
command(90,812,c,'multiline','','Display whether multi-line input is enabled','Display whether multi-line input is enabled').
command(90,815,c,'multiline','Switch','Enable or disable multi-line input','Enable or disable  multi-line input (on or off resp.). When enabled, Datalog inputs must end with a dot (.) and SQL inputs with a semicolon (;). When disabled, each line is considered as a single (Datalog or SQL) input and ending characters are optional').
command(90,820,c,'duplicates','Switch','Enable or disable duplicates','Enable or disable duplicates (on or off, resp.)').
command(90,830,c,'negation','Algorithm','Set an algorithm for solving negation','Set the required Algorithm for solving negation (strata or et_not)').
command(90,840,c,'halt','','Quit DES','Quit DES. The Prolog host is also exited').
command(90,850,c,'output','Switch','Enable or disable display output','Enable or disable display output (on or off, resp.)').
command(90,860,c,'process','Filename','Process the contents of Filename','Process the contents of Filename as if they were typed at the system prompt').
command(90,870,s(process,'Filename'),'p','Filename','Shorthand for /process Filename','Shorthand for /process Filename').
command(90,880,y(halt,''),'quit','','Synonym for /halt','Synonym for /halt').
command(90,890,s(quit,''),'q','','Shorthand for /quit','Shorthand for /quit').
command(90,900,y(halt,''),'exit','','Synonym for /halt','Synonym for /halt').
command(90,910,s(exit,''),'e','','Shorthand for /exit','Shorthand for /exit').
command(90,920,c,'safe','Switch','Enable or disable safety transformation','Enable or disable program transformation (on or off, resp.)').
command(90,930,c,'simplification','Switch','Enable or disable program simplification','Enable or disable program simplification (on or off, resp.). Rules with equalities, true, and not(BooleanValue) are simplified').
command(100,940,c,'debug','','Enable debugging in the host Prolog interpreter','Enable debugging in the host Prolog interpreter').
command(100,941,c,'indexing','','Display whether hash indexing is enabled','Display whether hash indexing on extension table is enabled').
command(100,942,c,'indexing','Switch','Enable or disable hash indexing','Enable or disable hash indexing on extension table (on or off, resp.) Default is enabled, which shows a noticeable speed-up gain in some cases').
command(100,945,c,'nospyall','','Remove all Prolog spy points','Remove all Prolog spy points in the host Prolog interpreter. Disable debugging').
command(100,950,c,'nospy','Pred[/Arity]','Remove the spy point on the given predicate','Remove the spy point on the given predicate in the host Prolog interpreter').
command(100,955,c,'spy','Pred[/Arity]','Set a spy point on the given predicate','Set a spy point on the given predicate in the host Prolog interpreter. Binary distributions do not support spy point. Use source distributions instead').
command(100,960,c,'system','','Submit a goal to the host system','Submit a goal to the host Prolog system').
command(100,965,c,'terminate','','Terminate the current DES session','Terminate the current DES session without halting the host Prolog system').
command(100,970,s(terminate,''),'t','','Shorthand for /terminate','Shorthand for /terminate').

% List help on commands

display_help :-
  write_log_list(['Available Commands:',nl]),
  setof(CategoryId-Category-Commands,
        (command_category(CategoryId,Category),
         setof(command(CategoryId,CommandId,c,Command,Arguments,ShortDesc,ExtDesc), 
               command(CategoryId,CommandId,c,Command,Arguments,ShortDesc,ExtDesc),
               Commands)),
        IdsCategoriesCommands),
  display_categories_commands(IdsCategoriesCommands),
  write_log_list(['Any other input is evaluated as a Prolog goal, SQL or Datalog query, ', nl,
                  'view or autoview, depending on the prompt.', nl,
                  'Type des. if you get out of DES from a Prolog interpreter.', nl,
                  'Type /help keyword for detailed help on <keyword>', nl,
                  'Type /builtins for help on built-ins', nl]).
  
display_categories_commands([]).
display_categories_commands([_CategoryId-Category-Commands|Tail]) :-
  write_log_list(['* ',Category,':',nl]),
  my_apply(display_command_short,Commands),
  display_categories_commands(Tail).

display_command_short(command(_CategoryId,_CommandId,_CommandType,Command,Arguments,ShortDesc,_ExtDesc)) :-
  atom_concat_list(['   /',Command,' ',Arguments],ACommand),
  atom_length(ACommand,Length),
  (Length >= 24 -> write_log_list([ACommand,nl]), my_spaces(24,S), write_log_list([S]) ; write_unquoted_tab_log(ACommand,24)),
  write_log_list([ShortDesc,nl]),
  display_command_shorthands(24,Command,Arguments),
  display_command_synonyms(24,Command,Arguments).

display_command_shorthands(Tab,Cmd,CmdArgs) :-
  setof(BCommand,
        CategoryId^CommandId^Command^Arguments^ShortDesc^ExtDesc^(command(CategoryId,CommandId,s(Cmd,CmdArgs),Command,Arguments,ShortDesc,ExtDesc),atom_concat('/',Command,BCommand)),
        LShorthands),
  !,
  my_list_to_tuple(LShorthands,TShorthands),
  (LShorthands=[_] -> P='' ; P='s'),
  my_spaces(Tab,S),
  write_log_list([S,'Shorthand',P,': ',TShorthands,nl]).
display_command_shorthands(_Tab,_Cmd,_CmdArgs).
  
display_command_synonyms(Tab,Cmd,CmdArgs) :-
  setof(BCommand,CategoryId^CommandId^Command^Arguments^ShortDesc^ExtDesc^(command(CategoryId,CommandId,y(Cmd,CmdArgs),Command,Arguments,ShortDesc,ExtDesc),atom_concat('/',Command,BCommand)),LSynonyms),
  !,
  my_list_to_tuple(LSynonyms,TSynonyms),
  (LSynonyms=[_] -> P='' ; P='s'),
  my_spaces(Tab,S),
  write_log_list([S,'Synonym',P,': ',TSynonyms,nl]).
display_command_synonyms(_Tab,_Cmd,_CmdArgs).
  
% List help on keyword. It can be either a command or built-in
  
display_help(KW) :-
  findall(KW,display_help_command(KW,_Args),CKWs),
  findall(KW,display_help_builtins(KW),BKWs),
  append(CKWs,BKWs,[_|_]).
display_help(KW) :-
  write_warning_log(['Unknown keyword ''',KW,'''']),
  display_object_alternatives(command,KW),
  display_object_alternatives(builtin,KW).
  
display_help_command(Command,Arguments) :-
  setof(command(CategoryId,CommandId,Type,Command,Arguments,ShortDesc,ExtDesc), 
        command(CategoryId,CommandId,Type,Command,Arguments,ShortDesc,ExtDesc),
        Commands),
  !,
  my_apply(display_command_extended,Commands).
  
display_help_builtins(KW) :-
  list_builtins(KW),
  !.
  
  
display_command_extended(command(_CategoryId,_CommandId,CommandType,Command,Arguments,_ShortDesc,ExtDesc)) :-
  write_log_list(['/',Command,' ',Arguments,' : ',ExtDesc,nl]),
  display_command_shorthands(0,Command,Arguments),
  display_command_synonyms(0,Command,Arguments),
  (CommandType=y(Cmd,CmdArgs) -> display_help_command(Cmd,CmdArgs) ; true),
  (CommandType=s(Cmd,CmdArgs) -> display_help_command(Cmd,CmdArgs) ; true).
  
% Cat a file

cat_file(File) :-
  my_absolute_filename(File,CFN),
  write_log_list(['%% BEGIN ',CFN,' %%',nl]),
  open(CFN,read,Hin),
  process_cat_file(Hin),
  write_log_list(['%% END   ',CFN,' %%']).
  
process_cat_file(Hin) :-  
  repeat,
    get_char(Hin,C),
    (
      C==end_of_file,
      try_close(Hin)
     ;
      write_log(C),
      fail
    ).
    
  
debugGoalLevel(Goal,Level,NVs) :-
  (filet(_F,_Fid) -> 
   functor(Goal,Pred,Arity),
   pdg((Nodes,_Arcs)),
   (my_member(Pred/Arity,Nodes) ->
    ((Level == c ; Level == p) ->
      solve_datalog_query(Goal,_Undefined),
     !, 
     write_info_verb_log(['Starting declarative debugger...']), 
     initDebug(Goal, Level, NVs)
    ;
    write_error_log(['Unsupported option ''',Level,'''.']))
   ;
   write_error_log(['Predicate ',Pred/Arity,' does not exist.']))
  ; 
  write_log('Error: Program not yet loaded.'), nl_log).

process_test_case(ViewName,Options) :-
  (my_view('$des',ViewName,_A,_S,_Lang,_D,_I,_L,_SC) ->
    (get_tc_options(Options,Class,Action) ->
      compute_test_case(ViewName,Class,Action)
     ;
     write_error_log(['Incorrect option(s): ',Options,'.'])
    )
   ;
    write_error_log(['View ''',ViewName,''' is not defined.']),
    display_view_alternatives(ViewName)
   ).

get_tc_options([],all,display).
get_tc_options([Opt],Class,Action) :-
  (Opt=Class,
   tc_class_option(Class),
   Action=display,
   !
  ;
   Opt=Action,
   tc_action_option(Action),
   Class=all).
get_tc_options([Opt1,Opt2],Class,Action) :-
  (Class=Opt1,
   Action=Opt2,
   tc_class_option(Opt1),
   tc_action_option(Opt2),
   !
  ;
   Class=Opt2,
   Action=Opt1,
   tc_class_option(Opt2),
   tc_action_option(Opt1)).
   
tc_class_option(all).
tc_class_option(positive).
tc_class_option(negative).

tc_action_option(display).
tc_action_option(replace).
tc_action_option(add).

/*********************************************************************/
/* Parsing                                                           */
/*********************************************************************/

%
% Parsing commands
%

is_command(CInput) :-
  command_begin(CInput,_).
  
is_tapi_command(Cs) :-
  is_tapi_command(Cs,_).

is_tapi_command -->
  command_begin,
  my_blanks_star, 
  "tapi",
  my_blanks.

command_begin -->
  my_blanks_star,
  "/*",
  {!,
   fail}.
command_begin -->
  my_blanks_star,
  "/".
  
parse_command(tapi,[Input],[]) -->
  command_begin,
  my_blanks_star, 
  "tapi",
  my_blanks,
  !,
  my_chars(Cs),
  {name(Input,Cs)},
  my_blanks_star.
parse_command(log,[append,normal,File],[]) -->
  command_begin,
  my_blanks_star, 
  "log",
  my_blanks,
  "append",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(log,[write,normal,File],[]) -->
  command_begin,
  my_blanks_star, 
  "log",
  my_blanks,
  "write",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(log,[write,normal,File],[]) -->
  command_begin,
  my_blanks_star, 
  "log",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(log,[],[]) -->
  command_begin,
  my_blanks_star, 
  "log",
  my_blanks_star,
  !.
parse_command(save_ddb,[force,File],[]) -->
  command_begin,
  my_blanks_star, 
  "save_ddb",
  my_blanks,
  "force",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(save_ddb,[File],[]) -->
  command_begin,
  my_blanks_star, 
  "save_ddb",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(restore_ddb,[File],[]) -->
  command_begin,
  my_blanks_star, 
  "restore_ddb",
  my_blanks,
  my_charsbutcomma(Cs),
  {name(File,Cs)},
  my_blanks_star,
  !.
parse_command(reconsult,Files,[]) -->
  command_begin,
  my_blanks_star, 
  "[+",
  my_blanks_star,
  my_arguments(Files),
  my_blanks_star,
  "]",
  my_blanks_star,
  !.
parse_command(consult,Files,[]) -->
  command_begin,
  my_blanks_star,
  "[",
  my_blanks_star,
  my_arguments(Files),
  my_blanks_star,
  "]",
  my_blanks_star,
  !.
parse_command(drop_ic,[Constraint],NVs) -->
  command_begin,
  my_blanks_star,
  "drop_ic",
  parse_datalog_constraint(Constraint,NVs),
  !.
% parse_command(datalog,[Goal],NVs) -->
%   command_begin,
%   my_blanks_star,
%   my_command(datalog),
%   " ",
%   !,
%   my_blanks_star,
%   my_body(Goal,[],NVs),
%   my_blanks_star. 
% parse_command(prolog,[Goal],NVs) -->
%   command_begin,
%   my_blanks_star,
%   my_command(prolog),
%   " ",
%   !,
%   my_blanks_star,
%   my_body(Goal,[],NVs),
%   my_blanks_star. 
parse_command(dependent_relations,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(dependent_relations),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(dependent_relations,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(dependent_relations),
  my_blanks,
  my_user_identifier(N),
  my_blanks_star,
  !.
parse_command(referenced_relations,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(referenced_relations),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(referenced_relations,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(referenced_relations),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(spy,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(spy),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(nospy,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(nospy),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(system,[Goal],[]) -->
  command_begin,
  my_blanks_star,
  my_command(system),
  my_blanks,
  my_body(Goal,[],_NVs),
  my_blanks_star,
  !.
parse_command(abolish,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(abolish),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(list_schema,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(list_schema),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(dbschema,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(dbschema),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(relation_schema,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(relation_schema),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(relation_exists,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(relation_exists),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(is_empty,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(relation_exists),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(list_table_constraints,[TableName],[]) -->
  command_begin,
  my_blanks_star,
  my_command(list_table_constraints),
  my_blanks,
  my_sql_user_identifier(TableName),
  my_blanks_star.
parse_command(list_et,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(list_et),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(listing,[R],[]) -->
  command_begin,
  my_blanks_star,
  my_command(listing),
  my_blanks,
  my_rule(R,[],_NVs),
  my_blanks_star.
parse_command(listing,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(listing),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(listing,[H],[]) -->
  command_begin,
  my_blanks_star,
  my_command(listing),
  my_blanks,
  my_head(H,[],_NVs),
  my_blanks_star,
  !.
parse_command(listing,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(listing),
  my_blanks,
  my_sql_user_identifier(N),
  my_blanks_star,
  !.
parse_command(pdg,[N/A],[]) -->
  command_begin,
  my_blanks_star,
  my_command(pdg),
  my_blanks,
  my_pattern(N/A),
  my_blanks_star,
  !.
parse_command(pdg,[N],[]) -->
  command_begin,
  my_blanks_star,
  my_command(pdg),
  my_blanks,
  my_user_identifier(N),
  my_blanks_star,
  !.
parse_command(retract,[Rule],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(retract),
  " ",
  !,
  my_blanks_star,
  my_rule(Rule,[],NVs),
  my_blanks_star.
parse_command(retractall,[Head],[]) -->
  command_begin,
  my_blanks_star,
  my_command(retractall),
  " ",
  !,
  my_blanks_star,
  my_head(Head,[],_NVs),
  my_blanks_star.
parse_command(assert,[Rule],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(assert),
  " ",
  !,
  parse_rule(Rule,[],NVs),
  my_blanks_star.
parse_command(open_db,[Connection|Options],_NVs) -->
  command_begin,
  my_blanks_star,
  my_command(open_db),
  my_blanks,
  !,
  my_symbol(Connection),
  my_blanks_star,
  my_atoms_star(Options,[],_),
  my_blanks_star.
parse_command(debug_datalog,[Goal,Level],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(debug_datalog),
  my_blanks,
  my_literal(Goal,[],NVs),
  my_blanks,
  my_symbol(Level),
  my_blanks_star,
  !.
parse_command(debug_datalog,[Goal],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(debug_datalog),
  my_blanks,
  !,
  my_literal(Goal,[],NVs),
  my_blanks_star.
parse_command(debug_sql,[ViewName,Opt1,Opt2,Opt3],[]) -->
  command_begin,
  my_blanks_star,
  my_command(debug_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_atom(Opt1,[],[]),
  my_blanks,
  my_atom(Opt2,[],[]),
  my_blanks,
  my_atom(Opt3,[],[]),
  my_blanks_star,
  !.
parse_command(debug_sql,[ViewName,Opt1,Opt2],[]) -->
  command_begin,
  my_blanks_star,
  my_command(debug_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_atom(Opt1,[],[]),
  my_blanks,
  my_atom(Opt2,[],[]),
  my_blanks_star,
  !.
parse_command(debug_sql,[ViewName,Opt],[]) -->
  command_begin,
  my_blanks_star,
  my_command(debug_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_atom(Opt,[],[]),
  my_blanks_star,
  !.
parse_command(debug_sql,[ViewName],[]) -->
  command_begin,
  my_blanks_star,
  my_command(debug_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks_star,
  !.
parse_command(trace_sql,[ViewName,Ordering],[]) -->
  command_begin,
  my_blanks_star,
  my_command(trace_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_symbol(Ordering),
  my_blanks_star,
  !.
parse_command(trace_sql,[ViewName],[]) -->
  command_begin,
  my_blanks_star,
  my_command(trace_sql),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks_star,
  !.
parse_command(trace_datalog,[Query,Ordering],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(trace_datalog),
  my_blanks,
  my_literal(Query,[],NVs),
  my_blanks,
  my_symbol(Ordering),
  my_blanks_star,
  !.
parse_command(trace_datalog,[Query],NVs) -->
  command_begin,
  my_blanks_star,
  my_command(trace_datalog),
  my_blanks,
  my_literal(Query,[],NVs),
  my_blanks_star,
  !.
parse_command(test_case,[ViewName,Opt1,Opt2],[]) -->
  command_begin,
  my_blanks_star,
  my_command(test_case),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_symbol(Opt1),
  my_blanks,
  my_symbol(Opt2),
  my_blanks_star,
  !.
parse_command(test_case,[ViewName,Opt],[]) -->
  command_begin,
  my_blanks_star,
  my_command(test_case),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks,
  my_symbol(Opt),
  my_blanks_star,
  !.
parse_command(test_case,[ViewName],[]) -->
  command_begin,
  my_blanks_star,
  my_command(test_case),
  my_blanks,
  my_sql_user_identifier(ViewName),
  my_blanks_star,
  !.
parse_command(tc_size,[Min,Max],[]) -->
  command_begin,
  my_blanks_star,
  my_command(tc_size),
  my_blanks,
  !,
  my_integer(Min),
  my_blanks_star,
  my_integer(Max),
  my_blanks_star.
parse_command(tc_domain,[Min,Max],[]) -->
  command_begin,
  my_blanks_star,
  my_command(tc_domain),
  my_blanks,
  !,
  my_integer(Min),
  my_blanks_star,
  my_integer(Max),
  my_blanks_star.
parse_command(Command,[],[]) -->
  command_begin,
  my_blanks_star,
  my_command(Command),
  my_blanks_star
  %,!
  .
parse_command(Command,Arguments,[]) -->
  %WARNING: This is needed to avoid the cut in the clause above. SP4 differently translates cuts in DCGs
  {Arguments\==[]},
  command_begin,
  my_blanks_star,
  my_command(Command),
  my_blanks,
  my_arguments(Arguments),
  my_blanks_star.

my_command(Command) -->
  my_identifier_chars(Cs),
  {to_lowercase_list(Cs,LCs),
   name(Command,LCs)}.

my_arguments([]) -->
  [].
my_arguments([A|As]) -->
  my_charsbutcomma(Cs),
  my_blanks_star,
  ",",
  my_blanks_star,
  {name(A,Cs)},
  my_arguments(As).
my_arguments([A]) -->
  my_charsbutcomma(Cs),
  {name(A,Cs)}.

my_charsbutcomma([C|Cs]) -->
  my_charbutcomma(C),
  my_charsbutcomma(Cs).
my_charsbutcomma([C]) -->
  my_charbutcomma(C).

my_charbutcomma(C) -->
  [C],
  {[C] \= ","}.

my_pattern(N/A) -->
  my_blanks_star,
  my_user_identifier(N),
  my_blanks_star,
  "/",
  my_blanks_star,
  my_positive_integer(A),
  my_blanks_star.

% User identifiers for both SQL and Datalog
my_user_identifier(I) -->
  my_sql_user_identifier(I).
my_user_identifier(I) -->
  my_symbol(I).
  
  
%
% Parsing queries
%

parse_datalog_query(Term,Vo) -->
  my_blanks_star,
  my_literal(NTerm,[],Vo),
  my_blanks_star,
  {!,
   abstract_nulls(NTerm,ATerm),
   concrete_nulls(ATerm,Term,_Grounded)}.

  
%
% Parsing rules: Nulls are uniquelly grounded
%

parse_rule(Rule,Vi,Vo) -->
  my_blanks_star,
  my_head(NHead,Vi,Vo1),
  my_blanks_star,
  ":-",
  my_blanks_star,
  !,
  {redef_error(NHead)},
  my_body(NBody,Vo1,Vo),
  my_blanks_star,
  {NRule=':-'(NHead,NBody),
   abstract_nulls(NRule,ARule),
   concrete_nulls(ARule,Rule,_Grounded)}.  

parse_rule(Rule,Vi,Vo) -->
  my_blanks_star,
  my_head(NHead,Vi,Vo),
  my_blanks_star,
  {!,
   redef_error(NHead),
   abstract_nulls(NHead,AHead),
   concrete_nulls(AHead,Rule,_Grounded)}.
%  !.  % This cut should be before abstract_nulls. SWI Prolog incorrectly translates this DCG

   
%
% Parsing rule heads: Nulls are uniquelly grounded
%

parse_head(Head,Vi,Vo) -->
  my_blanks_star,
  my_atom(NHead,Vi,Vo),
  my_blanks_star,
  {!,
   redef_error(NHead),
   abstract_nulls(NHead,AHead),
   concrete_nulls(AHead,Head,_Grounded)}.
%  !.  % This cut should be before abstract_nulls. It seems that SWI-Prolog incorrectly translates this DCG
  
redef_error(Term) :-
   Term =.. [F|As],
   length(As,A),
   (my_infix_relation(F,_), A=2       -> redefinition_error(F,A); true),
   (my_builtin_relation(F,A,_,_)      -> redefinition_error(F,A); true),
%  (my_infix_comparison(F,_), A=2     -> redefinition_error(F,A); true), % Infix comparison operators are rejected when parsing
%  (my_infix_arithmetic(F,_), A=2     -> redefinition_error(F,A); true), % Names of arithmetic Built-ins can be reused because of their scope
   (F = (','), A=2                    -> redefinition_error(F,A); true),
   (F = 'not', A=1                    -> redefinition_error(F,A); true),
   (F = 'answer'                      -> redefinition_error(F,A); true).

  
   
%
% Parsing rule bodies: Nulls are uniquelly grounded
%

parse_body(Body,Vi,Vo) -->
  my_blanks_star,
  my_body(NBody,Vi,Vo),
  my_blanks_star,
  {!,
   abstract_nulls(NBody,ABody),
   concrete_nulls(ABody,Body,_Grounded)}.


%
% Parsing single line remarks: lines starting with % or -- are interpreted as single line remarks
%

parse_single_line_remark -->
  parse_datalog_single_line_remark.
parse_single_line_remark -->
  parse_sql_single_line_remark.
  
%  Datalog
parse_datalog_single_line_remark -->
  my_blanks_star,
  "%",
  my_chars_star_up_to_EOL(_).
  
%  SQL
parse_sql_single_line_remark -->
  my_blanks_star,
  "--",
  my_chars_star_up_to_EOL(_).

my_chars_star_up_to_EOL([]) -->
  [EOL],
  {my_end_of_input(EOL,_),
   !}.
my_chars_star_up_to_EOL([C|Cs]) -->
  [C],
  my_chars_star_up_to_EOL(Cs).
my_chars_star_up_to_EOL([]) -->
  [].

%
% Parsing multi-line remarks: lines starting with /* and ending with */ are interpreted as multi-line remarks
%

parse_multi_line_remark -->
  my_blanks_star,
  my_multi_line_remark,
  my_blanks_star.
  
my_multi_line_remark -->
  "/*",
  my_remark_body,
  "*/".

my_remark_body -->
  my_chars_star_but_multi_line_remark_delimiters,
  my_multi_line_remark,
  my_chars_star_but_multi_line_remark_delimiters.
my_remark_body -->
  my_chars_star_but_multi_line_remark_delimiters.
      
my_chars_star_but_multi_line_remark_delimiters -->
  [].
my_chars_star_but_multi_line_remark_delimiters -->
  "/*",
  {!,fail}.
my_chars_star_but_multi_line_remark_delimiters -->
  "*/",
  {!,fail}.
my_chars_star_but_multi_line_remark_delimiters -->
  [_C],
  my_chars_star_but_multi_line_remark_delimiters.

%
% Rules, heads, bodies and queries
%

my_rule(':-'(H,B),Vi,Vo) -->
  my_blanks_star,
  my_head(H,Vi,Vo1),
  my_blanks_star,
  ":-",
  my_blanks_star,
  my_body(B,Vo1,Vo),
  my_blanks_star.
my_rule(H,Vi,Vo) -->
  my_blanks_star,
  my_head(H,Vi,Vo),
  my_blanks_star.

my_head(H,Vi,Vo) -->
  my_atom(H,Vi,Vo).

my_body(B,Vi,Vo) -->
  my_literals(B,Vi,Vo).

%my_query(Q,Vi,Vo) -->
%  my_literal(Q,Vi,Vo).


%
% Constants, Variables, Terms, Atoms, Literals
%

my_constant(A) -->
  my_number(A).
my_constant(A) -->
  my_symbol(A),
  {A\=null}.

my_variable(V,Vi,Vo) -->
  my_uppercase(C),
  my_identifier_chars(Cs),
  {name(N,[C|Cs]),
   append_NV(N,V,Vi,Vo)}.
my_variable(V,Vi,Vo) -->
  my_uppercase(C),
  {name(N,[C]),
   append_NV(N,V,Vi,Vo)}.
my_variable(V,Vi,Vo) -->
  "_",
  my_underscored_variable_chars(Cs),
  {[US] = "_",
   name(N,[US|Cs]),
   append_NV(N,V,Vi,Vo)}.
my_variable(V,Vi,Vo) -->
  "_",
  {append_NV('_',V,Vi,Vo)}.
  
my_variable_or_number(V,Vi,Vo) -->
  my_variable(V,Vi,Vo).
my_variable_or_number(N,Vi,Vi) -->
  my_number(N).

my_variable_or_integer(V,Vi,Vo) -->
  my_variable(V,Vi,Vo).
my_variable_or_integer(N,Vi,Vi) -->
  my_integer(N).

%my_variable_or_star_in_aggr(V,_AF,Vi,Vo) -->
%  my_variable(V,Vi,Vo).
%my_variable_or_star_in_aggr(*,count,Vi,Vi) -->
%  "*".

my_noncompound_terms([T|Ts],Vi,Vo) -->
  my_noncompound_term(T,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_noncompound_terms(Ts,Vo1,Vo).
my_noncompound_terms([T],Vi,Vo) -->
  my_noncompound_term(T,Vi,Vo).

my_noncompound_term('$NULL'(_ID),V,V) -->
  "null".
my_noncompound_term(A,V,V) -->
  my_constant(A).
my_noncompound_term(A,Vi,Vo) -->
  my_variable(A,Vi,Vo).
my_noncompound_term('$NULL'(ID),V,V) -->
  "'$NULL'(",
  my_integer(ID),
  ")".
my_noncompound_term('$NULL'(ID),Vi,Vo) -->
  "'$NULL'(",
  my_variable(ID,Vi,Vo),
  ")".

my_atom(A,Vi,Vo) -->
  my_symbol(F),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_noncompound_terms(Ts,Vi,Vo),
  my_blanks_star,
  ")",
  {A =.. [F|Ts],
   length(Ts,L),
   not_builtin(F/L)}.
my_atom(A,Vi,Vo) -->
  my_noncompound_term(L,Vi,Vo1),
  my_blanks_star,
  my_infix_comparison(P),
  my_blanks_star,
  my_noncompound_term(R,Vo1,Vo), 
  my_blanks_star,
  {A =.. [P,L,R]}.
my_atom(A,Vi,Vo) -->
  my_noncompound_term(L,Vi,Vo1),
  my_blanks,
  "is",
  my_blanks,
  my_arithmeticexp(R,Vo1,Vo),
  my_blanks_star,
  {A =.. [is,L,R]}.
my_atom(A,Vi,Vo) -->
  my_expression(L,Vi,Vo1),
  my_blanks_star,
  my_infix_comparison(Op),
  my_blanks_star,
  my_expression(R,Vo1,Vo),
  my_blanks_star,
  {A =.. [Op,L,R]}.
my_atom(A,V,V) -->
  my_symbol(A).
  
my_atoms_star([A,B|As],Vi,Vo) -->
  my_atom(A,Vi,Vo1),
  my_blanks,
  my_atoms_star([B|As],Vo1,Vo).
my_atoms_star([A],Vi,Vo) -->
  my_atom(A,Vi,Vo),
  my_blanks_star.
my_atoms_star([],V,V) -->
  [].  

% my_literals(L,Vi,Vo) -->
%   my_b_literals(L,Vi,Vo).
% my_literals(L,Vi,Vo) -->
%   my_ub_literals(L,Vi,Vo).

% my_ub_literals((T,Ts),Vi,Vo) -->
%   my_literal(T,Vi,Vo1),
%   my_blanks_star,
%   ",",
%   my_blanks_star,
%   my_literals(Ts,Vo1,Vo).
% my_ub_literals(T,Vi,Vo) -->
%   my_literal(T,Vi,Vo).

% my_literal(L,Vi,Vo) -->  
%   my_b_literal(L,Vi,Vo).
% my_literal(L,Vi,Vo) -->  
%   my_ub_literal(L,Vi,Vo).

% my_b_literal(L,Vi,Vo) -->
%   "(",
%   my_blanks_star,
%   my_literal(L,Vi,Vo),
%   my_blanks_star,
%   ")".
%   
% my_ub_literal(';'(L1,L2),Vi,Vo) -->  
%   my_b_literals(L1,Vi,Vo1),
%   my_blanks_star,
%   ";",
%   my_blanks_star,
%   my_literals(L2,Vo1,Vo).
% my_ub_literal(';'(L1,L2),Vi,Vo) -->  
%   my_basic_literal(L1,Vi,Vo1),
%   my_blanks_star,
%   ";",
%   my_blanks_star,
%   my_literals(L2,Vo1,Vo).
% my_ub_literal(L,Vi,Vo) -->  
%   my_basic_literal(L,Vi,Vo).


my_literal(L,Vi,Vo) -->
  my_basic_literal(L,Vi,Vo).

my_literals(L,Vi,Vo) -->
  my_dl_term(T,Vi,Vo1),
  my_literals_r(T,L,Vo1,Vo).
  
my_literals_r(E0,E,Vi,Vo) --> 
  my_once_blanks_star, 
  {my_literal_priority_operator(low,SOP,OP)}, % Low
  my_string(SOP),
  my_once_blanks_star, 
  my_dl_term(T,Vi,Vo1),
  {TOP =.. [OP,E0,T]},
  my_literals_r(TOP,E,Vo1,Vo).
my_literals_r(E,E,V,V) -->
  [].
  
my_dl_term(T,Vi,Vo) --> 
  my_dl_power(P,Vi,Vo1),
  my_dl_term_r(P,T,Vo1,Vo).
  
my_dl_term_r(T0,T,Vi,Vo) --> 
  my_once_blanks_star, 
  {my_literal_priority_operator(medium,SOP,OP)}, % Medium
  my_string(SOP),
  my_once_blanks_star, 
  my_dl_power(P,Vi,Vo1),
  {TOP =.. [OP,T0,P]},
  my_dl_term_r(TOP,T,Vo1,Vo).
my_dl_term_r(T,T,V,V) -->
  [].
  
my_dl_power(P,Vi,Vo) --> 
  my_basic_literal(F,Vi,Vo1),
  my_dl_power_r(F,P,Vo1,Vo).
  
my_dl_power_r(P0,TOP,Vi,Vo) --> 
  my_once_blanks_star, 
  {my_literal_priority_operator(high,SOP,OP)},
  my_string(SOP), 
  my_once_blanks_star, 
  my_basic_literal(P1,Vi,Vo1),
  {TOP =.. [OP,P0,P]},
  my_dl_power_r(P1,P,Vo1,Vo).
my_dl_power_r(P,P,V,V) -->
  [].

  
my_literal_priority_operator(low,"=>",'=>').
my_literal_priority_operator(low,";",';').
my_literal_priority_operator(medium,",",',').
%my_literal_priority_operator(high,"\\+",'\\+').


% my_b_literals(L,Vi,Vo) -->
%   "(",
%   my_blanks_star,
%   my_literals(L,Vi,Vo),
%   my_blanks_star,
%   ")".
  
%
% Parsing Datalog constraints
%

parse_datalog_constraint(Constraint,Vo) -->
  my_blanks_star,
  ":-",
  my_blanks_star,
  my_datalog_constraint(Constraint,[],Vo),
  my_blanks_star,
  !.

my_datalog_constraint(Constraint,Vi,Vo) -->
  my_predef_datalog_constraints(Constraint,Vi,Vo),
  {!}.
my_datalog_constraint(my_integrity_constraint(Preds,Constraint),Vi,Vo) -->
  my_body(Constraint,Vi,Vo),
  {user_predicates_rule(':-'(Constraint),Preds)}.

my_predef_datalog_constraints((Ctr,Ctrs),Vi,Vo) -->
  my_predef_datalog_constraint(Ctr,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_predef_datalog_constraints(Ctrs,Vo1,Vo).
my_predef_datalog_constraints(Ctr,Vi,Vo) -->
  my_predef_datalog_constraint(Ctr,Vi,Vo),
  my_blanks_star.

% Type declaration: 
%   type(pred,[colname:type]) % colname and type
%   type(pred,[type])         % only type, colnames are assigned as $1, $2, ...
% A propositional relation can also be declared as
%   type(pred,[])
my_predef_datalog_constraint(type(Pred,Types),V,V) -->
  my_kw("TYPE"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_ctr_types(Types),
  my_blanks_star,
  ")".
% Alternative type declaration
%   type(pred(colname:type, ...)) % colname and type
%   type(pred(type,...))          % only type, colnames are assigned as $1, $2, ...
% A propositional relation can also be declared as
%   type(pred)
my_predef_datalog_constraint(type(Pred,Types),V,V) -->
  my_kw("TYPE"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_sequence_of_ctr_types(Types),
  my_blanks_star,
  ")",
  my_blanks_star,
  ")".
my_predef_datalog_constraint(type(Pred,[]),V,V) -->
  my_kw("TYPE"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ")".
my_predef_datalog_constraint(nn(Pred,Columns),V,V) -->
  my_kw("NN"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(Columns),
  my_blanks_star,
  ")".
my_predef_datalog_constraint(pk(Pred,Columns),V,V) -->
  my_kw("PK"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(Columns),
  my_blanks_star,
  ")".
my_predef_datalog_constraint(ck(Pred,Columns),V,V) -->
  my_kw("CK"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(Columns),
  my_blanks_star,
  ")".
my_predef_datalog_constraint(fk(FKPred,FKColumns,PKPred,PKColumns),V,V) -->
  my_kw("FK"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(FKPred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(FKColumns),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_symbol(PKPred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(PKColumns),
  my_blanks_star,
  ")".
my_predef_datalog_constraint(fd(Pred,Columns,DepColumns),V,V) -->
  my_kw("FD"),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_symbol(Pred),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(Columns),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_list_of_symbols(DepColumns),
  my_blanks_star,
  ")".
  
my_list_of_symbols(Symbols) -->
  "[",
  my_blanks_star,
  my_symbol_sequence(Symbols),  
  my_blanks_star,
  "]".
 
my_symbol_sequence([Symbol|Symbols]) -->
  my_symbol(Symbol),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_symbol_sequence(Symbols).
my_symbol_sequence([Symbol]) -->
  my_symbol(Symbol).
  
% Declaration of Datalog type constraints (type(Pred,[Type]) or type(Pred,[Colname:Type])
my_list_of_ctr_types(Types) -->
  "[",
  my_blanks_star,
  my_sequence_of_ctr_types(Types),  
  my_blanks_star,
  "]".
my_list_of_ctr_types([]) -->
  "[",
  my_blanks_star,
  "]".
 
my_sequence_of_ctr_types(S) -->
  my_type_sequence(S).
my_sequence_of_ctr_types(S) -->
  my_colnametype_sequence(S).

my_type_sequence([Type|Types]) -->
  my_DLtype(Type),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_type_sequence(Types).
my_type_sequence([Type]) -->
  my_DLtype(Type).
  
my_DLtype(Type) -->
  my_atom(DLType,[],_),
  {dltype_type(DLType,Type)}.
  
my_colnametype_sequence([Type|Types]) -->
  my_colnametype(Type),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_colnametype_sequence(Types).
my_colnametype_sequence([Type]) -->
  my_colnametype(Type).
  
% Datalog columns cannot get the same name as a SQL identifier 
% since they can be referenced from a SQL statement  
my_colnametype(Colname:Type) -->
  my_non_sql_symbol(Colname),
  my_blanks_star,
  ":",
  my_blanks_star,
  my_DLtype(Type).
  
my_basic_literal(E,Vi,Vo) -->
  "(",
  my_once_blanks_star,
  my_literals(E,Vi,Vo),
  my_once_blanks_star,
  ")".
my_basic_literal(not(Body),Vi,Vo) -->
  "not",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_body(Body,Vi,Vo),
  my_blanks_star,
  ")".
my_basic_literal(top(N,Goal),Vi,Vo) -->
  "top",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_variable_or_integer(N,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_body(Goal,Vo1,Vo),
  my_blanks_star,
  ")",
  {((var(N);N>0) ->
     true
    ;
     my_raise_exception(top(N,Goal),syntax('First argument of top must be greater than 0:'),Vo)
   )}.
my_basic_literal(distinct(Atom),Vi,Vo) -->
  "distinct",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_body(Atom,Vi,Vo),
  my_blanks_star,
  ")".
my_basic_literal(distinct(Vars,Atom),Vi,Vo) -->
  "distinct",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_var_list(Vars,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_body(Atom,Vo1,Vo),
  my_blanks_star,
  ")",
  {my_term_variables(Atom,AtomVars),
   (my_intersect_var(Vars,AtomVars,Vars) ->
     true
    ;
     my_raise_exception(distinct(Vars,Atom),syntax('Variables in first argument of ''distinct'' must occur in its second argument:'),Vo)
   )}.
my_basic_literal(Aggr,Vi,Vo) -->
  my_aggregate_relation(AF,3),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_body(P,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_variable(V,Vo1,Vo2),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_variable_or_number(T,Vo2,Vo),
  my_blanks_star,
  ")",
  {Aggr =.. [AF,P,V,T],
   (my_member_var_term(V,P) ->
     true
    ;
     my_raise_exception(Aggr,syntax(['Pivot variable ',V,' must occur in the first argument ',P,' of aggregate']),Vo)
   )
  }.
my_basic_literal(Aggr,Vi,Vo) -->
  my_aggregate_relation(AF,2),
  my_blanks_star,
  "(",
  my_blanks_star,
  my_body(P,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_variable_or_number(T,Vo1,Vo),
  my_blanks_star,
  ")",
  {Aggr =.. [AF,P,T]}.
my_basic_literal(group_by(B,Vs,C),Vi,Vo) -->
  "group_by",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_body(B,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_var_list(Vs,Vo1,Vo2),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_body(C,Vo2,Vo),
  my_blanks_star,
  ")",
  {valid_grouping(B,Vs,Vo),
   valid_group_by_body(B,Vs,C,Vo)}.
my_basic_literal(lj(A),Vi,Vo) -->
  "lj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_atom(A,Vi,Vo),
  my_blanks_star,
  ")".
my_basic_literal(lj(A,B,C),Vi,Vo) -->  
  "lj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_basic_literal(A,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_basic_literal(B,Vo1,Vo2),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_literals(C,Vo2,Vo),
  my_blanks_star,
  ")".
my_basic_literal(rj(A),Vi,Vo) -->
  "rj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_atom(A,Vi,Vo),
  my_blanks_star,
  ")".
my_basic_literal(rj(A,B,C),Vi,Vo) -->  
  "rj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_basic_literal(A,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_basic_literal(B,Vo1,Vo2),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_literals(C,Vo2,Vo),
  my_blanks_star,
  ")".
my_basic_literal(fj(A),Vi,Vo) -->
  "fj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_atom(A,Vi,Vo),
  my_blanks_star,
  ")".
my_basic_literal(fj(A,B,C),Vi,Vo) -->  
  "fj",
  my_blanks_star,
  "(",
  my_blanks_star,
  my_basic_literal(A,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_basic_literal(B,Vo1,Vo2),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_literals(C,Vo2,Vo),
  my_blanks_star,
  ")".
my_basic_literal(L,Vi,Vo) -->
  my_atom(L,Vi,Vo).

my_aggregate_relation(count_distinct,4) -->
  "count_distinct".  
my_aggregate_relation(count_distinct,3) -->
  "count_distinct".  
my_aggregate_relation(count_distinct,2) -->
  "count_distinct".  
my_aggregate_relation(count,4) -->
  "count".  
my_aggregate_relation(count,3) -->
  "count".  
my_aggregate_relation(count,2) -->  
  "count".  
my_aggregate_relation(sum_distinct,4) -->
  "sum_distinct".  
my_aggregate_relation(sum_distinct,3) -->
  "sum_distinct".  
my_aggregate_relation(sum,4) -->
  "sum".  
my_aggregate_relation(sum,3) -->
  "sum".  
my_aggregate_relation(times_distinct,4) -->
  "times_distinct".  
my_aggregate_relation(times_distinct,3) -->
  "times_distinct".  
my_aggregate_relation(times,4) -->
  "times".  
my_aggregate_relation(times,3) -->
  "times".  
my_aggregate_relation(avg_distinct,4) -->
  "avg_distinct".  
my_aggregate_relation(avg_distinct,3) -->
  "avg_distinct".  
my_aggregate_relation(avg,4) -->
  "avg".  
my_aggregate_relation(avg,3) -->
  "avg".  
my_aggregate_relation(min,4) --> % As allowed by SQL2, min_distinct behaves as min
  "min_distinct".  
my_aggregate_relation(min,3) -->
  "min_distinct".  
my_aggregate_relation(min,4) -->
  "min".  
my_aggregate_relation(min,3) -->
  "min".  
my_aggregate_relation(max,4) --> % As allowed by SQL2, max_distinct behaves as max
  "max_distinct".
my_aggregate_relation(max,3) -->
  "max_distinct".
my_aggregate_relation(max,4) -->
  "max".
my_aggregate_relation(max,3) -->
  "max".
 
my_aggregate_relation(AF,Arity) :-
  my_aggregate_relation(AF,Arity,_H,_T).  
  
%
% Ancillary Stuff
%
    
lang_interpreter_cmd(datalog) --> 
  command_begin,
  my_blanks_star,
  my_kw("DATALOG"),
  my_blanks.
lang_interpreter_cmd(prolog) --> 
  command_begin,
  my_blanks_star,
  my_kw("PROLOG"),
  my_blanks.
lang_interpreter_cmd(sql) --> 
  command_begin,
  my_blanks_star,
  my_kw("SQL"),
  my_blanks.
lang_interpreter_cmd(ra) --> 
  command_begin,
  my_blanks_star,
  my_kw("RA"),
  my_blanks.

my_var_list([],V,V) -->  
  "[",
  my_blanks_star,
  "]".
my_var_list(Vs,Vi,Vo) -->  
  "[",
  my_blanks_star,
  my_comma_separated_vars(Vs,Vi,Vo),
  my_blanks_star,
  "]".
  
my_comma_separated_vars([V|Vs],Vi,Vo) -->
  my_variable(V,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  my_comma_separated_vars(Vs,Vo1,Vo).
my_comma_separated_vars([V],Vi,Vo) -->
  my_variable(V,Vi,Vo).
  
my_blank -->         % One blank
  " ".
my_blank -->         % Tab
  "\t".
my_blank -->         % End of line
  [EOL],
  {end_of_line(EOL)}.
  
my_blanks_star -->   % Zero or more blanks. Eagerly consumes blanks
  my_blanks.         
  %{!}.               % leaving no choicepoints
my_blanks_star -->
  [].

my_once_blanks_star -->   % Zero or more blanks. Eagerly consumes blanks
  my_blanks_star,         
  {!}.               % leaving no choicepoints

my_blanks -->        % One or more blanks
  my_blank,
  my_blanks_star.


my_letter(C) --> 
  my_lowercase(C).
my_letter(C) --> 
  my_uppercase(C).

my_lowercase(C) --> 
  [C],
  {my_lowercase(C)}.
  
my_uppercase(C) -->
  [C],
  {[C] >= "A",
   [C] =< "Z"}.
   
my_digit(C) -->
  [C],
  {[C] >= "0",
   [C] =< "9"}.

my_lowercase(C) :-
  [C] >= "a",
  [C] =< "z".
my_lowercase(C) :-
  [C] = "á".
my_lowercase(C) :-
  [C] = "é".
my_lowercase(C) :-
  [C] = "í".
my_lowercase(C) :-
  [C] = "ó".
my_lowercase(C) :-
  [C] = "ú".
my_lowercase(C) :-
  [C] = "à".
my_lowercase(C) :-
  [C] = "è".
my_lowercase(C) :-
  [C] = "ì".
my_lowercase(C) :-
  [C] = "ò".
my_lowercase(C) :-
  [C] = "ù".
my_lowercase(C) :-
  [C] = "ä".
my_lowercase(C) :-
  [C] = "ë".
my_lowercase(C) :-
  [C] = "ï".
my_lowercase(C) :-
  [C] = "ö".
my_lowercase(C) :-
  [C] = "ü".
my_lowercase(C) :-
  [C] = "ñ".
my_lowercase(C) :-
  [C] = "ç".

my_uppercase(C) :-
  [C] >= "A",
  [C] =< "Z".
my_uppercase(C) :-
  [C] = "Á".
my_uppercase(C) :-
  [C] = "É".
my_uppercase(C) :-
  [C] = "Í".
my_uppercase(C) :-
  [C] = "Ó".
my_uppercase(C) :-
  [C] = "Ú".
my_uppercase(C) :-
  [C] = "À".
my_uppercase(C) :-
  [C] = "È".
my_uppercase(C) :-
  [C] = "Ì".
my_uppercase(C) :-
  [C] = "Ò".
my_uppercase(C) :-
  [C] = "Ù".
my_uppercase(C) :-
  [C] = "Ä".
my_uppercase(C) :-
  [C] = "Ë".
my_uppercase(C) :-
  [C] = "Ï".
my_uppercase(C) :-
  [C] = "Ö".
my_uppercase(C) :-
  [C] = "Ü".
my_uppercase(C) :-
  [C] = "Ñ".
my_uppercase(C) :-
  [C] = "Ç".

% my_identifier_chars: 
% one or more digits, letters, underscores or dollars
my_identifier_chars([C|Cs]) -->
  my_identifier_char(C),
  my_identifier_chars(Cs).
my_identifier_chars([C]) -->
  my_identifier_char(C).

% my_underscored_variable_chars: 
% one or more letters, digits or underscores
my_underscored_variable_chars([C]) -->
  my_underscored_variable_char(C).
my_underscored_variable_chars([C|Cs]) -->
  my_underscored_variable_char(C),
  my_underscored_variable_chars(Cs).

my_underscored_variable_char(C) --> 
  my_letter(C).
my_underscored_variable_char(C) -->
  my_digit(C).
my_underscored_variable_char(C) -->
  "_",
  {[C] = "_"}.

% my_identifier_chars_star:
% zero or more digits, letters, underscores or dollars
my_identifier_chars_star(Cs) -->
  my_identifier_chars(Cs).
my_identifier_chars_star([]) -->
  [].

% my_identifier_char(C) --> 
%   my_char(C).
my_identifier_char(C) --> 
  my_lowercase(C).
my_identifier_char(C) -->
  my_uppercase(C).
my_identifier_char(C) -->
  my_digit(C).
my_identifier_char(C) -->
  "_",
  {[C] = "_"}.
my_identifier_char(C) -->
  "$",
  {[C] = "$"}.

% my_chars: one or more characters
my_chars([C]) -->
  my_char(C).
my_chars([C|Cs]) -->
  my_char(C),
  my_chars(Cs).

my_char(C) -->
  [C].

% my_chars_star: zero or more characters
my_chars_star([]) -->
  [].
my_chars_star(Cs) -->
  my_chars(Cs). 
   
% my_quote_enclosed_chars: one or more characters enclosed between quotes
my_quote_enclosed_chars([C]) -->
  my_non_quote_char(C).
my_quote_enclosed_chars([C|Cs]) -->
  my_non_quote_char(C),
  my_quote_enclosed_chars(Cs).

% my_non_quote_char: one character inside a quoted atom
my_non_quote_char(C) --> % A pair of quotes inside a quoted atom denoting a single quote
  [C,C],
  {[C] = "'"}.
my_non_quote_char(C) --> % A single quote is not allowed inside a quoted atom
  [C],
  {[C] \== "'"}.

% my_symbol is intended to parse Datalog constants, function (functor), and relation (predicate) symbols
my_symbol(A) -->
  my_lowercase(C),
  my_identifier_chars_star(Cs),
 {name(A,[C|Cs])}.
% my_symbol(A) -->
%   my_lowercase(C),
%   {name(A,[C])}.
my_symbol('') -->
  "''".
my_symbol(A) -->
  "'",
  my_quote_enclosed_chars(Cs),
  "'",
  {atom_codes(A,Cs)}.
  
% my_non_sql_symbol is intended to identify user identifiers which are not SQL reserved words
my_non_sql_symbol(A) -->
  my_symbol(A),
  {my_non_sql_symbol(A)}.
  
my_non_sql_symbol(A) :-
  atom(A),
  \+ sql_identifier(A).
  
% Type conversion: Datalog types -> Internal types
dltype_type(string,string(varchar)).
dltype_type(varchar,string(varchar)).
dltype_type(char,string(char(1))).
dltype_type(char(N),string(char(N))) :-
  (integer(N) ->
    true
   ;
    write_error_log(['Invalid type: ',char(N)]),
    fail
  ).
dltype_type(varchar(N),string(varchar(N))) :-
  (integer(N) ->
    true
   ;
    write_error_log(['Invalid type: ',varchar(N)]),
    fail
  ).
dltype_type(integer,number(integer)).
dltype_type(int,number(integer)).
dltype_type(float,number(float)).
dltype_type(real,number(float)).
% dltype_type(Type,_) :-
%   write_error_log(['Invalid type: ',Type]),
%   fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Validate syntax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% valid_grouping(+Relation,+GroupByVars,+NVs)
% Check that group-by-variables are in the relation to be grouped
% NVs are used to display the relation with source var names with their textual names in case of failure
valid_grouping(B,GBVs,_NVs) :-
  my_term_variables(B,BVs),
  my_set_diff(GBVs,BVs,[]),
  !.
valid_grouping(B,_GBVs,NVs) :-
  my_raise_exception(generic,syntax(['Grouping variables are not in source relation: ',B]),NVs).

% valid_group_by_body(+Relation,+GroupingVariables,+Body (including aggregate functions),+NVs)
% - Check that variables as arguments of aggregate functions in Body are in the Relation
% - Check that variables in Relation which are not in the grouping set do not occur in Body but as arguments of aggregates
valid_group_by_body(R,GBVs,B,NVs) :-
  valid_group_by_aggr_arg(R,B,NVs),
  valid_group_by_set_var(R,GBVs,B,NVs),
  valid_group_by_body_type(R,B,NVs).

valid_group_by_aggr_arg(R,B,NVs) :-
  my_term_variables(R,RVs),
  my_aggregate_function(F,A),
  functor(T,F,A),
  my_member_var_term(T,B),
  my_term_variables(T,TVs),
  (my_set_diff(TVs,RVs,[]) ->
    fail
   ;
    my_raise_exception(generic,syntax(['Variable in aggregate function ',T,' must be in ',R]),NVs)).
valid_group_by_aggr_arg(_B,_Vs,_NVs).

valid_group_by_set_var(R,GBVs,B,NVs) :-
  my_term_variables(R,RVs),
  my_set_diff(RVs,GBVs,SetVs),
  get_vars_not_in_aggr(B,[],BVs),
  my_set_inter(SetVs,BVs,DVs),
  (DVs==[] ->
    true
   ;
    my_raise_exception(generic,syntax(['Ungrouped variables ',DVs,' cannot occur in ',B,' out of aggregate functions.']),NVs)).

get_vars_not_in_aggr(V,AVs,[V|AVs]) :- 
  var(V),
  !.
get_vars_not_in_aggr('$NULL'(_ID),AVs,AVs) :- 
  !.
get_vars_not_in_aggr(T,AVs,AVs) :- 
  atomic(T),
  !.
get_vars_not_in_aggr(T,AVs,AVs) :- 
  functor(T,F,1),
  arithmetic_function(F,_,_,aggregate,_,1),
  !.
get_vars_not_in_aggr(T,AVsi,AVso) :- 
  T =.. [_F|As],
  get_vars_not_in_aggr_list(As,AVsi,AVso).

get_vars_not_in_aggr_list([],AVs,AVs) :-
  !.
get_vars_not_in_aggr_list([T|Ts],AVsi,AVso) :-
  get_vars_not_in_aggr(T,AVsi,AVso1), 
  get_vars_not_in_aggr_list(Ts,AVso1,AVso).

valid_group_by_body_type(_R,B,NVs) :-
  copy_term(B,CB),
  (get_expr_type(CB,boolean)
   ->
   true
   ;
   my_raise_exception(generic,syntax(['Type of ''',B,''' must be Boolean.']),NVs)).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parsing expressions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
my_expression(E,Vi,Vo) --> 
  my_noncompound_term(E,Vi,Vo).
my_expression(E,Vi,Vo) --> 
  my_arithmeticexp(E,Vi,Vo).
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parsing arithmetic expressions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_arithmeticexp(E,Vi,Vo) --> 
  my_aterm(T,Vi,Vo1),
  my_once_blanks_star, 
  my_arithmeticexp_r(T,E,Vo1,Vo).
  
my_arithmeticexp_r(E0,E,Vi,Vo) --> 
  {my_priority_operator(low,SOP,OP)}, 
  my_string(SOP),
  my_once_blanks_star, 
  my_aterm(T,Vi,Vo1),
  {TOP =.. [OP,E0,T]},
  my_arithmeticexp_r(TOP,E,Vo1,Vo).
my_arithmeticexp_r(E,E,V,V) -->
  [].

my_aterm(T,Vi,Vo) --> 
  my_power(P,Vi,Vo1),
  my_once_blanks_star, 
  my_aterm_r(P,T,Vo1,Vo).
  
my_aterm_r(T0,T,Vi,Vo) --> 
  {my_priority_operator(medium,SOP,OP)}, 
  my_string(SOP),
  my_once_blanks_star, 
  my_power(P,Vi,Vo1),
  {TOP =.. [OP,T0,P]},
  my_aterm_r(TOP,T,Vo1,Vo).
my_aterm_r(T,T,V,V) -->
  [].

my_power(P,Vi,Vo) --> 
  my_factor(F,Vi,Vo1),
  my_once_blanks_star, 
  my_power_r(F,P,Vo1,Vo).
  
my_power_r(P0,TOP,Vi,Vo) --> 
  {my_priority_operator(high,SOP,OP)}, 
  my_string(SOP), 
  my_once_blanks_star, 
  my_factor(P1,Vi,Vo1),
  {TOP =.. [OP,P0,P]},
  my_power_r(P1,P,Vo1,Vo).
my_power_r(P,P,V,V) -->
  [].

my_factor('$NULL'(ID),Vi,Vi) -->
  my_kw("NULL"),
  {get_null_id(ID)}.
my_factor(N,Vi,Vi) -->
  my_number(N).
my_factor(V,Vi,Vo) -->
  my_variable(V,Vi,Vo).
my_factor(C,Vi,Vi) -->
  my_arithmetic_constant(C).
my_factor(T,Vi,Vo) --> 
  {my_arithmetic_function(SF,F,A),
   A>0},
  my_string(SF), 
  my_once_blanks_star,
  "(",
  my_blanks_star,
  my_function_arguments(A,As,Vi,Vo),
  my_once_blanks_star,
  ")",
  {T=..[F|As]}.
my_factor(F,Vi,Vi) --> 
  {my_arithmetic_function(SF,F,0)},
  my_string(SF).
my_factor(E,Vi,Vo) -->
  "(",
  my_once_blanks_star,
  my_arithmeticexp(E,Vi,Vo),
  my_once_blanks_star,
  ")".
my_factor(T,Vi,Vo) --> 
  {my_unary_operator(SOP,OP)},
  my_string(SOP),
  my_once_blanks_star, 
  my_arithmeticexp(E,Vi,Vo),
  {T=..[OP,E]}.

%my_priority_operator(Priority, StringOperator, Operator)
my_priority_operator(P,SOP,POP) :-
  my_infix_arithmetic(OP,POP,_,_,P),
  name(OP,SOP).

my_function_arguments(1,[E],Vi,Vo) -->
  !,
  my_arithmeticexp(E,Vi,Vo).
my_function_arguments(A,[E|Es],Vi,Vo) -->
  {A>1},
  my_arithmeticexp(E,Vi,Vo1),
  my_blanks_star,
  ",",
  my_blanks_star,
  {A1 is A-1},
  my_function_arguments(A1,Es,Vo1,Vo).

  
%
% Numbers
%

my_number(N) -->
  my_negative_number(N).
my_number(N) -->
  my_positive_number(N).

my_negative_number(N) -->
  "-",
  my_positive_number(P),
  {N is -P}.

my_positive_number(N) -->
  my_fractional_positive_number(M),
  "E+",
  my_integer(E),
  {N is M*(10**E)}.
my_positive_number(N) -->
  my_fractional_positive_number(M),
  "E",
  my_integer(E),
  {N is M*(10**E)}.
my_positive_number(N) -->
  my_fractional_positive_number(N).
my_positive_number(N) -->
  my_positive_integer(N).

my_fractional_positive_number(N) -->
  my_digits(Is),
  ".",
  my_digits(Ds),
  {concat_lists([Is,".",Ds],Ns),
   name(N,Ns)}.

my_integer(N) -->
  my_negative_integer(N).
my_integer(N) -->
  my_positive_integer(N).

my_negative_integer(N) -->
  "-",
  my_positive_integer(P),
  {N is -P}.

my_positive_integer(N) -->
  my_digits(Ds),
  {name(N,Ds)}.

my_digits([D|Ds]) -->
  my_digit(D),
 my_digits(Ds).
my_digits([D]) -->
  my_digit(D).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Built-ins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Built-in Arithmetic Constants

my_arithmetic_constant(Value) --> 
  {arithmetic_constant(Value,Constant,_), 
   name(Constant, SConstant)}, 
  my_string(SConstant).

arithmetic_constant(4*atan(1),'pi','Archimedes'' constant').
arithmetic_constant(exp(1),'e','Euler''s number').

% Built-in Arithmetic Functions

my_arithmetic_function(SF,PF,A) :- 
  arithmetic_function(F,PF,_,_,number(_N),A),
  name(F,SF).

my_aggregate_function(SF,PF,A) :- 
  arithmetic_function(F,PF,_,aggregate,_,A),
  atom_concat(_,distinct,PF),
  name(F,SF).
  
my_aggregate_function(F,A) :-
  arithmetic_function(F,_,_,aggregate,_,A).

% arithmetic_function(Name, PrologPredefined, Description, Kind(arithmetic or aggregate), Type, Arity)
arithmetic_function('sqrt','sqrt','Square root',arithmetic,number(float),1).
arithmetic_function('ln','log','Neperian logarithm',arithmetic,number(float),1).
arithmetic_function('log','log','Neperian logarithm',arithmetic,number(float),1).
arithmetic_function('log','log','Logarithm of the second argument in the base of the first one',arithmetic,number(float),2).
arithmetic_function('sin','sin','Sine',arithmetic,number(float),1).
arithmetic_function('cos','cos','Cosine',arithmetic,number(float),1).
arithmetic_function('tan','tan','Tangent',arithmetic,number(float),1).
arithmetic_function('cot','cot','Cotangent',arithmetic,number(float),1).
arithmetic_function('asin','asin','Arc sine',arithmetic,number(float),1).
arithmetic_function('acos','acos','Arc cosine',arithmetic,number(float),1).
arithmetic_function('atan','atan','Arc tangent',arithmetic,number(float),1).
arithmetic_function('acot','acot','Arc cotangent',arithmetic,number(float),1).
arithmetic_function('abs','abs','Absolute value',arithmetic,number(float),1).
arithmetic_function('float','float','Float value of its argument',arithmetic,number(float),1).
arithmetic_function('integer','integer','Closest integer between 0 and its argument',arithmetic,number(integer),1).
arithmetic_function('sign','sign','Returns -1 if its argument is negative, 0 otherwise',arithmetic,number(integer),1).
arithmetic_function('gcd','gcd','Greatest common divisor between two numbers',arithmetic,number(integer),2).
arithmetic_function('min','min','Least of two numbers',arithmetic,number(_Type),2).
arithmetic_function('max','max','Greatest of two numbers',arithmetic,number(_Type),2).
arithmetic_function('truncate','truncate','Closest integer between 0 and its argument',arithmetic,number(integer),1).
arithmetic_function('float_integer_part','float_integer_part','Integer part as a float',arithmetic,number(float),1).
arithmetic_function('float_fractional_part','float_fractional_part','Fractional part as a float',arithmetic,number(float),1).
arithmetic_function('round','round','Closest integer',arithmetic,number(integer),1).
arithmetic_function('floor','floor','Greatest integer less or equal to its argument',arithmetic,number(integer),1).
arithmetic_function('ceiling','ceiling','Least integer greater or equal to its argument',arithmetic,number(integer),1).
% aggregate functions
arithmetic_function('avg','avg','Average. Returns a float',aggregate,number(float),1).
arithmetic_function('avg_distinct','avg_distinct','Average of distinct values but nulls. Returns a float',aggregate,number(float),1).
arithmetic_function('count','count','Count all (with no argument). Returns an integer',aggregate,number(integer),0).
arithmetic_function('count','count','Count but nulls wrt. its argument. Returns an integer',aggregate,number(integer),1).
arithmetic_function('count_distinct','count_distinct','Count all distincts (with no argument) but nulls wrt. its argument. Returns an integer',aggregate,number(integer),0).
arithmetic_function('count_distinct','count_distinct','Count distincts but nulls wrt. its argument. Returns an integer',aggregate,number(integer),1).
arithmetic_function('max','max','Maximum. Returns a value with the same type as its argument',aggregate,_Type,1).
arithmetic_function('min','min','Minimum. Returns a value with the same type as its argument',aggregate,_Type,1).
arithmetic_function('sum','sum','Cumulative sum of values but nulls. Returns a value with the same type as its argument',aggregate,number(_N),1).
arithmetic_function('sum_distinct','sum_distinct','Cumulative sum of distinct values but nulls. Returns a value with the same type as its argument',aggregate,number(_N),1).
arithmetic_function('times','times','Cumulative product of values but nulls. Returns a value with the same type as its argument',aggregate,number(_N),1).
arithmetic_function('times_distinct','times_distinct','Cumulative product of distinct values. Returns a value with the same type as its argument',aggregate,number(_N),1).


% Built-in Predicates

my_builtin_pred(X) :- 
  my_infix_relation(X,_)
  ;
  my_infix_comparison(X,_)
  ;
  my_outer_join_relation(X/_)
  ;
  my_aggregate_relation(X,_)
  ;
  X=top
  ;
  X=distinct
  ;
  X=group_by.

% Built-in Functions

my_builtin_function(not/1).
my_builtin_function(group_by/3).
my_builtin_function(count/3).
my_builtin_function(count/2).
my_builtin_function(sum/3).
my_builtin_function(avg/3).
my_builtin_function(min/3).
my_builtin_function(max/3).
%my_builtin_function(is_null/1).
%my_builtin_function(is_not_null/1).
my_builtin_function(lj/1).
my_builtin_function(rj/1).
my_builtin_function(fj/1).

% Built-in Operators

my_infix(X) :- 
  X==(':-'); 
  X==(':'); 
  my_infix_relation(X,_); 
  my_infix_comparison(X,_); 
  my_infix_arithmetic(X,_,_,_,_).

my_prefix(X) :- 
  X==(':-').
  
% Built-in Unary Operators
my_unary_operator(SOP,POP) :-
  unary_operator(OP,POP,_),
  name(OP,SOP).
  
unary_operator('\\','\\','Bitwise negation').
unary_operator('-','-','Negative value of its single argument').

% Built-in Binary Operators

% Built-in arithmetic expression evaluation operator
my_infix_relation('is','Evaluation of arithmetic expressions').

% Built-in relations
% my_builtin_relation(Name, Arity, Description, Kind(null, outer_join, aggregate or misc))
my_builtin_relation('is_null',1,'Determining whether its single argument is null', null).
my_builtin_relation('is_not_null',1,'Determining whether its single argument is not null', null).
my_builtin_relation('lj',3,'Left outer join: first relation, second relation, and join condition', outer_join).
my_builtin_relation('rj',3,'Right outer join: first relation, second relation, and join condition', outer_join).
my_builtin_relation('fj',3,'Full outer join: first relation, second relation, and join condition', outer_join).
my_builtin_relation('top',2,'Allows N solution tuples at most', misc).
my_builtin_relation('distinct',1,'Discard duplicates', misc).
my_builtin_relation('distinct',2,'Discard duplicates w.r.t. given variables', misc).
my_builtin_relation('top',2,'Limit the number of solutions', misc).
my_builtin_relation('group_by',3,'Create groups from a relation wrt. a list of variables, possibly applying aggregated conditions', aggregate).
my_builtin_relation('avg',3,'Aggregate returning the average of values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('avg_distinct',3,'Aggregate returning the average of different values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('count',3,'Aggregate returning the number of the tuples in a relation wrt. an argument, ignoring nulls', aggregate).
my_builtin_relation('count',2,'Aggregate returning the number of the tuples in a relation (cf. SQL''s COUNT(*))', aggregate).
my_builtin_relation('count_distinct',3,'Aggregate returning the number of tuples in a relation with different values for a given argument, ignoring nulls', aggregate).
my_builtin_relation('count_distinct',2,'Aggregate returning the number of different tuples in a relation', aggregate).
my_builtin_relation('max',3,'Aggregate returning the maximum of values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('min',3,'Aggregate returning the minimum of values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('sum',3,'Aggregate returning the sum of values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('sum_distinct',3,'Aggregate returning the sum of different values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('times',3,'Aggregate returning the product of values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('times_distinct',3,'Aggregate returning the product of different values for an argument in a relation, ignoring nulls', aggregate).
my_builtin_relation('dual',0,'Oracle''s dual table for building SELECT statements with no data source ', misc).

% Built-in Binary Comparison Operators
% my_infix_comparison(Name, Description)
my_infix_comparison('=','Syntactic equality').
my_infix_comparison('\\=','Syntactic disequality').
my_infix_comparison('>','Greater than').
my_infix_comparison('>=','Greater or equal than').
my_infix_comparison('<','Less than').
my_infix_comparison('=<','Less or equal than').

my_infix_comparison(Op) -->
  {my_infix_comparison(Op,_), 
  name(Op,SOp)}, 
  my_string(SOp).


% Built-in Binary Arithmetic Operators
% my_infix_arithmetic(Name, PrologBuiltin, ReturnType, Description, PriorityGroup)
% The priority of an operator in each priority group follows textual order of clauses (the first one has the higher priority, the last one has the lower priority)
my_infix_arithmetic('^','**',number(_),'Power',high).
my_infix_arithmetic('**','**',number(_),'Power',high).
my_infix_arithmetic('/\\','/\\',number(integer),'Bitwise conjuntion between integers',high).
my_infix_arithmetic('\\/','\\/',number(integer),'Bitwise disjunction between integers',high).
my_infix_arithmetic('*','*',number(_),'Multiplication',medium).
my_infix_arithmetic('/','/',number(float),'Real division',medium).
my_infix_arithmetic('//','//',number(integer),'Integer quotient',medium).
my_infix_arithmetic('rem','rem',number(integer),'Integer remainder',medium).
my_infix_arithmetic('#','#',number(integer),'Bitwise exclusive or between integers',medium).
my_infix_arithmetic('+','+',number(_),'Addition',low).
my_infix_arithmetic('-','-',number(_),'Difference between its arguments',low).
my_infix_arithmetic('<<','<<',number(integer),'Shift left the first argument the number of places indicated by the second one',low).
my_infix_arithmetic('>>','>>',number(integer),'Shift right the first argument the number of places indicated by the second one',low).


/*********************************************************************/
/* Solving Prolog Goals                                              */
/*********************************************************************/

solve_prolog(Goal,NVs) :- 
  solve_prolog_body(Goal,NVs), 
  write_with_NVs(Goal,NVs), 
  nl_log, 
  write_log('? (type ; for more solutions, <Intro> to continue) '), 
  user_input_string(Str),
  Str=="",
  !, 
  write_log_list([yes,nl]).
solve_prolog(_Goal,_R) :- 
  write_log_list([no,nl]).

solve_prolog_body(true,_) :- 
  !.
solve_prolog_body((LGs,RGs),R) :- 
  !, 
  solve_prolog_body(LGs,R), 
  solve_prolog_body(RGs,R).
solve_prolog_body((LGs;RGs),R) :- 
  !, 
  solve_prolog_body(LGs,R), 
  solve_prolog_body(RGs,R).
solve_prolog_body(G,R) :- 
  solve_prolog_goal(G,R).

solve_prolog_goal(not(G),R) :- % Negation
  !, 
  my_not(solve_prolog_body(G,R)).
solve_prolog_goal(group_by(A,Vs,C),R) :- % Group by
  !, 
  my_raise_exception(group_by(A,Vs,C),unsupported_in_Prolog,R).
solve_prolog_goal(top(A,B),R) :- % Top
  !, 
  my_raise_exception(top(A,B),unsupported_in_Prolog,R).
solve_prolog_goal(distinct(A),R) :- % Distinct
  !, 
  my_raise_exception(distinct(A),unsupported_in_Prolog,R).
solve_prolog_goal(distinct(A,B),R) :- % Distinct
  !, 
  my_raise_exception(distinct(A,B),unsupported_in_Prolog,R).
solve_prolog_goal(Aggr,R) :- % Aggregates
  my_aggregate_relation(AF,Arity),
  functor(Aggr,AF,Arity),
  !, 
  my_raise_exception(Aggr,unsupported_in_Prolog,R).
solve_prolog_goal(G,_) :-      % Solves a goal using all of its matching rules
  (datalog((G:-B),NVs,RId,Ls,FId,Rs); (datalog(G,NVs,RId,Ls,FId,Rs),B=true)),
  R=datalog((G:-B),NVs,RId,Ls,FId,Rs),
  solve_prolog_body(B,R).
solve_prolog_goal(G,R) :-      % Prolog Built-ins
  G =.. [P|As],
  (my_builtin_pred(P) ->
   call(G)
   ;
   (user_predicates(Ps),
    length(As,L),
    (my_member_var(P/L,Ps) ->
     fail
     ;
     my_raise_exception(G,undefined,R)
    )
   )
  ).

  
/*********************************************************************/
/* Computing answers to a query                                      */
/*********************************************************************/

% No compound goals: instead, use a view
get_answer(Query,Facts) :-
  check_ic(CheckStatus),
  set_flag(check,off),
  compute_datalog(Query),
  set_flag(check,CheckStatus),
  (Query=':-'(H,_B) ->
    Fact=H
   ;
    Fact=Query
  ),
  findall(Fact,et(Fact,_),Facts),
  abolishET,
  compute_stratification.
  

/*********************************************************************/
/* Solving Datalog Queries                                           */
/*********************************************************************/

solve_datalog_query(Query,Undefined) :-
  set_flag(computed_tuples,0),
%  retractall(computed_tuples(_G,_T)),
  strata(S),
  (S==[] ->
    solve_datalog_stratum(Query,1,Undefined)  % No program was loaded; so, no strata computed
    ;
    (S==[non-stratifiable] -> 
      try_solve_stratified(Query,Undefined) % Although in a non-stratifiable program, try to solve for the given query, hopefully finding a stratifiable subprogram
     ;
      solve_stratified(Query,Undefined))),  % Stratifiable program: stratum solving
  (running_info(on) ->
    write('                                            \r') % Clear the running message about computed tuples (no dump to log, if enabled)
   ;
    true).

solve_datalog_stratum(Query,Stratum,_Undefined) :- 
  solve_star(Query,Stratum). % This call is always made to fail
solve_datalog_stratum(_Query,_Stratum,Undefined) :-
  remove_undefined(Undefined),
  ground_nulls,
  set_complete_flags.
  
set_complete_flags :-
  my_idx_retract(complete_flag(G,no)),
  my_idx_assertz(complete_flag(G,yes)),
  fail.
set_complete_flags.

try_solve_stratified(Query,Undefined) :-
  (Query=not(Q) -> true; Q=Query),
  pdg(G),
  functor(Q,N,A),
  sub_pdg(N/A,G,SG),
  stratify(NS,SG,B), 
  !,
  (B==false -> 
   (write_notapi_warning_log(['Unable to ensure correctness/completeness for this query.']),
    solve_datalog_stratum(Query,1,Undefined)); % Non-stratifiable yet
   (write_notapi_info_log(['Stratifiable subprogram found for the given query.']),
    strata(S),
    load_stratification(NS,SG),
    solve_stratified(Query,Undefined),
    load_stratification(S,G))).

% solve_stratified(+Query,-Undefined)
% Solve a guiven query and return undefined facts (only present in a non-stratifiable database)
% et_not algorithm in [SD91] does not resort to strata computations
solve_stratified(Query,Undefined) :- 
  neg(et_not),
  !,
  solve_datalog_stratum(Query,1,Undefined).
% Solving by strata
solve_stratified(Query,Undefined) :- 
  (Query=not(Q) -> true; Query=Q),
  pdg(G),
  functor(Q,N,A),
  sub_pdg(N/A,G,(_Nodes,Arcs)),
  neg_dependencies(Arcs,ND),
  (ND=[] ->
   solve_datalog_stratum(Query,1,Undefined)
   ;
   strata(S),
   sort_by_strata(S,ND,SR),
   build_queries(SR,Queries,NVs),
   (verbose(on) -> 
    write_log('Info: Computing by stratum of ['),
    write_csa_with_NVs(Queries,NVs),
    write_log_list(['].',nl])
    ;
    true),
   solve_datalog_stratum_list(Query,Undefined,Queries)).

solve_datalog_stratum_list(Query,Undefined,[Q|Qs]) :-
  get_stratum(Q,Stratum),
  solve_datalog_stratum(Q,Stratum,_U),
  solve_datalog_stratum_list(Query,Undefined,Qs).
solve_datalog_stratum_list(Query,Undefined,[]) :-
  get_stratum(Query,Stratum),
  solve_datalog_stratum(Query,Stratum,Undefined).

get_stratum(G,St) :-
  G =.. [F,SG],
  my_builtin_function(F/1),
  !,
  get_atom_stratum(SG,St).
get_stratum(G,St) :-
  get_atom_stratum(G,St).

get_atom_stratum(G,St) :-
  G =.. [P|Args],
  length(Args,A),
  strata(S),
  my_member((P/A,St),S),
  !.
  
neg_dependencies([],[]).
neg_dependencies([_T-F|As],[F|Fs]) :-
  neg_dependencies(As,Fs).
neg_dependencies([_T+_F|As],Fs) :-
  neg_dependencies(As,Fs).

sort_by_strata(S,R,SR) :-
  flip_pairs(S,FS),
  my_sort(FS,OFS),
  filterdrop(OFS,R,SR).

flip_pairs([],[]).
flip_pairs([(P,S)|Xs],[(S,P)|Ys]) :-
  flip_pairs(Xs,Ys).

filterdrop([],_,[]).
filterdrop([(_S,P)|Xs],R,[P|Ps]) :-
  my_member(P,R),
  !,
  filterdrop(Xs,R,Ps).
filterdrop([(_S,_P)|Xs],R,Ps) :-
  filterdrop(Xs,R,Ps).

build_queries([],[],[]).
build_queries([N/A|Ps],[Q|Qs],NVs) :-
  length(L,A),
  Q =.. [N|L],
  assign_variable_names(L,[],NV1s),
  build_queries(Ps,Qs,NV2s),
  append(NV1s,NV2s,NVs).
  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fixpoint Computation: solve_star
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solve_star(Q,St) :-
  repeat,
  (remove_calls,
   flag_et_no_change, % Set a flag indicating that the extension table has not changed 
   retractall(computed_tuples(_,_)), % Reset number of computed tuples for each call
   solve(Q,St,_R),    % Solve the call to Q using memoization at stratum St
   fail               % Request all alternatives
  ;              
   et_not_changed,    % When no more alternatives, restart the computation if the extension table has changed,
   !,                 % otherwise, 
   fail               % fail and exit
  ).             
                      

% Building a Predicate with Fresh Variables and Universal Nulls
build(Q,G) :-
  copy_term(Q,FQ),
  abstract_nulls(FQ,G).
  
% Get the variables of a term
my_term_variables(T,Vs):-
  my_term_variables(T,[],Vs).
  
my_term_variables(V,Vi,Vo) :-
  var(V), !,
  (my_member_var(V,Vi) ->
   Vo=Vi
   ;
   append(Vi,[V],Vo)).
my_term_variables(T,V,V) :-
  atomic(T),
  !.  
my_term_variables(T,Vi,Vo) :-
  T=..[_|As], 
  my_terms_variables(As,Vi,Vo).  

my_terms_variables([],Vs,Vs).
my_terms_variables([T|Ts],Vi,Vs) :-
  my_term_variables(T,Vi,Vo1),
  my_terms_variables(Ts,Vo1,Vs).
  
/*********************************************************************/
/* Removing previous calls on a new run of fixpoint computation      */
/*********************************************************************/

remove_calls :-
  my_idx_retractall(called(_X)).

/*********************************************************************/
/* Testing whether the extension table has not changed               */
/*********************************************************************/

et_not_changed :-
  et_flag(no).

/*********************************************************************/
% Setting Extension Table Flag to 'changed'
/*********************************************************************/

flag_et_change :-
  set_flag(et_flag,yes).

/*********************************************************************/
% Setting Extension Table Flag to 'not changed'
/*********************************************************************/

flag_et_no_change :-
  set_flag(et_flag,no).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solving with Extension Table: solve
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% solve(+Goal,+Stratum,+Rule)
%
% Solve Goal, which corresponds to Stratum in the context of Rule,
% either keeping duplicates (Distinct=all) or not (Distinct=distinct).

solve(G,St,R) :-
  solve(G,St,R,_Ids).

% solve(+Goal,+Stratum,+Rule,-Ids)
%
% As solve/3,
% where Ids is the chain of identifiers used to solve Goal
%

solve(true,_St,_,[]) :-
  !.
solve((G,Gs),St,R,[]) :-
  % Duplicates OFF
  % Do not store Id chain in et
  duplicates(off),
  !, 
  solve(G,St,R,_Ids1), 
  solve(Gs,St,R,_Ids2).
solve((G,Gs),St,R,Ids) :-
  % Duplicates ON
  % Store Id chain in et
%  duplicates(on),
  !, 
  solve(G,St,R,Ids1), 
  solve(Gs,St,R,Ids2),
  append(Ids1,Ids2,Ids).
solve(lj(G),St,R,Ids) :-  % Left outer join; simply execute the goal
  !,
  solve(G,St,R,Ids).
solve(rj(G),St,R,Ids) :-  % Left outer join; simply execute the goal
  !,
  solve(G,St,R,Ids).
solve(fj(G),St,R,Ids) :-  % Left outer join; simply execute the goal
  !,
  solve(G,St,R,Ids).
% solve(A is B,_St,_R,(-1,[])) :- % Provide an unique id for the evaluation of a given expression containing concrete nulls
%   contain_null(B),
%   my_ground(B),
%   !,
%   A='$NULL'(Id),
%   get_null_id(Id).
solve(G,_St,R,[]) :-
  is_primitive(G),
  my_not((G=is(_A,B), contain_null(B), my_ground(B))),
  !,
  compute_primitive(G,R).
solve(top(N,G),St,R,[Id]) :-  % Meta predicate top/2
  !,
  (var(N) -> my_raise_exception(top(N,G),instantiation,'First argument must be ground') ; true),
  (N<1 -> my_raise_exception(generic,syntax(['First argument of top must be greater than 0: ',top(N,G)]),[]) ; true),
  memo(G,St,R,all,N,Id).
solve(distinct(G),St,R,[Id]) :-  % Meta predicate distinct/1
  !,
  memo(G,St,R,distinct,_N,Id).
solve(distinct(Vs,G),St,R,[Id]) :-  % Meta predicate distinct/2
  !,
  G=..[_|Args],
  get_arg_position_list(Vs,Args,Ps),
  copy_term(G,FG),               % Free existential variables, i.e., 
  get_ith_arg_list(Ps,G,DArgs),  % not in Vs
  get_ith_arg_list(Ps,FG,DArgs), % not in Vs
  memo(FG,St,R,distinct((Vs,Ps)),_N,Id).
solve(G,St,R,[Id]) :-            % Non-distinct goal
  memo(G,St,R,all,_N,Id).

% Already called. Extension table with an entry for the current call
% memo(+Goal,+Stratum,+Rule,+Distinct,+TopN,-Id)
memo(G,_St,_,D,N,IdG) :-
  copy_term(G,CG),
  build(G,Q),           % Builds in Q the same call with fresh variables
  called(Q),            % Tries to find a unifiable call in the extension table for the current call
  my_subsumes(Q,G),     % Tests whether the extension table call subsumes the current call
  !,                    % If so,
  et_lookup(G,CG,D,N,IdG),   % use the result in the extension table; otherwise, process the new call with the next memo clause
  inc_goal_computed_tuples(N,CG).
% New call. Extension table without an entry for the current call
memo(G,St,R,D,N,IdG) :-
  my_idx_assertz(called(G)),   % Asserts the current call in the extension table (because: (1) there is no previous call to G, or (2) G is not subsumed by a previous call to G
  copy_term(G,CG),
  set_complete_flag(G,D,N,CF),
  (
   (et_lookup(G,CG,D,N,IdG), % If et is not empty, the first call have to return all the possible answers computed in a previous pass of the fixpoint computation
    inc_goal_computed_tuples(N,CG)
   ) 
  ;
   (
    CF == yes,          % Don't try to recompute a completed computation
    !,
    fail
   )
  ;
   (solve_goal(G,St,R,IdG), % Solves the current call using its matching rules
    build(G,Q),         % Builds in Q the same call with fresh variables
%    write_running_info_log(['Testing subsumption of '])
    no_subsumed_by_et(Q,D,(G,IdG)), % Tests whether there is no entry in the extension table subsuming the current result
    et_assert(G,CG,N,IdG)  % Asserts the new result
   )
  ).

% my_idx_retract(ET) :-
%   retract(ET).  
%   
% my_idx_retractall(ET) :-
%   retractall(ET).
%
% my_idx_assertz(ET) :-
%   assertz(ET).  
%   

my_idx_retract(complete_flag(F,IdF)) :-
  my_term_hash(F, Hash),
  retract(complete_flag(Hash,F,IdF)).  
my_idx_retract(et(F,IdF)) :-
  my_term_hash(F, Hash),
  retract(et(Hash,F,IdF)).  
my_idx_retract(called(F)) :-
  my_term_hash(F,Hash),
  retract(called(Hash,F)).  
  
my_idx_retractall(complete_flag(F,CF)) :-
  retractall(complete_flag(_Hash,F,CF)).  
my_idx_retractall(et(F,IdF)) :-
  retractall(et(_Hash,F,IdF)).  
my_idx_retractall(called(F)) :-
  retractall(called(_Hash,F)).  
  
my_idx_assertz(complete_flag(F,CF)) :-
%  my_term_hash(F,Hash),
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  assertz(complete_flag(Hash,F,CF)).  
my_idx_assertz(et(F,IdF)) :-
%  my_term_hash(F,Hash),
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  assertz(et(Hash,F,IdF)).  
my_idx_assertz(called(F)) :-
%  my_term_hash(F,Hash),
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  assertz(called(Hash,F)).  
  
complete_flag(F,CF) :-
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  my_term_hash(F,Hash),
  complete_flag(Hash,F,CF).
  
et(F,IdF) :-
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  my_term_hash(F,Hash),
  et(Hash,F,IdF).
  
called(F) :-
  (indexing(on) -> my_term_hash(F,Hash) ; true),
  my_term_hash(F,Hash),
  called(Hash,F).
  
% Tests whether there is not an entry in the extension table subsuming the current result
% If duplicates are enabled, identifier chains has to be used to distinguish data sources
% no_subsumed_by_et(+Query,+Distinct,+(Goal,IdGoal))
%no_subsumed_by_et(Q,all,(_G,(_,[_|_]))) :-
no_subsumed_by_et(Q,all,(_G,_IdG)) :-
  % Duplicates ON
  duplicates(on),
  % No entry matching Q; so, not subsumed
  my_not(et_lookup(Q,_CQ,all,_N,_IdQ)),
  !.
no_subsumed_by_et(Q,all,(G,IdG)) :-
  duplicates(on),
  !,
  % If there are existing entries matching Q, they do not subsume G
  % G must have a non recursive chain of ids
  nr_id(IdG),
  my_not((et_lookup(Q,_CQ,all,_N,IdQ),
          my_subsumes((Q,IdQ),(G,IdG)))).
no_subsumed_by_et(Q,distinct((_Vs,Ps)),(G,_IdG)) :-
  % Duplicates ON and DISTINCT/2
  duplicates(on),
  !,
  my_not((
          functor(Q,F,A),
          functor(FQ,F,A),
          get_ith_arg_list(Ps,Q,QAs),
          get_ith_arg_list(Ps,FQ,QAs),
          et(FQ,_Id),
          get_ith_arg_list(Ps,G,GAs),
          my_subsumes(QAs,GAs)
        )).
no_subsumed_by_et(Q,_D,(G,_IdG)) :-
  % Duplicates OFF or DISTINCT
  my_not((et_lookup(Q,_CQ,all,_N,_IdQ),
          my_subsumes(Q,G))).

% et_lookup(+G,+UnsolvedG,+Distinct,?N,-Id)
et_lookup(_G,CG,_D,N,_IdG) :-
  nonvar(N),
  computed_tuples(CG,T),
  T>=N,
  !,
  fail.
et_lookup(G,CG,all,N,IdG) :-
  et(G,IdG),
  more_tuples_needed(CG,N).
et_lookup(G,CG,distinct,N,IdG) :-
  more_tuples_needed(CG,N),
  findall((G,IdG),et(G,IdG),GIdGs),
  setof(G,IdG^my_member((G,IdG),GIdGs),Gs),
  my_member(G,Gs),
  once(my_member((G,IdG),GIdGs)).
et_lookup(G,CG,distinct((Vs,_SG)),N,IdG) :-
  more_tuples_needed(CG,N),
  findall((G,IdG),et(G,IdG),GIdGs),
  my_term_variables(G,GVs),
  my_set_diff(GVs,Vs,EVs),
  build_ex_quantifier(EVs,my_member((G,IdG),GIdGs),QG),
  QQG=IdG^QG, % Ciao needs this!
%   T=..[foo|Vs],
%   setof(T,QQG,Ts),
%   my_member(T,Ts),
  setof(Vs,QQG,Vss),
  my_member(Vs,Vss),
  once(my_member((G,IdG),GIdGs)).

more_tuples_needed(_CG,N) :-
  var(N), % No limits
  !.
more_tuples_needed(CG,N) :-
   (computed_tuples(CG,T)
    ->
    true
    ;
    T=0),
%  computed_tuples(CG,T),
  T<N. % Limit is not yet reached

% Asserts the input fact whenever it does not contain any variable;
% though, it may contain null
% et_assert(G) :-
%   ((my_no_contains_vars(G)
%     ;
%     functor(G,group_by,3)
%     ;
%     (functor(G,F,A), my_aggregate_relation(F,A))
%     ;
%     % Negated, non-ground facts are allowed to be asserted for outer join computations
%    (G=not(NG), functor(NG,NGF,_), [Dolar]="$", name(NGF,[Dolar|_])))
%    ->
%     assertz(et(G))
%    ;
%     my_raise_exception(G,instantiation,'Extension table')).   % Asserts the new result
% If nonground facts are not allowed, some sql translations cannot be computed as:
% select a from s where b not in ((select a from t where t.a=s.a) union (select a from t where b=1))
% in des.ini

% et_assert(+Fact,+OriginalCall,?TupleLimit,+FactId)
et_assert(_G,CG,N,_IdG) :-
  nonvar(N),
  computed_tuples(CG,T),
  T>=N,
  !,
  fail.
et_assert(G,CG,N,IdG) :-
  my_idx_assertz(et(G,IdG)),
  flag_et_change,      % Sets a flag indicating that the extension table has changed
  computed_tuples(T),
  T1 is T+1,
  set_flag(computed_tuples,T1),
  inc_goal_computed_tuples(N,CG),
  display_running_nbr_computed_tuples(T1).
  
inc_goal_computed_tuples(N,_CG) :-
  var(N),
  !.
inc_goal_computed_tuples(_N,G) :-
   (computed_tuples(G,GT) ->
    true
    ;
    GT=0),
%  computed_tuples(G,GT),
  GT1 is GT+1,
  set_flag(computed_tuples(G,GT1)).

display_running_nbr_computed_tuples(_N) :-
  (
   batch(_,_,_)
   ;
   tapi(on)
   ;
   running_info(off)
  ),
  !.  
display_running_nbr_computed_tuples(N) :-
  (N == 1 -> R = tuple ; R = tuples),
%  store_elapsed_time(computation,Time),
%  format_timing(Time,FTime),
%  write_log_list(['Info: ',N,' ',R,' computed. Elapsed time: ',FTime,'\r']),
  write_log_list(['Info: ',N,' ',R,' computed.','\r']),
  flush_output.


% Set complete flag. Distinct and top_n computations are never assumed to be 
% completed since they 
% only ought to compute a subset of the meaning of the involved relation
set_complete_flag(G,D,N,CF) :-
   ((
%      complete_flag(G,CF)) % INCORRECT
%     build(G,SG), % WARNING
      complete_flag(SG,CF), 
      my_subsumes(SG,G))
   -> 
    true 
   ;
    % A computation under a distinct operator is not completely computed
    (((D=distinct;D=distinct(_);nonvar(N))
     ;
    % As built-ins are infinite relations, they can not be completely computed 
     (functor(G,F,_A),my_builtin_pred(F))) -> 
      true
     ;
     (CF = no,
      my_idx_assertz(complete_flag(G,CF))))).

% Non recursive chain of ids
% nr_id((ID,T)) :-
%   my_not(my_member_var_term(ID,T)),
%   !.
nr_id((ID,PairList)) :-
  id_not_in(ID,PairList).
  
id_not_in(_ID,[]) :-
  !.
id_not_in(ID,[(ID,_PairList1)|_PairList]) :-
  !,
  fail.
id_not_in(ID,[(_ID1,PairList1)|PairList]) :-
  id_not_in(ID,PairList1),
  id_not_in(ID,PairList).

% Solving a Goal: solve_goal
solve_goal(not(G),St,R,(-1,[])) :- % Negation; follows the et mechanism
  !, 
  solve_not(G,St,R).
% solve_goal(G,_St,R,(-1,[])) :-     
%   compute_primitive(G,R).
% The only one primitive to be computed here with memoization is 'A is B' 
% where B is ground and contains at least a null value
solve_goal(A is B,_St,_R,IdG) :-
  my_ground(B), 
  contain_null(B),
  !,
  (et_lookup(A is B,_CG,all,_N,IdG),
   !
  ;
   A='$NULL'(Id),
   get_null_id(Id),
   IdG=(-1,[])
  ).
solve_goal(G,St,R,(-1,[])) :-  % Deciding whether a term is null
  compute_builtin_relation(G,St,R).
solve_goal(group_by(A,Vs,C),St,R,(-1,[])) :-     
  compute_group_by(group_by(A,Vs,C),St,R).
solve_goal(G,_St,R,(-1,[])) :-     
  compute_aggregate_pred(G,R).
solve_goal(G,St,_,(RId,AIds)) :-      % Solves a goal using all of its matching rules
  (datalog((G:-B),NVs,RId,Ls,FId,Rs)),
  R=datalog((G:-B),NVs,RId,Ls,FId,Rs),
  solve(B,St,R,AIds).
solve_goal(G,St,_,(RId,AIds)) :-      % Solves a goal using all of its matching rules
  ((datalog(G,NVs,RId,Ls,FId,Rs),B=true)),
  functor(G,F,_A),
  F\==(':-'),
  R=datalog(':-'(G,B),NVs,RId,Ls,FId,Rs),
  solve(B,St,R,AIds).

% Solving Negation: solve_et_not for et_not [SD91] and solve_strata (optimized)
solve_not(G,St,R) :-
  neg(A),
  (A==strata -> 
    solve_strata(G,St,R);
    solve_et_not(G,St)).

solve_strata(G,St,R) :-
  solve(G,St,R), 
  !, 
  fail.
solve_strata(_G,_St,_R).

solve_et_not(G,St) :-
  (solve_star(G,St), fail; true),  % ET* evaluation
  (et(G,_), !, fail; true).        % ET lookup

% Computing Primitives: compute_primitive
compute_primitive(A is B,_R) :-
  my_ground(B), 
  contain_null(B),
  !,
  (et_lookup(A is B,_CG,all,_,_IdG),
   !
  ;
   A='$NULL'(Id),
   get_null_id(Id),
   IdG=(-1,[]),
   et_assert(A is B,A is B,_,IdG)
  ).
compute_primitive(A is B,R) :- 
  my_not(contain_null(B)),
  (my_ground(B) ->
     A is B
    ;
     my_raise_exception(A is B,instantiation,R)).
     
% compute_primitive(A is B,R) :- 
%   ((my_ground(B), my_not(contain_null(B))) ->
%      A is B
%     ;
%      (contain_null(B) ->
%        A='$NULL'(_Id)
%        %my_raise_exception(A is B,instantiation,R)
%       ;
%        my_raise_exception(A is B,instantiation,R))).
compute_primitive(A=B,_R) :- 
  eval_expr(A,EA,R),
  eval_expr(B,EB,R),
  EA=EB.
compute_primitive(A\=B,R) :- 
  ((A='$NULL'(_IDA) ; B='$NULL'(_IDB)) -> fail ; true),
  ((var(A); var(B)) ->
   my_raise_exception(A\=B,instantiation,R)
   ;
   eval_expr(A,EA,R),
   eval_expr(B,EB,R),
   EA\=EB
  ).
compute_primitive(A>B,R)  :- 
  ((var(A); var(B)) ->
   my_raise_exception(A>B,instantiation,R)
   ;
   eval_expr(A,EA,R),
   eval_expr(B,EB,R),
   (number(EA),number(EB) -> 
    EA>EB
    ; 
    ((EA='$NULL'(_IDA) ; EB='$NULL'(_IDB)) ->
     fail 
     ; 
     EA@>EB)
   )
  ).
compute_primitive(A>=B,R) :- 
  ((var(A); var(B)) ->
   my_raise_exception(A>=B,instantiation,R)
   ;
   eval_expr(A,EA,R),
   eval_expr(B,EB,R),
   (number(EA),number(EB) -> 
    EA>=EB
    ; 
%    ((EA='$NULL'(_IDA) ; EB='$NULL'(_IDB)) ->
    ((EA='$NULL'(IdA), var(IdA) 
      ;
      EB='$NULL'(IdB), var(IdB)) ->
     fail 
     ; 
     EA@>=EB)
   )
  ).
compute_primitive(A<B,R)  :- 
  ((var(A); var(B)) ->
   my_raise_exception(A<B,instantiation,R)
   ;
   eval_expr(A,EA,R),
   eval_expr(B,EB,R),
   (number(EA),number(EB) -> 
    EA<EB
    ; 
    ((EA='$NULL'(_IDA) ; EB='$NULL'(_IDB)) ->
     fail 
     ; 
     EA@<EB)
   )
  ).
compute_primitive(A=<B,R) :- 
  ((var(A); var(B)) ->
   my_raise_exception(A=<B,instantiation,R)
   ;
   eval_expr(A,EA,R),
   eval_expr(B,EB,R),
   (number(EA),number(EB) -> 
    EA=<EB
    ; 
%    ((EA='$NULL'(_IDA) ; EB='$NULL'(_IDB)) ->
    ((EA='$NULL'(IdA), var(IdA) 
      ;
      EB='$NULL'(IdB), var(IdB)) ->
     fail 
     ; 
     EA@=<EB)
   )
  ).

is_primitive(_A is _B). 
is_primitive(_A = _B).
is_primitive(_A \= _B).
is_primitive(_A > _B).
is_primitive(_A >= _B).
is_primitive(_A < _B).
is_primitive(_A =< _B).

eval_expr(E,EE,R) :-  
  (my_noncompound_term(E)
   -> 
    EE=E
   ;
    compute_primitive(EE is E,R)).
  
  
compute_group_by(group_by(G,GBVs,C),St,R) :-
  !,
  replace_and_get_aggregates_pairs(C,G,[],AVs,RC),
  build_groups(G,GBVs),
  my_nf_bagof(CG,
%  bagof(CG,
             Ids^
             (et(CG,Ids),
              my_unifiable(CG,G)),
             CGs),
  solve_aggregates_list(AVs,CGs),
  solve(RC,St,R).
  
% Gets pairs (aggregate(Position),Result) from a term including aggregates. 
% It also replaces aggregate(Variable) by Result in the term. Result is a varible which will be unified with the result of the aggregate afterwards
replace_and_get_aggregates_pairs(T,_G,AVs,AVs,T) :- 
  var(T),
  !.
replace_and_get_aggregates_pairs('$NULL'(ID),_G,AVs,AVs,'$NULL'(ID)) :- 
  !.
replace_and_get_aggregates_pairs(C,_G,AVs,[(C,R)|AVs],R) :- 
  arithmetic_function(C,_,_,aggregate,_,0),
  !.
replace_and_get_aggregates_pairs(T,_G,AVs,AVs,T) :- 
  atomic(T),
  !.
replace_and_get_aggregates_pairs(C,G,AVs,[(RC,R)|AVs],R) :- 
  C =.. [F,V],
  arithmetic_function(F,_,_,aggregate,_,1),
  !, 
  G=..[_|Args],
  get_arg_position(V,Args,I),
  RC =.. [F,I].
replace_and_get_aggregates_pairs(C,G,AVsi,AVso,RC) :- 
  C =.. [F|As],
  replace_and_get_aggregates_pairs_list(As,G,AVsi,AVso,RAs),
  RC =.. [F|RAs].

replace_and_get_aggregates_pairs_list([],_G,AVs,AVs,[]) :-
  !.
replace_and_get_aggregates_pairs_list([T|Ts],G,AVsi,AVso,[RT|RTs]) :-
  replace_and_get_aggregates_pairs(T,G,AVsi,AVso1,RT), 
  replace_and_get_aggregates_pairs_list(Ts,G,AVso1,AVso,RTs).
  
% Solves each aggregate(Position,Result) in a list, holding the result in Result, wrt. the list of a computed set CGs
solve_aggregates_list([],_CGs).
solve_aggregates_list([(AF,V)|AVs],CGs) :-
  AF=..[F,I],
  !,
  arg_list(I,CGs,Ns),
  compute_aggr_from_group(F,Ns,V),
  solve_aggregates_list(AVs,CGs).
solve_aggregates_list([(F,V)|AVs],CGs) :-
  compute_aggr_from_group(F,CGs,V),
  solve_aggregates_list(AVs,CGs).

% Computing Aggregate Predicates: compute_aggregate_pred

% compute_aggregate_pred(count(distinct(G),GBVs,O),_R) :-
%   % Count(*) counts all rows, even when some might contain nulls
%   % Other aggregates include an additional argument: the attribute w.r.t the aggregation is computed
%   !,
%   build_groups(G,GBVs),
%   my_nf_setof(CG,
%              Ids^
%              (et(CG,Ids),
%               my_unifiable(CG,G)),
%              CGs),
%   length(CGs,O).
compute_aggregate_pred(count(G,GBVs,O),_R) :-
  % Count(*) counts all rows, even when some might contain nulls
  % Other aggregates include an additional argument: the attribute w.r.t the aggregation is computed
  !,
  build_groups(G,GBVs),
  my_nf_bagof(CG,
             Ids^
             (et(CG,Ids),
              my_unifiable(CG,G)),
             CGs),
  length(CGs,O).
compute_aggregate_pred(count_distinct(G,GBVs,O),_R) :-
  % Count(*) counts all rows, even when some might contain nulls
  % Other aggregates include an additional argument: the attribute w.r.t the aggregation is computed
  !,
  build_groups(G,GBVs),
  my_nf_setof(CG,
             Ids^
             (et(CG,Ids),
              my_unifiable(CG,G)),
             CGs),
  length(CGs,O).
compute_aggregate_pred(Aggr,_R) :-
  % A tuple with a null in the argument position V is omitted in the aggregate computation
  Aggr=..[AF,AR,V,GBVs,O],
  my_aggregate_relation(AF,4),
  ((atom_concat(F,'_distinct',AF),
    R=AR 
     ;
    AR = distinct(R), 
    AF = F)
   -> 
    MetaPred = my_nf_setof 
   ;
    R = AR,
    F = AF,
    MetaPred = my_nf_bagof),
  R=..[_P|Args],
  get_arg_position(V,Args,I),
  build_groups(R,GBVs),
  MetaArgs = [N,
             CR^Ids^
             (et(CR,Ids),
              my_unifiable(CR,R),
              arg(I,CR,N),
              N\='$NULL'(_Id)),
             Ns],
  Goal =.. [MetaPred|MetaArgs],
  call(Goal),
  compute_aggr_from_group(F,Ns,O).
  
%compute_aggr_from_group(count,Ns,O) :- 
%  length(Ns,O).
compute_aggr_from_group(count,Ns,O) :-
  compute_count(Ns,O).
compute_aggr_from_group(count_distinct,DNs,O) :-
  my_remove_duplicates_sort(DNs,Ns),
  compute_count(Ns,O).
compute_aggr_from_group(sum,Ns,O) :- 
  compute_sum(Ns,O).
compute_aggr_from_group(sum_distinct,DNs,O) :- 
  my_remove_duplicates_sort(DNs,Ns),
  compute_sum(Ns,O).
compute_aggr_from_group(times,Ns,O) :- 
  compute_times(Ns,O).
compute_aggr_from_group(times_distinct,DNs,O) :- 
  my_remove_duplicates_sort(DNs,Ns),
  compute_times(Ns,O).
compute_aggr_from_group(avg,Ns,O) :- 
  compute_avg(Ns,O).
compute_aggr_from_group(avg_distinct,DNs,O) :- 
  my_remove_duplicates_sort(DNs,Ns),
  compute_avg(Ns,O).
compute_aggr_from_group(min,Ns,O) :- 
  compute_min(Ns,O).
compute_aggr_from_group(max,Ns,O) :- 
  compute_max(Ns,O).

build_groups(G,GBVs) :-
  G=..[_|Args],
  get_arg_position_list(GBVs,Args,GBVPoss),
  copy_term(G,FG),
  get_ith_arg_list(GBVPoss,FG,FGBVs),
  my_term_variables(FG,FGVs),
  copy_term(GBVs,NVs),
  build_ex_quantifier(FGVs,(et(FG,Ids),abstract_unify_nulls_varlist(FGBVs,NVs,GBVs)),QFG),
  QQFG=Ids^QFG, % Ciao needs this! Instead, it should be written as the remarked line below
  setof(GBVs,QQFG,GBVals),
%  setof(GBVs,Ids^QFG,GBVals),
  !,
  my_member(GBVs,GBVals). % Leave choicepoint to build groups
build_groups(G,_GBVs) :-
  et(G,_Ids),
  !.
% The next clause applies when no group can be found but there are tuples in the input relation.
build_groups(G,_GBVs) :-
  et(G,_Ids),
  !.
% The next clause applies when no group can be found.
% For instance, counting wrt. to no groups returns 0 
build_groups(_G,[]) :-
  !.

build_ex_quantifier([],G,G).
build_ex_quantifier([V|Vs],G,QG) :-
  build_ex_quantifier(Vs,V^G,QG).

arg_list(_I,[],[]) :-
  !.
arg_list(I,[CG|CGs],Ns) :-
  arg(I,CG,N),
  nonvar(N),
  N='$NULL'(_ID),
  !,
  arg_list(I,CGs,Ns).
arg_list(I,[CG|CGs],[N|Ns]) :-
  arg(I,CG,N),
  arg_list(I,CGs,Ns).

  
get_ith_arg_list([],_T,[]).
get_ith_arg_list([P|Ps],T,[A|As]) :-
  arg(P,T,A),
  get_ith_arg_list(Ps,T,As).
    
get_arg_position_list([],_L,[]).
get_arg_position_list([V|Vs],L,[P|Ps]) :-
  get_arg_position(V,L,P),
  get_arg_position_list(Vs,L,Ps).

get_arg_position(V,L,P) :-
  get_arg_position_from(V,L,1,P).

get_arg_position_from(V,[A|_As],I,I) :-
  V==A,
  !.
get_arg_position_from(V,[_A|As],I,NI) :-
  I1 is I+1,
  get_arg_position_from(V,As,I1,NI).
  
compute_count(Ns,C) :-
  compute_count_acc(Ns,0,C).

compute_count_acc([],C,C) :-
  !. 
compute_count_acc([X|Xs],Ci,Co) :-
  nonvar(X),
  X='$NULL'(_ID),
  !,
  compute_count_acc(Xs,Ci,Co).
compute_count_acc([_X|Xs],Ci,Co) :-
  !,
  C1 is Ci+1,
  compute_count_acc(Xs,C1,Co).

compute_avg([],'$NULL'(_Id)) :-
  !.
compute_avg(Ns,O) :-
  compute_sum(Ns,S),
  length(Ns,L),
  O is S/L.

compute_sum([],'$NULL'(_Id)).
compute_sum([N|Ns],S) :-
  compute_sum_acc(Ns,N,S).

compute_sum_acc([],N,N).
compute_sum_acc([N|Ns],TS,S) :-
  NN is N+TS,
  compute_sum_acc(Ns,NN,S).

compute_times([],'$NULL'(_Id)).
compute_times([N|Ns],S) :-
  compute_times_acc(Ns,N,S).

compute_times_acc([],N,N).
compute_times_acc([N|Ns],TS,S) :-
  NN is N*TS,
  compute_times_acc(Ns,NN,S).

compute_min([],'$NULL'(_Id)).
compute_min([N|Ns],M) :-
  compute_min_acc(Ns,N,M).

compute_min_acc([],M,M).
compute_min_acc([N|Ns],TM,M) :-
  compute_primitive(N<TM,_R),
  !,
  compute_min_acc(Ns,N,M).
compute_min_acc([_N|Ns],TM,M) :-
  compute_min_acc(Ns,TM,M).

compute_max([],'$NULL'(_Id)).
compute_max([N|Ns],M) :-
  compute_max_acc(Ns,N,M).

compute_max_acc([],M,M).
compute_max_acc([N|Ns],TM,M) :-
  compute_primitive(N>TM,_R),
  !,
  compute_max_acc(Ns,N,M).
compute_max_acc([_N|Ns],TM,M) :-
  compute_max_acc(Ns,TM,M).

compute_builtin_relation(G,_St,R) :-  
  functor(G,F,A),
  my_builtin_relation(F,A,_M,_K),
  \+ my_aggregate_relation(F,A),
  \+ (F,A)==(group_by,3),
  !,
  ((my_ground(G) ; contain_null(G)) ->
   call(G)
  ;
  my_raise_exception(G,instantiation,R)).

my_raise_exception(G,Mid,R_V) :-
  (seen;true),
  (Mid = instantiation -> 
   Message = exception('Non ground argument(s) found in goal')
   ;
   (Mid = undefined ->
    Message = exception('Undefined predicate')
    ;
    (Mid = basic_goal ->
     Message = exception('The following is not a valid goal:')
     ;
     (Mid = exec ->
      Message = exception('Executing goal:')
      ;
      (Mid = unsupported_in_Prolog ->
       Message = exception('Aggregates are not supported in Prolog mode')
       ;
       (Mid = non_number ->
        Message = exception('Non-numbers found in result set of')
        ;
        (Mid = type ->
         Message = exception('Type error')
         ;
         (Mid = bounds ->
          Message = exception('Bounds error')
          ;
          (Mid = fd_unsupported ->
           Message = exception('FD constraint solving unsupported by underlying Prolog system. ')
           ;
           (Mid = odbc_unsupported ->
            Message = exception('ODBC connections unsupported by underlying Prolog system. Use either binaries or SWI-Prolog or SICStus Prolog sources. ')
            ;
            Message = Mid
           )
           )
         )
        )
       )
      )
     )
    )
   )
  ),
  write_exception_message(G,Message,R_V),
  throw(des_exception(Message)).

write_exception_message(generic,syntax(Message),NVs) :-
  write_error_log(['$tbc']),
  write_cond_unquoted_with_NVs_list(Message,NVs),
  nl_log,
  write_tapi_eot.
write_exception_message(unallowed_identifier(O,I),syntax(_Message),_R_V) :-
  write_error_log(['Built-in identifier "',I,'" is not allowed as a ',O,'.']).
write_exception_message(unknown_column(T,C),syntax(_Message),_R_V) :-
  write_error_log(['Unknown column "',C,'"']),
  display_column_alternatives(T,C).
write_exception_message(unknown_relation(R),syntax(_Message),_R_V) :-
  write_error_log(['Unknown table or view "',R,'"']),
  display_relation_alternatives(R).
write_exception_message(unknown_view(V),syntax(_Message),_R_V) :-
  write_error_log(['Unknown view "',V,'"']),
  display_view_alternatives(V).
write_exception_message(unknown_table(T),syntax(_Message),_R_V) :-
  write_error_log(['Unknown table "',T,'"']),
  display_table_alternatives(T).
write_exception_message(unknown_user_predicate(F/A),syntax(_Message),_R_V) :-
  write_error_log(['Unknown user predicate ',F/A]),
  display_user_predicate_alternatives(F).
write_exception_message(G,M,R_V) :-
  (M=exception(Message), 
   I='Exception'
  ;
   M=syntax(Message), 
   I='Error'
  ;
   M=Message, 
   I='Exception'
  ),
  !,
  (my_is_list(Message) ->
    DisplayMessage = Message
   ;
    DisplayMessage = [Message]
  ),
  write_log_list([I,': ']),
  write_unquoted_with_NVs_list(DisplayMessage,R_V),
  write_log_list([' ']),
  ((nonvar(R_V),R_V=datalog(R,NVs,_Rid,Ls,FId,_Rs)) ->
    write_with_NVs(G,NVs),
    write_log_list([' in the instanced rule:',nl]),
    display_ruleNVs_list([(R,NVs)],11),
    display_rule_info(Ls,FId)
   ;
    (nonvar(R_V),my_is_list(R_V) ->
     write_with_NVs(G,R_V)
    ;
     write_with_NVs(G,[])
    )
  ),
  nl_log.

% Testing whether a term T1 subsumes a term T2
% i.e., T1 is 'more general' than T2

% Aggregates:
% min(p(X,Y),X,[],1) does not subsume min(p(X,2),X,[],1)
% min(p(X,2),X,[],1) does not subsume min(p(X,Y),X,[],1)
% min(p(X,Y),X,[Y],1) does not subsume min(p(X,Y),X,[a],1)
% It suffices to test whether they are the same term up to variable renaming
my_subsumes(General,Specific) :-
  functor(General,AF,Arity),
  (my_aggregate_relation(AF,Arity)
   ;
   (AF,Arity)=(group_by,3)
  ),
  !,
  functor(Specific,AF,Arity),
  my_equal_up_to_renaming(General,Specific).
% p(X,Y) does subsume p(X,2)
% p(X,2) does not subsume p(X,Y)
% p(X,X) does not subsume p(X,Y)
% p(X,Y) does subsume p(X,X)
% p('$NULL'(0)) does not subsume p('$NULL'(1)) 
% p('$NULL'(_Id1)) does subsume p('$NULL'(_Id2)) 
my_subsumes(General,Specific) :-
  \+ \+ (make_ground(Specific),
         General=Specific).

my_equal_up_to_renaming(General,Specific) :-
  \+ \+ (make_ground(General),
         make_ground(Specific),
         General==Specific).

% remove_GBArg(A,RA) :-
%   A =.. [F,P,V,_GB,_O],
%   !,
%   RA =.. [F,P,V].
% remove_GBArg(A,RA) :-
%   A =.. [F,P,_GB,_O],
%   RA =.. [F,P].
     
% Replaces all occurrences of '$NULL'(CteOrVar) by '$NULL'(FreshVar) in a term T
abstract_nulls(T,T) :- 
  (var(T)),
  !.
abstract_nulls('$NULL'(_CteOrVar),'$NULL'(_FreshVar)) :- 
  !.
abstract_nulls(T,T) :- 
  (number(T) ; atom(T)),
  !.
abstract_nulls(C,RC) :- 
  C =.. [F|As],
  !, 
  abstract_nulls_list(As,RAs),
  RC =.. [F|RAs].

abstract_nulls_list([],[]) :-
  !.
abstract_nulls_list([T|Ts],[RT|RTs]) :-
  abstract_nulls(T,RT), 
  abstract_nulls_list(Ts,RTs).

% Replaces all occurrences of '$NULL'(CteOrVar) by '$NULL'(Var) in a term T
abstract_unify_nulls(T,_V,T) :- 
  (var(T)),
  !.
abstract_unify_nulls('$NULL'(_CteOrVar),V,'$NULL'(V)) :- 
  !.
abstract_unify_nulls(T,_V,T) :- 
  (number(T) ; atom(T)),
  !.
abstract_unify_nulls(C,V,RC) :- 
  C =.. [F|As],
  !, 
  abstract_unify_nulls_list(As,V,RAs),
  RC =.. [F|RAs].

abstract_unify_nulls_list([],_V,[]) :-
  !.
abstract_unify_nulls_list([T|Ts],V,[RT|RTs]) :-
  abstract_unify_nulls(T,V,RT), 
  abstract_unify_nulls_list(Ts,V,RTs).

abstract_unify_nulls_varlist([],[],[]) :-
  !.
abstract_unify_nulls_varlist([T|Ts],[V|Vs],[RT|RTs]) :-
  abstract_unify_nulls(T,V,RT), 
  abstract_unify_nulls_varlist(Ts,Vs,RTs).

% Instantiates all variables in Term to fresh constants.
make_ground(Term) :-
  numbervars(Term, 0, _).

make_ground_args(_T,[]).
make_ground_args(T,[P|Ps]) :-
  functor(T,_F,A),
  (A>=P ->
    arg(P,T,Arg),
    make_ground(Arg)
   ;
    true),
  make_ground_args(T,Ps).

%% Tests whether a term does not contain variables
%my_no_contains_vars(T) :-
%  var(T),
%  !,
%  fail.
%my_no_contains_vars('$NULL'(_ID)) :-
%  !.
%my_no_contains_vars(C) :- 
%  C =.. [_F|As],
%  !, 
%  my_no_contains_vars_list(As).
%
%my_no_contains_vars_list([]).
%my_no_contains_vars_list([T|Ts]) :-
%  my_no_contains_vars(T),
%  my_no_contains_vars_list(Ts).
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% remove_undefined
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

remove_undefined(Undefined) :-
  setof(Fact, 
        (et(not(Fact),NIds),
         et(Fact,Ids), 
         my_idx_retract(et(not(Fact),NIds)), 
         my_idx_retract(et(Fact,Ids))), 
        Undefined).
remove_undefined([]).

ground_nulls :-
  et(Fact,Ids),
  concrete_nulls(Fact,GFact,Grounded),
  (Grounded == grounded ->
   my_idx_retract(et(Fact,Ids)),
   my_idx_assertz(et(GFact,Ids))),
  fail.
ground_nulls.
   
%% Assigns a unique ID to each occurrence of '$NULL'(Var) in a term T
concrete_nulls(T) :-
  concrete_nulls(T,T,_Grounded).

%::WARNING: the second argument is the very same as the first, why is it used?
concrete_nulls(Var,Var,_Grounded) :- 
  var(Var),
  !.
concrete_nulls('$NULL'(Var),'$NULL'(Var),grounded) :- 
  var(Var),
  !,
  get_null_id(Var).
concrete_nulls(T,T,_) :- 
  (number(T) ; atom(T)),
  !.
concrete_nulls(C,RC,Grounded) :- 
  C =.. [F|As],
  !, 
  concrete_nulls_list(As,RAs,Grounded),
  RC =.. [F|RAs].

concrete_nulls_list([],[],_Grounded) :-
  !.
concrete_nulls_list([T|Ts],[RT|RTs],Grounded) :-
  !, 
  concrete_nulls(T,RT,Grounded), 
  concrete_nulls_list(Ts,RTs,Grounded).

% Tests whether a term contains a null
contain_null(T) :-
  var(T),
  !,
  fail.
contain_null('$NULL'(_ID)) :-
  !.
contain_null(C) :- 
  C =.. [_F|As],
  !, 
  contain_null_list(As).

contain_null_list([T|_Ts]) :-
  contain_null(T).
contain_null_list([_T|Ts]) :-
  contain_null_list(Ts).

/*********************************************************************/
/* Building a predicate dependency graph: build_pdg/1                */
/*********************************************************************/
% A predicate dependency graph is a pair of a list of predicate nodes 
% (name/arity), and a list of arcs (nto/ato + nfrom/afrom, meaning that
% the predicate nto/ato depends on -has in the rhs of any of its defining
% rules- the predicate nfrom/afrom; alternatively, nto/ato - nfrom/afrom 
% is used when the predicate nfrom/afrom appears negated)
% Follows [ZCF+97]

% TODO: Performance: When connected to an RDB, get its database schema instead of querying with datalog/6

build_pdg(PDG) :-
  write_info_verb_log(['Computing predicate dependency graph...']),
  current_db('$des',_),
  !,
  build_des_pdg([],PDG).  
build_pdg((Nodes,Arcs)) :-
  write_info_verb_log(['- Reading external metadata...']),
  my_odbc_get_table_arity_list(RDBNodes),
  disable_rdb_datasource(_),
  write_info_verb_log(['- Building graph...']),
  build_des_pdg(RDBNodes,(Nodes,Arcs)),
  enable_rdb_datasource.

% get_pdg: Return PDG; build it if not available
get_pdg(PDG) :-
  pdg(PDG),
  !.
get_pdg(PDG) :-
  build_pdg(PDG).

build_des_pdg(RDBNodes,(Nodes,Arcs)) :-
  my_nf_setof(LLArcs,find_pdg_arcs(LLArcs),LLArcs),
  concat_lists(LLArcs,LArcs),
%  remove_duplicates_var(LArcs,Arcs),
  my_remove_duplicates_sort(LArcs,Arcs),
  user_predicates(DESNodes),
  append(RDBNodes,DESNodes,LHSNodes),
  !,
  rhs_nodes(Arcs,RHSNodes),
  my_merge(LHSNodes,RHSNodes,UNodes),
  my_quicksort(UNodes,Nodes),
  display_undefined(RHSNodes,LHSNodes), 
  !.
build_des_pdg(([],[])).

user_predicates(Preds) :-
  my_nf_setof(N/A, 
        H^B^Ls^NVs^RId^FId^Rs^
          ((datalog(':-'(H,B),NVs,RId,Ls,FId,Rs)
           ;
            datalog(H,NVs,RId,Ls,FId,Rs)),
          functor(H,N,A),
          N\==(':-')), 
        Preds).
        
find_pdg_arcs(Arcs) :-
  datalog(':-'(H,B),_,_,_,_,_), 
  functor(H,N,A), 
  pdg_arcs_from_to(B,N/A,Arcs).

pdg_arcs_from_to((B,Bs),P,[Arc|Arcs]) :-
  pdg_arc(B,P,Arc),
  !,
  pdg_arcs_from_to(Bs,P,Arcs).
pdg_arcs_from_to(B,P,[Arc]) :-
  pdg_arc(B,P,Arc).

% Negative dependency
pdg_arc(not(T),P,P-N/A) :- 
  functor(T,N,A), 
  !.
pdg_arc(group_by(T,_Vs,_C),P,P-N/A) :- 
  functor(T,N,A), 
  !.
pdg_arc(Aggr,P,P-N/A) :- 
  my_aggregate_relation(AF,Arity),
  Aggr =.. [AF,T|Args],
  length([T|Args],Arity),
  functor(T,N,A), 
  !.
pdg_arc(lj(T),P,P-N/A) :- 
  functor(T,N,A), 
  !.
pdg_arc(rj(T),P,P-N/A) :- 
  functor(T,N,A), 
  !.
pdg_arc(fj(T),P,P-N/A) :- 
  functor(T,N,A), 
  !.
% Positive dependency
pdg_arc(top(_,T),P,P+N/A) :-      
  !,
  functor(T,N,A), !.
pdg_arc(distinct(T),P,P+N/A) :-      
  !,
  functor(T,N,A), !.
pdg_arc(distinct(_,T),P,P+N/A) :-      
  !,
  functor(T,N,A), !.
pdg_arc(T,P,P+N/A) :-      
  functor(T,N,A), !.

rhs_nodes([],[]).
rhs_nodes([Arc|Arcs],[N/A|Nodes]) :-
  (Arc = _P1-N/A; Arc = _P2+N/A),
  rhs_nodes(Arcs,Nodes).

display_undefined(RHSNodes,LHSNodes) :-
  my_builtin_preds(BIPreds),
  append(LHSNodes,BIPreds,LBIPreds),
  findall(Tablename/Arity,my_table('$des',Tablename,Arity),TAs),
  append(LBIPreds,TAs,Preds),
  my_set_diff(RHSNodes,Preds,UndefPred),
  (UndefPred == [] -> 
   true
   ;
   remove_duplicates_var(UndefPred,RUndefPred),
   my_sort(RUndefPred,SUndefPred),
   write_warning_log(['Undefined predicate(s): ',SUndefPred])).
   
   
display_undeclared_predicate(not(Query)) :-
  display_undeclared_predicate(Query).
display_undeclared_predicate(Query) :-
  functor(Query,F,Arity),
  (
   declared_predicate(F/Arity)
   ->
    true
   ; 
    write_warning_log(['Undeclared predicate(s): ',[F/Arity]])
  ).
  
declared_predicate(F/Arity) :-
  length(Args,Arity),
  P=..[F|Args],
  (my_table('$des',F,Arity)
   ;
   (my_builtin_preds(BIs),
    my_member(F/Arity,BIs)
    ;
    datalog(P,_,_,_,_,_) 
    ; 
    datalog(':-'(P,_),_,_,_,_,_))
  ),
  !.  
  
display_sub_pdg_for(N/A) :-
  (pdg((Ns,As))
   -> 
   (member(N/A,Ns)
    ->
    sub_pdg(N/A,(Ns,As),(SNs,SAs)),
    write_log_list(['Nodes: ',SNs,nl,'Arcs : ',SAs,nl])
    ;
    write_error_log(['Undeclared predicate']),
    display_object_alternatives(user_predicate,N)
   )
   ; 
   write_info_log(['Predicate dependency graph not yet computed.'])
  ).

  
my_builtin_preds(BIPreds) :-
  setof(IR/2,M1^my_infix_relation(IR,M1),IRs),
  setof(IC/2,M2^my_infix_comparison(IC,M2),ICs),
  append(IRs,ICs,BIP1),
  setof(OF/Arity,my_outer_join_relation(OF/Arity),OFs),
  append(BIP1,OFs,BIP2),
  setof(BP/BPArity,builtin_predicate(BP/BPArity),BPs),
  append(BIP2,BPs,BIPreds).

builtin_predicate(dual/0).
% WARNING:
builtin_predicate(not/1).
builtin_predicate(is_null/1).
builtin_predicate(is_not_null/1).
builtin_predicate(top/2).
builtin_predicate(distinct/1).
builtin_predicate(distinct/2).
% WARNING:
builtin_predicate(group_by/3).
builtin_predicate(P/A) :-
  my_aggregate_relation(P,A).

is_null(T) :-
  \+ \+ T='$NULL'(_ID).

is_not_null(T) :-
  T\='$NULL'(_ID).

pdg_arc(ON,DN,[ON+DN|_],ON+DN).
pdg_arc(ON,DN,[ON-DN|_],ON-DN).
pdg_arc(ON,DN,[_|Arcs],Arc) :-
  pdg_arc(ON,DN,Arcs,Arc).
    
  
/*********************************************************************/
/* Building a predicate dependency subgraph: sub_pdg/3               */
/*********************************************************************/
% Given a starting node N and a pdg G, build the subgraph of nodes reachable from N in G

% An empty sub-pdg from an empty pdg
sub_pdg(_N,[],([],[])).
sub_pdg(N,(_Nodes,Arcs),(SNodes,SArcs)) :-
  arcs_from_node(N,Arcs,USArcs),
  my_quicksort(USArcs,SArcs),
  nodes_in(SArcs,DSNodes),
  my_remove_duplicates_sort([N|DSNodes],SNodes).
  
arcs_from_node(N,Arcs,ArcsFromArcs) :-
  arcs_from_node(N,Arcs,ArcsFromNode,RemainingArcs1),
  arcs_from_arcs(ArcsFromNode,RemainingArcs1,SArcs,_RemainingArcs2),
  append(ArcsFromNode,SArcs,ArcsFromArcs),
  !.

% N,Arcs,ArcsFromNode,RemainingArcs
arcs_from_node(_N,[],[],[]).
arcs_from_node(N,[N+DN|Arcs],[N+DN|ArcsFromNode],RemainingArcs) :-
  !,
  arcs_from_node(N,Arcs,ArcsFromNode,RemainingArcs).
arcs_from_node(N,[N-DN|Arcs],[N-DN|ArcsFromNode],RemainingArcs) :-
  !,
  arcs_from_node(N,Arcs,ArcsFromNode,RemainingArcs).
arcs_from_node(N,[Arc|Arcs],ArcsFromNode,[Arc|RemainingArcs]) :-
  arcs_from_node(N,Arcs,ArcsFromNode,RemainingArcs).
  
% ArcsFromNode,Arcs,ArcsFromArcs,RemainingArcs
arcs_from_arcs([],Arcs,[],Arcs).
%arcs_from_arcs([Arc|ArcsNs],Arcs,[Arc|ArcsFromArcs],RemainingArcs) :-
arcs_from_arcs([Arc|ArcsNs],Arcs,ArcsFromArcs,RemainingArcs) :-
  (Arc=ON+DN ; Arc=ON-DN),
  arcs_from_node(DN,Arcs,NArcs,RemainingArcs1),
  arcs_from_arcs(NArcs,RemainingArcs1,AArcs,RemainingArcs2),
  arcs_from_arcs(ArcsNs,RemainingArcs2,AAArcs,RemainingArcs),
  concat_lists([NArcs,AArcs,AAArcs],ArcsFromArcs).

% Nodes in arcs
nodes_in([],[]).
nodes_in([Arc|Arcs],[F,T|Nodes]) :-
  (Arc=F+T
    ;
   Arc=F-T),
  nodes_in(Arcs,Nodes).


/*********************************************************************/
/* Finding a stratification: stratify/3                              */
/*********************************************************************/
% Follows Ullman, but modified for pdg
% Finds a stratification from a given predicate dependency graph, 
% and returns whether it was successful

stratify(S,(N,A),Success) :-
  write_info_verb_log(['Computing strata...']),
  assign_1st_stratum(N,FS),
  length(N,Max),
  lfp_recompute_strata(A,FS,S,Max,Success).

assign_1st_stratum([],[]).
assign_1st_stratum([N/A|Ns],[(N/A,1)|SNs]) :-
  assign_1st_stratum(Ns,SNs).

lfp_recompute_strata(A,Si,Sj,Max,Success) :-
  recompute_strata(A,Si,So,Max,false,Change,SSuccess),
  (SSuccess=false -> fail; true),
  (Change=false -> 
    So=Sj, Success=true, !
   ;
    lfp_recompute_strata(A,So,Sj,Max,Success)).
lfp_recompute_strata(_A,S,S,_Max,false).

recompute_strata([],S,S,_Max,C,C,true) :- !. 
recompute_strata([A|As],Si,Sj,Max,Ci,Co,B) :-
  (A = Nt/At-Nf/Af, Add=1 ; A = Nt/At+Nf/Af, Add=0),
  recompute_stratum(Nt/At,Nf/Af,Add,Si,So,Stratum,C1),
  my_or(Ci,C1,C2),
  (Stratum > Max -> fail ; 
   recompute_strata(As,So,Sj,Max,C2,Co,B)).
% recompute_strata(_A,S,S,_Max,false). % Non-stratifiable program

recompute_stratum(Nt/At,Nf/Af,Add,Si,Sj,Stratum,Change) :-
  find_stratum(Nt/At,Si,Stt),
  find_stratum(Nf/Af,Si,Stf),
  IStf is Stf+Add,
  my_max(Stt,IStf,Stratum),
  (Stt=Stratum -> Change=false, Si=Sj; Change=true, reassign_stratum(Nt/At,Stratum,Si,Sj)).

find_stratum(N/A,[(N/A,Stratum)|_Ps],Stratum) :- !.
find_stratum(N/A,[_P|Ps],Stratum) :-
  find_stratum(N/A,Ps,Stratum).

reassign_stratum(N/A,Stratum,[(N/A,_St)|Ps],[(N/A,Stratum)|Ps]) :- !.
reassign_stratum(N/A,Stratum,[P|Ps],[P|NPs]) :-
  reassign_stratum(N/A,Stratum,Ps,NPs).


/*********************************************************************/
/* Computing Stratification: compute_stratification/0                */
/*********************************************************************/

compute_stratification :-
  clear_stratification,
  build_pdg(G),
  stratify(S,G,Success),
  assertz(pdg(G)),
  (Success==true
   -> 
   assertz(strata(S)),
   !
   ; 
   assertz(strata([non-stratifiable])), 
   !,
   write_warning_log(['Non stratifiable program.'])
  ).


/*********************************************************************/
/* Loading Stratification: load_stratification/2                     */
/*********************************************************************/

load_stratification(S,G) :-
  clear_stratification, 
  assertz(strata(S)),
  assertz(pdg(G)).


/*********************************************************************/
/* Drilling Down Stratification: drilldown_stratification/1          */
/*********************************************************************/

drilldown_stratification(_L) :- %TODO
  compute_stratification.


/*********************************************************************/
/* Rolling Up Stratification: rollup_stratification/1                */
/*********************************************************************/

rollup_stratification(_L) :- %TODO
  compute_stratification.


/*********************************************************************/
/* Reset Stratification: reset_stratification/0                   */
/*********************************************************************/

reset_stratification :- 
  clear_stratification,
  assertz(strata([])),
  assertz(pdg([])).


/*********************************************************************/
/* Clearing Stratification: clear_stratification/0                   */
/*********************************************************************/

clear_stratification :- 
  retractall(strata(_)),
  retractall(pdg(_)).


/*********************************************************************/
/* Save extension table: save_et/1                                   */
/*********************************************************************/

save_et((ESet,CSet,FSet)) :- 
  findall(et(EFact,EIds), (et(EFact,EIds), my_idx_retractall(et(EFact,EIds))), ESet),
  findall(called(CFact), (called(CFact), my_idx_retractall(called(CFact))), CSet),
  findall(complete_flag(FFact,CF), (complete_flag(FFact,CF), my_idx_retractall(complete_flag(FFact,CF))), FSet).


/*********************************************************************/
/* Restore extension table: restore_et/1                             */
/*********************************************************************/

restore_et((ESet,CSet,FSet)) :- 
  my_idx_retractall(et(_EFact,_EIds)),
  my_idx_retractall(called(_CFact)),
  my_idx_retractall(complete_flag(_FFact,_CF)),
  my_apply(my_idx_assertz,ESet),
  my_apply(my_idx_assertz,CSet),
  my_apply(my_idx_assertz,FSet).


/*********************************************************************/
/* Clear extension table: clear_et                                   */
/*********************************************************************/

clear_et :-
  my_idx_retractall(et(_E,_I)),
  my_idx_retractall(called(_C)), 
  my_idx_retractall(complete_flag(_G,_CF)).

  
/*********************************************************************/
/* Listing Datalog Rules (Command): list_rules/1                     */
/*********************************************************************/

list_rules(I) :-
  list_rules_wo_number(I,ODLs),
  display_nbr_rules(ODLs).
  
list_rules_wo_number(I,ODLs) :-
  (development(off) ->
    get_source_dlrules(DLs)
    ;
    get_object_dlrules(DLs)),
  store_elapsed_time(computation),
  my_quicksort_pred(DLs,dlrule_compare_asc,ODLs),
  (development(off) ->
    display_source_dlrule_list(ODLs,I)
    ;
    display_dlrule_list(ODLs,I)).


/*********************************************************************/
/* Listing Datalog Rules matching name and arity (Command): list_rules/3  */
/*********************************************************************/

list_rules(N,A,I) :-
  (development(off) ->
    get_source_dlrules(namearity,N/A,DLs)
    ;
    get_object_dlrules(namearity,N/A,DLs)),
  store_elapsed_time(computation),
  my_quicksort_pred(DLs,dlrule_compare_asc,ODLs),
  (development(off) ->
    display_source_dlrule_list(ODLs,I)
    ;
    display_dlrule_list(ODLs,I)),
  display_nbr_rules(ODLs).


/*********************************************************************/
/* Listing Datalog Rules matching a name (Command): list_rules/2     */
/*********************************************************************/

list_rules(N,I) :-
  list_rules_wo_number(N,I,DLs),
  display_nbr_rules(DLs).
  
list_rules_wo_number(N,I,ODLs) :-
  (development(off) ->
    get_source_dlrules(name,N,DLs)
    ;
    get_object_dlrules(name,N,DLs)),
  store_elapsed_time(computation),
  my_quicksort_pred(DLs,dlrule_compare_asc,ODLs),
  (development(off) ->
    display_source_dlrule_list(ODLs,I)
    ;
    display_dlrule_list(ODLs,I)).


/*********************************************************************/
/* Listing Datalog Rules matching a head (Command): list_rules_from_head/2     */
/*********************************************************************/

list_rules_from_head(H,I) :-
  list_rules_from_head_wo_number(H,I,DLs),
  display_nbr_rules(DLs).
  
list_rules_from_head_wo_number(H,I) :-
  list_rules_from_head_wo_number(H,I,_DLs).  
  
list_rules_from_head_wo_number(H,I,ODLs) :-
  (development(off) ->
    get_source_dlrules(head,H,DLs)
    ;
    get_object_dlrules(head,H,DLs)),
  store_elapsed_time(computation),
  my_quicksort_pred(DLs,dlrule_compare_asc,ODLs),
  (development(off) ->
    display_source_dlrule_list(ODLs,I)
    ;
    display_dlrule_list(ODLs,I)).


/*********************************************************************/
/* Listing Datalog Rules matching a rule (Command): list_rules_from_rule/2     */
/*********************************************************************/

list_rules_from_rule(R,I) :-
  (development(off) ->
    get_source_dlrules(rule,R,DLs)
    ;
    get_object_dlrules(rule,R,DLs)),
  store_elapsed_time(computation),
  my_quicksort_pred(DLs,dlrule_compare_asc,ODLs),
  (development(off) ->
    display_source_dlrule_list(ODLs,I)
    ;
    display_dlrule_list(ODLs,I)),
  display_nbr_rules(ODLs).


/*********************************************************************/
/* Listing Extension Table Contents (Command): list_et               */
/*********************************************************************/

list_et :- 
  write_log_list(['Answers:',nl]),
  list_et_answers,
  write_log_list(['Calls:',nl]),
  list_ct_calls.

list_et_answers :-
  et_entries_by_name_arity(_,_,Bag),
  !,
  display_entries(Bag,OBag),
  display_nbr_of_tuples(OBag,'in the answer table',_Error).
list_et_answers :-
  display_entries([]).

list_ct_calls :-
  ct_entries_by_name_arity(_,_,Bag),
  !,
  display_entries(Bag,OBag),
  display_nbr_of_tuples(OBag,'in the call table',_Error).
list_ct_calls :- 
  display_entries([]).


/*********************************************************************/
/* Listing Extension Table Contents matching a Pattern (Command): list_et/1 */
/*********************************************************************/

list_et(N/A) :- 
  !, 
  write_log_list(['Answers:', nl]), 
  list_et_answers(N/A),
  write_log_list(['Calls:', nl]), 
  list_ct_calls(N/A).
list_et(N) :- 
  list_et(N/_A).

list_et_answers(N/A) :- 
  et_entries_by_name_arity(N,A,Bag),
  !,
  display_entries(Bag,OBag),
  display_nbr_of_tuples(OBag,'in the answer table',_Error).

list_ct_calls(N/A) :- 
  ct_entries_by_name_arity(N,A,Bag),
  display_entries(Bag,OBag),
  display_nbr_of_tuples(OBag,'in the call table',_Error).

% Get solutions already stored in the extension table for a given Goal
get_solutions(Goal,Solutions) :-
  et_entries_by_goal(Goal,Solutions).

  
% et_entries_pred gets entries in et for a predicate specified by either
% +Name/?Arity or simply +Name
% Both Pred and not(Pred) are looked for
% Targeted to list_et
et_entries_by_name_arity(N,A,L) :-
  duplicates(off),
  !,
  findall(S,et_entry_by_name_arity(N,A,S),DL),
  my_remove_duplicates_sort(DL,L).
et_entries_by_name_arity(N,A,L) :-
  findall(S,et_entry_by_name_arity(N,A,S),L).

% Looks for a given entry in et for a given predicate name (including not(Pred))
% Upon backtracking, all matching entries are returned
et_entry_by_name_arity(N,A,S) :-
  nonvar(N),
  nonvar(A), % Look for a concrete pattern
  !,
  functor(E,N,A),
  (
   G=E
   ;
   G=not(E)
  ),
  et_entry_by_goal(G,S).
et_entry_by_name_arity(N,A,S) :-
  et_entry_by_goal(E,S), % No specific pattern is given
  (E=not(NS) ->
    true
   ;
    NS=E
  ),
  functor(NS,N,A).
  
% ct_entries_by_goal get entries in et for the given goal
% (not(Goal) is not looked for)
% Targeted to get_answers
et_entries_by_goal(Goal,L) :-
  duplicates(off),
  !,
  findall(S,et_entry_by_goal(Goal,S),DL),
  my_remove_duplicates_sort(DL,L).
et_entries_by_goal(Goal,L) :-
  findall(S,et_entry_by_goal(Goal,S),L).

% Get entry in et matching its first argument, which can be a variable 
et_entry_by_goal(G,S) :-
  et(G,_Ids),
  ((development(on)
   ;
    tapi(on))
   ->
    S=G
   ;
    hide_nulls(G,S)
  ).
         
% ct_entries_pred gets entries in et for a predicate specified by either
% +Name/?Arity or simply +Name
% Both Pred and not(Pred) are looked for
% Targeted to list_ct
ct_entries_by_name_arity(N,A,L) :-
  duplicates(off),
  !,
  findall(S,ct_entry_by_name_arity(N,A,S),DL),
  my_remove_duplicates_sort(DL,L).
ct_entries_by_name_arity(N,A,L) :-
  findall(S,ct_entry_by_name_arity(N,A,S),L).

% Looks for a given entry in et for a given predicate name (including not(Pred))
% Upon backtracking, all matching entries are returned
ct_entry_by_name_arity(N,A,S) :-
  nonvar(N),
  nonvar(A), % Look for a concrete pattern
  !,
  functor(E,N,A),
  (
   G=E
   ;
   G=not(E)
  ),
  ct_entry_by_goal(G,S).
ct_entry_by_name_arity(N,A,S) :-
  ct_entry_by_goal(E,S), % No specific pattern is given
  (E=not(NS) ->
    true
   ;
    NS=E
  ),
  functor(NS,N,A).
  
% et_entries_by_goal get entries in et for the given goal
% (not(Goal) is not looked for)
% Targeted to get_answers
ct_entries_by_goal(Goal,L) :-
  duplicates(off),
  !,
  findall(S,ct_entry_by_goal(Goal,S),DL),
  my_remove_duplicates_sort(DL,L).
ct_entries_by_goal(Goal,L) :-
  findall(S,ct_entry_by_goal(Goal,S),L).

% Get entry in et matching its first argument, which can be a variable 
ct_entry_by_goal(G,S) :-
  called(G),
  ((development(on)
   ;
    tapi(on))
   ->
    S=G
   ;
    hide_nulls(G,S)
  ).



  
display_entries(L) :-
  display_entries(L,_OL).
  
display_entries(L,OL) :-
  (duplicates(off)
   ->
   OL=L % Already sorted
   ;
   my_sort(L,OL)
  ),
  display_set(OL).
        
/*********************************************************************/
/* Listing Builtins (Command): list_builtins                         */
/*********************************************************************/

list_builtins :-
  list_builtins(_B).
  
list_builtins(B) :-
  (\+ \+ my_infix_comparison(B,M) -> 
    write_log_list(['* Comparison Operators:',nl]),
    Found=true
   ;
    true),
  (my_infix_comparison(B,M),
   atom_concat('   ',B,T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ unary_operator(B,_,M) -> 
    write_log_list(['* Arithmetic Operators:',nl]),
    Found=true
   ;
    true),
  (unary_operator(B,_,M), 
   atom_concat('   ',B,T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ my_infix_arithmetic(B,_,_,M,_) -> 
    write_log_list(['* Arithmetic Operators:',nl]),
    Found=true
   ;
    true),
  (my_infix_arithmetic(B,_,_,M,_),
   atom_concat('   ',B,T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ;
   true),
  (\+ \+ arithmetic_function(B,_,M,arithmetic,_,_) ->
    write_log_list(['* Arithmetic Functions:',nl]),
    Found=true
   ;
    true),
  (arithmetic_function(B,_,M,arithmetic,_,_),
   atom_concat('   ',B,T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ arithmetic_function(B,_,M,aggregate,_,_) ->
    write_log_list(['* Aggregate Functions:',nl]),
    Found=true
   ;
    true),
  (arithmetic_function(B,_,M,aggregate,_,Ar),
   atom_concat_list(['   ',B,'/',Ar],T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ arithmetic_constant(_,B,M) ->
    write_log_list(['* Arithmetic Constants:',nl]),
    Found=true
   ;
    true),
  (arithmetic_constant(_,B,M),
   atom_concat('   ',B,T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ (my_infix_relation(B,M) ; my_builtin_relation(B,A,M,_)) ->
    write_log_list(['* Predicates:',nl]),
    Found=true
   ;
    true),
  (my_infix_relation(B,M),
   atom_concat_list(['   ',B,'/','2'],T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (my_builtin_relation(B,A,M,_),
   number_codes(A,As),
   atom_codes(Ar,As),
   atom_concat_list(['   ',B,'/',Ar],T),
   write_unquoted_tab_log(T,8), 
   write_log(' '), 
   write_log(M), 
   nl_log, 
   fail
   ; 
   true),
  (\+ \+ B=not ->
    write_log_list(['   not/1 Stratified negation',nl]),
    Found=true
   ;
    true),
  (\+ \+ B=answer ->
    write_log_list(['   answer/N',nl,'         Reserved word for the outcome relation of an automatic temporary view',nl]),
    Found=true
   ;
    true),
  !,
  nonvar(Found).


/*********************************************************************/
/* Asserting Datalog Rules: assert_rules                             */
/*********************************************************************/
% Assert rules (R,NVs) w.r.t. the tasks Tasks
% Return rule identifiers for object rules resulting from compiling each R
% Return Error=true on error

assert_rules(RNVs,Tasks,ODLIds,Error) :-
  assert_rules(RNVs,Tasks,[],ODLIds,Error).

assert_rules([],_Tasks,ODLids,ODLids,_Error).
assert_rules([RNVs|RNVss],Tasks,IODLids,OODLids,Error) :-
  assert_rule(RNVs,Tasks,TODLids,Error),
  append(IODLids,TODLids,T2ODLids),
  assert_rules(RNVss,Tasks,T2ODLids,OODLids,Error).

% Assert a rule which may be needed to be transformed
% For /assert command and SQL CREATE VIEW: Without information regarding lines or file ids
assert_rule((Rule,NVs),Tasks,ODLids,Error) :-
  my_datetime(DT),
  assert_rule((Rule,NVs),_RNVss,[],asserted(DT),assert,Tasks,ODLids,Error).

% For both asserting/consulting rules(with information regarding lines and file ids)
assert_rule(RuleNVs,ExRuleNVsList,Ls,FId,Action,Tasks,ODLids,Error) :-
  preprocess(RuleNVs,SiRuleNVsList,SfRuleNVsList,ExRuleNVsList,[],_IArgsList,Action,rule,Causes,Tasks,_Error),
  build_datalog_rules(RuleNVs,ExRuleNVsList,Ls,FId,DLs),
  dl_ids(DLs,ODLids),
%   ((my_member(simplification,Causes), 
%     my_not(my_member(safety,Causes)), 
%     my_not(language(sql))) -> 
  ((my_member(safety,Causes)
   ;
    language(sql)
   ) ->
    true
   ;
    (show_compilations(on) -> 
      (my_member(exploded,Causes) ->
        DRuleNVsList=ExRuleNVsList
        ;
        (my_member(safed,Causes) ->
          DRuleNVsList=SfRuleNVsList
         ;
          (my_member(simplified,Causes) ->
            DRuleNVsList=SiRuleNVsList
           ;
            DRuleNVsList=false
          )
        )
      ),
     (DRuleNVsList==false ->
       true
      ;
       write_log_list(['Info: This rule has been translated into:',nl]),
       display_ruleNVs_list(DRuleNVsList,2)
     )
    ;
     true
    )
  ),
  my_assertz_list(DLs,Error).

% build_datalog_rules(+RuleNVs,+RuleNVsList,+Ls,+FId,-DLs)
build_datalog_rules(RuleNVs,[],Ls,FId,[DL]) :-
  build_datalog_rules(RuleNVs,[RuleNVs],Ls,FId,[DL]).
build_datalog_rules(RuleNVs,[TRuleNVs],Ls,FId,[DL]) :-
  my_equal_up_to_renaming(RuleNVs,TRuleNVs),
  !,
  build_datalog_rule(RuleNVs,Ls,FId,source,DL).
build_datalog_rules(RuleNVs,[(TRule,TNVs)|TRuleNVsList],Ls,FId,[datalog(TRule,TNVs,_Rid,Ls,FId,compilation(Rule,NVs,RuleIds))|DLs]) :-
  (RuleNVs = (':-'(H,B),NVs),
   !,
   Rule = ':-'(H,B)
  ;
   RuleNVs = H,
   Rule = H),
  build_datalog_rule_list(TRuleNVsList,Ls,FId,DLs),
  get_RuleId_list(DLs,RuleIds).
  
build_datalog_rule_list([],_Ls,_Fid,[]).
build_datalog_rule_list([RuleNVs|RuleNVsList],Ls,FId,[DL|DLs]) :-
  build_datalog_rule(RuleNVs,Ls,FId,compiled,DL),
  build_datalog_rule_list(RuleNVsList,Ls,FId,DLs).

build_datalog_rule((Rule,NVs),Ls,FId,Kind,datalog(Rule,NVs,_Rid,Ls,FId,Kind)).
%   my_term_variables(Rule,TVs),
%   relevant_var_names(NVs,TVs,RNVs),
%   assign_new_var_names(TVs,RNVs,NNVs),
%   append(RNVs,NNVs,DLNVs).

% relevant_var_names([],_TVs,[]).
% relevant_var_names([N=V|NVs],TVs,[N=V|RNVs]) :-
%   my_member_var(V,TVs),
%   !,
%   relevant_var_names(NVs,TVs,RNVs).  
% relevant_var_names([_NV|NVs],TVs,RNVs) :-
%   relevant_var_names(NVs,TVs,RNVs).  
  
get_RuleId_list([],[]).
get_RuleId_list([datalog(_Rule,_NVs,RuleId,_Ls,_Fid,_Kind)|DLs],[RuleId|RuleIds]) :-
  get_RuleId_list(DLs,RuleIds).

/*********************************************************************/
/* Retracting Datalog Source Rules: retract_source_dlrule            */
/* Deletes the given source dl rule                                  */ 
/*********************************************************************/

retract_source_dlrule_list([],[],[],_Error).
retract_source_dlrule_list([DL|DLs],[DL|RDLs],RODLs,Error) :-
  retract_source_dlrule(DL,ODLs,RError),
  var(RError),
  !,
  retract_source_dlrule_list(DLs,RDLs,RODLsT,Error),
  append(ODLs,RODLsT,RODLs).
retract_source_dlrule_list([DL|DLs],RDLs,RODLs,true) :-
  write_warning_log(['Rule not retracted:']),
  (development(off) ->
    display_source_dlrule_list([DL],2)
    ;
    display_dlrule_list([DL],2)),
  retract_source_dlrule_list(DLs,RDLs,RODLs,true).

retract_source_dlrule(DL,ODLs,Error) :-
  get_object_dlrules(DL,ODLs),
  retract_dlrule_list(ODLs,Error),
  (Error==true -> 
    reassert_dlrule_list(ODLs)
   ;
    true
   ).
   
reassert_dlrule_list([]).
reassert_dlrule_list([DL|DLs]) :-
  (call(DL) -> 
    true
   ;
    assertz(DL)
  ),
  reassert_dlrule_list(DLs).

  
/*************/
/* Rule ids  */
/*************/

dl_ids([],[]).
dl_ids([datalog(_,_,Id,_,_,_)|DLs],[Id|ODLids]) :-
  dl_ids(DLs,ODLids).
  
  
/*********************************************************************/
/* Retracting Datalog Source Rules: retract_source_rule              */
/* Deletes the given source rule                                     */ 
/*********************************************************************/

retract_source_rule(R,Error) :-
  get_source_dlrules(rule,R,SDLs),
  (SDLs==[] -> 
    write_warning_log(['Nothing retracted.'])
    ;
    SDLs = [SDL|_], % Take only the first rule matching R
    retract_source_dlrule(SDL,ODLs,Error),
    (Error== true ->
      true
     ;
      (verbose(on) ->
        (development(on) -> 
          length(ODLs,Nbr),
          (Nbr==1 -> S =' ' ; S='s '),
          (Nbr==0 -> D = '.' ; D = (':')),
          write_info_log(['',Nbr,' rule',S,'retracted',D]), 
          display_dlrule_list(ODLs,2)
          ; 
          write_info_log(['Rule retracted.']))
       ;
       true),
      abolishET, 
      compute_stratification
    )
  ).
   
/*********************************************************************/
/* Retracting Datalog Rules: retract_rule_list                       */
/* Deletes the given list of object rules                            */ 
/*********************************************************************/

retract_rule_list(Rs,Error) :-
  (nonvar(Rs) -> retract_g_rule_list(Rs,Error) ; true).

retract_g_rule_list([],_Error).
retract_g_rule_list([R|Rs],Error) :-
  retract_rule(R,Error),
  retract_g_rule_list(Rs,Error).

retract_rule((R,_Vs),Error) :-
  retract_rule(R,Error),
  !.
retract_rule(R,Error) :-
  (datalog(R,_,_,_,_,_) ->
   (getFileIdsRule(R,FIds) -> retract_fileids(FIds) ; true),
   my_retract(datalog(R,_,_,_,_,_),Error)
   ;
   (write_warning_log(['Cannot retract.']),
    Error=true)
  ),
  !.
  
/*********************************************************************/
/* Retracting Datalog Rules by Identifier:                           */
/* Deletes the dlrules corresponding to given identifiers            */ 
/*********************************************************************/

retract_rule_by_id_list([],_Error).
retract_rule_by_id_list([Id|Ids],Error) :-
  retract_rule_by_id(Id,Error),
  retract_rule_by_id_list(Ids,Error).
  
retract_rule_by_id(Id,Error) :-
  (datalog(R,_,Id,_,_,_) ->
   (getFileIdsRule(R,FIds) -> retract_fileids(FIds) ; true),
   my_retract(datalog(R,_,Id,_,_,_),Error)
   ;
   (write_warning_log(['Cannot retract.']),
    Error=true)
  ),
  !.


/*********************************************************************/
/* Retracting Datalog Rules: retract_dlrules                         */
/* Deletes the given list of object dlrules                          */ 
/*********************************************************************/

retract_dlrule_list([],_Error).
retract_dlrule_list([DL|DLs],Error) :-
  retract_dlrule(DL,Error),
  retract_dlrule_list(DLs,Error).

retract_dlrule(datalog(R,NVs,RId,Ls,FId,C),Error) :-
  (datalog(R,NVs,RId,Ls,FId,C) ->
   (my_retract(datalog(R,NVs,RId,Ls,FId,C),Error), 
    (R=':-'(H,_B) -> true ; R=H),
    functor(H,F,A),
    functor(OR,F,A),
    (datalog(OR,_,_,_,_,_) -> true ; retract_fileids([FId])))
   ;
   (write_warning_log(['Cannot retract.']),
    Error=true)
  ).


/*********************************************************************/
/* Abolishing Datalog Rules (Command): abolishDL                     */
/*********************************************************************/

abolishDL :- 
  retractall(datalog(_,_,_,_,_,_)), 
  retractall(rule_id(_)),
  enable_rdb_datasource.
  

/*********************************************************************/
/* Abolishing Extension Table: abolishET                             */
/*********************************************************************/

abolishET :- 
  my_idx_retractall(et(_F,_Ids)), 
  my_idx_retractall(called(_C)),
  my_idx_retractall(complete_flag(_G,_CF)).


/*********************************************************************/
/* Abolishing File Table: abolishFT                                  */
/*********************************************************************/

abolishFT :- 
  retractall(filet(_F,_Fid)).


/*********************************************************************/
/* Abolishing Integrity Constraints: abolishIC                       */
/*********************************************************************/

abolishIC :- 
  retractall(my_integrity_constraint(_,_,_,_,_)),
  retractall(my_not_nullables(_,_,_)),
  retractall(my_primary_key(_,_,_)),
  retractall(my_candidate_key(_,_,_)),
  retractall(my_foreign_key(_,_,_,_,_)),
  retractall(my_functional_dependency(_,_,_,_)).


/*********************************************************************/
/* Clear database: reset_database/0                                  */
/*********************************************************************/
% Remove:
% - Integrity constraints
% - File table
% - Datalog rules
% - Extension table
% - Table definitions
% - View definitions
% Reset:
% - Rule identifier seed
% - Null identifier seed
% - Stratification

reset_database :-
  abolishIC,
  abolishFT,
  abolishDL, 
  abolishET, 
  retractall(my_view(_,_,_,_,_,_,_,_,_)),
  retractall(my_table(_,_,_)),
  assertz(my_table('$des',dual,0)),
  retractall(my_attribute(_,_,_,_,_)),
  reset_ids,
  reset_stratification.
  

/*********************************************************************/
/* Get File Ids for Rule Pattern: getFileIdsRule/2                   */
/*********************************************************************/

getFileIdsRule(R,FIds) :- 
  copy_term(R,CR),
  setof(FId,NVs^RId^Ls^Rs^(datalog(CR,NVs,RId,Ls,FId,Rs)),FIds).


/*********************************************************************/
/* Get File Ids for Head Pattern: getFileIdsHead/2                   */
/*********************************************************************/

%getFileIdsHead(H,FIds) :- 
%  copy_term(H,CH),
%  setof(FId,B^NVs^RId^Ls^Rs^
%          ((datalog(':-'(CH,B),NVs,RId,Ls,FId,Rs); 
%            datalog(CH,NVs,RId,Ls,FId,Rs))),
%        FIds).


/*********************************************************************/
/* Get File Ids: getFileIds/2                                        */
/*********************************************************************/

%getFileIds(N/A,FIds) :- 
%  !,
%  setof(FId,H^B^NVs^RId^Ls^Rs^
%          ((datalog(':-'(H,B),NVs,RId,Ls,FId,Rs); 
%            datalog(H,NVs,RId,Ls,FId,Rs)),functor(H,N,A)),
%        FIds).

/*********************************************************************/
/* Get File Ids: getFileIds/2                                        */
/*********************************************************************/

%getFileIds(N,FIds) :- 
%  setof(FId,H^B^NVs^RId^Ls^A^Rs^
%          ((datalog(':-'(H,B),NVs,RId,Ls,FId,Rs); 
%            datalog(H,NVs,RId,Ls,FId,Rs)), functor(H,N,A)),
%        FIds).

  
/*********************************************************************/
/* Retracting File Table Entries: retract_fileids/2                  */
/*********************************************************************/

retract_fileids([]).
retract_fileids([FId|FIds]) :-
  (datalog(_R,_Vs,_Rid,_Ls,FId,_Rs) ->
   true
   ;
   retractall(filet(_,FId))),
  retract_fileids(FIds).

  
/*********************************************************************/
/* Displaying                                                        */
/*********************************************************************/

% For ODBC RDB connection:
display_solutions(NRows) :-
  display_answer(on),
  !,
  ((development(on)
   ;
   tapi(on))
    ->
    Rows=NRows
    ;
    hide_nulls(NRows,Rows)),
  display_bag(Rows),
  display_nbr_of_tuples(Rows,computed,_Error).
display_solutions(Rows) :-
  display_nbr_of_tuples(Rows,computed,_Error).

% For Datalog DDB
display_solutions(G,U) :-
  display_answer(on),
  !,
  write_info_verb_log(['Sorting answer...','\r']),
  et_entries_by_goal(G,L),
  display_entries(L,OL),
  display_notapi_nbr_of_tuples(OL,computed,_Error1),
  display_undefined_solutions(U),
  display_notapi_nbr_of_tuples(U,undefined,_Error2).
display_solutions(G,U) :-
  et_entries_by_goal(G,L),
  display_notapi_nbr_of_tuples(L,computed,_Error1),
  display_notapi_nbr_of_tuples(U,undefined,_Error2).

display_notapi_nbr_of_tuples(_N,_M,_Error) :-
  tapi(on),
  !.
display_notapi_nbr_of_tuples(N,M,Error) :-
  display_nbr_of_tuples(N,M,Error).
  
display_nbr_of_tuples(T,M,Error) :-
  (integer(T) -> N=T ; length(T,N)),
  display_tapi_nbr_of_tuples(N,M,Error).
  
display_tapi_nbr_of_tuples(0,undefined,_Error) :-
  !.
display_tapi_nbr_of_tuples(N,_M,Error) :-
  tapi(on),
  !,
  (var(Error) 
   ->
   write_log_list([N,nl])
   ;
   true).
display_tapi_nbr_of_tuples(N,M,_Error) :-
  (N == 1 -> R = tuple ; R = tuples),
  my_spaces(10,S),
  write_info_log([N,' ',R,' ',M,'.',S]).

display_undefined_solutions([]) :-
  !.
display_undefined_solutions(U) :-
  (tapi(off)
   ->
   write_log_list(['Undefined:',nl])
   ;
   write_log_list(['$undefined',nl])
  ),
  (development(on) ->
    HU=U
    ;
    hide_nulls(U,HU)),
  display_entries(HU,_OHU).
  
display_bag(Ls) :-
  tapi(on),
  !,
  display_tuples(Ls).
display_bag(L) :-
  write_log('{'),
  my_display_list(L),
  write_log_list([nl,'}',nl]).

display_tuples(Ls) :-
  member(L,Ls),
  write_tapi_delimiter,
  display_tuple(L),
  fail.
display_tuples(_Ls).

display_lines(Ls) :-
  member(L,Ls),
  write_log_list([L,nl]),
  fail.
display_lines(_Ls).

display_tuple(L) :-
  L=..[_F|As],
  member(A,As),
  (number(A)
   ->
   write_log_list([A,nl])
   ;
   (A='$NULL'(_Id)
    ->
    write_log_list([null,nl])
    ;
    write_log_list(['''',A,'''',nl])
   )
  ),
  fail.
display_tuple(_L).

% display_ordered_set(L,KeepDuplicates,OL) :-
%   (KeepDuplicates == keep_duplicates -> 
%     my_sort(L,OL)
%    ;
%     my_remove_duplicates_sort(L,OL)
%   ),
%   display_set(OL).
  
display_set(L) :-
  tapi(on),
  !,
  display_tuples(L).
display_set(L) :-
  write_log('{'),
  my_display_list(L),
  write_log_list([nl,'}',nl]).

my_display_list([]).
my_display_list([X]) :-
  write_log_list([nl,'  ']),
  write_log_fresh_NVs(X). 
my_display_list([X,Y|Xs]) :-
  write_log_list([nl,'  ']),
  write_log_fresh_NVs(X),
  write_log(','), 
  my_display_list([Y|Xs]).

display_rule_info(Ls,FId) :-
  (filet(F,FId)->
    write_cmd_log_list(['$tab'(11),'File : ',F,nl,
                        '$tab'(11),'Lines: ',Ls])
   ;
    FId=asserted((Y,M,D,H,Mi,S)),
    write_cmd_log_list(['$tab'(11),'Asserted at ',H,':',Mi,':',S,' on ',M,'-',D,'-',Y,'.'])
  ).

% Displaying number of rules
display_nbr_rules(_L) :-
  tapi(on),
  !,
  write_tapi_eot.
display_nbr_rules(L) :-
  length(L,N),
  (N==1 -> S = ' listed.' ; S = 's listed.'),
  TInfoList = ['Info: ',N,' rule',S,nl],
  (compact_listings(on) -> InfoList=TInfoList ; InfoList=[nl|TInfoList]),
  write_log_list(InfoList).
  

% Displaying Datalog rules
%display_dlrule_list(DLs) :-
%  display_dlrule_list(DLs,0).

display_source_dlrule_list(DLs,I) :-
  source_dlrule_to_ruleNV_list(DLs,RNVss),
  display_ruleNVs_list(RNVss,I).

display_dlrule_list(DLs,I) :-
  dlrule_to_ruleNV_list(DLs,RNVss),
  display_ruleNVs_list(RNVss,I).

% display_ruleNVs_list(+Rs,+I)
% Display rules in the format (Head :- Body,NVs), with indentation I
display_ruleNVs_list(RNVss,I) :-
  (development(on) ->
    DRNVss=RNVss
    ;
    hide_nulls(RNVss,DRNVss)),
  write_rulesNVs_list(DRNVss,I).
  
% display_rules_list(+Rs,+I)
% Display rules in the format Head :- Body, with indentation I
display_rules_list(Rs,I) :-
  rule_to_ruleNV_list(Rs,[],DisplayRules),
  display_ruleNVs_list(DisplayRules,I).
  
% Replaces all occurrences of '$NULL'(Cte) by the constant null in a term T
% only in non-development mode   
development_hide_nulls(T,T) :-
  development(on),
  !.
development_hide_nulls(T,HT) :-
  hide_nulls(T,HT).

 

% Replaces all occurrences of '$NULL'(Cte) by the constant null in a term T
hide_nulls(V,V) :- 
   var(V),
   !.
hide_nulls('$NULL'(_ID),null) :- 
  !.
hide_nulls(T,T) :- 
  (number(T) ; atom(T)),
  !.
hide_nulls(C,RC) :- 
  C =.. [F|As],
  !, 
  hide_nulls_list(As,RAs),
  RC =.. [F|RAs].

hide_nulls_list([],[]) :-
  !.
hide_nulls_list([T|Ts],[RT|RTs]) :-
  !, 
  hide_nulls(T,RT), 
  hide_nulls_list(Ts,RTs).  
  
write_rulesNVs_list([],_I).
write_rulesNVs_list([RNVs|RNVss],I) :-
  write_datalog_rule(RNVs,I),
  nl_log,
  write_rulesNVs_list(RNVss,I).

% Rules, no pretty print
write_datalog_rule((':-'(Head,Body),NVs),I) :-
  pretty_print(off),
  !,
  write_indent(I),
  write_with_NVs(Head,NVs), 
  write_log(' :- '),
  write_with_NVs(Body,NVs),
  write_log('.').
% Rules, pretty-print
write_datalog_rule((':-'(Head,Body),NVs),I) :-
  !,
  write_indent(I),
  write_with_NVs(Head,NVs), 
  write_log(' :-'),
  nl_log,
  I1 is I+2,
  write_goals_with_NVs(Body,NVs,I1),
  write_log('.').
% Integrity constraints, no pretty-print
write_datalog_rule((':-'(Body),NVs),I) :-
  pretty_print(off),
  !,
  write_indent(I),
  write_log(':- '),
  write_with_NVs(Body,NVs),
  write_log('.').
% Integrity constraints, pretty-print
write_datalog_rule((':-'(Body),NVs),I) :-
  !,
  write_indent(I),
  write_log(':-'),
  nl_log,
  I1 is I+2,
  write_goals_with_NVs(Body,NVs,I1),
  write_log('.').
% Facts, pretty-print
write_datalog_rule((F,NVs),I) :-
  write_indent(I),
  write_with_NVs(F,NVs),
  write_log('.').

write_goals_with_NVs(Goals,NVs,I) :-
  write_goals_with_NVs(Goals,NVs,_OP,0,I).

%write_goals_with_NVs(+Goals,+NVs,?OpenParenthesis,+Depth,+Indent).
write_goals_with_NVs((Goal,Goals),NVs,OP,D,I) :-
  !,
%  write_indent(I),
  write_goals_with_NVs(Goal,NVs,OP,D,I),
%  write_with_NVs(Goal,NVs),
  write_log(','),
  nl_log,
  D1 is D+1,
  write_goals_with_NVs(Goals,NVs,_,D1,I).
write_goals_with_NVs((Goal;Goals),NVs,OP,D,I) :-
  !,
%  write_indent(I),
  (D>0 -> OP=true ; true),
  write_goals_with_NVs(Goal,NVs,OP,D,I),
  nl_log,
  write_indent(I),
  write_log(';'),
  nl_log,
  D1 is D+1,
  (D>0 -> I1 is I+1 ; I1=I),
  write_goals_with_NVs(Goals,NVs,_OP,D1,I1),
  (D>0 -> write_log(')') ; true).
write_goals_with_NVs(Goal,NVs,OP,_D,I) :-
  write_indent(I),
  (nonvar(OP) -> write_log('(') ; true),
  write_with_NVs(Goal,NVs).

% write_op_goals_with_NVs(Goal,NVs,D,I),
%   (D>0 -> write_log('(') ; true),
%   write_goals_with_NVs(Goal,NVs,D,I).

/*********************************************************************/
/* Consulting a list of Datalog programs (Command): consult_DL_list  */
/*********************************************************************/

consult_DL_list(Files,Success) :-
  consult_DL_list(Files,0,0,false,Success).

consult_DL_list([],NbrRules,NbrCtrs,Success,Success) :-
  display_nbr_consulted_rules(no_log,NbrRules),
  nl_log,
  display_nbr_consulted_ctrs(no_log,NbrCtrs).
consult_DL_list([File|Files],NbrRulesi,NbrCtrsi,Si,So) :-
  consult_DL(File,NbrRules,NbrCtrs,S),
  my_or(S,Si,S1),
  NbrRuleso is NbrRulesi+NbrRules,
  NbrCtrso is NbrCtrsi+NbrCtrs,
  consult_DL_list(Files,NbrRuleso,NbrCtrso,S1,So).

display_nbr_running_consulted_rules(Log,NbrRules) :-
  running_info(on),
  verbose(off),
  tapi(off),
  !,
  display_nbr_consulted_rules(Log,NbrRules),
  write_log_list(['\r']).
%  write_log_list([nl]).
display_nbr_running_consulted_rules(_Log,_NbrRules).
  
display_nbr_consulted_rules(log,NbrRules) :-
  (output(on) ->
    (NbrRules == 1 -> RulesTxt = rule ; RulesTxt = rules),
    write('Info: '),
    write(NbrRules),
    write(' '),
    write(RulesTxt),
    write(' consulted.'),
    flush_output
   ;
    true).
display_nbr_consulted_rules(no_log,NbrRules) :-
  (NbrRules == 1 -> RulesTxt = rule ; RulesTxt = rules),
  write_log_list(['Info: ',NbrRules,' ',RulesTxt,' consulted.']),
  flush_output.
  
display_nbr_consulted_ctrs(_Log,0) :-
  !.
display_nbr_consulted_ctrs(log,NbrCtrs) :-
  (output(on) ->
    (NbrCtrs == 1 -> CtrsTxt = constraint ; CtrsTxt = constraints),
    write('Info: '),
    write(NbrCtrs),
    write(' '),
    write(CtrsTxt),
    write(' consulted.'),
    nl,
    flush_output
   ;
    true).
display_nbr_consulted_ctrs(no_log,NbrCtrs) :-
  (NbrCtrs == 1 -> CtrsTxt = constraint ; CtrsTxt = constraints),
  write_log_list(['Info: ',NbrCtrs,' ',CtrsTxt,' consulted.',nl]),
  flush_output.
  
/*********************************************************************/
/* Consulting a Datalog Program (Command): consult_DL                */
/*********************************************************************/

consult_DL(F,NbrRules,NbrCtrs,true) :-
  current_input(OldInput),
  try_open(F,CFN,St),       % Try to open file F, which has the complete file name CFN
  assertz(consult(CFN,St)),
  my_new_file_id(CFN,FId),
  write_info_verb_log(['Consulting ',F,'...']),
  consult_DL_rules(FId,0,NbrRules,0,NbrCtrs),
  try_close(St),                % Close the file
  retractall(consult(_,_)),
  set_input(OldInput).
consult_DL(F,0,0,false) :-
  write_log_list(['Reading file ''',F,'''.',nl]),
%  (consult(_,St) -> try_close(St), retractall(consult(_,_)) ; true).
  (consult(_,St) -> try_close(St) ; true).

consult_DL_rules(FId,NbrRulesi,NbrRuleso,NbrCtrsi,NbrCtrso) :-
  % Read a term, along with its variable names and line numbers
  catch(my_read(T,NVs,Ls),Msg,my_read_message(FId,Msg)),
  var(Msg),
  !,
  process_term(T,RNVss,NVs,Ls,FId,consult,TermType,Error), % Process it, i.e., parse and assert
  incr_nbr_rules_ctrs(Error,TermType,NbrRulesi,NbrRules1,NbrCtrsi,NbrCtrs1),
  ((verbose(on) ; Error == true) -> 
   (development(on) ->
     display_ruleNVs_list(RNVss,2)  % Lists the compiled rules
     ;
     display_ruleNVs_list([(T,NVs)],2)) % Lists the source rule
   ; 
   true), 
  (Error == true ->
    display_rule_info(Ls,FId),
    nl_log
   ;
    true),
%    display_nbr_running_consulted_rules(NbrRules1)),
  (T == end_of_file
   ->
   NbrRuleso = NbrRulesi,
   NbrCtrso = NbrCtrsi
   ;
   (TermType==rule
    ->
    (log(_,_) ->
      display_nbr_running_consulted_rules(log,NbrRules1)
     ;
      display_nbr_running_consulted_rules(no_log,NbrRules1)
    )
    ;
    true
   ),
    consult_DL_rules(FId,NbrRules1,NbrRuleso,NbrCtrs1,NbrCtrso)
  ).
consult_DL_rules(_Fid,NbrRules,NbrRules,NbrCtrs,NbrCtrs).

incr_nbr_rules_ctrs(Error,_TermType,NbrRules,NbrRules,NbrCtrs,NbrCtrs) :-
  Error==true,
  !.
incr_nbr_rules_ctrs(_Error,TermType,NbrRulesi,NbrRuleso,NbrCtrsi,NbrCtrso) :-
  incr_nbr_rules(TermType,NbrRulesi,NbrRuleso),
  incr_nbr_constraints(TermType,NbrCtrsi,NbrCtrso).
  
incr_nbr_rules(rule,NbrRulesi,NbrRuleso) :-
  !,
  NbrRuleso is NbrRulesi+1.
incr_nbr_rules(_No_rule,NbrRules,NbrRules).
  
incr_nbr_constraints(constraint,NbrCtrsi,NbrCtrso) :-
  !,
  NbrCtrso is NbrCtrsi+1.
incr_nbr_constraints(_No_constraint,NbrCtrs,NbrCtrs).
  
%write_term_list([],_I,_NVs).
%write_term_list([T|Ts],I,NVs) :-
%  my_spaces(I,S),
%  write_log(S),
%  write_with_NVs(T,NVs), 
%  write_log('.'), 
%  nl_log,
%  write_term_list(Ts,I,NVs).


%  
% process_term(+Term,-RNVss,+NVs,+Lines,+File_Id,Action,-TermType,-Error)
% TermType = end_of_file | constraint | rule
% Action = consult | assert
%  
process_term(end_of_file,[(end_of_file,[])],_NVs,_Ls,_Fid,_Action,end_of_file,_Error) :-
  !.
process_term(':-'(Constraint),[],NVs,Ls,FId,Action,constraint,Error) :-
  !,
  my_term_to_string(':-'(Constraint),SConstraint,NVs),
  (parse_datalog_constraint(PConstraint,PNVs,SConstraint,[]) ->
    process_datalog_constraints(PConstraint,PNVs,Ls,FId,Action,Error)
   ;
    write_error_log(['Syntax error in constraint.']) 
  ).
process_term(NT,RNVss,NVs,Ls,FId,Action,rule,Error) :-
  (NT=':-'(NHead,NBody),
   T=':-'(Head,Body), !
   ;
   NT=NHead,
   T=Head), 
  my_term_to_string(NHead,SHead,NVs),
  (parse_head(Head,[],HNVs,SHead,[]) -> 
   true
   ; 
   write_error_log(['Syntax error in rule head.']), 
   Error=true),
  (nonvar(NBody)->
    ((my_term_to_string(NBody,SBody,NVs),
      parse_body(Body,HNVs,BNVs,SBody,[]) ->
     true
     ; 
     write_error_log(['Syntax error in rule body.']), 
     Error=true))
    ; 
    BNVs=HNVs),
%  The following yields to non-termination when safety translations are enabled and syntax error is detected
%  ((var(Error);safe(on)) -> 
  (var(Error) -> 
% nulls were not translated to '$NULL' with the following:
%     assert_rule((NT,BNVs),RNVss,Ls,FId,Action,_Tasks,_ODLIds,Error)
     append(NVs,BNVs,NNVs),
     assert_rule((T,NNVs),RNVss,Ls,FId,Action,[],_ODLIds,Error)
    ; 
     RNVss=[(NT,NVs)]
  ), 
  !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrity constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Processing an integrity constraint entails:
%  1- Check whether it is correctly declared
%  2- Check whether it holds in the current database
%  3- If so, assert it
  
% Predefined integrity constraints
process_datalog_constraints(Ctr,NVs,Ls,FId,_Action,Error) :-
  my_list_to_tuple(CtrList,Ctr),
  my_apply(predef_constraint,CtrList),  % Check that every element in CtrLis is a predefined constraint
  !,
  process_predef_constraints_list(CtrList,NVs,Ls,FId,Error).
% User-defined integrity constraints
process_datalog_constraints(my_integrity_constraint(Preds,Constraint),NVs,Ls,FId,_Action,Error) :-
  process_userdef_constraint(my_integrity_constraint(Preds,Constraint),NVs,Ls,FId,Error).
  
% Process user-defined constraints  
process_userdef_constraint(my_integrity_constraint(Preds,Constraint),NVs,_Ls,_Fid,Error) :-
  build_head_from_body(Constraint,NVs,_IArgs,Head),
  post_table_constraint(_Tablename,my_integrity_constraint('$des',Preds,Constraint,NVs,Head),check,Error).
  
% Supported predefined contraints:  
% Type integrity constraint  
predef_constraint(type(_,_)).
% Not nullable integrity constraint  
predef_constraint(nn(_,_)).
% Primary key integrity constraint  
predef_constraint(pk(_,_)).
% Candidate key integrity constraint  
predef_constraint(ck(_,_)).
% Foreign key integrity constraint  
predef_constraint(fk(_,_,_,_)).
% Functional dependency integrity constraint  
predef_constraint(fd(_,_,_)).

% Process a list of predefined constraints (type, nn, pk, ck, fk, fd)

process_predef_constraints_list([],_NVs,_Ls,_Fid,_Error) :-
  !.
process_predef_constraints_list([Ctr|Ctrs],NVs,Ls,FId,Error) :-
  process_predef_constraint(Ctr,NVs,Ls,FId,Error),
%  Error \== true,
  !,
  process_predef_constraints_list(Ctrs,NVs,Ls,FId,Error).
%process_predef_constraints_list(_,_NVs,_Ls,_Fid,true).


% Process a predefined constraint

%    
% Type integrity constraint (type)
%    
process_predef_constraint(type(Pred,ColnameTypes),_NVs,_Ls,_Fid,_Error) :-
  current_db('$des',_),
  ColnameTypes=[_C:_T|_CTs],
  %dlcolnametypes_colnametypes(DLColnameTypes,ColnameTypes),
  !,
  assert_type_ctr(Pred,ColnameTypes).
process_predef_constraint(type(Pred,Types),_NVs,_Ls,_Fid,_Error) :-
  current_db('$des',_),
  %dltypes_types(DLTypes,Types),
  !,
  build_default_attr_name_type_list(Types,ColnameTypes),
  assert_type_ctr(Pred,ColnameTypes).
process_predef_constraint(type(_Pred,_DLTypes),_NVs,_Ls,_Fid,true) :-
  my_not(current_db('$des',_)),
  !,
  write_error_log(['Cannot add type declaration with an opened ODBC connection.']).
%   ,
%   (consult(_,_) ->
%     true
%    ;
%     display_ruleNVs_list([(type(Pred,DLTypes),NVs)],8),
%     display_rule_info(Ls,FId)
%   ).
process_predef_constraint(type(Pred,DLTypes),NVs,Ls,FId,true) :-
  !,
  write_error_log(['Invalid type declaration:']),
  display_ruleNVs_list([(type(Pred,DLTypes),NVs)],8),
  display_rule_info(Ls,FId).
%    
% Not nullable integrity constraint (nn)
%    
process_predef_constraint(nn(Pred,Columns),_NVs,_Ls,_Fid,Error) :-
  my_remove_duplicates_sort(Columns,OColumns), 
  (my_table('$des',Pred,_Arity) ->
    post_table_constraint(Pred,not_nullables(OColumns),check,Error),
    (var(Error), verbose(on) ->
      write_log_list(['Info: Not nullable integrity constraint successfully imposed.',nl,'      Resulting schema: ',nl]),
      list_schema(Pred),
      nl_compact_log
     ;
      true
    )
   ;
    write_error_log(['Relation ',Pred,' has not been typed yet.'])
  ).
%    
% Primary key integrity constraint (pk)
%    
process_predef_constraint(pk(Pred,Columns),_NVs,_Ls,_Fid,Error) :-
  my_remove_duplicates_sort(Columns,OColumns), 
  (my_table('$des',Pred,_Arity) ->
    post_table_constraint(Pred,primary_key(OColumns),check,Error),
    (var(Error), verbose(on) ->
      write_log_list(['Info: Primary key integrity constraint successfully imposed.',nl,'      Resulting schema: ',nl]),
      list_schema(Pred),
      nl_compact_log
     ;
      true
    )
   ;
    write_error_log(['Relation ',Pred,' has not been typed yet.'])
  ).
%    
% Candidate key integrity constraint (ck)
%    
process_predef_constraint(ck(Pred,Columns),_NVs,_Ls,_Fid,Error) :-
  my_remove_duplicates_sort(Columns,OColumns), 
  (my_table('$des',Pred,_Arity) ->
    post_table_constraint(Pred,candidate_key(OColumns),check,Error),
    (var(Error), verbose(on) ->
      write_log_list(['Info: Candidate key integrity constraint successfully imposed.',nl,'      Resulting schema: ',nl]),
      list_schema(Pred),
      nl_compact_log
     ;
      true
    )
   ;
    write_error_log(['Relation ',Pred,' has not been typed yet.'])
  ).
%    
% Foreign key integrity constraint (fk)
%    
process_predef_constraint(fk(FKPred,FKColumns,PKPred,PKColumns),_NVs,_Ls,_Fid,Error) :-
  my_remove_duplicates_sort(FKColumns,OFKColumns), 
  my_remove_duplicates_sort(PKColumns,OPKColumns), 
  (my_table('$des',FKPred,_FKArity) ->
    post_table_constraint(FKPred,foreign_key(OFKColumns,PKPred,OPKColumns),check,Error),
    (var(Error), verbose(on) ->
      write_log_list(['Info: Foreign key integrity constraint successfully imposed.',nl,'      Resulting schema: ',nl]),
      list_schema(FKPred),
      nl_compact_log
     ;
      true
    )
   ;
    write_error_log(['Relation ',FKPred,' has not been typed yet.'])
  ).
%    
% Functional dependency integrity constraint (fd)
%    
process_predef_constraint(fd(Pred,Columns,DepColumns),_NVs,_Ls,_Fid,Error) :-
  my_remove_duplicates_sort(Columns,OColumns), 
  my_remove_duplicates_sort(DepColumns,ODepColumns), 
  (my_set_diff(ODepColumns,OColumns,[]) ->
    write_warning_log(['Trivial functional dependency. Not asserted.'])
   ;
    (my_table('$des',Pred,_Arity) ->
      post_table_constraint(Pred,functional_dependency(OColumns,ODepColumns),check,Error),
      (var(Error), verbose(on) ->
        write_log_list(['Info: Functional dependency integrity constraint successfully imposed.',nl,'      Resulting schema: ',nl]),
        list_schema(Pred),
        nl_compact_log
       ;
        true
      )
     ;
      write_error_log(['Relation ',Pred,' has not been typed yet.'])
    )
  ).
  
build_default_attr_name_type_list(Types,ColnameTypes) :-
  build_default_attr_name_type_list(1,Types,ColnameTypes).  
  
build_default_attr_name_type_list(_ColNbr,[],[]).
build_default_attr_name_type_list(ColNbr,[Type|Types],[Colname:Type|ColnameTypes]) :-
  ensure_atom(ColNbr,AColNbr),
  atom_concat('$',AColNbr,Colname),
  ColNbr1 is ColNbr+1,
  build_default_attr_name_type_list(ColNbr1,Types,ColnameTypes).
  
assert_type_ctr(Pred,_ColnameTypes) :-
  (my_not_nullables('$des',Pred,_)
   ;
   my_primary_key('$des',Pred,_)
   ;
   my_candidate_key('$des',Pred,_)
   ;
   my_foreign_key('$des',Pred,_,_,_)
   ;
   my_functional_dependency('$des',Pred,_,_)
  ),
  !,
  write_error_log(['Cannot change type assertion while other constraints remain.']).
assert_type_ctr(Pred,ColnameTypes) :-
  length(ColnameTypes,Arity),
  my_table('$des',Pred,Arity1),
  Arity\==Arity1,
  !,
  write_error_log(['Cannot add types to a relation with several arities.']),
  write_log_list(['       Relation: ',Pred,nl]).
assert_type_ctr(Tablename,NewColnameTypes) :-
  length(NewColnameTypes,Arity),
  % Remove the old type schema, if any:
  pop_type_declaration(Tablename,Arity,_DeclaredTypes,DeclaredColnameTypes),
  % Check whether the new type is consistent with the loaded database
  (check_ctr(my_types('$des',Tablename,NewColnameTypes)) ->
    % If consistent, assert new type declaration
    push_type_declaration(Tablename,Arity,NewColnameTypes), 
    Schema=..[Tablename|NewColnameTypes],
    write_verb_list(['Info: Types successfully imposed.',nl,'      Resulting schema: ',Schema,nl])
   ;
    % Otherwise, recover the old type schema
    push_type_declaration(Tablename,Arity,DeclaredColnameTypes) % Type error: Restore the old type, if any
  ).
  
swap_table_definition(Pred,OColnameTypes,ColnameTypes) :-
  var(ColnameTypes),
  !,
  length(OColnameTypes,Arity),
  retract(my_table('$des',Pred,Arity)),
  retractall(my_attribute('$des',_I,Pred,_C,_T)).
swap_table_definition(Pred,OColnameTypes,ColnameTypes) :-
  length(ColnameTypes,Arity),
  (retract(my_table('$des',Pred,Arity)) -> 
    get_table_typed_arguments(Pred,OColnameTypes),
    retractall(my_attribute('$des',_I,Pred,_C,_T))
   ;
    true
  ),
  assert_table_schema(Pred,ColnameTypes).
  
% Drop constraints

drop_ic(type(Tablename,ColumnsTypes),_NVs) :-
  length(ColumnsTypes,Arity),
  (my_view(_DB,Tablename,Arity,_SQLst,_Lang,_RNVss,_ODLIds,_LVDs,_SCs) ->
    write_warning_log(['Views cannot be untyped.'])
   ;
    (my_table('$des',Tablename,Arity),
     get_table_typed_schema(Tablename,Table),
     Table=..[Tablename|ColumnsTypes]
     ->
     (bagof(Ctr,
      (Ctr=my_not_nullables('$des',Tablename,_NNAtts), call(Ctr)
       ;
       Ctr=my_primary_key('$des',Tablename,_PKAtts), call(Ctr)
       ;
       Ctr=my_candidate_key('$des',Tablename,_CKAtts), call(Ctr)
       ;
       Ctr=my_foreign_key('$des',Tablename,_PAtts,_FKTablename,_FKAtts), call(Ctr)
       ;
       Ctr=my_functional_dependency('$des',Tablename,_FDAtts,_FDDetAtts), call(Ctr)
      ), Ctrs)
      ->
       write_error_log(['Cannot retract type declaration.',nl,'Other constraints remain:',nl,Ctrs])
      ;
       retractall(my_table('$des',Tablename,Arity)),
       retractall(my_attribute('$des',_Pos,Tablename,_Attr,_Type)),
       display_ic_dropped
     )
    ;
     display_ic_does_not_exist
    )
  ).
drop_ic(nn(Tablename,Columns),_NVs) :-
  my_quicksort(Columns,OColumns),
  (my_not_nullables('$des',Tablename,OColumns) ->
    retractall(my_not_nullables('$des',Tablename,OColumns)),
    display_ic_dropped
   ;
    display_ic_does_not_exist).
drop_ic(pk(Tablename,Columns),_NVs) :-
  my_quicksort(Columns,OColumns),
  (my_primary_key('$des',Tablename,OColumns) ->
    (bagof([':-'(fk(T,Cs,Tablename,OColumns)),'.',nl],my_foreign_key('$des',T,Cs,Tablename,OColumns),FKs) ->
      display_ic_not_dropped,
      write_log_list(['Other FK constraints depend on this: ',nl]),
      my_apply_1(write_quoted_log_list,FKs),
%      nl_log,
      write_tapi_eot
     ;
      retractall(my_primary_key('$des',Tablename,OColumns)),
      display_ic_dropped)
   ;
    display_ic_does_not_exist).
drop_ic(ck(Tablename,Columns),_NVs) :-
  my_quicksort(Columns,OColumns),
  (my_candidate_key('$des',Tablename,OColumns) ->
    retractall(my_candidate_key('$des',Tablename,OColumns)),
    display_ic_dropped
   ;
    display_ic_does_not_exist).
drop_ic(fk(Tablename,Columns,RTablename,RColumns),_NVs) :-
  my_quicksort(Columns,OColumns),
  my_quicksort(RColumns,ORColumns),
  (my_foreign_key('$des',Tablename,OColumns,RTablename,ORColumns) ->
    retractall(my_foreign_key('$des',Tablename,OColumns,RTablename,ORColumns)),
    display_ic_dropped
   ;
    display_ic_does_not_exist).
drop_ic(fd(Tablename,Columns,DepColumns),_NVs) :-
  my_quicksort(Columns,OColumns),
  my_quicksort(DepColumns,ODepColumns),
  (my_functional_dependency('$des',Tablename,OColumns,ODepColumns) ->
    retractall(my_functional_dependency('$des',Tablename,OColumns,ODepColumns)),
    display_ic_dropped
   ;
    display_ic_does_not_exist).
drop_ic(my_integrity_constraint(Preds,Constraint),NVs) :-
  (my_integrity_constraint(DB,Preds,Constraint,NVs,Head) ->
    retract(my_integrity_constraint(DB,Preds,Constraint,NVs,Head)),
    get_source_dlrules(head,Head,SDLs),
    retract_source_dlrule_list(SDLs,_RSDLs,_RODLs,_Error),
    display_ic_dropped
   ;
    display_ic_does_not_exist).

    
display_ic_dropped :-
  tapi(on),
  !,
  write_tapi_success.
display_ic_dropped :-
  write_verb_list(['Info: Constraint successfully dropped.',nl]).
  
display_ic_not_dropped :-
  write_error_log(['Constraint has not been dropped.',nl]).
  
display_ic_does_not_exist :-
  write_error_log(['Constraint does not exist.']).
  
/*******************************************************************/
/* File ids                                                        */
/*******************************************************************/
 
my_new_file_id(F,FId) :-
  filet(F,FId), 
  !,
  write_verb(['Warning: Reloading an already loaded program.',nl,
              '         References to source program may have changed.',nl]).
my_new_file_id(F,FId) :-
  my_max_fid(MaxFid),
  FId is MaxFid+1,
  assertz(filet(F,FId)).

my_max_fid(MaxFid) :-
  setof(FId,F^filet(F,FId),FIds),
  my_list_max(FIds,1,MaxFid), 
  !.
my_max_fid(0).

  
/*********************************************************************/
/* Trying to safe a rule/goal/view/autoview: make_safe/4             */
/*********************************************************************/

make_safe_list(RNVsList,RNVsList,_IArgsList,_Action,_Object,Safe,_Transformed,_Error) :-
  Safe==no_safety, % Neither safety checks nor transformations (for SQL to Datalog compilations, which it is assumed safe transformations for allowed input modes)
  !.
make_safe_list([],[],_,_,_,_,_,_Error).
make_safe_list([RNVs|RNVsList],[SRNVs|SRNVsList],[IArgs|IArgsList],Action,Object,Safe,Transformed,Error) :-
  make_safe(RNVs,IArgs,Action,Object,SRNVs,Transformed,Error),
  make_safe_list(RNVsList,SRNVsList,IArgsList,Action,Object,Safe,Transformed,Error).
      
%make_safe(+RuleNVs,+IArgs,+Action,+Object,-TRuleNVs,-Transformed,?Error)
make_safe(RuleNVs,IArgs,Action,Object,TRuleNVs,Transformed,Error) :-
  make_setvar_safe(RuleNVs,IArgs,Action,Object,ARuleNVs,Positions,Transformed,AggError),
  (AggError==true ->
   Error=true,
   TRuleNVs=RuleNVs
  ;
   make_classic_safe(ARuleNVs,IArgs,Action,Object,TRuleNVs,Positions,Transformed,Error)
  ).

% Set variables safety: set variables in a metapredicate (aggregates and distinct/2) 
% can only be used as input in other occurrences out of the metapredicate
% e.g. group_by(t(X,Y),[X],C=sum(X)). distinct([X],t(X,Y))
% Set variables: [Y] 
% These variables are not allowed to be bound by a subsequent goal, but they
% can be bound before the metapredicate, therefore filtering elements in groups
% A set variable of a metapredicate can also occur in:
%   - Non-demanded argument positions of predicates (as, e.g., user-defined predicates)
%     Because of metapredicate implementation, data providers must be in a previous 
%     position w.r.t to the metapredicate
%     e.g.: p(Y),group_by(t(X,Y),[X],C=sum(Y))
%     e.g.: p(Y),distinct([X],t(X,Y))
%     An automatic reordering can be applied to get a safe rule should p(Y) occurs after the metapredicate
%   - Rule head: 
%      * Maybe an unsafe rule if called with a non ground argument
%      * Surely an unsafe rule if it is a temporary view 
%        e.g.: v(C,X,Y):-group_by(t(X,Y),[X],C=sum(Y))
%        e.g.: v(C,X,Y):-distinct([X],t(X,Y))
% Set variables are not allowed to occur at other places
%
% If there are data providers for a given set variable, at least one must be before the metapredicate
%
% make_setvar_safe(+RuleNVs,+IArgs,+Action,+Object,-RuleNVs,-ConstrainedPositions,-Transformed,?Error).
% Ciao does neither support FD reification nor optimization
make_setvar_safe((':-'(HN,BN),NVs),IArgs,_Action,Object,(':-'(H,OB),NVs),ConstrainedPositions,Transformed,Error) :-
  !,
  concrete_nulls((HN,BN),(H,B),_),
  copy_term((H,B,NVs),(CH,CB,CNVs)),
  make_ground_args(CH,IArgs),
  my_list_to_tuple(CBs,CB),
  length(CBs,L),
  length(ConstrainedPositions,L),
  set_safe_domains(ConstrainedPositions),
  % WARNING: Remove when Ciao supports FD reification and optimization
  (prolog_system(ciao,_Version) ->
    H=HN,
    OB=B
   ;
    set_safe_preference_ctrs(ConstrainedPositions,Cost),
    set_safe_hard_ctrs(CBs,ConstrainedPositions,Positions,CNVs,_Ctrs,SetVars,Cost,SetvarError),
    (SetvarError==true,SetVars\==[] ->
      Error=true,
      display_setvar_unsafe(CNVs,SetVars)
     ;
      safe_setvar_head(CH,CB,SetVars,CNVs,Object,SetvarError),
      (SetvarError==true,SetVars\==[] ->
        Error=true
       ;
        (SetVars\==[] ->
          reorder_goals_by_positions(B,Positions,OB,Transformed)
         ;
          OB=B
        )
      )
    )
  ).
make_setvar_safe(HNVs,_IArgs,_Action,_Object,HNVs,_Positions,_Transformed,_Error).

display_setvar_unsafe(NVs,SetVars) :-
%  my_raise_exception(generic,syntax(['Incorrect use of shared set variables in metapredicate:',nl,'  ',SetVars,nl,'$cond'(safe(off),['Info: Enabling safe transformations might solve this (/safe on)'])]),NVs).
  my_raise_exception(generic,syntax(['Incorrect use of shared set variables in metapredicate:',nl,'  ',SetVars]),NVs).
  
% safe_setvar_head(+Head,+SetVars,+NVs,+Object,-Error) :-
safe_setvar_head(_Head,_Body,_SetVars,_NVs,autoview,_Error) :- % The head of an automatic temporary view is safely built
  !.
safe_setvar_head(Head,Body,SetVars,NVs,Object,Error) :-
  remove_non_relevant_vars(Body,NVs,RelNVs),
  my_unzip(RelNVs,_Names,RelVars),
  my_term_variables(Head,HeadVs),
  my_set_diff(HeadVs,RelVars,HSVars),
  my_set_inter(HSVars,SetVars,Vs),
  ( Vs==[] ->
    true
   ;
    (Object==view ->
      write_log_list(['Error: Unsafe rule because of head variables in metapredicate: ']),
      write_with_NVs_delimited_list(Vs,NVs),
      nl_log,
      Error=true
     ;
     (Object==autoview ->
      write_log_list(['Error: Unsafe rule because of set variables in metapredicate: ']),
      write_with_NVs_delimited_list(Vs,NVs),
      nl_log,
      Error=true
     ;
      copy_term([Vs,NVs],[CVs,CNVs]),
      replace_var_by_name_list(CVs,CNVs),
      write_warning_log(['Unsafe rule if called with nonground variables: ',CVs])
%      write_with_NVs_delimited_list(Vs,NVs),
%      nl_log
     )
    )
  ).

reorder_goals_by_positions(B,Positions,OB,Transformed) :-
  my_list_to_tuple(Bs,B),
  my_zipWith(',',Positions,Bs,LPsBs),
  my_quicksort(LPsBs,OLPsBs),
  my_unzip(OLPsBs,_OPs,OBs),
  my_list_to_tuple(OBs,OB),
  (B\==OB -> Transformed=true ; true).

% Set domain of FD varibles and constrain them to be all different
% set_safe_domains(+Positions)
set_safe_domains(Positions) :-
  length(Positions,L),
  my_fd_domain(Positions,1,L),
  my_fd_all_different(Positions).

% Set preferences about the original ordering of clauses
% Return the cost function to be maximized, i.e., the sum of entailed preferences
% set_safe_preference_ctrs(+Positions,-Cost)
set_safe_preference_ctrs(Positions,Cost) :-
  set_safe_preference_ctrs(Positions,0,Cost).

set_safe_preference_ctrs([],C,C).
set_safe_preference_ctrs([_P],C,C).
set_safe_preference_ctrs([P1,P2|Ps],Ci,Co) :-
  ctr_lt_list(P1,[P2|Ps],Ci,Co1),
  set_safe_preference_ctrs([P2|Ps],Co1,Co).

% ctr_lt_list(+X,+List,0,-Cost)
% Cost=sum(X#<Xi):Xi in List
ctr_lt_list(_X,[],C,C).
ctr_lt_list(X,[Y|Ys],Ci,Co) :-
  '#<=>'(B,'#<'(X,Y)),
  '#='(Co1, Ci + B),
  ctr_lt_list(X,Ys,Co1,Co).

% Get the (hard) constraints to commit to
% Return set variables 
% Find the best solution w.r.t. preference constraints
% If no solution: Error=true
% set_safe_hard_ctrs(+Goals,+ConstrainedPositions,+Positions,+NVs,-Ctrs,-SetVars,-Cost,-Error)
:- dynamic(positions/1).
set_safe_hard_ctrs(Goals,ConstrainedPositions,Positions,NVs,Ctrs,SetVars,Cost,Error) :-
  safe_hard_ctrs(Goals,ConstrainedPositions,NVs,Ctrs,SetVars),
  ((post_safe_hard_ctrs(Ctrs,SetVars),
    \+ \+ (my_fd_maximize(my_fd_labeling([],ConstrainedPositions),Cost), 
           retractall(positions(_)),
           assertz(positions(ConstrainedPositions)))) ->
    positions(Positions),
    (my_quicksort(Positions,Positions) -> % If no reordering is needed, do nothing
      true
     ;
     (safe(on) ->
       true         % Unsafe body, safety transformation enabled, and reodering is possible
      ;
       Error=true   % Unsafe body, safety transformation disabled, so display error
     )
    )
  ;
    Error=true). % No way to reorder goals to get a safe body
    
post_safe_hard_ctrs([],_SetVars).
post_safe_hard_ctrs([Ctr|Ctrs],SetVars) :-
  call(Ctr),
  !,
  post_safe_hard_ctrs(Ctrs,SetVars).


% Build hard constraints for the goals which use set variables
% safe_hard_ctrs(+Goals,+Positions,+NVs,-Ctrs,-SetVars)
safe_hard_ctrs(Goals,Positions,NVs,Ctrs,SetVars) :-
  safe_hard_ctrs([],[],Goals,Positions,NVs,[],Ctrs,[],SetVars).

% safe_hard_ctrs(+LeftGoals,+LeftPositions,+Goals,+Positions,+NVs,+Ctrsi,-Ctrso,+SetVarsi,-SetVarso)
safe_hard_ctrs(_LeftGoals,_LeftPositions,[],[],_NVs,Ctrs,Ctrs,SetVars,SetVars).
safe_hard_ctrs(LeftGoals,LeftPositions,[Goal|RightGoals],[Position|RightPositions],NVs,Ctrsi,Ctrso,SetVarsi,SetVarso) :-
  get_set_vars(Goal,SetVars),
  SetVars\==[],
  !,
  append(LeftGoals,RightGoals,Goals),
  append(LeftPositions,RightPositions,Positions),
  build_hard_ctrs(SetVars,set_var,Goal,Position,Goals,Positions,NVs,Ctrsi,Ctrso2),
  append(SetVars,SetVarsi,SetVarso1),
  safe_hard_ctrs([Goal|LeftGoals],[Position|LeftPositions],RightGoals,RightPositions,NVs,Ctrso2,Ctrso,SetVarso1,SetVarso).
safe_hard_ctrs(LeftGoals,LeftPositions,[Goal|RightGoals],[Position|RightPositions],NVs,Ctrsi,Ctrso,SetVarsi,SetVarso) :-
  get_demanded_vars(Goal,DemVars),
  DemVars\==[],
  !,
  append(LeftGoals,RightGoals,Goals),
  append(LeftPositions,RightPositions,Positions),
  build_hard_ctrs(DemVars,dem_var,Goal,Position,Goals,Positions,NVs,Ctrsi,Ctrso2),
%  append(DemVars,DemVarsi,DemVarso1),
  safe_hard_ctrs([Goal|LeftGoals],[Position|LeftPositions],RightGoals,RightPositions,NVs,Ctrso2,Ctrso,SetVarsi,SetVarso).
safe_hard_ctrs(LeftGoals,LeftPositions,[Goal|RightGoals],[Position|RightPositions],NVs,Ctrsi,Ctrso,SetVarsi,SetVarso) :-
  safe_hard_ctrs([Goal|LeftGoals],[Position|LeftPositions],RightGoals,RightPositions,NVs,Ctrsi,Ctrso,SetVarsi,SetVarso).

% Get set variables (only in aggregates and distinct/2)
% group_by(Vs,Rel)
get_set_vars(distinct(Vs,Rel),SetVars) :-  
  !,
  my_term_variables(Rel,RVs),
  my_set_diff(RVs,Vs,SetVars).
% count(Rel,GBVs,O), count_distinct(Rel,GBVs,O)
% group_by(Rel,GBVs,Cond)
get_set_vars(group_by(Rel,GBVs,_C),SetVars) :-  
  !,
  my_term_variables(Rel,RVs),
  my_set_diff(RVs,GBVs,SetVars).
% count(Rel,GBVs,O), count_distinct(Rel,GBVs,O)
get_set_vars(Goal,SetVars) :-  
  (Goal = count(Rel,GBVs,_OC)
  ;
   Goal = count_distinct(Rel,GBVs,_OCD)),
  !,
  my_term_variables(Rel,RVs),
  my_set_diff(RVs,GBVs,SetVars).
% count, sum, ... aggr(Rel,Var,GBVars,Result)
get_set_vars(Goal,SetVars) :-  
  Goal=..[Aggr,Rel,_Var,GBVs,_Res],
  my_aggregate_relation(Aggr,4),
  !,
  my_term_variables(Rel,RVs),
  my_set_diff(RVs,GBVs,SetVars).
get_set_vars(_Goal,[]).  

get_non_set_vars(Goal,NonSetVars) :-
  my_term_variables(Goal,Vars),
  get_set_vars(Goal,SetVars),
  my_set_diff(Vars,SetVars,NonSetVars).
  

% Demanded variables for built-ins
% get_demanded_vars(_A is B,SetVars) :-
%   my_term_variables(B,SetVars),
%   !.
% get_demanded_vars(A = B,SetVars) :-
%   ((my_ground(A) ; my_ground(B))
%    -> 
%     SetVars=[]
%    ;
%     my_term_variables((A,B),SetVars)
%   ),
%   !.
% get_demanded_vars(A is B,SetVars) :-
%   my_term_variables((A,B),SetVars),
%   !.
% get_demanded_vars(A = B,SetVars) :-
%   my_term_variables((A,B),SetVars),
%   !.
get_demanded_vars(_A is _B,[]) :-
  !.
get_demanded_vars(_A = _B,[]) :-
  !.
get_demanded_vars(Goal,[]) :-  
  functor(Goal,P,A),
  is_non_demanded_predicate(P/A),
  !.
get_demanded_vars(Goal,SetVars) :-
  my_term_variables(Goal,SetVars).

% build_hard_ctrs(+SetVars,+MetaGoal,+MetaPosition,+Goals,+Positions,+NVs,+Ctrsi,-Ctrso1)
build_hard_ctrs([],_Kind,_MetaGoal,_MetaPosition,_Goals,_Positions,_NVs,Ctrs,Ctrs).
build_hard_ctrs([V|Vs],Kind,MetaGoal,MetaPosition,Goals,Positions,NVs,Ctrsi,Ctrso) :-
  build_var_hard_ctrs(V,Kind,MetaGoal,MetaPosition,Goals,Positions,NVs,0,Sum,Ctrsi,Ctrso1),
  (Sum\==0 -> 
    Ctrso2=['#>'(Sum,0)|Ctrso1]
   ;
    Ctrso2=Ctrso1),
  build_hard_ctrs(Vs,Kind,MetaGoal,MetaPosition,Goals,Positions,NVs,Ctrso2,Ctrso).

% build_var_hard_ctrs(+SetVar,+MetaGoal,+MetaPosition,+Goals,+Positions,+NVs,+Sumi,-Sumo,+Ctrsi,-Ctrso1)
build_var_hard_ctrs(_SetVar,_Kind,_MetaGoal,_MetaPosition,[],[],_NVs,S,S,Ctrs,Ctrs).
build_var_hard_ctrs(SetVar,set_var,_MetaGoal,_MetaPosition,[Goal|_Goals],_Positions,NVs,_Si,_So,_Ctrsi,_Ctrso) :-
  get_set_vars(Goal,GoalSetVars),
  my_member_var(SetVar,GoalSetVars),
  !,
  my_raise_exception(generic,syntax(['Set variable ',[SetVar],' is not allowed to occur in different metapredicates.']),NVs).
build_var_hard_ctrs(SetVar,Kind,MetaGoal,MetaPosition,[Goal|Goals],[Position|Positions],NVs,Si,So,Ctrsi,Ctrso) :-
  my_term_variables(Goal,GVs),
  my_member_var(SetVar,GVs),
  !,
  FDCtr='#<=>'('#<'(Position,MetaPosition),B),
  build_var_hard_ctrs(SetVar,Kind,MetaGoal,MetaPosition,Goals,Positions,NVs,'+'(Si,B),So,[FDCtr|Ctrsi],Ctrso).
build_var_hard_ctrs(SetVar,Kind,MetaGoal,MetaPosition,[_Goal|Goals],[_Position|Positions],NVs,Si,So,Ctrsi,Ctrso) :-
  !,
  build_var_hard_ctrs(SetVar,Kind,MetaGoal,MetaPosition,Goals,Positions,NVs,Si,So,Ctrsi,Ctrso).

% Classical safety: finite domains and negation
% Rules/Views/Autoviews:
make_classic_safe((':-'(IHN,BN),NVs),IArgs,Action,Object,(':-'(OH,OB),NVs),Positions,Transformed,Error) :-
  !,
  (Object==autoview -> (HN=autoview , OH=IHN)
   ;
   (Object==query -> (HN=query , OH=IHN)
    ;
    (HN=IHN, OH=H))),
  concrete_nulls((HN,BN),(H,B),_),
  copy_term((H,B),(CH,CB)),
  make_ground_args(CH,IArgs),
  mark_safe_NVs(CB,H,B,NVs,[],_,Object,Action,Err1),
  (Object==query -> Error=Err1 ; true),
  % Try to reorder when:
  ((my_ground((CH,CB));           % Either all variables are safe,
   (my_ground(CB),Object\=view);  % or body variables are safe,
   (my_term_variables(CB,V1s),    % or only head variables are unsafe. May be safe at run-time
    my_term_variables(CH,V2s),
    same_variables(V1s,V2s)))
    ->
    (safe(on) -> 
      reorder_goals(B,OB,Ps), % Goals can actually be reordered to ensure that, upon execution, 
                           % demanded arguments become ground before the call,
                           % but this modifies performance for some cases:
                           % p(X) :- X>1,q(X) could be translated into p(X) :- q(X),X>1
                           % In the first case, q(X) is not actually computed for X=<1
      (B\==OB, \+ Ps=Positions ->
        Error=true % No way to satisfy hard constraints for metapredicates
       ;
        true
      )
     ; 
      OB=B),
    ((safe(on), B \= OB, Error\==true) ->
     Transformed = true,
     safety_warnings(on),
     write_log_list(['Info: For allowing a (possible) safe computation, the ',Object,':',nl]),
     ((Object=rule;Object=view) ->
       display_ruleNVs_list([(':-'(H,B),NVs)],2)
       ;
       display_ruleNVs_list([(B,NVs)],2)),
     write_log_list(['has been translated into:',nl]),
     ((Object=rule;Object=view) ->
       display_ruleNVs_list([(':-'(H,OB),NVs)],2)
       ;
       display_ruleNVs_list([(OB,NVs)],2))
    ;
    (safe(off) -> Error=Err1; true)
    )
   ;
   Error=true,
%   (Object==query ->
   ((Object==query ; Object==autoview) ->
     display_unsafe(IHN,B,IHN,B,NVs,Action,Object)
    ; 
     Error=true),
   OB=B
   ),
   (my_ground(CH) ->
    true
    ;
    (var(Error) -> Error=true; true),
    (%(H,B)=(CH,CB),
     display_unsafe(H,B,CH,CB,NVs,Action,Object),
     fail
     ;
     true
    )
   ).
% Goals:   
make_classic_safe((HN,NVs),IArgs,Action,Object,(H,NVs),_Positions,_,Error) :-
  concrete_nulls(HN,H,_),
  copy_term(H,CH),
  make_ground_args(CH,IArgs),
  (my_ground(CH) ->
   true;                                             % Contains no variables
   Error=true,
   display_unsafe(H,true,H,true,NVs,Action,Object)). % Unsafe: nonground fact

same_variables(V1s,V2s) :-
  length(V1s,L),
  length(V2s,L),
  my_set_diff(V1s,V2s,[]).
  
% (Goals (marked), Head, Body, Variables in negated atoms, Names of variables,Pending variables)
% A set of pending variables represents variables aliased to a given one such that grounding this one, will also ground pending variables
mark_safe_NVs((G,Gs),H,(B,Bs),NVs,PVi,PVo,Object,Action,Error) :-
  !,
  mark_safe_NVs(G,H,B,NVs,PVi,PVo1,Object,Action,E1),
  mark_safe_NVs(Gs,H,Bs,NVs,PVo1,PVo,Object,Action,E2),
  my_u_or(E1,E2,Error).
mark_safe_NVs(G,_,_,_,PV,PV,_,_,_Error) :- 
  my_ground(G),
  !.
mark_safe_NVs('='(L,R),_,_,_,PVi,PVo,_,_,_Error) :- 
  my_noncompound_term(L),
  my_noncompound_term(R),
  !,
  L=R,
  (my_ground(L) ->
   make_ground_pending(PVi,PVo)
   ;
   PVo=PVi).
mark_safe_NVs(L=R,H,CL=CR,NVs,PVi,PVo,Object,Action,Error) :- 
  my_noncompound_term(L),
  !,
  mark_safe_NVs(is(L,R),H,is(CL,CR),NVs,PVi,PVo,Object,Action,Error).
mark_safe_NVs(L=R,H,CL=CR,NVs,PVi,PVo,Object,Action,Error) :- 
  my_noncompound_term(R),
  !,
  mark_safe_NVs(is(R,L),H,is(CR,CL),NVs,PVi,PVo,Object,Action,Error).
% mark_safe_NVs('='(L,R),H,_B,NVs,PVi,PVo,Object,Action,Error) :- 
%   my_noncompound_term(R),
%   !,
%   mark_safe_NVs(is(R,L),H,is(L,R),NVs,PVi,PVo,Object,Action,Error).
mark_safe_NVs(is(X,Y),H,B,NVs,PVi,PVo,Object,_,Error) :- 
  !,
  (my_ground(Y) -> 
   make_ground(X), % X gets bound when Y does
   make_ground_pending(PVi,PVo)
   %,Error=false
   ; 
   B=is(_,YB),     % If Y is not safe, 'is' may or will raise an exception
   my_term_variables(Y,Vs),
   PVo=[(X,Vs)|PVi],
   display_computation_warning(B,Y,H,YB,NVs,Object,Error)
  ).
% mark_safe_NVs(group_by(R,GBVs,E),H,B,NVs,PVi,PVo,Object,Action,Error) :-
% deb,
%   !,
%   make_ground(GBVs),   
%   make_ground_pending(PVi,PVo1),
%   my_term_variables(R,RVs),
%   mark_safe_NVs(E,H,B,NVs,PVo1,PVo,Object,Action,Error).
% mark_safe_NVs(distinct(Vs,_R),_H,_B,_NVs,PVi,PVo,_Object,_Action,_Error) :-
%   !,
%   make_ground(Vs),   
%   make_ground_pending(PVi,PVo).
mark_safe_NVs(top(_N,G),H,B,NVs,PVi,PVo,Object,Action,Error) :-
  !,
  mark_safe_NVs(G,H,B,NVs,PVi,PVo,Object,Action,Error).
mark_safe_NVs(G,H,B,NVs,PVi,PVo,Object,Action,Error) :-
  functor(G,P,A),
  (is_non_demanded_predicate(P/A) ->
%   get_non_set_vars(G,Vs),
%   make_ground(Vs),   % Defined predicate or set built-in (distinct,count,...)
   make_ground(G),   % Defined predicate or set built-in (distinct,count,...)
   make_ground_pending(PVi,PVo)
   %,Error=false     % (assumed safe, but actually it may not;
                     %  a global analysis should be performed),
                     % all variables are marked as safe
   ;
   (my_ground(G) ->  % Built-in (including negation)
    true % Error=false      % Nothing to do if all variables are safe (ground goal)
    ;
    (P/A == not/1 -> % Deciding whether not/1 or other built-in
                     % If negation, the rule cannot be computed
     display_neg_error(G,H,B,NVs,Action),
     Error=true
     ;               % If built-in, display computation warning
     display_computation_warning(B,G,H,B,NVs,Object,Error)
    )
   ),
   PVo=PVi
  ).

make_ground_pending([],[]).
make_ground_pending([(X,Vs)|PVi],PVo) :-
  my_ground(Vs),
  !,
  make_ground(X),
  make_ground_pending(PVi,PVo).
make_ground_pending([(X,Vs)|PVi],[(X,Vs)|PVo]) :-
  make_ground_pending(PVi,PVo).

% reorder_goals(+Body,-OrderedBody)
reorder_goals(B,OB) :-
  reorder_goals(B,OB,_Ps).
% reorder_goals(+Body,-OrderedBody,-Positions)  
reorder_goals(B,OB,Ps) :-
  my_list_to_tuple(Bs,B),
  copy_term(Bs,CBs),
  concrete_nulls(CBs,GBs,_Grounded),
  reorder_goals_by_safety(Bs,GBs,[],[],SOBs),
  (false ->
    reorder_goals_by_efficiency(SOBs,EOBs)
   ;
    EOBs=SOBs
  ),
  my_list_to_tuple(EOBs,OB),
  get_goal_positions(Bs,EOBs,Ps).
  
% get_goal_positions(+PBs,+Bs,-Ps)
% Get goal positions Ps of PBs w.r.t. Bs
% e.g. PBs=[p(X),q(X),p(X)] Bs=[p(X),p(X),q(X)] Ps=[1,3,2]
get_goal_positions(PBs,Bs,Ps) :-
  get_goal_positions(PBs,Bs,[],Ps).
  
% get_goal_positions(+PBs,+Bs,+UsedPs,-Ps)
get_goal_positions([],_Bs,_UPs,[]).
get_goal_positions([PB|PBs],Bs,UPs,[P|Ps]) :-
  my_nth1_member_var(PB,P,Bs),
  \+ my_member(P,UPs),
  get_goal_positions(PBs,Bs,[P|UPs],Ps).
  
% Push equalities to the left
% For Rules along with NVs
reorder_goals_by_efficiency_ruleNVs_list([],[]).
reorder_goals_by_efficiency_ruleNVs_list([(R,NVs)|Rs],[(OR,NVs)|ORs]) :-
  reorder_goals_by_efficiency_rule(R,OR),
  reorder_goals_by_efficiency_ruleNVs_list(Rs,ORs).

% For Rules
reorder_goals_by_efficiency_rule_list([],[]).
reorder_goals_by_efficiency_rule_list([R|Rs],[OR|ORs]) :-
  reorder_goals_by_efficiency_rule(R,OR),
  reorder_goals_by_efficiency_rule_list(Rs,ORs).
  
reorder_goals_by_efficiency_rule(R,OR) :-
  R=':-'(H,B),
  !,
  OR=':-'(H,OB),
  my_list_to_tuple(Bs,B),
  reorder_goals_by_efficiency(Bs,OBs),
  my_list_to_tuple(OBs,OB).
reorder_goals_by_efficiency_rule(R,R).
  

% Push equalities to the left
reorder_goals_by_efficiency(Gs,OGs) :-
  reorder_goals_by_efficiency(Gs,FGs,[],PGs),
  append(PGs,FGs,OGs).

reorder_goals_by_efficiency([],[],Gs,Gs).
reorder_goals_by_efficiency([G|As],Bs,IGs,OGs) :-
  G=..['=',L,R],
  my_noncompound_term(L),
  my_noncompound_term(R),
  !,
  reorder_goals_by_efficiency(As,Bs,[G|IGs],OGs).
reorder_goals_by_efficiency([G|As],[G|Bs],IGs,OGs) :-
  reorder_goals_by_efficiency(As,Bs,IGs,OGs).

reorder_goals_by_safety([],[],[],[],[]) :-
  !.
reorder_goals_by_safety([B],[_CB],[],[],[B]) :-
  !.
reorder_goals_by_safety([],[],PGs,CPGs,PGs) :- % Give up: No way to find a safe order
  get_safe_goals(PGs,CPGs,_PG1s,_CPG1s,SGs),
  SGs==[],
  !.
reorder_goals_by_safety([],[],PGs,CPGs,OBs) :-
  !,
  reorder_goals_by_safety(PGs,CPGs,[],[],OBs).
reorder_goals_by_safety(Bs,CBs,PGs,CPGs,OBs) :-
  get_safe_goals(PGs,CPGs,PG1s,CPG1s,SGs),
  SGs\==[],
  !,
  append(SGs,VGs,OBs),
  reorder_goals_by_safety(Bs,CBs,PG1s,CPG1s,VGs).

reorder_goals_by_safety([BI|Bs],[CBI|CBs],PGs,CPGs,OBs) :-
  CBI=(L=R),
  (my_compound_term(L) % compound terms in equalities are evaluated
   ;
   my_compound_term(R)),
  !,
  ((my_ground(L)
    ;
    my_ground(R)) ->
    make_ground(L),
    make_ground(R),
    OBs=[BI|OB1s],
    reorder_goals_by_safety(Bs,CBs,PGs,CPGs,OB1s)
   ;
    reorder_goals_by_safety(Bs,CBs,[BI|PGs],[CBI|CPGs],OBs)
  ).
  
reorder_goals_by_safety([B|Bs],[CB|CBs],PGs,CPGs,[B|OBs]) :-
  functor(B,P,A),
  (is_non_demanded_predicate(P/A),
   make_ground(CB)
   ; 
   P/A = ('=')/2,
   (my_ground(CB) -> true ; call(CB))),
  !,
  reorder_goals_by_safety(Bs,CBs,PGs,CPGs,OBs).
    
reorder_goals_by_safety([BI|Bs],[CBI|CBs],PGs,CPGs,OBs) :-
  !,
  (CBI=not(A) -> 
   BG=A
   ;
   (CBI=is(X,Y) ->
    BG=Y
    ;
    BG=BI)),
  (my_ground(BG) ->
   (CBI=is(X,Y) -> 
    make_ground(X)
    ;
    true),
   OBs=[BI|OB1s],
   reorder_goals_by_safety(Bs,CBs,PGs,CPGs,OB1s)
   ;
   reorder_goals_by_safety(Bs,CBs,[BI|PGs],[CBI|CPGs],OBs)).
reorder_goals_by_safety(Bs,_CBs,[],[],Bs) :-
  !.

get_safe_goals([],[],[],[],[]).
get_safe_goals([G|Gs],[CG|CGs],PGs,CPGs,[G|SGs]) :-
  my_ground(CG),
  !,
  get_safe_goals(Gs,CGs,PGs,CPGs,SGs).
get_safe_goals([G|Gs],[CG|CGs],[G|PGs],[CG|CPGs],SGs) :-
  get_safe_goals(Gs,CGs,PGs,CPGs,SGs).

display_neg_error(G,H,B,NVs,Action) :-
  (write_log('Error: '),
   write_with_NVs(B,NVs),
   write_log_list([' might not be correctly computed because of the unrestricted variable(s):',nl]),
   B=G,
   my_term_variables(B,Vs),
   write_log('  '),
   write_with_NVs_delimited_list(Vs,NVs), 
   fail
  ;
   ((Action==consult,verbose(off)) -> 
    write_log(' in rule: '), 
    write_with_NVs(':-'(H,B),NVs), 
    nl_log
   ;
    nl_log)
  ).

%is_non_demanded_predicate(top/2) :- % WARNING
%  !.
is_non_demanded_predicate(distinct/2) :-
  !.
is_non_demanded_predicate(group_by/3) :-
  !.
is_non_demanded_predicate(AF/Arity) :-
  my_aggregate_relation(AF,Arity),
  !.
is_non_demanded_predicate(AF/Arity) :-
  my_builtin_relation(AF,Arity,_M,_K),
  !.
is_non_demanded_predicate(Pred/Arity) :-
  my_outer_join_relation(Pred/Arity),
  !.
is_non_demanded_predicate(Pred/Arity) :-
  Pred/Arity \== not/1,
  my_builtin_preds(BIPreds),
  my_not(my_member(Pred/Arity,BIPreds)).

display_unsafe(_H,_B,_CH,_CB,_NVs,_Action,_Object) :-
  safety_warnings(off),
  !.
display_unsafe(H,B,CH,CB,NVs,Action,Object) :-
  my_term_variables(CH,HVs),
  collect_neg_NVs(CB,BVs),
  append(HVs,BVs,TVs),
  remove_duplicates_var(TVs,NNVs),
  (NVs==[] ->
   true;
   write_log('Warning: '),
   (Action == consult -> 
    M='Next '
    ;
    M='This '
   ),
   write_log_list([M,Object,' is unsafe because of variable(s):',nl,'  ']),
   (CH=H,
    CB=B,
    write_with_NVs_delimited_list(NNVs,NVs),
    fail
    ;
    true),
   write_log_list([nl])),
  (Action == consult, verbose(off) ->
   display_ruleNVs_list([(':-'(H,B),NVs)],0)
   ;
   true).

collect_neg_NVs((G,Gs),Vs) :-
  !,
  collect_neg_NVs(G,GVs),
  collect_neg_NVs(Gs,GsVs),
  append(GVs,GsVs,Vs).
collect_neg_NVs(not(P),Vs) :-
  !, 
  my_term_variables(P,Vs).
collect_neg_NVs(_,[]).
   
% display_computation_warning(Reference literal, copied part of the reference literal, head, original part of the reference literal, variable names)
% Ex: (X is Y, _Y, fib(N,M), Y, ['Y'=Y|...])
% Ex: (X < Y, _X < _Y, fib(N,M), X < Y, ['Y'=Y|...])
display_computation_warning(B,SG,H,SB,NVs,Object,_Error) :-
  my_term_to_string(B,S,NVs),
  SB=SG,
  my_term_variables(H,HVs),
  my_term_variables(SB,BVs),
  ((my_set_diff(BVs,HVs,[]),Object\=view) -> 
   I='Warning: ', M=' may raise a computing exception if non-ground at run-time.'
   ; 
   I='Error: ', M=' will raise a computing exception at run-time.',
   assertz(error)
  ),
  (safety_warnings(on) ->
    write_log(I),
    write_string_log(S),
    write_log_list([M,nl])
   ;
   true),
  fail.
display_computation_warning(_,_,_,_,_,_,Error) :-
  (error -> 
   Error=true,
   retractall(error)
   ;
%   Error=false). 
   true). 
  

/*********************************************************************/
/* Auxiliary Predicates                                              */
/*********************************************************************/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flags
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disable_safety_warnings(SW) :-
  retract(safety_warnings(SW)),
  assertz(safety_warnings(off)).

restore_safety_warnings(SW) :-
  set_flag(safety_warnings,SW).

% Setting a flag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set_flag(+Flag). Retracts the flag and asserts the input fact
set_flag(Flag) :-
  functor(Flag,F,A),
  functor(FFlag,F,A),
  retractall(FFlag),
  assertz(Flag).

% set_flag(+FlagName,+Value). Retracts the flag and asserts the input flag_name/value
set_flag(Flag,Value) :-
  Fact =.. [Flag,_OldValue],
  retractall(Fact),
  NewFact =.. [Flag,Value],
  assertz(NewFact).

% set_flag(+FlagName,+Value1,+Value2). Retracts the flag and asserts the input fact/value1/value2
set_flag(Flag,Value1,Value2) :-
  Fact =.. [Flag,_OldValue1,_OldValue2],
  retractall(Fact),
  NewFact =.. [Flag,Value1,Value2],
  assertz(NewFact).

% push_flag
push_flag(FlagName,NewValue,CurrentValue) :-
  CFlag=..[FlagName,CurrentValue],
  retract(CFlag),
  NFlag=..[FlagName,NewValue],
  assertz(NFlag).

% pop_flag
pop_flag(FlagName,OldValue) :-
  set_flag(FlagName,OldValue).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List/Set processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% concat_lists(+ListOfLists,-List) Appends a list of lists 
%   and returns the flattened list

concat_lists([],[]).
concat_lists([[]|R],S) :-
  concat_lists(R,S).
concat_lists([[C|R1]|R2],[C|S]) :-
  concat_lists([R1|R2],S).

% % Appending two lists
% append([],X,X).
% append([X|Xs],Y,[X|Zs]) :-
%   append(Xs,Y,Zs).

% Appending two lists for finding substrings
my_appendfind([],X,X) :-
  !.
my_appendfind([X|Xs],Y,[X|Zs]) :-
  my_appendfind(Xs,Y,Zs).

% Appending a VariableName=Variable to an input list
append_NV('_',V,Vi,['='('_',V)|Vi]) :- 
  !.
append_NV(N,V,Vi,Vi) :- 
%  my_member_var('='(N,V),Vi),
  my_member('='(N,V),Vi),
  !.
append_NV(N,V,Vi,['='(N,V)|Vi]).

% Member of a list
my_member(X,[X|_Xs]).
my_member(X,[_Y|Xs]) :-
  my_member(X,Xs).
  
my_member_chk(X,[X|_Xs]) :-
  !.
my_member_chk(X,[_Y|Xs]) :-
  my_member_chk(X,Xs).
  
% Nth member of a list 
my_nth_member(X,N,Xs) :-
  my_nth_member(X,0,N,Xs).

my_nth_member(X,N,N,[X|_Xs]).
my_nth_member(X,CN,N,[_Y|Xs]) :-
  N1 is CN+1,
  my_nth_member(X,N1,N,Xs).

% Nth member_var of a list
% N starting from 0
my_nth_member_var(X,N,Xs) :-
  my_nth_member_var(X,0,N,Xs).
% N starting from 1
my_nth1_member_var(X,N,Xs) :-
  my_nth_member_var(X,1,N,Xs).

my_nth_member_var(X,N,N,[Y|_Xs]) :-
  X==Y.
my_nth_member_var(X,CN,N,[_Y|Xs]) :-
  N1 is CN+1,
  my_nth_member_var(X,N1,N,Xs).

% member_var of a list
my_member_var(X,[Y|_Ys]) :-
  X==Y.
my_member_var(X,[Y|Ys]) :-
  X\==Y,
  my_member_var(X,Ys).

my_member_var(X,P1,[P2|_Ys]) :-
  \+ \+ (( 
   make_ground(X),
   make_ground(P2),
   P1=P2)),
   !,
   P1=P2.
my_member_var(X,P,[_Y|Ys]) :-
  my_member_var(X,P,Ys).  
  
% Reversing a list  
my_reverse(L1, L2) :-
   my_reverse(L1, [], L2).
   
% reverse(+X, +Y, -Z)
% Z is X reversed, followed by Y
my_reverse([], Z, Z).
my_reverse([H|T], L0, L) :-
  my_reverse(T, [H|L0], L).
  
% between(+N1,+N2,-List)
% Create a list of integers between N1 and N2
list_between(N,N,[N]) :-
  !.
list_between(N1,N2,[N1|Ns]) :-
  NN1 is N1+1,
  list_between(NN1,N2,Ns).

% Replacing an element of a list
replace_list(_A,_B,[],[]).
replace_list(A,B,[A|Xs],[B|Ys]) :-
  !,
  replace_list(A,B,Xs,Ys).
replace_list(A,B,[X|Xs],[X|Ys]) :-
  replace_list(A,B,Xs,Ys).

% Take the tail list starting in the Nth element of the input list (elements are numbered from 1 on)  
% take_from_N(L,N,O) :-
%   take_from_N(L,1,N,O).

% take_from_N(L,N,N,L) :-
%   !.
% take_from_N([_|L],N,N2,O) :-
%   N1 is N+1,
%   take_from_N(L,N1,N2,O).

% Takes the first N elements from a list. 
% If there are no enough elements, return fresh variables
take_N(0,_L,[]) :-
  !.
take_N(N,[X|Xs],[X|Ys]) :-
  N1 is N-1,
  take_N(N1,Xs,Ys).
take_N(N,[],Xs) :-
  length(Xs,N).
  
% Split a list into two, the first one with N elements
split_list(0,L,[],L) :-
  !.
split_list(N,[X|Xs],[X|Ys],L) :-
  N1 is N-1,
  split_list(N1,Xs,Ys,L).
  
% Split a list into two, the first one with odd position elements, and the second one with even position elements
% [a,b,c,d,e,f] -> [a,c,e] , [b,d,f]
split_list_odd_even([],[],[]) :-
  !.
split_list_odd_even([O,E|Xs],[O|Os],[E|Es]) :-
  split_list_odd_even(Xs,Os,Es).
  
% Bidirectional list to tuple
my_list_to_tuple([L],T) :-
  nonvar(T),
  T\=(_H,_T),
  L=T.
my_list_to_tuple([L],T) :-
  var(T),
  L=T.
my_list_to_tuple([X,Y|Xs],(X,Ts)) :-
  my_list_to_tuple([Y|Xs],Ts).

% Bidirectional list to disjunction
my_list_to_disjunction([L],T) :-
  nonvar(T),
  T\=(_H;_T),
  L=T.
my_list_to_disjunction([L],T) :-
  var(T),
  L=T.
my_list_to_disjunction([X,Y|Xs],(X;Ts)) :-
  my_list_to_disjunction([Y|Xs],Ts).

%% Appending two tuples
%my_tuple_append((X,Xs),Y,(X,Zs)) :- 
%  !,
%  my_tuple_append(Xs,Y,Zs).
%my_tuple_append(X,Y,(X,Y)).

% Building a conjunctive term
%conjunctive_term([T],T) :-
%  !.
%conjunctive_term([T1,T2],CT) :- 
%  !, 
%  CT =.. [',',T1,T2].
%conjunctive_term([T|Ts],CT) :- 
%  CT =.. [',',T,CTT],
%  conjunctive_term(Ts,CTT).

% List to set
% Via unification
remove_duplicates(L,S) :-
  remove_duplicates(L,[],S).

remove_duplicates([],L,L).
remove_duplicates([X|Xs],AL,L) :-
  my_member_chk(X,AL), 
  !,
  remove_duplicates(Xs,AL,L).
remove_duplicates([X|Xs],AL,L) :-
  remove_duplicates(Xs,[X|AL],L).

% List to set
% Variables are distinguished
remove_duplicates_var(L,S) :-
  remove_duplicates_var(L,[],S).

remove_duplicates_var([],L,L).
remove_duplicates_var([X|Xs],AL,L) :-
  my_member_var(X,AL), 
  !,
  remove_duplicates_var(Xs,AL,L).
remove_duplicates_var([X|Xs],AL,L) :-
  remove_duplicates_var(Xs,[X|AL],L).

% Multiset difference
my_set_diff([], _, []).
my_set_diff([Element|Elements], Set, Difference) :-
%    my_member(Element, Set),
  my_member_var(Element, Set),
  !,
  my_set_diff(Elements, Set, Difference).
my_set_diff([Element|Elements], Set, [Element|Difference]) :-
  my_set_diff(Elements, Set, Difference).

% Disjoint sets
% my_disjoint_sets(A,B) :-
%   my_set_diff(A,B,[]),
%   my_set_diff(B,A,[]).

% Multiset intersection
% Warning: not really multiset
my_set_inter([],_Ys,[]).
my_set_inter([X|Xs],Ys,[X|Zs]) :- 
  my_member_var(X,Ys), 
  my_set_inter(Xs,Ys,Zs).
my_set_inter([X|Xs],Ys,Zs) :- 
  my_not(my_member_var(X,Ys)),
  my_set_inter(Xs,Ys,Zs).

% Merging two lists; the first one contains no duplicates
my_merge(L,[],L).
my_merge(L,[A|As],Rs) :-
  my_member(A,L), !,
  my_merge(L,As,Rs).
my_merge(L,[A|As],Rs) :-
  my_merge([A|L],As,Rs).

% Quicksort, keeping duplicates
% Sorts in Prolog standard order
my_quicksort(L,OL) :-
  my_quicksort_pred(L,(@=<),OL).

% Quicksort, keeping duplicates
% Sorts as defined by Pred
my_quicksort_pred([],_Pred,[]).
my_quicksort_pred([Head|Tail],Pred,Sorted) :- 
  partition(Head,Pred,Tail,Left,Right),                                 
  my_quicksort_pred(Left,Pred,SortedL),
  my_quicksort_pred(Right,Pred,SortedR),
  append(SortedL,[Head|SortedR],Sorted).

partition(_Pivot,_Pred,[],[],[]).
partition(Pivot,Pred,[Head|Tail],[Head|Left],Right) :-
  Compare =.. [Pred,Head,Pivot],
  call(Compare),
  !,
  partition(Pivot,Pred,Tail,Left,Right).
partition(Pivot,Pred,[Head|Tail],Left,[Head|Right]) :-
  partition(Pivot,Pred,Tail,Left,Right).

%Stratum compare predicate, to be used with my_quicksort_pred for ordering strata in listings
stratum_compare((Pred1,Stratum1),(Pred2,Stratum2)) :-
  (Stratum1,Pred1) @=< (Stratum2,Pred2).

% Rule compare (ascending) predicate, to be used with my_quicksort_pred for ordering Datalog rules
% Rules are ordered by predicate name, then, for arity, then, first are facts (rules without RHS),
% then rules (with RHS) (both in lexicographic Prolog standard order)

dlrule_compare_asc(datalog(R1,NVs1,_,_,_,_),datalog(R2,NVs2,_,_,_,_)) :-
  rule_compare_asc((R1,NVs1),(R2,NVs2)).

rule_compare_asc(Pair1,Pair2) :-
  Pair1 = (Rule1,_V1s),
  Pair2 = (Rule2,_V2s),
  (Rule1 = ':-'(LHS1,RHS1) -> Kind1 = rule ; LHS1 = Rule1, Kind1 = fact),
  (Rule2 = ':-'(LHS2,RHS2) -> Kind2 = rule ; LHS2 = Rule2, Kind2 = fact),
  (functor(LHS1,F1,_A1), 
   functor(LHS2,F2,_A2),
   F1 @< F2,
   !
   ;
   functor(LHS1,F,A1), 
   functor(LHS2,F,A2),
   A1 < A2,
   !
   ;
   functor(LHS1,F,A), 
   functor(LHS2,F,A),
   Kind1 == fact,
   Kind2 == rule,
   !
   ;
   functor(LHS1,F,A), 
   functor(LHS2,F,A),
   Kind1 == fact,
   Kind2 == fact,
   !,
   LHS1 @< LHS2   
   ;
   functor(LHS1,F,A), 
   functor(LHS2,F,A),
   Kind1 == rule,
   Kind2 == rule,
   ':-'(LHS1,RHS1) @< ':-'(LHS2,RHS2)).
  

% my_intersect_var(+L1,+L2,-L3): L3 = L1 intersect L2
my_intersect_var([],_L,[]) :-
  !.
my_intersect_var(_L,[],[]) :-
  !.
my_intersect_var([X|Xs],L,[X|RXs]) :-
  my_member_var(X,L),
  !,
  my_intersect_var(Xs,L,RXs).
my_intersect_var([_X|Xs],L,RXs) :-
  !,
  my_intersect_var(Xs,L,RXs).

% my_union_var(+L1,+L2,-L3): L3 = L1 union L2
my_union_var([],Xs,Xs).
my_union_var([X|Xs],Zs,Ys) :-
  my_member_var(X,Zs),
  !,
  my_union_var(Xs,Zs,Ys).
my_union_var([X|Xs],Zs,[X|Ys]) :-
  my_union_var(Xs,Zs,Ys).
  
% my_subtract_var(L1,L2,L3): L3=L1-L2
my_subtract_var(L,[],L).
my_subtract_var(From,[X|Xs],L) :-
  my_remove_var(X,From,To),
  !,
  my_subtract_var(To,Xs,L).

% my_remove_var(X,L1,L2): [X]+L1=L2.
my_remove_var(_X,[],[]).
my_remove_var(X,[Y|Ys],Zs) :-
  X==Y,
  !,
  my_remove_var(X,Ys,Zs).
my_remove_var(X,[Y|Ys],[Y|Zs]) :-
  my_remove_var(X,Ys,Zs).

% my_remove(X,L1,L2): [X]+L1=L2.
my_remove(_X,[],[]).
my_remove(X,[X|Ys],Zs) :-
  !,
  my_remove(X,Ys,Zs).
my_remove(X,[Y|Ys],[Y|Zs]) :-
  my_remove(X,Ys,Zs).

% my_remove_non_ground(L1,L2).
my_remove_non_ground([],[]).
my_remove_non_ground([Y|Ys],[Y|Zs]) :-
  my_ground(Y),
  !,
  my_remove_non_ground(Ys,Zs).
my_remove_non_ground([_X|Ys],Zs) :-
  my_remove_non_ground(Ys,Zs).

% my_flatten(Xs,Ys) is true if Ys is a list of the elements in Xs.
% e.g. my_flatten([[[3,c],5,[4,[]]],[1,b],a],[3,c,5,4,1,b,a]).    
my_flatten(Xs,Ys) :-
  my_flatten(Xs,[],Ys).

my_flatten(X,As,[X|As]) :-
  var(X),
  !.
my_flatten([X|Xs],As,Ys) :- 
  my_flatten(Xs,As,As1), 
  my_flatten(X,As1,Ys).
my_flatten(X,As,[X|As]) :-
  integer(X).
my_flatten(X,As,[X|As]) :-
  atom(X), 
  X\=[].
my_flatten([],Ys,Ys).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conversion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_term_to_string(T,S) :- 
  my_term_to_string(T,quoted,S,[]).
  
my_term_to_string(T,S,NVs) :- 
  my_term_to_string(T,quoted,S,NVs).
  
my_term_to_string_unquoted(T,S) :- 
  my_term_to_string(T,unquoted,S,[]).

% Term to string my_term_to_string(+Term,+Quoted,-String,+NameVariables)
% NameVariables contains program variable names in Term as pairs Name=Variable
% If there are variables without names, they are assigned new names
% If Quoted=unquoted, then quotes surrounding upcase atoms are omitted
my_term_to_string(T,U,S,NVs) :- 
  assign_variable_names(T,NVs,CNVs),
  my_term_to_string(T,U,S,0,CNVs).
  
% Term to string my_term_to_string(+Term,-String,+Depth,+NameVariables)
% Depth is used to build parentheses to ease reading
my_term_to_string(V,_U,S,_D,Vs) :- 
  var(V),
  !,
  my_var_name(V,N,Vs),
  name(N,S).
% my_term_to_string('',[],_D,_Vs) :-
%   !.
my_term_to_string('',_U,"''",_D,_Vs) :-
  !.
my_term_to_string(T,_U,S,_D,_Vs) :- 
  number(T), 
  !,
  name(T,S).
my_term_to_string([],_U,"[]",_D,_Vs) :- % [] is an atom, so this clause must be placed before the next one
  !.
my_term_to_string(T,U,S,_D,_Vs) :-
  atom(T),
  !,
  atom_codes(T,S1),
  name(NT,S1),
  S1=[D|_], 
  ((my_uppercase(D) 
   ; 
    [D] = "$" 
   ;
    number(NT) 
   ; 
    contains_non_alfanum(S1)),
   U\==unquoted
   ->
    [A] = "'",
    append([A|S1],[A],S)
   ;
    S=S1
  ).
my_term_to_string(T,U,S,D,Vs) :-
  T =.. [F,A],
  unary_operator(F,_POp,_D),
  !,
  D1 is D+1,
  my_term_to_string(F,U,S1,D,Vs),
  my_term_to_string(A,U,S2,D1,Vs),
  "(" = [OP], ")" = [CP], 
  append(S1,[OP|S2],S3),
  append(S3,[CP],S).
my_term_to_string([H|T],U,S,D,Vs) :-
  !,
  "[" = [OB],
  my_seq_to_string([H|T],U,S1,D,Vs),
  append([OB|S1],"]",S).
my_term_to_string(C,U,S,D,Vs) :- 
  C =.. [F|As],
  !, 
  length(As,Arity),
  (F == (',') ->
    (D==0 ->
     my_terms_to_string(As,U,S,D,Vs)
     ;
     my_terms_to_string(As,U,S1,D,Vs),
     "(" = [OP], ")" = [CP], 
     append([OP|S1],[CP],S)
     )
    ;
    D1 is D+1,
    ((F == (';') , As = [A1,A2]) ->
      my_term_to_string(A1,U,S1,D1,Vs),
      add_parentheses(A1,S1,PS1),
      my_term_to_string(A2,U,S2,D1,Vs),
      add_parentheses(A2,S2,PS2),
      ";" = [SC], 
      append(PS1,[SC|PS2],S3),
      (D==0 ->
       S=S3
       ;
       "(" = [OP], ")" = [CP], 
       append([OP|S3],[CP],S)
       )
      ;
       ((my_priority_operator(Priority,_SF,F), Priority\==low) ->
         As = [L,R],
         my_infix_argument_to_string(L,U,S1,D1,Vs),
         name(F,S2),
         " " = [BL],
         append(S1,[BL|S2],S3), 
         my_infix_argument_to_string(R,U,S4,D1,Vs),
         append(S3,[BL|S4],S) 
       ;
        (my_infix(F) , Arity>1 ->
         As = [L|Rs],
         my_term_to_string(L,U,S1,D1,Vs),
         name(F,S2),
         " " = [BL],
         append(S1,[BL|S2],S3), 
         my_terms_to_string(Rs,U,S4,D1,Vs),
         append(S3,[BL|S4],S) 
       ;
        (my_prefix(F) , As = [A1] ->
         name(F,S1),
         " " = [BL],
         my_list_to_tuple(LA1,A1),
         my_terms_to_string(LA1,U,S2,D1,Vs),
         append(S1,[BL|S2],S)
        ;
         my_terms_to_string(As,U,S2,D1,Vs),
         my_term_to_string(F,U,S1,D,Vs),
         "(" = [OP], ")" = [CP], 
         append(S1,[OP|S2],S3),
         append(S3,[CP],S)
        )
       )
      )
    )
  ).

my_infix_argument_to_string(T,U,S,D,Vs) :-
  nonvar(T),
  functor(T,F,2),
  my_priority_operator(low,_SF,F),
%  functor(T,F,2),
%  my_infix(F),
  !,
  "(" = [OP], 
  my_term_to_string(T,U,S1,D,Vs),
  append([OP|S1],")",S).
my_infix_argument_to_string(T,U,S,D,Vs) :-
  my_term_to_string(T,U,S,D,Vs).

my_terms_to_string([],_U,"",_D,_Vs) :-
  !.
my_terms_to_string([T1],U,S,D,Vs) :-
  !,
  my_term_to_string(T1,U,S,D,Vs).
my_terms_to_string([T1,T2|Ts],U,S,D,Vs) :- !, 
  my_term_to_string(T1,U,S1,D,Vs), 
  my_terms_to_string([T2|Ts],U,S2,D,Vs), 
  "," = [C], 
  append(S1,[C|S2],S).

contains_non_alfanum([X|Xs]) :-
  "azAZ09_"=[La,Lz,Ua,Uz,N0,N9,US],
  ((X\==US,(X<N0 ; (X>N9,X<Ua) ; (X>Uz,X<La) ; X>Lz)) ->
   true
   ;
  contains_non_alfanum(Xs)). 
  
my_seq_to_string([],_U,[],_D,_Vs).
my_seq_to_string([T],U,S,D,Vs) :-
  my_term_to_string(T,U,S,D,Vs).
my_seq_to_string([T1,T2|Ts],U,S,D,Vs) :-
  !,
  "," = [CO],
  my_term_to_string(T1,U,S1,D,Vs),
  my_seq_to_string([T2|Ts],U,S2,D,Vs),
  append(S1,[CO|S2],S).

  
add_parentheses(A,S,PS) :-
  (A=(_A11 ,_A21) ; A=(_A12 ;_A22)),
  !,
  "(" = [OP], ")" = [CP], 
  append([OP|S],[CP],PS).
add_parentheses(_A,S,S).
  

one_line_display_to_string(Goal,String) :-
  my_absolute_filename('tmp__.txt',AFN),
  tell(AFN),
  call(Goal),
  told,
  !,
  see(AFN),
  readln(String,_),
  seen,
  !,
  rm_file(AFN),
  !.
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Identifiers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Null identifiers
get_null_id(Id) :-
  (null_id(CId) -> 
   Id is CId+1,
   retract(null_id(CId))
   ; 
   Id is 0),
  assertz(null_id(Id)).

reset_null_id :-
  retractall(null_id(_Id)).

% Rule identifiers 
get_rule_id(Id) :-  
  (rule_id(CId) ->
    Id is CId+1,
    retract(rule_id(CId))
   ;
    Id=0),
  assertz(rule_id(Id)).
 
reset_rule_id :-
  retractall(rule_id(_Id)).

pop_rule_id :-  
  (retract(rule_id(CId)) ->
    Id is CId-1,
    assertz(rule_id(Id))
   ;
    true).
    
% Predicate identifiers 
get_pred_id(O,OId) :-
  (pred_id(O,IId) -> 
   OId is IId+1,
   retract(pred_id(O,IId))
   ; 
   OId is 0),
  assertz(pred_id(O,OId)).

reset_pred_id :-
  retractall(pred_id(_O,_I)).

% Reset all system identifiers
reset_ids :-  
  reset_null_id,
  reset_rule_id,
  reset_pred_id.
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
% filter_NVs(+NVs,Vs,+FNVs)
% Filter pairs N=V in NVs for variables V occurring in Vs
filter_NVs(_NVs,[],[]).
filter_NVs(NVs,[V|Vs],[N=V|FNVs]) :-
  find_var_name(V,N,NVs),
  filter_NVs(NVs,Vs,FNVs).

% Filter
filter([],_FNVs,[]).
filter([NV|INVs],FNVs,[NV|ONVs]) :-
  my_member_var(NV,FNVs),
  !,
  filter(INVs,FNVs,ONVs).
filter([_INV|INVs],FNVs,ONVs) :-
  !,
  filter(INVs,FNVs,ONVs).
  
% Conversion
'NVs2Vs'([],[]).
'NVs2Vs'([_N=V|NVs],IV) :-
  'NVs2Vs'(NVs,Vs),
  append(Vs,[V],IV).

'Vs2NVs'([],_NVs,[]).
'Vs2NVs'([V|Vs],NVs,[N=V|TNVs]) :-
  find_var_name(V,N,NVs),
%  my_var_name(V,N,NVs),
  'Vs2NVs'(Vs,NVs,TNVs).


% Get the program variable name, if not found, assign it a new name
my_var_name(V,N,NVs) :-
  find_var_name(V,N,NVs),
  !.
my_var_name(_V,N,NVs) :-
  name_var(NVs,N).
  
replace_var_by_name_list([],_NVs).
replace_var_by_name_list([V|Vs],NVs) :-
  my_var_name(V,N,NVs),
  V=N,
  replace_var_by_name_list(Vs,NVs).
  
% Get the program variable name for a list of variables, if not found, assign it a new name
my_var_name_list([],_INVs,[]).
my_var_name_list([V|Vs],INVs,[N=V|ONVs]) :-
  my_var_name(V,N,INVs),
  my_var_name_list(Vs,[N=V|INVs],ONVs).
  
% Find a program variable name
find_var_name(V,N,[N=V1|_NVs]) :- 
  V == V1,
  !.
find_var_name(V,N,[_NV|NVs]) :- 
  find_var_name(V,N,NVs).

% Find a list of program variable names
find_var_name_list([],_NVs,[]).
find_var_name_list([V|Vs],NVs,[N=V|ONVs]) :- 
  find_var_name(V,N,NVs),
  find_var_name_list(Vs,NVs,ONVs).

assign_new_var_names([],_NVs,[]).
assign_new_var_names([V|Vs],NVs,NNVs) :-
  find_var_name(V,_N,NVs),
  !,
  assign_new_var_names(Vs,NVs,NNVs).  
assign_new_var_names([V|Vs],NVs,[N=V|NNVs]) :-
  name_var(NVs,V,N),
  assign_new_var_names(Vs,[N=V|NVs],NNVs).  

% var_names(+Vs,+NVs,-FNVs)
% Returns FNVs from NVs only for Vs
var_names([],_NVs,[]).
var_names([V|Vs],NVs,[N=V|FNVs]) :-
  my_var_name(V,N,NVs),
  var_names(Vs,NVs,FNVs).

% Assign names to variables in a term
assign_NVs(T,NVs) :-
  my_term_variables(T,Vs),
  my_var_name_list(Vs,[],NVs).
  
assign_variable_names_list([],[]).
assign_variable_names_list([T|Ts],[(T,Vs)|RTVs]) :-
  assign_variable_names(T,[],Vs),
  assign_variable_names_list(Ts,RTVs).

assign_variable_names(T,JNVs,NVs) :-
  my_term_variables(T,Vs),
  name_NVs(Vs,JNVs,_,NVs).

% (NVs,AlreadyNamed by other procedure, Last name, Name vars)
name_NVs([],NVs,_,NVs).
name_NVs([V|Vs],JNVs,LN,NVs) :-  
  find_var_name(V,_N,JNVs),
  !,
  name_NVs(Vs,JNVs,LN,NVs).
name_NVs([V|Vs],JNVs,LN,NVs) :-
  name_var(JNVs,LN,N),
  name_NVs(Vs,[N=V|JNVs],N,NVs).

name_var(NVs,LN,N) :-
  (var(LN) -> 
   first(SN),
   name(TN,SN);
   next(LN,TN)),
   (my_member(TN=_,NVs) ->
    name_var(NVs,TN,N)
    ;
    TN=N).

name_var(NVs,N) :-
  name_var(NVs,_LN,N).
  
next(X,Y) :-
  name(X,SX),
  nextS(SX,SY),
  name(Y,SY).

nextS("",SF) :- 
  !, 
  first(SF).
nextS(SX,SY) :-
  append(SFX,[LX],SX),
  last([CZ]),
  (LX<CZ ->
   LY is LX+1,
   append(SFX,[LY],SY)
   ;
   nextS(SFX,SFY),
   first(SF),
   append(SFY,SF,SY)
  ).

first(SF) :-
  name('A',SF).
last(SL) :-
  name('Z',SL).

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Database predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
% ASSERT
%%%%%%%%%%%%%%%%%%%%

% Asserting a list of rules
% Each rule is checked for constraint consistency
% before assert.
% If ok, then each rule is given a new id, asserted, 
% and its userdef constraints updated
my_assertz_list(DLs,_Error) :-
  check_DL_constraints_list(DLs),
  !,
  assertz_and_update_ctrs(DLs).
my_assertz_list(_DLs,true).

check_DL_constraints_list([]).
check_DL_constraints_list([DL|DLs]) :-
  check_DL_constraints(DL),
  check_DL_constraints_list(DLs).

% Assert in reverse order to get rule ids for compiled rules first, then for compilation roots
assertz_and_update_ctrs([]).
assertz_and_update_ctrs([DL]) :-
  DL=datalog(_R,_NVs,RId,_Ls,_Fid,_C),
  get_rule_id(RId),
  assertz(DL),
  % Update dependencies (predicates) of existing user defined constraints
  update_userdef_constraints(DL).
assertz_and_update_ctrs([DL,DL2|DLs]) :-
  assertz_and_update_ctrs([DL2|DLs]),
  assertz_and_update_ctrs([DL]).

% assertz_list Assert each element in the list
assertz_list([]).
assertz_list([X|Xs]) :-
  assertz(X),
  assertz_list(Xs).

%%%%%%%%%%%%%%%%%%%%
% RETRACT
%%%%%%%%%%%%%%%%%%%%

% Retracting a list of rules of the form datalog/6
retract_list([],_Error).
retract_list([DL|DLs],Error) :-
  (my_retract(DL,Error) -> true ; Error=true),
  retract_list(DLs,Error).

my_retract(DL,_Error) :-
  DL=datalog(R,_NVs,_Rid,_Ls,_Fid,_C),
  retract(DL),
  (check_removing_DL_constraint(DL) -> 
    true
   ;
    assertz(DL), 
    fail),
  (R=':-'(H,_B) -> true ; R=H),
  functor(H,P,A),
  functor(G,P,A),
  ((datalog(G,_,_,_,_,_) ; datalog(':-'(G,_),_,_,_,_,_)) ->
   true
  ;
   % Update dependencies (predicates) of existing user defined constraints
   update_userdef_constraints(DL)
  ).
my_retract(_DL,true).

check_removing_DL_constraint(DL) :-
  check_removing_DL_FK_constraint(DL),
  check_removing_DL_userdef_constraint(DL).
  
check_removing_DL_FK_constraint(datalog(R,_,_,_,_,_)) :-
  (R=':-'(H,_B) -> true ; R=H),
  functor(H,FTablename,_A),
  FK=my_foreign_key('$des',_Tablename,_FK_AttNames,FTablename,_PK_AttNames),
  (call(FK) ->
    (check_ctr(FK) ->
      fail % Looks for more foreign keys 
     ;
      !,
      fail % Constraint is violated. Fail 
    )
   ;
    true
  ).
check_removing_DL_FK_constraint(_DL).
  
check_removing_DL_userdef_constraint(datalog(R,_,_,_,_,_)) :-
  (R=':-'(H,_B) -> true ; R=H),
  functor(H,Pred,Arity),
  IC=my_integrity_constraint('$des',Preds,_Constraint,_NVs,_Head),
  call(IC),
  (my_member(Pred/Arity, Preds) ->
    (check_ctr(IC) ->
      fail
     ;
      !,
      fail
    )
   ;
    true
  ).
check_removing_DL_userdef_constraint(_DL).

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constraint checking
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% Check whether the provided Datalog fact is consistent w.r.t. integrity constraints
%
check_DL_constraints(DL) :-
  (check_ic(on)
   ->
    check_DL_type_ctr(DL),
    check_DL_NN_ctr(DL),
    check_DL_PK_ctr(DL),
    check_DL_CK_ctrs(DL),
    check_DL_FK_ctrs(DL),
    check_DL_FD_ctrs(DL),
    check_DL_user_ctrs(DL)
   ;
    true
  ).
  
%
% Check types of a Datalog rule
%
check_DL_type_ctr(DL) :-
  DL=datalog(R,_,_,_,_,_),
  (R=':-'(H,_B) -> true ; R=H),
  functor(H,T,A),
  (my_table('$des',T,A)
   ->
    (check_rule_types(R)
     ->
      true
     ;
%      get_table_types(T,DeclTypes),
      get_table_typed_schema(T,Schema),
%      write_error_log(['Type mismatch ',DeclTypes,' (table declaration)']),
%     A former Error info
      write_cmd_log_list(['$tab'(7),Schema,nl]),
      write_tapi_eot,
      !,
      fail
    )
   ;
    true
  ).

%
% Check not nullables constraints of a Datalog fact
%  
check_DL_NN_ctr(DL) :-
  DL=datalog(Fact,_,_,_,_,_),
  (Fact\=':-'(_Head,_Body)
   ->
   (functor(Fact,Tablename,Arity),
    my_table('$des',Tablename,Arity)
    ->
     check_tuple_NN_ctr(Tablename,Fact) 
    ;
     true
   )
   ;
    true
  ).

%
% Check not nullables constraint of a Datalog fact
%  
check_tuple_NN_ctr(Tablename,Fact) :-
  my_not_nullables('$des',Tablename,NN_AttNames),
  build_PK_goal(Fact,Tablename,NN_AttNames,NN_Vars,_Goal),
  (\+ my_member('$NULL'(_Id),NN_Vars)
   ->
   !
  ;
   development_hide_nulls(Fact,HFact),
   write_error_log(['Not null violation ',Tablename,'.',NN_AttNames,nl,'       when trying to insert: ','$quoted'(HFact)]),
   !,
   fail
  ).
check_tuple_NN_ctr(_Tablename,_Fact).
   
%
% Check primary key constraint of a Datalog fact
%  
check_DL_PK_ctr(DL) :-
  check_DL_UN_ctrs(DL,pk).
 
%
% Check candidate key constraints of a Datalog fact
%  
check_DL_CK_ctrs(DL) :-
  check_DL_UN_ctrs(DL,ck).

%
% Check unique constraint of a Datalog fact (called from PK and CK)
%  
check_DL_UN_ctrs(DL,Kind) :-
  DL=datalog(Fact,_,_,_,_,_),
  (Fact\=':-'(_Head,_Body) ->
   functor(Fact,Tablename,Arity),
   (my_table('$des',Tablename,Arity) ->
     check_tuple_UN_ctr(Tablename,Fact,Kind)
    ;
     true)
   ;
    true).
    
%
% Check unique constraint of a Datalog fact
%  
check_tuple_UN_ctr(Tablename,Fact,Kind) :-
  (Kind == pk -> 
    Message='Primary key',
    Declaration=my_primary_key('$des',Tablename,PK_AttNames)
   ;
    Message='Candidate key',
    Declaration=my_candidate_key('$des',Tablename,PK_AttNames)),
  call(Declaration),
  build_PK_goal(Fact,Tablename,PK_AttNames,PK_Vars,Goal),
  (\+ my_member('$NULL'(_Id),PK_Vars),
   get_answer(Goal,[])
  ->
   true
  ;
   write_error_log(['',Message,' violation ',Tablename,'.',PK_AttNames,nl,'       when trying to insert: ',Fact]),
   !,
   fail
  ),
  fail  % Looks for all constraint declarations
  .
check_tuple_UN_ctr(_Tablename,_Fact,_Kind).   
    
    
build_PK_goal(Fact,Tablename,PK_AttNames,PK_Vars,Goal) :-
  get_att_positions(Tablename,PK_AttNames,Positions),
  Fact =.. [Tablename|FactArgs],
  get_ith_arg_list(Positions,Fact,PK_Vars),
  build_PK_goal_arguments(FactArgs,Positions,1,GoalArgs),
  Goal =.. [Tablename|GoalArgs].
  
build_PK_goal_arguments(Args,[],_Pos,RArgs) :-
  !,
  length(Args,L),
  length(RArgs,L).
build_PK_goal_arguments([Arg|Args],[Pos|Poss],Pos,[Arg|RArgs]) :-
  !,
  Pos1 is Pos+1,
  build_PK_goal_arguments(Args,Poss,Pos1,RArgs).
build_PK_goal_arguments([_Arg|Args],Poss,Pos,[_RArg|RArgs]) :-
  Pos1 is Pos+1,
  build_PK_goal_arguments(Args,Poss,Pos1,RArgs).
  
check_DL_FK_ctrs(DL) :-
  DL=datalog(Fact,_,_,_,_,_),
  (Fact\=':-'(_Head,_Body) ->
   functor(Fact,Tablename,Arity),
   (my_table('$des',Tablename,Arity) ->
     check_tuple_FK_ctr(Tablename,Fact) 
    ;
     true)
   ;
    true).

%
% Check foreign key constraint of a Datalog fact
%  
check_tuple_FK_ctr(Tablename,Fact) :-
  my_foreign_key('$des',Tablename,FK_AttNames,ForeignTablename,PK_AttNames),
  build_FK_goal(Fact,FK_AttNames,ForeignTablename,PK_AttNames,_FK_Vars,Goal),
  (get_answer(Goal,[]) ->
    write_error_log(['Foreign key violation ',Tablename,'.',FK_AttNames,'->',ForeignTablename,'.',PK_AttNames,nl,'       when trying to insert: ',Fact]),
    !,
    fail
   ;
    true
  ),
  fail  % Looks for all foreign key declarations
  .
check_tuple_FK_ctr(_Tablename,_Fact).

    
% Build a goal that looks an entry in the foreign table with the same values in the corresponding positions
build_FK_goal(Fact,FK_AttNames,ForeignTablename,PK_AttNames,FK_Vars,Goal) :-
  project_tuple(Fact,FK_AttNames,ValueList),
  get_att_positions(ForeignTablename,PK_AttNames,PK_AttPositions),
  get_ith_arg_list(PK_AttPositions,Fact,FK_Vars),
  my_table('$des',ForeignTablename,Arity),
  build_FK_goal_arguments(ValueList,PK_AttPositions,Arity,1,ForeignArgs),
  Goal=..[ForeignTablename|ForeignArgs].

project_tuple(Tuple,AttNames,ValueList) :-
  Tuple=..[Tablename|TableArgs],
  get_att_positions(Tablename,AttNames,Positions),
  filter_positions(TableArgs,Positions,ValueList).

filter_positions(TableArgs,Positions,ValueList) :-
  filter_positions(TableArgs,Positions,1,ValueList).
  
filter_positions(_Args,[],_I,[]) :-
  !.
filter_positions([Arg|Args],[I|Is],I,[Arg|RArgs]) :-
  !,
  I1 is I+1,
  filter_positions(Args,Is,I1,RArgs).
filter_positions([_Arg|Args],Is,I,RArgs) :-
  I1 is I+1,
  filter_positions(Args,Is,I1,RArgs).

get_att_positions(Tablename,AttNames,AttPositions) :-
  bagof(AttPosition,
        AttName^DataType^
        (my_member(AttName,AttNames),
         my_attribute('$des',AttPosition,Tablename,AttName,DataType)
        ),
        AttPositions).
  
% get_att_positions(Tablename,AttNames,AttPositions) :-
%   setof(AttPosition,
%         AttName^DataType^
%         (my_attribute('$des',AttPosition,Tablename,AttName,DataType),
%          my_member(AttName,AttNames)
%         ),
%         AttPositions).
  
build_FK_goal_arguments([],[],Arity,I,Args) :-
  !,
  TL is Arity-I+1,
  length(Args,TL).
build_FK_goal_arguments([Value|Values],[I|Is],Arity,I,[Value|Args]) :-
  !,
  I1 is I+1,
  build_FK_goal_arguments(Values,Is,Arity,I1,Args).
build_FK_goal_arguments(Values,Is,Arity,I,[_Var|Args]) :-
  !,
  I1 is I+1,
  build_FK_goal_arguments(Values,Is,Arity,I1,Args).
  
  
%
% Check functional dependency constraint of a Datalog fact
%  
check_DL_FD_ctrs(DL) :-
  DL=datalog(Fact,_,_,_,_,_),
  (Fact\=':-'(_Head,_Body) ->
   functor(Fact,Tablename,Arity),
   (my_table('$des',Tablename,Arity) ->
     check_tuple_FD_ctr(Tablename,Fact) 
    ;
     true)
   ;
    true).

check_tuple_FD_ctr(Tablename,Fact) :-
  my_functional_dependency('$des',Tablename,AttNames,DepAttNames),
  build_FD_goal(Fact,AttNames,DepAttNames,Goal),
  (get_answer(Goal,[Witness|_]) ->
    get_table_untyped_schema(Tablename,Table),
    Witness=..[_|WArs],
    WTuple=..[Tablename|WArs],
    write_error_log(['Functional dependency violation ',Tablename,'.',AttNames,'->',Tablename,'.',DepAttNames,nl,'       in table ',Table,nl,'       when trying to insert: ',Fact,nl,'       Witness tuple        : ',WTuple]),
    !,
    fail
   ;
    true
  ),
  fail  % Looks for all functional dependency constraint declarations
  .
check_tuple_FD_ctr(_Tablename,_Fact).
  
build_FD_goal(Fact,AttNames,DepAttNames,Goal) :-
  project_tuple(Fact,AttNames,ValueList),
  get_att_positions(Tablename,AttNames,AttPositions),
  my_table('$des',Tablename,Arity),
  build_FK_goal_arguments(ValueList,AttPositions,Arity,1,Args),
  Goal1=..[Tablename|Args],
  get_att_positions(Tablename,DepAttNames,DepAttPositions),
  filter_positions(Args,DepAttPositions,DepVars),
  project_tuple(Fact,DepAttNames,DepValues),
  my_zipWith('\\=',DepVars,DepValues,DisjList),
  my_list_to_disjunction(DisjList,Goal2),
  FD=..[fd|Args],
  Goal=':-'(FD,(Goal1,Goal2)).
  
%
% Check user-defined integrity constraint of a rule
%  
check_DL_user_ctrs(DL) :-
  copy_term(DL,CDL),
  CDL=datalog(Rule,_,RId,_,_,_),
  (Rule=':-'(H,_B),
   !
   ;
   Rule=H
  ),
  functor(H,F,A),
  get_userdef_integrity_ctrs(F/A,Ctrs),
  % Temporarily use a new Rule Id., which is not wasted as the rule is retracted afterwards
  get_rule_id(RId),
  assertz(CDL),
  (check_ctr_list(Ctrs) 
   ->
    retract(CDL),
    pop_rule_id
   ;
    retract(CDL),
    pop_rule_id,
    !,
    fail
  ).

  
% Update dependencies of user-defined integrity constraints related to a Datalog rule  
update_userdef_constraints(DL) :-
  DL=datalog(Rule,_,_,_,_,_),
  (Rule=':-'(H,_B),
   !
   ;
   Rule=H
  ),
  functor(H,F,A),
  get_userdef_integrity_ctrs(F/A,Ctrs),
  update_userdef_constraint_list(Ctrs).
  
update_userdef_constraint_list([]).
update_userdef_constraint_list([Ctr|Ctrs]) :-
  update_userdef_constraint(Ctr),
  update_userdef_constraint_list(Ctrs).
  
update_userdef_constraint(my_integrity_constraint(DB,OldPreds,Constraint,NVs,Head)) :-
  user_predicates_rule(':-'(Constraint),Preds),
  (OldPreds\==Preds ->
    retractall(my_integrity_constraint(DB,_OldPreds,Constraint,NVs,Head)),
    assertz(my_integrity_constraint(DB,Preds,Constraint,NVs,Head))
   ;
    true
  ).
  
    
% Get all the user-defined integrity constraints involving a predicate F/A
get_userdef_integrity_ctrs(F/A,Ctrs) :-
  findall(Ctr,
          (Ctr=my_integrity_constraint('$des',Preds,_B,_NVs,_H),
           call(Ctr),
           my_member(F/A,Preds)
           ),
          Ctrs).
          
check_ctr_list([]).
check_ctr_list([Ctr|Ctrs]) :-
  check_ctr(Ctr),
  check_ctr_list(Ctrs).
  
check_ctr_failing_list([]).
check_ctr_failing_list([Ctr|Ctrs]) :-
  check_ctr(Ctr),
  !,
  check_ctr_failing_list(Ctrs).
check_ctr_failing_list([Ctr|Ctrs]) :-
  internal_ctr_program_ctr(Ctr,ProgramCtr),
  write_error_log(['In constraint: ',ProgramCtr,nl]),
  check_ctr_failing_list(Ctrs).
  
internal_ctr_program_ctr(my_not_nullables('$des',Tablename,Colnames),':-'(nn(Tablename,Colnames))).
internal_ctr_program_ctr(my_primary_key('$des',Tablename,Colnames),':-'(pk(Tablename,Colnames))).
internal_ctr_program_ctr(my_candidate_key('$des',Tablename,Colnames),':-'(ck(Tablename,Colnames))).
internal_ctr_program_ctr(my_foreign_key('$des',Tablename,Colnames,FTableName,FColnames),':-'(fk(Tablename,Colnames,FTableName,FColnames))).
internal_ctr_program_ctr(my_functional_dependency('$des',Tablename,Colnames,DColnames),':-'(fd(Tablename,Colnames,DColnames))).
internal_ctr_program_ctr(my_integrity_constraint('$des',_Preds,Ctr,NVs,_Head),':-'(CtrNVs)) :-
  term_to_term_NVs(Ctr,NVs,CtrNVs).

/*********************************************************************/
/* Finding Datalog source Rules matching a pattern: get_source_dlrules */
/*********************************************************************/

% Get source rules from a list of rules
get_source_dlrules_list([],[]).
get_source_dlrules_list([(Rule,_NVs)|Rules],CRules) :-
  get_source_dlrules(rule,Rule,CRules1),
  get_source_dlrules_list(Rules,CRules2),
  append(CRules1,CRules2,CDRules),
  remove_duplicates(CDRules,CRules).

% Get source rules as they were originally typed. Optionally filtered by name and arity
get_source_dlrules(DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
        SR^SNVs^CDLs^SH^SB^F^A^
        ((C=source, 
          datalog(R,NVs,RId,Ls,FId,C)
         ;
          C=compilation(SR,SNVs,CDLs),
          datalog(R,NVs,RId,Ls,FId,C)
         ),
         (R=':-'(SH,SB) -> functor(SH,F,A), my_not(system_predicate(F)) ; true)
        ),
        DLs).

system_predicate(P) :-
  atom_concat('$',_,P).

get_source_dlrules(name,N,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
        SNVs^SH^SB^CRIds^A^
        ((C=source,
          datalog(R,NVs,RId,Ls,FId,C), 
          (R=':-'(SH,SB) -> true ; R=SH)
         ;
          C=compilation(':-'(SH,SB),SNVs,CRIds), 
          datalog(R,NVs,RId,Ls,FId,C)
         ),
         functor(SH,N,A)
        ),
        DLs).

get_source_dlrules(namearity,N/A,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
        SNVs^SH^SB^CRIds^
        ((C=source,
          datalog(R,NVs,RId,Ls,FId,C), 
          (R=':-'(SH,SB) -> true ; R=SH)
         ;
          C=compilation(':-'(SH,SB),SNVs,CRIds), 
          datalog(R,NVs,RId,Ls,FId,C)
         ),
         functor(SH,N,A)
        ),
        DLs).

get_source_dlrules(head,H,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
        SNVs^SH^SB^CRIds^
        ((C=source,
          datalog(R,NVs,RId,Ls,FId,C),
          (R=':-'(SH,SB) -> true ; R=SH) 
         ;
          C=compilation(':-'(SH,SB),SNVs,CRIds), 
          datalog(R,NVs,RId,Ls,FId,C)
         ),
         my_subsumes(H,SH)
        ),
        DLs).

get_source_dlrules(rule,PR,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
        SNVs^SH^SB^SR^CRIds^
        ((C=source,
          datalog(R,NVs,RId,Ls,FId,C), 
          (R=':-'(SH,SB) -> true ; R=SH), 
          SR=R
         ;
          C=compilation(':-'(SH,SB),SNVs,CRIds), 
          datalog(R,NVs,RId,Ls,FId,C),
          SR=':-'(SH,SB)
         ),
         my_subsumes(PR,SR)
        ),
        DLs).

/*********************************************************************/
/* Finding Datalog Object Rules: get_object_dlrules                  */
/*********************************************************************/
% Gets the rules that are actually used in a computation. 
% They include rules as typed by the programmer (source) and compiled rules  
% from others which cannot be directly computed (compilation)

% Types of rules:
% - Uncompiled: 
%    * Tagged as 'source'
% - Compiled: 
%    * The root of a compilation tagged as 'compilation'(SourceHead,SourceBody,ListOfCompiledRules)
%      The list of compiled rules may contain additional compilations.
%    * A leaf of a compilation tagged as 'compiled'.

% Get object rules from a list of source rules
get_object_dlrules_list([],[]).
get_object_dlrules_list([(Rule,_NVs)|Rules],CRules) :-
  get_object_dlrules(rule,Rule,CRules1),
  get_object_dlrules_list(Rules,CRules2),
  append(CRules1,CRules2,CRules).


% Get object rules. 
get_object_dlrules(DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,C),
              datalog(R,NVs,RId,Ls,FId,C),
              DLs).

% Get object rules. Filtered by a given source rule
get_object_dlrules(datalog(R,NVs,RId,Ls,FId,source),[datalog(R,NVs,RId,Ls,FId,source)]) :-
  !.
get_object_dlrules(datalog(R,NVs,RId,Ls,FId,compilation(':-'(H,B),SNVs,RuleIds)),
                  [datalog(R,NVs,RId,Ls,FId,compilation(':-'(H,B),SNVs,RuleIds))|ODLs]) :-
  !,
  get_dependent_dlrules([datalog(R,NVs,RId,Ls,FId,compilation(':-'(H,B),SNVs,RuleIds))],ODLs).

% Get object rules. Filtered by name
get_object_dlrules(name,N,DLs) :-
  get_uncompiled_dlrules(N,UDLs),
  get_root_compiled_dlrules(N,RDLs),
  get_dependent_dlrules(RDLs,DDLs),
  concat_lists([UDLs,RDLs,DDLs],DLs).

% Get object rules. Filtered by name and arity
get_object_dlrules(namearity,N/A,DLs) :-
  get_uncompiled_dlrules(N,A,UDLs),
  get_root_compiled_dlrules(N,A,RDLs),
  get_dependent_dlrules(RDLs,DDLs),
  concat_lists([UDLs,RDLs,DDLs],DLs).

% Get object rules. Filtered by head
get_object_dlrules(head,H,DLs) :-
  get_uncompiled_dlrules_from_head(H,UDLs),
  get_root_compiled_dlrules_from_head(H,RDLs),
  get_dependent_dlrules(RDLs,DDLs),
  concat_lists([UDLs,RDLs,DDLs],DLs).

% Get object rules. Filtered by rule
get_object_dlrules(rule,R,DLs) :-
  get_uncompiled_dlrules_from_rule(R,UDLs),
  get_root_compiled_dlrules_from_rule(R,RDLs),
  get_dependent_dlrules(RDLs,DDLs),
  concat_lists([UDLs,RDLs,DDLs],DLs).

% Get uncompiled rules. Filtered by name
get_uncompiled_dlrules(N,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,source),
        H^B^A^
        (datalog(R,NVs,RId,Ls,FId,source),
         (R=':-'(H,B) -> true ; H=R), 
         functor(H,N,A)),
        DLs).

% Get uncompiled rules. Filtered by name and arity
get_uncompiled_dlrules(N,A,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,source),
        H^B^
        (datalog(R,NVs,RId,Ls,FId,source),
         (R=':-'(H,B) -> true ; H=R), 
         functor(H,N,A)),
        DLs).

% Get uncompiled rules. Filtered by head
get_uncompiled_dlrules_from_head(PH,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,source),
        H^B^
        (datalog(R,NVs,RId,Ls,FId,source),
         (R=':-'(H,B) -> true ; H=R),
         my_subsumes(PH,H)),
        DLs).

% Get uncompiled rules. Filtered by rule
get_uncompiled_dlrules_from_rule(PR,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,source),
        (datalog(R,NVs,RId,Ls,FId,source),
         my_subsumes(PR,R)),
        DLs).


% get_root_compiled_dlrules(RNVss) :-
%   my_nf_bagof((R,NVs),
%         RId^Ls^FId^Rs^
%         (datalog(R,NVs,RId,Ls,FId,Rs)),
%         RNVss).

% Get rules that are compilation roots. Filtered by source rule name
get_root_compiled_dlrules(N,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
        H^B^A^
        (datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
         (R=':-'(H,B) -> true ; H=R), 
         functor(SH,N,A)
        ),
        DLs).

% Get rules that are compilation roots. Filtered by source rule name and arity
get_root_compiled_dlrules(N,A,DLs) :-
 my_nf_bagof(datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
       H^B^
       (datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
        (R=':-'(H,B) -> true ; H=R), 
        functor(SH,N,A)
       ),
       DLs).

% Get rules that are compilation roots. Filtered by source rule head
get_root_compiled_dlrules_from_head(PH,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
        (datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
         my_subsumes(PH,SH)),
        DLs).

% Get rules that are compilation roots. Filtered by source rule 
get_root_compiled_dlrules_from_rule(PR,DLs) :-
  my_nf_bagof(datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
        (datalog(R,NVs,RId,Ls,FId,compilation(':-'(SH,SB),SNVs,RuleIds)),
         my_subsumes(PR,':-'(SH,SB))),
        DLs).

% Get rules result from a compilation. There may be further compilations from a given root
get_dependent_dlrules([],[]).
get_dependent_dlrules([datalog(R,NVs,RId,Ls,FId,compilation(':-'(H,B),SNVs,RIds))|DLs],DDLs) :-
  !,
  my_nf_bagof(CDLs,
        (datalog(R,NVs,RId,Ls,FId,compilation(':-'(H,B),SNVs,RIds)),
         my_nf_bagof(datalog(DR,DNVs,CRId,D_Ls,DFId,DC),
                (my_member(CRId,RIds),
                 datalog(DR,DNVs,CRId,D_Ls,DFId,DC)
                ),
                CDLs)
        ),
        CDLss),
  concat_lists(CDLss,CCDLs),
  get_dependent_dlrules(CCDLs,HDLs),
  get_dependent_dlrules(DLs,TDLs),
  concat_lists([CCDLs,HDLs,TDLs],DDLs).
get_dependent_dlrules([_|DLs],DDLs) :-
  get_dependent_dlrules(DLs,DDLs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rule Conversions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% datalog(...) to (R,NVs), where either R=H:-B or R=H
dlrule_to_ruleNV_list([],[]).
dlrule_to_ruleNV_list([datalog(R,NVs,_,_,_,_)|DRs],[(R,NVs)|RNVs]) :-
  dlrule_to_ruleNV_list(DRs,RNVs).

% datalog(...) to R, where either R=H:-B or R=H
dlrule_to_rule_list([],[]).
dlrule_to_rule_list([datalog(R,_,_,_,_,_)|DRs],[R|Rs]) :-
  dlrule_to_rule_list(DRs,Rs).

% datalog(...) to (R,NVs), where either R=H:-B or R=H
source_dlrule_to_ruleNV_list([],[]).
% Source rules:
source_dlrule_to_ruleNV_list([datalog(R,NVs,_,_,_,source)|DRs],[(R,NVs)|RNVs]) :-
  !,
  source_dlrule_to_ruleNV_list(DRs,RNVs).
% Simplified or safed rules (no other rules are part of this compilation)
source_dlrule_to_ruleNV_list([datalog(R,NVs,_,_,_,compilation(_SR,_SNVs,[]))|DRs],[(R,NVs)|RNVs]) :-
  source_dlrule_to_ruleNV_list(DRs,RNVs).
% Compilation root with other compiled rules for this root
source_dlrule_to_ruleNV_list([datalog(_R,_RNVs,_,_,_,compilation(':-'(SH,SB),NVs,_RIds))|DRs],[(':-'(SH,SB),NVs)|RNVs]) :-
  source_dlrule_to_ruleNV_list(DRs,RNVs).

% R to (R,NVs), where either R=H:-B or R=H
rule_to_ruleNV_list([],_,[]).
rule_to_ruleNV_list([R|Rs],NVs,[(R,RNVs)|RNVss]) :-
  assign_variable_names(R,NVs,RNVs),
  rule_to_ruleNV_list(Rs,NVs,RNVss).

  
% (R,NVs) to R, where either R=H:-B or R=H
ruleNV_to_rule_list([],[]).
ruleNV_to_rule_list([(R,_NVs)|RNVs],[R|Rs]) :-
  ruleNV_to_rule_list(RNVs,Rs).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rule Info
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
get_rule_table_name_arity(':-'(H,_B),Tablename,Arity) :-
  !,
  functor(H,Tablename,Arity).
get_rule_table_name_arity(H,Tablename,Arity) :-
  functor(H,Tablename,Arity).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File I/O
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Opening a File

try_open(F,CFN,St) :- 
  (my_file_exists(F) ->
   my_absolute_filename(F,CFN)
   ;
   atom_concat(F,'.dl',FP), 
   (my_file_exists(FP) ->
     my_absolute_filename(FP,CFN)
    ;
     my_working_directory(CD),
     atom_concat(CD,F,CDF),
     (my_file_exists(CDF) ->
       my_absolute_filename(CDF,CFN)
      ;
       atom_concat(CD,FP,CDFP),
       my_file_exists(CDFP),
       my_absolute_filename(CDFP,CFN)
     )
   )
  ),
  !, 
  (open(CFN,read,St),
   set_input(St) ->
   true
   ;
   write_error_log(['Stream cannot be opened.',nl]),
   fail). 
try_open(F,_,_) :-
  write_error_log(['File ''',F,''' not found.',nl]),
  fail.

try_close(Stream) :-
  catch(close(Stream),_,true).
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

user_input_string(Str) :-
  flush_output,
  readln(Str,_),
  (batch(_,_,_) -> inc_line, write_string_log(Str), nl_log ; true),
  (\+ batch(_,_,_),log(_,_) -> write_only_to_log(Str), nl_only_to_log ; true).

inc_line :-
  retract(batch(L,F,S)),
  L1 is L+1,
  assertz(batch(L1,F,S)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OS Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Remove a file

rm_file(NFileName) :-
  ensure_atom(NFileName,FileName),
  (my_file_exists(FileName) ->
    my_remove_file(FileName)
   ;
    write_error_log(['File does not exist.'])
  ).


% Changing the Current Path

cd_path(NPath) :-
  ensure_atom(NPath,Path),
  (my_directory_exists(Path) ->
    my_change_directory(Path),
    pwd_path
   ;
    write_error_log(['Cannot access the path ''', Path, '''.'])
  ).


% Displaying the Current Path

pwd_path :-
  my_working_directory(Path),
  (tapi(off) ->
   write_log_list(['Info: Current directory is:',nl,'  ',Path,nl]) 
  ;
   write_log_list([Path,nl])
  ).


% Listing Directory Contents

ls :-
  my_working_directory(WorkingPath),
  ls(WorkingPath).

ls(NPath) :-
  ensure_atom(NPath,Path),
  (my_not(my_directory_exists(Path)) ->
   write_warning_log(['Path ''', Path, ''' does not exist (wildcards not allowed).'])
   ;
   (
    my_absolute_filename(Path, AbsolutePath),
    my_directory_files(AbsolutePath, Files),
    my_directory_directories(AbsolutePath, Directories),
    write_log_list(['Info: Contents of ', AbsolutePath, nl]), 
    nl_compact_log,
    write_log('Files:'), 
    write_dir_files(Files), 
    nl_log,
    write_log('Directories:'), 
    write_dir_directories(Directories), 
    nl_log)).


% Writing each File in a Directory. Path comes without final slash

write_dir_files([]).
write_dir_files([F|Fs]) :-
  nl_log, 
  write_log('  '), 
  write_log(F), 
  write_dir_files(Fs).


% Writing each Directory in a Directory

write_dir_directories([]).
write_dir_directories([F|Fs]) :-
  F \== '.',
  F \== '..', 
  !,
  nl_log,
  write_log('  '),
  write_log(F),
  write_dir_directories(Fs).
write_dir_directories([_F|Fs]) :-
  write_dir_directories(Fs).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Writing a term with its textual variable names

write_with_NVs(T,NVs) :-
  my_term_to_string(T,S,NVs),
  write_string_log(S).
% write_with_NVs(T,NVs) :-
%   copy_term([T,NVs],[CT,CNVs]),
%   my_term_variables(CT,Vs),
%   replace_var_by_name_list(Vs,CNVs),
%   write_log(CT).
% %  write_quoted_log(CT).

% Replaces each variable in a term by its name
term_to_term_NVs(T,NVs,CT) :-
  copy_term([T,NVs],[CT,CNVs]),
  my_term_variables(CT,Vs),
  replace_var_by_name_list(Vs,CNVs).

write_with_NVs_list([],_NVs).
write_with_NVs_list([T|Ts],NVs) :-
  write_with_NVs(T,NVs),
  write_with_NVs_list(Ts,NVs).

write_cond_unquoted_with_NVs_list([],_NVs).
write_cond_unquoted_with_NVs_list([nl|Ts],NVs) :-
  !,
  nl_log,
  write_cond_unquoted_with_NVs_list(Ts,NVs).
write_cond_unquoted_with_NVs_list(['$cond'(G,T1s)|Ts],NVs) :-
  !,
  (call(G) -> write_cond_unquoted_with_NVs_list(T1s,NVs) ; true),
  write_cond_unquoted_with_NVs_list(Ts,NVs).
write_cond_unquoted_with_NVs_list([T|Ts],NVs) :-
  my_ground(T),
  !,
  write_log(T),
  write_cond_unquoted_with_NVs_list(Ts,NVs).
write_cond_unquoted_with_NVs_list([T|Ts],NVs) :-
  write_with_NVs(T,NVs),
  write_cond_unquoted_with_NVs_list(Ts,NVs).

write_unquoted_with_NVs_list([],_NVs).
write_unquoted_with_NVs_list([T|Ts],NVs) :-
  my_ground(T),
  !,
  write_log(T),
  write_unquoted_with_NVs_list(Ts,NVs).
write_unquoted_with_NVs_list([T|Ts],NVs) :-
  write_with_NVs(T,NVs),
  write_unquoted_with_NVs_list(Ts,NVs).

write_with_NVs_delimited_list([],_NVs) :-
  write_log('[]'),
  !.
write_with_NVs_delimited_list(Ts,NVs) :-
  write_log('['),
  my_list_to_tuple(Ts,TTs),
  write_with_NVs(TTs,NVs),
  write_log(']').


% Comma-separated writing of a a list of terms with their textual variable names

write_csa_with_NVs([],_).
write_csa_with_NVs([T],Vs) :-
  write_with_NVs(T,Vs).
write_csa_with_NVs([T1,T2|RTs],Vs) :-
  write_with_NVs(T1,Vs),
  write_log(','), 
  write_csa_with_NVs([T2|RTs],Vs).

% Verbose output of lists

write_verb(L) :-
  (verbose(on),tapi(off) -> 
    write_verb_list(L)
   ;
    true).
write_verb_list(_L) :-
  (tapi(on)
   ;
   verbose(off)
  ),
  !.
write_verb_list([]).
write_verb_list([T|Ts]) :-
  (T==nl ->
    nl_log
   ; 
    write_log(T)),
  write_verb_list(Ts).

% Log Output: Both current stream and log file, if enabled

write_log(X) :-
  (output(on)
   ->
   write(X)
   ;
   true
  ),
  (log(_F,S)
%  , \+ batch(_,_,_)
   -> 
    write(S,X) 
   ; 
    true
  ).

write_quoted_log(nl) :-
  write_log_list([nl]),
  !.
write_quoted_log('.') :-
  write_log_list(['.']),
  !.
write_quoted_log(X) :-
  (output(on) ->
    write_term(X,[quoted(true)])
   ;
    true), 
  (log(_F,S) ->
    write_term(S,X,[quoted(true)])
   ;
    true).

write_quoted_log_list([]).
write_quoted_log_list([X|Xs]) :-
  write_quoted_log(X),
  write_quoted_log_list(Xs).

nl_log :-
  (output(on) ->
    nl
   ;
    true),
  nl_only_to_log.


write_list_log(Xs) :-
  tapi(off),
  !,
  write_log(Xs),
  nl_log.
write_list_log(Xs) :-
  (
   member(X,Xs),
   write_log_list([X,nl]),
   fail
  ;
   true
  ).
  
  
% Log Output: with new program names for variables

write_log_fresh_NVs(X) :-
  assign_variable_names(X,[],NVs),
  write_with_NVs(X,NVs).

% Log Output for lists of terms

write_log_list([]).
write_log_list([T|Ts]) :-
  (T==nl ->
    nl_log
   ;
    write_log(T)),
  write_log_list(Ts).

% Log Output for lists of terms possibly in commands

write_cmd_log_list([]).
write_cmd_log_list([T|Ts]) :-
  (T==nl
   ->
    nl_log
   ;
    (T='$tab'(N)
     ->
     (tapi(off)
      ->
       my_spaces(N,S),
       write_log_list([S])
      ;
       true
     )
     ;
     (T='$quoted'(CT)
      ->
      write_quoted_log(CT)
      ;
      write_log(T)
      )
    )
  ),
  write_cmd_log_list(Ts).

% Only-to-Log Output

% Strings
write_only_to_log(S) :-
  (S=[_|_] ; S=[]),
  !,
  (log(_F,H) ->
    name(X,S), 
    write(H,X)
   ;
    true).
    
% Others
write_only_to_log(S) :-
  (log(_F,H) ->
    write(H,S)
   ;
    true).

nl_only_to_log :-
  (log(_F,H) ->
    nl(H)
   ;
    true).

% Compact listings

nl_compact_log :-
  (compact_listings(on) -> 
    true 
   ;
    nl_log).

nl_compact_verb :-
  (compact_listings(on) -> 
    true 
   ;
    write_verb([nl])).

% TAPI writing

write_notapi_log_list(_M) :-
  tapi(on),
  !.
write_notapi_log_list(M) :-
  write_log_list(M).

write_tapi_log_list(_M) :-
  tapi(off),
  !.
write_tapi_log_list(M) :-
  write_log_list(M).

nl_tapi_log(tapi) :-
  !.
nl_tapi_log(_Command) :-
  nl_compact_log.

nl_tapi_log :-
  tapi(on),
  !.
nl_tapi_log :-
  nl_compact_log.
   
write_tapi_delimiter :-
  tapi(off),
  !.  
write_tapi_delimiter :-
  write_log_list(['$',nl]).
  
write_tapi_success :-
  tapi(off),
  !.
write_tapi_success :-
  write_log_list(['$success',nl]).

% write_tapi_true :-
%   tapi(off),
%   !.
write_tapi_true :-
  write_log_list(['$true',nl]).

% write_tapi_false :-
%   tapi(off),
%   !.
write_tapi_false :-
  write_log_list(['$false',nl]).

write_tapi_eot :-
  tapi(off),
  !.
write_tapi_eot :-
  write_log_list(['$eot',nl]).

%
% Error, warning and info messages
%
% Write error message, formatted as display status
write_error_log(['$tbc']) :-
  tapi(off),
  !,
  write_log('Error: ').
write_error_log(Message) :-
  tapi(off),
  !,
  write_log('Error: '),
  write_cmd_log_list(Message),
  (append(_,[nl],Message)
   ->
   true
   ;
   nl_log
  ).
write_error_log(['$tbc']) :- % To be continued
  write_log_list(['$error',nl,0,nl]).
write_error_log(Message) :-
  write_log_list(['$error',nl,0,nl]),
  write_cmd_log_list(Message),
  (append(_,[nl],Message)
   ->
   true % For continuation error messages
   ;
   nl_log,
   write_tapi_eot % End of error report transmission
  ).
  
% Write warning if tapi is disabled
write_notapi_warning_log(_Message) :-
  tapi(on),
  !.
write_notapi_warning_log(Message) :-
  write_warning_log(Message).
  
% Write warning message, formatted as display status
write_warning_log(Message) :-
  tapi(off),
  !,
  write_log('Warning: '),
  write_log_list(Message),
  nl_log.
write_warning_log(Message) :-
  write_log_list(['$error',nl,1,nl]),
  write_log_list(Message),
  nl_log,
  (append(_,[nl],Message)
   ->
   true % For continuation error messages
   ;
   write_tapi_eot % End of error report transmission
  ).

% Write info if tapi is disabled
write_notapi_info_log(_Message) :-
  tapi(on),
  !.
write_notapi_info_log(Message) :-
  write_info_log(Message).
  
% Write info if tapi is enabled
write_tapi_info_log(_Message) :-
  tapi(off),
  !.
write_tapi_info_log(Message) :-
  write_info_log(Message).
  
% Write info message, formatted as display status
write_info_log(Message) :-
  tapi(off),
  !,
  write_log('Info: '),
  write_log_list(Message),
  nl_log.
write_info_log(Message) :-
  write_log_list(['$error',nl,2,nl]),
  write_log_list(Message),
  nl_log,
  (append(_,[nl],Message)
   ->
   true % For continuation error messages
   ;
   write_tapi_eot % End of error report transmission
  ).

% write_running_info_log
write_running_info_log(_Message) :-
  (tapi(on)
  ;
   running_info(off)
  ;
   batch(_,_,_)).
write_running_info_log(Message) :-
  tapi(off),
  running_info(on),
  !,
  write_log('Info: '),
  write_log_list(Message).
  
% Write verbose info message, formatted as display status
write_info_verb_log(_Message) :-
  (verbose(off)
   ;
   tapi(on)
  ),
  !.
write_info_verb_log(Message) :-
  write_info_log(Message).

% Writing a string (Log Output)

write_string_log([]) :-
  !.
write_string_log([C|Cs]) :-
  name(A,[C]),
  write_log(A), 
  write_string_log(Cs).

% Writing a string (Current Stream Output)

write_string(_S) :-
  output(off),
  !.
write_string([]) :-
  !.
write_string([C|Cs]) :-
  name(A,[C]),
  write(A), 
  write_string(Cs).
  
% Writing a term and spaces to fit a given width (Log Output), quoting if needed

write_tab_log(T,L) :-
  my_term_to_string(T,ST,[]),
  write_string_log(ST),
  length(ST,STL),
  SL is L-STL,
  SL>=0,
  !,
  my_spaces(SL,S),
  write_log(S).
write_tab_log(_T,L) :-
  my_spaces(L,S),
  write_log_list([nl,S]).
  
% Writing a term and spaces to fit a given width (Log Output), avoid quoting 

write_unquoted_tab_log(T,L) :-
  write_log(T),
  atom_length(T,TL),
  SL is L-TL,
  SL>=0,
  !,
  my_spaces(SL,S),
  write_log(S).
write_unquoted_tab_log(_T,L) :-
  my_spaces(L,S),
  write_log_list([nl,S]).

  
my_spaces(SL,T):-
  my_spacesS(SL,S),
  name(T,S).
  
my_spacesS(0,[]) :-
  !.
my_spacesS(N,[Sp|Ts]) :-
  [Sp] = " ",
  N1 is N-1,
  my_spacesS(N1,Ts).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Error Display
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Syntax error reporting

syntax_error(Where) :- 
  write_error_log(['Syntax error in ', Where]).
  

% Redefinition error

redefinition_error(F,A) :-
%  write_error_log(['Syntax error. Trying to redefine the builtin ',F,'/',A]),
  my_raise_exception(generic,syntax(['Error: Syntax error. Trying to redefine the builtin ',F,'/',A]),[]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parsing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For parsing variables, e.g.:
% a --> {p(X)}, X
% a --> {p(X)}, my_string(X)
  
my_string([]) --> 
  [].
my_string([C|Cs]) -->
  [C],
  {[A] = "'",
   A =\= C},
  my_string(Cs).

% For parsing keywords, irrespective of the case

my_kw([],Cs,Cs).
my_kw([CC|CCs],[C|Cs],Ys) :-
  [C] =\= "'",
  to_uppercase_char(C,CC),
  my_kw(CCs,Cs,Ys).

% Finding a keyword
find_kw([],Cs,Cs).
find_kw([CC|CCs],[C|Cs],Ys) :-
  to_uppercase_char(C,CC),
  find_kw(CCs,Cs,Ys).
find_kw(CCs,[_C|Cs],Ys) :-
  find_kw(CCs,Cs,Ys).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Terms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test whether a term is ground
my_ground(Term) :-
  copy_term(Term,Copy),
  (Term == Copy ->
   true;
   fail).
   
% my_member_var_term: analogous to my_member, but for terms
my_member_var_term(X,Y) :-
  my_equal_up_to_renaming(X,Y), 
  !,
  X==Y.
my_member_var_term(_X,T) :- 
  var(T),
  !,
  fail.
my_member_var_term(X,C) :- 
  C =.. [_F|As],
  !, 
  my_member_var_term_list(X,As).

my_member_var_term_list(_X,[]) :-
  !,
  fail.
my_member_var_term_list(X,[T|_Ts]) :-
  my_member_var_term(X,T).
my_member_var_term_list(X,[_T|Ts]) :-
  my_member_var_term_list(X,Ts).
      
% my_member_term: analogous to my_member, but for terms
my_member_term(X,T) :- 
  var(T),
  var(X),
  !,
  X=T.
my_member_term(_X,T) :- 
  var(T),
  !,
  fail.
my_member_term(X,X).
my_member_term(X,C) :-
%  \+ atomic(X),
  C =.. [_F|As],
  !, 
  my_member_term_list(X,As).
% my_member_term(X,X) :-
%   !.
% my_member_term(X,C) :- 
%   C =.. [_F|As],
%   !, 
%   my_member_term_list(X,As).

my_member_term_list(_X,[]) :-
  !,
  fail.
my_member_term_list(X,[T|_Ts]) :-
  my_member_term(X,T).
my_member_term_list(X,[_T|Ts]) :-
  my_member_term_list(X,Ts).
      
% Term depth less or equal than a given bound. 
% WARNING: Unused from 2.0
%term_depth_leq(T,D) :- 
%  (number(T) ; atom(T) ; var(T)),
%  !,
%  D>=0.
%term_depth_leq(C,D) :- 
%  C =.. [_F|As],
%  !, 
%  D1 is D-1,
%  term_depth_leq_list(As,D1).
%
%term_depth_leq_list([],_D) :-
%  !.
%term_depth_leq_list([T|Ts],D) :-
%  term_depth_leq(T,D), 
%  term_depth_leq_list(Ts,D).

% Replaces all occurrences of each functor in the list by its corresponding replacement in a term T
replace_functors([],[],T,T).
replace_functors([F|Fs],[RF|RFs],T,RT) :-
  replace_functor(F,RF,T,T1),
  replace_functors(Fs,RFs,T1,RT).

% Replaces all occurrences of functor O by N in a term T
replace_functor(_O,_N,T,T) :- 
  (number(T) ; var(T)),
  !.
replace_functor(O,N,O,N) :- 
  atom(O),
  !.
replace_functor(O,N,C,RC) :- 
  C =.. [F|As],
  !, 
  (F == O -> RF = N ; RF = F),
  replace_functor_list(O,N,As,RAs),
  RC =.. [RF|RAs].

replace_functor_list(_O,_N,[],[]) :-
  !.
replace_functor_list(O,N,[T|Ts],[RT|RTs]) :-
  !, 
  replace_functor(O,N,T,RT), 
  replace_functor_list(O,N,Ts,RTs).


% Replaces the functor of the terms in a list  
replace_functor_term_list([],_RF,[]).
replace_functor_term_list([T|Ts],RF,[RT|RTs]) :-
  T=..[_F|Args],
  RT=..[RF|Args],
  replace_functor_term_list(Ts,RF,RTs).


% Replace occurences of functor Name by NewName in all the rules
% reachable from the give specification: name, predicate, head
replace_functor_dlrules_from(What,WhatObject,Name,NewName) :-
  (
   get_object_dlrules(What,WhatObject,DLs),
   member(DL,DLs),
   replace_functor(Name,NewName,DL,NewDL),
   retract(DL),
   assertz(NewDL),
   fail
   ;
   true
 ).
  
replace_functor_dlrules_from_list(_What,[],_Name,_NewName).
replace_functor_dlrules_from_list(What,[WhatObject|WhatObjects],Name,NewName) :-
   replace_functor_dlrules_from(What,WhatObject,Name,NewName),
   replace_functor_dlrules_from_list(What,WhatObjects,Name,NewName).
  

% Concat a list of atoms
atom_concat_list([A],AtA) :-
  ensure_atom(A,AtA).
atom_concat_list([A,B|C],D) :-
  ensure_atom(A,AtA),
  ensure_atom(B,AtB),
  atom_concat(AtA,AtB,E),
  atom_concat_list([E|C],D).

% Get user predicates in a rule
user_predicates_rule(':-'(B),Preds) :-
  user_predicates_body(B,[],BPreds),
  my_remove_duplicates_sort(BPreds,Preds).
user_predicates_rule(':-'(H,B),Preds) :-
  user_predicates_atom(H,[],Preds1),
  user_predicates_body(B,Preds1,Preds).

user_predicates_body((B,Bs),Predsi,Predso) :-
  user_predicates_literal(B,Predsi,Preds1),
  user_predicates_body(Bs,Preds1,Predso).
user_predicates_body((B;Bs),Predsi,Predso) :-
  user_predicates_body((B,Bs),Predsi,Predso).
user_predicates_body(B,Predsi,Predso) :-
  user_predicates_literal(B,Predsi,Predso).
  
user_predicates_literal(not(A),Predsi,Predso) :-
  user_predicates_atom(A,Predsi,Predso).  
user_predicates_literal(A,Predsi,Predso) :-
  user_predicates_atom(A,Predsi,Predso).  
  
user_predicates_atom(Ag,Predsi,Predso) :-
  Ag=..[count,B|_],
  !,
  user_predicates_body(B,Predsi,Predso).
user_predicates_atom(Ag,Predsi,Predso) :-
  Ag=..[FAg,B,_,_],
  my_aggregate_relation(FAg,3),
  !,
  user_predicates_body(B,Predsi,Predso).
user_predicates_atom(OJ,Predsi,Predso) :-
  OJ=..[OJF,L,R,C],
  my_outer_join_relation(OJF/3),
  !,
  user_predicates_atom(L,Predsi,Preds1),
  user_predicates_atom(R,Preds1,Preds2),
  user_predicates_atom(C,Preds2,Predso).
user_predicates_atom(group_by(A,_B,C),Predsi,Predso) :-
  !,
  user_predicates_body(A,Predsi,Preds1),
  user_predicates_body(C,Preds1,Predso).
user_predicates_atom(top(_N,A),Predsi,Predso) :-
  !,
  user_predicates_body(A,Predsi,Predso).
user_predicates_atom(distinct(A),Predsi,Predso) :-
  !,
  user_predicates_body(A,Predsi,Predso).
user_predicates_atom(distinct(_Vs,A),Predsi,Predso) :-
  !,
  user_predicates_body(A,Predsi,Predso).
user_predicates_atom(A,Preds,Preds) :-
  functor(A,F,_),
  my_builtin_pred(F),
  !.
user_predicates_atom(A,Preds,Preds) :-
  functor(A,F,Ar),
  my_member(F/Ar,Preds),
  !.
user_predicates_atom(A,Predsi,Predso) :-
  functor(A,F,Ar),
  findall(B,(datalog(':-'(H,B),_,_,_,_,_),functor(H,F,Ar)),Bs),
  user_predicates_body_list(Bs,[F/Ar|Predsi],Predso).
  
user_predicates_body_list([],Preds,Preds).
user_predicates_body_list([B|Bs],Predsi,Predso) :-
  user_predicates_body(B,Predsi,Preds1),
  user_predicates_body_list(Bs,Preds1,Predso).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Strings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to_uppercase_char_list(+List,-UppercaseList)
% Converts the input list to uppercase

to_uppercase_char_list([],[]).
to_uppercase_char_list([X|Xs],[U|Cs]) :-
  to_uppercase_char(X,U),
  to_uppercase_char_list(Xs,Cs).

to_uppercase_char(X,U) :-
  [X] >= "a",
  [X] =< "z",
  !,
  [UA] = "A",
  [LA] = "a",
  U is X+UA-LA.
to_uppercase_char(X,X).

to_uppercase(LC,UC) :-
  name(LC,SLC),
  to_uppercase_char_list(SLC,SUC),
  name(UC,SUC).

% to_lowercase_list(+List,-UppercaseList) 
% Converts the input list to lowercase

to_lowercase_list([],[]).
to_lowercase_list([X|Xs],[U|Cs]) :-
  to_lowercase(X,U),
  to_lowercase_list(Xs,Cs).

to_lowercase(X,U) :-
  [X] >= "A",
  [X] =< "Z",
  !,
  [UA] = "A",
  [LA] = "a",
  U is X-UA+LA.
to_lowercase(X,X).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Timing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

display_elapsed_time :-
  store_elapsed_time(display),
  get_elapsed_time(Parsing,Computation,Display,Total),  
  format_timing(Parsing,FParsing), 
  format_timing(Computation,FComputation), 
  format_timing(Display,FDisplay), 
  format_timing(Total,FTotal), 
  timing(Switch),
  (Switch==detailed ->
   write_log_list(['Info: Parsing elapsed time    : ',FParsing,nl]),
   write_log_list(['Info: Computation elapsed time: ',FComputation,nl]),
   write_log_list(['Info: Display elapsed time    : ',FDisplay,nl]),
   write_log_list(['Info: Total elapsed time      : ',FTotal,nl])
   ;
   true),
  (Switch==on ->
   write_log_list(['Info: Total elapsed time: ',FTotal,nl])
   ;
   true).

% Less than 1 second: ms
format_timing(T,FT) :-
  T<1000,
  !,
  atom_concat_list([T,' ms.'],FT).
% Less than 60 seconds: s.ms
format_timing(T,FT) :-
  T<60000,
  !,
  S is floor(T/1000),
  MS is T rem 1000,
  pad_zeroes(S,PS),
  atom_concat_list([PS,'.',MS,' s.'],FT).
% Less than 60 minutes: m:s.ms
format_timing(T,FT) :-
  T<3600000,
  !,
  M is floor(T/60000),
  S is floor((T-M*60000)/1000),
  MS is T rem 1000,
  pad_zeroes(M,PM),
  pad_zeroes(S,PS),
  atom_concat_list([PM,':',PS,'.',MS],FT).
% More than 60 minutes: h:m:s.ms
format_timing(T,FT) :-
  H is floor(T/3600000),
  M is floor((T-H*3600000)/60000),
  S is floor((T-H*3600000-M*60000)/1000),
  MS is T rem 1000,
  pad_zeroes(M,PM),
  pad_zeroes(S,PS),
  atom_concat_list([H,':',PM,':',PS,'.',MS],FT).

pad_zeroes(T,PT) :-
  T<10,
  !,
  number_codes(T,Cs),
  atom_codes(AT,Cs),
  atom_concat('0',AT,PT).
pad_zeroes(T,T).
  

get_elapsed_time(Parsing,Computation,Display,Total) :-
  time(Parsing,Computation,Display),
  Total is round(Parsing+Computation+Display+0.0).
  
% get_computation_time(Computation) :-
%   store_elapsed_time(computation,Computation).
%   
% store_elapsed_time(Class) :-
%   store_elapsed_time(Class,_Time).

% store_elapsed_time(parsing,Parsing) :-
%   retract(time(_,Computation,Display)),
%   update_elapsed_time(Parsing),
%   assertz(time(Parsing,Computation,Display)).
% store_elapsed_time(computation,Computation) :-
%   retract(time(Parsing,_,Display)),
%   update_elapsed_time(Computation),
%   assertz(time(Parsing,Computation,Display)).
% store_elapsed_time(display,Display) :-
%   retract(time(Parsing,Computation,_)),
%   update_elapsed_time(Display),
%   assertz(time(Parsing,Computation,Display)).
  
store_elapsed_time(parsing) :-
  retract(time(_,Computation,Display)),
  update_elapsed_time(Parsing),
  assertz(time(Parsing,Computation,Display)).
store_elapsed_time(computation) :-
  retract(time(Parsing,_,Display)),
  update_elapsed_time(Computation),
  assertz(time(Parsing,Computation,Display)).
store_elapsed_time(display) :-
  retract(time(Parsing,Computation,_)),
  update_elapsed_time(Display),
  assertz(time(Parsing,Computation,Display)).
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellanea
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Maximum of two numbers
my_max(A,B,A) :-
  A>=B,
  !.
my_max(_A,B,B).

% Minimum of two numbers
my_min(A,B,A) :-
  A=<B,
  !.
my_min(_A,B,B).

% Maximum in a list
%my_list_max([X|Xs],M) :-
%  my_list_max(Xs,X,M).

my_list_max([],M,M).
my_list_max([X|Xs],M,Max) :- 
  (X @> M ->
   my_list_max(Xs,X,Max)
   ;
   my_list_max(Xs,M,Max)
  ).

% from
from(N,M,[]) :-
  N>M,
  !.
from(N,M,[N|Ns]) :-
  N1 is N+1,
  from(N1,M,Ns).
  
% Display a list of datalog rules and its number
display_tuples_and_nbr_info(SDLs,ODLs) :-
  (verbose(on) ->
    (development(on) -> 
      length(ODLs,Nbr)
      ; 
      length(SDLs,Nbr)),
    (Nbr==1 -> S =' ' ; S='s '),
    (Nbr==0 -> D = '.' ; D = (':')),
    write_info_log(['',Nbr,' rule',S,'retracted',D]), 
    (development(on) -> 
      display_dlrule_list(ODLs,2)
      ; 
      display_source_dlrule_list(SDLs,2))
   ;
    true).


my_get0_echo(Char) :-
  my_get0(Char),
  (batch(_,_,_) -> 
    atom_codes(A,[Char]),
    write_log(A)
   ;
    true
  ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inserting
insert_into_last_but_one_pos([L],X,[X,L]).
insert_into_last_but_one_pos([L1,L2|Ls],X,[L1|RLs]) :-
  insert_into_last_but_one_pos([L2|Ls],X,RLs).

% Removing one element from a list
%remove_one_element_from_list(X,[X|Xs],Xs).
%remove_one_element_from_list(X,[Y|Xs],[Y|Ys]) :-
%  remove_one_element_from_list(X,Xs,Ys).

% Checks whether its input argument is a list
% my_is_list(+L)
my_is_list([]).
my_is_list([_X|Xs]) :-
  my_is_list(Xs).

my_list_to_list_of_lists([],[]).
my_list_to_list_of_lists([A|As],[[A]|Bs]) :-
  my_list_to_list_of_lists(As,Bs).

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logical
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prolog implementation of negation
my_not(G) :- 
  call(G), 
  !, 
  fail.
my_not(_G).

% Logical disjunction
my_or(true,true,true).
my_or(true,false,true).
my_or(false,true,true).
my_or(false,false,false).

% Uncertainty disjunction
my_u_or(L,R,true) :-
  ((var(L),R==true);(L==true,var(R))),
  !.
my_u_or(L,R,_O) :-
  (var(L);var(R)),
  !.
my_u_or(L,R,O) :-
  my_or(L,R,O).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metapredicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Apply to a list of argument lists
my_apply(_X,[]).
my_apply(X,[L|Ls]) :-
  L = [_H|_T],
  !,
  T =.. [X|L],
  call(T),
  my_apply(X,Ls).
my_apply(X,[Y|Ys]) :-
  !,
  T =.. [X,Y],
  call(T),
  my_apply(X,Ys).

% Apply to exactly one argument (that can be a list)
my_apply_1(_X,[]).
my_apply_1(X,[Y|Ys]) :-
  !,
  T =.. [X,Y],
  call(T),
  my_apply_1(X,Ys).

% zipWith
% +Operator/Predicate +LeftOp +RightOp +List(Operator(LeftOp,RightOp))
my_zipWith(_Z,[],_Bs,[]).
my_zipWith(_Z,[_A|_As],[],[]).
my_zipWith(Z,[A|As],[B|Bs],[P|Ps]) :-
  P=..[Z,A,B],
  my_zipWith(Z,As,Bs,Ps).
   
% unzip
% +List(Operator(LeftOp,RightOp)) +List(LeftOp) +List(RightOp)
my_unzip([],[],[]).
my_unzip([P|Ps],[A|As],[B|Bs]) :-
  P=..[_Z,A,B],
  my_unzip(Ps,As,Bs).
   
% my_univ_list
% +functor +List -List
my_univ_list(_F,[],[]).
my_univ_list(F,[A|As],[B|Bs]) :-
  B=..[F|A],
  my_univ_list(F,As,Bs).
   
% Testing whether the input list contains variables
%vars([]).
%vars([V|Vs]) :- 
%  var(V), 
%  vars(Vs).

% Returns always an atom, just in case its input is a number
ensure_atom(N,A) :-
  (number(N) -> number_codes(N,CL), atom_codes(A,CL); N=A).

% Findall
my_nf_bagof(X,G,Xs) :-
  (bagof(X,G,Xs) -> true ; Xs=[]).

% No-failing setof: Returns empty list
my_nf_setof(X,G,Xs) :-
  (setof(X,G,Xs) -> true ; Xs=[]).

% Unifiable: Tests whether two terms are unifiable
my_unifiable(X,Y) :-
  \+ \+ X=Y.

% Copy term for lists
% copy_term_list([],[]).
% copy_term_list([T|Ts],[CT|CTs]) :-
%   copy_term(T,CT),
%   copy_term_list(Ts,CTs).

% Literals
my_literal(L) :-
  nonvar(L),
  L=..[_F|Args],
  my_atom_list(Args).
  
my_atom_list([]).  
my_atom_list([A|As]) :-
  (var(A);atomic(A)),
  !,
  my_atom_list(As).  
  
  
my_atom(A) :-
  atom(A).  
my_atom(T) :-
  T =.. [F|Args],
  length(Args,L),
  not_builtin(F/L),
  atom(F),
  my_noncompound_terms(Args).

not_builtin(F/L) :-
  F/L \== lj/3,
  F/L \== rj/3,
  F/L \== fj/3,
  F/L \== lj/1,
  F/L \== rj/1,
  F/L \== fj/1,
  F/L \== not/1,
  F/L \== top/2,
  F/L \== distinct/1,
  F/L \== distinct/2,
  F/L \== group_by/3,
  F/L \== avg/3,
  F/L \== avg_distinct/3,
  F/L \== count/3,
  F/L \== count/2,
  F/L \== count_distinct/3,
  F/L \== count_distinct/2,
  F/L \== max/3,
  F/L \== min/3,
  F/L \== sum/3,
  F/L \== sum_distinct/3,
  F/L \== times/3,
  F/L \== times_distinct/3,
  F/L \== (',')/2,
  F/L \== (';')/2.
  
my_noncompound_terms([]).
my_noncompound_terms([Term|Terms]) :-
  my_noncompound_term(Term),
  my_noncompound_terms(Terms).

my_noncompound_term(T) :-
  atomic(T),
  !.
my_noncompound_term(T) :-
  var(T),
  !.
my_noncompound_term('$NULL'(_ID)).
    

my_compound_term(T) :-
  \+ my_noncompound_term(T).
  
%call_list([]).
%call_list([H|T]) :-
%  call(H),
%  call_list(T).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Debugging during development
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%deb([]).
%deb([X|Xs]) :-
%  nl, write(X), deb(Xs).
  
%%%%%%%%%%%%%%%  END des.pl  %%%%%%%%%%%%%%%
