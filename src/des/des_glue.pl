/*********************************************************/
/*                                                       */
/* DES: Datalog Educational System v.2.7                 */
/*                                                       */
/*    SYSTEM DEPENDENT PREDICATES 2                      */
/*    Tested for SWI-Prolog 5.10.5                       */
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


% Prolog system identification
prolog_system(swi,Version) :-
  current_prolog_flag(version_data,swi(Ma,Mi,P,_)),
  atomic_list_concat(['SWI-Prolog ',Ma,'.',Mi,'.',P],Version).

% 
:- on_signal('SIGINT',_,sigint_signal).
sigint_signal(_) :-
%  throw('$aborted').  
  my_raise_exception(sigint,user_break,[]).
  
% FD constraint library
:- use_module(library(clpfd)).

% File copy
%:- use_module(library(filesex),[copy_file/2]). % Cannot load under MS Windows

% OS interaction via exec/3
:- use_module(library(dialect/sicstus/system),[exec/3]).

% OS identification
% Sets a flag indicating which OS we are running DES on (windows, unix)
:- dynamic(os/1).
:- retractall(os(_OS)),
   ((getenv('COMSPEC',C), exists_file(C)) -> 
      assertz(os(windows)),
      (win_has_menu ->
        des_version(DESVersion),
        prolog_system(_Swi,PrologVersion),
        atomic_list_concat(['DES',DESVersion,' running on ',PrologVersion],WindowTitle),
        window_title(_OWT,WindowTitle)
       ;
        true
      )
     ;
      assertz(os(unixes))).


%%%%%%%% Indexing %%%%%%%%%%%

my_term_hash(F,Hash) :-
  term_hash(F,Hash).	   
	   
%%%%%%% Prolog Debugging %%%%%%%%

my_spy(Goal) :-
  spy(Goal).

my_nospyall :-
  nospyall.

my_nospy(Goal) :-
  nospy(Goal).

%%%%%%% END Prolog Debugging %%%%%%%%


%%%%%%% ODBC Connections %%%%%%%%

