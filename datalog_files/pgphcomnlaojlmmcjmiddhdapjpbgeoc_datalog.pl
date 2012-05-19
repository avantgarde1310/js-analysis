assign('t0','t1').
ptsTo('summaryText_R_1','d_summaryText_R_1').
heapPtsTo('d_summaryText_R_1','prototype','p_summaryText_R_1').
prototype('p_summaryText_R_1','h_FP').
methodRet('d_summaryText_R_1','summaryText_R_1').
assign('toField_R_0','&to=').
assign('cachedGmailUrl_R_0','').
ptsTo('rewriteMailtoToGMailUrl_R_2','d_rewriteMailtoToGMailUrl_R_2').
heapPtsTo('d_rewriteMailtoToGMailUrl_R_2','prototype','p_rewriteMailtoToGMailUrl_R_2').
prototype('p_rewriteMailtoToGMailUrl_R_2','h_FP').
methodRet('d_rewriteMailtoToGMailUrl_R_2','rewriteMailtoToGMailUrl_R_2').
formal('d_rewriteMailtoToGMailUrl_R_2','1','inUrl_R_2').
ptsTo('rewriteMailtosOnPage_R_3','d_rewriteMailtosOnPage_R_3').
heapPtsTo('d_rewriteMailtosOnPage_R_3','prototype','p_rewriteMailtosOnPage_R_3').
prototype('p_rewriteMailtosOnPage_R_3','h_FP').
methodRet('d_rewriteMailtosOnPage_R_3','rewriteMailtosOnPage_R_3').
assign('t2','t3').
assign('t4','t5').
assign('t6','t7').
load('t9','window','addEventListener_R_?').
actual('2','1','focus').
callRet('2','focus').
actual('2','2','rewriteMailtosOnPage_R_?').
callRet('2','rewriteMailtosOnPage_R_?').
assign('t8','t10').
load('t11','chrome','extension').
load('t12','t11','connect').
store('bgPort_R_0','name_R_?','GmailUrlConn').
actual('3','1','__objectInit__').
callRet('3','__objectInit__').
assign('bgPort_R_0','t13').
load('t15','bgPort_R_0','postMessage_R_?').
store('t16','req_R_?','GmailUrlPlease').
actual('4','1','t16').
callRet('4','t16').
assign('t14','t17').
load('t19','bgPort_R_0','onMessage').
load('t20','t19','addListener_R_?').
actual('5','1','lambda_R_4').
callRet('5','lambda_R_4').
assign('t18','t21').
ptsTo('lambda_R_4','d_lambda_R_4').
heapPtsTo('d_lambda_R_4','prototype','p_lambda_R_4').
prototype('p_lambda_R_4','h_FP').
methodRet('d_lambda_R_4','lambda_R_4').
formal('d_lambda_R_4','1','msg_R_4').
assign('baseGmailUrl_R_0','https://mail.google.com/').
assign('gmailUrlSuffix_R_0','mail/?view=cm&fs=1&tf=1').
ptsTo('gethex_R_5','d_gethex_R_5').
heapPtsTo('d_gethex_R_5','prototype','p_gethex_R_5').
prototype('p_gethex_R_5','h_FP').
methodRet('d_gethex_R_5','gethex_R_5').
formal('d_gethex_R_5','1','decimal_R_5').
ptsTo('utfEscape_R_6','d_utfEscape_R_6').
heapPtsTo('d_utfEscape_R_6','prototype','p_utfEscape_R_6').
prototype('p_utfEscape_R_6','h_FP').
methodRet('d_utfEscape_R_6','utfEscape_R_6').
formal('d_utfEscape_R_6','1','s_R_6').
ptsTo('makeGmailDomainUrl_R_7','d_makeGmailDomainUrl_R_7').
heapPtsTo('d_makeGmailDomainUrl_R_7','prototype','p_makeGmailDomainUrl_R_7').
prototype('p_makeGmailDomainUrl_R_7','h_FP').
methodRet('d_makeGmailDomainUrl_R_7','makeGmailDomainUrl_R_7').
assign('title_R_0','').
assign('url_R_0','').
assign('summ_R_0','').
assign('initByClick_R_0','0').
load('t23','chrome','extension').
load('t24','t23','onConnect').
load('t25','t24','addListener').
actual('6','1','lambda_R_8').
callRet('6','lambda_R_8').
assign('t22','t26').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
formal('d_lambda_R_8','1','port_R_8').
load('t28','chrome','extension').
load('t29','t28','onRequest').
load('t30','t29','addListener').
actual('7','1','lambda_R_10').
callRet('7','lambda_R_10').
assign('t27','t31').
ptsTo('lambda_R_10','d_lambda_R_10').
heapPtsTo('d_lambda_R_10','prototype','p_lambda_R_10').
prototype('p_lambda_R_10','h_FP').
methodRet('d_lambda_R_10','lambda_R_10').
formal('d_lambda_R_10','1','conn_R_10').
load('t33','chrome','browserAction').
load('t34','t33','onClicked').
load('t35','t34','addListener').
actual('8','1','lambda_R_11').
callRet('8','lambda_R_11').
assign('t32','t36').
ptsTo('lambda_R_11','d_lambda_R_11').
heapPtsTo('d_lambda_R_11','prototype','p_lambda_R_11').
prototype('p_lambda_R_11','h_FP').
methodRet('d_lambda_R_11','lambda_R_11').
formal('d_lambda_R_11','1','tab_R_11').
ptsTo('makeGmailWin_R_12','d_makeGmailWin_R_12').
heapPtsTo('d_makeGmailWin_R_12','prototype','p_makeGmailWin_R_12').
prototype('p_makeGmailWin_R_12','h_FP').
methodRet('d_makeGmailWin_R_12','makeGmailWin_R_12').
formal('d_makeGmailWin_R_12','1','summary_R_12').
ptsTo('loadSavedOptions_R_13','d_loadSavedOptions_R_13').
heapPtsTo('d_loadSavedOptions_R_13','prototype','p_loadSavedOptions_R_13').
prototype('p_loadSavedOptions_R_13','h_FP').
methodRet('d_loadSavedOptions_R_13','loadSavedOptions_R_13').
ptsTo('saveOptions_R_14','d_saveOptions_R_14').
heapPtsTo('d_saveOptions_R_14','prototype','p_saveOptions_R_14').
prototype('p_saveOptions_R_14','h_FP').
methodRet('d_saveOptions_R_14','saveOptions_R_14').
assign('t37','t38').
ptsTo('lambda_R_15','d_lambda_R_15').
heapPtsTo('d_lambda_R_15','prototype','p_lambda_R_15').
prototype('p_lambda_R_15','h_FP').
methodRet('d_lambda_R_15','lambda_R_15').
load('t40','console','log_R_?').
actual('10','1','Being Called').
callRet('10','Being Called').
assign('t39','t41').
load('t43','chrome','extension').
load('t44','t43','sendRequest').
load('t45','window','getSelection_R_?').
load('t47','t46','toString_R_?').
actual('13','1','t48').
callRet('13','t48').
assign('t42','t49').
assign('retUrl_R_2','inUrl_R_2').
load('t50','retUrl_R_2','replace_R_?').
actual('14','1','?').
callRet('14','?').
actual('14','2','&').
callRet('14','&').
assign('retUrl_R_2','t51').
load('t52','retUrl_R_2','replace').
actual('15','1','{"regexp": "subject=", "modifiers": "i"}').
callRet('15','{"regexp": "subject=", "modifiers": "i"}').
actual('15','2','su=').
callRet('15','su=').
assign('retUrl_R_2','t53').
load('t54','retUrl_R_2','replace').
actual('16','1','{"regexp": "CC=", "modifiers": "i"}').
callRet('16','{"regexp": "CC=", "modifiers": "i"}').
actual('16','2','cc=').
callRet('16','cc=').
assign('retUrl_R_2','t55').
load('t56','retUrl_R_2','replace').
actual('17','1','{"regexp": "BCC=", "modifiers": "i"}').
callRet('17','{"regexp": "BCC=", "modifiers": "i"}').
actual('17','2','bcc=').
callRet('17','bcc=').
assign('retUrl_R_2','t57').
load('t58','retUrl_R_2','replace').
actual('18','1','{"regexp": "Body=", "modifiers": "i"}').
callRet('18','{"regexp": "Body=", "modifiers": "i"}').
actual('18','2','body=').
callRet('18','body=').
assign('retUrl_R_2','t59').
assign('gmailUrl_R_2','t60').
load('t61','retUrl_R_2','replace').
actual('19','1','mailto:').
callRet('19','mailto:').
actual('19','2','gmailUrl_R_2').
callRet('19','gmailUrl_R_2').
assign('retUrl_R_2','t62').
methodRet('d_rewriteMailtoToGMailUrl_R_2','retUrl_R_2').
load('t64','console','log_R_?').
actual('20','1','Starting to rewrite mailtos').
callRet('20','Starting to rewrite mailtos').
assign('t63','t65').
load('t66','document','evaluate_R_?').
load('t67','XPathResult_R_?','UNORDERED_NODE_ITERATOR_TYPE').
actual('21','1','//a[contains(@href, "mailto:")]').
callRet('21','//a[contains(@href, "mailto:")]').
actual('21','2','document').
callRet('21','document').
actual('21','3','null').
callRet('21','null').
actual('21','4','t67').
callRet('21','t67').
actual('21','5','null').
callRet('21','null').
assign('result_R_3','t68').
assign('item_R_3','__undefined__').
assign('nodes_R_3','nodes_R_3').
load('t69','result_R_3','iterateNext_R_?').
assign('item_R_3','t70').
load('t72','nodes_R_3','push_R_?').
actual('23','1','item_R_3').
callRet('23','item_R_3').
assign('t71','t73').
load('t75','nodes_R_3','length').
assign('t74','t76').
assign('i_R_3','0').
assign('t78','i_R_3').
assign('t77','t78').
load('t79','nodes_R_3','i_R_3').
load('t80','t79','getAttribute_R_?').
actual('24','1','href').
callRet('24','href').
assign('mailtoStr_R_3','t81').
actual('25','1','mailtoStr_R_3').
callRet('25','mailtoStr_R_3').
assign('mailtoStr_R_3','t82').
load('t84','nodes_R_3','i_R_3').
load('t85','t84','setAttribute_R_?').
actual('26','1','href').
callRet('26','href').
actual('26','2','mailtoStr_R_3').
callRet('26','mailtoStr_R_3').
assign('t83','t86').
load('t88','nodes_R_3','i_R_3').
load('t89','t88','setAttribute').
actual('27','1','target').
callRet('27','target').
actual('27','2','_blank').
callRet('27','_blank').
assign('t87','t90').
assign('i_R_3','0').
load('t92','console','log_R_?').
load('t93','msg_R_4','gmailDomainUrl').
actual('28','1','t94').
callRet('28','t94').
assign('t91','t95').
load('t96','msg_R_4','gmailDomainUrl').
assign('cachedGmailUrl_R_0','t96').
assign('t97','t98').
assign('hexchars_R_5','""""""""""""0123456789ABCDEFabcdef""""""""""""').
load('t99','hexchars_R_5','charAt_R_?').
actual('30','1','t100').
callRet('30','t100').
load('t103','hexchars_R_5','charAt').
actual('31','1','t104').
callRet('31','t104').
methodRet('d_gethex_R_5','t106').
assign('unreserved_R_6','""""""""""""""""""""""""""""""""""""""""""""""""""""0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_.~""""""""""""""""""""""""""""""""""""""""""""""""""""').
assign('reserved_R_6','!*"();:@&=+$,/?%#[]').
assign('allowed_R_6','t107').
assign('hexchars_R_6','""""""""""""0123456789ABCDEFabcdef""""""""""""').
assign('decoded_R_6','s_R_6').
assign('encoded_R_6','').
load('t109','decoded_R_6','length').
assign('t108','t110').
assign('i_R_6','0').
assign('t112','i_R_6').
assign('t111','t112').
load('t113','decoded_R_6','charAt_R_?').
actual('32','1','i_R_6').
callRet('32','i_R_6').
assign('ch_R_6','t114').
load('t116','unreserved_R_6','indexOf_R_?').
actual('33','1','ch_R_6').
callRet('33','ch_R_6').
assign('t118','1').
assign('t115','t119').
load('t120','decoded_R_6','charCodeAt_R_?').
actual('34','1','i_R_6').
callRet('34','i_R_6').
assign('charcode_R_6','t121').
assign('t122','t123').
actual('35','1','charcode_R_6').
callRet('35','charcode_R_6').
assign('encoded_R_6','t125').
assign('t126','t129').
actual('36','1','t131').
callRet('36','t131').
assign('encoded_R_6','t133').
actual('37','1','t135').
callRet('37','t135').
assign('encoded_R_6','t137').
assign('t138','t141').
actual('38','1','t143').
callRet('38','t143').
assign('encoded_R_6','t145').
actual('39','1','t148').
callRet('39','t148').
assign('encoded_R_6','t150').
actual('40','1','t152').
callRet('40','t152').
assign('encoded_R_6','t154').
assign('t155','t156').
actual('41','1','t158').
callRet('41','t158').
assign('encoded_R_6','t160').
actual('42','1','t163').
callRet('42','t163').
assign('encoded_R_6','t165').
actual('43','1','t168').
callRet('43','t168').
assign('encoded_R_6','t170').
actual('44','1','t172').
callRet('44','t172').
assign('encoded_R_6','t174').
assign('encoded_R_6','t175').
assign('i_R_6','0').
methodRet('d_utfEscape_R_6','encoded_R_6').
assign('gmailUrl_R_7','baseGmailUrl_R_0').
load('t176','window','localStorage').
load('t177','t176','domainName').
assign('domainName_R_7','t177').
assign('t178','t181').
assign('gmailUrl_R_7','t183').
assign('gmailUrl_R_7','gmailUrlSuffix_R_0').
methodRet('d_makeGmailDomainUrl_R_7','gmailUrl_R_7').
load('t185','port_R_8','name').
assign('t184','t186').
load('t188','port_R_8','onMessage').
load('t189','t188','addListener_R_?').
actual('45','1','lambda_R_9').
callRet('45','lambda_R_9').
assign('t187','t190').
ptsTo('lambda_R_9','d_lambda_R_9').
heapPtsTo('d_lambda_R_9','prototype','p_lambda_R_9').
prototype('p_lambda_R_9','h_FP').
methodRet('d_lambda_R_9','lambda_R_9').
formal('d_lambda_R_9','1','msg_R_9').
load('t192','msg_R_9','req').
assign('t191','t193').
load('t195','console','log_R_?').
actual('46','1','Unsupported req on valid port').
callRet('46','Unsupported req on valid port').
assign('t194','t196').
load('t198','port_R_8','postMessage_R_?').
store('t199','gmailDomainUrl_R_?','t200').
actual('48','1','t199').
callRet('48','t199').
assign('t197','t201').
assign('summ_R_0','conn_R_10').
assign('t202','t203').
actual('49','1','summ_R_0').
callRet('49','summ_R_0').
assign('t204','t205').
assign('initByClick_R_0','0').
assign('initByClick_R_0','1').
load('t207','chrome','tabs').
load('t208','t207','executeScript').
store('t209','file_R_?','infopasser.js').
actual('50','1','null').
callRet('50','null').
actual('50','2','t209').
callRet('50','t209').
assign('t206','t210').
load('t211','tab_R_11','title').
assign('title_R_0','t211').
load('t212','tab_R_11','url').
assign('url_R_0','t212').
assign('body_R_12','').
load('t214','console','log_R_?').
actual('51','1','t215').
callRet('51','t215').
assign('t213','t216').
assign('subject_R_12','').
load('t218','localStorage_R_?','subjectPrefix').
load('t220','localStorage_R_?','subjectPrefix').
assign('t217','t222').
load('t223','localStorage_R_?','subjectPrefix').
assign('subject_R_12','t224').
actual('52','1','title_R_0').
callRet('52','title_R_0').
assign('subject_R_12','t225').
assign('t226','t227').
actual('53','1','summary_R_12').
callRet('53','summary_R_12').
actual('54','1','
').
callRet('54','
').
actual('55','1','url_R_0').
callRet('55','url_R_0').
assign('body_R_12','t232').
actual('56','1','url_R_0').
callRet('56','url_R_0').
assign('body_R_12','t233').
assign('gmailURL_R_12','t238').
load('t240','chrome','windows').
load('t241','t240','create').
store('t242','url_R_0','gmailURL_R_12').
store('t242','left_R_?','20').
store('t242','top_R_?','30').
store('t242','width_R_?','700').
store('t242','height_R_?','600').
actual('58','1','t242').
callRet('58','t242').
assign('t239','t243').
load('t245','window','localStorage').
assign('t244','t246').
actual('59','1','LocalStorage must be enabled for managing options.').
callRet('59','LocalStorage must be enabled for managing options.').
assign('t247','t248').
methodRet('d_loadSavedOptions_R_13','null').
load('t249','localStorage_R_?','domainName').
assign('domainName_R_13','t249').
assign('t250','t251').
load('t252','document','getElementById_R_?').
load('t253','t252','domain_info').
load('t254','t253','value').
store('t253','value','domainName_R_13').
load('t255','localStorage_R_?','subjectPrefix').
assign('subjectPrefix_R_13','t255').
assign('t256','t257').
load('t258','document','getElementById').
load('t259','t258','subject_prefix').
load('t260','t259','value').
store('t259','value','subjectPrefix_R_13').
load('t261','document','getElementById_R_?').
actual('60','1','domain_info').
callRet('60','domain_info').
load('t263','t262','value').
assign('domainVal_R_14','t263').
load('t265','console','log_R_?').
actual('61','1','t266').
callRet('61','t266').
assign('t264','t267').
load('t270','domainVal_R_14','indexOf_R_?').
actual('62','1','.').
callRet('62','.').
assign('t272','1').
assign('t268','t274').
load('t275','window','localStorage').
load('t276','t275','domainName').
store('t275','domainName','domainVal_R_14').
actual('63','1','t279').
callRet('63','t279').
assign('t277','t280').
load('t281','document','getElementById').
actual('64','1','subject_prefix').
callRet('64','subject_prefix').
load('t283','t282','value').
assign('subjectPrefix_R_14','t283').
load('t284','window','localStorage').
load('t285','t284','subjectPrefix').
store('t284','subjectPrefix','subjectPrefix_R_14').
load('t287','console','log').
actual('65','1','t288').
callRet('65','t288').
assign('t286','t289').
load('t290','document','getElementById_R_?').
actual('66','1','_added_by_transform_0').
callRet('66','_added_by_transform_0').
assign('temp_R_15','t291').
load('t293','temp_R_15','addEventListener_R_?').
actual('67','1','load').
callRet('67','load').
actual('67','2','lambda_R_16').
callRet('67','lambda_R_16').
assign('t292','t294').
ptsTo('lambda_R_16','d_lambda_R_16').
heapPtsTo('d_lambda_R_16','prototype','p_lambda_R_16').
prototype('p_lambda_R_16','h_FP').
methodRet('d_lambda_R_16','lambda_R_16').
formal('d_lambda_R_16','1','event_R_16').
assign('t295','t296').
%% basicrules.pl
%% This file contains the inference rules needed for the points-to analysis
%% using Datalog. These rules will be embedded into the .pl file generated
%% from the JavaScript file/extension.

%% FIXME: style_check directive not available in Datalog 
%%:- style_check(-discontiguous).

:- dynamic
        alloc/2,
        load/3,
        store/3,
        assign/2,
        directHeapStoresTo/3,
        directHeapPointsTo/3,
        actual/3.

%% Basic Rules
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

%% Call graph
calls(I,M) :-        
        actual(I,0,C),        
        ptsTo(C,M).

%% Interprocedural assignments
assign(V_1,V_2) :-        
        calls(I,M),        
        formal(M,Z,V_1),        
        actual(I,Z,V_2).
assign(V_2,V_1) :-        
        calls(I,M),        
        methodRet(M,V_1),        
        callRet(I,V_2).

%% Prototype handling
heapPtsTo(H_1,F,H_2) :-        
        prototype(H_1,H),        
        heapPtsTo(H,F,H_2).

%%% chrome.pl %%%
% A hard-coded model of the Google Chrome API to be used by datalog.py. 
% datalog.py will load this file and embed it to the .pl file generated
% by the JavaScript files. This file is used to simulate the existence
% of the Chrome API in the environment.
%
% Change Logs
% -    Implemented all chrome API methods.
%
% To-Dos
% -    Implement other chrome API events!


% chrome object
ptsTo('chrome', 'd_chrome').
heapPtsTo('d_chrome', 'prototype', 'p_chrome').

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

% chrome.contentSettings object
% Note: Doesn't have any methods
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

% chrome.fileBrowserHandler object
% Note: Doesn't have any methods
heapPtsTo('d_chrome', 'fileBrowserHandler', 'd_chrome_fileBrowserHandler').

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

% chrome.i18n object
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

% chrome.input.ime object
heapPtsTo('d_chrome', 'input.ime', 'd_chrome_input').

% chrome.input.ime.* methods
heapPtsTo('d_chrome_input', 'clearComposition', 'd_chrome_input_clearComposition').
heapPtsTo('d_chrome_input_clearComposition', 'prototype', 'p_chrome_input_clearComposition').
prototype('p_chrome_input_clearComposition', 'h_FP').
heapPtsTo('d_chrome_input', 'commitText', 'd_chrome_input_commitText').
heapPtsTo('d_chrome_input_commitText', 'prototype', 'p_chrome_input_commitText').
prototype('p_chrome_input_commitText', 'h_FP').
heapPtsTo('d_chrome_input', 'setCandidateWindowProperties', 'd_chrome_input_setCandidateWindowProperties').
heapPtsTo('d_chrome_input_setCandidateWindowProperties', 'prototype', 'p_chrome_input_setCandidateWindowProperties').
prototype('p_chrome_input_setCandidateWindowProperties', 'h_FP').
heapPtsTo('d_chrome_input', 'setCandidates', 'd_chrome_input_setCandidates').
heapPtsTo('d_chrome_input_setCandidates', 'prototype', 'p_chrome_input_setCandidates').
prototype('p_chrome_input_setCandidates', 'h_FP').
heapPtsTo('d_chrome_input', 'setComposition', 'd_chrome_input_setComposition').
heapPtsTo('d_chrome_input_setComposition', 'prototype', 'p_chrome_input_setComposition').
prototype('p_chrome_input_setComposition', 'h_FP').
heapPtsTo('d_chrome_input', 'setCursorPosition', 'd_chrome_input_setCursorPosition').
heapPtsTo('d_chrome_input_setCursorPosition', 'prototype', 'p_chrome_input_setCursorPosition').
prototype('p_chrome_input_setCursorPosition', 'h_FP').
heapPtsTo('d_chrome_input', 'setMenuItems', 'd_chrome_input_setMenuItems').
heapPtsTo('d_chrome_input_setMenuItems', 'prototype', 'p_chrome_input_setMenuItems').
prototype('p_chrome_input_setMenuItems', 'h_FP').
heapPtsTo('d_chrome_input', 'updateMenuItems', 'd_chrome_input_updateMenuItems').
heapPtsTo('d_chrome_input_updateMenuItems', 'prototype', 'p_chrome_input_updateMenuItems').
prototype('p_chrome_input_updateMenuItems', 'h_FP').

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

% chrome.omnibox object
heapPtsTo('d_chrome', 'omnibox', 'd_chrome_omnibox').

% chrome.omnibox.* methods
heapPtsTo('d_chrome_omnibox', 'setDefaultSuggestion', 'd_chrome_omnibox_setDefaultSuggestion').
heapPtsTo('d_chrome_omnibox_setDefaultSuggestion', 'prototype', 'p_chrome_omnibox_setDefaultSuggestion').
prototype('p_chrome_omnibox_setDefaultSuggestion', 'h_FP').

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


% chrome.pageCapture object
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


% chrome.privacy object
% Note: Doesn't have any methods. 
heapPtsTo('d_chrome', 'privacy', 'd_chrome_privacy').

% chrome.proxy object
% Note: Doesn't have any methods. 
heapPtsTo('d_chrome', 'proxy', 'd_chrome_proxy').

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

% chrome.webNavigation object
heapPtsTo('d_chrome', 'webNavigation', 'd_chrome_webNavigation').

% chrome.webNavigation.* method
heapPtsTo('d_chrome_webNavigation', 'getAllFrames', 'd_chrome_webNavigation_getAllFrames').
heapPtsTo('d_chrome_webNavigation_getAllFrames', 'prototype', 'p_chrome_webNavigation_getAllFrames').
prototype('p_chrome_webNavigation_getAllFrames', 'h_FP').
heapPtsTo('d_chrome_webNavigation', 'getFrame', 'd_chrome_webNavigation_getFrame').
heapPtsTo('d_chrome_webNavigation_getFrame', 'prototype', 'p_chrome_webNavigation_getFrame').
prototype('p_chrome_webNavigation_getFrame', 'h_FP').

% chrome.webRequest object
heapPtsTo('d_chrome', 'webRequest', 'd_chrome_webRequest').

% chrome.webRequest.* methods
heapPtsTo('d_chrome_webRequest', 'handlerBehaviorChanged', 'd_chrome_webRequest_handlerBehaviorChanged').
heapPtsTo('d_chrome_webRequest_handlerBehaviorChanged', 'prototype', 'p_chrome_webRequest_handlerBehaviorChanged').
prototype('p_chrome_webRequest_handlerBehaviorChanged', 'h_FP').

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

%%% End of chrome.pl %%%

