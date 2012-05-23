% basicrules.pl
% This file contains the inference rules needed for the points-to analysis
% using Datalog. These rules will be embedded into the .pl file generated
% from the JavaScript file/extension.

% FIXME: style_check directive not available in Datalog 
%:- style_check(-discontiguous).

:- dynamic
        alloc/2,
        load/3,
        store/3,
        assign/2,
        directHeapStoresTo/3,
        directHeapPointsTo/3,
        actual/3.

% Basic Rules
ptsTo(V,H) :-
        alloc(V,H).
ptsTo(V_1,H) :-
        assign(V_1,V_2),
        ptsTo(V_2,H).

directHeapStoresTo(H_1,F,H_2) :-
        store(V_1,F,V_2),
        ptsTo(V_1,H_1),        
        ptsTo(V_2,H_2).
directHeapPointsTo(H_1,F,H_2) :-        
        directHeapStoresTo(H_1,F,H_2).
ptsTo(V_2,H_2) :-        
        load(V_2,V_1,F),         
        ptsTo(V_1,H_1),        
        heapPtsTo(H_1,F,H_2).
heapPtsTo(H_1,F,H_2) :-        
        directHeapPointsTo(H_1,F,H_2).

% Call graph
calls(I,M) :-        
        actual(I,0,C),        
        ptsTo(C,M).

% Interprocedural assignments
assign(V_1,V_2) :-        
        calls(I,M),        
        formal(M,Z,V_1),        
        actual(I,Z,V_2).
assign(V_2,V_1) :-        
        calls(I,M),        
        methodRet(M,V_1),        
        callRet(I,V_2).

% Prototype handling
heapPtsTo(H_1,F,H_2) :-        
        prototype(H_1,H),        
        heapPtsTo(H,F,H_2).

% Self-made predicates to look for chrome occurrences

% loadExtendedTwo will try to match up objects of the form B.C.D being assigned
% to some variable. A good query in Datalog for this predicate would be:
%
%    loadExtendedTwo(chrome, X, Y).
%
% This will try to find objects like chrome.tabs.detectLanguage
loadExtendedTwo(B, C, D) :-
        load(A, B, C),
        load(F, A, D).

% loadExtendedThree will try to match up objects of the form B.C.D.E being
% assigned to some variable. A good query in Datalog for this predicate would
% be:
%
%    loadExtendedThree(chrome, X, Y, Z).
%
% This will try to find objects like chrome.extension.onListener.addRequest
loadExtendedThree(B, C, D, E) :-
        load(A, B, C),
        load(F, A, D),
        load(G, F, E).


