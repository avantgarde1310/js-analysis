store('feed_types_R_0','application/rss+xml','true').
store('feed_types_R_0','application/atom+xml','true').
store('feed_types_R_0','text/xml','true').
store('feed_types_R_0','application/x-cooliris-quick','true').
assign('feed_types_R_0','__objectInit__').
ptsTo('hasFeed_R_1','d_hasFeed_R_1').
heapPtsTo('d_hasFeed_R_1','prototype','p_hasFeed_R_1').
prototype('p_hasFeed_R_1','h_FP').
methodRet('d_hasFeed_R_1','hasFeed_R_1').
assign('t0','t1').
load('t2','chrome','extension').
load('t3','t2','connect').
store('port_R_0','name_R_?','HasJsPageHandler').
actual('1','1','__objectInit__').
callRet('1','__objectInit__').
assign('port_R_0','t4').
load('t6','port_R_0','onMessage').
load('t7','t6','addListener_R_?').
actual('2','1','initCooliris_R_?').
callRet('2','initCooliris_R_?').
assign('t5','t8').
load('t10','port_R_0','postMessage_R_?').
assign('t9','t11').
assign('t12','t13').
load('t15','window','name').
load('t16','t15','match').
actual('5','1','{"regexp": "__cooliris_background_(\\d+)", "modifiers": ""}').
callRet('5','{"regexp": "__cooliris_background_(\\d+)", "modifiers": ""}').
assign('t14','t17').
load('t19','location_R_?','host').
load('t20','t19','match_R_?').
actual('6','1','{"regexp": ".cooliris.com$", "modifiers": ""}').
callRet('6','{"regexp": ".cooliris.com$", "modifiers": ""}').
assign('t18','t21').
store('t23','type_R_?','application/x-cooliris-page').
store('t23','hidden_R_?','true').
actual('7','1','t23').
callRet('7','t23').
assign('t22','t24').
store('t26','type_R_?','application/x-cooliris-background-page').
load('t27','RegExp_R_?','$1').
store('t26','handle_R_?','t27').
actual('8','1','t26').
callRet('8','t26').
assign('t25','t28').
ptsTo('setPicLensContext_R_2','d_setPicLensContext_R_2').
heapPtsTo('d_setPicLensContext_R_2','prototype','p_setPicLensContext_R_2').
prototype('p_setPicLensContext_R_2','h_FP').
methodRet('d_setPicLensContext_R_2','setPicLensContext_R_2').
assign('script_text_R_0','t30').
load('t31','script_text_R_0','replace_R_?').
actual('9','1','initCooliris').
callRet('9','initCooliris').
actual('9','2','t33').
callRet('9','t33').
assign('script_text_R_0','t34').
load('t35','document','createElement_R_?').
actual('10','1','script').
callRet('10','script').
assign('script_tag_R_0','t36').
load('t37','script_tag_R_0','id').
store('script_tag_R_0','id','coolirisScript').
load('t39','script_tag_R_0','appendChild_R_?').
load('t40','document','createTextNode_R_?').
actual('11','1','script_text_R_0').
callRet('11','script_text_R_0').
actual('12','1','t41').
callRet('12','t41').
assign('t38','t42').
load('t44','document','documentElement').
load('t45','t44','appendChild').
actual('13','1','script_tag_R_0').
callRet('13','script_tag_R_0').
assign('t43','t46').
ptsTo('initCooliris_R_4','d_initCooliris_R_4').
heapPtsTo('d_initCooliris_R_4','prototype','p_initCooliris_R_4').
prototype('p_initCooliris_R_4','h_FP').
methodRet('d_initCooliris_R_4','initCooliris_R_4').
formal('d_initCooliris_R_4','1','custom_attributes_R_4').
assign('cooliris_R_0','null').
actual('14','1','lambda_R_8').
callRet('14','lambda_R_8').
actual('14','2','0').
callRet('14','0').
assign('t47','t48').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
load('t50','chrome','extension').
load('t51','t50','onConnect').
load('t52','t51','addListener').
actual('15','1','lambda_R_9').
callRet('15','lambda_R_9').
assign('t49','t53').
ptsTo('lambda_R_9','d_lambda_R_9').
heapPtsTo('d_lambda_R_9','prototype','p_lambda_R_9').
prototype('p_lambda_R_9','h_FP').
methodRet('d_lambda_R_9','lambda_R_9').
formal('d_lambda_R_9','1','port_R_9').
ptsTo('launchInTab_R_12','d_launchInTab_R_12').
heapPtsTo('d_launchInTab_R_12','prototype','p_launchInTab_R_12').
prototype('p_launchInTab_R_12','h_FP').
methodRet('d_launchInTab_R_12','launchInTab_R_12').
formal('d_launchInTab_R_12','1','tabId_R_12').
load('t55','chrome','browserAction').
load('t56','t55','onClicked').
load('t57','t56','addListener').
actual('16','1','lambda_R_14').
callRet('16','lambda_R_14').
assign('t54','t58').
ptsTo('lambda_R_14','d_lambda_R_14').
heapPtsTo('d_lambda_R_14','prototype','p_lambda_R_14').
prototype('p_lambda_R_14','h_FP').
methodRet('d_lambda_R_14','lambda_R_14').
formal('d_lambda_R_14','1','tab_R_14').
ptsTo('openUrl_R_15','d_openUrl_R_15').
heapPtsTo('d_openUrl_R_15','prototype','p_openUrl_R_15').
prototype('p_openUrl_R_15','h_FP').
methodRet('d_openUrl_R_15','openUrl_R_15').
formal('d_openUrl_R_15','1','url_R_15').
formal('d_openUrl_R_15','2','newTab_R_15').
formal('d_openUrl_R_15','3','selectTab_R_15').
ptsTo('stringForKey_R_18','d_stringForKey_R_18').
heapPtsTo('d_stringForKey_R_18','prototype','p_stringForKey_R_18').
prototype('p_stringForKey_R_18','h_FP').
methodRet('d_stringForKey_R_18','stringForKey_R_18').
formal('d_stringForKey_R_18','1','key_R_18').
ptsTo('setStringForKey_R_19','d_setStringForKey_R_19').
heapPtsTo('d_setStringForKey_R_19','prototype','p_setStringForKey_R_19').
prototype('p_setStringForKey_R_19','h_FP').
methodRet('d_setStringForKey_R_19','setStringForKey_R_19').
formal('d_setStringForKey_R_19','1','key_R_19').
formal('d_setStringForKey_R_19','2','value_R_19').
load('t59','location_R_?','href').
store('location_R_?','href','http://my.cooliris.com/preferences.php').
load('t61','document','write_R_?').
load('t62','navigator_R_?','platform').
actual('17','1','t62').
callRet('17','t62').
assign('t60','t63').
load('t65','navigator_R_?','platform').
load('t66','t65','match').
actual('18','1','{"regexp": "Win", "modifiers": ""}').
callRet('18','{"regexp": "Win", "modifiers": ""}').
assign('t64','t67').
load('t69','navigator_R_?','platform').
load('t70','t69','match').
actual('19','1','{"regexp": "Mac", "modifiers": ""}').
callRet('19','{"regexp": "Mac", "modifiers": ""}').
assign('t68','t71').
load('t73','navigator_R_?','platform').
load('t74','t73','match').
actual('20','1','{"regexp": "Linux", "modifiers": ""}').
callRet('20','{"regexp": "Linux", "modifiers": ""}').
assign('t72','t75').
load('t76','document','getElementById_R_?').
load('t77','t76','unsupported_os').
load('t78','t77','style').
load('t79','t78','display').
store('t78','display','').
load('t80','document','getElementById').
load('t81','t80','unsupported_linux').
load('t82','t81','style').
load('t83','t82','display').
store('t82','display','').
load('t84','document','getElementById').
load('t85','t84','unsupported_mac').
load('t86','t85','style').
load('t87','t86','display').
store('t86','display','').
load('t88','document','getElementById').
load('t89','t88','error').
load('t90','t89','style').
load('t91','t90','display').
store('t90','display','').
load('t92','document','getElementsByTagName_R_?').
actual('21','1','link').
callRet('21','link').
assign('links_R_1','t93').
load('t95','links_R_1','length').
assign('t94','t96').
assign('i_R_1','0').
assign('t98','i_R_1').
assign('t97','t98').
load('t100','links_R_1','i_R_1').
load('t101','t100','type').
load('t103','links_R_1','i_R_1').
load('t104','t103','type').
load('t105','t104','toLowerCase_R_?').
load('t107','feed_types_R_0','t106').
assign('t99','t108').
methodRet('d_hasFeed_R_1','true').
assign('i_R_1','0').
methodRet('d_hasFeed_R_1','false').
load('t109','window','PicLensContext').
store('window','PicLensContext','lambda_R_3').
ptsTo('lambda_R_3','d_lambda_R_3').
heapPtsTo('d_lambda_R_3','prototype','p_lambda_R_3').
prototype('p_lambda_R_3','h_FP').
methodRet('d_lambda_R_3','lambda_R_3').
load('t111','document','documentElement').
load('t112','t111','removeChild_R_?').
load('t113','document','getElementById_R_?').
actual('23','1','coolirisScript').
callRet('23','coolirisScript').
actual('24','1','t114').
callRet('24','t114').
assign('t110','t115').
methodRet('d_lambda_R_3','t116').
load('t117','document','getElementById_R_?').
actual('26','1','coolirisBridge').
callRet('26','coolirisBridge').
assign('cooliris_R_4','t118').
assign('t120','cooliris_R_4').
assign('t119','t120').
store('default_attributes_R_4','type_R_?','application/x-cooliris-page').
store('default_attributes_R_4','hidden_R_?','true').
assign('default_attributes_R_4','__objectInit__').
load('t122','navigator_R_?','platform').
load('t123','t122','indexOf_R_?').
actual('27','1','Linux').
callRet('27','Linux').
assign('t125','1').
assign('t121','t126').
load('t127','default_attributes_R_4','style').
store('default_attributes_R_4','style','width: 1px; height: 1px; position:absolute; left: -10000px').
load('t128','default_attributes_R_4','hidden').
store('default_attributes_R_4','hidden','false').
assign('plugin_attributes_R_4','t129').
load('t130','plugin_attributes_R_4','id').
store('plugin_attributes_R_4','id','coolirisBridge').
load('t131','document','createElement_R_?').
actual('28','1','embed').
callRet('28','embed').
assign('cooliris_R_4','t132').
load('t134','cooliris_R_4','setAttribute_R_?').
load('t135','plugin_attributes_R_4','attr_name_R_4').
actual('29','1','attr_name_R_4').
callRet('29','attr_name_R_4').
actual('29','2','t135').
callRet('29','t135').
assign('t133','t136').
assign('attr_name_R_4','__undefined__').
load('t138','document','documentElement').
load('t139','t138','appendChild_R_?').
actual('30','1','cooliris_R_4').
callRet('30','cooliris_R_4').
assign('t137','t140').
assign('t141','t142').
load('t144','document','addEventListener_R_?').
actual('31','1','mouseover').
callRet('31','mouseover').
actual('31','2','lambda_R_5').
callRet('31','lambda_R_5').
actual('31','3','true').
callRet('31','true').
assign('t143','t145').
ptsTo('lambda_R_5','d_lambda_R_5').
heapPtsTo('d_lambda_R_5','prototype','p_lambda_R_5').
prototype('p_lambda_R_5','h_FP').
methodRet('d_lambda_R_5','lambda_R_5').
formal('d_lambda_R_5','1','e_R_5').
load('t147','document','addEventListener').
actual('32','1','mouseout').
callRet('32','mouseout').
actual('32','2','lambda_R_6').
callRet('32','lambda_R_6').
actual('32','3','true').
callRet('32','true').
assign('t146','t148').
ptsTo('lambda_R_6','d_lambda_R_6').
heapPtsTo('d_lambda_R_6','prototype','p_lambda_R_6').
prototype('p_lambda_R_6','h_FP').
methodRet('d_lambda_R_6','lambda_R_6').
formal('d_lambda_R_6','1','e_R_6').
load('t150','chrome','extension').
assign('t149','t150').
load('t152','window','addEventListener').
actual('33','1','LaunchableChanged').
callRet('33','LaunchableChanged').
actual('33','2','lambda_R_7').
callRet('33','lambda_R_7').
actual('33','3','false').
callRet('33','false').
assign('t151','t153').
ptsTo('lambda_R_7','d_lambda_R_7').
heapPtsTo('d_lambda_R_7','prototype','p_lambda_R_7').
prototype('p_lambda_R_7','h_FP').
methodRet('d_lambda_R_7','lambda_R_7').
methodRet('d_initCooliris_R_4','cooliris_R_4').
load('t155','cooliris_R_4','onMouseOver_R_?').
actual('34','1','e_R_5').
callRet('34','e_R_5').
assign('t154','t156').
load('t158','cooliris_R_4','onMouseOut_R_?').
actual('35','1','e_R_6').
callRet('35','e_R_6').
assign('t157','t159').
load('t161','chrome','extension').
load('t162','t161','connect').
store('t163','name_R_?','LaunchableChanged').
actual('36','1','t163').
callRet('36','t163').
load('t165','t164','postMessage').
load('t167','cooliris_R_4','launchable').
store('t166','launchable_R_?','t167').
actual('37','1','t166').
callRet('37','t166').
assign('t160','t168').
load('t169','document','createElement_R_?').
actual('38','1','object').
callRet('38','object').
assign('cooliris_R_0','t170').
load('t172','cooliris_R_0','setAttribute_R_?').
actual('39','1','id').
callRet('39','id').
actual('39','2','coolirisBridge').
callRet('39','coolirisBridge').
assign('t171','t173').
load('t175','cooliris_R_0','setAttribute').
actual('40','1','type').
callRet('40','type').
actual('40','2','application/x-cooliris-background').
callRet('40','application/x-cooliris-background').
assign('t174','t176').
load('t178','document','documentElement').
load('t179','t178','appendChild_R_?').
actual('41','1','cooliris_R_0').
callRet('41','cooliris_R_0').
assign('t177','t180').
load('t182','port_R_9','name').
assign('t181','t183').
load('t185','port_R_9','name').
assign('t184','t186').
load('t188','port_R_9','onMessage').
load('t189','t188','addListener_R_?').
actual('42','1','lambda_R_10').
callRet('42','lambda_R_10').
assign('t187','t190').
ptsTo('lambda_R_10','d_lambda_R_10').
heapPtsTo('d_lambda_R_10','prototype','p_lambda_R_10').
prototype('p_lambda_R_10','h_FP').
methodRet('d_lambda_R_10','lambda_R_10').
formal('d_lambda_R_10','1','params_R_10').
load('t192','port_R_9','onMessage').
load('t193','t192','addListener').
actual('43','1','lambda_R_11').
callRet('43','lambda_R_11').
assign('t191','t194').
ptsTo('lambda_R_11','d_lambda_R_11').
heapPtsTo('d_lambda_R_11','prototype','p_lambda_R_11').
prototype('p_lambda_R_11','h_FP').
methodRet('d_lambda_R_11','lambda_R_11').
load('t195','params_R_10','launchable').
assign('(None, "path_R_10")','resources/launch.active.png').
assign('path_R_10','resources/launch.normal.png').
load('t197','chrome','browserAction').
load('t198','t197','setIcon').
load('t200','port_R_9','tab').
load('t201','t200','id').
store('t199','tabId_R_?','t201').
store('t199','path_R_10','path_R_10').
actual('44','1','t199').
callRet('44','t199').
assign('t196','t202').
load('t204','cooliris_R_0','hasJsPageHandler_R_?').
load('t205','port_R_9','tab').
load('t206','t205','url').
actual('45','1','t206').
callRet('45','t206').
assign('t203','t207').
load('t209','port_R_9','postMessage_R_?').
assign('t208','t210').
ptsTo('t211','n_XMLHttpRequest_R_?_0').
prototype('n_XMLHttpRequest_R_?_0', 'p_XMLHttpRequest_R_?').
assign('xhr_R_12','t211').
load('t212','xhr_R_12','onload').
store('xhr_R_12','onload','lambda_R_13').
ptsTo('lambda_R_13','d_lambda_R_13').
heapPtsTo('d_lambda_R_13','prototype','p_lambda_R_13').
prototype('p_lambda_R_13','h_FP').
methodRet('d_lambda_R_13','lambda_R_13').
load('t214','xhr_R_12','open_R_?').
load('t215','chrome','extension').
load('t216','t215','getURL').
actual('47','1','init.js').
callRet('47','init.js').
actual('48','1','GET').
callRet('48','GET').
actual('48','2','t217').
callRet('48','t217').
actual('48','3','true').
callRet('48','true').
assign('t213','t218').
load('t220','xhr_R_12','send_R_?').
assign('t219','t221').
load('t222','xhr_R_12','responseText').
assign('code_R_13','t223').
load('t225','chrome','tabs').
load('t226','t225','executeScript').
store('t227','code_R_13','code_R_13').
actual('50','1','tabId_R_12').
callRet('50','tabId_R_12').
actual('50','2','t227').
callRet('50','t227').
assign('t224','t228').
load('t230','cooliris_R_0','launchFromToolbar').
assign('t231','t230').
assign('t229','t231').
load('t233','tab_R_14','url').
load('t234','t233','match_R_?').
actual('51','1','{"regexp": "^https?:", "modifiers": ""}').
callRet('51','{"regexp": "^https?:", "modifiers": ""}').
load('t236','tab_R_14','url').
load('t237','t236','match').
actual('52','1','{"regexp": "^https?:\\/\\/chrome.google.com\\/", "modifiers": ""}').
callRet('52','{"regexp": "^https?:\\/\\/chrome.google.com\\/", "modifiers": ""}').
assign('t239','t238').
assign('t232','t240').
load('t242','cooliris_R_0','launchFromToolbar_R_?').
assign('t241','t243').
load('t245','tab_R_14','id').
actual('54','1','t245').
callRet('54','t245').
assign('t244','t246').
load('t248','chrome','tabs').
load('t249','t248','update').
load('t250','tab_R_14','id').
load('t252','chrome','extension').
load('t253','t252','getURL').
actual('55','1','unsupported.html').
callRet('55','unsupported.html').
store('t251','url_R_?','t254').
store('t251','selected_R_?','true').
actual('56','1','t250').
callRet('56','t250').
actual('56','2','t251').
callRet('56','t251').
assign('t247','t255').
load('t257','chrome','windows').
load('t258','t257','getLastFocused').
actual('57','1','lambda_R_16').
callRet('57','lambda_R_16').
assign('t256','t259').
ptsTo('lambda_R_16','d_lambda_R_16').
heapPtsTo('d_lambda_R_16','prototype','p_lambda_R_16').
prototype('p_lambda_R_16','h_FP').
methodRet('d_lambda_R_16','lambda_R_16').
formal('d_lambda_R_16','1','win_R_16').
assign('t260','newTab_R_15').
load('t262','chrome','tabs').
load('t263','t262','getSelected').
load('t264','win_R_16','id').
actual('58','1','t264').
callRet('58','t264').
actual('58','2','lambda_R_17').
callRet('58','lambda_R_17').
assign('t261','t265').
ptsTo('lambda_R_17','d_lambda_R_17').
heapPtsTo('d_lambda_R_17','prototype','p_lambda_R_17').
prototype('p_lambda_R_17','h_FP').
methodRet('d_lambda_R_17','lambda_R_17').
formal('d_lambda_R_17','1','tab_R_17').
load('t267','chrome','tabs').
load('t268','t267','create').
load('t270','win_R_16','id').
store('t269','windowId','t270').
store('t269','url_R_15','url_R_15').
store('t269','selected_R_?','selectTab_R_15').
actual('59','1','t269').
callRet('59','t269').
assign('t266','t271').
load('t273','chrome','tabs').
load('t274','t273','update').
load('t275','tab_R_17','id').
store('t276','url_R_15','url_R_15').
store('t276','selected_R_?','selectTab_R_15').
actual('60','1','t275').
callRet('60','t275').
actual('60','2','t276').
callRet('60','t276').
assign('t272','t277').
load('t278','localStorage_R_?','key_R_18').
methodRet('d_stringForKey_R_18','t278').
load('t279','localStorage_R_?','key_R_19').
store('localStorage_R_?','key_R_19','value_R_19').
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

