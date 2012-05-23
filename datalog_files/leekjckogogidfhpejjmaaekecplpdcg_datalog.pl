assign('mgDownloadHelper_R_0','__objectInit__').
load('t0','mgDownloadHelper_R_0','getFileName').
store('mgDownloadHelper_R_0','getFileName','lambda_R_1').
ptsTo('lambda_R_1','d_lambda_R_1').
heapPtsTo('d_lambda_R_1','prototype','p_lambda_R_1').
prototype('p_lambda_R_1','h_FP').
methodRet('d_lambda_R_1','lambda_R_1').
formal('d_lambda_R_1','1','doc_R_1').
load('t1','mgDownloadHelper_R_0','onLoad').
store('mgDownloadHelper_R_0','onLoad','lambda_R_2').
ptsTo('lambda_R_2','d_lambda_R_2').
heapPtsTo('d_lambda_R_2','prototype','p_lambda_R_2').
prototype('p_lambda_R_2','h_FP').
methodRet('d_lambda_R_2','lambda_R_2').
load('t3','mgDownloadHelper_R_0','onLoad_R_?').
assign('t2','t4').
load('t6','localStorage_R_?','init').
load('t8','localStorage_R_?','init').
assign('t5','t10').
load('t12','localStorage_R_?','exver').
assign('t11','t13').
load('t14','localStorage_R_?','exver').
store('localStorage_R_?','exver','1.2').
load('t15','localStorage_R_?','exver').
store('localStorage_R_?','exver','1.2').
load('t16','localStorage_R_?','init').
store('localStorage_R_?','init','false').
load('t17','doc_R_1','getElementById_R_?').
actual('1','1','downloadlink').
callRet('1','downloadlink').
assign('downloadlink_R_1','t18').
load('t19','downloadlink_R_1','firstChild').
load('t20','t19','href').
assign('href_R_1','t20').
load('t21','href_R_1','lastIndexOf_R_?').
actual('2','1','/').
callRet('2','/').
assign('p_R_1','t22').
assign('t24','1').
assign('t23','t25').
methodRet('d_lambda_R_1','').
load('t26','href_R_1','substring_R_?').
actual('3','1','t27').
callRet('3','t27').
assign('fileName_R_1','t28').
load('t29','fileName_R_1','replace_R_?').
actual('4','1','%20').
callRet('4','%20').
actual('4','2',' ').
callRet('4',' ').
assign('fileName_R_1','t30').
methodRet('d_lambda_R_1','fileName_R_1').
assign('doc_R_2','document').
load('t31','doc_R_2','getElementById_R_?').
actual('5','1','downloadcounter').
callRet('5','downloadcounter').
assign('downloadcounter_R_2','t32').
assign('t33','downloadcounter_R_2').
load('t34','downloadcounter_R_2','style').
load('t35','t34','display').
store('t34','display','none').
load('t36','doc_R_2','getElementById').
actual('6','1','downloadlink').
callRet('6','downloadlink').
assign('downloadlink_R_2','t37').
assign('t38','downloadlink_R_2').
load('t39','downloadlink_R_2','hidden').
store('downloadlink_R_2','hidden','true').
load('t41','downloadlink_R_2','firstChild').
assign('t40','t41').
load('t42','downloadlink_R_2','firstChild').
load('t43','t42','style').
load('t44','t43','display').
store('t43','display','none').
assign('folderPath_R_2','').
load('t45','doc_R_2','destFile').
store('doc_R_2','destFile','null').
load('t46','doc_R_2','createElement_R_?').
actual('7','1','div').
callRet('7','div').
assign('div_R_2','t47').
load('t48','div_R_2','style').
load('t49','t48','width').
store('t48','width','290').
load('t50','div_R_2','style').
load('t51','t50','marginLeft').
store('t50','marginLeft','""18px""').
load('t52','div_R_2','style').
load('t53','t52','marginTop').
store('t52','marginTop','""20px""').
load('t54','doc_R_2','createElement').
actual('8','1','div').
callRet('8','div').
assign('confirmText_R_2','t55').
load('t56','confirmText_R_2','innerHTML').
store('confirmText_R_2','innerHTML','').
load('t57','confirmText_R_2','style').
load('t58','t57','color').
store('t57','color','#576a45').
load('t59','confirmText_R_2','style').
load('t60','t59','backgroundColor').
store('t59','backgroundColor','#c4ff8f').
load('t61','confirmText_R_2','style').
load('t62','t61','WebkitBorderRadius').
store('t61','WebkitBorderRadius','""5px""').
load('t63','confirmText_R_2','style').
load('t64','t63','padding').
store('t63','padding','""5px""').
load('t65','confirmText_R_2','style').
load('t66','t65','paddingTop').
store('t65','paddingTop','""2px""').
load('t68','div_R_2','appendChild_R_?').
actual('9','1','confirmText_R_2').
callRet('9','confirmText_R_2').
assign('t67','t69').
load('t71','downloadcounter_R_2','parentNode').
load('t72','t71','appendChild').
actual('10','1','div_R_2').
callRet('10','div_R_2').
assign('t70','t73').
actual('11','1','lambda_R_3').
callRet('11','lambda_R_3').
actual('11','2','1000').
callRet('11','1000').
assign('ina_R_2','t74').
ptsTo('lambda_R_3','d_lambda_R_3').
heapPtsTo('d_lambda_R_3','prototype','p_lambda_R_3').
prototype('p_lambda_R_3','h_FP').
methodRet('d_lambda_R_3','lambda_R_3').
load('t75','doc_R_2','getElementById_R_?').
actual('12','1','countdown').
callRet('12','countdown').
assign('countdown_R_3','t76').
load('t77','confirmText_R_2','innerHTML').
load('t78','countdown_R_3','innerHTML').
store('confirmText_R_2','innerHTML','t80').
load('t82','countdown_R_3','innerHTML').
assign('t81','t83').
actual('13','1','lambda_R_4').
callRet('13','lambda_R_4').
actual('13','2','1500').
callRet('13','1500').
assign('inaa_R_3','t84').
ptsTo('lambda_R_4','d_lambda_R_4').
heapPtsTo('d_lambda_R_4','prototype','p_lambda_R_4').
prototype('p_lambda_R_4','h_FP').
methodRet('d_lambda_R_4','lambda_R_4').
actual('14','1','ina_R_2').
callRet('14','ina_R_2').
assign('t85','t86').
load('t87','doc_R_2','getElementById_R_?').
actual('15','1','downloadlink').
callRet('15','downloadlink').
assign('downloadlink_R_4','t88').
load('t89','document','location').
load('t90','downloadlink_R_4','firstChild').
load('t91','t90','href').
store('document','location','t91').
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



%%% chrome.pl %%%
%
% Last Updated: May 20, 2012
%
% A hard-coded model of the Google Chrome API to be used by datalog.py. 
% datalog.py will load this file and embed it to the .pl file generated
% by the JavaScript files. This file is used to simulate the existence
% of the Chrome API in the environment.
%
% Change Logs
% -    Implemented all chrome API methods.
% -    Implemented all chrome API events.
% -    Updated to reflect latest chrome API changes.


% chrome object
ptsTo('chrome', 'd_chrome').
heapPtsTo('d_chrome', 'prototype', 'p_chrome').

% chrome.bookmarks object
heapPtsTo('d_chrome', 'bookmarks', 'd_chrome_bookmarks').

% chrome.bookmarks.* methods
heapPtsTo('d_chrome_bookmarks', 'create', 'd_chrome_bookmarks_create').
heapPtsTo('d_chrome_bookmarks_create', 'prototype', 'p_chrome_bookmarks_create').
prototype('p_chrome_bookmarks_create', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'get', 'd_chrome_bookmarks_get').
heapPtsTo('d_chrome_bookmarks_get', 'prototype', 'p_chrome_bookmarks_get').
prototype('p_chrome_bookmarks_get', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'getChildren', 'd_chrome_bookmarks_getChildren').
heapPtsTo('d_chrome_bookmarks_getChildren', 'prototype', 'p_chrome_bookmarks_getChildren').
prototype('p_chrome_bookmarks_getChildren', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'getRecent', 'd_chrome_bookmarks_getRecent').
heapPtsTo('d_chrome_bookmarks_getRecent', 'prototype', 'p_chrome_bookmarks_getRecent').
prototype('p_chrome_bookmarks_getRecent', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'getSubTree', 'd_chrome_bookmarks_getSubTree').
heapPtsTo('d_chrome_bookmarks_getSubTree', 'prototype', 'p_chrome_bookmarks_getSubTree').
prototype('p_chrome_bookmarks_getSubTree', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'getTree', 'd_chrome_bookmarks_getTree').
heapPtsTo('d_chrome_bookmarks_getTree', 'prototype', 'p_chrome_bookmarks_getTree').
prototype('p_chrome_bookmarks_getTree', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'move', 'd_chrome_bookmarks_move').
heapPtsTo('d_chrome_bookmarks_move', 'prototype', 'p_chrome_bookmarks_move').
prototype('p_chrome_bookmarks_move', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'remove', 'd_chrome_bookmarks_remove').
heapPtsTo('d_chrome_bookmarks_remove', 'prototype', 'p_chrome_bookmarks_remove').
prototype('p_chrome_bookmarks_remove', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'removeTree', 'd_chrome_bookmarks_removeTree').
heapPtsTo('d_chrome_bookmarks_removeTree', 'prototype', 'p_chrome_bookmarks_removeTree').
prototype('p_chrome_bookmarks_removeTree', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'search', 'd_chrome_bookmarks_search').
heapPtsTo('d_chrome_bookmarks_search', 'prototype', 'p_chrome_bookmarks_search').
prototype('p_chrome_bookmarks_search', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'update', 'd_chrome_bookmarks_update').
heapPtsTo('d_chrome_bookmarks_update', 'prototype', 'p_chrome_bookmarks_update').
prototype('p_chrome_bookmarks_update', 'h_FP').

