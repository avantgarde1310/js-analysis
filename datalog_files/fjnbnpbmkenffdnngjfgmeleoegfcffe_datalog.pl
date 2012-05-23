load('t1','chrome','extension').
load('t2','t1','sendRequest').
store('t3','name_R_?','getStylesToApply').
actual('0','1','t3').
callRet('0','t3').
actual('0','2','lambda_R_1').
callRet('0','lambda_R_1').
assign('t0','t4').
ptsTo('lambda_R_1','d_lambda_R_1').
heapPtsTo('d_lambda_R_1','prototype','p_lambda_R_1').
prototype('p_lambda_R_1','h_FP').
methodRet('d_lambda_R_1','lambda_R_1').
formal('d_lambda_R_1','1','response_R_1').
load('t6','chrome','extension').
load('t7','t6','onRequest').
load('t8','t7','addListener').
actual('1','1','lambda_R_2').
callRet('1','lambda_R_2').
assign('t5','t9').
ptsTo('lambda_R_2','d_lambda_R_2').
heapPtsTo('d_lambda_R_2','prototype','p_lambda_R_2').
prototype('p_lambda_R_2','h_FP').
methodRet('d_lambda_R_2','lambda_R_2').
formal('d_lambda_R_2','1','request_R_2').
formal('d_lambda_R_2','2','sender_R_2').
formal('d_lambda_R_2','3','sendResponse_R_2').
ptsTo('removeStyle_R_3','d_removeStyle_R_3').
heapPtsTo('d_removeStyle_R_3','prototype','p_removeStyle_R_3').
prototype('p_removeStyle_R_3','h_FP').
methodRet('d_removeStyle_R_3','removeStyle_R_3').
formal('d_removeStyle_R_3','1','id_R_3').
ptsTo('applyStyle_R_4','d_applyStyle_R_4').
heapPtsTo('d_applyStyle_R_4','prototype','p_applyStyle_R_4').
prototype('p_applyStyle_R_4','h_FP').
methodRet('d_applyStyle_R_4','applyStyle_R_4').
formal('d_applyStyle_R_4','1','s_R_4').
ptsTo('filterSection_R_6','d_filterSection_R_6').
heapPtsTo('d_filterSection_R_6','prototype','p_filterSection_R_6').
prototype('p_filterSection_R_6','h_FP').
methodRet('d_filterSection_R_6','filterSection_R_6').
formal('d_filterSection_R_6','1','section_R_6').
ptsTo('getDomains_R_10','d_getDomains_R_10').
heapPtsTo('d_getDomains_R_10','prototype','p_getDomains_R_10').
prototype('p_getDomains_R_10','h_FP').
methodRet('d_getDomains_R_10','getDomains_R_10').
formal('d_getDomains_R_10','1','url_R_10').
load('t11','chrome','extension').
load('t12','t11','onRequest').
load('t13','t12','addListener').
actual('2','1','lambda_R_11').
callRet('2','lambda_R_11').
assign('t10','t14').
ptsTo('lambda_R_11','d_lambda_R_11').
heapPtsTo('d_lambda_R_11','prototype','p_lambda_R_11').
prototype('p_lambda_R_11','h_FP').
methodRet('d_lambda_R_11','lambda_R_11').
formal('d_lambda_R_11','1','request_R_11').
formal('d_lambda_R_11','2','sender_R_11').
formal('d_lambda_R_11','3','sendResponse_R_11').
ptsTo('styleAppliesToUrl_R_12','d_styleAppliesToUrl_R_12').
heapPtsTo('d_styleAppliesToUrl_R_12','prototype','p_styleAppliesToUrl_R_12').
prototype('p_styleAppliesToUrl_R_12','h_FP').
methodRet('d_styleAppliesToUrl_R_12','styleAppliesToUrl_R_12').
formal('d_styleAppliesToUrl_R_12','1','style_R_12').
formal('d_styleAppliesToUrl_R_12','2','url_R_12').
ptsTo('sectionAppliesToUrl_R_14','d_sectionAppliesToUrl_R_14').
heapPtsTo('d_sectionAppliesToUrl_R_14','prototype','p_sectionAppliesToUrl_R_14').
prototype('p_sectionAppliesToUrl_R_14','h_FP').
methodRet('d_sectionAppliesToUrl_R_14','sectionAppliesToUrl_R_14').
formal('d_sectionAppliesToUrl_R_14','1','section_R_14').
formal('d_sectionAppliesToUrl_R_14','2','url_R_14').
assign('cachedGlobalStyleIds_R_0','null').
assign('cachedStyles_R_0','cachedStyles_R_0').
assign('background_R_0','true').
assign('styleId_R_0','null').
assign('dirty_R_0','false').
load('t15','document','createElement_R_?').
actual('3','1','li').
callRet('3','li').
assign('appliesToTemplate_R_0','t16').
load('t17','appliesToTemplate_R_0','innerHTML').
actual('4','1','appliesUrlOption').
callRet('4','appliesUrlOption').
actual('5','1','appliesUrlPrefixOption').
callRet('5','appliesUrlPrefixOption').
actual('6','1','appliesDomainOption').
callRet('6','appliesDomainOption').
actual('7','1','appliesRemove').
callRet('7','appliesRemove').
actual('8','1','appliesAdd').
callRet('8','appliesAdd').
store('appliesToTemplate_R_0','innerHTML','t32').
load('t33','document','createElement').
actual('9','1','li').
callRet('9','li').
assign('appliesToEverythingTemplate_R_0','t34').
load('t35','appliesToEverythingTemplate_R_0','className').
store('appliesToEverythingTemplate_R_0','className','applies-to-everything').
load('t36','appliesToEverythingTemplate_R_0','innerHTML').
actual('10','1','appliesToEverything').
callRet('10','appliesToEverything').
actual('11','1','appliesSpecify').
callRet('11','appliesSpecify').
store('appliesToEverythingTemplate_R_0','innerHTML','t41').
load('t42','document','createElement').
actual('12','1','div').
callRet('12','div').
assign('sectionTemplate_R_0','t43').
load('t44','sectionTemplate_R_0','innerHTML').
actual('13','1','sectionCode').
callRet('13','sectionCode').
actual('14','1','appliesLabel').
callRet('14','appliesLabel').
actual('15','1','helpAlt').
callRet('15','helpAlt').
actual('16','1','sectionRemove').
callRet('16','sectionRemove').
actual('17','1','sectionAdd').
callRet('17','sectionAdd').
store('sectionTemplate_R_0','innerHTML','t59').
ptsTo('makeDirty_R_17','d_makeDirty_R_17').
heapPtsTo('d_makeDirty_R_17','prototype','p_makeDirty_R_17').
prototype('p_makeDirty_R_17','h_FP').
methodRet('d_makeDirty_R_17','makeDirty_R_17').
load('t60','window','onbeforeunload').
store('window','onbeforeunload','lambda_R_18').
ptsTo('lambda_R_18','d_lambda_R_18').
heapPtsTo('d_lambda_R_18','prototype','p_lambda_R_18').
prototype('p_lambda_R_18','h_FP').
methodRet('d_lambda_R_18','lambda_R_18').
ptsTo('addAppliesTo_R_19','d_addAppliesTo_R_19').
heapPtsTo('d_addAppliesTo_R_19','prototype','p_addAppliesTo_R_19').
prototype('p_addAppliesTo_R_19','h_FP').
methodRet('d_addAppliesTo_R_19','addAppliesTo_R_19').
formal('d_addAppliesTo_R_19','1','list_R_19').
formal('d_addAppliesTo_R_19','2','name_R_19').
formal('d_addAppliesTo_R_19','3','value_R_19').
ptsTo('addSection_R_20','d_addSection_R_20').
heapPtsTo('d_addSection_R_20','prototype','p_addSection_R_20').
prototype('p_addSection_R_20','h_FP').
methodRet('d_addSection_R_20','addSection_R_20').
formal('d_addSection_R_20','1','section_R_20').
ptsTo('removeAppliesTo_R_24','d_removeAppliesTo_R_24').
heapPtsTo('d_removeAppliesTo_R_24','prototype','p_removeAppliesTo_R_24').
prototype('p_removeAppliesTo_R_24','h_FP').
methodRet('d_removeAppliesTo_R_24','removeAppliesTo_R_24').
formal('d_removeAppliesTo_R_24','1','event_R_24').
ptsTo('removeSection_R_25','d_removeSection_R_25').
heapPtsTo('d_removeSection_R_25','prototype','p_removeSection_R_25').
prototype('p_removeSection_R_25','h_FP').
methodRet('d_removeSection_R_25','removeSection_R_25').
formal('d_removeSection_R_25','1','event_R_25').
load('t62','window','addEventListener_R_?').
actual('18','1','load').
callRet('18','load').
actual('18','2','init_R_?').
callRet('18','init_R_?').
actual('18','3','false').
callRet('18','false').
assign('t61','t63').
ptsTo('init_R_26','d_init_R_26').
heapPtsTo('d_init_R_26','prototype','p_init_R_26').
prototype('p_init_R_26','h_FP').
methodRet('d_init_R_26','init_R_26').
ptsTo('initWithStyle_R_28','d_initWithStyle_R_28').
heapPtsTo('d_initWithStyle_R_28','prototype','p_initWithStyle_R_28').
prototype('p_initWithStyle_R_28','h_FP').
methodRet('d_initWithStyle_R_28','initWithStyle_R_28').
formal('d_initWithStyle_R_28','1','style_R_28').
ptsTo('initTitle_R_29','d_initTitle_R_29').
heapPtsTo('d_initTitle_R_29','prototype','p_initTitle_R_29').
prototype('p_initTitle_R_29','h_FP').
methodRet('d_initTitle_R_29','initTitle_R_29').
formal('d_initTitle_R_29','1','style_R_29').
ptsTo('validate_R_30','d_validate_R_30').
heapPtsTo('d_validate_R_30','prototype','p_validate_R_30').
prototype('p_validate_R_30','h_FP').
methodRet('d_validate_R_30','validate_R_30').
ptsTo('save_R_31','d_save_R_31').
heapPtsTo('d_save_R_31','prototype','p_save_R_31').
prototype('p_save_R_31','h_FP').
methodRet('d_save_R_31','save_R_31').
ptsTo('getSections_R_38','d_getSections_R_38').
heapPtsTo('d_getSections_R_38','prototype','p_getSections_R_38').
prototype('p_getSections_R_38','h_FP').
methodRet('d_getSections_R_38','getSections_R_38').
ptsTo('getMeta_R_40','d_getMeta_R_40').
heapPtsTo('d_getMeta_R_40','prototype','p_getMeta_R_40').
prototype('p_getMeta_R_40','h_FP').
methodRet('d_getMeta_R_40','getMeta_R_40').
formal('d_getMeta_R_40','1','e_R_40').
ptsTo('saveComplete_R_42','d_saveComplete_R_42').
heapPtsTo('d_saveComplete_R_42','prototype','p_saveComplete_R_42').
prototype('p_saveComplete_R_42','h_FP').
methodRet('d_saveComplete_R_42','saveComplete_R_42').
ptsTo('notifySave_R_46','d_notifySave_R_46').
heapPtsTo('d_notifySave_R_46','prototype','p_notifySave_R_46').
prototype('p_notifySave_R_46','h_FP').
methodRet('d_notifySave_R_46','notifySave_R_46').
formal('d_notifySave_R_46','1','newStyle_R_46').
ptsTo('showSectionHelp_R_49','d_showSectionHelp_R_49').
heapPtsTo('d_showSectionHelp_R_49','prototype','p_showSectionHelp_R_49').
prototype('p_showSectionHelp_R_49','h_FP').
methodRet('d_showSectionHelp_R_49','showSectionHelp_R_49').
ptsTo('showAppliesToHelp_R_50','d_showAppliesToHelp_R_50').
heapPtsTo('d_showAppliesToHelp_R_50','prototype','p_showAppliesToHelp_R_50').
prototype('p_showAppliesToHelp_R_50','h_FP').
methodRet('d_showAppliesToHelp_R_50','showAppliesToHelp_R_50').
ptsTo('showHelp_R_51','d_showHelp_R_51').
heapPtsTo('d_showHelp_R_51','prototype','p_showHelp_R_51').
prototype('p_showHelp_R_51','h_FP').
methodRet('d_showHelp_R_51','showHelp_R_51').
formal('d_showHelp_R_51','1','text_R_51').
load('t65','chrome','extension').
load('t66','t65','onRequest').
load('t67','t66','addListener').
actual('19','1','lambda_R_52').
callRet('19','lambda_R_52').
assign('t64','t68').
ptsTo('lambda_R_52','d_lambda_R_52').
heapPtsTo('d_lambda_R_52','prototype','p_lambda_R_52').
prototype('p_lambda_R_52','h_FP').
methodRet('d_lambda_R_52','lambda_R_52').
formal('d_lambda_R_52','1','request_R_52').
formal('d_lambda_R_52','2','sender_R_52').
formal('d_lambda_R_52','3','sendResponse_R_52').
load('t70','chrome','extension').
load('t71','t70','sendRequest').
store('t72','name_R_?','getStylesForUrl').
actual('20','1','stylish-id-url').
callRet('20','stylish-id-url').
load('t74','location_R_?','href').
store('t72','url_R_?','t75').
actual('21','1','t72').
callRet('21','t72').
actual('21','2','lambda_R_53').
callRet('21','lambda_R_53').
assign('t69','t76').
ptsTo('lambda_R_53','d_lambda_R_53').
heapPtsTo('d_lambda_R_53','prototype','p_lambda_R_53').
prototype('p_lambda_R_53','h_FP').
methodRet('d_lambda_R_53','lambda_R_53').
formal('d_lambda_R_53','1','response_R_53').
ptsTo('sendEvent_R_54','d_sendEvent_R_54').
heapPtsTo('d_sendEvent_R_54','prototype','p_sendEvent_R_54').
prototype('p_sendEvent_R_54','h_FP').
methodRet('d_sendEvent_R_54','sendEvent_R_54').
formal('d_sendEvent_R_54','1','type_R_54').
load('t78','document','addEventListener').
actual('22','1','stylishInstallChrome').
callRet('22','stylishInstallChrome').
actual('22','2','lambda_R_55').
callRet('22','lambda_R_55').
actual('22','3','false').
callRet('22','false').
assign('t77','t79').
ptsTo('lambda_R_55','d_lambda_R_55').
heapPtsTo('d_lambda_R_55','prototype','p_lambda_R_55').
prototype('p_lambda_R_55','h_FP').
methodRet('d_lambda_R_55','lambda_R_55').
ptsTo('getMeta_R_59','d_getMeta_R_59').
heapPtsTo('d_getMeta_R_59','prototype','p_getMeta_R_59').
prototype('p_getMeta_R_59','h_FP').
methodRet('d_getMeta_R_59','getMeta_R_59').
formal('d_getMeta_R_59','1','name_R_59').
ptsTo('getResource_R_60','d_getResource_R_60').
heapPtsTo('d_getResource_R_60','prototype','p_getResource_R_60').
prototype('p_getResource_R_60','h_FP').
methodRet('d_getResource_R_60','getResource_R_60').
formal('d_getResource_R_60','1','url_R_60').
formal('d_getResource_R_60','2','callback_R_60').
ptsTo('t_R_62','d_t_R_62').
heapPtsTo('d_t_R_62','prototype','p_t_R_62').
prototype('p_t_R_62','h_FP').
methodRet('d_t_R_62','t_R_62').
formal('d_t_R_62','1','key_R_62').
formal('d_t_R_62','2','params_R_62').
ptsTo('o_R_63','d_o_R_63').
heapPtsTo('d_o_R_63','prototype','p_o_R_63').
prototype('p_o_R_63','h_FP').
methodRet('d_o_R_63','o_R_63').
formal('d_o_R_63','1','key_R_63').
ptsTo('tE_R_64','d_tE_R_64').
heapPtsTo('d_tE_R_64','prototype','p_tE_R_64').
prototype('p_tE_R_64','h_FP').
methodRet('d_tE_R_64','tE_R_64').
formal('d_tE_R_64','1','id_R_64').
formal('d_tE_R_64','2','key_R_64').
formal('d_tE_R_64','3','attr_R_64').
formal('d_tE_R_64','4','esc_R_64').
load('t80','document','createElement').
actual('23','1','div').
callRet('23','div').
assign('styleTemplate_R_0','t81').
load('t82','styleTemplate_R_0','innerHTML').
actual('24','1','editStyleLabel').
callRet('24','editStyleLabel').
actual('25','1','enableStyleLabel').
callRet('25','enableStyleLabel').
actual('26','1','disableStyleLabel').
callRet('26','disableStyleLabel').
actual('27','1','deleteStyleLabel').
callRet('27','deleteStyleLabel').
actual('28','1','checkForUpdate').
callRet('28','checkForUpdate').
actual('29','1','installUpdate').
callRet('29','installUpdate').
store('styleTemplate_R_0','innerHTML','t100').
load('t101','document','createElement').
actual('30','1','span').
callRet('30','span').
assign('appliesToExtraTemplate_R_0','t102').
load('t103','appliesToExtraTemplate_R_0','className').
store('appliesToExtraTemplate_R_0','className','applies-to-extra').
load('t104','appliesToExtraTemplate_R_0','innerHTML').
actual('31','1','appliesDisplayTruncatedSuffix').
callRet('31','appliesDisplayTruncatedSuffix').
store('appliesToExtraTemplate_R_0','innerHTML','t105').
actual('32','1','t107').
callRet('32','t107').
actual('32','2','showStyles_R_?').
callRet('32','showStyles_R_?').
assign('t106','t108').
ptsTo('showStyles_R_65','d_showStyles_R_65').
heapPtsTo('d_showStyles_R_65','prototype','p_showStyles_R_65').
prototype('p_showStyles_R_65','h_FP').
methodRet('d_showStyles_R_65','showStyles_R_65').
formal('d_showStyles_R_65','1','styles_R_65').
ptsTo('createStyleElement_R_67','d_createStyleElement_R_67').
heapPtsTo('d_createStyleElement_R_67','prototype','p_createStyleElement_R_67').
prototype('p_createStyleElement_R_67','h_FP').
methodRet('d_createStyleElement_R_67','createStyleElement_R_67').
formal('d_createStyleElement_R_67','1','style_R_67').
ptsTo('enable_R_73','d_enable_R_73').
heapPtsTo('d_enable_R_73','prototype','p_enable_R_73').
prototype('p_enable_R_73','h_FP').
methodRet('d_enable_R_73','enable_R_73').
formal('d_enable_R_73','1','event_R_73').
formal('d_enable_R_73','2','enabled_R_73').
ptsTo('doDelete_R_74','d_doDelete_R_74').
heapPtsTo('d_doDelete_R_74','prototype','p_doDelete_R_74').
prototype('p_doDelete_R_74','h_FP').
methodRet('d_doDelete_R_74','doDelete_R_74').
ptsTo('getId_R_75','d_getId_R_75').
heapPtsTo('d_getId_R_75','prototype','p_getId_R_75').
prototype('p_getId_R_75','h_FP').
methodRet('d_getId_R_75','getId_R_75').
formal('d_getId_R_75','1','event_R_75').
ptsTo('getStyleElement_R_76','d_getStyleElement_R_76').
heapPtsTo('d_getStyleElement_R_76','prototype','p_getStyleElement_R_76').
prototype('p_getStyleElement_R_76','h_FP').
methodRet('d_getStyleElement_R_76','getStyleElement_R_76').
formal('d_getStyleElement_R_76','1','event_R_76').
load('t110','chrome','extension').
load('t111','t110','onRequest').
load('t112','t111','addListener').
actual('33','1','lambda_R_77').
callRet('33','lambda_R_77').
assign('t109','t113').
ptsTo('lambda_R_77','d_lambda_R_77').
heapPtsTo('d_lambda_R_77','prototype','p_lambda_R_77').
prototype('p_lambda_R_77','h_FP').
methodRet('d_lambda_R_77','lambda_R_77').
formal('d_lambda_R_77','1','request_R_77').
formal('d_lambda_R_77','2','sender_R_77').
formal('d_lambda_R_77','3','sendResponse_R_77').
ptsTo('handleUpdate_R_78','d_handleUpdate_R_78').
heapPtsTo('d_handleUpdate_R_78','prototype','p_handleUpdate_R_78').
prototype('p_handleUpdate_R_78','h_FP').
methodRet('d_handleUpdate_R_78','handleUpdate_R_78').
formal('d_handleUpdate_R_78','1','style_R_78').
ptsTo('handleDelete_R_79','d_handleDelete_R_79').
heapPtsTo('d_handleDelete_R_79','prototype','p_handleDelete_R_79').
prototype('p_handleDelete_R_79','h_FP').
methodRet('d_handleDelete_R_79','handleDelete_R_79').
formal('d_handleDelete_R_79','1','id_R_79').
ptsTo('doCheckUpdate_R_80','d_doCheckUpdate_R_80').
heapPtsTo('d_doCheckUpdate_R_80','prototype','p_doCheckUpdate_R_80').
prototype('p_doCheckUpdate_R_80','h_FP').
methodRet('d_doCheckUpdate_R_80','doCheckUpdate_R_80').
formal('d_doCheckUpdate_R_80','1','event_R_80').
ptsTo('checkUpdateAll_R_81','d_checkUpdateAll_R_81').
heapPtsTo('d_checkUpdateAll_R_81','prototype','p_checkUpdateAll_R_81').
prototype('p_checkUpdateAll_R_81','h_FP').
methodRet('d_checkUpdateAll_R_81','checkUpdateAll_R_81').
ptsTo('checkUpdate_R_82','d_checkUpdate_R_82').
heapPtsTo('d_checkUpdate_R_82','prototype','p_checkUpdate_R_82').
prototype('p_checkUpdate_R_82','h_FP').
methodRet('d_checkUpdate_R_82','checkUpdate_R_82').
formal('d_checkUpdate_R_82','1','element_R_82').
ptsTo('checkNeedsUpdate_R_84','d_checkNeedsUpdate_R_84').
heapPtsTo('d_checkNeedsUpdate_R_84','prototype','p_checkNeedsUpdate_R_84').
prototype('p_checkNeedsUpdate_R_84','h_FP').
methodRet('d_checkNeedsUpdate_R_84','checkNeedsUpdate_R_84').
formal('d_checkNeedsUpdate_R_84','1','id_R_84').
formal('d_checkNeedsUpdate_R_84','2','serverJson_R_84').
ptsTo('handleNeedsUpdate_R_86','d_handleNeedsUpdate_R_86').
heapPtsTo('d_handleNeedsUpdate_R_86','prototype','p_handleNeedsUpdate_R_86').
prototype('p_handleNeedsUpdate_R_86','h_FP').
methodRet('d_handleNeedsUpdate_R_86','handleNeedsUpdate_R_86').
formal('d_handleNeedsUpdate_R_86','1','needsUpdate_R_86').
formal('d_handleNeedsUpdate_R_86','2','id_R_86').
formal('d_handleNeedsUpdate_R_86','3','serverJson_R_86').
ptsTo('doUpdate_R_87','d_doUpdate_R_87').
heapPtsTo('d_doUpdate_R_87','prototype','p_doUpdate_R_87').
prototype('p_doUpdate_R_87','h_FP').
methodRet('d_doUpdate_R_87','doUpdate_R_87').
formal('d_doUpdate_R_87','1','event_R_87').
ptsTo('codeIsEqual_R_89','d_codeIsEqual_R_89').
heapPtsTo('d_codeIsEqual_R_89','prototype','p_codeIsEqual_R_89').
prototype('p_codeIsEqual_R_89','h_FP').
methodRet('d_codeIsEqual_R_89','codeIsEqual_R_89').
formal('d_codeIsEqual_R_89','1','a_R_89').
formal('d_codeIsEqual_R_89','2','b_R_89').
ptsTo('jsonEquals_R_91','d_jsonEquals_R_91').
heapPtsTo('d_jsonEquals_R_91','prototype','p_jsonEquals_R_91').
prototype('p_jsonEquals_R_91','h_FP').
methodRet('d_jsonEquals_R_91','jsonEquals_R_91').
formal('d_jsonEquals_R_91','1','a_R_91').
formal('d_jsonEquals_R_91','2','b_R_91').
formal('d_jsonEquals_R_91','3','property_R_91').
ptsTo('getType_R_92','d_getType_R_92').
heapPtsTo('d_getType_R_92','prototype','p_getType_R_92').
prototype('p_getType_R_92','h_FP').
methodRet('d_getType_R_92','getType_R_92').
formal('d_getType_R_92','1','o_R_92').
load('t114','document','title').
actual('34','1','manageTitle').
callRet('34','manageTitle').
store('document','title','t115').
ptsTo('notifyAllTabs_R_93','d_notifyAllTabs_R_93').
heapPtsTo('d_notifyAllTabs_R_93','prototype','p_notifyAllTabs_R_93').
prototype('p_notifyAllTabs_R_93','h_FP').
methodRet('d_notifyAllTabs_R_93','notifyAllTabs_R_93').
formal('d_notifyAllTabs_R_93','1','request_R_93').
ptsTo('updateBadgeText_R_97','d_updateBadgeText_R_97').
heapPtsTo('d_updateBadgeText_R_97','prototype','p_updateBadgeText_R_97').
prototype('p_updateBadgeText_R_97','h_FP').
methodRet('d_updateBadgeText_R_97','updateBadgeText_R_97').
formal('d_updateBadgeText_R_97','1','tab_R_97').
ptsTo('getBadgeText_R_99','d_getBadgeText_R_99').
heapPtsTo('d_getBadgeText_R_99','prototype','p_getBadgeText_R_99').
prototype('p_getBadgeText_R_99','h_FP').
methodRet('d_getBadgeText_R_99','getBadgeText_R_99').
formal('d_getBadgeText_R_99','1','styles_R_99').
assign('namespacePattern_R_0','{"regexp": "^\\s*@namespace\\s+([a-zA-Z]+\\s+)?url\\(\\"?http:\\/\\/www.w3.org\\/1999\\/xhtml\\"?\\);?\\s*$", "modifiers": ""}').
ptsTo('getDatabase_R_101','d_getDatabase_R_101').
heapPtsTo('d_getDatabase_R_101','prototype','p_getDatabase_R_101').
prototype('p_getDatabase_R_101','h_FP').
methodRet('d_getDatabase_R_101','getDatabase_R_101').
formal('d_getDatabase_R_101','1','ready_R_101').
formal('d_getDatabase_R_101','2','error_R_101').
ptsTo('dbV11_R_102','d_dbV11_R_102').
heapPtsTo('d_dbV11_R_102','prototype','p_dbV11_R_102').
prototype('p_dbV11_R_102','h_FP').
methodRet('d_dbV11_R_102','dbV11_R_102').
formal('d_dbV11_R_102','1','d_R_102').
formal('d_dbV11_R_102','2','error_R_102').
formal('d_dbV11_R_102','3','done_R_102').
ptsTo('dbV12_R_105','d_dbV12_R_105').
heapPtsTo('d_dbV12_R_105','prototype','p_dbV12_R_105').
prototype('p_dbV12_R_105','h_FP').
methodRet('d_dbV12_R_105','dbV12_R_105').
formal('d_dbV12_R_105','1','d_R_105').
formal('d_dbV12_R_105','2','error_R_105').
formal('d_dbV12_R_105','3','done_R_105').
ptsTo('dbV13_R_108','d_dbV13_R_108').
heapPtsTo('d_dbV13_R_108','prototype','p_dbV13_R_108').
prototype('p_dbV13_R_108','h_FP').
methodRet('d_dbV13_R_108','dbV13_R_108').
formal('d_dbV13_R_108','1','d_R_108').
formal('d_dbV13_R_108','2','error_R_108').
formal('d_dbV13_R_108','3','done_R_108').
ptsTo('getStyles_R_111','d_getStyles_R_111').
heapPtsTo('d_getStyles_R_111','prototype','p_getStyles_R_111').
prototype('p_getStyles_R_111','h_FP').
methodRet('d_getStyles_R_111','getStyles_R_111').
formal('d_getStyles_R_111','1','options_R_111').
formal('d_getStyles_R_111','2','callback_R_111').
ptsTo('getCache_R_117','d_getCache_R_117').
heapPtsTo('d_getCache_R_117','prototype','p_getCache_R_117').
prototype('p_getCache_R_117','h_FP').
methodRet('d_getCache_R_117','getCache_R_117').
formal('d_getCache_R_117','1','callback_R_117').
ptsTo('fixBoolean_R_118','d_fixBoolean_R_118').
heapPtsTo('d_fixBoolean_R_118','prototype','p_fixBoolean_R_118').
prototype('p_fixBoolean_R_118','h_FP').
methodRet('d_fixBoolean_R_118','fixBoolean_R_118').
formal('d_fixBoolean_R_118','1','b_R_118').
ptsTo('loadStyles_R_119','d_loadStyles_R_119').
heapPtsTo('d_loadStyles_R_119','prototype','p_loadStyles_R_119').
prototype('p_loadStyles_R_119','h_FP').
methodRet('d_loadStyles_R_119','loadStyles_R_119').
formal('d_loadStyles_R_119','1','styleIds_R_119').
formal('d_loadStyles_R_119','2','enabled_R_119').
formal('d_loadStyles_R_119','3','url_R_119').
formal('d_loadStyles_R_119','4','callback_R_119').
ptsTo('checkStyle_R_122','d_checkStyle_R_122').
heapPtsTo('d_checkStyle_R_122','prototype','p_checkStyle_R_122').
prototype('p_checkStyle_R_122','h_FP').
methodRet('d_checkStyle_R_122','checkStyle_R_122').
formal('d_checkStyle_R_122','1','style_R_122').
formal('d_checkStyle_R_122','2','enabled_R_122').
formal('d_checkStyle_R_122','3','url_R_122').
ptsTo('loadStylesFromDB_R_123','d_loadStylesFromDB_R_123').
heapPtsTo('d_loadStylesFromDB_R_123','prototype','p_loadStylesFromDB_R_123').
prototype('p_loadStylesFromDB_R_123','h_FP').
methodRet('d_loadStylesFromDB_R_123','loadStylesFromDB_R_123').
formal('d_loadStylesFromDB_R_123','1','styles_R_123').
formal('d_loadStylesFromDB_R_123','2','styleIds_R_123').
formal('d_loadStylesFromDB_R_123','3','enabled_R_123').
formal('d_loadStylesFromDB_R_123','4','url_R_123').
formal('d_loadStylesFromDB_R_123','5','callback_R_123').
ptsTo('getGlobalStyleIds_R_130','d_getGlobalStyleIds_R_130').
heapPtsTo('d_getGlobalStyleIds_R_130','prototype','p_getGlobalStyleIds_R_130').
prototype('p_getGlobalStyleIds_R_130','h_FP').
methodRet('d_getGlobalStyleIds_R_130','getGlobalStyleIds_R_130').
formal('d_getGlobalStyleIds_R_130','1','callback_R_130').
ptsTo('saveFromJSON_R_134','d_saveFromJSON_R_134').
heapPtsTo('d_saveFromJSON_R_134','prototype','p_saveFromJSON_R_134').
prototype('p_saveFromJSON_R_134','h_FP').
methodRet('d_saveFromJSON_R_134','saveFromJSON_R_134').
formal('d_saveFromJSON_R_134','1','o_R_134').
formal('d_saveFromJSON_R_134','2','callback_R_134').
ptsTo('saveFromJSONComplete_R_142','d_saveFromJSONComplete_R_142').
heapPtsTo('d_saveFromJSONComplete_R_142','prototype','p_saveFromJSONComplete_R_142').
prototype('p_saveFromJSONComplete_R_142','h_FP').
methodRet('d_saveFromJSONComplete_R_142','saveFromJSONComplete_R_142').
formal('d_saveFromJSONComplete_R_142','1','id_R_142').
formal('d_saveFromJSONComplete_R_142','2','callback_R_142').
ptsTo('reportError_R_147','d_reportError_R_147').
heapPtsTo('d_reportError_R_147','prototype','p_reportError_R_147').
prototype('p_reportError_R_147','h_FP').
methodRet('d_reportError_R_147','reportError_R_147').
ptsTo('isBackground_R_148','d_isBackground_R_148').
heapPtsTo('d_isBackground_R_148','prototype','p_isBackground_R_148').
prototype('p_isBackground_R_148','h_FP').
methodRet('d_isBackground_R_148','isBackground_R_148').
ptsTo('getDomains_R_149','d_getDomains_R_149').
heapPtsTo('d_getDomains_R_149','prototype','p_getDomains_R_149').
prototype('p_getDomains_R_149','h_FP').
methodRet('d_getDomains_R_149','getDomains_R_149').
formal('d_getDomains_R_149','1','url_R_149').
ptsTo('enableStyle_R_150','d_enableStyle_R_150').
heapPtsTo('d_enableStyle_R_150','prototype','p_enableStyle_R_150').
prototype('p_enableStyle_R_150','h_FP').
methodRet('d_enableStyle_R_150','enableStyle_R_150').
formal('d_enableStyle_R_150','1','id_R_150').
formal('d_enableStyle_R_150','2','enabled_R_150').
ptsTo('deleteStyle_R_155','d_deleteStyle_R_155').
heapPtsTo('d_deleteStyle_R_155','prototype','p_deleteStyle_R_155').
prototype('p_deleteStyle_R_155','h_FP').
methodRet('d_deleteStyle_R_155','deleteStyle_R_155').
formal('d_deleteStyle_R_155','1','id_R_155').
load('t117','navigator_R_?','platform').
load('t118','t117','indexOf_R_?').
actual('35','1','Mac').
callRet('35','Mac').
assign('t120','1').
assign('t116','t121').
load('t122','document','documentElement').
load('t123','t122','className').
store('t122','className','notmac').
actual('36','1','styleNameLabel').
callRet('36','styleNameLabel').
actual('37','1','lambda_R_159').
callRet('37','lambda_R_159').
assign('t124','t127').
ptsTo('lambda_R_159','d_lambda_R_159').
heapPtsTo('d_lambda_R_159','prototype','p_lambda_R_159').
prototype('p_lambda_R_159','h_FP').
methodRet('d_lambda_R_159','lambda_R_159').
actual('39','1','styleEnabledLabel').
callRet('39','styleEnabledLabel').
actual('40','1','lambda_R_161').
callRet('40','lambda_R_161').
assign('t128','t131').
ptsTo('lambda_R_161','d_lambda_R_161').
heapPtsTo('d_lambda_R_161','prototype','p_lambda_R_161').
prototype('p_lambda_R_161','h_FP').
methodRet('d_lambda_R_161','lambda_R_161').
assign('t132','t133').
ptsTo('lambda_R_163','d_lambda_R_163').
heapPtsTo('d_lambda_R_163','prototype','p_lambda_R_163').
prototype('p_lambda_R_163','h_FP').
methodRet('d_lambda_R_163','lambda_R_163').
actual('43','1','styleSaveLabel').
callRet('43','styleSaveLabel').
assign('t134','t135').
actual('44','1','styleCancelEditLabel').
callRet('44','styleCancelEditLabel').
assign('t136','t137').
actual('45','1','styleSectionsTitle').
callRet('45','styleSectionsTitle').
actual('46','1','lambda_R_165').
callRet('46','lambda_R_165').
assign('t138','t141').
ptsTo('lambda_R_165','d_lambda_R_165').
heapPtsTo('d_lambda_R_165','prototype','p_lambda_R_165').
prototype('p_lambda_R_165','h_FP').
methodRet('d_lambda_R_165','lambda_R_165').
actual('48','1','manageHeading').
callRet('48','manageHeading').
assign('t142','t143').
actual('49','1','manageText').
callRet('49','manageText').
assign('t144','t145').
actual('50','1','addStyleLabel').
callRet('50','addStyleLabel').
actual('51','1','lambda_R_167').
callRet('51','lambda_R_167').
assign('t146','t149').
ptsTo('lambda_R_167','d_lambda_R_167').
heapPtsTo('d_lambda_R_167','prototype','p_lambda_R_167').
prototype('p_lambda_R_167','h_FP').
methodRet('d_lambda_R_167','lambda_R_167').
actual('53','1','checkAllUpdates').
callRet('53','checkAllUpdates').
assign('t150','t151').
load('t153','navigator_R_?','platform').
load('t154','t153','indexOf').
actual('54','1','Mac').
callRet('54','Mac').
assign('t156','1').
assign('t152','t157').
load('t158','document','documentElement').
load('t159','t158','className').
store('t158','className','notmac').
load('t160','document','createElement').
actual('55','1','div').
callRet('55','div').
assign('styleTemplate_R_0','t161').
load('t162','styleTemplate_R_0','innerHTML').
actual('56','1','editStyleLabel').
callRet('56','editStyleLabel').
actual('57','1','enableStyleLabel').
callRet('57','enableStyleLabel').
actual('58','1','disableStyleLabel').
callRet('58','disableStyleLabel').
actual('59','1','deleteStyleLabel').
callRet('59','deleteStyleLabel').
store('styleTemplate_R_0','innerHTML','t174').
load('t176','chrome','tabs').
load('t177','t176','getSelected').
actual('60','1','null').
callRet('60','null').
actual('60','2','lambda_R_169').
callRet('60','lambda_R_169').
assign('t175','t178').
ptsTo('lambda_R_169','d_lambda_R_169').
heapPtsTo('d_lambda_R_169','prototype','p_lambda_R_169').
prototype('p_lambda_R_169','h_FP').
methodRet('d_lambda_R_169','lambda_R_169').
formal('d_lambda_R_169','1','tab_R_169').
ptsTo('showStyles_R_170','d_showStyles_R_170').
heapPtsTo('d_showStyles_R_170','prototype','p_showStyles_R_170').
prototype('p_showStyles_R_170','h_FP').
methodRet('d_showStyles_R_170','showStyles_R_170').
formal('d_showStyles_R_170','1','styles_R_170').
ptsTo('createStyleElement_R_172','d_createStyleElement_R_172').
heapPtsTo('d_createStyleElement_R_172','prototype','p_createStyleElement_R_172').
prototype('p_createStyleElement_R_172','h_FP').
methodRet('d_createStyleElement_R_172','createStyleElement_R_172').
formal('d_createStyleElement_R_172','1','style_R_172').
ptsTo('enable_R_173','d_enable_R_173').
heapPtsTo('d_enable_R_173','prototype','p_enable_R_173').
prototype('p_enable_R_173','h_FP').
methodRet('d_enable_R_173','enable_R_173').
formal('d_enable_R_173','1','event_R_173').
formal('d_enable_R_173','2','enabled_R_173').
ptsTo('doDelete_R_174','d_doDelete_R_174').
heapPtsTo('d_doDelete_R_174','prototype','p_doDelete_R_174').
prototype('p_doDelete_R_174','h_FP').
methodRet('d_doDelete_R_174','doDelete_R_174').
ptsTo('getId_R_175','d_getId_R_175').
heapPtsTo('d_getId_R_175','prototype','p_getId_R_175').
prototype('p_getId_R_175','h_FP').
methodRet('d_getId_R_175','getId_R_175').
formal('d_getId_R_175','1','event_R_175').
ptsTo('openLink_R_176','d_openLink_R_176').
heapPtsTo('d_openLink_R_176','prototype','p_openLink_R_176').
prototype('p_openLink_R_176','h_FP').
methodRet('d_openLink_R_176','openLink_R_176').
formal('d_openLink_R_176','1','event_R_176').
ptsTo('handleUpdate_R_177','d_handleUpdate_R_177').
heapPtsTo('d_handleUpdate_R_177','prototype','p_handleUpdate_R_177').
prototype('p_handleUpdate_R_177','h_FP').
methodRet('d_handleUpdate_R_177','handleUpdate_R_177').
formal('d_handleUpdate_R_177','1','style_R_177').
ptsTo('handleDelete_R_178','d_handleDelete_R_178').
heapPtsTo('d_handleDelete_R_178','prototype','p_handleDelete_R_178').
prototype('p_handleDelete_R_178','h_FP').
methodRet('d_handleDelete_R_178','handleDelete_R_178').
formal('d_handleDelete_R_178','1','id_R_178').
assign('t179','t180').
ptsTo('lambda_R_179','d_lambda_R_179').
heapPtsTo('d_lambda_R_179','prototype','p_lambda_R_179').
prototype('p_lambda_R_179','h_FP').
methodRet('d_lambda_R_179','lambda_R_179').
actual('62','1','findStylesForSite').
callRet('62','findStylesForSite').
assign('t181','t182').
load('t184','response_R_1','forEach_R_?').
actual('63','1','applyStyle_R_?').
callRet('63','applyStyle_R_?').
assign('t183','t185').
load('t186','document','getElementById_R_?').
actual('64','1','t187').
callRet('64','t187').
assign('e_R_3','t188').
assign('t189','e_R_3').
load('t191','e_R_3','parentNode').
load('t192','t191','removeChild_R_?').
actual('65','1','e_R_3').
callRet('65','e_R_3').
assign('t190','t193').
load('t194','document','createElement_R_?').
actual('66','1','style').
callRet('66','style').
assign('style_R_4','t195').
load('t197','style_R_4','setAttribute_R_?').
load('t198','s_R_4','id').
actual('67','1','id').
callRet('67','id').
actual('67','2','t199').
callRet('67','t199').
assign('t196','t200').
load('t202','style_R_4','setAttribute').
actual('68','1','class').
callRet('68','class').
actual('68','2','stylish').
callRet('68','stylish').
assign('t201','t203').
load('t205','style_R_4','setAttribute').
actual('69','1','type').
callRet('69','type').
actual('69','2','text/css').
callRet('69','text/css').
assign('t204','t206').
load('t208','style_R_4','appendChild_R_?').
load('t209','document','createTextNode_R_?').
load('t210','s_R_4','sections').
load('t211','t210','filter_R_?').
actual('70','1','filterSection_R_?').
callRet('70','filterSection_R_?').
load('t213','t212','map_R_?').
actual('71','1','lambda_R_5').
callRet('71','lambda_R_5').
load('t215','t214','join_R_?').
actual('72','1','
').
callRet('72','
').
actual('73','1','t216').
callRet('73','t216').
actual('74','1','t217').
callRet('74','t217').
assign('t207','t218').
ptsTo('lambda_R_5','d_lambda_R_5').
heapPtsTo('d_lambda_R_5','prototype','p_lambda_R_5').
prototype('p_lambda_R_5','h_FP').
methodRet('d_lambda_R_5','lambda_R_5').
formal('d_lambda_R_5','1','section_R_5').
load('t220','document','head').
assign('t219','t220').
load('t222','document','documentElement').
load('t223','t222','appendChild').
actual('75','1','style_R_4').
callRet('75','style_R_4').
assign('t221','t224').
load('t226','document','head').
load('t227','t226','appendChild').
actual('76','1','style_R_4').
callRet('76','style_R_4').
assign('t225','t228').
load('t229','section_R_5','code').
methodRet('d_lambda_R_5','t229').
load('t231','section_R_6','urls').
assign('t232','t231').
load('t233','section_R_6','urlPrefixes').
assign('t234','t233').
load('t236','section_R_6','domains').
assign('t237','t236').
assign('t230','t238').
methodRet('d_filterSection_R_6','true').
load('t240','section_R_6','urls').
assign('t239','t240').
assign('found_R_6','false').
load('t242','section_R_6','urls').
load('t243','t242','forEach_R_?').
actual('77','1','lambda_R_7').
callRet('77','lambda_R_7').
assign('t241','t244').
ptsTo('lambda_R_7','d_lambda_R_7').
heapPtsTo('d_lambda_R_7','prototype','p_lambda_R_7').
prototype('p_lambda_R_7','h_FP').
methodRet('d_lambda_R_7','lambda_R_7').
formal('d_lambda_R_7','1','url_R_7').
assign('t245','found_R_6').
methodRet('d_filterSection_R_6','true').
load('t247','section_R_6','urlPrefixes').
assign('t246','t247').
assign('found_R_6','false').
load('t249','section_R_6','urlPrefixes').
load('t250','t249','forEach').
actual('78','1','lambda_R_8').
callRet('78','lambda_R_8').
assign('t248','t251').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
formal('d_lambda_R_8','1','urlPrefix_R_8').
assign('t252','found_R_6').
methodRet('d_filterSection_R_6','true').
load('t254','section_R_6','domains').
assign('t253','t254').
assign('found_R_6','false').
load('t255','location_R_?','href').
actual('79','1','t255').
callRet('79','t255').
assign('currentDomains_R_6','t256').
load('t258','section_R_6','domains').
load('t259','t258','forEach').
actual('80','1','lambda_R_9').
callRet('80','lambda_R_9').
assign('t257','t260').
ptsTo('lambda_R_9','d_lambda_R_9').
heapPtsTo('d_lambda_R_9','prototype','p_lambda_R_9').
prototype('p_lambda_R_9','h_FP').
methodRet('d_lambda_R_9','lambda_R_9').
formal('d_lambda_R_9','1','domain_R_9').
assign('t261','found_R_6').
methodRet('d_filterSection_R_6','true').
methodRet('d_filterSection_R_6','false').
load('t263','location_R_?','href').
assign('t262','t264').
assign('found_R_6','true').
methodRet('d_lambda_R_7','null').
load('t266','location_R_?','href').
load('t267','t266','indexOf_R_?').
actual('81','1','urlPrefix_R_8').
callRet('81','urlPrefix_R_8').
assign('t265','t269').
assign('found_R_6','true').
methodRet('d_lambda_R_8','null').
load('t271','currentDomains_R_6','indexOf_R_?').
actual('82','1','domain_R_9').
callRet('82','domain_R_9').
assign('t270','t273').
assign('found_R_6','true').
methodRet('d_lambda_R_9','null').
load('t274','{"regexp": ".*?:\\/*([^\\/]+)", "modifiers": ""}','exec_R_?').
actual('83','1','url_R_10').
callRet('83','url_R_10').
load('t276','t275','1').
assign('d_R_10','t276').
store('domains_R_10','0','d_R_10').
assign('domains_R_10','domains_R_10').
load('t278','d_R_10','indexOf').
actual('84','1','.').
callRet('84','.').
assign('t280','1').
assign('t277','t281').
load('t282','d_R_10','substring_R_?').
load('t283','d_R_10','indexOf_R_?').
actual('85','1','.').
callRet('85','.').
actual('86','1','t285').
callRet('86','t285').
assign('d_R_10','t286').
load('t288','domains_R_10','push_R_?').
actual('87','1','d_R_10').
callRet('87','d_R_10').
assign('t287','t289').
methodRet('d_getDomains_R_10','domains_R_10').
load('t290','style_R_12','sections').
load('t291','style_R_12','sections').
load('t292','t291','filter_R_?').
actual('88','1','lambda_R_13').
callRet('88','lambda_R_13').
store('style_R_12','sections','t293').
ptsTo('lambda_R_13','d_lambda_R_13').
heapPtsTo('d_lambda_R_13','prototype','p_lambda_R_13').
prototype('p_lambda_R_13','h_FP').
methodRet('d_lambda_R_13','lambda_R_13').
formal('d_lambda_R_13','1','section_R_13').
load('t295','style_R_12','sections').
load('t296','t295','size').
assign('t294','t297').
methodRet('d_styleAppliesToUrl_R_12','null').
methodRet('d_styleAppliesToUrl_R_12','style_R_12').
actual('89','1','section_R_13').
callRet('89','section_R_13').
actual('89','2','url_R_12').
callRet('89','url_R_12').
methodRet('d_lambda_R_13','t298').
load('t300','section_R_14','urls').
assign('t301','t300').
load('t302','section_R_14','domains').
assign('t303','t302').
load('t305','section_R_14','urlPrefixes').
assign('t306','t305').
assign('t299','t307').
load('t309','console','log_R_?').
actual('90','1','t310').
callRet('90','t310').
assign('t308','t311').
methodRet('d_sectionAppliesToUrl_R_14','true').
load('t313','section_R_14','urls').
load('t314','section_R_14','urls').
load('t315','t314','indexOf_R_?').
actual('91','1','url_R_14').
callRet('91','url_R_14').
assign('t317','1').
assign('t312','t319').
load('t321','console','log').
actual('92','1','t324').
callRet('92','t324').
assign('t320','t325').
methodRet('d_sectionAppliesToUrl_R_14','true').
load('t327','section_R_14','urlPrefixes').
load('t328','section_R_14','urlPrefixes').
load('t329','t328','some_R_?').
actual('93','1','lambda_R_15').
callRet('93','lambda_R_15').
assign('t326','t331').
load('t333','console','log').
actual('94','1','t336').
callRet('94','t336').
assign('t332','t337').
methodRet('d_sectionAppliesToUrl_R_14','true').
ptsTo('lambda_R_15','d_lambda_R_15').
heapPtsTo('d_lambda_R_15','prototype','p_lambda_R_15').
prototype('p_lambda_R_15','h_FP').
methodRet('d_lambda_R_15','lambda_R_15').
formal('d_lambda_R_15','1','prefix_R_15').
load('t339','section_R_14','domains').
actual('95','1','url_R_14').
callRet('95','url_R_14').
load('t341','t340','some').
actual('96','1','lambda_R_16').
callRet('96','lambda_R_16').
assign('t338','t343').
load('t345','console','log').
actual('97','1','t348').
callRet('97','t348').
assign('t344','t349').
methodRet('d_sectionAppliesToUrl_R_14','true').
ptsTo('lambda_R_16','d_lambda_R_16').
heapPtsTo('d_lambda_R_16','prototype','p_lambda_R_16').
prototype('p_lambda_R_16','h_FP').
methodRet('d_lambda_R_16','lambda_R_16').
formal('d_lambda_R_16','1','domain_R_16').
load('t351','console','log').
actual('98','1','t353').
callRet('98','t353').
assign('t350','t354').
methodRet('d_sectionAppliesToUrl_R_14','false').
load('t355','url_R_14','indexOf_R_?').
actual('99','1','prefix_R_15').
callRet('99','prefix_R_15').
methodRet('d_lambda_R_15','t357').
load('t358','section_R_14','domains').
load('t359','t358','indexOf_R_?').
actual('100','1','domain_R_16').
callRet('100','domain_R_16').
assign('t361','1').
methodRet('d_lambda_R_16','t362').
assign('dirty_R_0','true').
actual('101','1','styleChangesNotSaved').
callRet('101','styleChangesNotSaved').
assign('None','t363').
methodRet('d_lambda_R_18','null').
load('t364','list_R_19','querySelector_R_?').
actual('102','1','.applies-to-everything').
callRet('102','.applies-to-everything').
assign('showingEverything_R_19','t366').
assign('t367','showingEverything_R_19').
load('t369','list_R_19','removeChild_R_?').
load('t370','list_R_19','firstChild').
actual('103','1','t370').
callRet('103','t370').
assign('t368','t371').
assign('e_R_19','__undefined__').
assign('t372','t373').
load('t375','list_R_19','hasChildNodes').
assign('t374','t377').
load('t378','appliesToEverythingTemplate_R_0','cloneNode_R_?').
actual('105','1','true').
callRet('105','true').
assign('e_R_19','t379').
load('t380','appliesToTemplate_R_0','cloneNode').
actual('106','1','true').
callRet('106','true').
assign('e_R_19','t381').
load('t383','list_R_19','hasChildNodes_R_?').
assign('t382','t384').
load('t385','e_R_19','querySelector').
load('t386','t385','[name=applies-type]').
load('t387','t386','value').
load('t388','list_R_19','querySelector').
actual('108','1','li:last-child [name="applies-type"]').
callRet('108','li:last-child [name="applies-type"]').
load('t390','t389','value').
store('t386','value','t390').
load('t391','appliesToTemplate_R_0','cloneNode').
actual('109','1','true').
callRet('109','true').
assign('e_R_19','t392').
load('t393','e_R_19','querySelector').
load('t394','t393','[name=applies-type]').
load('t395','t394','value').
store('t394','value','name_R_19').
load('t396','e_R_19','querySelector').
load('t397','t396','[name=applies-value]').
load('t398','t397','value').
store('t397','value','value_R_19').
load('t400','list_R_19','appendChild_R_?').
actual('110','1','e_R_19').
callRet('110','e_R_19').
assign('t399','t401').
load('t402','sectionTemplate_R_0','cloneNode_R_?').
actual('111','1','true').
callRet('111','true').
assign('div_R_20','t403').
load('t404','div_R_20','querySelector_R_?').
actual('112','1','.applies-to-list').
callRet('112','.applies-to-list').
assign('appliesTo_R_20','t405').
assign('t406','section_R_20').
actual('113','1','appliesTo_R_20').
callRet('113','appliesTo_R_20').
assign('t407','t408').
load('t409','div_R_20','querySelector').
load('t410','t409','.code').
load('t411','t410','value').
load('t412','section_R_20','code').
store('t410','value','t412').
load('t414','section_R_20','urls').
assign('t413','t414').
load('t416','section_R_20','urls').
load('t417','t416','forEach_R_?').
actual('114','1','lambda_R_21').
callRet('114','lambda_R_21').
assign('t415','t418').
ptsTo('lambda_R_21','d_lambda_R_21').
heapPtsTo('d_lambda_R_21','prototype','p_lambda_R_21').
prototype('p_lambda_R_21','h_FP').
methodRet('d_lambda_R_21','lambda_R_21').
formal('d_lambda_R_21','1','url_R_21').
load('t420','section_R_20','urlPrefixes').
assign('t419','t420').
load('t422','section_R_20','urlPrefixes').
load('t423','t422','forEach').
actual('115','1','lambda_R_22').
callRet('115','lambda_R_22').
assign('t421','t424').
ptsTo('lambda_R_22','d_lambda_R_22').
heapPtsTo('d_lambda_R_22','prototype','p_lambda_R_22').
prototype('p_lambda_R_22','h_FP').
methodRet('d_lambda_R_22','lambda_R_22').
formal('d_lambda_R_22','1','url_R_22').
load('t426','section_R_20','domains').
assign('t425','t426').
load('t428','section_R_20','domains').
load('t429','t428','forEach').
actual('116','1','lambda_R_23').
callRet('116','lambda_R_23').
assign('t427','t430').
ptsTo('lambda_R_23','d_lambda_R_23').
heapPtsTo('d_lambda_R_23','prototype','p_lambda_R_23').
prototype('p_lambda_R_23','h_FP').
methodRet('d_lambda_R_23','lambda_R_23').
formal('d_lambda_R_23','1','d_R_23').
load('t432','section_R_20','urls').
assign('t433','t432').
load('t434','section_R_20','urlPrefixes').
assign('t435','t434').
load('t437','section_R_20','domains').
assign('t438','t437').
assign('t431','t439').
actual('117','1','appliesTo_R_20').
callRet('117','appliesTo_R_20').
assign('t440','t441').
load('t442','document','getElementById_R_?').
actual('118','1','sections').
callRet('118','sections').
assign('sections_R_20','t443').
load('t445','sections_R_20','appendChild_R_?').
actual('119','1','div_R_20').
callRet('119','div_R_20').
assign('t444','t446').
actual('120','1','appliesTo_R_20').
callRet('120','appliesTo_R_20').
actual('120','2','url').
callRet('120','url').
actual('120','3','url_R_21').
callRet('120','url_R_21').
assign('t447','t448').
actual('121','1','appliesTo_R_20').
callRet('121','appliesTo_R_20').
actual('121','2','url-prefix').
callRet('121','url-prefix').
actual('121','3','url_R_22').
callRet('121','url_R_22').
assign('t449','t450').
actual('122','1','appliesTo_R_20').
callRet('122','appliesTo_R_20').
actual('122','2','domain').
callRet('122','domain').
actual('122','3','d_R_23').
callRet('122','d_R_23').
assign('t451','t452').
load('t453','event_R_24','target').
load('t454','t453','parentNode').
load('t455','t454','parentNode').
assign('appliesToList_R_24','t455').
load('t457','appliesToList_R_24','removeChild_R_?').
load('t458','event_R_24','target').
load('t459','t458','parentNode').
actual('123','1','t459').
callRet('123','t459').
assign('t456','t460').
load('t462','appliesToList_R_24','hasChildNodes_R_?').
assign('t464','t463').
assign('t461','t464').
load('t466','appliesToList_R_24','appendChild_R_?').
actual('125','1','appliesToEverythingTemplate_R_0').
callRet('125','appliesToEverythingTemplate_R_0').
assign('t465','t467').
assign('t468','t469').
load('t471','event_R_25','target').
load('t472','t471','parentNode').
load('t473','t472','parentNode').
load('t474','t473','removeChild_R_?').
load('t475','event_R_25','target').
load('t476','t475','parentNode').
actual('127','1','t476').
callRet('127','t476').
assign('t470','t477').
assign('t478','t479').
actual('129','1','sections-help').
callRet('129','sections-help').
actual('129','2','helpAlt').
callRet('129','helpAlt').
actual('129','3','alt').
callRet('129','alt').
assign('t480','t481').
load('t482','{"regexp": "[&\\?]id=([0-9]+)", "modifiers": ""}','exec_R_?').
load('t483','location_R_?','href').
actual('130','1','t483').
callRet('130','t483').
assign('idMatch_R_26','t484').
load('t487','idMatch_R_26','length').
assign('t485','t489').
assign('t490','t491').
load('t492','document','title').
actual('132','1','addStyleTitle').
callRet('132','addStyleTitle').
store('document','title','t493').
actual('133','1','heading').
callRet('133','heading').
actual('133','2','addStyleTitle').
callRet('133','addStyleTitle').
assign('t494','t495').
methodRet('d_init_R_26','null').
load('t496','idMatch_R_26','1').
assign('id_R_26','t496').
store('t498','id_R_26','id_R_26').
actual('134','1','t498').
callRet('134','t498').
actual('134','2','lambda_R_27').
callRet('134','lambda_R_27').
assign('t497','t499').
ptsTo('lambda_R_27','d_lambda_R_27').
heapPtsTo('d_lambda_R_27','prototype','p_lambda_R_27').
prototype('p_lambda_R_27','h_FP').
methodRet('d_lambda_R_27','lambda_R_27').
formal('d_lambda_R_27','1','styles_R_27').
load('t500','styles_R_27','0').
assign('style_R_27','t500').
load('t501','style_R_27','id').
assign('styleId_R_0','t501').
actual('135','1','style_R_27').
callRet('135','style_R_27').
assign('t502','t503').
load('t504','document','getElementById_R_?').
load('t505','t504','name').
load('t506','t505','value').
load('t507','style_R_28','name').
store('t505','value','t507').
load('t508','document','getElementById').
load('t509','t508','enabled').
load('t510','t509','checked').
load('t511','style_R_28','enabled').
store('t509','checked','t512').
load('t513','document','getElementById').
load('t514','t513','heading').
load('t515','t514','innerHTML').
actual('136','1','editStyleHeading').
callRet('136','editStyleHeading').
store('t514','innerHTML','t516').
actual('137','1','style_R_28').
callRet('137','style_R_28').
assign('t517','t518').
load('t520','style_R_28','sections').
load('t521','t520','forEach_R_?').
actual('138','1','addSection_R_?').
callRet('138','addSection_R_?').
assign('t519','t522').
load('t523','document','title').
load('t524','style_R_29','name').
store('t523','0','t524').
actual('139','1','editStyleTitle').
callRet('139','editStyleTitle').
actual('139','2','t523').
callRet('139','t523').
store('document','title','t525').
load('t526','document','getElementById_R_?').
actual('140','1','name').
callRet('140','name').
load('t528','t527','value').
assign('name_R_30','t528').
assign('t529','t530').
actual('141','1','styleMissingName').
callRet('141','styleMissingName').
methodRet('d_validate_R_30','t531').
methodRet('d_validate_R_30','null').
assign('error_R_31','t532').
assign('t533','error_R_31').
actual('143','1','error_R_31').
callRet('143','error_R_31').
assign('t534','t535').
methodRet('d_save_R_31','null').
load('t536','document','getElementById_R_?').
actual('144','1','name').
callRet('144','name').
load('t538','t537','value').
assign('name_R_31','t538').
load('t539','document','getElementById').
actual('145','1','enabled').
callRet('145','enabled').
load('t541','t540','checked').
assign('enabled_R_31','t541').
actual('146','1','lambda_R_32').
callRet('146','lambda_R_32').
actual('146','2','reportError_R_?').
callRet('146','reportError_R_?').
assign('t542','t543').
ptsTo('lambda_R_32','d_lambda_R_32').
heapPtsTo('d_lambda_R_32','prototype','p_lambda_R_32').
prototype('p_lambda_R_32','h_FP').
methodRet('d_lambda_R_32','lambda_R_32').
formal('d_lambda_R_32','1','db_R_32').
load('t545','db_R_32','transaction_R_?').
actual('147','1','lambda_R_33').
callRet('147','lambda_R_33').
actual('147','2','reportError_R_?').
callRet('147','reportError_R_?').
actual('147','3','saveComplete_R_?').
callRet('147','saveComplete_R_?').
assign('t544','t546').
ptsTo('lambda_R_33','d_lambda_R_33').
heapPtsTo('d_lambda_R_33','prototype','p_lambda_R_33').
prototype('p_lambda_R_33','h_FP').
methodRet('d_lambda_R_33','lambda_R_33').
formal('d_lambda_R_33','1','t_R_33').
assign('sections_R_33','t547').
assign('t548','t549').
load('t551','t_R_33','executeSql_R_?').
store('t552','0','name_R_31').
store('t552','1','enabled_R_31').
store('t552','2','styleId_R_0').
actual('149','1','UPDATE styles SET name = ?, enabled = ? WHERE id = ?;').
callRet('149','UPDATE styles SET name = ?, enabled = ? WHERE id = ?;').
actual('149','2','t552').
callRet('149','t552').
assign('t550','t553').
load('t555','t_R_33','executeSql').
store('t556','0','styleId_R_0').
actual('150','1','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
callRet('150','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
actual('150','2','t556').
callRet('150','t556').
assign('t554','t557').
load('t559','t_R_33','executeSql').
store('t560','0','styleId_R_0').
actual('151','1','DELETE FROM sections WHERE style_id = ?;').
callRet('151','DELETE FROM sections WHERE style_id = ?;').
actual('151','2','t560').
callRet('151','t560').
assign('t558','t561').
load('t563','sections_R_33','forEach_R_?').
actual('152','1','lambda_R_34').
callRet('152','lambda_R_34').
assign('t562','t564').
ptsTo('lambda_R_34','d_lambda_R_34').
heapPtsTo('d_lambda_R_34','prototype','p_lambda_R_34').
prototype('p_lambda_R_34','h_FP').
methodRet('d_lambda_R_34','lambda_R_34').
formal('d_lambda_R_34','1','s_R_34').
load('t566','t_R_33','executeSql').
store('t567','0','name_R_31').
store('t567','1','enabled_R_31').
actual('153','1','INSERT INTO styles (name, enabled) VALUES (?, ?);').
callRet('153','INSERT INTO styles (name, enabled) VALUES (?, ?);').
actual('153','2','t567').
callRet('153','t567').
assign('t565','t568').
load('t570','sections_R_33','forEach').
actual('154','1','lambda_R_36').
callRet('154','lambda_R_36').
assign('t569','t571').
ptsTo('lambda_R_36','d_lambda_R_36').
heapPtsTo('d_lambda_R_36','prototype','p_lambda_R_36').
prototype('p_lambda_R_36','h_FP').
methodRet('d_lambda_R_36','lambda_R_36').
formal('d_lambda_R_36','1','s_R_36').
assign('dirty_R_0','false').
load('t573','t_R_33','executeSql_R_?').
store('t574','0','styleId_R_0').
load('t575','s_R_34','code').
store('t574','1','t575').
actual('155','1','INSERT INTO sections (style_id, code) VALUES (?, ?);').
callRet('155','INSERT INTO sections (style_id, code) VALUES (?, ?);').
actual('155','2','t574').
callRet('155','t574').
assign('t572','t576').
load('t578','s_R_34','meta').
load('t579','t578','forEach_R_?').
actual('156','1','lambda_R_35').
callRet('156','lambda_R_35').
assign('t577','t580').
ptsTo('lambda_R_35','d_lambda_R_35').
heapPtsTo('d_lambda_R_35','prototype','p_lambda_R_35').
prototype('p_lambda_R_35','h_FP').
methodRet('d_lambda_R_35','lambda_R_35').
formal('d_lambda_R_35','1','m_R_35').
load('t582','t_R_33','executeSql_R_?').
load('t584','m_R_35','0').
store('t583','0','t584').
load('t585','m_R_35','1').
store('t583','1','t585').
actual('157','1','INSERT INTO section_meta (section_id, name, value) SELECT id, ?, ? FROM sections ORDER BY id DESC LIMIT 1;').
callRet('157','INSERT INTO section_meta (section_id, name, value) SELECT id, ?, ? FROM sections ORDER BY id DESC LIMIT 1;').
actual('157','2','t583').
callRet('157','t583').
assign('t581','t586').
load('t588','t_R_33','executeSql_R_?').
load('t590','s_R_36','code').
store('t589','0','t590').
actual('158','1','INSERT INTO sections (style_id, code) SELECT id, ? FROM styles ORDER BY id DESC LIMIT 1;').
callRet('158','INSERT INTO sections (style_id, code) SELECT id, ? FROM styles ORDER BY id DESC LIMIT 1;').
actual('158','2','t589').
callRet('158','t589').
assign('t587','t591').
load('t593','s_R_36','meta').
load('t594','t593','forEach_R_?').
actual('159','1','lambda_R_37').
callRet('159','lambda_R_37').
assign('t592','t595').
ptsTo('lambda_R_37','d_lambda_R_37').
heapPtsTo('d_lambda_R_37','prototype','p_lambda_R_37').
prototype('p_lambda_R_37','h_FP').
methodRet('d_lambda_R_37','lambda_R_37').
formal('d_lambda_R_37','1','m_R_37').
load('t597','t_R_33','executeSql_R_?').
load('t599','m_R_37','0').
store('t598','0','t599').
load('t600','m_R_37','1').
store('t598','1','t600').
actual('160','1','INSERT INTO section_meta (section_id, name, value) SELECT id, ?, ? FROM sections ORDER BY id DESC LIMIT 1;').
callRet('160','INSERT INTO section_meta (section_id, name, value) SELECT id, ?, ? FROM sections ORDER BY id DESC LIMIT 1;').
actual('160','2','t598').
callRet('160','t598').
assign('t596','t601').
assign('sections_R_38','sections_R_38').
load('t603','Array_R_?','prototype').
load('t604','t603','forEach').
load('t605','t604','call_R_?').
load('t606','document','querySelectorAll_R_?').
actual('161','1','#sections > div').
callRet('161','#sections > div').
actual('162','1','t607').
callRet('162','t607').
actual('162','2','lambda_R_39').
callRet('162','lambda_R_39').
assign('t602','t608').
ptsTo('lambda_R_39','d_lambda_R_39').
heapPtsTo('d_lambda_R_39','prototype','p_lambda_R_39').
prototype('p_lambda_R_39','h_FP').
methodRet('d_lambda_R_39','lambda_R_39').
formal('d_lambda_R_39','1','div_R_39').
methodRet('d_getSections_R_38','sections_R_38').
load('t609','div_R_39','querySelector_R_?').
actual('163','1','.code').
callRet('163','.code').
load('t611','t610','value').
assign('code_R_39','t611').
load('t613','{"regexp": "^\\s*$", "modifiers": ""}','test_R_?').
actual('164','1','code_R_39').
callRet('164','code_R_39').
assign('t612','t614').
methodRet('d_lambda_R_39','null').
load('t616','sections_R_38','push_R_?').
store('t617','code_R_39','code_R_39').
actual('165','1','div_R_39').
callRet('165','div_R_39').
store('t617','meta_R_?','t618').
actual('166','1','t617').
callRet('166','t617').
assign('t615','t619').
assign('meta_R_40','meta_R_40').
load('t621','Array_R_?','prototype').
load('t622','t621','forEach').
load('t623','t622','call_R_?').
load('t624','e_R_40','querySelector_R_?').
actual('167','1','.applies-to-list').
callRet('167','.applies-to-list').
load('t626','t625','childNodes').
actual('168','1','t626').
callRet('168','t626').
actual('168','2','lambda_R_41').
callRet('168','lambda_R_41').
assign('t620','t627').
ptsTo('lambda_R_41','d_lambda_R_41').
heapPtsTo('d_lambda_R_41','prototype','p_lambda_R_41').
prototype('p_lambda_R_41','h_FP').
methodRet('d_lambda_R_41','lambda_R_41').
formal('d_lambda_R_41','1','li_R_41').
methodRet('d_getMeta_R_40','meta_R_40').
load('t629','li_R_41','className').
load('t630','appliesToEverythingTemplate_R_0','className').
assign('t628','t631').
methodRet('d_lambda_R_41','null').
load('t632','li_R_41','querySelector_R_?').
actual('169','1','[name=applies-type]').
callRet('169','[name=applies-type]').
load('t634','t633','value').
assign('a_R_41','t634').
load('t635','li_R_41','querySelector').
actual('170','1','[name=applies-value]').
callRet('170','[name=applies-value]').
load('t637','t636','value').
assign('b_R_41','t637').
assign('t638','t639').
load('t641','meta_R_40','push_R_?').
store('t642','0','a_R_41').
store('t642','1','b_R_41').
actual('171','1','t642').
callRet('171','t642').
assign('t640','t643').
assign('t644','t645').
actual('172','1','lambda_R_43').
callRet('172','lambda_R_43').
assign('t646','t647').
ptsTo('lambda_R_43','d_lambda_R_43').
heapPtsTo('d_lambda_R_43','prototype','p_lambda_R_43').
prototype('p_lambda_R_43','h_FP').
methodRet('d_lambda_R_43','lambda_R_43').
formal('d_lambda_R_43','1','db_R_43').
methodRet('d_saveComplete_R_42','null').
actual('173','1','false').
callRet('173','false').
assign('t648','t649').
load('t651','db_R_43','readTransaction_R_?').
actual('174','1','lambda_R_44').
callRet('174','lambda_R_44').
actual('174','2','reportError_R_?').
callRet('174','reportError_R_?').
assign('t650','t652').
ptsTo('lambda_R_44','d_lambda_R_44').
heapPtsTo('d_lambda_R_44','prototype','p_lambda_R_44').
prototype('p_lambda_R_44','h_FP').
methodRet('d_lambda_R_44','lambda_R_44').
formal('d_lambda_R_44','1','t_R_44').
load('t654','t_R_44','executeSql_R_?').
actual('175','1','SELECT id FROM styles ORDER BY id DESC LIMIT 1').
callRet('175','SELECT id FROM styles ORDER BY id DESC LIMIT 1').
actual('175','2','t655').
callRet('175','t655').
actual('175','3','lambda_R_45').
callRet('175','lambda_R_45').
actual('175','4','reportError_R_?').
callRet('175','reportError_R_?').
assign('t653','t656').
ptsTo('lambda_R_45','d_lambda_R_45').
heapPtsTo('d_lambda_R_45','prototype','p_lambda_R_45').
prototype('p_lambda_R_45','h_FP').
methodRet('d_lambda_R_45','lambda_R_45').
formal('d_lambda_R_45','1','t_R_45').
formal('d_lambda_R_45','2','r_R_45').
load('t657','r_R_45','rows').
load('t658','t657','item_R_?').
actual('176','1','0').
callRet('176','0').
load('t660','t659','id').
assign('styleId_R_0','t660').
actual('177','1','true').
callRet('177','true').
assign('t661','t662').
load('t664','chrome','extension').
load('t665','t664','sendRequest').
store('t666','name_R_?','styleChanged').
actual('178','1','t666').
callRet('178','t666').
assign('t663','t667').
store('t669','id_R_?','styleId_R_0').
actual('179','1','t669').
callRet('179','t669').
actual('179','2','lambda_R_47').
callRet('179','lambda_R_47').
assign('t668','t670').
ptsTo('lambda_R_47','d_lambda_R_47').
heapPtsTo('d_lambda_R_47','prototype','p_lambda_R_47').
prototype('p_lambda_R_47','h_FP').
methodRet('d_lambda_R_47','lambda_R_47').
formal('d_lambda_R_47','1','styles_R_47').
assign('t671','newStyle_R_46').
load('t673','styles_R_47','0').
actual('180','1','t673').
callRet('180','t673').
assign('t672','t674').
store('t676','name_R_?','styleUpdated').
load('t677','styles_R_47','0').
store('t676','style_R_?','t677').
actual('181','1','t676').
callRet('181','t676').
assign('t675','t678').
store('t680','name_R_?','styleAdded').
load('t681','styles_R_47','0').
store('t680','style_R_?','t681').
actual('182','1','t680').
callRet('182','t680').
assign('t679','t682').
actual('183','1','lambda_R_48').
callRet('183','lambda_R_48').
actual('183','2','200').
callRet('183','200').
assign('t683','t684').
ptsTo('lambda_R_48','d_lambda_R_48').
heapPtsTo('d_lambda_R_48','prototype','p_lambda_R_48').
prototype('p_lambda_R_48','h_FP').
methodRet('d_lambda_R_48','lambda_R_48').
load('t685','location_R_?','href').
store('location_R_?','href','t686').
actual('184','1','sectionHelp').
callRet('184','sectionHelp').
actual('185','1','t688').
callRet('185','t688').
assign('t687','t689').
actual('186','1','appliesHelp').
callRet('186','appliesHelp').
actual('187','1','t691').
callRet('187','t691').
assign('t690','t692').
actual('188','1','text_R_51').
callRet('188','text_R_51').
assign('t693','t694').
load('t695','document','getElementById_R_?').
actual('189','1','installed').
callRet('189','installed').
assign('installed_R_52','t696').
load('t698','response_R_53','length').
assign('t697','t699').
actual('190','1','styleAlreadyInstalledChrome').
callRet('190','styleAlreadyInstalledChrome').
assign('t700','t701').
actual('191','1','styleCanBeInstalledChrome').
callRet('191','styleCanBeInstalledChrome').
assign('t702','t703').
load('t704','document','createEvent_R_?').
actual('192','1','Events').
callRet('192','Events').
assign('stylishEvent_R_54','t705').
load('t707','stylishEvent_R_54','initEvent_R_?').
load('t708','document','defaultView').
actual('193','1','type_R_54').
callRet('193','type_R_54').
actual('193','2','false').
callRet('193','false').
actual('193','3','false').
callRet('193','false').
actual('193','4','t708').
callRet('193','t708').
actual('193','5','null').
callRet('193','null').
assign('t706','t709').
load('t711','document','dispatchEvent_R_?').
actual('194','1','stylishEvent_R_54').
callRet('194','stylishEvent_R_54').
assign('t710','t712').
actual('195','1','stylish-description').
callRet('195','stylish-description').
actual('196','1','t714').
callRet('196','t714').
actual('196','2','lambda_R_56').
callRet('196','lambda_R_56').
assign('t713','t715').
ptsTo('lambda_R_56','d_lambda_R_56').
heapPtsTo('d_lambda_R_56','prototype','p_lambda_R_56').
prototype('p_lambda_R_56','h_FP').
methodRet('d_lambda_R_56','lambda_R_56').
formal('d_lambda_R_56','1','name_R_56').
load('t717','chrome','i18n').
load('t718','t717','getMessage').
store('t719','0','name_R_56').
actual('197','1','styleInstall').
callRet('197','styleInstall').
actual('197','2','t719').
callRet('197','t719').
actual('198','1','t720').
callRet('198','t720').
assign('t716','t721').
actual('199','1','stylish-code-chrome').
callRet('199','stylish-code-chrome').
actual('200','1','t723').
callRet('200','t723').
actual('200','2','lambda_R_57').
callRet('200','lambda_R_57').
assign('t722','t724').
ptsTo('lambda_R_57','d_lambda_R_57').
heapPtsTo('d_lambda_R_57','prototype','p_lambda_R_57').
prototype('p_lambda_R_57','h_FP').
methodRet('d_lambda_R_57','lambda_R_57').
formal('d_lambda_R_57','1','code_R_57').
actual('201','1','stylish-install-ping-url-chrome').
callRet('201','stylish-install-ping-url-chrome').
actual('202','1','t726').
callRet('202','t726').
assign('t725','t727').
load('t728','JSON_R_?','parse_R_?').
actual('203','1','code_R_57').
callRet('203','code_R_57').
assign('json_R_57','t729').
load('t731','chrome','extension').
load('t732','t731','sendRequest').
store('t733','name_R_56','saveFromJSON').
store('t733','json_R_57','json_R_57').
actual('204','1','t733').
callRet('204','t733').
actual('204','2','lambda_R_58').
callRet('204','lambda_R_58').
assign('t730','t734').
ptsTo('lambda_R_58','d_lambda_R_58').
heapPtsTo('d_lambda_R_58','prototype','p_lambda_R_58').
prototype('p_lambda_R_58','h_FP').
methodRet('d_lambda_R_58','lambda_R_58').
formal('d_lambda_R_58','1','response_R_58').
actual('205','1','styleInstalledChrome').
callRet('205','styleInstalledChrome').
assign('t735','t736').
load('t737','document','querySelector_R_?').
actual('206','1','t739').
callRet('206','t739').
assign('e_R_59','t740').
load('t741','e_R_59','getAttribute_R_?').
actual('207','1','href').
callRet('207','href').
assign('None','t742').
methodRet('d_getMeta_R_59','null').
load('t744','url_R_60','indexOf_R_?').
actual('208','1','#').
callRet('208','#').
assign('t743','t746').
assign('t747','callback_R_60').
load('t749','document','getElementById_R_?').
load('t750','url_R_60','substring_R_?').
actual('209','1','1').
callRet('209','1').
actual('210','1','t751').
callRet('210','t751').
load('t753','t752','innerText').
actual('211','1','t753').
callRet('211','t753').
assign('t748','t754').
methodRet('d_getResource_R_60','null').
ptsTo('t755','n_XMLHttpRequest_R_?_0').
prototype('n_XMLHttpRequest_R_?_0', 'p_XMLHttpRequest_R_?').
assign('xhr_R_60','t755').
load('t757','xhr_R_60','open_R_?').
actual('212','1','GET').
callRet('212','GET').
actual('212','2','url_R_60').
callRet('212','url_R_60').
actual('212','3','true').
callRet('212','true').
assign('t756','t758').
load('t759','xhr_R_60','onreadystatechange').
store('xhr_R_60','onreadystatechange','lambda_R_61').
ptsTo('lambda_R_61','d_lambda_R_61').
heapPtsTo('d_lambda_R_61','prototype','p_lambda_R_61').
prototype('p_lambda_R_61','h_FP').
methodRet('d_lambda_R_61','lambda_R_61').
load('t761','xhr_R_60','send_R_?').
assign('t760','t762').
load('t764','xhr_R_60','readyState').
assign('t763','t766').
load('t768','xhr_R_60','responseText').
actual('214','1','t768').
callRet('214','t768').
assign('t767','t769').
load('t770','chrome','i18n').
load('t771','t770','getMessage').
actual('215','1','key_R_62').
callRet('215','key_R_62').
actual('215','2','params_R_62').
callRet('215','params_R_62').
assign('s_R_62','t772').
assign('t773','t774').
methodRet('d_t_R_62','s_R_62').
load('t776','document','write_R_?').
actual('216','1','key_R_63').
callRet('216','key_R_63').
actual('217','1','t777').
callRet('217','t777').
assign('t775','t778').
assign('t779','attr_R_64').
assign('t780','t782').
load('t783','document','getElementById_R_?').
load('t784','t783','id_R_64').
load('t785','t784','innerHTML').
actual('218','1','key_R_64').
callRet('218','key_R_64').
store('t784','innerHTML','t786').
load('t788','document','getElementById').
actual('219','1','id_R_64').
callRet('219','id_R_64').
load('t790','t789','appendChild_R_?').
load('t791','document','createTextNode_R_?').
actual('220','1','key_R_64').
callRet('220','key_R_64').
actual('221','1','t792').
callRet('221','t792').
actual('222','1','t793').
callRet('222','t793').
assign('t787','t794').
load('t796','document','getElementById').
actual('223','1','id_R_64').
callRet('223','id_R_64').
load('t798','t797','setAttribute_R_?').
actual('224','1','key_R_64').
callRet('224','key_R_64').
actual('225','1','attr_R_64').
callRet('225','attr_R_64').
actual('225','2','t799').
callRet('225','t799').
assign('t795','t800').
load('t801','document','getElementById_R_?').
actual('226','1','installed').
callRet('226','installed').
assign('installed_R_65','t802').
load('t804','styles_R_65','map_R_?').
actual('227','1','createStyleElement_R_?').
callRet('227','createStyleElement_R_?').
load('t806','t805','forEach_R_?').
actual('228','1','lambda_R_66').
callRet('228','lambda_R_66').
assign('t803','t807').
ptsTo('lambda_R_66','d_lambda_R_66').
heapPtsTo('d_lambda_R_66','prototype','p_lambda_R_66').
prototype('p_lambda_R_66','h_FP').
methodRet('d_lambda_R_66','lambda_R_66').
formal('d_lambda_R_66','1','e_R_66').
load('t809','installed_R_65','appendChild_R_?').
actual('229','1','e_R_66').
callRet('229','e_R_66').
assign('t808','t810').
load('t811','styleTemplate_R_0','cloneNode_R_?').
actual('230','1','true').
callRet('230','true').
assign('e_R_67','t812').
load('t814','e_R_67','setAttribute_R_?').
load('t815','style_R_67','enabled').
assign('None','enabled').
actual('231','1','class').
callRet('231','class').
actual('231','2','disabled').
callRet('231','disabled').
assign('t813','t817').
load('t819','e_R_67','setAttribute').
load('t820','style_R_67','id').
actual('232','1','style-id').
callRet('232','style-id').
actual('232','2','t820').
callRet('232','t820').
assign('t818','t821').
load('t823','style_R_67','updateUrl').
assign('t822','t823').
load('t825','e_R_67','setAttribute').
load('t826','style_R_67','updateUrl').
actual('233','1','style-update-url').
callRet('233','style-update-url').
actual('233','2','t826').
callRet('233','t826').
assign('t824','t827').
load('t828','e_R_67','querySelector_R_?').
actual('234','1','.style-name').
callRet('234','.style-name').
assign('styleName_R_67','t829').
load('t831','styleName_R_67','appendChild_R_?').
load('t832','document','createTextNode_R_?').
load('t833','style_R_67','name').
actual('235','1','t833').
callRet('235','t833').
actual('236','1','t834').
callRet('236','t834').
assign('t830','t835').
load('t837','style_R_67','url').
assign('t836','t837').
load('t838','document','createElement_R_?').
actual('237','1','a').
callRet('237','a').
assign('homepage_R_67','t839').
load('t841','homepage_R_67','setAttribute').
load('t842','style_R_67','url').
actual('238','1','href').
callRet('238','href').
actual('238','2','t842').
callRet('238','t842').
assign('t840','t843').
load('t845','homepage_R_67','setAttribute').
actual('239','1','target').
callRet('239','target').
actual('239','2','_blank').
callRet('239','_blank').
assign('t844','t846').
load('t847','document','createElement').
actual('240','1','img').
callRet('240','img').
assign('homepageImg_R_67','t848').
load('t849','homepageImg_R_67','src').
store('homepageImg_R_67','src','world_go.png').
load('t850','homepageImg_R_67','alt').
store('homepageImg_R_67','alt','*').
load('t852','homepage_R_67','appendChild').
actual('241','1','homepageImg_R_67').
callRet('241','homepageImg_R_67').
assign('t851','t853').
load('t855','styleName_R_67','appendChild').
load('t856','document','createTextNode').
actual('242','1',' ').
callRet('242',' ').
actual('243','1','t857').
callRet('243','t857').
assign('t854','t858').
load('t860','styleName_R_67','appendChild').
actual('244','1','homepage_R_67').
callRet('244','homepage_R_67').
assign('t859','t861').
assign('domains_R_67','domains_R_67').
assign('urls_R_67','urls_R_67').
assign('urlPrefixes_R_67','urlPrefixes_R_67').
ptsTo('add_R_68','d_add_R_68').
heapPtsTo('d_add_R_68','prototype','p_add_R_68').
prototype('p_add_R_68','h_FP').
methodRet('d_add_R_68','add_R_68').
formal('d_add_R_68','1','array_R_68').
formal('d_add_R_68','2','property_R_68').
actual('245','1','domains_R_67').
callRet('245','domains_R_67').
actual('245','2','domains').
callRet('245','domains').
assign('t862','t863').
actual('246','1','urls_R_67').
callRet('246','urls_R_67').
actual('246','2','urls').
callRet('246','urls').
assign('t864','t865').
actual('247','1','urlPrefixes_R_67').
callRet('247','urlPrefixes_R_67').
actual('247','2','urlPrefixes').
callRet('247','urlPrefixes').
assign('t866','t867').
assign('appliesToToShow_R_67','appliesToToShow_R_67').
assign('t868','domains_R_67').
load('t869','appliesToToShow_R_67','concat_R_?').
actual('248','1','domains_R_67').
callRet('248','domains_R_67').
assign('appliesToToShow_R_67','t870').
assign('t871','urls_R_67').
load('t872','appliesToToShow_R_67','concat').
actual('249','1','urls_R_67').
callRet('249','urls_R_67').
assign('appliesToToShow_R_67','t873').
assign('t874','urlPrefixes_R_67').
load('t875','appliesToToShow_R_67','concat').
load('t876','urlPrefixes_R_67','map_R_?').
actual('250','1','lambda_R_72').
callRet('250','lambda_R_72').
actual('251','1','t877').
callRet('251','t877').
assign('appliesToToShow_R_67','t878').
ptsTo('lambda_R_72','d_lambda_R_72').
heapPtsTo('d_lambda_R_72','prototype','p_lambda_R_72').
prototype('p_lambda_R_72','h_FP').
methodRet('d_lambda_R_72','lambda_R_72').
formal('d_lambda_R_72','1','u_R_72').
assign('appliesToString_R_67','').
assign('showAppliesToExtra_R_67','false').
load('t880','appliesToToShow_R_67','length').
assign('t879','t881').
load('t883','appliesToToShow_R_67','length').
assign('t882','t884').
load('t885','appliesToToShow_R_67','slice_R_?').
actual('252','1','0').
callRet('252','0').
actual('252','2','10').
callRet('252','10').
load('t887','t886','join_R_?').
actual('253','1',', ').
callRet('253',', ').
assign('appliesToString_R_67','t888').
assign('showAppliesToExtra_R_67','true').
load('t889','appliesToToShow_R_67','join').
actual('254','1',', ').
callRet('254',', ').
assign('appliesToString_R_67','t890').
actual('255','1','appliesToEverything').
callRet('255','appliesToEverything').
assign('appliesToString_R_67','t891').
load('t893','e_R_67','querySelector').
actual('256','1','.applies-to').
callRet('256','.applies-to').
load('t895','t894','appendChild').
load('t896','document','createTextNode').
store('t897','0','appliesToString_R_67').
actual('257','1','appliesDisplay').
callRet('257','appliesDisplay').
actual('257','2','t897').
callRet('257','t897').
actual('258','1','t898').
callRet('258','t898').
actual('259','1','t899').
callRet('259','t899').
assign('t892','t900').
assign('t901','showAppliesToExtra_R_67').
load('t903','e_R_67','querySelector').
actual('260','1','.applies-to').
callRet('260','.applies-to').
load('t905','t904','appendChild').
load('t906','appliesToExtraTemplate_R_0','cloneNode').
actual('261','1','true').
callRet('261','true').
actual('262','1','t907').
callRet('262','t907').
assign('t902','t908').
load('t909','e_R_67','querySelector').
actual('263','1','.style-edit-link').
callRet('263','.style-edit-link').
assign('editLink_R_67','t910').
load('t912','editLink_R_67','setAttribute').
load('t913','editLink_R_67','getAttribute_R_?').
actual('264','1','href').
callRet('264','href').
load('t915','style_R_67','id').
actual('265','1','href').
callRet('265','href').
actual('265','2','t916').
callRet('265','t916').
assign('t911','t917').
methodRet('d_createStyleElement_R_67','e_R_67').
load('t919','style_R_67','sections').
load('t920','t919','forEach_R_?').
actual('266','1','lambda_R_69').
callRet('266','lambda_R_69').
assign('t918','t921').
ptsTo('lambda_R_69','d_lambda_R_69').
heapPtsTo('d_lambda_R_69','prototype','p_lambda_R_69').
prototype('p_lambda_R_69','h_FP').
methodRet('d_lambda_R_69','lambda_R_69').
formal('d_lambda_R_69','1','section_R_69').
load('t923','section_R_69','property_R_68').
assign('t922','t923').
load('t925','section_R_69','property_R_68').
load('t926','t925','filter_R_?').
actual('267','1','lambda_R_70').
callRet('267','lambda_R_70').
load('t928','t927','forEach_R_?').
actual('268','1','lambda_R_71').
callRet('268','lambda_R_71').
assign('t924','t929').
ptsTo('lambda_R_70','d_lambda_R_70').
heapPtsTo('d_lambda_R_70','prototype','p_lambda_R_70').
prototype('p_lambda_R_70','h_FP').
methodRet('d_lambda_R_70','lambda_R_70').
formal('d_lambda_R_70','1','value_R_70').
ptsTo('lambda_R_71','d_lambda_R_71').
heapPtsTo('d_lambda_R_71','prototype','p_lambda_R_71').
prototype('p_lambda_R_71','h_FP').
methodRet('d_lambda_R_71','lambda_R_71').
formal('d_lambda_R_71','1','value_R_71').
load('t930','array_R_68','indexOf_R_?').
actual('269','1','value_R_70').
callRet('269','value_R_70').
assign('t932','1').
methodRet('d_lambda_R_70','t933').
load('t935','array_R_68','push_R_?').
actual('270','1','value_R_71').
callRet('270','value_R_71').
assign('t934','t936').
methodRet('d_lambda_R_72','t937').
actual('271','1','event_R_73').
callRet('271','event_R_73').
assign('id_R_73','t938').
actual('272','1','id_R_73').
callRet('272','id_R_73').
actual('272','2','enabled_R_73').
callRet('272','enabled_R_73').
assign('t939','t940').
actual('273','1','deleteStyleConfirm').
callRet('273','deleteStyleConfirm').
actual('274','1','t942').
callRet('274','t942').
assign('t944','t943').
assign('t941','t944').
methodRet('d_doDelete_R_74','null').
actual('275','1','event_R_?').
callRet('275','event_R_?').
assign('id_R_74','t945').
actual('276','1','id_R_74').
callRet('276','id_R_74').
assign('t946','t947').
actual('277','1','event_R_75').
callRet('277','event_R_75').
load('t949','t948','getAttribute_R_?').
actual('278','1','style-id').
callRet('278','style-id').
methodRet('d_getId_R_75','t950').
load('t951','event_R_76','target').
assign('e_R_76','t951').
assign('t952','e_R_76').
load('t954','e_R_76','hasAttribute_R_?').
actual('279','1','style-id').
callRet('279','style-id').
assign('t953','t955').
methodRet('d_getStyleElement_R_76','e_R_76').
load('t956','e_R_76','parentNode').
assign('e_R_76','t956').
methodRet('d_getStyleElement_R_76','null').
load('t957','document','getElementById_R_?').
actual('280','1','installed').
callRet('280','installed').
assign('installed_R_78','t958').
load('t960','installed_R_78','replaceChild_R_?').
actual('281','1','style_R_78').
callRet('281','style_R_78').
load('t962','installed_R_78','querySelector_R_?').
load('t963','style_R_78','id').
actual('282','1','t965').
callRet('282','t965').
actual('283','1','t961').
callRet('283','t961').
actual('283','2','t966').
callRet('283','t966').
assign('t959','t967').
load('t968','document','getElementById_R_?').
actual('284','1','installed').
callRet('284','installed').
assign('installed_R_79','t969').
load('t971','installed_R_79','removeChild_R_?').
load('t972','installed_R_79','querySelector_R_?').
actual('285','1','t974').
callRet('285','t974').
actual('286','1','t975').
callRet('286','t975').
assign('t970','t976').
actual('287','1','event_R_80').
callRet('287','event_R_80').
actual('288','1','t978').
callRet('288','t978').
assign('t977','t979').
load('t981','Array_R_?','prototype').
load('t982','t981','forEach').
load('t983','t982','call_R_?').
load('t984','document','querySelectorAll_R_?').
actual('289','1','[style-update-url]').
callRet('289','[style-update-url]').
actual('290','1','t985').
callRet('290','t985').
actual('290','2','checkUpdate_R_?').
callRet('290','checkUpdate_R_?').
assign('t980','t986').
load('t987','element_R_82','querySelector_R_?').
load('t988','t987','.update-note').
load('t989','t988','innerHTML').
actual('291','1','checkingForUpdate').
callRet('291','checkingForUpdate').
store('t988','innerHTML','t990').
load('t991','element_R_82','className').
load('t992','element_R_82','className').
load('t993','t992','replace').
actual('292','1','checking-update').
callRet('292','checking-update').
actual('292','2','').
callRet('292','None').
load('t995','t994','replace').
actual('293','1','no-update').
callRet('293','no-update').
actual('293','2','').
callRet('293','None').
load('t997','t996','replace_R_?').
actual('294','1','can-update').
callRet('294','can-update').
actual('294','2','').
callRet('294','None').
store('element_R_82','className','t999').
load('t1000','element_R_82','getAttribute_R_?').
actual('295','1','style-id').
callRet('295','style-id').
assign('id_R_82','t1001').
load('t1002','element_R_82','getAttribute').
actual('296','1','style-update-url').
callRet('296','style-update-url').
assign('url_R_82','t1003').
ptsTo('t1004','n_XMLHttpRequest_R_?_1').
prototype('n_XMLHttpRequest_R_?_1', 'p_XMLHttpRequest_R_?').
assign('xhr_R_82','t1004').
load('t1006','xhr_R_82','open_R_?').
actual('297','1','GET').
callRet('297','GET').
actual('297','2','url_R_82').
callRet('297','url_R_82').
actual('297','3','true').
callRet('297','true').
assign('t1005','t1007').
load('t1008','xhr_R_82','onreadystatechange').
store('xhr_R_82','onreadystatechange','lambda_R_83').
ptsTo('lambda_R_83','d_lambda_R_83').
heapPtsTo('d_lambda_R_83','prototype','p_lambda_R_83').
prototype('p_lambda_R_83','h_FP').
methodRet('d_lambda_R_83','lambda_R_83').
formal('d_lambda_R_83','1','aEvt_R_83').
load('t1010','xhr_R_82','send_R_?').
actual('298','1','null').
callRet('298','null').
assign('t1009','t1011').
load('t1013','xhr_R_82','readyState').
assign('t1012','t1014').
load('t1016','xhr_R_82','status').
assign('t1015','t1017').
load('t1019','xhr_R_82','status').
assign('t1018','t1020').
load('t1023','xhr_R_82','status').
store('t1022','0','t1023').
actual('299','1','updateCheckFailBadResponseCode').
callRet('299','updateCheckFailBadResponseCode').
actual('299','2','t1022').
callRet('299','t1022').
actual('300','1','t1024').
callRet('300','t1024').
actual('300','2','id_R_82').
callRet('300','id_R_82').
actual('300','3','null').
callRet('300','null').
assign('t1021','t1025').
actual('301','1','updateCheckFailServerUnreachable').
callRet('301','updateCheckFailServerUnreachable').
actual('302','1','t1027').
callRet('302','t1027').
actual('302','2','id_R_82').
callRet('302','id_R_82').
actual('302','3','null').
callRet('302','null').
assign('t1026','t1028').
load('t1030','JSON_R_?','parse_R_?').
load('t1031','xhr_R_82','responseText').
actual('303','1','t1031').
callRet('303','t1031').
actual('304','1','id_R_82').
callRet('304','id_R_82').
actual('304','2','t1032').
callRet('304','t1032').
assign('t1029','t1033').
store('t1035','id_R_84','id_R_84').
actual('305','1','t1035').
callRet('305','t1035').
actual('305','2','lambda_R_85').
callRet('305','lambda_R_85').
assign('t1034','t1036').
ptsTo('lambda_R_85','d_lambda_R_85').
heapPtsTo('d_lambda_R_85','prototype','p_lambda_R_85').
prototype('p_lambda_R_85','h_FP').
methodRet('d_lambda_R_85','lambda_R_85').
formal('d_lambda_R_85','1','styles_R_85').
load('t1037','styles_R_85','0').
assign('style_R_85','t1037').
load('t1039','style_R_85','sections').
load('t1040','serverJson_R_84','sections').
actual('306','1','t1039').
callRet('306','t1039').
actual('306','2','t1040').
callRet('306','t1040').
assign('t1038','t1041').
actual('307','1','yes').
callRet('307','yes').
actual('307','2','id_R_84').
callRet('307','id_R_84').
actual('307','3','serverJson_R_84').
callRet('307','serverJson_R_84').
assign('t1042','t1043').
actual('308','1','no').
callRet('308','no').
actual('308','2','id_R_84').
callRet('308','id_R_84').
actual('308','3','serverJson_R_84').
callRet('308','serverJson_R_84').
assign('t1044','t1045').
load('t1046','document','querySelector_R_?').
actual('309','1','t1048').
callRet('309','t1048').
assign('e_R_86','t1049').
load('t1050','e_R_86','className').
load('t1051','e_R_86','className').
load('t1052','t1051','replace_R_?').
actual('310','1','checking-update').
callRet('310','checking-update').
actual('310','2','').
callRet('310','None').
store('e_R_86','className','t1053').
actual('311','1','event_R_87').
callRet('311','event_R_87').
assign('element_R_87','t1054').
assign('o_R_87','__objectInit__').
load('t1055','o_R_87','id').
load('t1056','element_R_87','getAttribute_R_?').
actual('312','1','style-id').
callRet('312','style-id').
store('o_R_87','id','t1057').
load('t1058','o_R_87','sections').
load('t1059','element_R_87','updatedCode').
load('t1060','t1059','sections').
store('o_R_87','sections','t1060').
actual('313','1','o_R_87').
callRet('313','o_R_87').
actual('313','2','lambda_R_88').
callRet('313','lambda_R_88').
assign('t1061','t1062').
ptsTo('lambda_R_88','d_lambda_R_88').
heapPtsTo('d_lambda_R_88','prototype','p_lambda_R_88').
prototype('p_lambda_R_88','h_FP').
methodRet('d_lambda_R_88','lambda_R_88').
load('t1063','element_R_87','updatedCode').
store('element_R_87','updatedCode','').
load('t1064','element_R_87','className').
load('t1065','element_R_87','className').
load('t1066','t1065','replace_R_?').
actual('314','1','can-update').
callRet('314','can-update').
actual('314','2','update-done').
callRet('314','update-done').
store('element_R_87','className','t1067').
load('t1068','element_R_87','querySelector_R_?').
load('t1069','t1068','.update-note').
load('t1070','t1069','innerHTML').
actual('315','1','updateCompleted').
callRet('315','updateCompleted').
store('t1069','innerHTML','t1071').
load('t1073','a_R_89','length').
load('t1074','b_R_89','length').
assign('t1072','t1075').
methodRet('d_codeIsEqual_R_89','false').
store('properties_R_89','0','code').
store('properties_R_89','1','urlPrefixes').
store('properties_R_89','2','urls').
store('properties_R_89','3','domains').
assign('properties_R_89','properties_R_89').
load('t1077','a_R_89','length').
assign('t1076','t1078').
assign('i_R_89','0').
assign('t1080','i_R_89').
assign('t1079','t1080').
assign('found_R_89','false').
load('t1082','b_R_89','length').
assign('t1081','t1083').
assign('j_R_89','0').
assign('t1085','j_R_89').
assign('t1084','t1085').
load('t1086','properties_R_89','every_R_?').
actual('316','1','lambda_R_90').
callRet('316','lambda_R_90').
assign('allEquals_R_89','t1087').
ptsTo('lambda_R_90','d_lambda_R_90').
heapPtsTo('d_lambda_R_90','prototype','p_lambda_R_90').
prototype('p_lambda_R_90','h_FP').
methodRet('d_lambda_R_90','lambda_R_90').
formal('d_lambda_R_90','1','property_R_90').
assign('t1088','allEquals_R_89').
assign('found_R_89','true').
assign('j_R_89','0').
assign('t1090','found_R_89').
assign('t1089','t1090').
methodRet('d_codeIsEqual_R_89','false').
assign('i_R_89','0').
methodRet('d_codeIsEqual_R_89','true').
load('t1091','a_R_89','i_R_89').
load('t1092','b_R_89','j_R_89').
actual('317','1','t1091').
callRet('317','t1091').
actual('317','2','t1092').
callRet('317','t1092').
actual('317','3','property_R_90').
callRet('317','property_R_90').
methodRet('d_lambda_R_90','t1093').
load('t1094','a_R_91','property_R_91').
actual('318','1','t1094').
callRet('318','t1094').
assign('type_R_91','t1095').
load('t1096','b_R_91','property_R_91').
actual('319','1','t1096').
callRet('319','t1096').
assign('typeB_R_91','t1097').
assign('t1098','t1099').
load('t1103','a_R_91','property_R_91').
load('t1104','t1103','length').
load('t1110','b_R_91','property_R_91').
load('t1111','t1110','length').
assign('t1100','t1115').
methodRet('d_jsonEquals_R_91','true').
methodRet('d_jsonEquals_R_91','false').
assign('t1116','t1117').
load('t1119','a_R_91','property_R_91').
load('t1120','t1119','length').
load('t1121','b_R_91','property_R_91').
load('t1122','t1121','length').
assign('t1118','t1123').
methodRet('d_jsonEquals_R_91','false').
load('t1125','a_R_91','length').
assign('t1124','t1126').
assign('i_R_91','0').
assign('t1128','i_R_91').
assign('t1127','t1128').
assign('found_R_91','false').
load('t1130','b_R_91','length').
assign('t1129','t1131').
assign('j_R_91','0').
assign('t1133','j_R_91').
assign('t1132','t1133').
load('t1135','a_R_91','i_R_91').
load('t1136','b_R_91','j_R_91').
assign('t1134','t1137').
assign('found_R_91','true').
assign('j_R_91','0').
assign('t1139','found_R_91').
assign('t1138','t1139').
methodRet('d_jsonEquals_R_91','false').
assign('i_R_91','0').
methodRet('d_jsonEquals_R_91','true').
assign('t1140','t1141').
load('t1142','a_R_91','property_R_91').
load('t1143','b_R_91','property_R_91').
methodRet('d_jsonEquals_R_91','t1144').
assign('t1145','t1148').
methodRet('d_getType_R_92','o_R_92').
assign('t1149','t1150').
methodRet('d_getType_R_92','array').
load('t1152','chrome','windows').
load('t1153','t1152','getAll').
store('t1154','populate_R_?','true').
actual('320','1','t1154').
callRet('320','t1154').
actual('320','2','lambda_R_94').
callRet('320','lambda_R_94').
assign('t1151','t1155').
ptsTo('lambda_R_94','d_lambda_R_94').
heapPtsTo('d_lambda_R_94','prototype','p_lambda_R_94').
prototype('p_lambda_R_94','h_FP').
methodRet('d_lambda_R_94','lambda_R_94').
formal('d_lambda_R_94','1','windows_R_94').
load('t1157','windows','forEach_R_?').
actual('321','1','lambda_R_95').
callRet('321','lambda_R_95').
assign('t1156','t1158').
ptsTo('lambda_R_95','d_lambda_R_95').
heapPtsTo('d_lambda_R_95','prototype','p_lambda_R_95').
prototype('p_lambda_R_95','h_FP').
methodRet('d_lambda_R_95','lambda_R_95').
formal('d_lambda_R_95','1','win_R_95').
load('t1160','win_R_95','tabs').
load('t1161','t1160','forEach_R_?').
actual('322','1','lambda_R_96').
callRet('322','lambda_R_96').
assign('t1159','t1162').
ptsTo('lambda_R_96','d_lambda_R_96').
heapPtsTo('d_lambda_R_96','prototype','p_lambda_R_96').
prototype('p_lambda_R_96','h_FP').
methodRet('d_lambda_R_96','lambda_R_96').
formal('d_lambda_R_96','1','tab_R_96').
load('t1164','chrome','tabs').
load('t1165','t1164','sendRequest').
load('t1166','tab_R_96','id').
actual('323','1','t1166').
callRet('323','t1166').
actual('323','2','request_R_93').
callRet('323','request_R_93').
assign('t1163','t1167').
actual('324','1','tab_R_96').
callRet('324','tab_R_96').
assign('t1168','t1169').
load('t1172','tab_R_97','url').
store('t1171','matchUrl_R_?','t1172').
actual('325','1','t1171').
callRet('325','t1171').
actual('325','2','lambda_R_98').
callRet('325','lambda_R_98').
assign('t1170','t1173').
ptsTo('lambda_R_98','d_lambda_R_98').
heapPtsTo('d_lambda_R_98','prototype','p_lambda_R_98').
prototype('p_lambda_R_98','h_FP').
methodRet('d_lambda_R_98','lambda_R_98').
formal('d_lambda_R_98','1','styles_R_98').
load('t1175','chrome','browserAction').
load('t1176','t1175','setBadgeText').
actual('326','1','styles_R_98').
callRet('326','styles_R_98').
store('t1177','text_R_?','t1178').
load('t1179','tab_R_97','id').
store('t1177','tabId_R_?','t1179').
actual('327','1','t1177').
callRet('327','t1177').
assign('t1174','t1180').
load('t1181','styles_R_99','filter_R_?').
actual('328','1','lambda_R_100').
callRet('328','lambda_R_100').
assign('e_R_99','t1182').
ptsTo('lambda_R_100','d_lambda_R_100').
heapPtsTo('d_lambda_R_100','prototype','p_lambda_R_100').
prototype('p_lambda_R_100','h_FP').
methodRet('d_lambda_R_100','lambda_R_100').
formal('d_lambda_R_100','1','style_R_100').
load('t1183','e_R_99','length').
load('t1185','e_R_99','length').
assign('None','').
methodRet('d_getBadgeText_R_99','t1186').
load('t1187','style_R_100','enabled').
methodRet('d_lambda_R_100','t1188').
actual('329','1','stylish').
callRet('329','stylish').
actual('329','2','').
callRet('329','None').
actual('329','3','Stylish Styles').
callRet('329','Stylish Styles').
actual('329','4','t1190').
callRet('329','t1190').
assign('d_R_101','t1191').
load('t1193','d_R_101','version').
load('t1195','d_R_101','version').
assign('t1192','t1197').
load('t1199','d_R_101','version').
assign('t1198','t1200').
load('t1202','d_R_101','version').
assign('t1201','t1203').
actual('330','1','d_R_101').
callRet('330','d_R_101').
assign('t1204','t1205').
actual('331','1','d_R_101').
callRet('331','d_R_101').
actual('331','2','error_R_101').
callRet('331','error_R_101').
actual('331','3','ready_R_101').
callRet('331','ready_R_101').
assign('t1206','t1207').
actual('332','1','d_R_101').
callRet('332','d_R_101').
actual('332','2','error_R_101').
callRet('332','error_R_101').
actual('332','3','ready_R_101').
callRet('332','ready_R_101').
assign('t1208','t1209').
actual('333','1','d_R_101').
callRet('333','d_R_101').
actual('333','2','error_R_101').
callRet('333','error_R_101').
actual('333','3','ready_R_101').
callRet('333','ready_R_101').
assign('t1210','t1211').
load('t1213','d_R_102','changeVersion_R_?').
load('t1214','d_R_102','version').
actual('334','1','t1214').
callRet('334','t1214').
actual('334','2','1.1').
callRet('334','1.1').
actual('334','3','lambda_R_103').
callRet('334','lambda_R_103').
actual('334','4','error_R_102').
callRet('334','error_R_102').
actual('334','5','lambda_R_104').
callRet('334','lambda_R_104').
assign('t1212','t1215').
ptsTo('lambda_R_103','d_lambda_R_103').
heapPtsTo('d_lambda_R_103','prototype','p_lambda_R_103').
prototype('p_lambda_R_103','h_FP').
methodRet('d_lambda_R_103','lambda_R_103').
formal('d_lambda_R_103','1','t_R_103').
ptsTo('lambda_R_104','d_lambda_R_104').
heapPtsTo('d_lambda_R_104','prototype','p_lambda_R_104').
prototype('p_lambda_R_104','h_FP').
methodRet('d_lambda_R_104','lambda_R_104').
load('t1217','t_R_103','executeSql_R_?').
actual('335','1','CREATE TABLE styles (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, url TEXT, updateUrl TEXT, md5Url TEXT, name TEXT NOT NULL, code TEXT NOT NULL, enabled INTEGER NOT NULL, originalCode TEXT NULL);').
callRet('335','CREATE TABLE styles (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, url TEXT, updateUrl TEXT, md5Url TEXT, name TEXT NOT NULL, code TEXT NOT NULL, enabled INTEGER NOT NULL, originalCode TEXT NULL);').
assign('t1216','t1218').
load('t1220','t_R_103','executeSql').
actual('336','1','CREATE TABLE style_meta (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, style_id INTEGER NOT NULL, name TEXT NOT NULL, value TEXT NOT NULL);').
callRet('336','CREATE TABLE style_meta (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, style_id INTEGER NOT NULL, name TEXT NOT NULL, value TEXT NOT NULL);').
assign('t1219','t1221').
load('t1223','t_R_103','executeSql').
actual('337','1','CREATE INDEX style_meta_style_id ON style_meta (style_id);').
callRet('337','CREATE INDEX style_meta_style_id ON style_meta (style_id);').
assign('t1222','t1224').
actual('338','1','d_R_102').
callRet('338','d_R_102').
actual('338','2','error_R_102').
callRet('338','error_R_102').
actual('338','3','done_R_102').
callRet('338','done_R_102').
assign('t1225','t1226').
load('t1228','d_R_105','changeVersion_R_?').
load('t1229','d_R_105','version').
actual('339','1','t1229').
callRet('339','t1229').
actual('339','2','1.2').
callRet('339','1.2').
actual('339','3','lambda_R_106').
callRet('339','lambda_R_106').
actual('339','4','error_R_105').
callRet('339','error_R_105').
actual('339','5','lambda_R_107').
callRet('339','lambda_R_107').
assign('t1227','t1230').
ptsTo('lambda_R_106','d_lambda_R_106').
heapPtsTo('d_lambda_R_106','prototype','p_lambda_R_106').
prototype('p_lambda_R_106','h_FP').
methodRet('d_lambda_R_106','lambda_R_106').
formal('d_lambda_R_106','1','t_R_106').
ptsTo('lambda_R_107','d_lambda_R_107').
heapPtsTo('d_lambda_R_107','prototype','p_lambda_R_107').
prototype('p_lambda_R_107','h_FP').
methodRet('d_lambda_R_107','lambda_R_107').
load('t1232','t_R_106','executeSql_R_?').
actual('340','1','CREATE TABLE sections (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, style_id INTEGER NOT NULL, code TEXT NOT NULL);').
callRet('340','CREATE TABLE sections (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, style_id INTEGER NOT NULL, code TEXT NOT NULL);').
assign('t1231','t1233').
load('t1235','t_R_106','executeSql').
actual('341','1','INSERT INTO sections (style_id, code) SELECT id, code FROM styles;').
callRet('341','INSERT INTO sections (style_id, code) SELECT id, code FROM styles;').
assign('t1234','t1236').
load('t1238','t_R_106','executeSql').
actual('342','1','DROP INDEX style_meta_style_id;').
callRet('342','DROP INDEX style_meta_style_id;').
assign('t1237','t1239').
load('t1241','t_R_106','executeSql').
actual('343','1','CREATE TABLE section_meta (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, section_id INTEGER NOT NULL, name TEXT NOT NULL, value TEXT NOT NULL);').
callRet('343','CREATE TABLE section_meta (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, section_id INTEGER NOT NULL, name TEXT NOT NULL, value TEXT NOT NULL);').
assign('t1240','t1242').
load('t1244','t_R_106','executeSql').
actual('344','1','INSERT INTO section_meta (section_id, name, value) SELECT s.id, sm.name, sm.value FROM sections s INNER JOIN style_meta sm ON sm.style_id = s.style_id;').
callRet('344','INSERT INTO section_meta (section_id, name, value) SELECT s.id, sm.name, sm.value FROM sections s INNER JOIN style_meta sm ON sm.style_id = s.style_id;').
assign('t1243','t1245').
load('t1247','t_R_106','executeSql').
actual('345','1','CREATE INDEX section_meta_section_id ON section_meta (section_id);').
callRet('345','CREATE INDEX section_meta_section_id ON section_meta (section_id);').
assign('t1246','t1248').
load('t1250','t_R_106','executeSql').
actual('346','1','DROP TABLE style_meta;').
callRet('346','DROP TABLE style_meta;').
assign('t1249','t1251').
load('t1253','t_R_106','executeSql').
actual('347','1','CREATE TABLE newstyles (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, url TEXT, updateUrl TEXT, md5Url TEXT, name TEXT NOT NULL, enabled INTEGER NOT NULL);').
callRet('347','CREATE TABLE newstyles (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, url TEXT, updateUrl TEXT, md5Url TEXT, name TEXT NOT NULL, enabled INTEGER NOT NULL);').
assign('t1252','t1254').
load('t1256','t_R_106','executeSql').
actual('348','1','INSERT INTO newstyles (id, url, updateUrl, md5Url, name, enabled) SELECT id, url, updateUrl, md5Url, name, enabled FROM styles;').
callRet('348','INSERT INTO newstyles (id, url, updateUrl, md5Url, name, enabled) SELECT id, url, updateUrl, md5Url, name, enabled FROM styles;').
assign('t1255','t1257').
load('t1259','t_R_106','executeSql').
actual('349','1','DROP TABLE styles;').
callRet('349','DROP TABLE styles;').
assign('t1258','t1260').
load('t1262','t_R_106','executeSql').
actual('350','1','ALTER TABLE newstyles RENAME TO styles;').
callRet('350','ALTER TABLE newstyles RENAME TO styles;').
assign('t1261','t1263').
actual('351','1','d_R_105').
callRet('351','d_R_105').
actual('351','2','error_R_105').
callRet('351','error_R_105').
actual('351','3','done_R_105').
callRet('351','done_R_105').
assign('t1264','t1265').
load('t1267','d_R_108','changeVersion_R_?').
load('t1268','d_R_108','version').
actual('352','1','t1268').
callRet('352','t1268').
actual('352','2','1.3').
callRet('352','1.3').
actual('352','3','lambda_R_109').
callRet('352','lambda_R_109').
actual('352','4','error_R_108').
callRet('352','error_R_108').
actual('352','5','lambda_R_110').
callRet('352','lambda_R_110').
assign('t1266','t1269').
ptsTo('lambda_R_109','d_lambda_R_109').
heapPtsTo('d_lambda_R_109','prototype','p_lambda_R_109').
prototype('p_lambda_R_109','h_FP').
methodRet('d_lambda_R_109','lambda_R_109').
formal('d_lambda_R_109','1','t_R_109').
ptsTo('lambda_R_110','d_lambda_R_110').
heapPtsTo('d_lambda_R_110','prototype','p_lambda_R_110').
prototype('p_lambda_R_110','h_FP').
methodRet('d_lambda_R_110','lambda_R_110').
load('t1271','t_R_109','executeSql_R_?').
actual('353','1','DELETE FROM section_meta WHERE section_id IN (SELECT sections.id FROM sections LEFT JOIN styles ON styles.id = sections.style_id WHERE styles.id IS NULL);').
callRet('353','DELETE FROM section_meta WHERE section_id IN (SELECT sections.id FROM sections LEFT JOIN styles ON styles.id = sections.style_id WHERE styles.id IS NULL);').
assign('t1270','t1272').
load('t1274','t_R_109','executeSql').
actual('354','1','DELETE FROM sections WHERE id IN (SELECT sections.id FROM sections LEFT JOIN styles ON styles.id = sections.style_id WHERE styles.id IS NULL);').
callRet('354','DELETE FROM sections WHERE id IN (SELECT sections.id FROM sections LEFT JOIN styles ON styles.id = sections.style_id WHERE styles.id IS NULL);').
assign('t1273','t1275').
actual('355','1','d_R_108').
callRet('355','d_R_108').
assign('t1276','t1277').
actual('356','1','lambda_R_112').
callRet('356','lambda_R_112').
actual('356','2','reportError_R_?').
callRet('356','reportError_R_?').
assign('t1278','t1279').
ptsTo('lambda_R_112','d_lambda_R_112').
heapPtsTo('d_lambda_R_112','prototype','p_lambda_R_112').
prototype('p_lambda_R_112','h_FP').
methodRet('d_lambda_R_112','lambda_R_112').
formal('d_lambda_R_112','1','db_R_112').
load('t1281','db_R_112','readTransaction_R_?').
actual('357','1','lambda_R_113').
callRet('357','lambda_R_113').
actual('357','2','reportError_R_?').
callRet('357','reportError_R_?').
assign('t1280','t1282').
ptsTo('lambda_R_113','d_lambda_R_113').
heapPtsTo('d_lambda_R_113','prototype','p_lambda_R_113').
prototype('p_lambda_R_113','h_FP').
methodRet('d_lambda_R_113','lambda_R_113').
formal('d_lambda_R_113','1','t_R_113').
assign('t1283','options_R_111').
load('t1285','options_R_111','id').
load('t1287','options_R_111','id').
store('t1286','0','t1287').
assign('None','t1286').
load('t1288','options_R_111','enabled').
load('t1289','options_R_111','url').
actual('358','1','null').
callRet('358','null').
actual('358','2','t1288').
callRet('358','t1288').
actual('358','3','t1289').
callRet('358','t1289').
actual('358','4','callback_R_111').
callRet('358','callback_R_111').
assign('t1284','t1290').
assign('sql_R_113','SELECT DISTINCT s.style_id FROM sections s INNER JOIN section_meta sm ON sm.section_id = s.id WHERE (sm.name = "url" and sm.value = ?) OR (sm.name = "url-prefix" AND ? LIKE (sm.value || "%"))').
assign('matchParams_R_113','matchParams_R_113').
load('t1291','options_R_111','matchUrl').
actual('359','1','t1291').
callRet('359','t1291').
assign('domains_R_113','t1292').
load('t1293','matchParams_R_113','concat').
load('t1294','options_R_111','matchUrl').
store('matchParams_R_113','0','t1294').
load('t1295','options_R_111','matchUrl').
store('matchParams_R_113','1','t1295').
actual('360','1','matchParams_R_113').
callRet('360','matchParams_R_113').
load('t1297','t1296','concat_R_?').
actual('361','1','domains_R_113').
callRet('361','domains_R_113').
assign('matchParams_R_113','t1298').
assign('domainClause_R_113','').
load('t1300','domains_R_113','length').
assign('t1299','t1301').
load('t1303','domains_R_113','length').
assign('t1302','t1304').
assign('sql_R_113',' OR (sm.name = "domain" AND sm.value IN (').
load('t1305','domains_R_113','map_R_?').
actual('362','1','lambda_R_114').
callRet('362','lambda_R_114').
load('t1307','t1306','join_R_?').
actual('363','1',',').
callRet('363',',').
assign('sql_R_113','t1308').
ptsTo('lambda_R_114','d_lambda_R_114').
heapPtsTo('d_lambda_R_114','prototype','p_lambda_R_114').
prototype('p_lambda_R_114','h_FP').
methodRet('d_lambda_R_114','lambda_R_114').
formal('d_lambda_R_114','1','d_R_114').
assign('sql_R_113','))').
assign('sql_R_113',' OR (sm.name = "domain" AND sm.value = ?)').
load('t1310','t_R_113','executeSql_R_?').
actual('364','1','sql_R_113').
callRet('364','sql_R_113').
actual('364','2','matchParams_R_113').
callRet('364','matchParams_R_113').
actual('364','3','lambda_R_115').
callRet('364','lambda_R_115').
assign('t1309','t1311').
ptsTo('lambda_R_115','d_lambda_R_115').
heapPtsTo('d_lambda_R_115','prototype','p_lambda_R_115').
prototype('p_lambda_R_115','h_FP').
methodRet('d_lambda_R_115','lambda_R_115').
formal('d_lambda_R_115','1','t_R_115').
formal('d_lambda_R_115','2','r_R_115').
methodRet('d_lambda_R_114','?').
assign('style_ids_R_115','style_ids_R_115').
load('t1313','options_R_111','id').
assign('t1312','t1313').
load('t1315','style_ids_R_115','push_R_?').
load('t1316','options_R_111','id').
actual('365','1','t1316').
callRet('365','t1316').
assign('t1314','t1317').
load('t1319','r_R_115','rows').
load('t1320','t1319','length').
assign('t1318','t1321').
assign('i_R_115','0').
assign('t1323','i_R_115').
assign('t1322','t1323').
load('t1324','r_R_115','rows').
load('t1325','t1324','item_R_?').
actual('366','1','i_R_115').
callRet('366','i_R_115').
assign('values_R_115','t1326').
load('t1328','style_ids_R_115','push').
load('t1329','values_R_115','style_id').
actual('367','1','t1329').
callRet('367','t1329').
assign('t1327','t1330').
assign('i_R_115','0').
actual('368','1','lambda_R_116').
callRet('368','lambda_R_116').
assign('t1331','t1332').
ptsTo('lambda_R_116','d_lambda_R_116').
heapPtsTo('d_lambda_R_116','prototype','p_lambda_R_116').
prototype('p_lambda_R_116','h_FP').
methodRet('d_lambda_R_116','lambda_R_116').
formal('d_lambda_R_116','1','ids_R_116').
load('t1333','style_ids_R_115','concat_R_?').
actual('369','1','ids_R_116').
callRet('369','ids_R_116').
assign('style_ids_R_115','t1334').
load('t1336','options_R_111','enabled').
load('t1337','options_R_111','url').
actual('370','1','style_ids_R_115').
callRet('370','style_ids_R_115').
actual('370','2','t1336').
callRet('370','t1336').
actual('370','3','t1337').
callRet('370','t1337').
actual('370','4','callback_R_111').
callRet('370','callback_R_111').
assign('t1335','t1338').
assign('t1339','t1340').
actual('372','1','cachedStyles_R_0').
callRet('372','cachedStyles_R_0').
assign('t1341','t1342').
methodRet('d_getCache_R_117','null').
load('t1344','chrome','extension').
load('t1345','t1344','sendRequest').
store('t1346','name_R_?','getCachedStyles').
actual('373','1','t1346').
callRet('373','t1346').
actual('373','2','callback_R_117').
callRet('373','callback_R_117').
assign('t1343','t1347').
assign('t1348','t1349').
methodRet('d_fixBoolean_R_118','t1350').
methodRet('d_fixBoolean_R_118','null').
actual('374','1','enabled_R_119').
callRet('374','enabled_R_119').
assign('enabled_R_119','t1351').
assign('t1352','t1353').
assign('url_R_119','null').
assign('t1354','styleIds_R_119').
actual('375','1','lambda_R_120').
callRet('375','lambda_R_120').
assign('t1355','t1356').
ptsTo('lambda_R_120','d_lambda_R_120').
heapPtsTo('d_lambda_R_120','prototype','p_lambda_R_120').
prototype('p_lambda_R_120','h_FP').
methodRet('d_lambda_R_120','lambda_R_120').
formal('d_lambda_R_120','1','cache_R_120').
methodRet('d_loadStyles_R_119','null').
actual('376','1','t1358').
callRet('376','t1358').
actual('376','2','styleIds_R_119').
callRet('376','styleIds_R_119').
actual('376','3','enabled_R_119').
callRet('376','enabled_R_119').
actual('376','4','url_R_119').
callRet('376','url_R_119').
actual('376','5','callback_R_119').
callRet('376','callback_R_119').
assign('t1357','t1359').
assign('styles_R_120','styles_R_120').
assign('styleIdsNeeded_R_120','styleIdsNeeded_R_120').
load('t1361','styleIds_R_119','forEach_R_?').
actual('377','1','lambda_R_121').
callRet('377','lambda_R_121').
assign('t1360','t1362').
ptsTo('lambda_R_121','d_lambda_R_121').
heapPtsTo('d_lambda_R_121','prototype','p_lambda_R_121').
prototype('p_lambda_R_121','h_FP').
methodRet('d_lambda_R_121','lambda_R_121').
formal('d_lambda_R_121','1','id_R_121').
assign('styleIds_R_119','styleIdsNeeded_R_120').
load('t1364','styleIds_R_119','length').
assign('t1363','t1365').
actual('378','1','styles_R_120').
callRet('378','styles_R_120').
assign('t1366','t1367').
methodRet('d_lambda_R_120','null').
actual('379','1','styles_R_120').
callRet('379','styles_R_120').
actual('379','2','styleIds_R_119').
callRet('379','styleIds_R_119').
actual('379','3','enabled_R_119').
callRet('379','enabled_R_119').
actual('379','4','url_R_119').
callRet('379','url_R_119').
actual('379','5','callback_R_119').
callRet('379','callback_R_119').
assign('t1368','t1369').
load('t1371','cache_R_120','id_R_121').
assign('t1370','t1371').
load('t1373','styleIdsNeeded_R_120','push_R_?').
actual('380','1','id_R_121').
callRet('380','id_R_121').
assign('t1372','t1374').
load('t1376','cache_R_120','id_R_121').
actual('381','1','t1376').
callRet('381','t1376').
actual('381','2','enabled_R_119').
callRet('381','enabled_R_119').
actual('381','3','url_R_119').
callRet('381','url_R_119').
assign('t1375','t1377').
load('t1379','styles_R_120','push').
load('t1380','cache_R_120','id_R_121').
actual('382','1','t1380').
callRet('382','t1380').
assign('t1378','t1381').
load('t1383','style_R_122','enabled').
actual('383','1','t1383').
callRet('383','t1383').
load('t1388','style_R_122','url').
methodRet('d_checkStyle_R_122','t1391').
actual('384','1','lambda_R_124').
callRet('384','lambda_R_124').
actual('384','2','reportError_R_?').
callRet('384','reportError_R_?').
assign('t1392','t1393').
ptsTo('lambda_R_124','d_lambda_R_124').
heapPtsTo('d_lambda_R_124','prototype','p_lambda_R_124').
prototype('p_lambda_R_124','h_FP').
methodRet('d_lambda_R_124','lambda_R_124').
formal('d_lambda_R_124','1','db_R_124').
load('t1395','db_R_124','readTransaction_R_?').
actual('385','1','lambda_R_125').
callRet('385','lambda_R_125').
actual('385','2','reportError_R_?').
callRet('385','reportError_R_?').
assign('t1394','t1396').
ptsTo('lambda_R_125','d_lambda_R_125').
heapPtsTo('d_lambda_R_125','prototype','p_lambda_R_125').
prototype('p_lambda_R_125','h_FP').
methodRet('d_lambda_R_125','lambda_R_125').
formal('d_lambda_R_125','1','t_R_125').
assign('where_R_125','').
assign('params_R_125','params_R_125').
assign('t1397','styleIds_R_123').
load('t1399','styleIds_R_123','size').
assign('t1398','t1400').
actual('386','1','t1402').
callRet('386','t1402').
assign('t1401','t1403').
methodRet('d_lambda_R_125','null').
assign('where_R_125',' AND s.id IN (').
assign('firstStyleId_R_125','true').
load('t1405','styleIds_R_123','forEach_R_?').
actual('387','1','lambda_R_126').
callRet('387','lambda_R_126').
assign('t1404','t1406').
ptsTo('lambda_R_126','d_lambda_R_126').
heapPtsTo('d_lambda_R_126','prototype','p_lambda_R_126').
prototype('p_lambda_R_126','h_FP').
methodRet('d_lambda_R_126','lambda_R_126').
formal('d_lambda_R_126','1','styleId_R_126').
assign('where_R_125',')').
load('t1408','t_R_125','executeSql_R_?').
actual('388','1','t1410').
callRet('388','t1410').
actual('388','2','params_R_125').
callRet('388','params_R_125').
actual('388','3','lambda_R_127').
callRet('388','lambda_R_127').
actual('388','4','reportError_R_?').
callRet('388','reportError_R_?').
assign('t1407','t1411').
ptsTo('lambda_R_127','d_lambda_R_127').
heapPtsTo('d_lambda_R_127','prototype','p_lambda_R_127').
prototype('p_lambda_R_127','h_FP').
methodRet('d_lambda_R_127','lambda_R_127').
formal('d_lambda_R_127','1','t_R_127').
formal('d_lambda_R_127','2','r_R_127').
assign('(None, "where_R_125")','?').
assign('where_R_125',',?').
assign('firstStyleId_R_125','false').
load('t1413','params_R_125','push_R_?').
actual('389','1','styleId_R_126').
callRet('389','styleId_R_126').
assign('t1412','t1414').
assign('currentStyle_R_127','null').
assign('currentSection_R_127','null').
load('t1416','r_R_127','rows').
load('t1417','t1416','length').
assign('t1415','t1418').
assign('i_R_127','0').
assign('t1420','i_R_127').
assign('t1419','t1420').
load('t1421','r_R_127','rows').
load('t1422','t1421','item_R_?').
actual('390','1','i_R_127').
callRet('390','i_R_127').
assign('values_R_127','t1423').
assign('metaName_R_127','null').
load('t1424','values_R_127','metaValue').
assign('metaValue_R_127','t1424').
load('t1427','currentStyle_R_127','id').
load('t1428','values_R_127','id').
assign('t1425','t1430').
load('t1431','values_R_127','id').
store('currentStyle_R_127','id_R_?','t1431').
load('t1432','values_R_127','url').
store('currentStyle_R_127','url_R_123','t1432').
load('t1433','values_R_127','updateUrl').
store('currentStyle_R_127','updateUrl_R_?','t1433').
load('t1434','values_R_127','md5Url').
store('currentStyle_R_127','md5Url_R_?','t1434').
load('t1435','values_R_127','name').
store('currentStyle_R_127','name_R_?','t1435').
load('t1436','values_R_127','enabled').
store('currentStyle_R_127','enabled_R_123','t1436').
store('currentStyle_R_127','sections_R_?','t1437').
assign('currentStyle_R_127','__objectInit__').
load('t1439','styles_R_123','push_R_?').
actual('391','1','currentStyle_R_127').
callRet('391','currentStyle_R_127').
assign('t1438','t1440').
load('t1443','currentSection_R_127','id').
load('t1444','values_R_127','section_id').
assign('t1441','t1446').
load('t1447','values_R_127','section_id').
store('currentSection_R_127','id_R_?','t1447').
load('t1448','values_R_127','code').
store('currentSection_R_127','code_R_?','t1448').
assign('currentSection_R_127','__objectInit__').
load('t1450','currentStyle_R_127','sections').
load('t1451','t1450','push').
actual('392','1','currentSection_R_127').
callRet('392','currentSection_R_127').
assign('t1449','t1452').
assign('t1453','t1454').
load('t1456','currentSection_R_127','metaName_R_127').
assign('t1455','t1456').
load('t1457','currentSection_R_127','metaName_R_127').
store('t1457','0','metaValue_R_127').
store('currentSection_R_127','metaName_R_127','t1457').
load('t1459','currentSection_R_127','metaName_R_127').
load('t1460','t1459','push').
actual('393','1','metaValue_R_127').
callRet('393','metaValue_R_127').
assign('t1458','t1461').
assign('i_R_127','0').
assign('t1462','t1463').
load('t1465','chrome','extension').
load('t1466','t1465','sendRequest').
store('t1467','name_R_?','cacheStyles').
store('t1467','styles_R_123','styles_R_123').
actual('395','1','t1467').
callRet('395','t1467').
assign('t1464','t1468').
load('t1470','styles_R_123','forEach_R_?').
actual('396','1','lambda_R_128').
callRet('396','lambda_R_128').
assign('t1469','t1471').
ptsTo('lambda_R_128','d_lambda_R_128').
heapPtsTo('d_lambda_R_128','prototype','p_lambda_R_128').
prototype('p_lambda_R_128','h_FP').
methodRet('d_lambda_R_128','lambda_R_128').
formal('d_lambda_R_128','1','style_R_128').
load('t1473','styles_R_123','filter_R_?').
actual('397','1','lambda_R_129').
callRet('397','lambda_R_129').
actual('398','1','t1474').
callRet('398','t1474').
assign('t1472','t1475').
ptsTo('lambda_R_129','d_lambda_R_129').
heapPtsTo('d_lambda_R_129','prototype','p_lambda_R_129').
prototype('p_lambda_R_129','h_FP').
methodRet('d_lambda_R_129','lambda_R_129').
formal('d_lambda_R_129','1','style_R_129').
load('t1476','cachedStyles_R_0','style_R_128').
load('t1477','t1476','id').
store('t1476','id','style_R_128').
actual('399','1','style_R_129').
callRet('399','style_R_129').
actual('399','2','enabled_R_123').
callRet('399','enabled_R_123').
actual('399','3','url_R_123').
callRet('399','url_R_123').
methodRet('d_lambda_R_129','t1478').
assign('t1479','t1482').
actual('401','1','cachedGlobalStyleIds_R_0').
callRet('401','cachedGlobalStyleIds_R_0').
assign('t1483','t1484').
methodRet('d_getGlobalStyleIds_R_130','null').
actual('402','1','lambda_R_131').
callRet('402','lambda_R_131').
actual('402','2','reportError_R_?').
callRet('402','reportError_R_?').
assign('t1485','t1486').
ptsTo('lambda_R_131','d_lambda_R_131').
heapPtsTo('d_lambda_R_131','prototype','p_lambda_R_131').
prototype('p_lambda_R_131','h_FP').
methodRet('d_lambda_R_131','lambda_R_131').
formal('d_lambda_R_131','1','db_R_131').
load('t1488','db_R_131','readTransaction_R_?').
actual('403','1','lambda_R_132').
callRet('403','lambda_R_132').
actual('403','2','reportError_R_?').
callRet('403','reportError_R_?').
assign('t1487','t1489').
ptsTo('lambda_R_132','d_lambda_R_132').
heapPtsTo('d_lambda_R_132','prototype','p_lambda_R_132').
prototype('p_lambda_R_132','h_FP').
methodRet('d_lambda_R_132','lambda_R_132').
formal('d_lambda_R_132','1','t_R_132').
load('t1491','t_R_132','executeSql_R_?').
actual('404','1','SELECT DISTINCT s.style_id, s.code FROM sections s LEFT JOIN section_meta sm ON sm.section_id = s.id INNER JOIN styles st ON st.id = s.style_id GROUP BY s.id HAVING COUNT(sm.id) = 0').
callRet('404','SELECT DISTINCT s.style_id, s.code FROM sections s LEFT JOIN section_meta sm ON sm.section_id = s.id INNER JOIN styles st ON st.id = s.style_id GROUP BY s.id HAVING COUNT(sm.id) = 0').
actual('404','2','t1492').
callRet('404','t1492').
actual('404','3','lambda_R_133').
callRet('404','lambda_R_133').
actual('404','4','reportError_R_?').
callRet('404','reportError_R_?').
assign('t1490','t1493').
ptsTo('lambda_R_133','d_lambda_R_133').
heapPtsTo('d_lambda_R_133','prototype','p_lambda_R_133').
prototype('p_lambda_R_133','h_FP').
methodRet('d_lambda_R_133','lambda_R_133').
formal('d_lambda_R_133','1','t_R_133').
formal('d_lambda_R_133','2','r_R_133').
assign('style_ids_R_133','style_ids_R_133').
load('t1495','r_R_133','rows').
load('t1496','t1495','length').
assign('t1494','t1497').
assign('i_R_133','0').
assign('t1499','i_R_133').
assign('t1498','t1499').
load('t1500','r_R_133','rows').
load('t1501','t1500','item_R_?').
actual('405','1','i_R_133').
callRet('405','i_R_133').
assign('values_R_133','t1502').
load('t1504','namespacePattern_R_0','test_R_?').
load('t1505','values_R_133','code').
actual('406','1','t1505').
callRet('406','t1505').
assign('t1507','t1506').
load('t1508','style_ids_R_133','indexOf_R_?').
load('t1509','values_R_133','style_id').
actual('407','1','t1509').
callRet('407','t1509').
assign('t1511','1').
assign('t1503','t1513').
load('t1515','style_ids_R_133','push_R_?').
load('t1516','values_R_133','style_id').
actual('408','1','t1516').
callRet('408','t1516').
assign('t1514','t1517').
assign('i_R_133','0').
assign('t1518','t1519').
assign('cachedGlobalStyleIds_R_0','style_ids_R_133').
actual('410','1','style_ids_R_133').
callRet('410','style_ids_R_133').
assign('t1520','t1521').
actual('411','1','lambda_R_135').
callRet('411','lambda_R_135').
actual('411','2','reportError_R_?').
callRet('411','reportError_R_?').
assign('t1522','t1523').
ptsTo('lambda_R_135','d_lambda_R_135').
heapPtsTo('d_lambda_R_135','prototype','p_lambda_R_135').
prototype('p_lambda_R_135','h_FP').
methodRet('d_lambda_R_135','lambda_R_135').
formal('d_lambda_R_135','1','db_R_135').
load('t1525','db_R_135','transaction_R_?').
actual('412','1','lambda_R_136').
callRet('412','lambda_R_136').
actual('412','2','reportError_R_?').
callRet('412','reportError_R_?').
actual('412','3','lambda_R_141').
callRet('412','lambda_R_141').
assign('t1524','t1526').
ptsTo('lambda_R_136','d_lambda_R_136').
heapPtsTo('d_lambda_R_136','prototype','p_lambda_R_136').
prototype('p_lambda_R_136','h_FP').
methodRet('d_lambda_R_136','lambda_R_136').
formal('d_lambda_R_136','1','t_R_136').
ptsTo('lambda_R_141','d_lambda_R_141').
heapPtsTo('d_lambda_R_141','prototype','p_lambda_R_141').
prototype('p_lambda_R_141','h_FP').
methodRet('d_lambda_R_141','lambda_R_141').
load('t1528','o_R_134','id').
assign('t1527','t1528').
load('t1530','t_R_136','executeSql_R_?').
load('t1532','o_R_134','name').
store('t1531','0','t1532').
store('t1531','1','true').
load('t1533','o_R_134','url').
store('t1531','2','t1533').
load('t1534','o_R_134','updateUrl').
store('t1531','3','t1534').
actual('413','1','INSERT INTO styles (name, enabled, url, updateUrl) VALUES (?, ?, ?, ?);').
callRet('413','INSERT INTO styles (name, enabled, url, updateUrl) VALUES (?, ?, ?, ?);').
actual('413','2','t1531').
callRet('413','t1531').
assign('t1529','t1535').
load('t1537','t_R_136','executeSql').
load('t1539','o_R_134','id').
store('t1538','0','t1539').
actual('414','1','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
callRet('414','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
actual('414','2','t1538').
callRet('414','t1538').
assign('t1536','t1540').
load('t1542','t_R_136','executeSql').
load('t1544','o_R_134','id').
store('t1543','0','t1544').
actual('415','1','DELETE FROM sections WHERE style_id = ?;').
callRet('415','DELETE FROM sections WHERE style_id = ?;').
actual('415','2','t1543').
callRet('415','t1543').
assign('t1541','t1545').
load('t1547','o_R_134','sections').
load('t1548','t1547','forEach_R_?').
actual('416','1','lambda_R_137').
callRet('416','lambda_R_137').
assign('t1546','t1549').
ptsTo('lambda_R_137','d_lambda_R_137').
heapPtsTo('d_lambda_R_137','prototype','p_lambda_R_137').
prototype('p_lambda_R_137','h_FP').
methodRet('d_lambda_R_137','lambda_R_137').
formal('d_lambda_R_137','1','section_R_137').
load('t1551','o_R_134','id').
assign('t1550','t1551').
load('t1553','t_R_136','executeSql_R_?').
load('t1555','section_R_137','code').
store('t1554','0','t1555').
actual('417','1','INSERT INTO sections (style_id, code) SELECT id, ? FROM styles ORDER BY id DESC LIMIT 1;').
callRet('417','INSERT INTO sections (style_id, code) SELECT id, ? FROM styles ORDER BY id DESC LIMIT 1;').
actual('417','2','t1554').
callRet('417','t1554').
assign('t1552','t1556').
load('t1558','t_R_136','executeSql').
load('t1560','o_R_134','id').
store('t1559','0','t1560').
load('t1561','section_R_137','code').
store('t1559','1','t1561').
actual('418','1','INSERT INTO sections (style_id, code) VALUES (?, ?);').
callRet('418','INSERT INTO sections (style_id, code) VALUES (?, ?);').
actual('418','2','t1559').
callRet('418','t1559').
assign('t1557','t1562').
load('t1564','section_R_137','urls').
load('t1565','t1564','forEach_R_?').
actual('419','1','lambda_R_138').
callRet('419','lambda_R_138').
assign('t1563','t1566').
ptsTo('lambda_R_138','d_lambda_R_138').
heapPtsTo('d_lambda_R_138','prototype','p_lambda_R_138').
prototype('p_lambda_R_138','h_FP').
methodRet('d_lambda_R_138','lambda_R_138').
formal('d_lambda_R_138','1','u_R_138').
load('t1568','section_R_137','urlPrefixes').
load('t1569','t1568','forEach').
actual('420','1','lambda_R_139').
callRet('420','lambda_R_139').
assign('t1567','t1570').
ptsTo('lambda_R_139','d_lambda_R_139').
heapPtsTo('d_lambda_R_139','prototype','p_lambda_R_139').
prototype('p_lambda_R_139','h_FP').
methodRet('d_lambda_R_139','lambda_R_139').
formal('d_lambda_R_139','1','u_R_139').
load('t1572','section_R_137','domains').
load('t1573','t1572','forEach').
actual('421','1','lambda_R_140').
callRet('421','lambda_R_140').
assign('t1571','t1574').
ptsTo('lambda_R_140','d_lambda_R_140').
heapPtsTo('d_lambda_R_140','prototype','p_lambda_R_140').
prototype('p_lambda_R_140','h_FP').
methodRet('d_lambda_R_140','lambda_R_140').
formal('d_lambda_R_140','1','u_R_140').
load('t1576','t_R_136','executeSql_R_?').
store('t1577','0','u_R_138').
actual('422','1','INSERT INTO section_meta (section_id, name, value) SELECT id, "url", ? FROM sections ORDER BY id DESC LIMIT 1;').
callRet('422','INSERT INTO section_meta (section_id, name, value) SELECT id, "url", ? FROM sections ORDER BY id DESC LIMIT 1;').
actual('422','2','t1577').
callRet('422','t1577').
assign('t1575','t1578').
load('t1580','t_R_136','executeSql_R_?').
store('t1581','0','u_R_139').
actual('423','1','INSERT INTO section_meta (section_id, name, value) SELECT id, "url-prefix", ? FROM sections ORDER BY id DESC LIMIT 1;').
callRet('423','INSERT INTO section_meta (section_id, name, value) SELECT id, "url-prefix", ? FROM sections ORDER BY id DESC LIMIT 1;').
actual('423','2','t1581').
callRet('423','t1581').
assign('t1579','t1582').
load('t1584','t_R_136','executeSql_R_?').
store('t1585','0','u_R_140').
actual('424','1','INSERT INTO section_meta (section_id, name, value) SELECT id, "domain", ? FROM sections ORDER BY id DESC LIMIT 1;').
callRet('424','INSERT INTO section_meta (section_id, name, value) SELECT id, "domain", ? FROM sections ORDER BY id DESC LIMIT 1;').
actual('424','2','t1585').
callRet('424','t1585').
assign('t1583','t1586').
load('t1588','o_R_134','id').
actual('425','1','t1588').
callRet('425','t1588').
actual('425','2','callback_R_134').
callRet('425','callback_R_134').
assign('t1587','t1589').
load('t1591','chrome','extension').
load('t1592','t1591','sendRequest').
store('t1593','name_R_?','styleChanged').
actual('426','1','t1593').
callRet('426','t1593').
assign('t1590','t1594').
assign('t1595','id_R_142').
store('t1597','name_R_?','styleUpdated').
store('t1597','style_R_?','id_R_142').
actual('427','1','t1597').
callRet('427','t1597').
assign('t1596','t1598').
assign('t1599','callback_R_142').
actual('428','1','id_R_142').
callRet('428','id_R_142').
assign('t1600','t1601').
methodRet('d_saveFromJSONComplete_R_142','null').
actual('429','1','lambda_R_143').
callRet('429','lambda_R_143').
assign('t1602','t1603').
ptsTo('lambda_R_143','d_lambda_R_143').
heapPtsTo('d_lambda_R_143','prototype','p_lambda_R_143').
prototype('p_lambda_R_143','h_FP').
methodRet('d_lambda_R_143','lambda_R_143').
formal('d_lambda_R_143','1','db_R_143').
load('t1605','db_R_143','readTransaction_R_?').
actual('430','1','lambda_R_144').
callRet('430','lambda_R_144').
actual('430','2','reportError_R_?').
callRet('430','reportError_R_?').
assign('t1604','t1606').
ptsTo('lambda_R_144','d_lambda_R_144').
heapPtsTo('d_lambda_R_144','prototype','p_lambda_R_144').
prototype('p_lambda_R_144','h_FP').
methodRet('d_lambda_R_144','lambda_R_144').
formal('d_lambda_R_144','1','t_R_144').
load('t1608','t_R_144','executeSql_R_?').
actual('431','1','SELECT id FROM styles ORDER BY id DESC LIMIT 1').
callRet('431','SELECT id FROM styles ORDER BY id DESC LIMIT 1').
actual('431','2','t1609').
callRet('431','t1609').
actual('431','3','lambda_R_145').
callRet('431','lambda_R_145').
actual('431','4','reportError_R_?').
callRet('431','reportError_R_?').
assign('t1607','t1610').
ptsTo('lambda_R_145','d_lambda_R_145').
heapPtsTo('d_lambda_R_145','prototype','p_lambda_R_145').
prototype('p_lambda_R_145','h_FP').
methodRet('d_lambda_R_145','lambda_R_145').
formal('d_lambda_R_145','1','t_R_145').
formal('d_lambda_R_145','2','r_R_145').
load('t1611','r_R_145','rows').
load('t1612','t1611','item_R_?').
actual('432','1','0').
callRet('432','0').
load('t1614','t1613','id').
assign('styleId_R_145','t1614').
store('t1616','id_R_142','styleId_R_145').
actual('433','1','t1616').
callRet('433','t1616').
actual('433','2','lambda_R_146').
callRet('433','lambda_R_146').
assign('t1615','t1617').
ptsTo('lambda_R_146','d_lambda_R_146').
heapPtsTo('d_lambda_R_146','prototype','p_lambda_R_146').
prototype('p_lambda_R_146','h_FP').
methodRet('d_lambda_R_146','lambda_R_146').
formal('d_lambda_R_146','1','styles_R_146').
assign('t1618','callback_R_142').
actual('434','1','styleId_R_145').
callRet('434','styleId_R_145').
assign('t1619','t1620').
store('t1622','name_R_?','styleAdded').
load('t1623','styles_R_146','0').
store('t1622','style_R_?','t1623').
actual('435','1','t1622').
callRet('435','t1622').
assign('t1621','t1624').
load('t1626','arguments_R_?','i_R_?').
assign('t1625','t1626').
load('t1628','console','log_R_?').
load('t1629','arguments_R_?','i_R_?').
load('t1630','t1629','message').
actual('436','1','t1630').
callRet('436','t1630').
assign('t1627','t1631').
methodRet('d_isBackground_R_148','t1633').
load('t1634','{"regexp": ".*?:\\/*([^\\/]+)", "modifiers": ""}','exec_R_?').
actual('437','1','url_R_149').
callRet('437','url_R_149').
load('t1636','t1635','1').
assign('d_R_149','t1636').
store('domains_R_149','0','d_R_149').
assign('domains_R_149','domains_R_149').
load('t1638','d_R_149','indexOf').
actual('438','1','.').
callRet('438','.').
assign('t1640','1').
assign('t1637','t1641').
load('t1642','d_R_149','substring_R_?').
load('t1643','d_R_149','indexOf_R_?').
actual('439','1','.').
callRet('439','.').
actual('440','1','t1645').
callRet('440','t1645').
assign('d_R_149','t1646').
load('t1648','domains_R_149','push_R_?').
actual('441','1','d_R_149').
callRet('441','d_R_149').
assign('t1647','t1649').
methodRet('d_getDomains_R_149','domains_R_149').
actual('442','1','lambda_R_151').
callRet('442','lambda_R_151').
assign('t1650','t1651').
ptsTo('lambda_R_151','d_lambda_R_151').
heapPtsTo('d_lambda_R_151','prototype','p_lambda_R_151').
prototype('p_lambda_R_151','h_FP').
methodRet('d_lambda_R_151','lambda_R_151').
formal('d_lambda_R_151','1','db_R_151').
load('t1653','db_R_151','transaction_R_?').
actual('443','1','lambda_R_152').
callRet('443','lambda_R_152').
actual('443','2','reportError_R_?').
callRet('443','reportError_R_?').
actual('443','3','lambda_R_153').
callRet('443','lambda_R_153').
assign('t1652','t1654').
ptsTo('lambda_R_152','d_lambda_R_152').
heapPtsTo('d_lambda_R_152','prototype','p_lambda_R_152').
prototype('p_lambda_R_152','h_FP').
methodRet('d_lambda_R_152','lambda_R_152').
formal('d_lambda_R_152','1','t_R_152').
ptsTo('lambda_R_153','d_lambda_R_153').
heapPtsTo('d_lambda_R_153','prototype','p_lambda_R_153').
prototype('p_lambda_R_153','h_FP').
methodRet('d_lambda_R_153','lambda_R_153').
load('t1656','t_R_152','executeSql_R_?').
store('t1657','0','enabled_R_150').
store('t1657','1','id_R_150').
actual('444','1','UPDATE styles SET enabled = ? WHERE id = ?;').
callRet('444','UPDATE styles SET enabled = ? WHERE id = ?;').
actual('444','2','t1657').
callRet('444','t1657').
assign('t1655','t1658').
load('t1660','chrome','extension').
load('t1661','t1660','sendRequest').
store('t1662','name_R_?','styleChanged').
actual('445','1','t1662').
callRet('445','t1662').
assign('t1659','t1663').
store('t1665','id_R_150','id_R_150').
actual('446','1','t1665').
callRet('446','t1665').
actual('446','2','lambda_R_154').
callRet('446','lambda_R_154').
assign('t1664','t1666').
ptsTo('lambda_R_154','d_lambda_R_154').
heapPtsTo('d_lambda_R_154','prototype','p_lambda_R_154').
prototype('p_lambda_R_154','h_FP').
methodRet('d_lambda_R_154','lambda_R_154').
formal('d_lambda_R_154','1','styles_R_154').
load('t1668','styles_R_154','0').
actual('447','1','t1668').
callRet('447','t1668').
assign('t1667','t1669').
store('t1671','name_R_?','styleUpdated').
load('t1672','styles_R_154','0').
store('t1671','style_R_?','t1672').
actual('448','1','t1671').
callRet('448','t1671').
assign('t1670','t1673').
actual('449','1','lambda_R_156').
callRet('449','lambda_R_156').
assign('t1674','t1675').
ptsTo('lambda_R_156','d_lambda_R_156').
heapPtsTo('d_lambda_R_156','prototype','p_lambda_R_156').
prototype('p_lambda_R_156','h_FP').
methodRet('d_lambda_R_156','lambda_R_156').
formal('d_lambda_R_156','1','db_R_156').
load('t1677','db_R_156','transaction_R_?').
actual('450','1','lambda_R_157').
callRet('450','lambda_R_157').
actual('450','2','reportError_R_?').
callRet('450','reportError_R_?').
actual('450','3','lambda_R_158').
callRet('450','lambda_R_158').
assign('t1676','t1678').
ptsTo('lambda_R_157','d_lambda_R_157').
heapPtsTo('d_lambda_R_157','prototype','p_lambda_R_157').
prototype('p_lambda_R_157','h_FP').
methodRet('d_lambda_R_157','lambda_R_157').
formal('d_lambda_R_157','1','t_R_157').
ptsTo('lambda_R_158','d_lambda_R_158').
heapPtsTo('d_lambda_R_158','prototype','p_lambda_R_158').
prototype('p_lambda_R_158','h_FP').
methodRet('d_lambda_R_158','lambda_R_158').
load('t1680','t_R_157','executeSql_R_?').
store('t1681','0','id_R_155').
actual('451','1','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
callRet('451','DELETE FROM section_meta WHERE section_id IN (SELECT id FROM sections WHERE style_id = ?);').
actual('451','2','t1681').
callRet('451','t1681').
assign('t1679','t1682').
load('t1684','t_R_157','executeSql').
store('t1685','0','id_R_155').
actual('452','1','DELETE FROM sections WHERE style_id = ?;').
callRet('452','DELETE FROM sections WHERE style_id = ?;').
actual('452','2','t1685').
callRet('452','t1685').
assign('t1683','t1686').
load('t1688','t_R_157','executeSql').
store('t1689','0','id_R_155').
actual('453','1','DELETE FROM styles WHERE id = ?;').
callRet('453','DELETE FROM styles WHERE id = ?;').
actual('453','2','t1689').
callRet('453','t1689').
assign('t1687','t1690').
load('t1692','chrome','extension').
load('t1693','t1692','sendRequest').
store('t1694','name_R_?','styleChanged').
actual('454','1','t1694').
callRet('454','t1694').
assign('t1691','t1695').
actual('455','1','id_R_155').
callRet('455','id_R_155').
assign('t1696','t1697').
store('t1699','name_R_?','styleDeleted').
store('t1699','id_R_155','id_R_155').
actual('456','1','t1699').
callRet('456','t1699').
assign('t1698','t1700').
load('t1701','document','getElementById_R_?').
actual('457','1','name').
callRet('457','name').
assign('temp_R_159','t1702').
load('t1704','temp_R_159','addEventListener_R_?').
actual('458','1','change').
callRet('458','change').
actual('458','2','lambda_R_160').
callRet('458','lambda_R_160').
assign('t1703','t1705').
ptsTo('lambda_R_160','d_lambda_R_160').
heapPtsTo('d_lambda_R_160','prototype','p_lambda_R_160').
prototype('p_lambda_R_160','h_FP').
methodRet('d_lambda_R_160','lambda_R_160').
formal('d_lambda_R_160','1','event_R_160').
assign('t1706','t1707').
load('t1708','document','getElementById_R_?').
actual('460','1','enabled').
callRet('460','enabled').
assign('temp_R_161','t1709').
load('t1711','temp_R_161','addEventListener_R_?').
actual('461','1','change').
callRet('461','change').
actual('461','2','lambda_R_162').
callRet('461','lambda_R_162').
assign('t1710','t1712').
ptsTo('lambda_R_162','d_lambda_R_162').
heapPtsTo('d_lambda_R_162','prototype','p_lambda_R_162').
prototype('p_lambda_R_162','h_FP').
methodRet('d_lambda_R_162','lambda_R_162').
formal('d_lambda_R_162','1','event_R_162').
assign('t1713','t1714').
load('t1715','document','getElementById_R_?').
actual('463','1','_added_by_transform_0').
callRet('463','_added_by_transform_0').
assign('temp_R_163','t1716').
load('t1718','temp_R_163','addEventListener_R_?').
actual('464','1','click').
callRet('464','click').
actual('464','2','lambda_R_164').
callRet('464','lambda_R_164').
assign('t1717','t1719').
ptsTo('lambda_R_164','d_lambda_R_164').
heapPtsTo('d_lambda_R_164','prototype','p_lambda_R_164').
prototype('p_lambda_R_164','h_FP').
methodRet('d_lambda_R_164','lambda_R_164').
formal('d_lambda_R_164','1','event_R_164').
assign('t1720','t1721').
load('t1722','document','getElementById_R_?').
actual('466','1','sections-help').
callRet('466','sections-help').
assign('temp_R_165','t1723').
load('t1725','temp_R_165','addEventListener_R_?').
actual('467','1','click').
callRet('467','click').
actual('467','2','lambda_R_166').
callRet('467','lambda_R_166').
assign('t1724','t1726').
ptsTo('lambda_R_166','d_lambda_R_166').
heapPtsTo('d_lambda_R_166','prototype','p_lambda_R_166').
prototype('p_lambda_R_166','h_FP').
methodRet('d_lambda_R_166','lambda_R_166').
formal('d_lambda_R_166','1','event_R_166').
assign('t1727','t1728').
load('t1729','document','getElementById_R_?').
actual('469','1','_added_by_transform_0').
callRet('469','_added_by_transform_0').
assign('temp_R_167','t1730').
load('t1732','temp_R_167','addEventListener_R_?').
actual('470','1','click').
callRet('470','click').
actual('470','2','lambda_R_168').
callRet('470','lambda_R_168').
assign('t1731','t1733').
ptsTo('lambda_R_168','d_lambda_R_168').
heapPtsTo('d_lambda_R_168','prototype','p_lambda_R_168').
prototype('p_lambda_R_168','h_FP').
methodRet('d_lambda_R_168','lambda_R_168').
formal('d_lambda_R_168','1','event_R_168').
assign('t1734','t1735').
load('t1738','tab_R_169','url').
store('t1737','matchUrl_R_?','t1738').
actual('472','1','t1737').
callRet('472','t1737').
actual('472','2','showStyles_R_?').
callRet('472','showStyles_R_?').
assign('t1736','t1739').
load('t1740','document','querySelector_R_?').
load('t1741','t1740','#find-styles a').
load('t1742','t1741','href').
load('t1743','tab_R_169','url').
actual('473','1','t1743').
callRet('473','t1743').
store('t1741','href','t1745').
load('t1746','document','getElementById_R_?').
actual('474','1','installed').
callRet('474','installed').
assign('installed_R_170','t1747').
load('t1749','styles_R_170','length').
assign('t1748','t1750').
load('t1751','installed_R_170','innerHTML').
actual('475','1','noStylesForSite').
callRet('475','noStylesForSite').
store('installed_R_170','innerHTML','t1754').
load('t1756','styles_R_170','map_R_?').
actual('476','1','createStyleElement_R_?').
callRet('476','createStyleElement_R_?').
load('t1758','t1757','forEach_R_?').
actual('477','1','lambda_R_171').
callRet('477','lambda_R_171').
assign('t1755','t1759').
ptsTo('lambda_R_171','d_lambda_R_171').
heapPtsTo('d_lambda_R_171','prototype','p_lambda_R_171').
prototype('p_lambda_R_171','h_FP').
methodRet('d_lambda_R_171','lambda_R_171').
formal('d_lambda_R_171','1','e_R_171').
load('t1761','installed_R_170','appendChild_R_?').
actual('478','1','e_R_171').
callRet('478','e_R_171').
assign('t1760','t1762').
load('t1763','styleTemplate_R_0','cloneNode_R_?').
actual('479','1','true').
callRet('479','true').
assign('e_R_172','t1764').
load('t1766','e_R_172','setAttribute_R_?').
load('t1767','style_R_172','enabled').
assign('None','enabled').
actual('480','1','class').
callRet('480','class').
actual('480','2','t1769').
callRet('480','t1769').
assign('t1765','t1770').
load('t1772','e_R_172','setAttribute').
load('t1773','style_R_172','id').
actual('481','1','style-id').
callRet('481','style-id').
actual('481','2','t1773').
callRet('481','t1773').
assign('t1771','t1774').
load('t1775','e_R_172','querySelector_R_?').
actual('482','1','.style-name').
callRet('482','.style-name').
assign('styleName_R_172','t1776').
load('t1778','styleName_R_172','appendChild_R_?').
load('t1779','document','createTextNode_R_?').
load('t1780','style_R_172','name').
actual('483','1','t1780').
callRet('483','t1780').
actual('484','1','t1781').
callRet('484','t1781').
assign('t1777','t1782').
load('t1783','e_R_172','querySelector').
actual('485','1','.style-edit-link').
callRet('485','.style-edit-link').
assign('editLink_R_172','t1784').
load('t1786','editLink_R_172','setAttribute').
load('t1787','editLink_R_172','getAttribute_R_?').
actual('486','1','href').
callRet('486','href').
load('t1789','style_R_172','id').
actual('487','1','href').
callRet('487','href').
actual('487','2','t1790').
callRet('487','t1790').
assign('t1785','t1791').
methodRet('d_createStyleElement_R_172','e_R_172').
actual('488','1','event_R_173').
callRet('488','event_R_173').
assign('id_R_173','t1792').
actual('489','1','id_R_173').
callRet('489','id_R_173').
actual('489','2','enabled_R_173').
callRet('489','enabled_R_173').
assign('t1793','t1794').
actual('490','1','deleteStyleConfirm').
callRet('490','deleteStyleConfirm').
actual('491','1','t1796').
callRet('491','t1796').
assign('t1798','t1797').
assign('t1795','t1798').
methodRet('d_doDelete_R_174','null').
actual('492','1','event_R_?').
callRet('492','event_R_?').
assign('id_R_174','t1799').
actual('493','1','id_R_174').
callRet('493','id_R_174').
assign('t1800','t1801').
load('t1802','event_R_175','target').
assign('e_R_175','t1802').
assign('t1803','e_R_175').
load('t1805','e_R_175','hasAttribute_R_?').
actual('494','1','style-id').
callRet('494','style-id').
assign('t1804','t1806').
load('t1807','e_R_175','getAttribute_R_?').
actual('495','1','style-id').
callRet('495','style-id').
methodRet('d_getId_R_175','t1808').
load('t1809','e_R_175','parentNode').
assign('e_R_175','t1809').
methodRet('d_getId_R_175','null').
load('t1811','chrome','tabs').
load('t1812','t1811','create').
load('t1814','event_R_176','target').
load('t1815','t1814','href').
store('t1813','url_R_?','t1815').
actual('496','1','t1813').
callRet('496','t1813').
assign('t1810','t1816').
methodRet('d_openLink_R_176','false').
load('t1817','document','getElementById_R_?').
actual('497','1','installed').
callRet('497','installed').
assign('installed_R_177','t1818').
load('t1820','installed_R_177','replaceChild_R_?').
actual('498','1','style_R_177').
callRet('498','style_R_177').
load('t1822','installed_R_177','querySelector_R_?').
load('t1823','style_R_177','id').
actual('499','1','t1825').
callRet('499','t1825').
actual('500','1','t1821').
callRet('500','t1821').
actual('500','2','t1826').
callRet('500','t1826').
assign('t1819','t1827').
load('t1828','document','getElementById_R_?').
actual('501','1','installed').
callRet('501','installed').
assign('installed_R_178','t1829').
load('t1831','installed_R_178','removeChild_R_?').
load('t1832','installed_R_178','querySelector_R_?').
actual('502','1','t1834').
callRet('502','t1834').
actual('503','1','t1835').
callRet('503','t1835').
assign('t1830','t1836').
load('t1837','document','getElementById_R_?').
actual('504','1','_added_by_transform_0').
callRet('504','_added_by_transform_0').
assign('temp_R_179','t1838').
load('t1840','temp_R_179','addEventListener_R_?').
actual('505','1','click').
callRet('505','click').
actual('505','2','lambda_R_180').
callRet('505','lambda_R_180').
assign('t1839','t1841').
ptsTo('lambda_R_180','d_lambda_R_180').
heapPtsTo('d_lambda_R_180','prototype','p_lambda_R_180').
prototype('p_lambda_R_180','h_FP').
methodRet('d_lambda_R_180','lambda_R_180').
formal('d_lambda_R_180','1','event_R_180').
actual('506','1','event_R_180').
callRet('506','event_R_180').
methodRet('d_lambda_R_180','t1842').
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

