load('t0','window','localStorage').
assign('storageEnabled_R_0','t1').
ptsTo('defaultReaderList_R_1','d_defaultReaderList_R_1').
heapPtsTo('d_defaultReaderList_R_1','prototype','p_defaultReaderList_R_1').
prototype('p_defaultReaderList_R_1','h_FP').
methodRet('d_defaultReaderList_R_1','defaultReaderList_R_1').
ptsTo('isDefaultReader_R_2','d_isDefaultReader_R_2').
heapPtsTo('d_isDefaultReader_R_2','prototype','p_isDefaultReader_R_2').
prototype('p_isDefaultReader_R_2','h_FP').
methodRet('d_isDefaultReader_R_2','isDefaultReader_R_2').
formal('d_isDefaultReader_R_2','1','url_R_2').
ptsTo('i18nReplaceImpl_R_3','d_i18nReplaceImpl_R_3').
heapPtsTo('d_i18nReplaceImpl_R_3','prototype','p_i18nReplaceImpl_R_3').
prototype('p_i18nReplaceImpl_R_3','h_FP').
methodRet('d_i18nReplaceImpl_R_3','i18nReplaceImpl_R_3').
formal('d_i18nReplaceImpl_R_3','1','id_R_3').
formal('d_i18nReplaceImpl_R_3','2','msg_R_3').
formal('d_i18nReplaceImpl_R_3','3','attribute_R_3').
ptsTo('i18nReplace_R_4','d_i18nReplace_R_4').
heapPtsTo('d_i18nReplace_R_4','prototype','p_i18nReplace_R_4').
prototype('p_i18nReplace_R_4','h_FP').
methodRet('d_i18nReplace_R_4','i18nReplace_R_4').
formal('d_i18nReplace_R_4','1','msg_R_4').
load('t3','logLevels_R_0','info').
actual('0','1','t3').
callRet('0','t3').
actual('0','2','Running script at document_start').
callRet('0','Running script at document_start').
assign('t2','t4').
actual('1','1','document').
callRet('1','document').
assign('t5','t6').
load('t8','chrome','extension').
load('t9','t8','sendRequest').
store('t10','msg_R_?','feedDocument').
load('t11','location_R_?','href').
store('t10','href_R_?','t11').
actual('2','1','t10').
callRet('2','t10').
assign('t7','t12').
load('t14','logLevels_R_0','info').
actual('3','1','t14').
callRet('3','t14').
actual('3','2','Running feed finder script').
callRet('3','Running feed finder script').
assign('t13','t15').
assign('t18','t17').
assign('t16','t18').
load('t20','logLevels_R_0','info').
actual('5','1','t20').
callRet('5','t20').
actual('5','2','Document is not a feed, check for <link> tags.').
callRet('5','Document is not a feed, check for <link> tags.').
assign('t19','t21').
assign('t22','t23').
ptsTo('findFeedLinks_R_5','d_findFeedLinks_R_5').
heapPtsTo('d_findFeedLinks_R_5','prototype','p_findFeedLinks_R_5').
prototype('p_findFeedLinks_R_5','h_FP').
methodRet('d_findFeedLinks_R_5','findFeedLinks_R_5').
ptsTo('isFeedDocument_R_6','d_isFeedDocument_R_6').
heapPtsTo('d_isFeedDocument_R_6','prototype','p_isFeedDocument_R_6').
prototype('p_isFeedDocument_R_6','h_FP').
methodRet('d_isFeedDocument_R_6','isFeedDocument_R_6').
assign('maxFeedItems_R_0','10').
assign('maxTitleCount_R_0','1024').
load('t25','window','addEventListener_R_?').
actual('7','1','message').
callRet('7','message').
actual('7','2','lambda_R_7').
callRet('7','lambda_R_7').
actual('7','3','false').
callRet('7','false').
assign('t24','t26').
ptsTo('lambda_R_7','d_lambda_R_7').
heapPtsTo('d_lambda_R_7','prototype','p_lambda_R_7').
prototype('p_lambda_R_7','h_FP').
methodRet('d_lambda_R_7','lambda_R_7').
formal('d_lambda_R_7','1','e_R_7').
ptsTo('buildPreview_R_8','d_buildPreview_R_8').
heapPtsTo('d_buildPreview_R_8','prototype','p_buildPreview_R_8').
prototype('p_buildPreview_R_8','h_FP').
methodRet('d_buildPreview_R_8','buildPreview_R_8').
formal('d_buildPreview_R_8','1','doc_R_8').
store('logLevels_R_0','none','0').
store('logLevels_R_0','error','1').
store('logLevels_R_0','info','2').
assign('logLevels_R_0','__objectInit__').
load('t27','logLevels_R_0','none').
assign('currentLogLevel_R_0','t27').
ptsTo('containsFeed_R_9','d_containsFeed_R_9').
heapPtsTo('d_containsFeed_R_9','prototype','p_containsFeed_R_9').
prototype('p_containsFeed_R_9','h_FP').
methodRet('d_containsFeed_R_9','containsFeed_R_9').
formal('d_containsFeed_R_9','1','doc_R_9').
ptsTo('debugMsg_R_10','d_debugMsg_R_10').
heapPtsTo('d_debugMsg_R_10','prototype','p_debugMsg_R_10').
prototype('p_debugMsg_R_10','h_FP').
methodRet('d_debugMsg_R_10','debugMsg_R_10').
formal('d_debugMsg_R_10','1','loglevel_R_10').
formal('d_debugMsg_R_10','2','text_R_10').
load('t28','location_R_?','search').
load('t29','t28','substring_R_?').
actual('8','1','1').
callRet('8','1').
load('t31','t30','split_R_?').
actual('9','1','&').
callRet('9','&').
assign('queryString_R_0','t32').
load('t33','queryString_R_0','0').
actual('10','1','t33').
callRet('10','t33').
assign('feedUrl_R_0','t34').
load('t35','queryString_R_0','1').
assign('synchronousRequest_R_0','t36').
assign('req_R_0','__undefined__').
assign('styleSheet_R_0','').
assign('frameScript_R_0','').
load('t37','chrome','i18n').
load('t38','t37','getMessage').
actual('11','1','rss_subscription_unknown_feed_name').
callRet('11','rss_subscription_unknown_feed_name').
assign('unknownName_R_0','t39').
assign('feedReaderList_R_0','__undefined__').
ptsTo('navigate_R_11','d_navigate_R_11').
heapPtsTo('d_navigate_R_11','prototype','p_navigate_R_11').
prototype('p_navigate_R_11','h_FP').
methodRet('d_navigate_R_11','navigate_R_11').
ptsTo('main_R_12','d_main_R_12').
heapPtsTo('d_main_R_12','prototype','p_main_R_12').
prototype('p_main_R_12','h_FP').
methodRet('d_main_R_12','main_R_12').
ptsTo('setFeedTitle_R_13','d_setFeedTitle_R_13').
heapPtsTo('d_setFeedTitle_R_13','prototype','p_setFeedTitle_R_13').
prototype('p_setFeedTitle_R_13','h_FP').
methodRet('d_setFeedTitle_R_13','setFeedTitle_R_13').
formal('d_setFeedTitle_R_13','1','title_R_13').
ptsTo('handleError_R_14','d_handleError_R_14').
heapPtsTo('d_handleError_R_14','prototype','p_handleError_R_14').
prototype('p_handleError_R_14','h_FP').
methodRet('d_handleError_R_14','handleError_R_14').
ptsTo('handleFeedParsingFailed_R_15','d_handleFeedParsingFailed_R_15').
heapPtsTo('d_handleFeedParsingFailed_R_15','prototype','p_handleFeedParsingFailed_R_15').
prototype('p_handleFeedParsingFailed_R_15','h_FP').
methodRet('d_handleFeedParsingFailed_R_15','handleFeedParsingFailed_R_15').
formal('d_handleFeedParsingFailed_R_15','1','error_R_15').
ptsTo('createFrame_R_16','d_createFrame_R_16').
heapPtsTo('d_createFrame_R_16','prototype','p_createFrame_R_16').
prototype('p_createFrame_R_16','h_FP').
methodRet('d_createFrame_R_16','createFrame_R_16').
formal('d_createFrame_R_16','1','frame_id_R_16').
formal('d_createFrame_R_16','2','html_R_16').
ptsTo('embedAsIframe_R_17','d_embedAsIframe_R_17').
heapPtsTo('d_embedAsIframe_R_17','prototype','p_embedAsIframe_R_17').
prototype('p_embedAsIframe_R_17','h_FP').
methodRet('d_embedAsIframe_R_17','embedAsIframe_R_17').
formal('d_embedAsIframe_R_17','1','rssText_R_17').
ptsTo('handleResponse_R_19','d_handleResponse_R_19').
heapPtsTo('d_handleResponse_R_19','prototype','p_handleResponse_R_19').
prototype('p_handleResponse_R_19','h_FP').
methodRet('d_handleResponse_R_19','handleResponse_R_19').
ptsTo('onSelectChanged_R_20','d_onSelectChanged_R_20').
heapPtsTo('d_onSelectChanged_R_20','prototype','p_onSelectChanged_R_20').
prototype('p_onSelectChanged_R_20','h_FP').
methodRet('d_onSelectChanged_R_20','onSelectChanged_R_20').
assign('feedData_R_0','__objectInit__').
load('t41','chrome','extension').
load('t42','t41','onRequest').
load('t43','t42','addListener').
actual('12','1','lambda_R_21').
callRet('12','lambda_R_21').
assign('t40','t44').
ptsTo('lambda_R_21','d_lambda_R_21').
heapPtsTo('d_lambda_R_21','prototype','p_lambda_R_21').
prototype('p_lambda_R_21','h_FP').
methodRet('d_lambda_R_21','lambda_R_21').
formal('d_lambda_R_21','1','request_R_21').
formal('d_lambda_R_21','2','sender_R_21').
load('t46','chrome','tabs').
load('t47','t46','onRemoved').
load('t48','t47','addListener').
actual('13','1','lambda_R_22').
callRet('13','lambda_R_22').
assign('t45','t49').
ptsTo('lambda_R_22','d_lambda_R_22').
heapPtsTo('d_lambda_R_22','prototype','p_lambda_R_22').
prototype('p_lambda_R_22','h_FP').
methodRet('d_lambda_R_22','lambda_R_22').
formal('d_lambda_R_22','1','tabId_R_22').
load('t51','chrome','pageAction').
load('t52','t51','onClicked').
load('t53','t52','addListener').
actual('14','1','lambda_R_23').
callRet('14','lambda_R_23').
assign('t50','t54').
ptsTo('lambda_R_23','d_lambda_R_23').
heapPtsTo('d_lambda_R_23','prototype','p_lambda_R_23').
prototype('p_lambda_R_23','h_FP').
methodRet('d_lambda_R_23','lambda_R_23').
formal('d_lambda_R_23','1','tab_R_23').
load('t55','chrome','i18n').
load('t56','t55','getMessage').
actual('15','1','rss_subscription_feed_url_assist').
callRet('15','rss_subscription_feed_url_assist').
assign('assistText_R_0','t57').
assign('t58','1').
assign('editingIndex_R_0','t58').
assign('editingDefault_R_0','false').
ptsTo('main_R_25','d_main_R_25').
heapPtsTo('d_main_R_25','prototype','p_main_R_25').
prototype('p_main_R_25','h_FP').
methodRet('d_main_R_25','main_R_25').
ptsTo('toggleFeedPreview_R_26','d_toggleFeedPreview_R_26').
heapPtsTo('d_toggleFeedPreview_R_26','prototype','p_toggleFeedPreview_R_26').
prototype('p_toggleFeedPreview_R_26','h_FP').
methodRet('d_toggleFeedPreview_R_26','toggleFeedPreview_R_26').
ptsTo('setDefault_R_27','d_setDefault_R_27').
heapPtsTo('d_setDefault_R_27','prototype','p_setDefault_R_27').
prototype('p_setDefault_R_27','h_FP').
methodRet('d_setDefault_R_27','setDefault_R_27').
ptsTo('resetList_R_28','d_resetList_R_28').
heapPtsTo('d_resetList_R_28','prototype','p_resetList_R_28').
prototype('p_resetList_R_28','h_FP').
methodRet('d_resetList_R_28','resetList_R_28').
ptsTo('onSelectionChanged_R_29','d_onSelectionChanged_R_29').
heapPtsTo('d_onSelectionChanged_R_29','prototype','p_onSelectionChanged_R_29').
prototype('p_onSelectionChanged_R_29','h_FP').
methodRet('d_onSelectionChanged_R_29','onSelectionChanged_R_29').
ptsTo('editReader_R_30','d_editReader_R_30').
heapPtsTo('d_editReader_R_30','prototype','p_editReader_R_30').
prototype('p_editReader_R_30','h_FP').
methodRet('d_editReader_R_30','editReader_R_30').
formal('d_editReader_R_30','1','index_R_30').
ptsTo('removeReader_R_31','d_removeReader_R_31').
heapPtsTo('d_removeReader_R_31','prototype','p_removeReader_R_31').
prototype('p_removeReader_R_31','h_FP').
methodRet('d_removeReader_R_31','removeReader_R_31').
ptsTo('showDialog_R_32','d_showDialog_R_32').
heapPtsTo('d_showDialog_R_32','prototype','p_showDialog_R_32').
prototype('p_showDialog_R_32','h_FP').
methodRet('d_showDialog_R_32','showDialog_R_32').
ptsTo('hideDialog_R_33','d_hideDialog_R_33').
heapPtsTo('d_hideDialog_R_33','prototype','p_hideDialog_R_33').
prototype('p_hideDialog_R_33','h_FP').
methodRet('d_hideDialog_R_33','hideDialog_R_33').
ptsTo('validateInput_R_34','d_validateInput_R_34').
heapPtsTo('d_validateInput_R_34','prototype','p_validateInput_R_34').
prototype('p_validateInput_R_34','h_FP').
methodRet('d_validateInput_R_34','validateInput_R_34').
ptsTo('save_R_35','d_save_R_35').
heapPtsTo('d_save_R_35','prototype','p_save_R_35').
prototype('p_save_R_35','h_FP').
methodRet('d_save_R_35','save_R_35').
ptsTo('init_R_36','d_init_R_36').
heapPtsTo('d_init_R_36','prototype','p_init_R_36').
prototype('p_init_R_36','h_FP').
methodRet('d_init_R_36','init_R_36').
assign('t59','t60').
ptsTo('lambda_R_37','d_lambda_R_37').
heapPtsTo('d_lambda_R_37','prototype','p_lambda_R_37').
prototype('p_lambda_R_37','h_FP').
methodRet('d_lambda_R_37','lambda_R_37').
assign('t61','t62').
ptsTo('lambda_R_39','d_lambda_R_39').
heapPtsTo('d_lambda_R_39','prototype','p_lambda_R_39').
prototype('p_lambda_R_39','h_FP').
methodRet('d_lambda_R_39','lambda_R_39').
assign('t63','t64').
ptsTo('lambda_R_41','d_lambda_R_41').
heapPtsTo('d_lambda_R_41','prototype','p_lambda_R_41').
prototype('p_lambda_R_41','h_FP').
methodRet('d_lambda_R_41','lambda_R_41').
assign('t65','t66').
ptsTo('lambda_R_43','d_lambda_R_43').
heapPtsTo('d_lambda_R_43','prototype','p_lambda_R_43').
prototype('p_lambda_R_43','h_FP').
methodRet('d_lambda_R_43','lambda_R_43').
assign('t67','t68').
ptsTo('lambda_R_45','d_lambda_R_45').
heapPtsTo('d_lambda_R_45','prototype','p_lambda_R_45').
prototype('p_lambda_R_45','h_FP').
methodRet('d_lambda_R_45','lambda_R_45').
assign('t69','t70').
ptsTo('lambda_R_47','d_lambda_R_47').
heapPtsTo('d_lambda_R_47','prototype','p_lambda_R_47').
prototype('p_lambda_R_47','h_FP').
methodRet('d_lambda_R_47','lambda_R_47').
assign('t71','t72').
ptsTo('lambda_R_49','d_lambda_R_49').
heapPtsTo('d_lambda_R_49','prototype','p_lambda_R_49').
prototype('p_lambda_R_49','h_FP').
methodRet('d_lambda_R_49','lambda_R_49').
assign('t73','t74').
ptsTo('lambda_R_51','d_lambda_R_51').
heapPtsTo('d_lambda_R_51','prototype','p_lambda_R_51').
prototype('p_lambda_R_51','h_FP').
methodRet('d_lambda_R_51','lambda_R_51').
assign('t75','t76').
ptsTo('lambda_R_53','d_lambda_R_53').
heapPtsTo('d_lambda_R_53','prototype','p_lambda_R_53').
prototype('p_lambda_R_53','h_FP').
methodRet('d_lambda_R_53','lambda_R_53').
assign('t77','t78').
ptsTo('lambda_R_55','d_lambda_R_55').
heapPtsTo('d_lambda_R_55','prototype','p_lambda_R_55').
prototype('p_lambda_R_55','h_FP').
methodRet('d_lambda_R_55','lambda_R_55').
assign('t79','t80').
ptsTo('lambda_R_57','d_lambda_R_57').
heapPtsTo('d_lambda_R_57','prototype','p_lambda_R_57').
prototype('p_lambda_R_57','h_FP').
methodRet('d_lambda_R_57','lambda_R_57').
assign('t81','t82').
ptsTo('lambda_R_59','d_lambda_R_59').
heapPtsTo('d_lambda_R_59','prototype','p_lambda_R_59').
prototype('p_lambda_R_59','h_FP').
methodRet('d_lambda_R_59','lambda_R_59').
ptsTo('feedLink_R_61','d_feedLink_R_61').
heapPtsTo('d_feedLink_R_61','prototype','p_feedLink_R_61').
prototype('p_feedLink_R_61','h_FP').
methodRet('d_feedLink_R_61','feedLink_R_61').
formal('d_feedLink_R_61','1','url_R_61').
ptsTo('main_R_62','d_main_R_62').
heapPtsTo('d_main_R_62','prototype','p_main_R_62').
prototype('p_main_R_62','h_FP').
methodRet('d_main_R_62','main_R_62').
ptsTo('onClick_R_64','d_onClick_R_64').
heapPtsTo('d_onClick_R_64','prototype','p_onClick_R_64').
prototype('p_onClick_R_64','h_FP').
methodRet('d_onClick_R_64','onClick_R_64').
formal('d_onClick_R_64','1','event_R_64').
ptsTo('preview_R_65','d_preview_R_65').
heapPtsTo('d_preview_R_65','prototype','p_preview_R_65').
prototype('p_preview_R_65','h_FP').
methodRet('d_preview_R_65','preview_R_65').
formal('d_preview_R_65','1','feed_url_R_65').
assign('t83','t84').
ptsTo('lambda_R_66','d_lambda_R_66').
heapPtsTo('d_lambda_R_66','prototype','p_lambda_R_66').
prototype('p_lambda_R_66','h_FP').
methodRet('d_lambda_R_66','lambda_R_66').
ptsTo('init_R_68','d_init_R_68').
heapPtsTo('d_init_R_68','prototype','p_init_R_68').
prototype('p_init_R_68','h_FP').
methodRet('d_init_R_68','init_R_68').
assign('t85','t86').
ptsTo('lambda_R_69','d_lambda_R_69').
heapPtsTo('d_lambda_R_69','prototype','p_lambda_R_69').
prototype('p_lambda_R_69','h_FP').
methodRet('d_lambda_R_69','lambda_R_69').
assign('t87','t88').
ptsTo('lambda_R_71','d_lambda_R_71').
heapPtsTo('d_lambda_R_71','prototype','p_lambda_R_71').
prototype('p_lambda_R_71','h_FP').
methodRet('d_lambda_R_71','lambda_R_71').
assign('t89','t90').
ptsTo('lambda_R_73','d_lambda_R_73').
heapPtsTo('d_lambda_R_73','prototype','p_lambda_R_73').
prototype('p_lambda_R_73','h_FP').
methodRet('d_lambda_R_73','lambda_R_73').
store('t92','url','http://www.google.com/reader/view/feed/%s').
store('t92','description','Google Reader').
store('t91','0','t92').
store('t93','url','http://www.google.com/ig/adde?moduleurl=%s').
store('t93','description','iGoogle').
store('t91','1','t93').
store('t94','url','http://www.bloglines.com/login?r=/sub/%s').
store('t94','description','Bloglines').
store('t91','2','t94').
store('t95','url','http://add.my.yahoo.com/rss?url=%s').
store('t95','description','My Yahoo').
store('t91','3','t95').
methodRet('d_defaultReaderList_R_1','t91').
load('t96','window','localStorage').
load('t97','t96','defaultReader').
load('t98','window','localStorage').
load('t99','t98','defaultReader').
assign('(None, "defaultReader_R_?")','t99').
assign('defaultReader_R_?','').
methodRet('d_isDefaultReader_R_2','t100').
load('t101','document','getElementById_R_?').
actual('32','1','id_R_3').
callRet('32','id_R_3').
assign('element_R_3','t102').
assign('t103','element_R_3').
assign('t104','attribute_R_3').
load('t105','element_R_3','innerText').
load('t106','chrome','i18n').
load('t107','t106','getMessage').
actual('33','1','msg_R_3').
callRet('33','msg_R_3').
store('element_R_3','innerText','t108').
load('t110','element_R_3','setAttribute_R_?').
load('t111','chrome','i18n').
load('t112','t111','getMessage').
actual('34','1','msg_R_3').
callRet('34','msg_R_3').
actual('35','1','attribute_R_3').
callRet('35','attribute_R_3').
actual('35','2','t113').
callRet('35','t113').
assign('t109','t114').
actual('36','1','msg_R_4').
callRet('36','msg_R_4').
actual('36','2','msg_R_4').
callRet('36','msg_R_4').
actual('36','3','').
callRet('36','None').
assign('t115','t116').
load('t117','document','evaluate_R_?').
actual('37','1','t119').
callRet('37','t119').
actual('37','2','document').
callRet('37','document').
actual('37','3','null').
callRet('37','null').
actual('37','4','0').
callRet('37','0').
actual('37','5','null').
callRet('37','null').
assign('result_R_5','t120').
assign('feeds_R_5','feeds_R_5').
assign('item_R_5','__undefined__').
assign('count_R_5','0').
load('t121','result_R_5','iterateNext_R_?').
assign('item_R_5','t122').
load('t124','feeds_R_5','push_R_?').
load('t126','item_R_5','href').
store('t125','href','t126').
load('t127','item_R_5','title').
store('t125','title','t127').
actual('39','1','t125').
callRet('39','t125').
assign('t123','t128').
assign('t130','count_R_5').
assign('t129','t130').
assign('t131','t132').
load('t134','chrome','extension').
load('t135','t134','sendRequest').
store('t136','msg_R_?','feedIcon').
store('t136','feeds_R_5','feeds_R_5').
actual('40','1','t136').
callRet('40','t136').
assign('t133','t137').
load('t138','document','body').
assign('body_R_6','t138').
load('t140','logLevels_R_0','info').
actual('41','1','t140').
callRet('41','t140').
actual('41','2','Checking if document is feed').
callRet('41','Checking if document is feed').
assign('t139','t141').
assign('soleTagInBody_R_6','').
load('t143','body_R_6','childElementCount').
assign('t142','t145').
load('t146','body_R_6','children').
load('t147','t146','0').
load('t148','t147','tagName').
assign('soleTagInBody_R_6','t148').
load('t150','logLevels_R_0','info').
actual('42','1','t150').
callRet('42','t150').
actual('42','2','t151').
callRet('42','t151').
assign('t149','t152').
assign('t153','t158').
load('t160','logLevels_R_0','info').
actual('43','1','t160').
callRet('43','t160').
actual('43','2','t161').
callRet('43','t161').
assign('t159','t162').
load('t164','chrome','extension').
load('t165','t164','sendRequest').
store('t166','msg_R_?','feedDocument').
load('t167','location_R_?','href').
store('t166','href_R_?','t167').
actual('44','1','t166').
callRet('44','t166').
assign('t163','t168').
methodRet('d_isFeedDocument_R_6','true').
assign('t169','t170').
load('t172','logLevels_R_0','info').
actual('45','1','t172').
callRet('45','t172').
actual('45','2','Found feed: Wrapped in PRE').
callRet('45','Found feed: Wrapped in PRE').
assign('t171','t173').
ptsTo('t174','n_DOMParser_R_?_0').
prototype('n_DOMParser_R_?_0', 'p_DOMParser_R_?').
assign('domParser_R_6','t174').
load('t175','domParser_R_6','parseFromString_R_?').
load('t176','body_R_6','textContent').
actual('46','1','t176').
callRet('46','t176').
actual('46','2','text/xml').
callRet('46','text/xml').
assign('doc_R_6','t177').
load('t179','logLevels_R_0','error').
assign('t178','t180').
load('t181','doc_R_6','getElementsByTagName_R_?').
actual('47','1','parsererror').
callRet('47','parsererror').
assign('error_R_6','t182').
load('t184','error_R_6','length').
assign('t183','t184').
load('t186','logLevels_R_0','error').
load('t187','doc_R_6','childNodes').
load('t188','t187','0').
load('t189','t188','outerHTML').
actual('48','1','t186').
callRet('48','t186').
actual('48','2','t190').
callRet('48','t190').
assign('t185','t191').
actual('49','1','doc_R_6').
callRet('49','doc_R_6').
assign('t192','t193').
load('t195','chrome','extension').
load('t196','t195','sendRequest').
store('t197','msg_R_?','feedDocument').
load('t198','location_R_?','href').
store('t197','href_R_?','t198').
actual('50','1','t197').
callRet('50','t197').
assign('t194','t199').
methodRet('d_isFeedDocument_R_6','true').
load('t201','logLevels_R_0','info').
actual('51','1','t201').
callRet('51','t201').
actual('51','2','Exiting: feed is not a feed document').
callRet('51','Exiting: feed is not a feed document').
assign('t200','t202').
methodRet('d_isFeedDocument_R_6','false').
ptsTo('t203','n_DOMParser_R_?_1').
prototype('n_DOMParser_R_?_1', 'p_DOMParser_R_?').
assign('parser_R_7','t203').
load('t204','parser_R_7','parseFromString_R_?').
load('t205','e_R_7','data').
actual('52','1','t205').
callRet('52','t205').
actual('52','2','text/xml').
callRet('52','text/xml').
assign('doc_R_7','t206').
assign('t207','doc_R_7').
actual('53','1','doc_R_7').
callRet('53','doc_R_7').
assign('t208','t209').
load('t210','document','createElement_R_?').
actual('54','1','table').
callRet('54','table').
assign('table_R_8','t211').
load('t212','document','createElement').
actual('55','1','tbody').
callRet('55','tbody').
assign('tbody_R_8','t213').
load('t215','table_R_8','appendChild_R_?').
actual('56','1','tbody_R_8').
callRet('56','tbody_R_8').
assign('t214','t216').
load('t217','doc_R_8','getElementsByTagName_R_?').
actual('57','1','entry').
callRet('57','entry').
assign('entries_R_8','t218').
load('t220','entries_R_8','length').
assign('t219','t221').
load('t222','doc_R_8','getElementsByTagName').
actual('58','1','item').
callRet('58','item').
assign('entries_R_8','t223').
load('t225','entries_R_8','length').
assign('t224','t228').
assign('i_R_?','0').
assign('t230','i_R_?').
assign('t229','t230').
load('t231','entries_R_8','item_R_?').
actual('59','1','i_R_?').
callRet('59','i_R_?').
assign('item_R_?','t232').
load('t233','item_R_?','getElementsByTagName').
actual('60','1','title').
callRet('60','title').
load('t235','t234','0').
assign('itemTitle_R_8','t235').
assign('t236','itemTitle_R_8').
assign('itemTitle_R_8','Unknown title').
load('t237','itemTitle_R_8','textContent').
assign('itemTitle_R_8','t237').
load('t239','itemTitle_R_8','length').
assign('t238','t240').
load('t241','itemTitle_R_8','substring_R_?').
actual('61','1','0').
callRet('61','0').
actual('61','2','maxTitleCount_R_0').
callRet('61','maxTitleCount_R_0').
assign('itemTitle_R_8','t243').
load('t244','item_R_?','getElementsByTagName').
actual('62','1','description').
callRet('62','description').
load('t246','t245','0').
assign('itemDesc_R_8','t246').
assign('t248','itemDesc_R_8').
assign('t247','t248').
load('t249','item_R_?','getElementsByTagName').
actual('63','1','summary').
callRet('63','summary').
load('t251','t250','0').
assign('itemDesc_R_8','t251').
assign('t253','itemDesc_R_8').
assign('t252','t253').
load('t254','item_R_?','getElementsByTagName').
actual('64','1','content').
callRet('64','content').
load('t256','t255','0').
assign('itemDesc_R_8','t256').
assign('t257','itemDesc_R_8').
assign('itemDesc_R_8','').
load('t258','itemDesc_R_8','textContent').
assign('itemDesc_R_8','t258').
load('t259','item_R_?','getElementsByTagName').
actual('65','1','link').
callRet('65','link').
assign('itemLink_R_8','t260').
assign('link_R_8','').
load('t262','itemLink_R_8','length').
assign('t261','t263').
load('t264','itemLink_R_8','0').
load('t265','t264','childNodes').
load('t266','t265','0').
assign('link_R_8','t266').
assign('t267','link_R_8').
load('t268','itemLink_R_8','0').
load('t269','t268','getAttribute_R_?').
actual('66','1','href').
callRet('66','href').
assign('link_R_8','t270').
load('t271','itemLink_R_8','0').
load('t272','t271','childNodes').
load('t273','t272','0').
load('t274','t273','nodeValue').
assign('link_R_8','t274').
load('t275','document','createElement').
actual('67','1','tr').
callRet('67','tr').
assign('tr_R_8','t276').
load('t277','document','createElement').
actual('68','1','td').
callRet('68','td').
assign('td_R_8','t278').
load('t280','document','createElement').
actual('69','1','a').
callRet('69','a').
load('t282','document','createElement').
actual('70','1','strong').
callRet('70','strong').
assign('(None, "anchor_R_8")','t281').
assign('anchor_R_8','t283').
load('t284','anchor_R_8','id').
actual('71','1','i_R_?').
callRet('71','i_R_?').
store('anchor_R_8','id','t286').
assign('t287','t288').
load('t289','anchor_R_8','href').
store('anchor_R_8','href','link_R_8').
load('t290','anchor_R_8','innerHTML').
store('anchor_R_8','innerHTML','itemTitle_R_8').
load('t291','anchor_R_8','target').
store('anchor_R_8','target','_top').
load('t292','anchor_R_8','className').
store('anchor_R_8','className','item_title').
load('t293','document','createElement').
actual('72','1','span').
callRet('72','span').
assign('span_R_8','t294').
load('t295','span_R_8','id').
actual('73','1','i_R_?').
callRet('73','i_R_?').
store('span_R_8','id','t297').
load('t298','span_R_8','className').
store('span_R_8','className','item_desc').
load('t299','span_R_8','innerHTML').
store('span_R_8','innerHTML','itemDesc_R_8').
load('t301','td_R_8','appendChild').
actual('74','1','anchor_R_8').
callRet('74','anchor_R_8').
assign('t300','t302').
load('t304','td_R_8','appendChild').
load('t305','document','createElement').
actual('75','1','br').
callRet('75','br').
actual('76','1','t306').
callRet('76','t306').
assign('t303','t307').
load('t309','td_R_8','appendChild').
actual('77','1','span_R_8').
callRet('77','span_R_8').
assign('t308','t310').
load('t312','td_R_8','appendChild').
load('t313','document','createElement').
actual('78','1','br').
callRet('78','br').
actual('79','1','t314').
callRet('79','t314').
assign('t311','t315').
load('t317','td_R_8','appendChild').
load('t318','document','createElement').
actual('80','1','br').
callRet('80','br').
actual('81','1','t319').
callRet('81','t319').
assign('t316','t320').
load('t322','tr_R_8','appendChild').
actual('82','1','td_R_8').
callRet('82','td_R_8').
assign('t321','t323').
load('t325','tbody_R_8','appendChild').
actual('83','1','tr_R_8').
callRet('83','tr_R_8').
assign('t324','t326').
load('t328','table_R_8','appendChild').
actual('84','1','tbody_R_8').
callRet('84','tbody_R_8').
assign('t327','t329').
load('t331','document','body').
load('t332','t331','appendChild').
actual('85','1','table_R_8').
callRet('85','table_R_8').
assign('t330','t333').
load('t335','logLevels_R_0','info').
actual('86','1','t335').
callRet('86','t335').
actual('86','2','containsFeed called').
callRet('86','containsFeed called').
assign('t334','t336').
load('t337','doc_R_9','evaluate_R_?').
actual('87','1','//*[local-name()="rss" or local-name()="feed" or local-name()="RDF"]').
callRet('87','//*[local-name()="rss" or local-name()="feed" or local-name()="RDF"]').
actual('87','2','doc_R_9').
callRet('87','doc_R_9').
actual('87','3','null').
callRet('87','null').
actual('87','4','0').
callRet('87','0').
actual('87','5','null').
callRet('87','null').
assign('result_R_9','t338').
assign('t340','result_R_9').
assign('t339','t340').
load('t342','logLevels_R_0','info').
actual('88','1','t342').
callRet('88','t342').
actual('88','2','exiting: document.evaluate returned no results').
callRet('88','exiting: document.evaluate returned no results').
assign('t341','t343').
methodRet('d_containsFeed_R_9','false').
load('t344','result_R_9','iterateNext_R_?').
assign('node_R_9','t345').
assign('t347','node_R_9').
assign('t346','t347').
load('t349','logLevels_R_0','info').
actual('90','1','t349').
callRet('90','t349').
actual('90','2','returning: iterateNext() returned no nodes').
callRet('90','returning: iterateNext() returned no nodes').
assign('t348','t350').
methodRet('d_containsFeed_R_9','false').
load('t352','node_R_9','parentElement').
load('t353','node_R_9','parentElement').
load('t354','t353','tagName').
assign('t351','t356').
load('t358','logLevels_R_0','info').
actual('91','1','t358').
callRet('91','t358').
actual('91','2','exiting: parentElement that"s not BODY').
callRet('91','exiting: parentElement that"s not BODY').
assign('t357','t359').
methodRet('d_containsFeed_R_9','false').
load('t361','logLevels_R_0','info').
actual('92','1','t361').
callRet('92','t361').
actual('92','2','Found feed').
callRet('92','Found feed').
assign('t360','t362').
methodRet('d_containsFeed_R_9','true').
assign('t363','t364').
load('t366','console','log_R_?').
actual('93','1','t367').
callRet('93','t367').
assign('t365','t368').
load('t369','document','getElementById_R_?').
actual('94','1','readerDropdown').
callRet('94','readerDropdown').
assign('select_R_11','t370').
load('t371','select_R_11','selectedIndex').
load('t372','feedReaderList_R_0','t371').
load('t373','t372','url').
load('t374','t373','replace_R_?').
actual('95','1','feedUrl_R_0').
callRet('95','feedUrl_R_0').
actual('96','1','%s').
callRet('96','%s').
actual('96','2','t375').
callRet('96','t375').
assign('url_R_11','t376').
assign('t377','storageEnabled_R_0').
load('t378','document','getElementById').
actual('97','1','alwaysUse').
callRet('97','alwaysUse').
assign('alwaysUse_R_11','t379').
load('t381','alwaysUse_R_11','checked').
assign('t380','t381').
load('t382','window','localStorage').
load('t383','t382','defaultReader').
load('t384','select_R_11','selectedIndex').
load('t385','feedReaderList_R_0','t384').
load('t386','t385','url').
store('t382','defaultReader','t386').
load('t387','window','localStorage').
load('t388','t387','showPreviewPage').
store('t387','showPreviewPage','No').
load('t389','document','location').
store('document','location','url_R_11').
load('t391','window','localStorage').
load('t392','t391','readerList').
assign('t390','t393').
load('t394','JSON_R_?','parse_R_?').
load('t395','window','localStorage').
load('t396','t395','readerList').
actual('98','1','t396').
callRet('98','t396').
assign('feedReaderList_R_0','t397').
assign('t399','feedReaderList_R_0').
assign('t398','t399').
assign('feedReaderList_R_0','t400').
load('t401','document','getElementById_R_?').
actual('100','1','readerDropdown').
callRet('100','readerDropdown').
assign('readerDropdown_R_12','t402').
load('t404','feedReaderList_R_0','length').
assign('t403','t405').
assign('i_R_?','0').
assign('t407','i_R_?').
assign('t406','t407').
load('t408','readerDropdown_R_12','options').
load('t409','t408','i_R_?').
load('t410','feedReaderList_R_0','i_R_?').
load('t411','t410','description').
ptsTo('t412','n_Option_R_?_2').
prototype('n_Option_R_?_2', 'p_Option_R_?').
actual('101','1','t411').
callRet('101','t411').
actual('101','2','i_R_?').
callRet('101','i_R_?').
store('t408','i_R_?','t412').
load('t414','feedReaderList_R_0','i_R_?').
load('t415','t414','url').
actual('101','1','t415').
callRet('101','t415').
assign('t413','t417').
load('t418','readerDropdown_R_12','selectedIndex').
store('readerDropdown_R_12','selectedIndex','i_R_?').
assign('t419','storageEnabled_R_0').
load('t420','readerDropdown_R_12','options').
load('t421','t420','i_R_?').
load('t422','chrome','i18n').
load('t423','t422','getMessage').
actual('102','1','rss_subscription_manage_label').
callRet('102','rss_subscription_manage_label').
ptsTo('t425','n_Option_R_?_3').
prototype('n_Option_R_?_3', 'p_Option_R_?').
actual('103','1','t424').
callRet('103','t424').
actual('103','2','').
callRet('103','None').
store('t420','i_R_?','t425').
load('t426','document','getElementById').
load('t427','t426','alwaysUseSpan').
load('t428','t427','style').
load('t429','t428','display').
store('t428','display','block').
ptsTo('t430','n_XMLHttpRequest_R_?_4').
prototype('n_XMLHttpRequest_R_?_4', 'p_XMLHttpRequest_R_?').
assign('req_R_0','t430').
assign('t431','synchronousRequest_R_0').
load('t432','chrome','extension').
load('t433','t432','getURL').
actual('103','1','style.css').
callRet('103','style.css').
assign('styleSheet_R_0','t436').
load('t437','chrome','extension').
load('t438','t437','getURL').
actual('104','1','iframe.js').
callRet('104','iframe.js').
assign('frameScript_R_0','t442').
load('t444','req_R_0','open_R_?').
actual('105','1','GET').
callRet('105','GET').
actual('105','2','style.css').
callRet('105','style.css').
actual('105','3','false').
callRet('105','false').
assign('t443','t445').
load('t447','req_R_0','send_R_?').
actual('106','1','null').
callRet('106','null').
assign('t446','t448').
load('t449','req_R_0','responseText').
assign('styleSheet_R_0','t451').
load('t453','req_R_0','open').
actual('107','1','GET').
callRet('107','GET').
actual('107','2','iframe.js').
callRet('107','iframe.js').
actual('107','3','false').
callRet('107','false').
assign('t452','t454').
load('t456','req_R_0','send').
actual('108','1','null').
callRet('108','null').
assign('t455','t457').
load('t458','req_R_0','responseText').
assign('frameScript_R_0','t461').
load('t462','req_R_0','onload').
store('req_R_0','onload','handleResponse_R_?').
load('t463','req_R_0','onerror').
store('req_R_0','onerror','handleError_R_?').
load('t465','req_R_0','overrideMimeType_R_?').
actual('109','1','text/xml').
callRet('109','text/xml').
assign('t464','t466').
load('t468','req_R_0','open').
assign('t469','synchronousRequest_R_0').
actual('110','1','GET').
callRet('110','GET').
actual('110','2','feedUrl_R_0').
callRet('110','feedUrl_R_0').
actual('110','3','t469').
callRet('110','t469').
assign('t467','t470').
load('t472','req_R_0','send').
actual('111','1','null').
callRet('111','null').
assign('t471','t473').
load('t474','document','getElementById').
load('t475','t474','feedUrl').
load('t476','t475','href').
store('t475','href','t477').
load('t478','document','getElementById_R_?').
actual('112','1','title').
callRet('112','title').
assign('titleTag_R_13','t479').
load('t480','titleTag_R_13','textContent').
load('t481','chrome','i18n').
load('t482','t481','getMessage').
actual('113','1','rss_subscription_feed_for').
callRet('113','rss_subscription_feed_for').
actual('113','2','title_R_13').
callRet('113','title_R_13').
store('titleTag_R_13','textContent','t483').
load('t485','chrome','i18n').
load('t486','t485','getMessage').
actual('114','1','rss_subscription_error_fetching').
callRet('114','rss_subscription_error_fetching').
actual('115','1','t487').
callRet('115','t487').
assign('t484','t488').
actual('116','1','unknownName_R_0').
callRet('116','unknownName_R_0').
assign('t489','t490').
assign('html_R_15','t492').
actual('117','1','error').
callRet('117','error').
actual('117','2','html_R_15').
callRet('117','html_R_15').
assign('error_frame_R_15','t493').
load('t494','document','getElementById_R_?').
actual('118','1','items').
callRet('118','items').
assign('itemsTag_R_15','t495').
load('t497','itemsTag_R_15','appendChild_R_?').
actual('119','1','error_frame_R_15').
callRet('119','error_frame_R_15').
assign('t496','t498').
load('t499','document','createElement_R_?').
actual('120','1','iframe').
callRet('120','iframe').
assign('frame_R_?','t500').
load('t501','frame_R_?','id').
store('frame_R_?','id','frame_id_R_16').
load('t502','frame_R_?','src').
store('frame_R_?','src','t505').
load('t506','frame_R_?','scrolling').
store('frame_R_?','scrolling','auto').
load('t507','frame_R_?','frameBorder').
store('frame_R_?','frameBorder','0').
load('t508','frame_R_?','marginWidth').
store('frame_R_?','marginWidth','0').
methodRet('d_createFrame_R_16','frame_R_?').
load('t509','document','getElementById_R_?').
actual('121','1','items').
callRet('121','items').
assign('itemsTag_R_17','t510').
actual('122','1','rss').
callRet('122','rss').
actual('122','2','t511').
callRet('122','t511').
assign('iframe_R_?','t512').
load('t514','itemsTag_R_17','appendChild_R_?').
actual('123','1','iframe_R_?').
callRet('123','iframe_R_?').
assign('t513','t515').
load('t516','iframe_R_?','onload').
store('iframe_R_?','onload','lambda_R_18').
ptsTo('lambda_R_18','d_lambda_R_18').
heapPtsTo('d_lambda_R_18','prototype','p_lambda_R_18').
prototype('p_lambda_R_18','h_FP').
methodRet('d_lambda_R_18','lambda_R_18').
load('t518','iframe_R_?','contentWindow').
load('t519','t518','postMessage_R_?').
actual('124','1','rssText_R_17').
callRet('124','rssText_R_17').
actual('124','2','*').
callRet('124','*').
assign('t517','t520').
load('t521','req_R_0','responseXML').
assign('doc_R_19','t521').
assign('t523','doc_R_19').
assign('t522','t523').
ptsTo('t524','n_DOMParser_R_?_5').
prototype('n_DOMParser_R_?_5', 'p_DOMParser_R_?').
assign('domParser_R_19','t524').
load('t525','domParser_R_19','parseFromString_R_?').
load('t526','req_R_0','responseText').
actual('125','1','t526').
callRet('125','t526').
actual('125','2','text/xml').
callRet('125','text/xml').
assign('doc_R_19','t527').
assign('t529','doc_R_19').
assign('t528','t529').
load('t531','chrome','i18n').
load('t532','t531','getMessage').
actual('126','1','rss_subscription_not_valid_feed').
callRet('126','rss_subscription_not_valid_feed').
actual('127','1','t533').
callRet('127','t533').
assign('t530','t534').
methodRet('d_handleResponse_R_19','null').
load('t535','doc_R_19','getElementsByTagName_R_?').
actual('128','1','entry').
callRet('128','entry').
assign('entries_R_19','t536').
load('t538','entries_R_19','length').
assign('t537','t539').
load('t540','doc_R_19','getElementsByTagName').
actual('129','1','item').
callRet('129','item').
assign('entries_R_19','t541').
load('t543','entries_R_19','length').
assign('t542','t544').
load('t546','chrome','i18n').
load('t547','t546','getMessage').
actual('130','1','rss_subscription_no_entries').
callRet('130','rss_subscription_no_entries').
actual('131','1','t548').
callRet('131','t548').
assign('t545','t549').
methodRet('d_handleResponse_R_19','null').
load('t550','doc_R_19','getElementsByTagName').
actual('132','1','title').
callRet('132','title').
load('t552','t551','0').
assign('title_R_19','t552').
assign('t553','title_R_19').
actual('133','1','unknownName_R_0').
callRet('133','unknownName_R_0').
assign('t554','t555').
load('t557','title_R_19','textContent').
actual('134','1','t557').
callRet('134','t557').
assign('t556','t558').
load('t560','req_R_0','responseText').
actual('135','1','t560').
callRet('135','t560').
assign('t559','t561').
assign('t563','storageEnabled_R_0').
assign('t562','t563').
methodRet('d_onSelectChanged_R_20','null').
load('t564','document','getElementById_R_?').
actual('136','1','readerDropdown').
callRet('136','readerDropdown').
assign('readerDropdown_R_20','t565').
load('t566','readerDropdown_R_20','selectedIndex').
assign('oldSelection_R_20','t566').
load('t568','readerDropdown_R_20','selectedIndex').
load('t569','readerDropdown_R_20','length').
assign('t567','t571').
load('t572','window','location').
store('window','location','options.html').
load('t574','request_R_21','msg').
assign('t573','t575').
load('t577','request_R_21','msg').
assign('t576','t578').
load('t580','chrome','tabs').
load('t581','t580','executeScript').
load('t582','sender_R_21','tab').
load('t583','t582','id').
store('t584','code_R_?','t585').
actual('137','1','t583').
callRet('137','t583').
actual('137','2','t584').
callRet('137','t584').
assign('t579','t586').
load('t587','request_R_21','href').
actual('138','1','t587').
callRet('138','t587').
assign('url_R_21','t589').
load('t590','chrome','extension').
load('t591','t590','getURL').
actual('139','1','url_R_21').
callRet('139','url_R_21').
assign('url_R_21','t592').
load('t594','chrome','tabs').
load('t595','t594','create').
store('t596','url_R_21','url_R_21').
load('t597','sender_R_21','tab').
load('t598','t597','index').
store('t596','index_R_?','t598').
actual('140','1','t596').
callRet('140','t596').
assign('t593','t599').
load('t600','feedData_R_0','sender_R_21').
load('t601','t600','tab').
load('t602','t601','id').
load('t603','request_R_21','feeds').
store('t601','id','t603').
load('t605','chrome','pageAction').
load('t606','t605','setTitle').
load('t608','sender_R_21','tab').
load('t609','t608','id').
store('t607','tabId_R_?','t609').
load('t610','chrome','i18n').
load('t611','t610','getMessage').
actual('141','1','rss_subscription_action_title').
callRet('141','rss_subscription_action_title').
store('t607','title_R_?','t612').
actual('142','1','t607').
callRet('142','t607').
assign('t604','t613').
load('t615','chrome','pageAction').
load('t616','t615','show').
load('t617','sender_R_21','tab').
load('t618','t617','id').
actual('143','1','t618').
callRet('143','t618').
assign('t614','t619').
load('t621','feedData_R_0','tabId_R_22').
assign('t620','t621').
load('t623','chrome','windows').
load('t624','t623','get').
load('t625','tab_R_23','windowId').
actual('144','1','t625').
callRet('144','t625').
actual('144','2','lambda_R_24').
callRet('144','lambda_R_24').
assign('t622','t626').
ptsTo('lambda_R_24','d_lambda_R_24').
heapPtsTo('d_lambda_R_24','prototype','p_lambda_R_24').
prototype('p_lambda_R_24','h_FP').
methodRet('d_lambda_R_24','lambda_R_24').
formal('d_lambda_R_24','1','window_R_24').
load('t628','window','focused').
assign('t627','t628').
load('t629','tab_R_23','id').
load('t630','feedData_R_0','t629').
load('t631','t630','0').
load('t632','t631','href').
actual('145','1','t632').
callRet('145','t632').
assign('url_R_24','t634').
load('t636','chrome','tabs').
load('t637','t636','create').
store('t638','url_R_24','url_R_24').
load('t639','window','id').
store('t638','windowId','t639').
actual('146','1','t638').
callRet('146','t638').
assign('t635','t640').
load('t641','document','title').
load('t642','chrome','i18n').
load('t643','t642','getMessage').
actual('147','1','rss_subscription_edit_dialog_title').
callRet('147','rss_subscription_edit_dialog_title').
store('document','title','t644').
load('t645','document','getElementById_R_?').
load('t646','t645','dialogBackground').
load('t647','t646','style').
load('t648','t647','display').
store('t647','display','none').
load('t649','document','getElementById').
load('t650','t649','editReader').
load('t651','t650','disabled').
store('t650','disabled','true').
load('t652','document','getElementById').
load('t653','t652','removeReader').
load('t654','t653','disabled').
store('t653','disabled','true').
load('t655','document','getElementById').
load('t656','t655','setDefault').
load('t657','t656','disabled').
store('t656','disabled','true').
assign('t659','storageEnabled_R_0').
assign('t658','t659').
load('t660','document','getElementById').
load('t661','t660','addReader').
load('t662','t661','disabled').
store('t661','disabled','true').
load('t663','document','getElementById').
load('t664','t663','readerListbox').
load('t665','t664','disabled').
store('t664','disabled','true').
load('t666','document','getElementById').
load('t667','t666','alwaysUseDefault').
load('t668','t667','disabled').
store('t667','disabled','true').
load('t669','document','getElementById').
load('t670','t669','resetList').
load('t671','t670','disabled').
store('t670','disabled','true').
load('t673','chrome','i18n').
load('t674','t673','getMessage').
actual('148','1','rss_subscription_no_localstorage').
callRet('148','rss_subscription_no_localstorage').
actual('149','1','t675').
callRet('149','t675').
assign('t672','t676').
methodRet('d_main_R_25','null').
assign('feedReaderList_R_25','__undefined__').
load('t678','window','localStorage').
load('t679','t678','readerList').
assign('t677','t679').
assign('feedReaderList_R_25','t680').
load('t681','window','localStorage').
load('t682','t681','readerList').
load('t683','JSON_R_?','stringify_R_?').
actual('151','1','feedReaderList_R_25').
callRet('151','feedReaderList_R_25').
store('t681','readerList','t684').
load('t685','JSON_R_?','parse_R_?').
load('t686','window','localStorage').
load('t687','t686','readerList').
actual('152','1','t687').
callRet('152','t687').
assign('feedReaderList_R_25','t688').
actual('153','1','').
callRet('153','None').
load('t691','feedReaderList_R_25','length').
assign('t689','t693').
load('t694','window','localStorage').
load('t695','t694','defaultReader').
load('t696','feedReaderList_R_25','0').
load('t697','t696','url').
store('t694','defaultReader','t697').
load('t698','document','getElementById').
actual('154','1','readerListbox').
callRet('154','readerListbox').
assign('readerListbox_R_25','t699').
load('t701','readerListbox_R_25','options').
load('t702','t701','length').
assign('t700','t703').
load('t705','readerListbox_R_25','remove_R_?').
actual('155','1','0').
callRet('155','0').
assign('t704','t706').
load('t708','feedReaderList_R_25','length').
assign('t707','t709').
assign('i_R_?','0').
assign('t711','i_R_?').
assign('t710','t711').
load('t712','feedReaderList_R_25','i_R_?').
load('t713','t712','description').
assign('description_R_25','t713').
load('t715','feedReaderList_R_25','i_R_?').
load('t716','t715','url').
actual('156','1','t716').
callRet('156','t716').
assign('t714','t717').
load('t718','chrome','i18n').
load('t719','t718','getMessage').
actual('157','1','rss_subscription_default').
callRet('157','rss_subscription_default').
assign('description_R_25','t721').
load('t723','readerListbox_R_25','add_R_?').
load('t724','feedReaderList_R_25','i_R_?').
load('t725','t724','url').
ptsTo('t726','n_Option_R_?_6').
prototype('n_Option_R_?_6', 'p_Option_R_?').
actual('158','1','description_R_25').
callRet('158','description_R_25').
actual('158','2','t725').
callRet('158','t725').
actual('158','1','t726').
callRet('158','t726').
assign('t722','t727').
load('t728','document','getElementById').
actual('159','1','alwaysUseDefault').
callRet('159','alwaysUseDefault').
assign('skipPreview_R_25','t729').
load('t730','skipPreview_R_25','checked').
load('t731','window','localStorage').
load('t732','t731','showPreviewPage').
store('skipPreview_R_25','checked','t733').
load('t734','document','getElementById_R_?').
actual('160','1','alwaysUseDefault').
callRet('160','alwaysUseDefault').
assign('alwaysUseDefault_R_26','t735').
load('t737','alwaysUseDefault_R_26','checked').
assign('t736','t737').
load('t739','window','localStorage').
load('t740','t739','showPreviewPage').
assign('t738','t740').
load('t741','window','localStorage').
load('t742','t741','showPreviewPage').
store('t741','showPreviewPage','No').
load('t743','document','getElementById_R_?').
actual('161','1','readerListbox').
callRet('161','readerListbox').
assign('readerListbox_R_27','t744').
load('t745','readerListbox_R_27','options').
load('t746','readerListbox_R_27','selectedIndex').
load('t747','t745','t746').
assign('selection_R_27','t747').
load('t748','window','localStorage').
load('t749','t748','defaultReader').
load('t750','selection_R_27','value').
store('t748','defaultReader','t750').
assign('t751','t752').
load('t754','chrome','i18n').
load('t755','t754','getMessage').
actual('163','1','rss_subscription_reset_list_confirm').
callRet('163','rss_subscription_reset_list_confirm').
actual('164','1','t756').
callRet('164','t756').
assign('t758','t757').
assign('t753','t758').
methodRet('d_resetList_R_28','null').
load('t760','window','localStorage').
load('t761','t760','readerList').
assign('t759','t761').
load('t763','window','localStorage').
load('t764','t763','defaultReader').
assign('t762','t764').
load('t766','window','localStorage').
load('t767','t766','showPreviewPage').
assign('t765','t767').
assign('t768','t769').
load('t770','readerListbox_R_?','selectedIndex').
assign('t771','1').
assign('selected_R_29','t772').
load('t773','document','getElementById_R_?').
load('t774','t773','editReader').
load('t775','t774','disabled').
assign('t776','selected_R_29').
store('t774','disabled','t776').
load('t777','document','getElementById').
load('t778','t777','setDefault').
load('t779','t778','disabled').
assign('t780','selected_R_29').
load('t781','readerListbox_R_?','selectedIndex').
load('t782','readerListbox_R_?','t781').
load('t783','t782','value').
actual('166','1','t783').
callRet('166','t783').
store('t778','disabled','t785').
load('t786','document','getElementById').
load('t787','t786','removeReader').
load('t788','t787','disabled').
assign('t789','selected_R_29').
load('t790','readerListbox_R_?','options').
load('t791','t790','length').
store('t787','disabled','t793').
load('t794','document','getElementById_R_?').
actual('167','1','readerListbox').
callRet('167','readerListbox').
assign('readerListbox_R_30','t795').
assign('t797','1').
assign('t796','t798').
assign('t799','t800').
load('t801','readerListbox_R_30','selectedIndex').
assign('editingIndex_R_0','t801').
load('t802','readerListbox_R_30','options').
load('t803','t802','editingIndex_R_0').
assign('oldOption_R_30','t803').
load('t804','document','getElementById').
load('t805','t804','urlText').
load('t806','t805','value').
load('t807','oldOption_R_30','value').
store('t805','value','t807').
load('t808','document','getElementById').
load('t809','t808','descriptionText').
load('t810','t809','value').
load('t811','oldOption_R_30','text').
load('t812','t811','replace_R_?').
load('t813','chrome','i18n').
load('t814','t813','getMessage').
actual('168','1','rss_subscription_default').
callRet('168','rss_subscription_default').
actual('169','1','t816').
callRet('169','t816').
actual('169','2','').
callRet('169','None').
store('t809','value','t817').
load('t818','oldOption_R_30','value').
actual('170','1','t818').
callRet('170','t818').
assign('editingDefault_R_0','t819').
load('t820','document','getElementById').
load('t821','t820','urlText').
load('t822','t821','value').
store('t821','value','').
load('t823','document','getElementById').
load('t824','t823','descriptionText').
load('t825','t824','value').
store('t824','value','').
assign('t826','1').
assign('editingIndex_R_0','t826').
assign('editingDefault_R_0','true').
assign('t827','t828').
load('t829','readerListbox_R_?','selectedIndex').
assign('index_R_31','t829').
load('t830','JSON_R_?','parse_R_?').
load('t831','window','localStorage').
load('t832','t831','readerList').
actual('172','1','t832').
callRet('172','t832').
assign('feedReaderList_R_31','t833').
load('t834','chrome','i18n').
load('t835','t834','getMessage').
load('t836','feedReaderList_R_31','index_R_31').
load('t837','t836','description').
actual('173','1','rss_subscription_remove_confirm').
callRet('173','rss_subscription_remove_confirm').
actual('173','2','t837').
callRet('173','t837').
actual('174','1','t838').
callRet('174','t838').
assign('reply_R_31','t839').
assign('t840','reply_R_31').
load('t841','feedReaderList_R_31','index_R_31').
load('t842','t841','url').
actual('175','1','t842').
callRet('175','t842').
assign('wasDefault_R_31','t843').
load('t845','feedReaderList_R_31','splice_R_?').
actual('176','1','index_R_31').
callRet('176','index_R_31').
actual('176','2','1').
callRet('176','1').
assign('t844','t846').
load('t847','window','localStorage').
load('t848','t847','readerList').
load('t849','JSON_R_?','stringify_R_?').
actual('177','1','feedReaderList_R_31').
callRet('177','feedReaderList_R_31').
store('t847','readerList','t850').
assign('t851','wasDefault_R_31').
load('t852','window','localStorage').
load('t853','t852','defaultReader').
load('t854','feedReaderList_R_31','0').
load('t855','t854','url').
store('t852','defaultReader','t855').
assign('t856','t857').
load('t858','document','getElementById_R_?').
load('t859','t858','urlAssist').
load('t860','t859','innerText').
store('t859','innerText','assistText_R_0').
load('t861','document','getElementById').
load('t862','t861','save').
load('t863','t862','disabled').
store('t862','disabled','true').
load('t864','document','getElementById').
load('t865','t864','dialogBackground').
load('t866','t865','style').
load('t867','t866','display').
store('t866','display','-webkit-box').
load('t868','document','getElementById_R_?').
load('t869','t868','dialogBackground').
load('t870','t869','style').
load('t871','t870','display').
store('t870','display','none').
load('t872','document','getElementById_R_?').
load('t873','t872','statusMsg').
load('t874','t873','innerText').
store('t873','innerText','').
load('t875','document','getElementById').
actual('179','1','descriptionText').
callRet('179','descriptionText').
assign('description_R_34','t876').
load('t877','document','getElementById').
actual('180','1','urlText').
callRet('180','urlText').
assign('url_R_34','t878').
load('t879','description_R_34','value').
load('t880','t879','length').
load('t882','url_R_34','value').
load('t883','t882','length').
load('t886','url_R_34','value').
load('t887','t886','indexOf_R_?').
actual('181','1','%s').
callRet('181','%s').
assign('t889','1').
assign('valid_R_34','t891').
load('t892','document','getElementById').
load('t893','t892','save').
load('t894','t893','disabled').
assign('t895','valid_R_34').
store('t893','disabled','t895').
load('t896','JSON_R_?','parse_R_?').
load('t897','window','localStorage').
load('t898','t897','readerList').
actual('182','1','t898').
callRet('182','t898').
assign('feedReaderList_R_35','t899').
load('t900','document','getElementById_R_?').
actual('183','1','urlText').
callRet('183','urlText').
load('t902','t901','value').
assign('url_R_35','t902').
load('t903','document','getElementById').
actual('184','1','descriptionText').
callRet('184','descriptionText').
load('t905','t904','value').
assign('description_R_35','t905').
assign('t907','1').
assign('t906','t908').
load('t909','feedReaderList_R_35','editingIndex_R_0').
load('t910','t909','url').
store('t909','url','url_R_35').
load('t911','feedReaderList_R_35','editingIndex_R_0').
load('t912','t911','description').
store('t911','description','description_R_35').
assign('newFeedList_R_35','newFeedList_R_35').
load('t914','newFeedList_R_35','push_R_?').
store('t915','url','url_R_35').
store('t915','description','description_R_35').
actual('185','1','t915').
callRet('185','t915').
assign('t913','t916').
load('t918','feedReaderList_R_35','length').
assign('t917','t919').
assign('i_R_?','0').
assign('t921','i_R_?').
assign('t920','t921').
load('t923','newFeedList_R_35','push').
load('t924','feedReaderList_R_35','i_R_?').
actual('186','1','t924').
callRet('186','t924').
assign('t922','t925').
assign('feedReaderList_R_35','newFeedList_R_35').
load('t926','window','localStorage').
load('t927','t926','readerList').
load('t928','JSON_R_?','stringify_R_?').
actual('187','1','feedReaderList_R_35').
callRet('187','feedReaderList_R_35').
store('t926','readerList','t929').
assign('t930','editingDefault_R_0').
load('t931','window','localStorage').
load('t932','t931','defaultReader').
store('t931','defaultReader','url_R_35').
assign('t933','t934').
assign('t935','t936').
actual('190','1','rss_subscription_options').
callRet('190','rss_subscription_options').
assign('t937','t938').
actual('191','1','addReader').
callRet('191','addReader').
actual('191','2','rss_subscription_add_reader').
callRet('191','rss_subscription_add_reader').
assign('t939','t940').
actual('192','1','editReader').
callRet('192','editReader').
actual('192','2','rss_subscription_edit_reader').
callRet('192','rss_subscription_edit_reader').
assign('t941','t942').
actual('193','1','removeReader').
callRet('193','removeReader').
actual('193','2','rss_subscription_remove_reader').
callRet('193','rss_subscription_remove_reader').
assign('t943','t944').
actual('194','1','setDefault').
callRet('194','setDefault').
actual('194','2','rss_subscription_make_default_reader').
callRet('194','rss_subscription_make_default_reader').
assign('t945','t946').
actual('195','1','resetList').
callRet('195','resetList').
actual('195','2','rss_subscription_reset_list').
callRet('195','rss_subscription_reset_list').
assign('t947','t948').
actual('196','1','rss_subscription_always_use_default').
callRet('196','rss_subscription_always_use_default').
assign('t949','t950').
actual('197','1','dialogHeader').
callRet('197','dialogHeader').
actual('197','2','rss_subscription_edit_dialog_title').
callRet('197','rss_subscription_edit_dialog_title').
assign('t951','t952').
actual('198','1','rss_subscription_feed_description').
callRet('198','rss_subscription_feed_description').
assign('t953','t954').
actual('199','1','rss_subscription_feed_url').
callRet('199','rss_subscription_feed_url').
assign('t955','t956').
actual('200','1','save').
callRet('200','save').
actual('200','2','rss_subscription_save_button').
callRet('200','rss_subscription_save_button').
actual('200','3','value').
callRet('200','value').
assign('t957','t958').
actual('201','1','rss_subscription_close_button').
callRet('201','rss_subscription_close_button').
actual('201','2','rss_subscription_close_button').
callRet('201','rss_subscription_close_button').
actual('201','3','value').
callRet('201','value').
assign('t959','t960').
assign('t961','t962').
load('t963','document','getElementById_R_?').
actual('203','1','_added_by_transform_0').
callRet('203','_added_by_transform_0').
assign('temp_R_37','t964').
load('t966','temp_R_37','addEventListener_R_?').
actual('204','1','load').
callRet('204','load').
actual('204','2','lambda_R_38').
callRet('204','lambda_R_38').
assign('t965','t967').
ptsTo('lambda_R_38','d_lambda_R_38').
heapPtsTo('d_lambda_R_38','prototype','p_lambda_R_38').
prototype('p_lambda_R_38','h_FP').
methodRet('d_lambda_R_38','lambda_R_38').
formal('d_lambda_R_38','1','event_R_38').
assign('t968','t969').
load('t970','document','getElementById_R_?').
actual('206','1','urlText').
callRet('206','urlText').
assign('temp_R_39','t971').
load('t973','temp_R_39','addEventListener_R_?').
actual('207','1','keyup').
callRet('207','keyup').
actual('207','2','lambda_R_40').
callRet('207','lambda_R_40').
assign('t972','t974').
ptsTo('lambda_R_40','d_lambda_R_40').
heapPtsTo('d_lambda_R_40','prototype','p_lambda_R_40').
prototype('p_lambda_R_40','h_FP').
methodRet('d_lambda_R_40','lambda_R_40').
formal('d_lambda_R_40','1','event_R_40').
assign('t975','t976').
load('t977','document','getElementById_R_?').
actual('209','1','save').
callRet('209','save').
assign('temp_R_41','t978').
load('t980','temp_R_41','addEventListener_R_?').
actual('210','1','click').
callRet('210','click').
actual('210','2','lambda_R_42').
callRet('210','lambda_R_42').
assign('t979','t981').
ptsTo('lambda_R_42','d_lambda_R_42').
heapPtsTo('d_lambda_R_42','prototype','p_lambda_R_42').
prototype('p_lambda_R_42','h_FP').
methodRet('d_lambda_R_42','lambda_R_42').
formal('d_lambda_R_42','1','event_R_42').
assign('t982','t983').
load('t984','document','getElementById_R_?').
actual('212','1','rss_subscription_close_button').
callRet('212','rss_subscription_close_button').
assign('temp_R_43','t985').
load('t987','temp_R_43','addEventListener_R_?').
actual('213','1','click').
callRet('213','click').
actual('213','2','lambda_R_44').
callRet('213','lambda_R_44').
assign('t986','t988').
ptsTo('lambda_R_44','d_lambda_R_44').
heapPtsTo('d_lambda_R_44','prototype','p_lambda_R_44').
prototype('p_lambda_R_44','h_FP').
methodRet('d_lambda_R_44','lambda_R_44').
formal('d_lambda_R_44','1','event_R_44').
assign('t989','t990').
load('t991','document','getElementById_R_?').
actual('215','1','readerListbox').
callRet('215','readerListbox').
assign('temp_R_45','t992').
load('t994','temp_R_45','addEventListener_R_?').
actual('216','1','change').
callRet('216','change').
actual('216','2','lambda_R_46').
callRet('216','lambda_R_46').
assign('t993','t995').
ptsTo('lambda_R_46','d_lambda_R_46').
heapPtsTo('d_lambda_R_46','prototype','p_lambda_R_46').
prototype('p_lambda_R_46','h_FP').
methodRet('d_lambda_R_46','lambda_R_46').
formal('d_lambda_R_46','1','event_R_46').
assign('t996','t997').
load('t998','document','getElementById_R_?').
actual('218','1','addReader').
callRet('218','addReader').
assign('temp_R_47','t999').
load('t1001','temp_R_47','addEventListener_R_?').
actual('219','1','click').
callRet('219','click').
actual('219','2','lambda_R_48').
callRet('219','lambda_R_48').
assign('t1000','t1002').
ptsTo('lambda_R_48','d_lambda_R_48').
heapPtsTo('d_lambda_R_48','prototype','p_lambda_R_48').
prototype('p_lambda_R_48','h_FP').
methodRet('d_lambda_R_48','lambda_R_48').
formal('d_lambda_R_48','1','event_R_48').
assign('t1004','1').
actual('220','1','t1004').
callRet('220','t1004').
assign('t1003','t1005').
load('t1006','document','getElementById_R_?').
actual('221','1','editReader').
callRet('221','editReader').
assign('temp_R_49','t1007').
load('t1009','temp_R_49','addEventListener_R_?').
actual('222','1','click').
callRet('222','click').
actual('222','2','lambda_R_50').
callRet('222','lambda_R_50').
assign('t1008','t1010').
ptsTo('lambda_R_50','d_lambda_R_50').
heapPtsTo('d_lambda_R_50','prototype','p_lambda_R_50').
prototype('p_lambda_R_50','h_FP').
methodRet('d_lambda_R_50','lambda_R_50').
formal('d_lambda_R_50','1','event_R_50').
actual('223','1','0').
callRet('223','0').
assign('t1011','t1012').
load('t1013','document','getElementById_R_?').
actual('224','1','removeReader').
callRet('224','removeReader').
assign('temp_R_51','t1014').
load('t1016','temp_R_51','addEventListener_R_?').
actual('225','1','click').
callRet('225','click').
actual('225','2','lambda_R_52').
callRet('225','lambda_R_52').
assign('t1015','t1017').
ptsTo('lambda_R_52','d_lambda_R_52').
heapPtsTo('d_lambda_R_52','prototype','p_lambda_R_52').
prototype('p_lambda_R_52','h_FP').
methodRet('d_lambda_R_52','lambda_R_52').
formal('d_lambda_R_52','1','event_R_52').
assign('t1018','t1019').
load('t1020','document','getElementById_R_?').
actual('227','1','setDefault').
callRet('227','setDefault').
assign('temp_R_53','t1021').
load('t1023','temp_R_53','addEventListener_R_?').
actual('228','1','click').
callRet('228','click').
actual('228','2','lambda_R_54').
callRet('228','lambda_R_54').
assign('t1022','t1024').
ptsTo('lambda_R_54','d_lambda_R_54').
heapPtsTo('d_lambda_R_54','prototype','p_lambda_R_54').
prototype('p_lambda_R_54','h_FP').
methodRet('d_lambda_R_54','lambda_R_54').
formal('d_lambda_R_54','1','event_R_54').
assign('t1025','t1026').
load('t1027','document','getElementById_R_?').
actual('230','1','resetList').
callRet('230','resetList').
assign('temp_R_55','t1028').
load('t1030','temp_R_55','addEventListener_R_?').
actual('231','1','click').
callRet('231','click').
actual('231','2','lambda_R_56').
callRet('231','lambda_R_56').
assign('t1029','t1031').
ptsTo('lambda_R_56','d_lambda_R_56').
heapPtsTo('d_lambda_R_56','prototype','p_lambda_R_56').
prototype('p_lambda_R_56','h_FP').
methodRet('d_lambda_R_56','lambda_R_56').
formal('d_lambda_R_56','1','event_R_56').
assign('t1032','t1033').
load('t1034','document','getElementById_R_?').
actual('233','1','alwaysUseDefault').
callRet('233','alwaysUseDefault').
assign('temp_R_57','t1035').
load('t1037','temp_R_57','addEventListener_R_?').
actual('234','1','change').
callRet('234','change').
actual('234','2','lambda_R_58').
callRet('234','lambda_R_58').
assign('t1036','t1038').
ptsTo('lambda_R_58','d_lambda_R_58').
heapPtsTo('d_lambda_R_58','prototype','p_lambda_R_58').
prototype('p_lambda_R_58','h_FP').
methodRet('d_lambda_R_58','lambda_R_58').
formal('d_lambda_R_58','1','event_R_58').
assign('t1039','t1040').
load('t1041','document','getElementById_R_?').
actual('236','1','descriptionText').
callRet('236','descriptionText').
assign('temp_R_59','t1042').
load('t1044','temp_R_59','addEventListener_R_?').
actual('237','1','keyup').
callRet('237','keyup').
actual('237','2','lambda_R_60').
callRet('237','lambda_R_60').
assign('t1043','t1045').
ptsTo('lambda_R_60','d_lambda_R_60').
heapPtsTo('d_lambda_R_60','prototype','p_lambda_R_60').
prototype('p_lambda_R_60','h_FP').
methodRet('d_lambda_R_60','lambda_R_60').
formal('d_lambda_R_60','1','event_R_60').
assign('t1046','t1047').
load('t1048','document','createElement_R_?').
actual('239','1','a').
callRet('239','a').
assign('feed_link_R_61','t1049').
load('t1050','feed_link_R_61','href').
store('feed_link_R_61','href','url_R_61').
load('t1052','feed_link_R_61','addEventListener_R_?').
actual('240','1','click').
callRet('240','click').
actual('240','2','onClick_R_?').
callRet('240','onClick_R_?').
assign('t1051','t1053').
methodRet('d_feedLink_R_61','feed_link_R_61').
load('t1055','chrome','tabs').
load('t1056','t1055','getSelected').
actual('241','1','null').
callRet('241','null').
actual('241','2','lambda_R_63').
callRet('241','lambda_R_63').
assign('t1054','t1057').
ptsTo('lambda_R_63','d_lambda_R_63').
heapPtsTo('d_lambda_R_63','prototype','p_lambda_R_63').
prototype('p_lambda_R_63','h_FP').
methodRet('d_lambda_R_63','lambda_R_63').
formal('d_lambda_R_63','1','tab_R_63').
load('t1058','chrome','extension').
load('t1059','t1058','getBackgroundPage').
load('t1061','t1060','feedData').
load('t1062','tab_R_63','id').
load('t1063','t1061','t1062').
assign('feeds_R_63','t1063').
load('t1065','feeds_R_63','length').
assign('t1064','t1066').
load('t1067','document','getElementById_R_?').
actual('243','1','content').
callRet('243','content').
assign('content_R_63','t1068').
load('t1069','document','getElementById').
actual('244','1','heading').
callRet('244','heading').
assign('heading_R_63','t1070').
load('t1071','heading_R_63','innerText').
load('t1072','chrome','i18n').
load('t1073','t1072','getMessage').
actual('245','1','rss_subscription_action_title').
callRet('245','rss_subscription_action_title').
store('heading_R_63','innerText','t1074').
load('t1076','content_R_63','appendChild_R_?').
load('t1077','document','createElement_R_?').
actual('246','1','br').
callRet('246','br').
actual('247','1','t1078').
callRet('247','t1078').
assign('t1075','t1079').
load('t1080','document','createElement').
actual('248','1','table').
callRet('248','table').
assign('feed_list_R_63','t1081').
load('t1082','feed_list_R_63','style').
load('t1083','t1082','width').
store('t1082','width','400').
load('t1085','feeds_R_63','length').
assign('t1084','t1086').
assign('i_R_63','0').
assign('t1088','i_R_63').
assign('t1087','t1088').
load('t1089','feeds_R_63','i_R_63').
load('t1090','t1089','href').
actual('249','1','t1090').
callRet('249','t1090').
assign('img_link_R_63','t1091').
load('t1092','document','createElement').
actual('250','1','img').
callRet('250','img').
assign('img_R_63','t1093').
load('t1094','img_R_63','src').
store('img_R_63','src','feed-icon-16x16.png').
load('t1096','img_link_R_63','appendChild').
actual('251','1','img_R_63').
callRet('251','img_R_63').
assign('t1095','t1097').
load('t1098','feeds_R_63','i_R_63').
load('t1099','t1098','href').
actual('252','1','t1099').
callRet('252','t1099').
assign('text_link_R_63','t1100').
load('t1102','text_link_R_63','appendChild').
load('t1103','document','createTextNode_R_?').
load('t1104','feeds_R_63','i_R_63').
load('t1105','t1104','title').
actual('253','1','t1105').
callRet('253','t1105').
actual('254','1','t1106').
callRet('254','t1106').
assign('t1101','t1107').
load('t1108','document','createElement').
actual('255','1','tr').
callRet('255','tr').
assign('tr_R_63','t1109').
load('t1110','tr_R_63','className').
store('tr_R_63','className','feedList').
load('t1111','document','createElement').
actual('256','1','td').
callRet('256','td').
assign('td_R_63','t1112').
load('t1113','td_R_63','width').
store('td_R_63','width','16').
load('t1115','td_R_63','appendChild').
actual('257','1','img_link_R_63').
callRet('257','img_link_R_63').
assign('t1114','t1116').
load('t1117','document','createElement').
actual('258','1','td').
callRet('258','td').
assign('td2_R_63','t1118').
load('t1120','td2_R_63','appendChild').
actual('259','1','text_link_R_63').
callRet('259','text_link_R_63').
assign('t1119','t1121').
load('t1123','tr_R_63','appendChild').
actual('260','1','td_R_63').
callRet('260','td_R_63').
assign('t1122','t1124').
load('t1126','tr_R_63','appendChild').
actual('261','1','td2_R_63').
callRet('261','td2_R_63').
assign('t1125','t1127').
load('t1129','feed_list_R_63','appendChild').
actual('262','1','tr_R_63').
callRet('262','tr_R_63').
assign('t1128','t1130').
assign('i_R_63','0').
load('t1132','content_R_63','appendChild').
actual('263','1','feed_list_R_63').
callRet('263','feed_list_R_63').
assign('t1131','t1133').
load('t1135','feeds_R_63','0').
load('t1136','t1135','href').
actual('264','1','t1136').
callRet('264','t1136').
assign('t1134','t1137').
load('t1138','event_R_64','currentTarget').
assign('a_R_64','t1138').
load('t1140','a_R_64','href').
actual('265','1','t1140').
callRet('265','t1140').
assign('t1139','t1141').
assign('url_R_65','').
load('t1143','window','localStorage').
load('t1144','window','localStorage').
load('t1145','t1144','showPreviewPage').
assign('t1142','t1147').
actual('266','1','feed_url_R_65').
callRet('266','feed_url_R_65').
assign('url_R_65','t1149').
load('t1150','window','localStorage').
load('t1151','t1150','defaultReader').
load('t1152','t1151','replace_R_?').
actual('267','1','feed_url_R_65').
callRet('267','feed_url_R_65').
actual('268','1','%s').
callRet('268','%s').
actual('268','2','t1153').
callRet('268','t1153').
assign('url_R_65','t1154').
load('t1156','chrome','tabs').
load('t1157','t1156','create').
store('t1158','url_R_65','url_R_65').
actual('269','1','t1158').
callRet('269','t1158').
assign('t1155','t1159').
load('t1161','window','close_R_?').
assign('t1160','t1162').
load('t1163','document','getElementById_R_?').
actual('271','1','_added_by_transform_0').
callRet('271','_added_by_transform_0').
assign('temp_R_66','t1164').
load('t1166','temp_R_66','addEventListener_R_?').
actual('272','1','load').
callRet('272','load').
actual('272','2','lambda_R_67').
callRet('272','lambda_R_67').
assign('t1165','t1167').
ptsTo('lambda_R_67','d_lambda_R_67').
heapPtsTo('d_lambda_R_67','prototype','p_lambda_R_67').
prototype('p_lambda_R_67','h_FP').
methodRet('d_lambda_R_67','lambda_R_67').
formal('d_lambda_R_67','1','event_R_67').
assign('t1168','t1169').
load('t1170','document','title').
load('t1171','chrome','i18n').
load('t1172','t1171','getMessage').
actual('274','1','rss_subscription_default_title').
callRet('274','rss_subscription_default_title').
store('document','title','t1173').
actual('275','1','rss_subscription_subscribe_using').
callRet('275','rss_subscription_subscribe_using').
assign('t1174','t1175').
actual('276','1','rss_subscription_subscribe_button').
callRet('276','rss_subscription_subscribe_button').
assign('t1176','t1177').
actual('277','1','rss_subscription_always_use').
callRet('277','rss_subscription_always_use').
assign('t1178','t1179').
actual('278','1','rss_subscription_feed_preview').
callRet('278','rss_subscription_feed_preview').
assign('t1180','t1181').
actual('279','1','feedUrl').
callRet('279','feedUrl').
actual('279','2','rss_subscription_feed_link').
callRet('279','rss_subscription_feed_link').
actual('279','3','').
callRet('279','None').
assign('t1182','t1183').
assign('t1184','t1185').
load('t1186','document','getElementById_R_?').
actual('281','1','_added_by_transform_0').
callRet('281','_added_by_transform_0').
assign('temp_R_69','t1187').
load('t1189','temp_R_69','addEventListener_R_?').
actual('282','1','load').
callRet('282','load').
actual('282','2','lambda_R_70').
callRet('282','lambda_R_70').
assign('t1188','t1190').
ptsTo('lambda_R_70','d_lambda_R_70').
heapPtsTo('d_lambda_R_70','prototype','p_lambda_R_70').
prototype('p_lambda_R_70','h_FP').
methodRet('d_lambda_R_70','lambda_R_70').
formal('d_lambda_R_70','1','event_R_70').
assign('t1191','t1192').
load('t1193','document','getElementById_R_?').
actual('284','1','readerDropdown').
callRet('284','readerDropdown').
assign('temp_R_71','t1194').
load('t1196','temp_R_71','addEventListener_R_?').
actual('285','1','change').
callRet('285','change').
actual('285','2','lambda_R_72').
callRet('285','lambda_R_72').
assign('t1195','t1197').
ptsTo('lambda_R_72','d_lambda_R_72').
heapPtsTo('d_lambda_R_72','prototype','p_lambda_R_72').
prototype('p_lambda_R_72','h_FP').
methodRet('d_lambda_R_72','lambda_R_72').
formal('d_lambda_R_72','1','event_R_72').
assign('t1198','t1199').
load('t1200','document','getElementById_R_?').
actual('287','1','rss_subscription_subscribe_button').
callRet('287','rss_subscription_subscribe_button').
assign('temp_R_73','t1201').
load('t1203','temp_R_73','addEventListener_R_?').
actual('288','1','click').
callRet('288','click').
actual('288','2','lambda_R_74').
callRet('288','lambda_R_74').
assign('t1202','t1204').
ptsTo('lambda_R_74','d_lambda_R_74').
heapPtsTo('d_lambda_R_74','prototype','p_lambda_R_74').
prototype('p_lambda_R_74','h_FP').
methodRet('d_lambda_R_74','lambda_R_74').
formal('d_lambda_R_74','1','event_R_74').
assign('t1205','t1206').
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