% chrome.bookmarks.* events
heapPtsTo('d_chrome_bookmarks', 'onChildrenReordered', 'd_chrome_bookmarks_onChildrenReordered').
heapPtsTo('d_chrome_bookmarks_onChildrenReordered', 'addListener', 'd_chrome_bookmarks_onChildrenReordered_addListener').
heapPtsTo('d_chrome_bookmarks_onChildrenReordered_addListener', 'prototype', 'p_chrome_bookmarks_onChildrenReordered_addListener').
prototype('p_chrome_bookmarks_onChildrenReordered_addListener', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'onCreated', 'd_chrome_bookmarks_onCreated').
heapPtsTo('d_chrome_bookmarks_onCreated', 'addListener', 'd_chrome_bookmarks_onCreated_addListener').
heapPtsTo('d_chrome_bookmarks_onCreated_addListener', 'prototype', 'p_chrome_bookmarks_onCreated_addListener').
prototype('p_chrome_bookmarks_onCreated_addListener', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'onImportBegan', 'd_chrome_bookmarks_onImportBegan').
heapPtsTo('d_chrome_bookmarks_onImportBegan', 'addListener', 'd_chrome_bookmarks_onImportBegan_addListener').
heapPtsTo('d_chrome_bookmarks_onImportBegan_addListener', 'prototype', 'p_chrome_bookmarks_onImportBegan_addListener').
prototype('p_chrome_bookmarks_onImportBegan_addListener', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'onImportEnded', 'd_chrome_bookmarks_onImportEnded').
heapPtsTo('d_chrome_bookmarks_onImportEnded', 'addListener', 'd_chrome_bookmarks_onImportEnded_addListener').
heapPtsTo('d_chrome_bookmarks_onImportEnded_addListener', 'prototype', 'p_chrome_bookmarks_onImportEnded_addListener').
prototype('p_chrome_bookmarks_onImportEnded_addListener', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'onMoved', 'd_chrome_bookmarks_onMoved').
heapPtsTo('d_chrome_bookmarks_onMoved', 'addListener', 'd_chrome_bookmarks_onMoved_addListener').
heapPtsTo('d_chrome_bookmarks_onMoved_addListener', 'prototype', 'p_chrome_bookmarks_onMoved_addListener').
prototype('p_chrome_bookmarks_onMoved_addListener', 'h_FP').
heapPtsTo('d_chrome_bookmarks', 'onRemoved', 'd_chrome_bookmarks_onRemoved').
heapPtsTo('d_chrome_bookmarks_onRemoved', 'addListener', 'd_chrome_bookmarks_onRemoved_addListener').
heapPtsTo('d_chrome_bookmarks_onRemoved_addListener', 'prototype', 'p_chrome_bookmarks_onRemoved_addListener').
prototype('p_chrome_bookmarks_onRemoved_addListener', 'h_FP').

% chrome.browserAction object
heapPtsTo('d_chrome', 'browserAction', 'd_chrome_browserAction').

% chrome.browserAction.* methods
heapPtsTo('d_chrome_browserAction', 'setBadgeBackgroundColor', 'd_chrome_browserAction_setBadgeBackgroundColor').
heapPtsTo('d_chrome_browserAction_setBadgeBackgroundColor', 'prototype', 'p_chrome_browserAction_setBadgeBackgroundColor').
prototype('p_chrome_browserAction_setBadgeBackgroundColor', 'h_FP').
heapPtsTo('d_chrome_browserAction', 'setBadgeText', 'd_chrome_browserAction_setBadgeText').
heapPtsTo('d_chrome_browserAction_setBadgeText', 'prototype', 'p_chrome_browserAction_setBadgeText').
prototype('p_chrome_browserAction_setBadgeText', 'h_FP').
heapPtsTo('d_chrome_browserAction', 'setIcon', 'd_chrome_browserAction_setIcon').
heapPtsTo('d_chrome_browserAction_setIcon', 'prototype', 'p_chrome_browserAction_setIcon').
prototype('p_chrome_browserAction_setIcon', 'h_FP').
heapPtsTo('d_chrome_browserAction', 'setPopup', 'd_chrome_browserAction_setPopup').
heapPtsTo('d_chrome_browserAction_setPopup', 'prototype', 'p_chrome_browserAction_setPopup').
prototype('p_chrome_browserAction_setPopup', 'h_FP').
heapPtsTo('d_chrome_browserAction', 'setTitle', 'd_chrome_browserAction_setTitle').
heapPtsTo('d_chrome_browserAction_setTitle', 'prototype', 'p_chrome_browserAction_setTitle').
prototype('p_chrome_browserAction_setTitle', 'h_FP').

% chrome.browserAction.* events
heapPtsTo('d_chrome_browserAction', 'onClicked', 'd_chrome_browserAction_onClicked').
heapPtsTo('d_chrome_browserAction_onClicked', 'addListener', 'd_chrome_browserAction_onClicked_addListener').
heapPtsTo('d_chrome_browserAction_onClicked_addListener', 'prototype', 'p_chrome_browserAction_onClicked_addListener').
prototype('p_chrome_browserAction_onClicked_addListener', 'h_FP').

% chrome.browsingData object
% Note: Doesn't have any events.
heapPtsTo('d_chrome', 'browsingData', 'd_chrome_browsingData').

