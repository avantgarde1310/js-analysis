ptsTo('Form_R_1','d_Form_R_1').
heapPtsTo('d_Form_R_1','prototype','p_Form_R_1').
prototype('p_Form_R_1','h_FP').
methodRet('d_Form_R_1','Form_R_1').
formal('d_Form_R_1','1','dom_R_1').
formal('d_Form_R_1','2','title_R_1').
load('t0','HTMLElement_R_?','prototype').
load('t1','t0','create').
store('t0','create','lambda_R_8').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
formal('d_lambda_R_8','1','tag_R_8').
ptsTo('SPO_R_9','d_SPO_R_9').
heapPtsTo('d_SPO_R_9','prototype','p_SPO_R_9').
prototype('p_SPO_R_9','h_FP').
methodRet('d_SPO_R_9','SPO_R_9').
formal('d_SPO_R_9','1','index_R_9').
assign('t3','0').
store('t2','value_R_?','t3').
store('t2','option_R_?','form').
store('config_R_0','shortcut_R_?','t2').
assign('t5','1').
store('t4','value_R_?','t5').
store('t4','option_R_?','form').
store('config_R_0','shortcut1_R_?','t4').
store('t6','value_R_?','123').
store('t6','option_R_?','form').
store('config_R_0','shortcut2_R_?','t6').
assign('t8','1').
store('t7','value_R_?','t8').
store('t7','option_R_?','form').
store('config_R_0','pwdProtect_R_?','t7').
store('t9','value_R_?','').
store('t9','option_R_?','form').
store('config_R_0','pwd_R_?','t9').
assign('t11','1').
store('t10','value_R_?','t11').
store('t10','option_R_?','checkable').
store('config_R_0','advancedProtection_R_?','t10').
store('t12','value_R_?','[{"tab":-1,"url":"chrome://newtab"}]').
store('t12','option_R_?','json').
store('config_R_0','safePage_R_?','t12').
assign('t14','1').
store('t13','value_R_?','t14').
store('t13','option_R_?','hidden').
store('config_R_0','currentTab_R_?','t13').
assign('t16','1').
store('t15','value_R_?','t16').
store('t15','option_R_?','form').
store('config_R_0','hideIcon_R_?','t15').
assign('config_R_0','__objectInit__').
ptsTo('urlIndex_R_15','d_urlIndex_R_15').
heapPtsTo('d_urlIndex_R_15','prototype','p_urlIndex_R_15').
prototype('p_urlIndex_R_15','h_FP').
methodRet('d_urlIndex_R_15','urlIndex_R_15').
formal('d_urlIndex_R_15','1','a_R_15').
formal('d_urlIndex_R_15','2','b_R_15').
ptsTo('JSONO_R_16','d_JSONO_R_16').
heapPtsTo('d_JSONO_R_16','prototype','p_JSONO_R_16').
prototype('p_JSONO_R_16','h_FP').
methodRet('d_JSONO_R_16','JSONO_R_16').
formal('d_JSONO_R_16','1','a_R_16').
ptsTo('t17','n_JSONO_R_?_0').
prototype('n_JSONO_R_?_0', 'p_JSONO_R_?').
assign('safePages_R_0','t17').
assign('CONFIG_VERSION_R_?','0.13').
ptsTo('configure_R_24','d_configure_R_24').
heapPtsTo('d_configure_R_24','prototype','p_configure_R_24').
prototype('p_configure_R_24','h_FP').
methodRet('d_configure_R_24','configure_R_24').
load('t19','localStorage_R_?','configured').
load('t20','localStorage_R_?','configured').
assign('None','t23').
assign('t18','t24').
ptsTo('t25','n_JSONO_R_?_1').
prototype('n_JSONO_R_?_1', 'p_JSONO_R_?').
actual('2','1','safePage').
callRet('2','safePage').
assign('safePages_R_0','t25').
load('t27','chrome','browserAction').
load('t28','t27','setBadgeBackgroundColor').
store('t30','0','78').
store('t30','1','195').
store('t30','2','70').
store('t30','3','128').
store('t29','color_R_?','t30').
actual('2','1','t29').
callRet('2','t29').
assign('t26','t31').
ptsTo('getStatus_R_25','d_getStatus_R_25').
heapPtsTo('d_getStatus_R_25','prototype','p_getStatus_R_25').
prototype('p_getStatus_R_25','h_FP').
methodRet('d_getStatus_R_25','getStatus_R_25').
formal('d_getStatus_R_25','1','a_R_25').
actual('3','1','lambda_R_28').
callRet('3','lambda_R_28').
assign('t32','t33').
ptsTo('lambda_R_28','d_lambda_R_28').
heapPtsTo('d_lambda_R_28','prototype','p_lambda_R_28').
prototype('p_lambda_R_28','h_FP').
methodRet('d_lambda_R_28','lambda_R_28').
ptsTo('action_R_30','d_action_R_30').
heapPtsTo('d_action_R_30','prototype','p_action_R_30').
prototype('p_action_R_30','h_FP').
methodRet('d_action_R_30','action_R_30').
load('t35','chrome','browserAction').
load('t36','t35','onClicked').
load('t37','t36','addListener').
actual('4','1','lambda_R_31').
callRet('4','lambda_R_31').
assign('t34','t38').
ptsTo('lambda_R_31','d_lambda_R_31').
heapPtsTo('d_lambda_R_31','prototype','p_lambda_R_31').
prototype('p_lambda_R_31','h_FP').
methodRet('d_lambda_R_31','lambda_R_31').
load('t40','chrome','tabs').
load('t41','t40','onCreated').
load('t42','t41','addListener').
actual('5','1','lambda_R_32').
callRet('5','lambda_R_32').
assign('t39','t43').
ptsTo('lambda_R_32','d_lambda_R_32').
heapPtsTo('d_lambda_R_32','prototype','p_lambda_R_32').
prototype('p_lambda_R_32','h_FP').
methodRet('d_lambda_R_32','lambda_R_32').
load('t45','chrome','tabs').
load('t46','t45','onRemoved').
load('t47','t46','addListener').
actual('6','1','lambda_R_33').
callRet('6','lambda_R_33').
assign('t44','t48').
ptsTo('lambda_R_33','d_lambda_R_33').
heapPtsTo('d_lambda_R_33','prototype','p_lambda_R_33').
prototype('p_lambda_R_33','h_FP').
methodRet('d_lambda_R_33','lambda_R_33').
load('t50','chrome','tabs').
load('t51','t50','onAttached').
load('t52','t51','addListener').
actual('7','1','lambda_R_34').
callRet('7','lambda_R_34').
assign('t49','t53').
ptsTo('lambda_R_34','d_lambda_R_34').
heapPtsTo('d_lambda_R_34','prototype','p_lambda_R_34').
prototype('p_lambda_R_34','h_FP').
methodRet('d_lambda_R_34','lambda_R_34').
load('t55','chrome','bookmarks').
load('t56','t55','onRemoved').
load('t57','t56','addListener').
actual('8','1','lambda_R_35').
callRet('8','lambda_R_35').
assign('t54','t58').
ptsTo('lambda_R_35','d_lambda_R_35').
heapPtsTo('d_lambda_R_35','prototype','p_lambda_R_35').
prototype('p_lambda_R_35','h_FP').
methodRet('d_lambda_R_35','lambda_R_35').
load('t60','chrome','tabs').
load('t61','t60','onUpdated').
load('t62','t61','addListener').
actual('9','1','lambda_R_36').
callRet('9','lambda_R_36').
assign('t59','t63').
ptsTo('lambda_R_36','d_lambda_R_36').
heapPtsTo('d_lambda_R_36','prototype','p_lambda_R_36').
prototype('p_lambda_R_36','h_FP').
methodRet('d_lambda_R_36','lambda_R_36').
load('t65','chrome','windows').
load('t66','t65','onFocusChanged').
load('t67','t66','addListener').
actual('10','1','lambda_R_37').
callRet('10','lambda_R_37').
assign('t64','t68').
ptsTo('lambda_R_37','d_lambda_R_37').
heapPtsTo('d_lambda_R_37','prototype','p_lambda_R_37').
prototype('p_lambda_R_37','h_FP').
methodRet('d_lambda_R_37','lambda_R_37').
load('t70','chrome','extension').
load('t71','t70','onRequest').
load('t72','t71','addListener').
actual('11','1','lambda_R_38').
callRet('11','lambda_R_38').
assign('t69','t73').
ptsTo('lambda_R_38','d_lambda_R_38').
heapPtsTo('d_lambda_R_38','prototype','p_lambda_R_38').
prototype('p_lambda_R_38','h_FP').
methodRet('d_lambda_R_38','lambda_R_38').
formal('d_lambda_R_38','1','a_R_38').
formal('d_lambda_R_38','2','b_R_38').
formal('d_lambda_R_38','3','c_R_38').
load('t74','document','title').
load('t75','chrome','i18n').
load('t76','t75','getMessage').
actual('12','1','optTitleTag').
callRet('12','optTitleTag').
store('document','title','t77').
assign('t78','t79').
ptsTo('lambda_R_39','d_lambda_R_39').
heapPtsTo('d_lambda_R_39','prototype','p_lambda_R_39').
prototype('p_lambda_R_39','h_FP').
methodRet('d_lambda_R_39','lambda_R_39').
actual('14','1','optKeyALT').
callRet('14','optKeyALT').
assign('t80','t81').
actual('15','1','optKeySHIFT').
callRet('15','optKeySHIFT').
actual('16','1','lambda_R_41').
callRet('16','lambda_R_41').
assign('t82','t85').
ptsTo('lambda_R_41','d_lambda_R_41').
heapPtsTo('d_lambda_R_41','prototype','p_lambda_R_41').
prototype('p_lambda_R_41','h_FP').
methodRet('d_lambda_R_41','lambda_R_41').
actual('18','1','optKeyESC').
callRet('18','optKeyESC').
assign('t86','t87').
actual('19','1','optKeyTAB').
callRet('19','optKeyTAB').
assign('t88','t89').
actual('20','1','optPwdProtectTitle').
callRet('20','optPwdProtectTitle').
actual('21','1','lambda_R_43').
callRet('21','lambda_R_43').
assign('t90','t93').
ptsTo('lambda_R_43','d_lambda_R_43').
heapPtsTo('d_lambda_R_43','prototype','p_lambda_R_43').
prototype('p_lambda_R_43','h_FP').
methodRet('d_lambda_R_43','lambda_R_43').
actual('23','1','optYesNo').
callRet('23','optYesNo').
assign('t94','t95').
actual('24','1','optPwdProtectDescr').
callRet('24','optPwdProtectDescr').
actual('25','1','lambda_R_45').
callRet('25','lambda_R_45').
assign('t96','t99').
ptsTo('lambda_R_45','d_lambda_R_45').
heapPtsTo('d_lambda_R_45','prototype','p_lambda_R_45').
prototype('p_lambda_R_45','h_FP').
methodRet('d_lambda_R_45','lambda_R_45').
actual('27','1','optTitle').
callRet('27','optTitle').
assign('t100','t101').
actual('28','1','optSave').
callRet('28','optSave').
actual('29','1','lambda_R_47').
callRet('29','lambda_R_47').
assign('t102','t105').
ptsTo('lambda_R_47','d_lambda_R_47').
heapPtsTo('d_lambda_R_47','prototype','p_lambda_R_47').
prototype('p_lambda_R_47','h_FP').
methodRet('d_lambda_R_47','lambda_R_47').
actual('31','1','optAdvancedProtection').
callRet('31','optAdvancedProtection').
assign('t106','t107').
actual('32','1','optSafePageTitle').
callRet('32','optSafePageTitle').
assign('t108','t109').
actual('33','1','optSafePageWarningNoPage').
callRet('33','optSafePageWarningNoPage').
actual('34','1','lambda_R_49').
callRet('34','lambda_R_49').
assign('t110','t113').
ptsTo('lambda_R_49','d_lambda_R_49').
heapPtsTo('d_lambda_R_49','prototype','p_lambda_R_49').
prototype('p_lambda_R_49','h_FP').
methodRet('d_lambda_R_49','lambda_R_49').
actual('36','1','optSafePageAddDescr').
callRet('36','optSafePageAddDescr').
assign('t114','t115').
actual('37','1','optSafePageDescr').
callRet('37','optSafePageDescr').
actual('38','1','lambda_R_51').
callRet('38','lambda_R_51').
assign('t116','t119').
ptsTo('lambda_R_51','d_lambda_R_51').
heapPtsTo('d_lambda_R_51','prototype','p_lambda_R_51').
prototype('p_lambda_R_51','h_FP').
methodRet('d_lambda_R_51','lambda_R_51').
actual('40','1','optYesNo').
callRet('40','optYesNo').
assign('t120','t121').
actual('41','1','optShortcutTitle').
callRet('41','optShortcutTitle').
assign('t122','t123').
actual('42','1','optHideIconDescr').
callRet('42','optHideIconDescr').
actual('43','1','lambda_R_53').
callRet('43','lambda_R_53').
assign('t124','t127').
ptsTo('lambda_R_53','d_lambda_R_53').
heapPtsTo('d_lambda_R_53','prototype','p_lambda_R_53').
prototype('p_lambda_R_53','h_FP').
methodRet('d_lambda_R_53','lambda_R_53').
actual('45','1','optReset').
callRet('45','optReset').
actual('46','1','lambda_R_55').
callRet('46','lambda_R_55').
assign('t128','t131').
ptsTo('lambda_R_55','d_lambda_R_55').
heapPtsTo('d_lambda_R_55','prototype','p_lambda_R_55').
prototype('p_lambda_R_55','h_FP').
methodRet('d_lambda_R_55','lambda_R_55').
actual('48','1','optYesNo').
callRet('48','optYesNo').
assign('t132','t133').
actual('49','1','optShortcutDescr').
callRet('49','optShortcutDescr').
actual('50','1','lambda_R_57').
callRet('50','lambda_R_57').
assign('t134','t137').
ptsTo('lambda_R_57','d_lambda_R_57').
heapPtsTo('d_lambda_R_57','prototype','p_lambda_R_57').
prototype('p_lambda_R_57','h_FP').
methodRet('d_lambda_R_57','lambda_R_57').
actual('52','1','optNone').
callRet('52','optNone').
assign('t138','t139').
actual('53','1','optKeyCTRL').
callRet('53','optKeyCTRL').
assign('t140','t141').
ptsTo('check_R_59','d_check_R_59').
heapPtsTo('d_check_R_59','prototype','p_check_R_59').
prototype('p_check_R_59','h_FP').
methodRet('d_check_R_59','check_R_59').
formal('d_check_R_59','1','element_R_59').
assign('t142','t143').
ptsTo('lambda_R_60','d_lambda_R_60').
heapPtsTo('d_lambda_R_60','prototype','p_lambda_R_60').
prototype('p_lambda_R_60','h_FP').
methodRet('d_lambda_R_60','lambda_R_60').
load('t145','document','write_R_?').
load('t146','chrome','i18n').
load('t147','t146','getMessage').
actual('55','1','popTitle').
callRet('55','popTitle').
actual('56','1','t148').
callRet('56','t148').
assign('t144','t149').
assign('t150','t151').
ptsTo('lambda_R_62','d_lambda_R_62').
heapPtsTo('d_lambda_R_62','prototype','p_lambda_R_62').
prototype('p_lambda_R_62','h_FP').
methodRet('d_lambda_R_62','lambda_R_62').
load('t152','chrome','extension').
load('t153','t152','getBackgroundPage').
assign('bgPage_R_0','t154').
load('t155','bgPage_R_0','config').
assign('config_R_0','t155').
load('t156','bgPage_R_0','safePages').
assign('safePages_R_0','t156').
assign('shortcut_R_?','0').
assign('sc1_R_?','0').
assign('sc2_R_?','0').
ptsTo('init_R_64','d_init_R_64').
heapPtsTo('d_init_R_64','prototype','p_init_R_64').
prototype('p_init_R_64','h_FP').
methodRet('d_init_R_64','init_R_64').
ptsTo('i18n_R_65','d_i18n_R_65').
heapPtsTo('d_i18n_R_65','prototype','p_i18n_R_65').
prototype('p_i18n_R_65','h_FP').
methodRet('d_i18n_R_65','i18n_R_65').
formal('d_i18n_R_65','1','a_R_65').
ptsTo('change_R_66','d_change_R_66').
heapPtsTo('d_change_R_66','prototype','p_change_R_66').
prototype('p_change_R_66','h_FP').
methodRet('d_change_R_66','change_R_66').
formal('d_change_R_66','1','a_R_66').
ptsTo('toggle_R_67','d_toggle_R_67').
heapPtsTo('d_toggle_R_67','prototype','p_toggle_R_67').
prototype('p_toggle_R_67','h_FP').
methodRet('d_toggle_R_67','toggle_R_67').
formal('d_toggle_R_67','1','a_R_67').
formal('d_toggle_R_67','2','c_R_67').
ptsTo('checkPage_R_68','d_checkPage_R_68').
heapPtsTo('d_checkPage_R_68','prototype','p_checkPage_R_68').
prototype('p_checkPage_R_68','h_FP').
methodRet('d_checkPage_R_68','checkPage_R_68').
formal('d_checkPage_R_68','1','a_R_68').
ptsTo('buildSafePages_R_69','d_buildSafePages_R_69').
heapPtsTo('d_buildSafePages_R_69','prototype','p_buildSafePages_R_69').
prototype('p_buildSafePages_R_69','h_FP').
methodRet('d_buildSafePages_R_69','buildSafePages_R_69').
ptsTo('reset_R_71','d_reset_R_71').
heapPtsTo('d_reset_R_71','prototype','p_reset_R_71').
prototype('p_reset_R_71','h_FP').
methodRet('d_reset_R_71','reset_R_71').
ptsTo('openAdvancedProtectionDialogue_R_72','d_openAdvancedProtectionDialogue_R_72').
heapPtsTo('d_openAdvancedProtectionDialogue_R_72','prototype','p_openAdvancedProtectionDialogue_R_72').
prototype('p_openAdvancedProtectionDialogue_R_72','h_FP').
methodRet('d_openAdvancedProtectionDialogue_R_72','openAdvancedProtectionDialogue_R_72').
formal('d_openAdvancedProtectionDialogue_R_72','1','a_R_72').
ptsTo('handleDrop_R_77','d_handleDrop_R_77').
heapPtsTo('d_handleDrop_R_77','prototype','p_handleDrop_R_77').
prototype('p_handleDrop_R_77','h_FP').
methodRet('d_handleDrop_R_77','handleDrop_R_77').
formal('d_handleDrop_R_77','1','a_R_77').
load('t158','chrome','extension').
load('t159','t158','sendRequest').
store('t160','action_R_?','getData').
actual('59','1','t160').
callRet('59','t160').
actual('59','2','lambda_R_80').
callRet('59','lambda_R_80').
assign('t157','t161').
ptsTo('lambda_R_80','d_lambda_R_80').
heapPtsTo('d_lambda_R_80','prototype','p_lambda_R_80').
prototype('p_lambda_R_80','h_FP').
methodRet('d_lambda_R_80','lambda_R_80').
formal('d_lambda_R_80','1','a_R_80').
assign('hexcase_R_0','0').
assign('b64pad_R_0','').
assign('chrsz_R_0','8').
ptsTo('hex_sha1_R_83','d_hex_sha1_R_83').
heapPtsTo('d_hex_sha1_R_83','prototype','p_hex_sha1_R_83').
prototype('p_hex_sha1_R_83','h_FP').
methodRet('d_hex_sha1_R_83','hex_sha1_R_83').
formal('d_hex_sha1_R_83','1','s_R_83').
ptsTo('b64_sha1_R_84','d_b64_sha1_R_84').
heapPtsTo('d_b64_sha1_R_84','prototype','p_b64_sha1_R_84').
prototype('p_b64_sha1_R_84','h_FP').
methodRet('d_b64_sha1_R_84','b64_sha1_R_84').
formal('d_b64_sha1_R_84','1','s_R_84').
ptsTo('str_sha1_R_85','d_str_sha1_R_85').
heapPtsTo('d_str_sha1_R_85','prototype','p_str_sha1_R_85').
prototype('p_str_sha1_R_85','h_FP').
methodRet('d_str_sha1_R_85','str_sha1_R_85').
formal('d_str_sha1_R_85','1','s_R_85').
ptsTo('hex_hmac_sha1_R_86','d_hex_hmac_sha1_R_86').
heapPtsTo('d_hex_hmac_sha1_R_86','prototype','p_hex_hmac_sha1_R_86').
prototype('p_hex_hmac_sha1_R_86','h_FP').
methodRet('d_hex_hmac_sha1_R_86','hex_hmac_sha1_R_86').
formal('d_hex_hmac_sha1_R_86','1','key_R_86').
formal('d_hex_hmac_sha1_R_86','2','data_R_86').
ptsTo('b64_hmac_sha1_R_87','d_b64_hmac_sha1_R_87').
heapPtsTo('d_b64_hmac_sha1_R_87','prototype','p_b64_hmac_sha1_R_87').
prototype('p_b64_hmac_sha1_R_87','h_FP').
methodRet('d_b64_hmac_sha1_R_87','b64_hmac_sha1_R_87').
formal('d_b64_hmac_sha1_R_87','1','key_R_87').
formal('d_b64_hmac_sha1_R_87','2','data_R_87').
ptsTo('str_hmac_sha1_R_88','d_str_hmac_sha1_R_88').
heapPtsTo('d_str_hmac_sha1_R_88','prototype','p_str_hmac_sha1_R_88').
prototype('p_str_hmac_sha1_R_88','h_FP').
methodRet('d_str_hmac_sha1_R_88','str_hmac_sha1_R_88').
formal('d_str_hmac_sha1_R_88','1','key_R_88').
formal('d_str_hmac_sha1_R_88','2','data_R_88').
ptsTo('sha1_vm_test_R_89','d_sha1_vm_test_R_89').
heapPtsTo('d_sha1_vm_test_R_89','prototype','p_sha1_vm_test_R_89').
prototype('p_sha1_vm_test_R_89','h_FP').
methodRet('d_sha1_vm_test_R_89','sha1_vm_test_R_89').
ptsTo('core_sha1_R_90','d_core_sha1_R_90').
heapPtsTo('d_core_sha1_R_90','prototype','p_core_sha1_R_90').
prototype('p_core_sha1_R_90','h_FP').
methodRet('d_core_sha1_R_90','core_sha1_R_90').
formal('d_core_sha1_R_90','1','x_R_90').
formal('d_core_sha1_R_90','2','len_R_90').
ptsTo('sha1_ft_R_91','d_sha1_ft_R_91').
heapPtsTo('d_sha1_ft_R_91','prototype','p_sha1_ft_R_91').
prototype('p_sha1_ft_R_91','h_FP').
methodRet('d_sha1_ft_R_91','sha1_ft_R_91').
formal('d_sha1_ft_R_91','1','t_R_91').
formal('d_sha1_ft_R_91','2','b_R_91').
formal('d_sha1_ft_R_91','3','c_R_91').
formal('d_sha1_ft_R_91','4','d_R_91').
ptsTo('sha1_kt_R_92','d_sha1_kt_R_92').
heapPtsTo('d_sha1_kt_R_92','prototype','p_sha1_kt_R_92').
prototype('p_sha1_kt_R_92','h_FP').
methodRet('d_sha1_kt_R_92','sha1_kt_R_92').
formal('d_sha1_kt_R_92','1','t_R_92').
ptsTo('core_hmac_sha1_R_93','d_core_hmac_sha1_R_93').
heapPtsTo('d_core_hmac_sha1_R_93','prototype','p_core_hmac_sha1_R_93').
prototype('p_core_hmac_sha1_R_93','h_FP').
methodRet('d_core_hmac_sha1_R_93','core_hmac_sha1_R_93').
formal('d_core_hmac_sha1_R_93','1','key_R_93').
formal('d_core_hmac_sha1_R_93','2','data_R_93').
ptsTo('safe_add_R_94','d_safe_add_R_94').
heapPtsTo('d_safe_add_R_94','prototype','p_safe_add_R_94').
prototype('p_safe_add_R_94','h_FP').
methodRet('d_safe_add_R_94','safe_add_R_94').
formal('d_safe_add_R_94','1','x_R_94').
formal('d_safe_add_R_94','2','y_R_94').
ptsTo('rol_R_95','d_rol_R_95').
heapPtsTo('d_rol_R_95','prototype','p_rol_R_95').
prototype('p_rol_R_95','h_FP').
methodRet('d_rol_R_95','rol_R_95').
formal('d_rol_R_95','1','num_R_95').
formal('d_rol_R_95','2','cnt_R_95').
ptsTo('str2binb_R_96','d_str2binb_R_96').
heapPtsTo('d_str2binb_R_96','prototype','p_str2binb_R_96').
prototype('p_str2binb_R_96','h_FP').
methodRet('d_str2binb_R_96','str2binb_R_96').
formal('d_str2binb_R_96','1','str_R_96').
ptsTo('binb2str_R_97','d_binb2str_R_97').
heapPtsTo('d_binb2str_R_97','prototype','p_binb2str_R_97').
prototype('p_binb2str_R_97','h_FP').
methodRet('d_binb2str_R_97','binb2str_R_97').
formal('d_binb2str_R_97','1','bin_R_97').
ptsTo('binb2hex_R_98','d_binb2hex_R_98').
heapPtsTo('d_binb2hex_R_98','prototype','p_binb2hex_R_98').
prototype('p_binb2hex_R_98','h_FP').
methodRet('d_binb2hex_R_98','binb2hex_R_98').
formal('d_binb2hex_R_98','1','binarray_R_98').
ptsTo('binb2b64_R_99','d_binb2b64_R_99').
heapPtsTo('d_binb2b64_R_99','prototype','p_binb2b64_R_99').
prototype('p_binb2b64_R_99','h_FP').
methodRet('d_binb2b64_R_99','binb2b64_R_99').
formal('d_binb2b64_R_99','1','binarray_R_99').
load('t162','this','dom').
store('this','dom','dom_R_1').
load('t163','this','set').
store('this','set','null').
load('t164','this','validation').
store('this','validation','t164').
load('t165','this','init').
store('this','init','lambda_R_2').
ptsTo('lambda_R_2','d_lambda_R_2').
heapPtsTo('d_lambda_R_2','prototype','p_lambda_R_2').
prototype('p_lambda_R_2','h_FP').
methodRet('d_lambda_R_2','lambda_R_2').
load('t166','this','destroy').
store('this','destroy','lambda_R_3').
ptsTo('lambda_R_3','d_lambda_R_3').
heapPtsTo('d_lambda_R_3','prototype','p_lambda_R_3').
prototype('p_lambda_R_3','h_FP').
methodRet('d_lambda_R_3','lambda_R_3').
load('t167','this','addText').
store('this','addText','lambda_R_4').
ptsTo('lambda_R_4','d_lambda_R_4').
heapPtsTo('d_lambda_R_4','prototype','p_lambda_R_4').
prototype('p_lambda_R_4','h_FP').
methodRet('d_lambda_R_4','lambda_R_4').
formal('d_lambda_R_4','1','text_R_4').
load('t168','this','addField').
store('this','addField','lambda_R_5').
ptsTo('lambda_R_5','d_lambda_R_5').
heapPtsTo('d_lambda_R_5','prototype','p_lambda_R_5').
prototype('p_lambda_R_5','h_FP').
methodRet('d_lambda_R_5','lambda_R_5').
formal('d_lambda_R_5','1','type_R_5').
formal('d_lambda_R_5','2','name_R_5').
formal('d_lambda_R_5','3','value_R_5').
formal('d_lambda_R_5','4','attr_R_5').
formal('d_lambda_R_5','5','validation_R_5').
load('t169','this','setSubmit').
store('this','setSubmit','lambda_R_6').
ptsTo('lambda_R_6','d_lambda_R_6').
heapPtsTo('d_lambda_R_6','prototype','p_lambda_R_6').
prototype('p_lambda_R_6','h_FP').
methodRet('d_lambda_R_6','lambda_R_6').
load('t171','this','init_R_?').
assign('t170','t172').
load('t173','this','dom').
load('t174','t173','style').
load('t175','t174','display').
store('t174','display','inline').
load('t176','this','set').
load('t177','this','dom').
load('t178','t177','create_R_?').
actual('61','1','fieldset').
callRet('61','fieldset').
store('this','set','t179').
load('t180','this','set').
load('t181','t180','create').
actual('62','1','legend').
callRet('62','legend').
assign('setTitle_R_2','t182').
load('t183','setTitle_R_2','innerHTML').
store('setTitle_R_2','innerHTML','title_R_1').
load('t184','this','dom').
load('t185','t184','style').
load('t186','t185','display').
store('t185','display','none').
load('t187','this','dom').
load('t188','t187','innerHTML').
store('t187','innerHTML','').
assign('field_R_5','__undefined__').
assign('t189','t190').
load('t191','this','set').
load('t192','t191','create_R_?').
actual('63','1','input').
callRet('63','input').
assign('field_R_5','t193').
load('t194','field_R_5','type').
store('field_R_5','type','type_R_5').
load('t195','field_R_5','value').
store('field_R_5','value','value_R_5').
load('t196','field_R_5','i_R_?').
load('t197','attr_R_5','i_R_?').
store('field_R_5','i_R_?','t197').
load('t198','this','set').
load('t199','t198','create').
actual('64','1','select').
callRet('64','select').
assign('field_R_5','t200').
load('t201','field_R_5','create').
actual('65','1','option').
callRet('65','option').
assign('option_R_5','t202').
load('t203','option_R_5','value').
store('option_R_5','value','i_R_?').
load('t204','option_R_5','innerHTML').
load('t205','value_R_5','i_R_?').
store('option_R_5','innerHTML','t205').
load('t206','field_R_5','name').
store('field_R_5','name','name_R_5').
load('t208','this','validation').
load('t209','t208','push_R_?').
store('t210','field_R_5','field_R_5').
store('t210','f_R_?','validation_R_5').
actual('66','1','t210').
callRet('66','t210').
assign('t207','t211').
load('t213','this','set').
load('t214','t213','create_R_?').
actual('67','1','br').
callRet('67','br').
assign('t212','t215').
load('t217','this','set').
load('t218','t217','create').
actual('68','1','br').
callRet('68','br').
assign('t216','t219').
load('t220','this','set').
load('t221','t220','create').
actual('69','1','button').
callRet('69','button').
assign('save_R_6','t222').
load('t223','save_R_6','innerHTML').
store('save_R_6','innerHTML','save').
load('t224','save_R_6','onclick').
store('save_R_6','onclick','lambda_R_7').
ptsTo('lambda_R_7','d_lambda_R_7').
heapPtsTo('d_lambda_R_7','prototype','p_lambda_R_7').
prototype('p_lambda_R_7','h_FP').
methodRet('d_lambda_R_7','lambda_R_7').
load('t225','document','createElement_R_?').
actual('70','1','tag_R_8').
callRet('70','tag_R_8').
assign('e_R_8','t226').
load('t228','this','appendChild_R_?').
actual('71','1','e_R_8').
callRet('71','e_R_8').
assign('t227','t229').
methodRet('d_lambda_R_8','e_R_8').
load('t230','this','index').
store('this','index','index_R_9').
load('t231','this','spElement').
load('t232','document','getElementById_R_?').
actual('72','1','safePages').
callRet('72','safePages').
store('this','spElement','t233').
load('t234','this','element').
load('t235','document','createElement_R_?').
actual('73','1','span').
callRet('73','span').
store('this','element','t236').
load('t237','this','btn_up').
load('t238','document','createElement').
actual('74','1','button').
callRet('74','button').
store('this','btn_up','t239').
load('t240','this','btn_up').
load('t241','t240','className').
store('t240','className','simpleButton').
load('t242','this','btn_up').
load('t243','t242','innerHTML').
store('t242','innerHTML','&#8679;').
load('t244','this','btn_up').
load('t245','t244','SPO').
store('t244','SPO','this').
load('t246','this','btn_up').
load('t247','t246','onclick').
store('t246','onclick','lambda_R_10').
ptsTo('lambda_R_10','d_lambda_R_10').
heapPtsTo('d_lambda_R_10','prototype','p_lambda_R_10').
prototype('p_lambda_R_10','h_FP').
methodRet('d_lambda_R_10','lambda_R_10').
load('t248','this','span').
load('t249','document','createElement').
actual('75','1','span').
callRet('75','span').
store('this','span','t250').
load('t251','this','select').
load('t252','document','createElement').
actual('76','1','select').
callRet('76','select').
store('this','select','t253').
load('t254','this','select').
load('t255','t254','SPO').
store('t254','SPO','this').
load('t256','this','select').
load('t257','t256','onchange').
store('t256','onchange','lambda_R_11').
ptsTo('lambda_R_11','d_lambda_R_11').
heapPtsTo('d_lambda_R_11','prototype','p_lambda_R_11').
prototype('p_lambda_R_11','h_FP').
methodRet('d_lambda_R_11','lambda_R_11').
load('t258','this','opt1').
load('t259','document','createElement').
actual('77','1','option').
callRet('77','option').
store('this','opt1','t260').
load('t261','this','opt1').
load('t262','t261','value').
store('t261','value','newtab').
load('t263','this','opt1').
load('t264','t263','innerHTML').
load('t265','chrome','i18n').
load('t266','t265','getMessage').
actual('78','1','optSafePageOptNewtab').
callRet('78','optSafePageOptNewtab').
store('t263','innerHTML','t267').
load('t268','this','opt2').
load('t269','document','createElement').
actual('79','1','option').
callRet('79','option').
store('this','opt2','t270').
load('t271','this','opt2').
load('t272','t271','value').
store('t271','value','blank').
load('t273','this','opt2').
load('t274','t273','innerHTML').
load('t275','chrome','i18n').
load('t276','t275','getMessage').
actual('80','1','optSafePageOptBlank').
callRet('80','optSafePageOptBlank').
store('t273','innerHTML','t277').
load('t278','this','opt3').
load('t279','document','createElement').
actual('81','1','option').
callRet('81','option').
store('this','opt3','t280').
load('t281','this','opt3').
load('t282','t281','value').
store('t281','value','custom').
load('t283','this','opt3').
load('t284','t283','innerHTML').
load('t285','chrome','i18n').
load('t286','t285','getMessage').
actual('82','1','optSafePageOptCustom').
callRet('82','optSafePageOptCustom').
store('t283','innerHTML','t287').
load('t289','this','select').
load('t290','t289','appendChild_R_?').
load('t291','this','opt1').
actual('83','1','t291').
callRet('83','t291').
assign('t288','t292').
load('t294','this','select').
load('t295','t294','appendChild').
load('t296','this','opt2').
actual('84','1','t296').
callRet('84','t296').
assign('t293','t297').
load('t299','this','select').
load('t300','t299','appendChild').
load('t301','this','opt3').
actual('85','1','t301').
callRet('85','t301').
assign('t298','t302').
load('t303','this','select').
load('t304','t303','value').
load('t305','bgPage_R_0','urlIndex_R_?').
load('t306','safePages_R_0','o').
load('t307','this','index').
load('t308','t306','t307').
load('t309','t308','url').
actual('86','1','t309').
callRet('86','t309').
store('t303','value','t310').
load('t311','this','br').
load('t312','document','createElement').
actual('87','1','br').
callRet('87','br').
store('this','br','t313').
load('t314','this','input').
load('t315','document','createElement').
actual('88','1','input').
callRet('88','input').
store('this','input','t316').
load('t318','this','select').
load('t319','t318','value').
assign('t317','t320').
load('t321','this','input').
load('t322','t321','style').
load('t323','t322','display').
store('t322','display','none').
load('t324','this','input').
load('t325','t324','value').
load('t326','safePages_R_0','o').
load('t327','this','index').
load('t328','t326','t327').
load('t329','t328','url').
store('t324','value','t329').
load('t330','this','input').
load('t331','t330','style').
load('t332','t331','display').
store('t331','display','inline').
load('t333','this','input').
load('t334','t333','SPO').
store('t333','SPO','this').
load('t335','this','input').
load('t336','t335','onkeyup').
store('t335','onkeyup','lambda_R_12').
ptsTo('lambda_R_12','d_lambda_R_12').
heapPtsTo('d_lambda_R_12','prototype','p_lambda_R_12').
prototype('p_lambda_R_12','h_FP').
methodRet('d_lambda_R_12','lambda_R_12').
load('t338','this','span').
load('t339','t338','appendChild').
load('t340','this','select').
actual('89','1','t340').
callRet('89','t340').
assign('t337','t341').
load('t343','this','span').
load('t344','t343','appendChild').
load('t345','this','br').
actual('90','1','t345').
callRet('90','t345').
assign('t342','t346').
load('t348','this','span').
load('t349','t348','appendChild').
load('t350','this','input').
actual('91','1','t350').
callRet('91','t350').
assign('t347','t351').
load('t352','this','btn_remove').
load('t353','document','createElement').
actual('92','1','button').
callRet('92','button').
store('this','btn_remove','t354').
load('t355','this','btn_remove').
load('t356','t355','className').
store('t355','className','simpleButton removeButton').
load('t357','this','btn_remove').
load('t358','t357','innerHTML').
store('t357','innerHTML','x').
load('t359','this','btn_remove').
load('t360','t359','SPO').
store('t359','SPO','this').
load('t361','this','btn_remove').
load('t362','t361','onclick').
store('t361','onclick','lambda_R_13').
ptsTo('lambda_R_13','d_lambda_R_13').
heapPtsTo('d_lambda_R_13','prototype','p_lambda_R_13').
prototype('p_lambda_R_13','h_FP').
methodRet('d_lambda_R_13','lambda_R_13').
load('t363','this','hr').
load('t364','document','createElement').
actual('93','1','hr').
callRet('93','hr').
store('this','hr','t365').
load('t367','this','element').
load('t368','t367','appendChild').
load('t369','this','btn_up').
actual('94','1','t369').
callRet('94','t369').
assign('t366','t370').
load('t372','this','element').
load('t373','t372','appendChild').
load('t374','this','span').
actual('95','1','t374').
callRet('95','t374').
assign('t371','t375').
load('t377','this','element').
load('t378','t377','appendChild').
load('t379','this','btn_remove').
actual('96','1','t379').
callRet('96','t379').
assign('t376','t380').
load('t382','this','element').
load('t383','t382','appendChild').
load('t384','this','hr').
actual('97','1','t384').
callRet('97','t384').
assign('t381','t385').
load('t387','this','spElement').
load('t388','t387','appendChild').
load('t389','this','element').
actual('98','1','t389').
callRet('98','t389').
assign('t386','t390').
load('t391','this','remove').
store('this','remove','lambda_R_14').
ptsTo('lambda_R_14','d_lambda_R_14').
heapPtsTo('d_lambda_R_14','prototype','p_lambda_R_14').
prototype('p_lambda_R_14','h_FP').
methodRet('d_lambda_R_14','lambda_R_14').
load('t393','safePages_R_0','moveUp_R_?').
load('t394','this','SPO').
load('t395','t394','index').
actual('99','1','t395').
callRet('99','t395').
assign('t392','t396').
assign('t397','t398').
load('t400','this','value').
assign('t399','t401').
load('t403','safePages_R_0','updateUrl_R_?').
load('t404','this','SPO').
load('t405','t404','index').
load('t406','bgPage_R_0','urlIndex_R_?').
load('t407','this','SPO').
load('t408','t407','input').
load('t409','t408','value').
actual('101','1','t409').
callRet('101','t409').
actual('102','1','t405').
callRet('102','t405').
actual('102','2','t410').
callRet('102','t410').
assign('t402','t411').
load('t412','this','SPO').
load('t413','t412','input').
load('t414','t413','style').
load('t415','t414','display').
store('t414','display','inline').
load('t417','safePages_R_0','updateUrl').
load('t418','this','SPO').
load('t419','t418','index').
load('t420','this','value').
actual('103','1','t419').
callRet('103','t419').
actual('103','2','t420').
callRet('103','t420').
assign('t416','t421').
load('t422','this','SPO').
load('t423','t422','input').
load('t424','t423','style').
load('t425','t424','display').
store('t424','display','none').
load('t427','this','SPO').
load('t428','t427','select').
load('t429','t428','value').
assign('t426','t430').
load('t432','safePages_R_0','updateUrl_R_?').
load('t433','this','SPO').
load('t434','t433','index').
actual('104','1','this').
callRet('104','this').
actual('105','1','t434').
callRet('105','t434').
actual('105','2','t435').
callRet('105','t435').
actual('105','3','true').
callRet('105','true').
assign('t431','t436').
load('t438','this','SPO').
load('t439','t438','remove_R_?').
assign('t437','t440').
load('t442','safePages_R_0','remove_R_?').
load('t443','this','index').
actual('107','1','t443').
callRet('107','t443').
assign('t441','t444').
assign('t445','t446').
assign('t447','a_R_16').
load('t448','this','index').
store('this','index','a_R_16').
load('t449','this','o').
load('t450','JSON_R_?','parse_R_?').
load('t451','localStorage_R_?','a_R_16').
actual('109','1','t451').
callRet('109','t451').
assign('(deque(["this", "o"]), "t449")','t452').
store('this','o','t449').
load('t453','this','add').
store('this','add','lambda_R_17').
ptsTo('lambda_R_17','d_lambda_R_17').
heapPtsTo('d_lambda_R_17','prototype','p_lambda_R_17').
prototype('p_lambda_R_17','h_FP').
methodRet('d_lambda_R_17','lambda_R_17').
formal('d_lambda_R_17','1','a_R_17').
load('t454','this','moveUp').
store('this','moveUp','lambda_R_18').
ptsTo('lambda_R_18','d_lambda_R_18').
heapPtsTo('d_lambda_R_18','prototype','p_lambda_R_18').
prototype('p_lambda_R_18','h_FP').
methodRet('d_lambda_R_18','lambda_R_18').
formal('d_lambda_R_18','1','a_R_18').
load('t455','this','updateUrl').
store('this','updateUrl','lambda_R_19').
ptsTo('lambda_R_19','d_lambda_R_19').
heapPtsTo('d_lambda_R_19','prototype','p_lambda_R_19').
prototype('p_lambda_R_19','h_FP').
methodRet('d_lambda_R_19','lambda_R_19').
formal('d_lambda_R_19','1','a_R_19').
formal('d_lambda_R_19','2','c_R_19').
formal('d_lambda_R_19','3','d_R_19').
load('t456','this','remove').
store('this','remove','lambda_R_20').
ptsTo('lambda_R_20','d_lambda_R_20').
heapPtsTo('d_lambda_R_20','prototype','p_lambda_R_20').
prototype('p_lambda_R_20','h_FP').
methodRet('d_lambda_R_20','lambda_R_20').
formal('d_lambda_R_20','1','a_R_20').
load('t457','this','save').
store('this','save','lambda_R_21').
ptsTo('lambda_R_21','d_lambda_R_21').
heapPtsTo('d_lambda_R_21','prototype','p_lambda_R_21').
prototype('p_lambda_R_21','h_FP').
methodRet('d_lambda_R_21','lambda_R_21').
load('t458','this','clear').
store('this','clear','lambda_R_22').
ptsTo('lambda_R_22','d_lambda_R_22').
heapPtsTo('d_lambda_R_22','prototype','p_lambda_R_22').
prototype('p_lambda_R_22','h_FP').
methodRet('d_lambda_R_22','lambda_R_22').
load('t460','this','o').
load('t461','t460','push_R_?').
actual('110','1','a_R_17').
callRet('110','a_R_17').
assign('t459','t462').
load('t464','this','save_R_?').
assign('t463','t465').
load('t468','this','o').
load('t469','t468','a_R_18').
assign('temp_R_?','t469').
load('t470','this','o').
load('t471','t470','a_R_18').
load('t472','this','o').
load('t474','t472','t473').
assign('t471','t474').
load('t475','this','o').
load('t477','t475','t476').
assign('t477','temp_R_?').
load('t478','this','save_R_?').
assign('t466','t480').
load('t481','this','o').
load('t482','t481','a_R_19').
load('t483','t482','url').
actual('113','1','c_R_19').
callRet('113','c_R_19').
actual('113','2','a_R_19').
callRet('113','a_R_19').
assign('(deque(["t482", "url"]), "t483")','c_R_19').
store('t482','url','t484').
load('t486','this','save_R_?').
assign('t485','t487').
load('t489','this','o').
load('t490','t489','splice_R_?').
actual('115','1','a_R_20').
callRet('115','a_R_20').
actual('115','2','1').
callRet('115','1').
assign('t488','t491').
load('t493','this','save_R_?').
assign('t492','t494').
load('t495','localStorage_R_?','this').
load('t496','t495','index').
load('t497','JSON_R_?','stringify_R_?').
load('t498','this','o').
actual('117','1','t498').
callRet('117','t498').
store('t495','index','t499').
load('t500','this','o').
load('t501','this','o').
load('t502','t501','filter_R_?').
actual('118','1','lambda_R_23').
callRet('118','lambda_R_23').
store('this','o','t503').
ptsTo('lambda_R_23','d_lambda_R_23').
heapPtsTo('d_lambda_R_23','prototype','p_lambda_R_23').
prototype('p_lambda_R_23','h_FP').
methodRet('d_lambda_R_23','lambda_R_23').
load('t505','this','save_R_?').
assign('t504','t506').
load('t508','localStorage_R_?','i_R_?').
assign('t507','t508').
load('t509','localStorage_R_?','i_R_?').
load('t510','config_R_0','i_R_?').
load('t511','t510','value').
store('localStorage_R_?','i_R_?','t511').
load('t513','localStorage_R_?','configured').
actual('120','1','t513').
callRet('120','t513').
assign('t512','t516').
load('t518','safePages_R_0','index').
assign('t518','safePage').
load('t519','safePages_R_0','add_R_?').
assign('t521','1').
store('t520','tab_R_?','t521').
load('t522','localStorage_R_?','safePage').
store('t520','url_R_?','t522').
actual('121','1','t520').
callRet('121','t520').
assign('t517','t523').
load('t525','localStorage_R_?','shortcutArr').
assign('t526','t525').
assign('t524','t526').
assign('a_R_24','a_R_24').
load('t527','a_R_24','localStorage_R_?').
load('t528','t527','shortcut1').
load('t529','localStorage_R_?','shortcut1').
assign('t530','1').
assign('t532','0').
assign('t533','1').
assign('(deque(["t527", "shortcut1"]), "t528")','t532').
store('t527','shortcut1','t533').
load('t534','a_R_24','localStorage_R_?').
load('t535','t534','shortcut2').
assign('t536','0').
store('t534','shortcut2','t536').
load('t537','localStorage_R_?','shortcutArr').
load('t538','JSON_R_?','stringify_R_?').
actual('122','1','a_R_24').
callRet('122','a_R_24').
store('localStorage_R_?','shortcutArr','t539').
load('t540','localStorage_R_?','configured').
store('localStorage_R_?','configured','CONFIG_VERSION_R_?').
load('t542','chrome','bookmarks').
load('t543','t542','getTree').
actual('123','1','lambda_R_26').
callRet('123','lambda_R_26').
assign('t541','t544').
ptsTo('lambda_R_26','d_lambda_R_26').
heapPtsTo('d_lambda_R_26','prototype','p_lambda_R_26').
prototype('p_lambda_R_26','h_FP').
methodRet('d_lambda_R_26','lambda_R_26').
formal('d_lambda_R_26','1','b_R_26').
load('t545','b_R_26','0').
load('t546','t545','children').
load('t547','t546','1').
load('t548','t547','children').
assign('b_R_26','t548').
assign('t549','t550').
load('t552','b_R_26','i_R_?').
load('t553','t552','title').
load('t554','chrome','i18n').
load('t555','t554','getMessage').
actual('124','1','folderName').
callRet('124','folderName').
assign('t551','t557').
assign('status_R_?','stored').
load('t559','chrome','browserAction').
load('t560','t559','setIcon').
load('t562','localStorage_R_?','hideIcon').
assign('None','image/favicon_hidden.ico').
store('t561','path_R_?','image/favicon_stored.ico').
actual('125','1','t561').
callRet('125','t561').
assign('t558','t564').
load('t566','localStorage_R_?','pwdProtect').
load('t568','chrome','browserAction').
load('t569','t568','setPopup').
store('t570','popup_R_?','popup.htm').
actual('126','1','t570').
callRet('126','t570').
load('t572','chrome','browserAction').
load('t573','t572','setPopup').
store('t574','popup_R_?','').
actual('127','1','t574').
callRet('127','t574').
assign('None','t571').
assign('t565','t575').
assign('t576','t578').
methodRet('d_lambda_R_26','null').
load('t580','chrome','tabs').
load('t581','t580','getAllInWindow').
actual('129','1','0').
callRet('129','0').
actual('129','2','lambda_R_27').
callRet('129','lambda_R_27').
assign('t579','t582').
ptsTo('lambda_R_27','d_lambda_R_27').
heapPtsTo('d_lambda_R_27','prototype','p_lambda_R_27').
prototype('p_lambda_R_27','h_FP').
methodRet('d_lambda_R_27','lambda_R_27').
formal('d_lambda_R_27','1','a_R_27').
assign('t583','t585').
load('t587','chrome','browserAction').
load('t588','t587','setBadgeText').
store('t589','text_R_?','').
actual('131','1','t589').
callRet('131','t589').
assign('t586','t590').
load('t592','chrome','browserAction').
load('t593','t592','setPopup').
store('t594','popup_R_?','').
actual('132','1','t594').
callRet('132','t594').
assign('t591','t595').
load('t597','a_R_27','length').
load('t599','a_R_27','0').
load('t600','t599','url').
load('t601','t600','substr_R_?').
actual('133','1','0').
callRet('133','0').
actual('133','2','9').
callRet('133','9').
assign('status_R_?','panic').
load('t605','chrome','browserAction').
load('t606','t605','setIcon').
store('t607','path_R_?','image/favicon.ico').
actual('134','1','t607').
callRet('134','t607').
assign('status_R_?','empty').
load('t609','chrome','browserAction').
load('t610','t609','setIcon').
store('t611','path_R_?','image/favicon_options.ico').
actual('135','1','t611').
callRet('135','t611').
assign('None','t608').
assign('t596','t612').
load('t615','localStorage_R_?','hideIcon').
load('t618','chrome','bookmarks').
load('t619','t618','getTree').
actual('136','1','lambda_R_29').
callRet('136','lambda_R_29').
assign('t613','t621').
ptsTo('lambda_R_29','d_lambda_R_29').
heapPtsTo('d_lambda_R_29','prototype','p_lambda_R_29').
prototype('p_lambda_R_29','h_FP').
methodRet('d_lambda_R_29','lambda_R_29').
formal('d_lambda_R_29','1','a_R_29').
load('t622','a_R_29','0').
load('t623','t622','children').
load('t624','t623','1').
load('t625','t624','children').
assign('a_R_29','t625').
assign('t626','t627').
load('t629','a_R_29','i_R_?').
load('t630','t629','title').
load('t631','chrome','i18n').
load('t632','t631','getMessage').
actual('137','1','folderName').
callRet('137','folderName').
load('t635','chrome','browserAction').
load('t636','t635','setBadgeText').
load('t638','a_R_29','i_R_?').
load('t639','t638','children').
load('t640','t639','length').
actual('138','1','t642').
callRet('138','t642').
store('t637','text_R_?','t643').
actual('139','1','t637').
callRet('139','t637').
assign('t628','t645').
assign('t646','t647').
assign('t648','t649').
assign('t650','t651').
assign('t652','t653').
assign('t654','t655').
assign('t656','t657').
assign('t658','t659').
assign('t660','t661').
load('t662','document','getElementById_R_?').
actual('148','1','_added_by_transform_0').
callRet('148','_added_by_transform_0').
assign('temp_R_39','t663').
load('t665','temp_R_39','addEventListener_R_?').
actual('149','1','load').
callRet('149','load').
actual('149','2','lambda_R_40').
callRet('149','lambda_R_40').
assign('t664','t666').
ptsTo('lambda_R_40','d_lambda_R_40').
heapPtsTo('d_lambda_R_40','prototype','p_lambda_R_40').
prototype('p_lambda_R_40','h_FP').
methodRet('d_lambda_R_40','lambda_R_40').
formal('d_lambda_R_40','1','event_R_40').
assign('t667','t668').
load('t669','document','getElementById_R_?').
actual('151','1','shortcut2').
callRet('151','shortcut2').
assign('temp_R_41','t670').
load('t672','temp_R_41','addEventListener_R_?').
actual('152','1','change').
callRet('152','change').
actual('152','2','lambda_R_42').
callRet('152','lambda_R_42').
assign('t671','t673').
ptsTo('lambda_R_42','d_lambda_R_42').
heapPtsTo('d_lambda_R_42','prototype','p_lambda_R_42').
prototype('p_lambda_R_42','h_FP').
methodRet('d_lambda_R_42','lambda_R_42').
formal('d_lambda_R_42','1','event_R_42').
load('t674','shortcut_R_?','this').
load('t675','t674','value').
store('t674','value','false').
load('t676','localStorage_R_?','shortcutArr').
load('t677','JSON_R_?','stringify_R_?').
actual('153','1','shortcut_R_?').
callRet('153','shortcut_R_?').
store('localStorage_R_?','shortcutArr','t678').
actual('154','1','this').
callRet('154','this').
assign('t679','t680').
load('t681','document','getElementById_R_?').
actual('155','1','pwdProtect').
callRet('155','pwdProtect').
assign('temp_R_43','t682').
load('t684','temp_R_43','addEventListener_R_?').
actual('156','1','change').
callRet('156','change').
actual('156','2','lambda_R_44').
callRet('156','lambda_R_44').
assign('t683','t685').
ptsTo('lambda_R_44','d_lambda_R_44').
heapPtsTo('d_lambda_R_44','prototype','p_lambda_R_44').
prototype('p_lambda_R_44','h_FP').
methodRet('d_lambda_R_44','lambda_R_44').
formal('d_lambda_R_44','1','event_R_44').
load('t687','localStorage_R_?','advancedProtectionSettings').
load('t688','this','value').
assign('t686','t690').
actual('157','1','this').
callRet('157','this').
assign('t691','t692').
actual('158','1','pwd').
callRet('158','pwd').
actual('158','2','true').
callRet('158','true').
assign('t693','t694').
actual('159','1','pwdProtect').
callRet('159','pwdProtect').
assign('t695','t696').
load('t697','document','getElementById_R_?').
actual('160','1','_added_by_transform_1').
callRet('160','_added_by_transform_1').
assign('temp_R_45','t698').
load('t700','temp_R_45','addEventListener_R_?').
actual('161','1','click').
callRet('161','click').
actual('161','2','lambda_R_46').
callRet('161','lambda_R_46').
assign('t699','t701').
ptsTo('lambda_R_46','d_lambda_R_46').
heapPtsTo('d_lambda_R_46','prototype','p_lambda_R_46').
prototype('p_lambda_R_46','h_FP').
methodRet('d_lambda_R_46','lambda_R_46').
formal('d_lambda_R_46','1','event_R_46').
load('t703','localStorage_R_?','advancedProtectionSettings').
assign('t702','t703').
load('t705','document','getElementById_R_?').
actual('162','1','pwd').
callRet('162','pwd').
actual('163','1','t706').
callRet('163','t706').
assign('t704','t707').
actual('164','1','pwdInput').
callRet('164','pwdInput').
assign('t708','t709').
load('t710','document','getElementById_R_?').
actual('165','1','advancedProtection').
callRet('165','advancedProtection').
assign('temp_R_47','t711').
load('t713','temp_R_47','addEventListener_R_?').
actual('166','1','click').
callRet('166','click').
actual('166','2','lambda_R_48').
callRet('166','lambda_R_48').
assign('t712','t714').
ptsTo('lambda_R_48','d_lambda_R_48').
heapPtsTo('d_lambda_R_48','prototype','p_lambda_R_48').
prototype('p_lambda_R_48','h_FP').
methodRet('d_lambda_R_48','lambda_R_48').
formal('d_lambda_R_48','1','event_R_48').
actual('167','1','advancedProtection').
callRet('167','advancedProtection').
assign('t715','t716').
load('t717','document','getElementById_R_?').
actual('168','1','_added_by_transform_2').
callRet('168','_added_by_transform_2').
assign('temp_R_49','t718').
load('t720','temp_R_49','addEventListener_R_?').
actual('169','1','click').
callRet('169','click').
actual('169','2','lambda_R_50').
callRet('169','lambda_R_50').
assign('t719','t721').
ptsTo('lambda_R_50','d_lambda_R_50').
heapPtsTo('d_lambda_R_50','prototype','p_lambda_R_50').
prototype('p_lambda_R_50','h_FP').
methodRet('d_lambda_R_50','lambda_R_50').
formal('d_lambda_R_50','1','event_R_50').
load('t723','safePages_R_0','add_R_?').
load('t724','JSON_R_?','parse_R_?').
load('t725','config_R_0','safePage').
load('t726','t725','value').
actual('170','1','t726').
callRet('170','t726').
load('t728','t727','0').
actual('171','1','t728').
callRet('171','t728').
assign('t722','t729').
assign('t730','t731').
load('t732','document','getElementById_R_?').
actual('173','1','hideIcon').
callRet('173','hideIcon').
assign('temp_R_51','t733').
load('t735','temp_R_51','addEventListener_R_?').
actual('174','1','change').
callRet('174','change').
actual('174','2','lambda_R_52').
callRet('174','lambda_R_52').
assign('t734','t736').
ptsTo('lambda_R_52','d_lambda_R_52').
heapPtsTo('d_lambda_R_52','prototype','p_lambda_R_52').
prototype('p_lambda_R_52','h_FP').
methodRet('d_lambda_R_52','lambda_R_52').
formal('d_lambda_R_52','1','event_R_52').
actual('175','1','this').
callRet('175','this').
assign('t737','t738').
actual('176','1','pwd').
callRet('176','pwd').
actual('176','2','true').
callRet('176','true').
assign('t739','t740').
load('t741','document','getElementById_R_?').
actual('177','1','_added_by_transform_3').
callRet('177','_added_by_transform_3').
assign('temp_R_53','t742').
load('t744','temp_R_53','addEventListener_R_?').
actual('178','1','click').
callRet('178','click').
actual('178','2','lambda_R_54').
callRet('178','lambda_R_54').
assign('t743','t745').
ptsTo('lambda_R_54','d_lambda_R_54').
heapPtsTo('d_lambda_R_54','prototype','p_lambda_R_54').
prototype('p_lambda_R_54','h_FP').
methodRet('d_lambda_R_54','lambda_R_54').
formal('d_lambda_R_54','1','event_R_54').
assign('t746','t747').
load('t748','document','getElementById_R_?').
actual('180','1','shortcut').
callRet('180','shortcut').
assign('temp_R_55','t749').
load('t751','temp_R_55','addEventListener_R_?').
actual('181','1','change').
callRet('181','change').
actual('181','2','lambda_R_56').
callRet('181','lambda_R_56').
assign('t750','t752').
ptsTo('lambda_R_56','d_lambda_R_56').
heapPtsTo('d_lambda_R_56','prototype','p_lambda_R_56').
prototype('p_lambda_R_56','h_FP').
methodRet('d_lambda_R_56','lambda_R_56').
formal('d_lambda_R_56','1','event_R_56').
actual('182','1','this').
callRet('182','this').
assign('t753','t754').
actual('183','1','shortcut').
callRet('183','shortcut').
actual('183','2','true').
callRet('183','true').
assign('t755','t756').
load('t757','document','getElementById_R_?').
actual('184','1','shortcut1').
callRet('184','shortcut1').
assign('temp_R_57','t758').
load('t760','temp_R_57','addEventListener_R_?').
actual('185','1','change').
callRet('185','change').
actual('185','2','lambda_R_58').
callRet('185','lambda_R_58').
assign('t759','t761').
ptsTo('lambda_R_58','d_lambda_R_58').
heapPtsTo('d_lambda_R_58','prototype','p_lambda_R_58').
prototype('p_lambda_R_58','h_FP').
methodRet('d_lambda_R_58','lambda_R_58').
formal('d_lambda_R_58','1','event_R_58').
load('t762','shortcut_R_?','this').
load('t763','t762','value').
store('t762','value','false').
load('t764','localStorage_R_?','shortcutArr').
load('t765','JSON_R_?','stringify_R_?').
actual('186','1','shortcut_R_?').
callRet('186','shortcut_R_?').
store('localStorage_R_?','shortcutArr','t766').
actual('187','1','this').
callRet('187','this').
assign('t767','t768').
load('t770','element_R_59','value').
load('t771','localStorage_R_?','pwd').
assign('t769','t772').
load('t774','chrome','extension').
load('t775','t774','sendRequest').
store('t776','action_R_?','password').
actual('188','1','t776').
callRet('188','t776').
assign('t773','t777').
load('t779','window','close_R_?').
assign('t778','t780').
load('t781','document','getElementById_R_?').
actual('190','1','_added_by_transform_0').
callRet('190','_added_by_transform_0').
assign('temp_R_60','t782').
load('t784','temp_R_60','addEventListener_R_?').
actual('191','1','load').
callRet('191','load').
actual('191','2','lambda_R_61').
callRet('191','lambda_R_61').
assign('t783','t785').
ptsTo('lambda_R_61','d_lambda_R_61').
heapPtsTo('d_lambda_R_61','prototype','p_lambda_R_61').
prototype('p_lambda_R_61','h_FP').
methodRet('d_lambda_R_61','lambda_R_61').
formal('d_lambda_R_61','1','event_R_61').
load('t787','document','getElementById_R_?').
actual('192','1','pwd').
callRet('192','pwd').
load('t789','t788','focus_R_?').
assign('t786','t790').
load('t791','document','getElementById_R_?').
actual('194','1','pwd').
callRet('194','pwd').
assign('temp_R_62','t792').
load('t794','temp_R_62','addEventListener_R_?').
actual('195','1','keyup').
callRet('195','keyup').
actual('195','2','lambda_R_63').
callRet('195','lambda_R_63').
assign('t793','t795').
ptsTo('lambda_R_63','d_lambda_R_63').
heapPtsTo('d_lambda_R_63','prototype','p_lambda_R_63').
prototype('p_lambda_R_63','h_FP').
methodRet('d_lambda_R_63','lambda_R_63').
formal('d_lambda_R_63','1','event_R_63').
actual('196','1','this').
callRet('196','this').
assign('t796','t797').
load('t798','document','getElementById_R_?').
actual('197','1','i_R_?').
callRet('197','i_R_?').
assign('a_R_64','t799').
assign('t801','1').
actual('198','1','shortcut').
callRet('198','shortcut').
actual('198','2','t801').
callRet('198','t801').
assign('t800','t802').
assign('t804','1').
actual('199','1','pwd').
callRet('199','pwd').
actual('199','2','t804').
callRet('199','t804').
assign('t803','t805').
load('t806','document','getElementById').
actual('200','1','shortcut1').
callRet('200','shortcut1').
assign('sc1_R_?','t807').
load('t808','document','getElementById').
actual('201','1','shortcut2').
callRet('201','shortcut2').
assign('sc2_R_?','t809').
load('t810','JSON_R_?','parse_R_?').
load('t811','localStorage_R_?','shortcutArr').
actual('202','1','t811').
callRet('202','t811').
assign('shortcut_R_?','t812').
load('t813','sc1_R_?','value').
assign('t814','1').
store('sc1_R_?','value','t814').
load('t815','sc2_R_?','value').
assign('t816','1').
store('sc2_R_?','value','t816').
assign('t817','t818').
load('t820','document','write_R_?').
load('t821','chrome','i18n').
load('t822','t821','getMessage').
actual('204','1','a_R_65').
callRet('204','a_R_65').
actual('205','1','t823').
callRet('205','t823').
assign('t819','t824').
load('t825','localStorage_R_?','a_R_66').
load('t826','t825','id').
load('t827','a_R_66','value').
store('t825','id','t827').
assign('t828','t829').
load('t830','document','getElementById_R_?').
actual('207','1','t831').
callRet('207','t831').
assign('element_R_?','t832').
load('t833','a_R_68','value').
assign('val_R_?','t833').
load('t835','val_R_?','search_R_?').
actual('208','1','://').
callRet('208','://').
assign('t837','1').
load('t839','val_R_?','search').
actual('209','1','about:').
callRet('209','about:').
assign('t841','1').
assign('t834','t843').
load('t844','a_R_68','value').
methodRet('d_checkPage_R_68','t845').
load('t846','a_R_68','value').
methodRet('d_checkPage_R_68','t846').
load('t847','document','getElementById_R_?').
load('t848','t847','safePages').
load('t849','t848','innerHTML').
store('t848','innerHTML','').
ptsTo('t850','n_SPO_R_?_2').
prototype('n_SPO_R_?_2', 'p_SPO_R_?').
actual('210','1','i_R_?').
callRet('210','i_R_?').
assign('a_R_69','t850').
assign('t851','t852').
load('t854','a_R_69','btn_up').
load('t855','t854','innerHTML').
assign('t855','').
load('t856','a_R_69','btn_up').
load('t857','t856','style').
load('t858','t857','border').
assign('t858','none').
load('t859','a_R_69','btn_up').
load('t860','t859','style').
load('t861','t860','background').
assign('t861','none').
load('t862','a_R_69','btn_up').
load('t863','t862','style').
load('t864','t863','cursor').
assign('t864','default').
load('t865','a_R_69','btn_up').
load('t866','t865','onblur').
assign('t866','lambda_R_70').
assign('t853','t866').
ptsTo('lambda_R_70','d_lambda_R_70').
heapPtsTo('d_lambda_R_70','prototype','p_lambda_R_70').
prototype('p_lambda_R_70','h_FP').
methodRet('d_lambda_R_70','lambda_R_70').
load('t867','document','getElementById').
actual('210','1','safePageWarning').
callRet('210','safePageWarning').
assign('a_R_69','t868').
load('t870','localStorage_R_?','removeItem_R_?').
actual('211','1','i_R_?').
callRet('211','i_R_?').
assign('t869','t871').
load('t872','localStorage_R_?','configured').
assign('t873','1').
store('localStorage_R_?','configured','t873').
load('t875','bgPage_R_0','configure_R_?').
assign('t874','t876').
assign('t877','t878').
load('t879','document','getElementById_R_?').
actual('214','1','dialogue').
callRet('214','dialogue').
assign('c_R_72','t880').
load('t881','document','getElementById').
actual('215','1','box').
callRet('215','box').
assign('d_R_?','t882').
load('t883','d_R_?','create_R_?').
actual('216','1','b').
callRet('216','b').
assign('b_R_?','t884').
load('t886','d_R_?','create').
actual('217','1','br').
callRet('217','br').
assign('t885','t887').
load('t889','d_R_?','create').
actual('218','1','br').
callRet('218','br').
assign('t888','t890').
load('t891','d_R_?','create').
actual('219','1','div').
callRet('219','div').
assign('e_R_72','t892').
load('t893','e_R_72','id').
store('e_R_72','id','dropzone').
load('t894','e_R_72','innerHTML').
load('t895','chrome','i18n').
load('t896','t895','getMessage').
actual('220','1','optAPPDropzoneText').
callRet('220','optAPPDropzoneText').
store('e_R_72','innerHTML','t897').
load('t898','e_R_72','dataset').
load('t899','t898','drops').
store('t898','drops','0').
load('t900','e_R_72','dataset').
load('t901','t900','id').
store('t900','id','a_R_72').
load('t903','e_R_72','addEventListener_R_?').
assign('t904','1').
actual('221','1','dragenter').
callRet('221','dragenter').
actual('221','2','lambda_R_73').
callRet('221','lambda_R_73').
actual('221','3','t904').
callRet('221','t904').
assign('t902','t905').
ptsTo('lambda_R_73','d_lambda_R_73').
heapPtsTo('d_lambda_R_73','prototype','p_lambda_R_73').
prototype('p_lambda_R_73','h_FP').
methodRet('d_lambda_R_73','lambda_R_73').
formal('d_lambda_R_73','1','a_R_73').
load('t907','e_R_72','addEventListener').
assign('t908','1').
actual('222','1','dragover').
callRet('222','dragover').
actual('222','2','lambda_R_74').
callRet('222','lambda_R_74').
actual('222','3','t908').
callRet('222','t908').
assign('t906','t909').
ptsTo('lambda_R_74','d_lambda_R_74').
heapPtsTo('d_lambda_R_74','prototype','p_lambda_R_74').
prototype('p_lambda_R_74','h_FP').
methodRet('d_lambda_R_74','lambda_R_74').
formal('d_lambda_R_74','1','a_R_74').
load('t911','e_R_72','addEventListener').
assign('t912','1').
actual('223','1','drop').
callRet('223','drop').
actual('223','2','handleDrop_R_?').
callRet('223','handleDrop_R_?').
actual('223','3','t912').
callRet('223','t912').
assign('t910','t913').
load('t915','d_R_?','create').
actual('224','1','br').
callRet('224','br').
assign('t914','t916').
load('t917','d_R_?','create').
actual('225','1','center').
callRet('225','center').
load('t919','t918','create').
actual('226','1','button').
callRet('226','button').
assign('a_R_72','t920').
load('t921','a_R_72','innerHTML').
load('t922','chrome','i18n').
load('t923','t922','getMessage').
actual('227','1','optCancel').
callRet('227','optCancel').
store('a_R_72','innerHTML','t924').
load('t925','a_R_72','onclick').
store('a_R_72','onclick','lambda_R_75').
ptsTo('lambda_R_75','d_lambda_R_75').
heapPtsTo('d_lambda_R_75','prototype','p_lambda_R_75').
prototype('p_lambda_R_75','h_FP').
methodRet('d_lambda_R_75','lambda_R_75').
load('t927','d_R_?','create').
actual('228','1','br').
callRet('228','br').
assign('t926','t928').
load('t929','d_R_?','create').
actual('229','1','div').
callRet('229','div').
assign('a_R_72','t930').
load('t931','a_R_72','className').
store('a_R_72','className','small').
load('t933','localStorage_R_?','advancedProtectionSettings').
load('t934','b_R_?','innerHTML').
load('t935','chrome','i18n').
load('t936','t935','getMessage').
actual('230','1','optAPPDialogueTitle').
callRet('230','optAPPDialogueTitle').
assign('t934','t937').
load('t938','a_R_72','innerHTML').
load('t939','chrome','i18n').
load('t940','t939','getMessage').
actual('231','1','optAPPManual').
callRet('231','optAPPManual').
assign('t938','t941').
load('t942','b_R_?','innerHTML').
load('t943','chrome','i18n').
load('t944','t943','getMessage').
actual('232','1','optAPPSetupDialogueTitle').
callRet('232','optAPPSetupDialogueTitle').
assign('t942','t945').
load('t946','a_R_72','innerHTML').
load('t947','chrome','i18n').
load('t948','t947','getMessage').
actual('233','1','optAPPSetupManual').
callRet('233','optAPPSetupManual').
assign('t946','t949').
load('t950','d_R_?','create').
actual('234','1','br').
callRet('234','br').
load('t952','d_R_?','create').
actual('235','1','br').
callRet('235','br').
load('t954','d_R_?','create').
actual('236','1','div').
callRet('236','div').
assign('b_R_?','t955').
load('t956','b_R_?','className').
assign('t956','warning').
load('t957','b_R_?','innerHTML').
load('t958','chrome','i18n').
load('t959','t958','getMessage').
actual('237','1','optAPPSetupWarning').
callRet('237','optAPPSetupWarning').
assign('t957','t960').
assign('None','t938').
assign('t932','t957').
load('t961','a_R_72','create').
actual('238','1','button').
callRet('238','button').
assign('b_R_?','t962').
load('t963','b_R_?','onclick').
store('b_R_?','onclick','lambda_R_76').
ptsTo('lambda_R_76','d_lambda_R_76').
heapPtsTo('d_lambda_R_76','prototype','p_lambda_R_76').
prototype('p_lambda_R_76','h_FP').
methodRet('d_lambda_R_76','lambda_R_76').
load('t964','b_R_?','innerHTML').
store('b_R_?','innerHTML','?').
load('t965','c_R_72','style').
load('t966','t965','display').
store('t965','display','inline').
load('t968','a_R_73','stopPropagation_R_?').
assign('t967','t969').
load('t971','a_R_73','preventDefault_R_?').
assign('t970','t972').
load('t974','a_R_74','stopPropagation_R_?').
assign('t973','t975').
load('t977','a_R_74','preventDefault_R_?').
assign('t976','t978').
load('t979','a_R_74','dataTransfer').
load('t980','t979','dropEffect').
store('t979','dropEffect','copy').
assign('t981','t982').
load('t983','c_R_72','style').
load('t984','t983','display').
store('t983','display','none').
load('t985','d_R_?','innerHTML').
store('d_R_?','innerHTML','').
load('t987','chrome','tabs').
load('t988','t987','create').
store('t989','url_R_?','http://www.youtube.com/watch?v=eVEthh5pZcY').
actual('244','1','t989').
callRet('244','t989').
assign('t986','t990').
load('t992','a_R_77','stopPropagation_R_?').
assign('t991','t993').
load('t995','a_R_77','preventDefault_R_?').
assign('t994','t996').
load('t997','a_R_77','dataTransfer').
load('t998','t997','getData_R_?').
actual('247','1','Text').
callRet('247','Text').
assign('c_R_77','t999').
actual('248','1','12').
callRet('248','12').
actual('248','2','c_R_77').
callRet('248','c_R_77').
assign('d_R_?','t1000').
load('t1001','a_R_77','srcElement').
assign('b_R_?','t1001').
load('t1003','b_R_?','classList').
load('t1004','t1003','add_R_?').
actual('249','1','dropped').
callRet('249','dropped').
assign('t1002','t1005').
load('t1006','b_R_?','innerHTML').
store('b_R_?','innerHTML','c_R_77').
load('t1008','localStorage_R_?','advancedProtectionSettings').
assign('t1007','t1008').
load('t1010','b_R_?','dataset').
load('t1011','t1010','drops').
load('t1013','b_R_?','parentNode').
load('t1014','t1013','getElementsByTagName_R_?').
actual('250','1','center').
callRet('250','center').
load('t1016','t1015','0').
load('t1017','t1016','create_R_?').
actual('251','1','button').
callRet('251','button').
assign('a_R_77','t1018').
load('t1019','a_R_77','innerHTML').
load('t1020','chrome','i18n').
load('t1021','t1020','getMessage').
actual('252','1','optSave').
callRet('252','optSave').
assign('t1019','t1022').
load('t1023','a_R_77','onclick').
assign('t1023','lambda_R_78').
load('t1024','b_R_?','parentNode').
load('t1025','t1024','getElementsByTagName').
actual('253','1','center').
callRet('253','center').
load('t1027','t1026','0').
load('t1028','t1027','getElementsByTagName').
actual('254','1','button').
callRet('254','button').
load('t1030','t1029','1').
assign('a_R_77','t1030').
assign('None','t1023').
load('t1031','a_R_77','dataset').
load('t1032','t1031','key').
assign('t1032','d_R_?').
assign('t1009','t1032').
ptsTo('lambda_R_78','d_lambda_R_78').
heapPtsTo('d_lambda_R_78','prototype','p_lambda_R_78').
prototype('p_lambda_R_78','h_FP').
methodRet('d_lambda_R_78','lambda_R_78').
formal('d_lambda_R_78','1','a_R_78').
load('t1034','b_R_?','parentNode').
load('t1035','t1034','getElementsByTagName').
actual('255','1','center').
callRet('255','center').
load('t1037','t1036','0').
load('t1038','t1037','getElementsByTagName').
actual('256','1','button').
callRet('256','button').
load('t1040','t1039','1').
assign('c_R_77','t1040').
load('t1041','JSON_R_?','parse_R_?').
load('t1042','localStorage_R_?','advancedProtectionSettings').
actual('257','1','t1042').
callRet('257','t1042').
load('t1044','t1043','key').
assign('t1033','t1045').
load('t1047','b_R_?','style').
load('t1048','t1047','backgroundColor').
assign('t1048','#DD6464').
load('t1049','c_R_77','parentNode').
load('t1050','t1049','removeChild_R_?').
actual('258','1','c_R_77').
callRet('258','c_R_77').
assign('t1046','t1052').
load('t1053','b_R_?','style').
load('t1054','t1053','backgroundColor').
store('t1053','backgroundColor','lightgreen').
assign('t1056','c_R_77').
assign('t1055','t1056').
load('t1058','b_R_?','parentNode').
load('t1059','t1058','getElementsByTagName').
actual('259','1','center').
callRet('259','center').
load('t1061','t1060','0').
load('t1062','t1061','create').
actual('260','1','button').
callRet('260','button').
assign('c_R_77','t1063').
load('t1064','c_R_77','innerHTML').
load('t1065','chrome','i18n').
load('t1066','t1065','getMessage').
actual('261','1','optContinue').
callRet('261','optContinue').
assign('t1064','t1067').
load('t1068','c_R_77','dataset').
load('t1069','t1068','id').
load('t1070','a_R_77','srcElement').
load('t1071','t1070','dataset').
load('t1072','t1071','id').
assign('t1069','t1072').
load('t1073','c_R_77','onclick').
assign('t1073','lambda_R_79').
assign('t1057','t1073').
ptsTo('lambda_R_79','d_lambda_R_79').
heapPtsTo('d_lambda_R_79','prototype','p_lambda_R_79').
prototype('p_lambda_R_79','h_FP').
methodRet('d_lambda_R_79','lambda_R_79').
formal('d_lambda_R_79','1','a_R_79').
load('t1074','c_R_77','dataset').
load('t1075','t1074','key').
store('t1074','key','d_R_?').
load('t1077','b_R_?','dataset').
load('t1078','t1077','drops').
assign('t1079','t1078').
assign('t1076','t1079').
load('t1080','localStorage_R_?','advancedProtectionSettings').
load('t1081','JSON_R_?','stringify_R_?').
load('t1082','a_R_78','srcElement').
load('t1083','t1082','dataset').
load('t1084','t1083','key').
store('t1080','key_R_?','t1084').
actual('262','1','__objectInit__').
callRet('262','__objectInit__').
store('localStorage_R_?','advancedProtectionSettings','t1085').
load('t1086','localStorage_R_?','advancedProtection').
store('localStorage_R_?','advancedProtection','true').
load('t1087','document','getElementById_R_?').
load('t1088','t1087','dialogue').
load('t1089','t1088','style').
load('t1090','t1089','display').
store('t1089','display','none').
load('t1091','document','getElementById').
load('t1092','t1091','box').
load('t1093','t1092','innerHTML').
store('t1092','innerHTML','').
load('t1095','JSON_R_?','parse_R_?').
load('t1096','localStorage_R_?','advancedProtectionSettings').
actual('263','1','t1096').
callRet('263','t1096').
load('t1098','t1097','key').
load('t1099','a_R_79','srcElement').
load('t1100','t1099','dataset').
load('t1101','t1100','key').
assign('t1094','t1102').
load('t1103','document','getElementById_R_?').
load('t1104','t1103','dialogue').
load('t1105','t1104','style').
load('t1106','t1105','display').
store('t1105','display','none').
load('t1107','document','getElementById').
load('t1108','t1107','box').
load('t1109','t1108','innerHTML').
store('t1108','innerHTML','').
load('t1111','a_R_80','shortcut').
assign('t1110','t1112').
load('t1113','JSON_R_?','parse_R_?').
load('t1114','a_R_80','shortcutArr').
actual('264','1','t1114').
callRet('264','t1114').
assign('b_R_80','t1115').
load('t1117','document','addEventListener_R_?').
actual('265','1','keydown').
callRet('265','keydown').
actual('265','2','lambda_R_81').
callRet('265','lambda_R_81').
assign('t1116','t1118').
ptsTo('lambda_R_81','d_lambda_R_81').
heapPtsTo('d_lambda_R_81','prototype','p_lambda_R_81').
prototype('p_lambda_R_81','h_FP').
methodRet('d_lambda_R_81','lambda_R_81').
formal('d_lambda_R_81','1','a_R_81').
load('t1120','document','addEventListener').
actual('266','1','keyup').
callRet('266','keyup').
actual('266','2','lambda_R_82').
callRet('266','lambda_R_82').
assign('t1119','t1121').
ptsTo('lambda_R_82','d_lambda_R_82').
heapPtsTo('d_lambda_R_82','prototype','p_lambda_R_82').
prototype('p_lambda_R_82','h_FP').
methodRet('d_lambda_R_82','lambda_R_82').
formal('d_lambda_R_82','1','c_R_82').
load('t1122','b_R_80','a_R_81').
load('t1123','t1122','which').
assign('t1124','0').
store('t1122','which','t1124').
load('t1126','c_R_82','which').
load('t1127','a_R_80','shortcut2').
load('t1129','a_R_80','shortcut1').
load('t1130','b_R_80','t1129').
assign('t1131','0').
load('t1133','a_R_80','shortcut1').
assign('t1134','1').
load('t1137','chrome','extension').
load('t1138','t1137','sendRequest').
store('t1139','action_R_?','panic').
actual('267','1','t1139').
callRet('267','t1139').
load('t1142','c_R_82','which').
load('t1143','b_R_80','t1142').
assign('t1144','1').
assign('t1143','t1144').
assign('None','t1141').
assign('t1125','t1143').
actual('268','1','s_R_83').
callRet('268','s_R_83').
load('t1146','s_R_83','length').
actual('269','1','t1145').
callRet('269','t1145').
actual('269','2','t1147').
callRet('269','t1147').
actual('270','1','t1148').
callRet('270','t1148').
methodRet('d_hex_sha1_R_83','t1149').
actual('271','1','s_R_84').
callRet('271','s_R_84').
load('t1151','s_R_84','length').
actual('272','1','t1150').
callRet('272','t1150').
actual('272','2','t1152').
callRet('272','t1152').
actual('273','1','t1153').
callRet('273','t1153').
methodRet('d_b64_sha1_R_84','t1154').
actual('274','1','s_R_85').
callRet('274','s_R_85').
load('t1156','s_R_85','length').
actual('275','1','t1155').
callRet('275','t1155').
actual('275','2','t1157').
callRet('275','t1157').
actual('276','1','t1158').
callRet('276','t1158').
methodRet('d_str_sha1_R_85','t1159').
actual('277','1','key_R_86').
callRet('277','key_R_86').
actual('277','2','data_R_86').
callRet('277','data_R_86').
actual('278','1','t1160').
callRet('278','t1160').
methodRet('d_hex_hmac_sha1_R_86','t1161').
actual('279','1','key_R_87').
callRet('279','key_R_87').
actual('279','2','data_R_87').
callRet('279','data_R_87').
actual('280','1','t1162').
callRet('280','t1162').
methodRet('d_b64_hmac_sha1_R_87','t1163').
actual('281','1','key_R_88').
callRet('281','key_R_88').
actual('281','2','data_R_88').
callRet('281','data_R_88').
actual('282','1','t1164').
callRet('282','t1164').
methodRet('d_str_hmac_sha1_R_88','t1165').
actual('283','1','abc').
callRet('283','abc').
methodRet('d_sha1_vm_test_R_89','t1167').
load('t1168','x_R_90','len_R_90').
load('t1169','t1168','5').
store('t1168','5','t1172').
load('t1173','x_R_90','len_R_90').
load('t1174','t1173','64').
load('t1175','t1174','9').
load('t1176','t1175','4').
load('t1177','t1176','15').
store('t1176','15','len_R_90').
actual('284','1','80').
callRet('284','80').
assign('w_R_90','t1178').
assign('a_R_90','1732584193').
assign('t1179','271733879').
assign('b_R_90','t1179').
assign('t1180','1732584194').
assign('c_R_90','t1180').
assign('d_R_90','271733878').
assign('t1181','1009589776').
assign('e_R_90','t1181').
load('t1183','x_R_90','length').
assign('t1182','t1184').
assign('i_R_90','0').
assign('i_R_90','16').
assign('olda_R_90','a_R_90').
assign('oldb_R_90','b_R_90').
assign('oldc_R_90','c_R_90').
assign('oldd_R_90','d_R_90').
assign('olde_R_90','e_R_90').
assign('t1185','t1186').
assign('j_R_90','0').
assign('t1188','j_R_90').
assign('t1187','t1188').
assign('t1189','t1190').
load('t1191','w_R_90','j_R_90').
load('t1193','w_R_90','t1192').
load('t1195','w_R_90','t1194').
load('t1198','w_R_90','t1197').
load('t1201','w_R_90','t1200').
actual('285','1','t1202').
callRet('285','t1202').
actual('285','2','1').
callRet('285','1').
store('w_R_90','j_R_90','t1203').
load('t1204','w_R_90','j_R_90').
load('t1206','x_R_90','t1205').
store('w_R_90','j_R_90','t1206').
actual('286','1','a_R_90').
callRet('286','a_R_90').
actual('286','2','5').
callRet('286','5').
actual('287','1','j_R_90').
callRet('287','j_R_90').
actual('287','2','b_R_90').
callRet('287','b_R_90').
actual('287','3','c_R_90').
callRet('287','c_R_90').
actual('287','4','d_R_90').
callRet('287','d_R_90').
actual('288','1','t1207').
callRet('288','t1207').
actual('288','2','t1208').
callRet('288','t1208').
load('t1210','w_R_90','j_R_90').
actual('289','1','e_R_90').
callRet('289','e_R_90').
actual('289','2','t1210').
callRet('289','t1210').
actual('290','1','j_R_90').
callRet('290','j_R_90').
actual('291','1','t1211').
callRet('291','t1211').
actual('291','2','t1212').
callRet('291','t1212').
actual('292','1','t1209').
callRet('292','t1209').
actual('292','2','t1213').
callRet('292','t1213').
assign('t_R_90','t1214').
assign('e_R_90','d_R_90').
assign('d_R_90','c_R_90').
actual('293','1','b_R_90').
callRet('293','b_R_90').
actual('293','2','30').
callRet('293','30').
assign('c_R_90','t1215').
assign('b_R_90','a_R_90').
assign('a_R_90','t_R_90').
assign('j_R_90','0').
actual('294','1','a_R_90').
callRet('294','a_R_90').
actual('294','2','olda_R_90').
callRet('294','olda_R_90').
assign('a_R_90','t1216').
actual('295','1','b_R_90').
callRet('295','b_R_90').
actual('295','2','oldb_R_90').
callRet('295','oldb_R_90').
assign('b_R_90','t1217').
actual('296','1','c_R_90').
callRet('296','c_R_90').
actual('296','2','oldc_R_90').
callRet('296','oldc_R_90').
assign('c_R_90','t1218').
actual('297','1','d_R_90').
callRet('297','d_R_90').
actual('297','2','oldd_R_90').
callRet('297','oldd_R_90').
assign('d_R_90','t1219').
actual('298','1','e_R_90').
callRet('298','e_R_90').
actual('298','2','olde_R_90').
callRet('298','olde_R_90').
assign('e_R_90','t1220').
assign('i_R_90','0').
actual('299','1','a_R_90').
callRet('299','a_R_90').
actual('299','2','b_R_90').
callRet('299','b_R_90').
actual('299','3','c_R_90').
callRet('299','c_R_90').
actual('299','4','d_R_90').
callRet('299','d_R_90').
actual('299','5','e_R_90').
callRet('299','e_R_90').
methodRet('d_core_sha1_R_90','t1221').
assign('t1222','t1223').
assign('t1225','b_R_91').
methodRet('d_sha1_ft_R_91','t1227').
assign('t1228','t1229').
methodRet('d_sha1_ft_R_91','t1231').
assign('t1232','t1233').
methodRet('d_sha1_ft_R_91','t1238').
methodRet('d_sha1_ft_R_91','t1240').
assign('t1244','1894007588').
assign('t1245','899497514').
assign('None','t1244').
assign('None','1859775393').
assign('None','1518500249').
methodRet('d_sha1_kt_R_92','t1245').
actual('300','1','key_R_93').
callRet('300','key_R_93').
assign('bkey_R_93','t1246').
load('t1248','bkey_R_93','length').
assign('t1247','t1249').
load('t1250','key_R_93','length').
actual('301','1','bkey_R_93').
callRet('301','bkey_R_93').
actual('301','2','t1251').
callRet('301','t1251').
assign('bkey_R_93','t1252').
actual('302','1','16').
callRet('302','16').
assign('ipad_R_93','t1253').
actual('303','1','16').
callRet('303','16').
assign('opad_R_?','t1254').
assign('t1255','t1256').
assign('i_R_93','0').
assign('t1258','i_R_93').
assign('t1257','t1258').
load('t1259','ipad_R_93','i_R_93').
load('t1260','bkey_R_93','i_R_93').
store('ipad_R_93','i_R_93','t1261').
load('t1262','opad_R_?','i_R_93').
load('t1263','bkey_R_93','i_R_93').
store('opad_R_?','i_R_93','t1264').
assign('i_R_93','0').
load('t1265','ipad_R_93','concat_R_?').
actual('304','1','data_R_93').
callRet('304','data_R_93').
actual('305','1','t1266').
callRet('305','t1266').
load('t1268','data_R_93','length').
actual('306','1','t1267').
callRet('306','t1267').
actual('306','2','t1270').
callRet('306','t1270').
assign('hash_R_93','t1271').
load('t1272','opad_R_?','concat').
actual('307','1','hash_R_93').
callRet('307','hash_R_93').
actual('308','1','t1273').
callRet('308','t1273').
actual('308','2','t1274').
callRet('308','t1274').
methodRet('d_core_hmac_sha1_R_93','t1275').
assign('lsw_R_94','t1278').
assign('msw_R_94','t1283').
methodRet('d_safe_add_R_94','t1286').
methodRet('d_rol_R_95','t1290').
assign('bin_R_96','t1291').
assign('mask_R_96','t1293').
load('t1295','str_R_96','length').
assign('t1294','t1297').
assign('i_R_96','0').
assign('i_R_96','chrsz_R_0').
load('t1298','bin_R_96','i_R_96').
load('t1299','t1298','5').
load('t1300','str_R_96','charCodeAt_R_?').
actual('310','1','t1301').
callRet('310','t1301').
store('t1298','5','t1307').
assign('i_R_96','0').
methodRet('d_str2binb_R_96','bin_R_96').
assign('str_R_97','').
assign('mask_R_97','t1309').
load('t1311','bin_R_97','length').
assign('t1310','t1313').
assign('i_R_97','0').
assign('i_R_97','chrsz_R_0').
load('t1314','String_R_?','fromCharCode_R_?').
load('t1316','bin_R_97','t1315').
actual('311','1','t1321').
callRet('311','t1321').
assign('str_R_97','t1322').
assign('i_R_97','0').
methodRet('d_binb2str_R_97','str_R_97').
assign('(None, "hex_tab_R_98")','""""""0123456789ABCDEF""""""').
assign('hex_tab_R_98','""""""0123456789abcdef""""""').
assign('str_R_98','').
load('t1324','binarray_R_98','length').
assign('t1323','t1326').
assign('i_R_98','0').
assign('t1328','i_R_98').
assign('t1327','t1328').
load('t1329','hex_tab_R_98','charAt_R_?').
load('t1331','binarray_R_98','t1330').
actual('312','1','t1337').
callRet('312','t1337').
load('t1339','hex_tab_R_98','charAt').
load('t1341','binarray_R_98','t1340').
actual('313','1','t1346').
callRet('313','t1346').
assign('str_R_98','t1348').
assign('i_R_98','0').
methodRet('d_binb2hex_R_98','str_R_98').
assign('tab_R_99','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/').
assign('str_R_99','').
load('t1350','binarray_R_99','length').
assign('t1349','t1352').
assign('i_R_99','0').
assign('i_R_99','3').
load('t1354','binarray_R_99','t1353').
load('t1363','binarray_R_99','t1362').
load('t1374','binarray_R_99','t1373').
assign('triplet_R_99','t1381').
assign('t1382','t1383').
assign('j_R_99','0').
assign('t1385','j_R_99').
assign('t1384','t1385').
load('t1390','binarray_R_99','length').
assign('t1386','t1392').
load('t1393','tab_R_99','charAt_R_?').
actual('314','1','t1397').
callRet('314','t1397').
assign('str_R_99','t1398').
assign('str_R_99','b64pad_R_0').
assign('j_R_99','0').
assign('i_R_99','0').
methodRet('d_binb2b64_R_99','str_R_99').
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