% Open an ODBC connection
% Avoid informational ODBC messages: silent(true)
%:- set_prolog_flag(verbose,silent).
my_open_odbc(Connection,Options) :-
%  MyOptions = [open(once),cursor_type(dynamic),silent(true)|Options],
  MyOptions = [open(once),silent(true)|Options],
  (odbc_connect(Connection,Handle,MyOptions) ->
    set_flag(current_db,Connection,(Handle,MyOptions)),
    enable_rdb_datasource,
    my_odbc_get_dbms(DBMS),
    (DBMS == sqlserver -> 
      SQLServerOption = cursor_type(dynamic),
      set_flag(current_db,Connection,(Handle,[SQLServerOption|MyOptions])),
      odbc_set_connection(Handle, SQLServerOption)
     ;
      true
    ),
    write_verb(['Info: ODBC connection ''',Connection,''' successfully opened.',nl])
   ;
    write_log_list(['Error: Opening connection ''',Connection,'''.',nl])
  ).

% Close an ODBC connection
my_close_odbc(Connection) :-
  (retract(current_db(Connection,(Handle,_Options))) ->
    set_default_db,
    odbc_disconnect(Handle),
    disable_rdb_datasource(Connection),
    write_verb(['Info: ODBC connection ''',Connection,''' successfully closed.',nl])
   ;
   write_log_list(['Error: Connection ''',Connection,''' not found.',nl])
  ).
  
  
%%%%%%% ODBC Statement Executions %%%%%%%%

% Execute a SELECT statement returning all the answer tuples
my_odbc_dql_query(SQLstr,Schema,Rows) :-  
  current_db(_Connection,(Handle,_Options)),
  name(SQL,SQLstr),
  findall(Answer,(odbc_query(Handle,SQL,Row,[null('$NULL'(_))]),Row=..[row|Args],Answer=..[answer|Args]),Rows),
  concrete_nulls(Rows),
  my_odbc_get_query_typed_arguments(SQLstr,ColNameTypes),
  Schema=..[answer|ColNameTypes].
% Second (worser) method to get column schema:
%   (odbc_query(Handle,SQL,Row,[null('$NULL'(_)),source(true)]) ->
%     Row=..[_Row|Columns],
%     get_columns_schema(Columns,ColumnsSchema),
%     Schema=..[answer|ColumnsSchema]
%    ;
%     Schema=answer).

% Execute a SELECT statement returning one answer tuple at a time via backtracking
my_odbc_dql_query_fetch_row(SQLstr,Row) :-
  current_db(_Connection,(Handle,_Options)),
  name(SQL,SQLstr),
  odbc_query(Handle,SQL,Row,[null('$NULL'(_))]).
  
% Execute a DML statement returning the number of tuples affected
my_odbc_dml_query(SQLstr,NumberOfRows) :-  
  current_db(_Connection,(Handle,_Options)),
  name(SQL,SQLstr),
  odbc_query(Handle,SQL,affected(NumberOfRows)).
    
% Execute a DDL statement returning nothing
my_odbc_ddl_query(SQLstr) :-  
  current_db(_Connection,(Handle,_Options)),
  name(SQL,SQLstr),
  odbc_query(Handle,SQL).
    
% Closing a query
% my_odbc_dangling_query_close(Message) :-
%   nonvar(Message),
%   Message = error(odbc('S1000',0,M),_),
%   atom_concat(_,'Connection is busy',M1),
%   atom_concat(M1,_,M),
%   !,
%   current_db(Connection,(Handle,Options)),
%   odbc_disconnect(Handle),
%   odbc_connect(Connection,NHandle,[open(once)|Options]),
%   set_flag(current_db,Connection,(NHandle,Options)).
% my_odbc_dangling_query_close(_Message).

my_odbc_dangling_query_close :-
  current_db(Connection,(Handle,Options)),
  !,
  odbc_disconnect(Handle),
  odbc_connect(Connection,NHandle,Options),
  set_flag(current_db,Connection,(NHandle,Options)).
my_odbc_dangling_query_close.


%%%%%%% ODBC Error Display %%%%%%%%

my_display_odbc_error(error(odbc(State,Native,M),_)) :-
  write_log_list(['Error: ODBC State (',State,') Code (',Native,'): ',M,nl]).

  
%%%%%%% ODBC Metadata %%%%%%%%

% Get table names
my_odbc_get_tablenames(TableNames) :-
  current_db(_Connection,(Handle,_Options)),
  findall(TableName,odbc_current_table(Handle,TableName),TableNames).

% Ask whether a given table does exist
my_odbc_exists_table(TableName) :-
  current_db(_Connection,(Handle,_Options)),
  odbc_current_table(Handle,TableName).

% Get view names
my_odbc_get_viewnames(ViewNames) :-
  current_db(_Connection,(Handle,_Options)),
  findall(ViewName,odbc:odbc_tables(Handle,row(_ConnectionDetails,_X,ViewName,'VIEW',_Y)),ViewNames).
% T = row('C:\\Documents and Settings\\Fernando\\Escritorio\\bd1', '$null$', 'Consulta6', 'VIEW', '$null$').

% Ask whether a given view does exist
my_odbc_exists_view(ViewName) :-
  current_db(_Connection,(Handle,_Options)),
  odbc:odbc_tables(Handle,row(_ConnectionDetails,_X,ViewName,'VIEW',_Y)).
  
% Get both table and view names
my_odbc_get_table_and_view_names(TableNames) :-
  current_db(_Connection,(Handle,_Options)),
  findall(TableName,
          (odbc:odbc_tables(Handle,row(_ConnectionDetails,_X,TableName,Type,_Y)),(Type='TABLE';Type='VIEW')),
          TableNames).
  
% Get table arity
my_odbc_get_table_arity(TableName,Arity) :-
  current_db(_Connection,(Handle,_Options)),
%   current_output(CurrentOut),
%   open_null_stream(Out),
  % Avoid annoying ODBC useless messages. Does not work!
%  with_output_to(Out,odbc_current_table(Handle,TableName,arity(Arity))),
  odbc_current_table(Handle,TableName,arity(Arity)).
%   close(Out),
%   set_output(CurrentOut).
  
% Get table/arity list
my_odbc_get_table_arity_list(TableNameArityList) :-
  current_db(_Connection,(Handle,_Options)),
  findall(TableName/Arity,odbc_current_table(Handle,TableName,arity(Arity)),TableNameArityList).

% Get table column names. It is expected to get them in the same order they were defined via the create SQL statement
my_odbc_get_colnames(TableName,ColNames) :-
  current_db(_Connection,(Handle,_Options)),
  findall(ColName,odbc_table_column(Handle,TableName,ColName),ColNames).

% The following allows SWI to detect predicate current_stream as needed for building the executable  
my_void_odbc_table_column(Handle,TableName,ColName) :-
  odbc_table_column(Handle,TableName,ColName).  
  
% Get the list of ColumnName:Type for a table/view  
my_odbc_get_table_typed_arguments(TableName,ColNameTypes) :-
  current_db(_Connection,(Handle,_Options)),
  findall(ColName:Type,my_odbc_get_type(Handle,TableName,ColName,Type),ColNameTypes).
  
% Get the type in the form: typename(length)
my_odbc_get_type(Handle,TableName,ColName,Type) :-
  odbc_table_column(Handle,TableName,ColName,type_name(TypeName)),
  odbc_table_column(Handle,TableName,ColName,length(TypeLength)),
  Type=..[TypeName,TypeLength].

% The following allows SWI to detect predicate current_stream as needed for building the executable  
my_void_odbc_table_column(Handle,TableName,ColName,type_name(TypeName)) :-
  odbc_table_column(Handle,TableName,ColName,type_name(TypeName)).  

% Get the list of type names for a table/view  
my_odbc_get_table_typenames(TableName,TypeNames) :-
  current_db(_Connection,(Handle,_Options)),
  findall(TypeName,odbc_table_column(Handle,TableName,_ColName,type_name(TypeName)),TypeNames).

% Get the query schema (a list of ColName:TypeName). 
% First method: Create a view, get its schema, and drop the view.
my_odbc_get_query_typed_arguments(SQLstr,ColNameTypes) :-  
  TableName='des__temporary',
  my_odbc_drop_view_if_exists(TableName),
  name(TableName,TableNameStr),
  concat_lists(["CREATE VIEW ",TableNameStr," AS ",SQLstr],CreateStr),
  catch(
   (
	  my_odbc_ddl_query(CreateStr),
	  my_odbc_get_table_typed_arguments(TableName,ColNameTypes),
	  my_odbc_drop_view_if_exists(TableName)
	 ),
	 _,
	 ColNameTypes=[]
	    ).
	    
	    
% Drop a view if it exists
my_odbc_drop_view_if_exists(TableName) :-
  (my_odbc_exists_view(TableName) ->
    my_odbc_drop_view(TableName)
   ;
    true).
      
% Drop a view
my_odbc_drop_view(TableName) :-	    
  name(TableName,TableNameStr),
  my_odbc_get_dbms(DBMS),
  (DBMS == access ->
    concat_lists(["DROP TABLE ",TableNameStr],DropStr)
   ;
    concat_lists(["DROP VIEW ",TableNameStr],DropStr)
  ),
  my_odbc_ddl_query(DropStr).


% Get the query schema
get_columns_schema([],[]).
get_columns_schema([column(Table,Column,_Value)|Columns],[TableDotColumn|ColumnsSchema]) :-
atomic_list_concat([Table,'.',Column],TableDotColumn),
%  atom_concat(Table,'.',TableDot),
%  atom_concat(TableDot,Column,TableDotColumn),
  get_columns_schema(Columns,ColumnsSchema).
    
  
%%%%%%% ODBC. Others %%%%%%%%

% Get the DBMS for the current connection
my_odbc_get_dbms(DBMS) :-
  current_db(_Connection,(Handle,_Options)),
  odbc_get_connection(Handle,dbms_name(DBMSName)),
  get_dbms_from_DSN(DBMSName,DBMS),
  !.
  
get_dbms_from_DSN(DSN,access) :-
  is_DBMS(DSN,'ACCESS').
get_dbms_from_DSN(DSN,mysql) :-
  is_DBMS(DSN,'MYSQL').
get_dbms_from_DSN(DSN,oracle) :-
  is_DBMS(DSN,'ORACLE').
get_dbms_from_DSN(DSN,sqlserver) :-
  is_DBMS(DSN,'SQL SERVER').
get_dbms_from_DSN(DSN,DSN).
  
is_DBMS(DSN,Text) :-
  to_uppercase(DSN,UDSN),
  sub_atom(UDSN,_,_,_,Text).
  
%%%%%%% End ODBC  %%%%%%%%

  
%%%%%%%% FD Constraint Solving %%%%%%%% 

% FD constraints
my_fd_domain(List,Min,Max) :-
  List ins Min..Max.
    
% FD enumeration
my_fd_labeling(Vars) :-
  labeling([ff],Vars).
    
my_fd_labeling(LabOptions,Vars) :-
  labeling(LabOptions,Vars).
    
% Optimization
my_fd_maximize(my_fd_labeling(LabOptions,Vars),Cost) :-
  once(labeling([max(Cost)|LabOptions], Vars)).
  
% All different
my_fd_all_different(L) :-
  all_different(L).
    
% Current lower bound of the domain of a variable
my_fd_min(X,M) :-
  fd_inf(X,M).
    
% FD Equality
% Avoid integer type checking
my_fd_eq(X,Y) :-
  X = Y.
  
% Testing whether the argument is a var (FD or not)
my_var_or_fd_var(X) :-
  var(X).
  
% FD equivalence operator
% my_fd_equiv(L,R) :-
%   L #<==> R.
:- op(760, yfx, #<=>). 
L #<=> R :-
   L #<==> R.

      
%%%%%%%% END FD Constraint Solving %%%%%%%% 

% false predicate: Always fails
false :-
  fail.

% Current opened streams
my_current_stream(St) :-
  my_nf_bagof(OSt,X^Y^current_stream(X,Y,OSt),OSts),
  my_member_chk(St,OSts), 
  !.

% The following allows SWI to detect predicate current_stream as needed for building the executable  
my_void_current_stream(X,Y,OSt) :- 
  current_stream(X,Y,OSt).

% Skip end-of-line char
my_skip_line.

% Executing operating system commands
% my_shell(C,S) :-
%   name(C,SC),
%   ((shell(SC,0), S=0);                                             %Unix
%    (concat_lists(["cmd.exe /C ",SC],SCC), shell(SCC,0), S=0);      %Windows NT/XP/Vista/7
%    (concat_lists(["command.exe /C ",SC],SCC), shell(SCC,0), S=0);  %Windows 98
%    S=1),
%   !.
% Executing operating system commands
% my_shell(Command,Exit_code) :-
%   (os(windows) ->
%     %% look up cmd.exe in PATH
%     my_Windows_which('cmd.exe',CMD),
%     %% Get the list of arguments from Command
%     get_cmd_line_args(Command,Args),
%     %% Create process and pass its stdout to a pipe
%     process_create(CMD, ['/C'|Args],
%                    [stdin(null), 
%                     stderr(pipe(Stderr)),
%                     stdout(pipe(Stdout)),
%                     process(Process)])
%    ;
%     getenv('SHELL',Shell),
%     process_create(Shell, ['-c'|[Command]],
%                    [stdin(null),
%                     stderr(pipe(Stderr)),
%                     stdout(pipe(Stdout)),
%                     process(Process)]
%                    )
%   ),
%   %% Read from the pipes until EOF and then wait
%   %% for the process to exit.
%   repeat,
%      read_line_to_codes(Stdout, Line),
%      ( Line == end_of_file ->
%        close(Stdout)
%      ; otherwise ->
%        forall(member(C,Line),put_code(C)),
%        nl,
%        fail
%      ),
%   repeat,
%      read_line_to_codes(Stderr, ErrLine),
%      ( ErrLine == end_of_file ->
%        close(Stderr)
%      ; otherwise ->
%        forall(member(ErrC,ErrLine),put_code(ErrC)),
%        nl,
%        fail
%      ),
%   !,
%   process_wait(Process, exit(Exit_code)).
my_shell(Command,Exit_code) :-
  (os(windows) ->
    %% Create process and pass their streams to pipes
    (exists_file('cmd.exe') ->
      true
     ;
      shell('cmd /c copy %COMSPEC% .',_S)
%      getenv('COMSPEC',COMSPEC), % Cannot load filesex
%      copy_file(COMSPEC,'.')
    ),
    atom_concat('cmd /c ',Command,Shell),
    exec(Shell,
         [null, 
          pipe(Stdout),
          pipe(Stderr)],
         Process),
	  %% Read from the pipes until EOF and then wait
	  %% for the process to exit.
	  repeat,
	     read_line_to_codes(Stdout, Line),
	     ( Line == end_of_file ->
	       close(Stdout)
	     ; otherwise ->
	       forall(member(C,Line),
	              (put_code(C),
	               write_only_to_log([C]))),
	       nl_log,
	       fail
	     ),
% 	  current_input(UserIn),
% 	  repeat,
% 	     read_line_to_codes(UserIn,InLine),
% 	     ( InLine == end_of_file ->
% 	       close(Stdin)
% 	     ; otherwise ->
% 	       forall(member(C,InLine),put_code(Stdin,C)),
% 	       nl,
% 	       fail
% 	     ),
	  repeat,
	     read_line_to_codes(Stderr, ErrLine),
	     ( ErrLine == end_of_file ->
	       close(Stderr)
	     ; otherwise ->
	       forall(member(ErrC,ErrLine),
	              (put_code(ErrC),
	               write_only_to_log([ErrC]))),
	       nl,
	       fail
	     ),
	  !,
	  process_wait(Process, exit(Exit_code))
	 ;
	  shell(Command,Exit_code)
	).
  
get_cmd_line_args(Command,Args) :-
  atom_codes(Command,SCommand),
  phrase(cmd_args(Args),SCommand),
  !.
  
cmd_args([file(Arg)|Args]) -->
  cmd_separator_star,
  cmd_arg(Arg),
  cmd_separator,
  cmd_args(Args).    
cmd_args([file(Arg)]) -->
  cmd_arg(Arg),
  cmd_separator_star.
  
cmd_separator_star -->
  my_blanks_star.
  
cmd_separator -->
  my_blanks.
  
cmd_arg(Arg) -->
  """",
  cmd_id(UQArg),
  """",
  {!,
   Arg=UQArg}.
%   concat_atom(['"',UQArg,'"'],Arg)}.
cmd_arg(Arg) -->
  cmd_id(Arg).
  
cmd_id(Arg) -->
  my_non_double_quote_chars(SArg),
  {atom_codes(Arg,SArg)}.
  
my_non_double_quote_chars([C]) -->
  my_non_double_quote_char(C).
my_non_double_quote_chars([C|Cs]) -->
  my_non_double_quote_char(C),
  my_non_double_quote_chars(Cs).
  
my_non_double_quote_char(C) -->
  [C],
  {[DQ]="""",
   C\==DQ}.
  
    
% Looks for FileName in the Windows semi-colon-separated list of paths DisjunctivePath,
% returning only the first occurrence, if any, otherwise fails

% Why does not work this?
% my_Windows_which(FileName,AbsoluteFileName) :-
%   file_alias_path(path,P),
%   concat_atom([P,'/',FileName],AbsoluteFileName),
%   exists_file(AbsoluteFileName),
%   !.

my_Windows_which(FileName,AbsoluteFileName) :-
  getenv('PATH',DisjunctivePath),
  extract_paths(DisjunctivePath,Paths),
  my_member(Path,Paths),
  concat_atom([Path,'\\',FileName],AbsoluteFileName),
  exists_file(AbsoluteFileName),
  !.
  
extract_paths(Path,Paths) :-
  atom_codes(Path,SPaths),
  extract_str_paths(SPaths,Paths).
  
extract_str_paths([],[]) :-
  !.
extract_str_paths(SPaths,[Path|Paths]) :-
  [SC]=";",
  append(SPath,[SC|TSPaths],SPaths),
  !,
  atom_codes(Path,SPath),
  extract_str_paths(TSPaths,Paths).
extract_str_paths(SPath,[Path]) :-
  B="\\",
  append(LSPath,B,SPath),
  !,
  atom_codes(Path,LSPath).
extract_str_paths(SPath,[Path]) :-
  atom_codes(Path,SPath).
  
% Date and time
my_datetime((Y,M,D,H,Mi,S)) :-
  get_time(TS),
  stamp_date_time(TS,date(Y,M,D,H,Mi,Se,_,_,_),local),
  S is integer(Se).
  
% Sorting a list, keeping duplicates
my_sort(List,Orderedlist) :-
  msort(List,Orderedlist).

% Sorting a list, removing duplicates
my_remove_duplicates_sort(List,Orderedlist) :-
  sort(List,Orderedlist).

% Removing a file
my_remove_file(FileName) :-
  delete_file(FileName).
  
% Changing the current directory
my_change_directory(Path) :-
  chdir(Path).

% Testing whether exists the given directory
my_directory_exists(Path) :-
  exists_directory(Path).

% Testing whether exists the given file
my_file_exists(File) :-
  exists_file(File).

% Getting the current directory
my_working_directory(Path) :-
  absolute_file_name(., Path).

% Getting the ordered list of files from the given path
my_directory_files(Path, Files) :-
  absolute_file_name(., WorkingPath),
  absolute_file_name(Path, AbsolutePath),
  chdir(AbsolutePath),
  expand_file_name('*', FNs),
  (setof(FN, AFN^(my_member(FN,FNs),my_absolute_filename(FN,AFN),my_is_file(AFN)), Files) ->
   true ; Files = []),
  chdir(WorkingPath).

% Getting the ordered list of directories from the given path
my_directory_directories(Path, Directories) :-
  absolute_file_name(., WorkingPath),
  absolute_file_name(Path, AbsolutePath),
  chdir(AbsolutePath),
  expand_file_name('*', FNs),
  (setof(FN, AFN^(my_member(FN,FNs),my_absolute_filename(FN,AFN),my_is_directory(AFN)), Directories) ->
   true ; Directories = []),
  chdir(WorkingPath).

% Testing whether the input is a file
my_is_file(File) :-
  exists_file(File).

% Testing whether the input is a directory
my_is_directory(Path) :-
  exists_directory(Path).

% Getting the absolute filename for a file
my_absolute_filename(Path, AbsolutePath) :-
  absolute_file_name(Path, AbsolutePath).

% Extracting the absolute path and file from an absolute file name
my_dir_file(AFN,AP,FN) :-
  file_directory_name(AFN,AP),
%  atomic_list_concat([AP,'/',FN],AFN). % FN cannot be non-ground
   atom_concat(AP,'/',PS),
   atom_concat(PS,FN,AFN).

% Gets a byte from the handle (Edinburgh version)
my_get0(HIn,C) :-
  get0(HIn,C).

% Gets a byte from the current handle (Edinburgh version)
my_get0(C) :-
  get0(C).

% Reading terms along with variable names and its scope in line numbers
% TODO: Get max line numbers
my_read(Term, VariableNames, (Min,Max)) :-
  current_input(CurrentStream),
  stream_property(CurrentStream, position(CurrentPos)),
  stream_position_data(line_count,CurrentPos,Min),
  read_term(Term, [variable_names(VariableNames),term_position(NewPos)]),
  stream_position_data(line_count,NewPos,Max).
  
my_read_message(Fid,error(syntax_error(ErrorTxt),file(_,Line,Column,_))) :-
  filet(F,Fid),
  write_log_list(['Error: Syntax error: ',ErrorTxt,nl,'       File: ',F,nl,'       Line: ',Line, ', Column: ',Column,nl]).  

% Timing: Resetting and displaying the elapsed time
:- dynamic(time/1).

reset_elapsed_time :-
  get_time(T),
  retractall(time(_)),
  retractall(time(_,_,_)),
  assertz(time(_,_,_)),
  assertz(time(T)).

update_elapsed_time(Elapsed) :-
   retract(time(T1)),
   get_time(T2),
   assertz(time(T2)),
   Elapsed is integer(1000*(T2-T1)).

% Consulting Prolog programs
my_consult(X) :-
  ensure_loaded(X).
  
%%%%%%%%%%%%%%%  END des_glue_BETA.pl  %%%%%%%%%%%%%%%