% chrome.browsingData.* methods
heapPtsTo('d_chrome_browsingData', 'remove', 'd_chrome_browsingData_remove').
heapPtsTo('d_chrome_browsingData_remove', 'prototype', 'p_chrome_browsingData_remove').
prototype('p_chrome_browsingData_remove', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeAppcache', 'd_chrome_browsingData_removeAppcache').
heapPtsTo('d_chrome_browsingData_removeAppcache', 'prototype', 'p_chrome_browsingData_removeAppcache').
prototype('p_chrome_browsingData_removeAppcache', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeCache', 'd_chrome_browsingData_removeCache').
heapPtsTo('d_chrome_browsingData_removeCache', 'prototype', 'p_chrome_browsingData_removeCache').
prototype('p_chrome_browsingData_removeCache', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeCookies', 'd_chrome_browsingData_removeCookies').
heapPtsTo('d_chrome_browsingData_removeCookies', 'prototype', 'p_chrome_browsingData_removeCookies').
prototype('p_chrome_browsingData_removeCookies', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeDownloads', 'd_chrome_browsingData_removeDownloads').
heapPtsTo('d_chrome_browsingData_removeDownloads', 'prototype', 'p_chrome_browsingData_removeDownloads').
prototype('p_chrome_browsingData_removeDownloads', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeFileSystems', 'd_chrome_browsingData_removeFileSystems').
heapPtsTo('d_chrome_browsingData_removeFileSystems', 'prototype', 'p_chrome_browsingData_removeFileSystems').
prototype('p_chrome_browsingData_removeFileSystems', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeFormData', 'd_chrome_browsingData_removeFormData').
heapPtsTo('d_chrome_browsingData_removeFormData', 'prototype', 'p_chrome_browsingData_removeFormData').
prototype('p_chrome_browsingData_removeFormData', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeHistory', 'd_chrome_browsingData_removeHistory').
heapPtsTo('d_chrome_browsingData_removeHistory', 'prototype', 'p_chrome_browsingData_removeHistory').
prototype('p_chrome_browsingData_removeHistory', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeIndexedDB', 'd_chrome_browsingData_removeIndexedDB').
heapPtsTo('d_chrome_browsingData_removeIndexedDB', 'prototype', 'p_chrome_browsingData_removeIndexedDB').
prototype('p_chrome_browsingData_removeIndexedDB', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeLocalStorage', 'd_chrome_browsingData_removeLocalStorage').
heapPtsTo('d_chrome_browsingData_removeLocalStorage', 'prototype', 'p_chrome_browsingData_removeLocalStorage').
prototype('p_chrome_browsingData_removeLocalStorage', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removePasswords', 'd_chrome_browsingData_removePasswords').
heapPtsTo('d_chrome_browsingData_removePasswords', 'prototype', 'p_chrome_browsingData_removePasswords').
prototype('p_chrome_browsingData_removePasswords', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removePluginData', 'd_chrome_browsingData_removePluginData').
heapPtsTo('d_chrome_browsingData_removePluginData', 'prototype', 'p_chrome_browsingData_removePluginData').
prototype('p_chrome_browsingData_removePluginData', 'h_FP').
heapPtsTo('d_chrome_browsingData', 'removeWebSQL', 'd_chrome_browsingData_removeWebSQL').
heapPtsTo('d_chrome_browsingData_removeWebSQL', 'prototype', 'p_chrome_browsingData_removeWebSQL').
prototype('p_chrome_browsingData_removeWebSQL', 'h_FP').

% chrome.contentSettings object
% Note: Doesn't have any methods or events
heapPtsTo('d_chrome', 'contentSettings', 'd_chrome_contentSettings').

% chrome.contextMenus object
heapPtsTo('d_chrome', 'contextMenus', 'd_chrome_contextMenus').

% chrome.contextMenus.* methods
heapPtsTo('d_chrome_contextMenus', 'create', 'd_chrome_contextMenus_create').
heapPtsTo('d_chrome_contextMenus_create', 'prototype', 'p_chrome_contextMenus_create').
prototype('p_chrome_contextMenus_create', 'h_FP').
heapPtsTo('d_chrome_contextMenus', 'remove', 'd_chrome_contextMenus_remove').
heapPtsTo('d_chrome_contextMenus_remove', 'prototype', 'p_chrome_contextMenus_remove').
prototype('p_chrome_contextMenus_remove', 'h_FP').
heapPtsTo('d_chrome_contextMenus', 'removeAll', 'd_chrome_contextMenus_removeAll').
heapPtsTo('d_chrome_contextMenus_removeAll', 'prototype', 'p_chrome_contextMenus_removeAll').
prototype('p_chrome_contextMenus_removeAll', 'h_FP').
heapPtsTo('d_chrome_contextMenus', 'update', 'd_chrome_contextMenus_update').
heapPtsTo('d_chrome_contextMenus_update', 'prototype', 'p_chrome_contextMenus_update').
prototype('p_chrome_contextMenus_update', 'h_FP').

% chrome.cookies object
heapPtsTo('d_chrome', 'cookies', 'd_chrome_cookies').

% chrome.cookies.* methods
heapPtsTo('d_chrome_cookies', 'get', 'd_chrome_cookies_get').
heapPtsTo('d_chrome_cookies_get', 'prototype', 'p_chrome_cookies_get').
prototype('p_chrome_cookies_get', 'h_FP').
heapPtsTo('d_chrome_cookies', 'getAll', 'd_chrome_cookies_getAll').
heapPtsTo('d_chrome_cookies_getAll', 'prototype', 'p_chrome_cookies_getAll').
prototype('p_chrome_cookies_getAll', 'h_FP').
heapPtsTo('d_chrome_cookies', 'getAllCookieStores', 'd_chrome_cookies_getAllCookieStores').
heapPtsTo('d_chrome_cookies_getAllCookieStores', 'prototype', 'p_chrome_cookies_getAllCookieStores').
prototype('p_chrome_cookies_getAllCookieStores', 'h_FP').
heapPtsTo('d_chrome_cookies', 'remove', 'd_chrome_cookies_remove').
heapPtsTo('d_chrome_cookies_remove', 'prototype', 'p_chrome_cookies_remove').
prototype('p_chrome_cookies_remove', 'h_FP').
heapPtsTo('d_chrome_cookies', 'set', 'd_chrome_cookies_set').
heapPtsTo('d_chrome_cookies_set', 'prototype', 'p_chrome_cookies_set').
prototype('p_chrome_cookies_set', 'h_FP').

% chrome.cookies.* events
heapPtsTo('d_chrome_cookies', 'onChanged', 'd_chrome_cookies_onChanged').
heapPtsTo('d_chrome_cookies_onChanged', 'addListener', 'd_chrome_cookies_onChanged_addListener').
heapPtsTo('d_chrome_cookies_onChanged_addListener', 'prototype', 'p_chrome_cookies_onChanged_addListener').
prototype('p_chrome_cookies_onChanged_addListener', 'h_FP').

% chrome.debugger object
heapPtsTo('d_chrome', 'debugger', 'd_chrome_debugger').

% chrome.debugger.* methods
heapPtsTo('d_chrome_debugger', 'attach', 'd_chrome_debugger_attach').
heapPtsTo('d_chrome_debugger_attach', 'prototype', 'p_chrome_debugger_attach').
prototype('p_chrome_debugger_attach', 'h_FP').
heapPtsTo('d_chrome_debugger', 'detach', 'd_chrome_debugger_detach').
heapPtsTo('d_chrome_debugger_detach', 'prototype', 'p_chrome_debugger_detach').
prototype('p_chrome_debugger_detach', 'h_FP').
heapPtsTo('d_chrome_debugger', 'sendCommand', 'd_chrome_debugger_sendCommand').
heapPtsTo('d_chrome_debugger_sendCommand', 'prototype', 'p_chrome_debugger_sendCommand').
prototype('p_chrome_debugger_sendCommand', 'h_FP').

% chrome.debugger.* events
heapPtsTo('d_chrome_debugger', 'onDetach', 'd_chrome_debugger_onDetach').
heapPtsTo('d_chrome_debugger_onDetach', 'addListener', 'd_chrome_debugger_onDetach_addListener').
heapPtsTo('d_chrome_debugger_onDetach_addListener', 'prototype', 'p_chrome_debugger_onDetach_addListener').
prototype('p_chrome_debugger_onDetach_addListener', 'h_FP').
heapPtsTo('d_chrome_debugger', 'onEvent', 'd_chrome_debugger_onEvent').
heapPtsTo('d_chrome_debugger_onEvent', 'addListener', 'd_chrome_debugger_onEvent_addListener').
heapPtsTo('d_chrome_debugger_onEvent_addListener', 'prototype', 'p_chrome_debugger_onEvent_addListener').
prototype('p_chrome_debugger_onEvent_addListener', 'h_FP').

% chrome.extension object
heapPtsTo('d_chrome', 'extension', 'd_chrome_extension').

% chrome.extension.* methods
heapPtsTo('d_chrome_extension', 'connect', 'd_chrome_extension_connect').
heapPtsTo('d_chrome_extension_connect', 'prototype', 'p_chrome_extension_connect').
prototype('p_chrome_extension_connect', 'h_FP').
heapPtsTo('d_chrome_extension', 'getBackgroundPage', 'd_chrome_extension_getBackgroundPage').
heapPtsTo('d_chrome_extension_getBackgroundPage', 'prototype', 'p_chrome_extension_getBackgroundPage').
prototype('p_chrome_extension_getBackgroundPage', 'h_FP').
heapPtsTo('d_chrome_extension', 'getURL', 'd_chrome_extension_getURL').
heapPtsTo('d_chrome_extension_getURL', 'prototype', 'p_chrome_extension_getURL').
prototype('p_chrome_extension_getURL', 'h_FP').
heapPtsTo('d_chrome_extension', 'getViews', 'd_chrome_extension_getViews').
heapPtsTo('d_chrome_extension_getViews', 'prototype', 'p_chrome_extension_getViews').
prototype('p_chrome_extension_getViews', 'h_FP').
heapPtsTo('d_chrome_extension', 'isAllowedFileSchemeAccess', 'd_chrome_extension_isAllowedFileSchemeAccess').
heapPtsTo('d_chrome_extension_isAllowedFileSchemeAccess', 'prototype', 'p_chrome_extension_isAllowedFileSchemeAccess').
prototype('p_chrome_extension_isAllowedFileSchemeAccess', 'h_FP').
heapPtsTo('d_chrome_extension', 'isAllowedIncognitoAccess', 'd_chrome_extension_isAllowedIncognitoAccess').
heapPtsTo('d_chrome_extension_isAllowedIncognitoAccess', 'prototype', 'p_chrome_extension_isAllowedIncognitoAccess').
prototype('p_chrome_extension_isAllowedIncognitoAccess', 'h_FP').
heapPtsTo('d_chrome_extension', 'sendRequest', 'd_chrome_extension_sendRequest').
heapPtsTo('d_chrome_extension_sendRequest', 'prototype', 'p_chrome_extension_sendRequest').
prototype('p_chrome_extension_sendRequest', 'h_FP').
heapPtsTo('d_chrome_extension', 'setUpdateUrlData', 'd_chrome_extension_setUpdateUrlData').
heapPtsTo('d_chrome_extension_setUpdateUrlData', 'prototype', 'p_chrome_extension_setUpdateUrlData').
prototype('p_chrome_extension_setUpdateUrlData', 'h_FP').

% chrome.extension.* events
heapPtsTo('d_chrome_extension', 'onConnect', 'd_chrome_extension_onConnect').
heapPtsTo('d_chrome_extension_onConnect', 'addListener', 'd_chrome_extension_onConnect_addListener').
heapPtsTo('d_chrome_extension_onConnect_addListener', 'prototype', 'p_chrome_extension_onConnect_addListener').
prototype('p_chrome_extension_onConnect_addListener', 'h_FP').
heapPtsTo('d_chrome_extension', 'onConnectExternal', 'd_chrome_extension_onConnectExternal').
heapPtsTo('d_chrome_extension_onConnectExternal', 'addListener', 'd_chrome_extension_onConnectExternal_addListener').
heapPtsTo('d_chrome_extension_onConnectExternal_addListener', 'prototype', 'p_chrome_extension_onConnectExternal_addListener').
prototype('p_chrome_extension_onConnectExternal_addListener', 'h_FP').
heapPtsTo('d_chrome_extension', 'onRequest', 'd_chrome_extension_onRequest').
heapPtsTo('d_chrome_extension_onRequest', 'addListener', 'd_chrome_extension_onRequest_addListener').
heapPtsTo('d_chrome_extension_onRequest_addListener', 'prototype', 'p_chrome_extension_onRequest_addListener').
prototype('p_chrome_extension_onRequest_addListener', 'h_FP').
heapPtsTo('d_chrome_extension', 'onRequestExternal', 'd_chrome_extension_onRequestExternal').
heapPtsTo('d_chrome_extension_onRequestExternal', 'addListener', 'd_chrome_extension_onRequestExternal_addListener').
heapPtsTo('d_chrome_extension_onRequestExternal_addListener', 'prototype', 'p_chrome_extension_onRequestExternal_addListener').
prototype('p_chrome_extension_onRequestExternal_addListener', 'h_FP').

% chrome.fileBrowserHandler object
% Note: Doesn't have any methods
heapPtsTo('d_chrome', 'fileBrowserHandler', 'd_chrome_fileBrowserHandler').

% chrome.fileBrowserHandler.* events
heapPtsTo('d_chrome_fileBrowserHandler', 'onExecute', 'd_chrome_fileBrowserHandler_onExecute').
heapPtsTo('d_chrome_fileBrowserHandler_onExecute', 'addListener', 'd_chrome_fileBrowserHandler_onExecute_addListener').
heapPtsTo('d_chrome_fileBrowserHandler_onExecute_addListener', 'prototype', 'p_chrome_fileBrowserHandler_onExecute_addListener').
prototype('p_chrome_fileBrowserHandler_onExecute_addListener', 'h_FP').

% chrome.history object
heapPtsTo('d_chrome', 'history', 'd_chrome_history').

% chrome.history.* methods
heapPtsTo('d_chrome_history', 'addUrl', 'd_chrome_history_addUrl').
heapPtsTo('d_chrome_history_addUrl', 'prototype', 'p_chrome_history_addUrl').
prototype('p_chrome_history_addUrl', 'h_FP').
heapPtsTo('d_chrome_history', 'deleteAll', 'd_chrome_history_deleteAll').
heapPtsTo('d_chrome_history_deleteAll', 'prototype', 'p_chrome_history_deleteAll').
prototype('p_chrome_history_deleteAll', 'h_FP').
heapPtsTo('d_chrome_history', 'deleteRange', 'd_chrome_history_deleteRange').
heapPtsTo('d_chrome_history_deleteRange', 'prototype', 'p_chrome_history_deleteRange').
prototype('p_chrome_history_deleteRange', 'h_FP').
heapPtsTo('d_chrome_history', 'deleteUrl', 'd_chrome_history_deleteUrl').
heapPtsTo('d_chrome_history_deleteUrl', 'prototype', 'p_chrome_history_deleteUrl').
prototype('p_chrome_history_deleteUrl', 'h_FP').
heapPtsTo('d_chrome_history', 'getVisits', 'd_chrome_history_getVisits').
heapPtsTo('d_chrome_history_getVisits', 'prototype', 'p_chrome_history_getVisits').
prototype('p_chrome_history_getVisits', 'h_FP').
heapPtsTo('d_chrome_history', 'search', 'd_chrome_history_search').
heapPtsTo('d_chrome_history_search', 'prototype', 'p_chrome_history_search').
prototype('p_chrome_history_search', 'h_FP').

% chrome.history.* events
heapPtsTo('d_chrome_history', 'onVisitRemoved', 'd_chrome_history_onVisitRemoved').
heapPtsTo('d_chrome_history_onVisitRemoved', 'addListener', 'd_chrome_history_onVisitRemoved_addListener').
heapPtsTo('d_chrome_history_onVisitRemoved_addListener', 'prototype', 'p_chrome_history_onVisitRemoved_addListener').
prototype('p_chrome_history_onVisitRemoved_addListener', 'h_FP').
heapPtsTo('d_chrome_history', 'onVisited', 'd_chrome_history_onVisited').
heapPtsTo('d_chrome_history_onVisited', 'addListener', 'd_chrome_history_onVisited_addListener').
heapPtsTo('d_chrome_history_onVisited_addListener', 'prototype', 'p_chrome_history_onVisited_addListener').
prototype('p_chrome_history_onVisited_addListener', 'h_FP').

% chrome.i18n object
% Note: Doesn't have any events
heapPtsTo('d_chrome', 'i18n', 'd_chrome_i18n').

% chrome.i18n.* methods
heapPtsTo('d_chrome_i18n', 'getAcceptLanguages', 'd_chrome_i18n_getAcceptLanguages').
heapPtsTo('d_chrome_i18n_getAcceptLanguages', 'prototype', 'p_chrome_i18n_getAcceptLanguages').
prototype('p_chrome_i18n_getAcceptLanguages', 'h_FP').
heapPtsTo('d_chrome_i18n', 'getMessage', 'd_chrome_i18n_getMessage').
heapPtsTo('d_chrome_i18n_getMessage', 'prototype', 'p_chrome_i18n_getMessage').
prototype('p_chrome_i18n_getMessage', 'h_FP').

% chrome.idle object
heapPtsTo('d_chrome', 'idle', 'd_chrome_idle').

% chrome.idle.* methods
heapPtsTo('d_chrome_idle', 'queryState', 'd_chrome_idle_queryState').
heapPtsTo('d_chrome_idle_queryState', 'prototype', 'p_chrome_idle_queryState').
prototype('p_chrome_idle_queryState', 'h_FP').

% chrome.idle.* events
heapPtsTo('d_chrome_idle', 'onStateChanged', 'd_chrome_idle_onStateChanged').
heapPtsTo('d_chrome_idle_onStateChanged', 'addListener', 'd_chrome_idle_onStateChanged_addListener').
heapPtsTo('d_chrome_idle_onStateChanged_addListener', 'prototype', 'p_chrome_idle_onStateChanged_addListener').
prototype('p_chrome_idle_onStateChanged_addListener', 'h_FP').

% chrome.management object
heapPtsTo('d_chrome', 'management', 'd_chrome_management').

% chrome.management.* methods
heapPtsTo('d_chrome_management', 'get', 'd_chrome_management_get').
heapPtsTo('d_chrome_management_get', 'prototype', 'p_chrome_management_get').
prototype('p_chrome_management_get', 'h_FP').
heapPtsTo('d_chrome_management', 'getAll', 'd_chrome_management_getAll').
heapPtsTo('d_chrome_management_getAll', 'prototype', 'p_chrome_management_getAll').
prototype('p_chrome_management_getAll', 'h_FP').
heapPtsTo('d_chrome_management', 'getPermissionWarningsById', 'd_chrome_management_getPermissionWarningsById').
heapPtsTo('d_chrome_management_getPermissionWarningsById', 'prototype', 'p_chrome_management_getPermissionWarningsById').
prototype('p_chrome_management_getPermissionWarningsById', 'h_FP').
heapPtsTo('d_chrome_management', 'getPermissionWarningsByManifest', 'd_chrome_management_getPermissionWarningsByManifest').
heapPtsTo('d_chrome_management_getPermissionWarningsByManifest', 'prototype', 'p_chrome_management_getPermissionWarningsByManifest').
prototype('p_chrome_management_getPermissionWarningsByManifest', 'h_FP').
heapPtsTo('d_chrome_management', 'launchApp', 'd_chrome_management_launchApp').
heapPtsTo('d_chrome_management_launchApp', 'prototype', 'p_chrome_management_launchApp').
prototype('p_chrome_management_launchApp', 'h_FP').
heapPtsTo('d_chrome_management', 'setEnabled', 'd_chrome_management_setEnabled').
heapPtsTo('d_chrome_management_setEnabled', 'prototype', 'p_chrome_management_setEnabled').
prototype('p_chrome_management_setEnabled', 'h_FP').
heapPtsTo('d_chrome_management', 'uninstall', 'd_chrome_management_uninstall').
heapPtsTo('d_chrome_management_uninstall', 'prototype', 'p_chrome_management_uninstall').
prototype('p_chrome_management_uninstall', 'h_FP').

% chrome.management.* events
heapPtsTo('d_chrome_management', 'onDisabled', 'd_chrome_management_onDisabled').
heapPtsTo('d_chrome_management_onDisabled', 'addListener', 'd_chrome_management_onDisabled_addListener').
heapPtsTo('d_chrome_management_onDisabled_addListener', 'prototype', 'p_chrome_management_onDisabled_addListener').
prototype('p_chrome_management_onDisabled_addListener', 'h_FP').
heapPtsTo('d_chrome_management', 'onEnabled', 'd_chrome_management_onEnabled').
heapPtsTo('d_chrome_management_onEnabled', 'addListener', 'd_chrome_management_onEnabled_addListener').
heapPtsTo('d_chrome_management_onEnabled_addListener', 'prototype', 'p_chrome_management_onEnabled_addListener').
prototype('p_chrome_management_onEnabled_addListener', 'h_FP').
heapPtsTo('d_chrome_management', 'onInstalled', 'd_chrome_management_onInstalled').
heapPtsTo('d_chrome_management_onInstalled', 'addListener', 'd_chrome_management_onInstalled_addListener').
heapPtsTo('d_chrome_management_onInstalled_addListener', 'prototype', 'p_chrome_management_onInstalled_addListener').
prototype('p_chrome_management_onInstalled_addListener', 'h_FP').
heapPtsTo('d_chrome_management', 'onUninstalled', 'd_chrome_management_onUninstalled').
heapPtsTo('d_chrome_management_onUninstalled', 'addListener', 'd_chrome_management_onUninstalled_addListener').
heapPtsTo('d_chrome_management_onUninstalled_addListener', 'prototype', 'p_chrome_management_onUninstalled_addListener').
prototype('p_chrome_management_onUninstalled_addListener', 'h_FP').

% chrome.omnibox object
heapPtsTo('d_chrome', 'omnibox', 'd_chrome_omnibox').

% chrome.omnibox.* methods
heapPtsTo('d_chrome_omnibox', 'setDefaultSuggestion', 'd_chrome_omnibox_setDefaultSuggestion').
heapPtsTo('d_chrome_omnibox_setDefaultSuggestion', 'prototype', 'p_chrome_omnibox_setDefaultSuggestion').
prototype('p_chrome_omnibox_setDefaultSuggestion', 'h_FP').

% chrome.omnibox.* events
heapPtsTo('d_chrome_omnibox', 'onInputCancelled', 'd_chrome_omnibox_onInputCancelled').
heapPtsTo('d_chrome_omnibox_onInputCancelled', 'addListener', 'd_chrome_omnibox_onInputCancelled_addListener').
heapPtsTo('d_chrome_omnibox_onInputCancelled_addListener', 'prototype', 'p_chrome_omnibox_onInputCancelled_addListener').
prototype('p_chrome_omnibox_onInputCancelled_addListener', 'h_FP').
heapPtsTo('d_chrome_omnibox', 'onInputChanged', 'd_chrome_omnibox_onInputChanged').
heapPtsTo('d_chrome_omnibox_onInputChanged', 'addListener', 'd_chrome_omnibox_onInputChanged_addListener').
heapPtsTo('d_chrome_omnibox_onInputChanged_addListener', 'prototype', 'p_chrome_omnibox_onInputChanged_addListener').
prototype('p_chrome_omnibox_onInputChanged_addListener', 'h_FP').
heapPtsTo('d_chrome_omnibox', 'onInputEntered', 'd_chrome_omnibox_onInputEntered').
heapPtsTo('d_chrome_omnibox_onInputEntered', 'addListener', 'd_chrome_omnibox_onInputEntered_addListener').
heapPtsTo('d_chrome_omnibox_onInputEntered_addListener', 'prototype', 'p_chrome_omnibox_onInputEntered_addListener').
prototype('p_chrome_omnibox_onInputEntered_addListener', 'h_FP').
heapPtsTo('d_chrome_omnibox', 'onInputStarted', 'd_chrome_omnibox_onInputStarted').
heapPtsTo('d_chrome_omnibox_onInputStarted', 'addListener', 'd_chrome_omnibox_onInputStarted_addListener').
heapPtsTo('d_chrome_omnibox_onInputStarted_addListener', 'prototype', 'p_chrome_omnibox_onInputStarted_addListener').
prototype('p_chrome_omnibox_onInputStarted_addListener', 'h_FP').

% chrome.pageAction object
heapPtsTo('d_chrome', 'pageAction', 'd_chrome_pageAction').

% chrome.pageAction.* methods
heapPtsTo('d_chrome_pageAction', 'hide', 'd_chrome_pageAction_hide').
heapPtsTo('d_chrome_pageAction_hide', 'prototype', 'p_chrome_pageAction_hide').
prototype('p_chrome_pageAction_hide', 'h_FP').
heapPtsTo('d_chrome_pageAction', 'setIcon', 'd_chrome_pageAction_setIcon').
heapPtsTo('d_chrome_pageAction_setIcon', 'prototype', 'p_chrome_pageAction_setIcon').
prototype('p_chrome_pageAction_setIcon', 'h_FP').
heapPtsTo('d_chrome_pageAction', 'setPopup', 'd_chrome_pageAction_setPopup').
heapPtsTo('d_chrome_pageAction_setPopup', 'prototype', 'p_chrome_pageAction_setPopup').
prototype('p_chrome_pageAction_setPopup', 'h_FP').
heapPtsTo('d_chrome_pageAction', 'setTitle', 'd_chrome_pageAction_setTitle').
heapPtsTo('d_chrome_pageAction_setTitle', 'prototype', 'p_chrome_pageAction_setTitle').
prototype('p_chrome_pageAction_setTitle', 'h_FP').
heapPtsTo('d_chrome_pageAction', 'show', 'd_chrome_pageAction_show').
heapPtsTo('d_chrome_pageAction_show', 'prototype', 'p_chrome_pageAction_show').
prototype('p_chrome_pageAction_show', 'h_FP').

% chrome.pageAction.* events
heapPtsTo('d_chrome_pageAction', 'onClicked', 'd_chrome_pageAction_onClicked').
heapPtsTo('d_chrome_pageAction_onClicked', 'addListener', 'd_chrome_pageAction_onClicked_addListener').
heapPtsTo('d_chrome_pageAction_onClicked_addListener', 'prototype', 'p_chrome_pageAction_onClicked_addListener').
prototype('p_chrome_pageAction_onClicked_addListener', 'h_FP').

% chrome.pageCapture object
% Note: Doesn't have any events
heapPtsTo('d_chrome', 'pageCapture', 'd_chrome_pageCapture').

% chrome.pageCapture.* methods
heapPtsTo('d_chrome_pageCapture', 'saveAsMHTML', 'd_chrome_pageCapture_saveAsMHTML').
heapPtsTo('d_chrome_pageCapture_saveAsMHTML', 'prototype', 'p_chrome_pageCapture_saveAsMHTML').
prototype('p_chrome_pageCapture_saveAsMHTML', 'h_FP').

% chrome.permissions object
heapPtsTo('d_chrome', 'permissions', 'd_chrome_permissions').

% chrome.permissions.* method
heapPtsTo('d_chrome_permissions', 'contains', 'd_chrome_permissions_contains').
heapPtsTo('d_chrome_permissions_contains', 'prototype', 'p_chrome_permissions_contains').
prototype('p_chrome_permissions_contains', 'h_FP').
heapPtsTo('d_chrome_permissions', 'getAll', 'd_chrome_permissions_getAll').
heapPtsTo('d_chrome_permissions_getAll', 'prototype', 'p_chrome_permissions_getAll').
prototype('p_chrome_permissions_getAll', 'h_FP').
heapPtsTo('d_chrome_permissions', 'remove', 'd_chrome_permissions_remove').
heapPtsTo('d_chrome_permissions_remove', 'prototype', 'p_chrome_permissions_remove').
prototype('p_chrome_permissions_remove', 'h_FP').
heapPtsTo('d_chrome_permissions', 'request', 'd_chrome_permissions_request').
heapPtsTo('d_chrome_permissions_request', 'prototype', 'p_chrome_permissions_request').
prototype('p_chrome_permissions_request', 'h_FP').

% chrome.permissions.* events
heapPtsTo('d_chrome_permissions', 'onAdded', 'd_chrome_permissions_onAdded').
heapPtsTo('d_chrome_permissions_onAdded', 'addListener', 'd_chrome_permissions_onAdded_addListener').
heapPtsTo('d_chrome_permissions_onAdded_addListener', 'prototype', 'p_chrome_permissions_onAdded_addListener').
prototype('p_chrome_permissions_onAdded_addListener', 'h_FP').
heapPtsTo('d_chrome_permissions', 'onRemoved', 'd_chrome_permissions_onRemoved').
heapPtsTo('d_chrome_permissions_onRemoved', 'addListener', 'd_chrome_permissions_onRemoved_addListener').
heapPtsTo('d_chrome_permissions_onRemoved_addListener', 'prototype', 'p_chrome_permissions_onRemoved_addListener').
prototype('p_chrome_permissions_onRemoved_addListener', 'h_FP').

% chrome.privacy object
% Note: Doesn't have any methods or events.
heapPtsTo('d_chrome', 'privacy', 'd_chrome_privacy').

% chrome.proxy object
% Note: Doesn't have any methods. 
heapPtsTo('d_chrome', 'proxy', 'd_chrome_proxy').

% chrome.proxy.* events
heapPtsTo('d_chrome_proxy', 'onProxyError', 'd_chrome_proxy_onProxyError').
heapPtsTo('d_chrome_proxy_onProxyError', 'addListener', 'd_chrome_proxy_onProxyError_addListener').
heapPtsTo('d_chrome_proxy_onProxyError_addListener', 'prototype', 'p_chrome_proxy_onProxyError_addListener').
prototype('p_chrome_proxy_onProxyError_addListener', 'h_FP').

% chrome.tabs object
heapPtsTo('d_chrome', 'tabs', 'd_chrome_tabs').

% chrome.tabs.* methods 
heapPtsTo('d_chrome_tabs', 'captureVisibleTab', 'd_chrome_tabs_captureVisibleTab').
heapPtsTo('d_chrome_tabs_captureVisibleTab', 'prototype', 'p_chrome_tabs_captureVisibleTab').
prototype('p_chrome_tabs_captureVisibleTab', 'h_FP').
heapPtsTo('d_chrome_tabs', 'connect', 'd_chrome_tabs_connect').
heapPtsTo('d_chrome_tabs_connect', 'prototype', 'p_chrome_tabs_connect').
prototype('p_chrome_tabs_connect', 'h_FP').
heapPtsTo('d_chrome_tabs', 'create', 'd_chrome_tabs_create').
heapPtsTo('d_chrome_tabs_create', 'prototype', 'p_chrome_tabs_create').
prototype('p_chrome_tabs_create', 'h_FP').
heapPtsTo('d_chrome_tabs', 'detectLanguage', 'd_chrome_tabs_detectLanguage').
heapPtsTo('d_chrome_tabs_detectLanguage', 'prototype', 'p_chrome_tabs_detectLanguage').
prototype('p_chrome_tabs_detectLanguage', 'h_FP').
heapPtsTo('d_chrome_tabs', 'executeScript', 'd_chrome_tabs_executeScript').
heapPtsTo('d_chrome_tabs_executeScript', 'prototype', 'p_chrome_tabs_executeScript').
prototype('p_chrome_tabs_executeScript', 'h_FP').
heapPtsTo('d_chrome_tabs', 'get', 'd_chrome_tabs_get').
heapPtsTo('d_chrome_tabs_get', 'prototype', 'p_chrome_tabs_get').
prototype('p_chrome_tabs_get', 'h_FP').
heapPtsTo('d_chrome_tabs', 'getCurrent', 'd_chrome_tabs_getCurrent').
heapPtsTo('d_chrome_tabs_getCurrent', 'prototype', 'p_chrome_tabs_getCurrent').
prototype('p_chrome_tabs_getCurrent', 'h_FP').
heapPtsTo('d_chrome_tabs', 'highlight', 'd_chrome_tabs_highlight').
heapPtsTo('d_chrome_tabs_highlight', 'prototype', 'p_chrome_tabs_highlight').
prototype('p_chrome_tabs_highlight', 'h_FP').
heapPtsTo('d_chrome_tabs', 'insertCSS', 'd_chrome_tabs_insertCSS').
heapPtsTo('d_chrome_tabs_insertCSS', 'prototype', 'p_chrome_tabs_insertCSS').
prototype('p_chrome_tabs_insertCSS', 'h_FP').
heapPtsTo('d_chrome_tabs', 'move', 'd_chrome_tabs_move').
heapPtsTo('d_chrome_tabs_move', 'prototype', 'p_chrome_tabs_move').
prototype('p_chrome_tabs_move', 'h_FP').
heapPtsTo('d_chrome_tabs', 'query', 'd_chrome_tabs_query').
heapPtsTo('d_chrome_tabs_query', 'prototype', 'p_chrome_tabs_query').
prototype('p_chrome_tabs_query', 'h_FP').
heapPtsTo('d_chrome_tabs', 'reload', 'd_chrome_tabs_reload').
heapPtsTo('d_chrome_tabs_reload', 'prototype', 'p_chrome_tabs_reload').
prototype('p_chrome_tabs_reload', 'h_FP').
heapPtsTo('d_chrome_tabs', 'remove', 'd_chrome_tabs_remove').
heapPtsTo('d_chrome_tabs_remove', 'prototype', 'p_chrome_tabs_remove').
prototype('p_chrome_tabs_remove', 'h_FP').
heapPtsTo('d_chrome_tabs', 'sendRequest', 'd_chrome_tabs_sendRequest').
heapPtsTo('d_chrome_tabs_sendRequest', 'prototype', 'p_chrome_tabs_sendRequest').
prototype('p_chrome_tabs_sendRequest', 'h_FP').
heapPtsTo('d_chrome_tabs', 'update', 'd_chrome_tabs_update').
heapPtsTo('d_chrome_tabs_update', 'prototype', 'p_chrome_tabs_update').
prototype('p_chrome_tabs_update', 'h_FP').

% chrome.tabs.* events
heapPtsTo('d_chrome_tabs', 'onActivated', 'd_chrome_tabs_onActivated').
heapPtsTo('d_chrome_tabs_onActivated', 'addListener', 'd_chrome_tabs_onActivated_addListener').
heapPtsTo('d_chrome_tabs_onActivated_addListener', 'prototype', 'p_chrome_tabs_onActivated_addListener').
prototype('p_chrome_tabs_onActivated_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onAttached', 'd_chrome_tabs_onAttached').
heapPtsTo('d_chrome_tabs_onAttached', 'addListener', 'd_chrome_tabs_onAttached_addListener').
heapPtsTo('d_chrome_tabs_onAttached_addListener', 'prototype', 'p_chrome_tabs_onAttached_addListener').
prototype('p_chrome_tabs_onAttached_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onCreated', 'd_chrome_tabs_onCreated').
heapPtsTo('d_chrome_tabs_onCreated', 'addListener', 'd_chrome_tabs_onCreated_addListener').
heapPtsTo('d_chrome_tabs_onCreated_addListener', 'prototype', 'p_chrome_tabs_onCreated_addListener').
prototype('p_chrome_tabs_onCreated_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onDetached', 'd_chrome_tabs_onDetached').
heapPtsTo('d_chrome_tabs_onDetached', 'addListener', 'd_chrome_tabs_onDetached_addListener').
heapPtsTo('d_chrome_tabs_onDetached_addListener', 'prototype', 'p_chrome_tabs_onDetached_addListener').
prototype('p_chrome_tabs_onDetached_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onHighlighted', 'd_chrome_tabs_onHighlighted').
heapPtsTo('d_chrome_tabs_onHighlighted', 'addListener', 'd_chrome_tabs_onHighlighted_addListener').
heapPtsTo('d_chrome_tabs_onHighlighted_addListener', 'prototype', 'p_chrome_tabs_onHighlighted_addListener').
prototype('p_chrome_tabs_onHighlighted_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onMoved', 'd_chrome_tabs_onMoved').
heapPtsTo('d_chrome_tabs_onMoved', 'addListener', 'd_chrome_tabs_onMoved_addListener').
heapPtsTo('d_chrome_tabs_onMoved_addListener', 'prototype', 'p_chrome_tabs_onMoved_addListener').
prototype('p_chrome_tabs_onMoved_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onRemoved', 'd_chrome_tabs_onRemoved').
heapPtsTo('d_chrome_tabs_onRemoved', 'addListener', 'd_chrome_tabs_onRemoved_addListener').
heapPtsTo('d_chrome_tabs_onRemoved_addListener', 'prototype', 'p_chrome_tabs_onRemoved_addListener').
prototype('p_chrome_tabs_onRemoved_addListener', 'h_FP').
heapPtsTo('d_chrome_tabs', 'onUpdated', 'd_chrome_tabs_onUpdated').
heapPtsTo('d_chrome_tabs_onUpdated', 'addListener', 'd_chrome_tabs_onUpdated_addListener').
heapPtsTo('d_chrome_tabs_onUpdated_addListener', 'prototype', 'p_chrome_tabs_onUpdated_addListener').
prototype('p_chrome_tabs_onUpdated_addListener', 'h_FP').

% chrome.topSites object
% Note: Doesn't have any events.
heapPtsTo('d_chrome', 'topSites', 'd_chrome_topSites').

% chrome.topSites.* events
heapPtsTo('d_chrome_topSites', 'get', 'd_chrome_topSites_get').
heapPtsTo('d_chrome_topSites_get', 'prototype', 'p_chrome_topSites_get').
prototype('p_chrome_topSites_get', 'h_FP').

% chrome.tts object
heapPtsTo('d_chrome', 'tts', 'd_chrome_tts').

% chrome.tts.* methods
heapPtsTo('d_chrome_tts', 'getVoices', 'd_chrome_tts_getVoices').
heapPtsTo('d_chrome_tts_getVoices', 'prototype', 'p_chrome_tts_getVoices').
prototype('p_chrome_tts_getVoices', 'h_FP').
heapPtsTo('d_chrome_tts', 'isSpeaking', 'd_chrome_tts_isSpeaking').
heapPtsTo('d_chrome_tts_isSpeaking', 'prototype', 'p_chrome_tts_isSpeaking').
prototype('p_chrome_tts_isSpeaking', 'h_FP').
heapPtsTo('d_chrome_tts', 'speak', 'd_chrome_tts_speak').
heapPtsTo('d_chrome_tts_speak', 'prototype', 'p_chrome_tts_speak').
prototype('p_chrome_tts_speak', 'h_FP').
heapPtsTo('d_chrome_tts', 'stop', 'd_chrome_tts_stop').
heapPtsTo('d_chrome_tts_stop', 'prototype', 'p_chrome_tts_stop').
prototype('p_chrome_tts_stop', 'h_FP').

% chrome.ttsEngine object
% Note: Doesn't have any methods.
heapPtsTo('d_chrome', 'ttsEngine', 'd_chrome_ttsEngine').

% chrome.ttsEngine.* events
heapPtsTo('d_chrome_proxy', 'onProxyError', 'd_chrome_proxy_onProxyError').
heapPtsTo('d_chrome_proxy_onProxyError', 'addListener', 'd_chrome_proxy_onProxyError_addListener').
heapPtsTo('d_chrome_proxy_onProxyError_addListener', 'prototype', 'p_chrome_proxy_onProxyError_addListener').
prototype('p_chrome_proxy_onProxyError_addListener', 'h_FP').

% chrome.types object
heapPtsTo('d_chrome', 'types', 'd_chrome_types').

% chrome.types.* method
heapPtsTo('d_chrome_types', 'clear', 'd_chrome_types_clear').
heapPtsTo('d_chrome_types_clear', 'prototype', 'p_chrome_types_clear').
prototype('p_chrome_types_clear', 'h_FP').
heapPtsTo('d_chrome_types', 'get', 'd_chrome_types_get').
heapPtsTo('d_chrome_types_get', 'prototype', 'p_chrome_types_get').
prototype('p_chrome_types_get', 'h_FP').
heapPtsTo('d_chrome_types', 'set', 'd_chrome_types_set').
heapPtsTo('d_chrome_types_set', 'prototype', 'p_chrome_types_set').
prototype('p_chrome_types_set', 'h_FP').

% chrome.types.* events
heapPtsTo('d_chrome_types', 'onChange', 'd_chrome_types_onChange').
heapPtsTo('d_chrome_types_onChange', 'addListener', 'd_chrome_types_onChange_addListener').
heapPtsTo('d_chrome_types_onChange_addListener', 'prototype', 'p_chrome_types_onChange_addListener').
prototype('p_chrome_types_onChange_addListener', 'h_FP').

% chrome.webNavigation object
heapPtsTo('d_chrome', 'webNavigation', 'd_chrome_webNavigation').

% chrome.webNavigation.* method
heapPtsTo('d_chrome_webNavigation', 'getAllFrames', 'd_chrome_webNavigation_getAllFrames').
heapPtsTo('d_chrome_webNavigation_getAllFrames', 'prototype', 'p_chrome_webNavigation_getAllFrames').
prototype('p_chrome_webNavigation_getAllFrames', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'getFrame', 'd_chrome_webNavigation_getFrame').
heapPtsTo('d_chrome_webNavigation_getFrame', 'prototype', 'p_chrome_webNavigation_getFrame').
prototype('p_chrome_webNavigation_getFrame', 'h_FP').

% chrome.webNavigation.* events
heapPtsTo('d_chrome_webNavigation', 'onBeforeNavigate', 'd_chrome_webNavigation_onBeforeNavigate').
heapPtsTo('d_chrome_webNavigation_onBeforeNavigate', 'addListener', 'd_chrome_webNavigation_onBeforeNavigate_addListener').
heapPtsTo('d_chrome_webNavigation_onBeforeNavigate_addListener', 'prototype', 'p_chrome_webNavigation_onBeforeNavigate_addListener').
prototype('p_chrome_webNavigation_onBeforeNavigate_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onCommitted', 'd_chrome_webNavigation_onCommitted').
heapPtsTo('d_chrome_webNavigation_onCommitted', 'addListener', 'd_chrome_webNavigation_onCommitted_addListener').
heapPtsTo('d_chrome_webNavigation_onCommitted_addListener', 'prototype', 'p_chrome_webNavigation_onCommitted_addListener').
prototype('p_chrome_webNavigation_onCommitted_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onCompleted', 'd_chrome_webNavigation_onCompleted').
heapPtsTo('d_chrome_webNavigation_onCompleted', 'addListener', 'd_chrome_webNavigation_onCompleted_addListener').
heapPtsTo('d_chrome_webNavigation_onCompleted_addListener', 'prototype', 'p_chrome_webNavigation_onCompleted_addListener').
prototype('p_chrome_webNavigation_onCompleted_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onCreatedNavigationTarget', 'd_chrome_webNavigation_onCreatedNavigationTarget').
heapPtsTo('d_chrome_webNavigation_onCreatedNavigationTarget', 'addListener', 'd_chrome_webNavigation_onCreatedNavigationTarget_addListener').
heapPtsTo('d_chrome_webNavigation_onCreatedNavigationTarget_addListener', 'prototype', 'p_chrome_webNavigation_onCreatedNavigationTarget_addListener').
prototype('p_chrome_webNavigation_onCreatedNavigationTarget_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onDOMContentLoaded', 'd_chrome_webNavigation_onDOMContentLoaded').
heapPtsTo('d_chrome_webNavigation_onDOMContentLoaded', 'addListener', 'd_chrome_webNavigation_onDOMContentLoaded_addListener').
heapPtsTo('d_chrome_webNavigation_onDOMContentLoaded_addListener', 'prototype', 'p_chrome_webNavigation_onDOMContentLoaded_addListener').
prototype('p_chrome_webNavigation_onDOMContentLoaded_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onErrorOccurred', 'd_chrome_webNavigation_onErrorOccurred').
heapPtsTo('d_chrome_webNavigation_onErrorOccurred', 'addListener', 'd_chrome_webNavigation_onErrorOccurred_addListener').
heapPtsTo('d_chrome_webNavigation_onErrorOccurred_addListener', 'prototype', 'p_chrome_webNavigation_onErrorOccurred_addListener').
prototype('p_chrome_webNavigation_onErrorOccurred_addListener', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'onReferenceFragmentUpdated', 'd_chrome_webNavigation_onReferenceFragmentUpdated').
heapPtsTo('d_chrome_webNavigation_onReferenceFragmentUpdated', 'addListener', 'd_chrome_webNavigation_onReferenceFragmentUpdated_addListener').
heapPtsTo('d_chrome_webNavigation_onReferenceFragmentUpdated_addListener', 'prototype', 'p_chrome_webNavigation_onReferenceFragmentUpdated_addListener').
prototype('p_chrome_webNavigation_onReferenceFragmentUpdated_addListener', 'h_FP').

% chrome.webRequest object
heapPtsTo('d_chrome', 'webRequest', 'd_chrome_webRequest').

% chrome.webRequest.* methods
heapPtsTo('d_chrome_webRequest', 'handlerBehaviorChanged', 'd_chrome_webRequest_handlerBehaviorChanged').
heapPtsTo('d_chrome_webRequest_handlerBehaviorChanged', 'prototype', 'p_chrome_webRequest_handlerBehaviorChanged').
prototype('p_chrome_webRequest_handlerBehaviorChanged', 'h_FP').

% chrome.webRequest.* events
heapPtsTo('d_chrome_webRequest', 'onAuthRequired', 'd_chrome_webRequest_onAuthRequired').
heapPtsTo('d_chrome_webRequest_onAuthRequired', 'addListener', 'd_chrome_webRequest_onAuthRequired_addListener').
heapPtsTo('d_chrome_webRequest_onAuthRequired_addListener', 'prototype', 'p_chrome_webRequest_onAuthRequired_addListener').
prototype('p_chrome_webRequest_onAuthRequired_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onBeforeRedirect', 'd_chrome_webRequest_onBeforeRedirect').
heapPtsTo('d_chrome_webRequest_onBeforeRedirect', 'addListener', 'd_chrome_webRequest_onBeforeRedirect_addListener').
heapPtsTo('d_chrome_webRequest_onBeforeRedirect_addListener', 'prototype', 'p_chrome_webRequest_onBeforeRedirect_addListener').
prototype('p_chrome_webRequest_onBeforeRedirect_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onBeforeRequest', 'd_chrome_webRequest_onBeforeRequest').
heapPtsTo('d_chrome_webRequest_onBeforeRequest', 'addListener', 'd_chrome_webRequest_onBeforeRequest_addListener').
heapPtsTo('d_chrome_webRequest_onBeforeRequest_addListener', 'prototype', 'p_chrome_webRequest_onBeforeRequest_addListener').
prototype('p_chrome_webRequest_onBeforeRequest_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onBeforeSendHeaders', 'd_chrome_webRequest_onBeforeSendHeaders').
heapPtsTo('d_chrome_webRequest_onBeforeSendHeaders', 'addListener', 'd_chrome_webRequest_onBeforeSendHeaders_addListener').
heapPtsTo('d_chrome_webRequest_onBeforeSendHeaders_addListener', 'prototype', 'p_chrome_webRequest_onBeforeSendHeaders_addListener').
prototype('p_chrome_webRequest_onBeforeSendHeaders_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onCompleted', 'd_chrome_webRequest_onCompleted').
heapPtsTo('d_chrome_webRequest_onCompleted', 'addListener', 'd_chrome_webRequest_onCompleted_addListener').
heapPtsTo('d_chrome_webRequest_onCompleted_addListener', 'prototype', 'p_chrome_webRequest_onCompleted_addListener').
prototype('p_chrome_webRequest_onCompleted_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onErrorOccurred', 'd_chrome_webRequest_onErrorOccurred').
heapPtsTo('d_chrome_webRequest_onErrorOccurred', 'addListener', 'd_chrome_webRequest_onErrorOccurred_addListener').
heapPtsTo('d_chrome_webRequest_onErrorOccurred_addListener', 'prototype', 'p_chrome_webRequest_onErrorOccurred_addListener').
prototype('p_chrome_webRequest_onErrorOccurred_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onHeadersReceived', 'd_chrome_webRequest_onHeadersReceived').
heapPtsTo('d_chrome_webRequest_onHeadersReceived', 'addListener', 'd_chrome_webRequest_onHeadersReceived_addListener').
heapPtsTo('d_chrome_webRequest_onHeadersReceived_addListener', 'prototype', 'p_chrome_webRequest_onHeadersReceived_addListener').
prototype('p_chrome_webRequest_onHeadersReceived_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onResponseStarted', 'd_chrome_webRequest_onResponseStarted').
heapPtsTo('d_chrome_webRequest_onResponseStarted', 'addListener', 'd_chrome_webRequest_onResponseStarted_addListener').
heapPtsTo('d_chrome_webRequest_onResponseStarted_addListener', 'prototype', 'p_chrome_webRequest_onResponseStarted_addListener').
prototype('p_chrome_webRequest_onResponseStarted_addListener', 'h_FP').
heapPtsTo('d_chrome_webRequest', 'onSendHeaders', 'd_chrome_webRequest_onSendHeaders').
heapPtsTo('d_chrome_webRequest_onSendHeaders', 'addListener', 'd_chrome_webRequest_onSendHeaders_addListener').
heapPtsTo('d_chrome_webRequest_onSendHeaders_addListener', 'prototype', 'p_chrome_webRequest_onSendHeaders_addListener').
prototype('p_chrome_webRequest_onSendHeaders_addListener', 'h_FP').

% chrome.webstore object
% Note: Doesn't have any events
heapPtsTo('d_chrome', 'webstore', 'd_chrome_webstore').

% chrome.webstore.* methods
heapPtsTo('d_chrome_webstore', 'install', 'd_chrome_webstore_install').
heapPtsTo('d_chrome_webstore_install', 'prototype', 'p_chrome_webstore_install').
prototype('p_chrome_webstore_install', 'h_FP').

% chrome.windows object
heapPtsTo('d_chrome', 'windows', 'd_chrome_windows').

% chrome.windows.* methods
heapPtsTo('d_chrome_windows', 'create', 'd_chrome_windows_create').
heapPtsTo('d_chrome_windows_create', 'prototype', 'p_chrome_windows_create').
prototype('p_chrome_windows_create', 'h_FP').
heapPtsTo('d_chrome_windows', 'get', 'd_chrome_windows_get').
heapPtsTo('d_chrome_windows_get', 'prototype', 'p_chrome_windows_get').
prototype('p_chrome_windows_get', 'h_FP').
heapPtsTo('d_chrome_windows', 'getAll', 'd_chrome_windows_getAll').
heapPtsTo('d_chrome_windows_getAll', 'prototype', 'p_chrome_windows_getAll').
prototype('p_chrome_windows_getAll', 'h_FP').
heapPtsTo('d_chrome_windows', 'getCurrent', 'd_chrome_windows_getCurrent').
heapPtsTo('d_chrome_windows_getCurrent', 'prototype', 'p_chrome_windows_getCurrent').
prototype('p_chrome_windows_getCurrent', 'h_FP').
heapPtsTo('d_chrome_windows', 'getLastFocused', 'd_chrome_windows_getLastFocused').
heapPtsTo('d_chrome_windows_getLastFocused', 'prototype', 'p_chrome_windows_getLastFocused').
prototype('p_chrome_windows_getLastFocused', 'h_FP').
heapPtsTo('d_chrome_windows', 'remove', 'd_chrome_windows_remove').
heapPtsTo('d_chrome_windows_remove', 'prototype', 'p_chrome_windows_remove').
prototype('p_chrome_windows_remove', 'h_FP').
heapPtsTo('d_chrome_windows', 'update', 'd_chrome_windows_update').
heapPtsTo('d_chrome_windows_update', 'prototype', 'p_chrome_windows_update').
prototype('p_chrome_windows_update', 'h_FP').

% chrome.windows.* events
heapPtsTo('d_chrome_windows', 'onCreated', 'd_chrome_windows_onCreated').
heapPtsTo('d_chrome_windows_onCreated', 'addListener', 'd_chrome_windows_onCreated_addListener').
heapPtsTo('d_chrome_windows_onCreated_addListener', 'prototype', 'p_chrome_windows_onCreated_addListener').
prototype('p_chrome_windows_onCreated_addListener', 'h_FP').
heapPtsTo('d_chrome_windows', 'onFocusChanged', 'd_chrome_windows_onFocusChanged').
heapPtsTo('d_chrome_windows_onFocusChanged', 'addListener', 'd_chrome_windows_onFocusChanged_addListener').
heapPtsTo('d_chrome_windows_onFocusChanged_addListener', 'prototype', 'p_chrome_windows_onFocusChanged_addListener').
prototype('p_chrome_windows_onFocusChanged_addListener', 'h_FP').
heapPtsTo('d_chrome_windows', 'onRemoved', 'd_chrome_windows_onRemoved').
heapPtsTo('d_chrome_windows_onRemoved', 'addListener', 'd_chrome_windows_onRemoved_addListener').
heapPtsTo('d_chrome_windows_onRemoved_addListener', 'prototype', 'p_chrome_windows_onRemoved_addListener').
prototype('p_chrome_windows_onRemoved_addListener', 'h_FP').

%%% End of chrome.pl %%%

