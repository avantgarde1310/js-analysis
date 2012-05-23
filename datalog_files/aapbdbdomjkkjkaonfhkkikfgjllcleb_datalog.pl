ptsTo('injection_R_1','d_injection_R_1').
heapPtsTo('d_injection_R_1','prototype','p_injection_R_1').
prototype('p_injection_R_1','h_FP').
methodRet('d_injection_R_1','injection_R_1').
ptsTo('injector_R_7','d_injector_R_7').
heapPtsTo('d_injector_R_7','prototype','p_injector_R_7').
prototype('p_injector_R_7','h_FP').
methodRet('d_injector_R_7','injector_R_7').
assign('t0','t1').
ptsTo('lambda_R_9','d_lambda_R_9').
heapPtsTo('d_lambda_R_9','prototype','p_lambda_R_9').
prototype('p_lambda_R_9','h_FP').
methodRet('d_lambda_R_9','lambda_R_9').
assign('t2','t3').
ptsTo('lambda_R_55','d_lambda_R_55').
heapPtsTo('d_lambda_R_55','prototype','p_lambda_R_55').
prototype('p_lambda_R_55','h_FP').
methodRet('d_lambda_R_55','lambda_R_55').
load('t5','chrome','tabs').
load('t6','t5','onUpdated').
load('t7','t6','addListener').
actual('2','1','lambda_R_87').
callRet('2','lambda_R_87').
assign('t4','t8').
ptsTo('lambda_R_87','d_lambda_R_87').
heapPtsTo('d_lambda_R_87','prototype','p_lambda_R_87').
prototype('p_lambda_R_87','h_FP').
methodRet('d_lambda_R_87','lambda_R_87').
formal('d_lambda_R_87','1','tabId_R_87').
formal('d_lambda_R_87','2','changeInfo_R_87').
formal('d_lambda_R_87','3','tab_R_87').
load('t10','chrome','tabs').
load('t11','t10','onRemoved').
load('t12','t11','addListener').
actual('3','1','lambda_R_88').
callRet('3','lambda_R_88').
assign('t9','t13').
ptsTo('lambda_R_88','d_lambda_R_88').
heapPtsTo('d_lambda_R_88','prototype','p_lambda_R_88').
prototype('p_lambda_R_88','h_FP').
methodRet('d_lambda_R_88','lambda_R_88').
formal('d_lambda_R_88','1','tabId_R_88').
load('t15','chrome','browserAction').
load('t16','t15','onClicked').
load('t17','t16','addListener').
actual('4','1','lambda_R_89').
callRet('4','lambda_R_89').
assign('t14','t18').
ptsTo('lambda_R_89','d_lambda_R_89').
heapPtsTo('d_lambda_R_89','prototype','p_lambda_R_89').
prototype('p_lambda_R_89','h_FP').
methodRet('d_lambda_R_89','lambda_R_89').
formal('d_lambda_R_89','1','tab_R_89').
load('t20','chrome','extension').
load('t21','t20','onRequest').
load('t22','t21','addListener').
actual('5','1','lambda_R_90').
callRet('5','lambda_R_90').
assign('t19','t23').
ptsTo('lambda_R_90','d_lambda_R_90').
heapPtsTo('d_lambda_R_90','prototype','p_lambda_R_90').
prototype('p_lambda_R_90','h_FP').
methodRet('d_lambda_R_90','lambda_R_90').
formal('d_lambda_R_90','1','request_R_90').
ptsTo('toggle_R_91','d_toggle_R_91').
heapPtsTo('d_toggle_R_91','prototype','p_toggle_R_91').
prototype('p_toggle_R_91','h_FP').
methodRet('d_toggle_R_91','toggle_R_91').
formal('d_toggle_R_91','1','id_R_91').
assign('t24','t25').
ptsTo('lambda_R_92','d_lambda_R_92').
heapPtsTo('d_lambda_R_92','prototype','p_lambda_R_92').
prototype('p_lambda_R_92','h_FP').
methodRet('d_lambda_R_92','lambda_R_92').
load('t27','navigator_R_?','platform').
load('t28','t27','toLowerCase_R_?').
load('t30','t29','indexOf_R_?').
actual('8','1','win').
callRet('8','win').
assign('t26','t32').
load('t33','document','getElementById_R_?').
load('t34','t33','nonWinWarning').
load('t35','t34','style').
load('t36','t35','display').
store('t35','display','').
assign('t37','t38').
ptsTo('lambda_R_94','d_lambda_R_94').
heapPtsTo('d_lambda_R_94','prototype','p_lambda_R_94').
prototype('p_lambda_R_94','h_FP').
methodRet('d_lambda_R_94','lambda_R_94').
assign('pageLang_R_1','{{$pageLang}}').
assign('userLang_R_1','{{$userLang}}').
assign('autoTrans_R_1','t39').
assign('uid_R_1','""""""""1E07F158C6FA4460B352973E9693B329""""""""').
assign('teId_R_1','t40').
assign('cbId_R_1','t41').
ptsTo('show_R_2','d_show_R_2').
heapPtsTo('d_show_R_2','prototype','p_show_R_2').
prototype('p_show_R_2','h_FP').
methodRet('d_show_R_2','show_R_2').
ptsTo('newElem_R_4','d_newElem_R_4').
heapPtsTo('d_newElem_R_4','prototype','p_newElem_R_4').
prototype('p_newElem_R_4','h_FP').
methodRet('d_newElem_R_4','newElem_R_4').
load('t43','window','teId_R_1').
assign('t42','t43').
load('t45','window','google').
assign('t46','t45').
load('t47','google_R_?','translate').
assign('t48','t47').
load('t50','google_R_?','translate').
load('t51','t50','TranslateElement').
assign('t52','t51').
assign('t44','t53').
load('t55','window','cbId_R_1').
assign('t56','t55').
assign('t54','t56').
load('t57','window','cbId_R_1').
store('window','cbId_R_1','lambda_R_6').
ptsTo('lambda_R_6','d_lambda_R_6').
heapPtsTo('d_lambda_R_6','prototype','p_lambda_R_6').
prototype('p_lambda_R_6','h_FP').
methodRet('d_lambda_R_6','lambda_R_6').
load('t58','document','createElement_R_?').
actual('10','1','script').
callRet('10','script').
assign('s_R_1','t59').
load('t60','s_R_1','src').
actual('11','1','cbId_R_1').
callRet('11','cbId_R_1').
store('s_R_1','src','t64').
load('t66','document','getElementsByTagName_R_?').
actual('12','1','head').
callRet('12','head').
load('t68','t67','0').
load('t69','t68','appendChild_R_?').
actual('13','1','s_R_1').
callRet('13','s_R_1').
assign('t65','t70').
assign('t71','t72').
load('t74','window','setTimeout_R_?').
actual('15','1','lambda_R_3').
callRet('15','lambda_R_3').
actual('15','2','10').
callRet('15','10').
assign('t73','t75').
ptsTo('lambda_R_3','d_lambda_R_3').
heapPtsTo('d_lambda_R_3','prototype','p_lambda_R_3').
prototype('p_lambda_R_3','h_FP').
methodRet('d_lambda_R_3','lambda_R_3').
load('t77','window','teId_R_1').
load('t78','t77','showBanner_R_?').
actual('16','1','autoTrans_R_1').
callRet('16','autoTrans_R_1').
assign('t76','t79').
load('t80','google_R_?','translate').
load('t81','t80','TranslateElement').
store('elem_R_4','autoDisplay_R_?','false').
store('elem_R_4','floatPosition_R_?','0').
store('elem_R_4','multilanguagePage_R_?','true').
store('elem_R_4','pageLanguage_R_?','pageLang_R_1').
ptsTo('t82','n_t81_0').
prototype('n_t81_0', 'p_t81').
actual('17','1','__objectInit__').
callRet('17','__objectInit__').
assign('elem_R_4','t82').
load('t83','elem_R_4','onTurnOffLanguageClick').
store('elem_R_4','onTurnOffLanguageClick','lambda_R_5').
ptsTo('lambda_R_5','d_lambda_R_5').
heapPtsTo('d_lambda_R_5','prototype','p_lambda_R_5').
prototype('p_lambda_R_5','h_FP').
methodRet('d_lambda_R_5','lambda_R_5').
methodRet('d_newElem_R_4','elem_R_4').
load('t84','document','createEvent_R_?').
actual('17','1','Event').
callRet('17','Event').
assign('event_R_5','t85').
load('t87','event_R_5','initEvent_R_?').
actual('18','1','te_disable_lang').
callRet('18','te_disable_lang').
actual('18','2','true').
callRet('18','true').
actual('18','3','true').
callRet('18','true').
assign('t86','t88').
load('t90','document','body').
load('t91','t90','dispatchEvent_R_?').
actual('19','1','event_R_5').
callRet('19','event_R_5').
assign('t89','t92').
load('t93','window','teId_R_1').
store('window','teId_R_1','t94').
assign('t95','t96').
load('t97','document','createElement_R_?').
actual('22','1','script').
callRet('22','script').
assign('s_R_7','t98').
load('t99','s_R_7','innerHTML').
store('s_R_7','innerHTML','{{$content}}').
load('t101','document','getElementsByTagName_R_?').
actual('23','1','head').
callRet('23','head').
load('t103','t102','0').
load('t104','t103','appendChild_R_?').
actual('24','1','s_R_7').
callRet('24','s_R_7').
assign('t100','t105').
assign('t107','{{$noEvents}}').
assign('t106','t107').
load('t109','document','body').
load('t110','t109','addEventListener_R_?').
actual('25','1','te_disable_lang').
callRet('25','te_disable_lang').
actual('25','2','lambda_R_8').
callRet('25','lambda_R_8').
assign('t108','t111').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
formal('d_lambda_R_8','1','e_R_8').
load('t113','chrome','extension').
load('t114','t113','sendRequest').
store('t115','disabledLang_R_?','{{$pageLang}}').
actual('26','1','t115').
callRet('26','t115').
assign('t112','t116').
assign('c_R_9','true').
assign('f_R_?','false').
assign('g_R_?','parseInt_R_?').
assign('h_R_?','window').
assign('i_R_?','chrome').
assign('j_R_?','length').
assign('l_R_?','prototype').
assign('m_R_?','replace').
assign('p_R_?','save').
load('t117','h_R_?','injection').
load('t118','t117','toString_R_?').
store('r_R_9','code_R_?','t119').
actual('28','1','(function(){({{$code}})();})();').
callRet('28','(function(){({{$code}})();})();').
actual('28','2','__objectInit__').
callRet('28','__objectInit__').
assign('r_R_9','t120').
load('t121','h_R_?','injector').
load('t122','t121','toString').
store('s_R_?','code_R_?','t123').
actual('30','1','(function(){({{$code}})();})();').
callRet('30','(function(){({{$code}})();})();').
actual('30','2','__objectInit__').
callRet('30','__objectInit__').
assign('s_R_?','t124').
load('t126','h_R_?','injector').
assign('t125','t126').
load('t128','h_R_?','injection').
assign('t127','t128').
ptsTo('t_R_10','d_t_R_10').
heapPtsTo('d_t_R_10','prototype','p_t_R_10').
prototype('p_t_R_10','h_FP').
methodRet('d_t_R_10','t_R_10').
formal('d_t_R_10','1','a_R_10').
formal('d_t_R_10','2','b_R_10').
formal('d_t_R_10','3','d_R_10').
formal('d_t_R_10','4','e_R_10').
ptsTo('v_R_11','d_v_R_11').
heapPtsTo('d_v_R_11','prototype','p_v_R_11').
prototype('p_v_R_11','h_FP').
methodRet('d_v_R_11','v_R_11').
formal('d_v_R_11','1','a_R_11').
ptsTo('w_R_12','d_w_R_12').
heapPtsTo('d_w_R_12','prototype','p_w_R_12').
prototype('p_w_R_12','h_FP').
methodRet('d_w_R_12','w_R_12').
formal('d_w_R_12','1','a_R_12').
ptsTo('x_R_13','d_x_R_13').
heapPtsTo('d_x_R_13','prototype','p_x_R_13').
prototype('p_x_R_13','h_FP').
methodRet('d_x_R_13','x_R_13').
formal('d_x_R_13','1','a_R_13').
ptsTo('y_R_14','d_y_R_14').
heapPtsTo('d_y_R_14','prototype','p_y_R_14').
prototype('p_y_R_14','h_FP').
methodRet('d_y_R_14','y_R_14').
formal('d_y_R_14','1','a_R_14').
formal('d_y_R_14','2','b_R_14').
formal('d_y_R_14','3','d_R_14').
ptsTo('z_R_15','d_z_R_15').
heapPtsTo('d_z_R_15','prototype','p_z_R_15').
prototype('p_z_R_15','h_FP').
methodRet('d_z_R_15','z_R_15').
formal('d_z_R_15','1','a_R_15').
load('t129','w_R_?','l_R_?').
load('t130','t129','m').
store('t129','m','lambda_R_16').
ptsTo('lambda_R_16','d_lambda_R_16').
heapPtsTo('d_lambda_R_16','prototype','p_lambda_R_16').
prototype('p_lambda_R_16','h_FP').
methodRet('d_lambda_R_16','lambda_R_16').
formal('d_lambda_R_16','1','a_R_16').
ptsTo('B_R_17','d_B_R_17').
heapPtsTo('d_B_R_17','prototype','p_B_R_17').
prototype('p_B_R_17','h_FP').
methodRet('d_B_R_17','B_R_17').
formal('d_B_R_17','1','a_R_17').
load('t131','w_R_?','l_R_?').
load('t132','t131','r').
store('t131','r','lambda_R_18').
ptsTo('lambda_R_18','d_lambda_R_18').
heapPtsTo('d_lambda_R_18','prototype','p_lambda_R_18').
prototype('p_lambda_R_18','h_FP').
methodRet('d_lambda_R_18','lambda_R_18').
formal('d_lambda_R_18','1','a_R_18').
ptsTo('C_R_19','d_C_R_19').
heapPtsTo('d_C_R_19','prototype','p_C_R_19').
prototype('p_C_R_19','h_FP').
methodRet('d_C_R_19','C_R_19').
formal('d_C_R_19','1','a_R_19').
ptsTo('J_R_20','d_J_R_20').
heapPtsTo('d_J_R_20','prototype','p_J_R_20').
prototype('p_J_R_20','h_FP').
methodRet('d_J_R_20','J_R_20').
load('t133','J_R_?','l_R_?').
load('t134','t133','h').
store('t133','h','lambda_R_21').
ptsTo('lambda_R_21','d_lambda_R_21').
heapPtsTo('d_lambda_R_21','prototype','p_lambda_R_21').
prototype('p_lambda_R_21','h_FP').
methodRet('d_lambda_R_21','lambda_R_21').
formal('d_lambda_R_21','1','a_R_21').
formal('d_lambda_R_21','2','b_R_21').
formal('d_lambda_R_21','3','d_R_21').
load('t135','J_R_?','l_R_?').
load('t136','t135','detach').
store('t135','detach','lambda_R_22').
ptsTo('lambda_R_22','d_lambda_R_22').
heapPtsTo('d_lambda_R_22','prototype','p_lambda_R_22').
prototype('p_lambda_R_22','h_FP').
methodRet('d_lambda_R_22','lambda_R_22').
formal('d_lambda_R_22','1','a_R_22').
ptsTo('K_R_23','d_K_R_23').
heapPtsTo('d_K_R_23','prototype','p_K_R_23').
prototype('p_K_R_23','h_FP').
methodRet('d_K_R_23','K_R_23').
formal('d_K_R_23','1','a_R_23').
formal('d_K_R_23','2','b_R_23').
load('t137','K_R_?','l_R_?').
load('t138','t137','add').
store('t137','add','lambda_R_24').
ptsTo('lambda_R_24','d_lambda_R_24').
heapPtsTo('d_lambda_R_24','prototype','p_lambda_R_24').
prototype('p_lambda_R_24','h_FP').
methodRet('d_lambda_R_24','lambda_R_24').
formal('d_lambda_R_24','1','a_R_24').
load('t139','K_R_?','l_R_?').
load('t140','t139','remove').
store('t139','remove','lambda_R_25').
ptsTo('lambda_R_25','d_lambda_R_25').
heapPtsTo('d_lambda_R_25','prototype','p_lambda_R_25').
prototype('p_lambda_R_25','h_FP').
methodRet('d_lambda_R_25','lambda_R_25').
formal('d_lambda_R_25','1','a_R_25').
load('t141','K_R_?','l_R_?').
load('t142','t141','g').
store('t141','g','lambda_R_26').
ptsTo('lambda_R_26','d_lambda_R_26').
heapPtsTo('d_lambda_R_26','prototype','p_lambda_R_26').
prototype('p_lambda_R_26','h_FP').
methodRet('d_lambda_R_26','lambda_R_26').
load('t143','K_R_?','l_R_?').
load('t144','t143','has').
store('t143','has','lambda_R_27').
ptsTo('lambda_R_27','d_lambda_R_27').
heapPtsTo('d_lambda_R_27','prototype','p_lambda_R_27').
prototype('p_lambda_R_27','h_FP').
methodRet('d_lambda_R_27','lambda_R_27').
formal('d_lambda_R_27','1','a_R_27').
ptsTo('L_R_28','d_L_R_28').
heapPtsTo('d_L_R_28','prototype','p_L_R_28').
prototype('p_L_R_28','h_FP').
methodRet('d_L_R_28','L_R_28').
formal('d_L_R_28','1','a_R_28').
formal('d_L_R_28','2','b_R_28').
load('t145','L_R_?','l_R_?').
load('t146','t145','add').
store('t145','add','lambda_R_29').
ptsTo('lambda_R_29','d_lambda_R_29').
heapPtsTo('d_lambda_R_29','prototype','p_lambda_R_29').
prototype('p_lambda_R_29','h_FP').
methodRet('d_lambda_R_29','lambda_R_29').
formal('d_lambda_R_29','1','a_R_29').
formal('d_lambda_R_29','2','b_R_29').
load('t147','L_R_?','l_R_?').
load('t148','t147','remove').
store('t147','remove','lambda_R_30').
ptsTo('lambda_R_30','d_lambda_R_30').
heapPtsTo('d_lambda_R_30','prototype','p_lambda_R_30').
prototype('p_lambda_R_30','h_FP').
methodRet('d_lambda_R_30','lambda_R_30').
formal('d_lambda_R_30','1','a_R_30').
load('t149','L_R_?','l_R_?').
load('t150','t149','i').
store('t149','i','lambda_R_31').
ptsTo('lambda_R_31','d_lambda_R_31').
heapPtsTo('d_lambda_R_31','prototype','p_lambda_R_31').
prototype('p_lambda_R_31','h_FP').
methodRet('d_lambda_R_31','lambda_R_31').
load('t151','L_R_?','l_R_?').
load('t152','t151','has').
store('t151','has','lambda_R_32').
ptsTo('lambda_R_32','d_lambda_R_32').
heapPtsTo('d_lambda_R_32','prototype','p_lambda_R_32').
prototype('p_lambda_R_32','h_FP').
methodRet('d_lambda_R_32','lambda_R_32').
formal('d_lambda_R_32','1','a_R_32').
ptsTo('M_R_33','d_M_R_33').
heapPtsTo('d_M_R_33','prototype','p_M_R_33').
prototype('p_M_R_33','h_FP').
methodRet('d_M_R_33','M_R_33').
ptsTo('O_R_34','d_O_R_34').
heapPtsTo('d_O_R_34','prototype','p_O_R_34').
prototype('p_O_R_34','h_FP').
methodRet('d_O_R_34','O_R_34').
formal('d_O_R_34','1','a_R_34').
formal('d_O_R_34','2','b_R_34').
formal('d_O_R_34','3','d_R_34').
ptsTo('N_R_38','d_N_R_38').
heapPtsTo('d_N_R_38','prototype','p_N_R_38').
prototype('p_N_R_38','h_FP').
methodRet('d_N_R_38','N_R_38').
formal('d_N_R_38','1','a_R_38').
load('t153','M_R_?','l_R_?').
load('t154','t153','save').
store('t153','save','lambda_R_39').
ptsTo('lambda_R_39','d_lambda_R_39').
heapPtsTo('d_lambda_R_39','prototype','p_lambda_R_39').
prototype('p_lambda_R_39','h_FP').
methodRet('d_lambda_R_39','lambda_R_39').
load('t155','M_R_?','l_R_?').
load('t156','t155','j').
store('t155','j','lambda_R_40').
ptsTo('lambda_R_40','d_lambda_R_40').
heapPtsTo('d_lambda_R_40','prototype','p_lambda_R_40').
prototype('p_lambda_R_40','h_FP').
methodRet('d_lambda_R_40','lambda_R_40').
load('t157','M_R_?','l_R_?').
load('t158','t157','assign').
store('t157','assign','lambda_R_41').
ptsTo('lambda_R_41','d_lambda_R_41').
heapPtsTo('d_lambda_R_41','prototype','p_lambda_R_41').
prototype('p_lambda_R_41','h_FP').
methodRet('d_lambda_R_41','lambda_R_41').
formal('d_lambda_R_41','1','a_R_41').
load('t159','M_R_?','l_R_?').
load('t160','t159','k').
store('t159','k','lambda_R_42').
ptsTo('lambda_R_42','d_lambda_R_42').
heapPtsTo('d_lambda_R_42','prototype','p_lambda_R_42').
prototype('p_lambda_R_42','h_FP').
methodRet('d_lambda_R_42','lambda_R_42').
formal('d_lambda_R_42','1','a_R_42').
ptsTo('t161','n_J_R_?_1').
prototype('n_J_R_?_1', 'p_J_R_?').
assign('P_R_9','t161').
ptsTo('t162','n_M_R_?_2').
prototype('n_M_R_?_2', 'p_M_R_?').
assign('G_R_?','t162').
ptsTo('Q_R_43','d_Q_R_43').
heapPtsTo('d_Q_R_43','prototype','p_Q_R_43').
prototype('p_Q_R_43','h_FP').
methodRet('d_Q_R_43','Q_R_43').
ptsTo('R_R_44','d_R_R_44').
heapPtsTo('d_R_R_44','prototype','p_R_R_44').
prototype('p_R_R_44','h_FP').
methodRet('d_R_R_44','R_R_44').
actual('31','1','Q_R_?').
callRet('31','Q_R_?').
actual('31','2','translate.getTranslateManager').
callRet('31','translate.getTranslateManager').
assign('t163','t164').
load('t166','J_R_?','l_R_?').
load('t167','t166','h').
actual('32','1','J_R_?').
callRet('32','J_R_?').
actual('32','2','attach').
callRet('32','attach').
actual('32','3','t167').
callRet('32','t167').
assign('t165','t168').
load('t170','J_R_?','l_R_?').
load('t171','t170','detach').
actual('33','1','J_R_?').
callRet('33','J_R_?').
actual('33','2','detach').
callRet('33','detach').
actual('33','3','t171').
callRet('33','t171').
assign('t169','t172').
actual('34','1','R_R_?').
callRet('34','R_R_?').
actual('34','2','translate.getUserOptions').
callRet('34','translate.getUserOptions').
assign('t173','t174').
load('t176','M_R_?','l_R_?').
load('t177','t176','p_R_?').
actual('35','1','M_R_?').
callRet('35','M_R_?').
actual('35','2','save').
callRet('35','save').
actual('35','3','t177').
callRet('35','t177').
assign('t175','t178').
load('t180','M_R_?','l_R_?').
load('t181','t180','j').
actual('36','1','M_R_?').
callRet('36','M_R_?').
actual('36','2','clone').
callRet('36','clone').
actual('36','3','t181').
callRet('36','t181').
assign('t179','t182').
load('t184','M_R_?','l_R_?').
load('t185','t184','assign').
actual('37','1','M_R_?').
callRet('37','M_R_?').
actual('37','2','assign').
callRet('37','assign').
actual('37','3','t185').
callRet('37','t185').
assign('t183','t186').
load('t188','M_R_?','l_R_?').
load('t189','t188','k').
actual('38','1','M_R_?').
callRet('38','M_R_?').
actual('38','2','setOnSave').
callRet('38','setOnSave').
actual('38','3','t189').
callRet('38','t189').
assign('t187','t190').
load('t192','L_R_?','l_R_?').
load('t193','t192','add').
actual('39','1','L_R_?').
callRet('39','L_R_?').
actual('39','2','add').
callRet('39','add').
actual('39','3','t193').
callRet('39','t193').
assign('t191','t194').
load('t196','L_R_?','l_R_?').
load('t197','t196','remove').
actual('40','1','L_R_?').
callRet('40','L_R_?').
actual('40','2','remove').
callRet('40','remove').
actual('40','3','t197').
callRet('40','t197').
assign('t195','t198').
load('t200','L_R_?','l_R_?').
load('t201','t200','i').
actual('41','1','L_R_?').
callRet('41','L_R_?').
actual('41','2','list').
callRet('41','list').
actual('41','3','t201').
callRet('41','t201').
assign('t199','t202').
load('t204','L_R_?','l_R_?').
load('t205','t204','has').
actual('42','1','L_R_?').
callRet('42','L_R_?').
actual('42','2','has').
callRet('42','has').
actual('42','3','t205').
callRet('42','t205').
assign('t203','t206').
load('t208','K_R_?','l_R_?').
load('t209','t208','add').
actual('43','1','K_R_?').
callRet('43','K_R_?').
actual('43','2','add').
callRet('43','add').
actual('43','3','t209').
callRet('43','t209').
assign('t207','t210').
load('t212','K_R_?','l_R_?').
load('t213','t212','remove').
actual('44','1','K_R_?').
callRet('44','K_R_?').
actual('44','2','remove').
callRet('44','remove').
actual('44','3','t213').
callRet('44','t213').
assign('t211','t214').
load('t216','K_R_?','l_R_?').
load('t217','t216','g').
actual('45','1','K_R_?').
callRet('45','K_R_?').
actual('45','2','list').
callRet('45','list').
actual('45','3','t217').
callRet('45','t217').
assign('t215','t218').
load('t220','K_R_?','l_R_?').
load('t221','t220','has').
actual('46','1','K_R_?').
callRet('46','K_R_?').
actual('46','2','has').
callRet('46','has').
actual('46','3','t221').
callRet('46','t221').
assign('t219','t222').
ptsTo('S_R_45','d_S_R_45').
heapPtsTo('d_S_R_45','prototype','p_S_R_45').
prototype('p_S_R_45','h_FP').
methodRet('d_S_R_45','S_R_45').
formal('d_S_R_45','1','a_R_45').
formal('d_S_R_45','2','b_R_45').
ptsTo('T_R_46','d_T_R_46').
heapPtsTo('d_T_R_46','prototype','p_T_R_46').
prototype('p_T_R_46','h_FP').
methodRet('d_T_R_46','T_R_46').
formal('d_T_R_46','1','a_R_46').
formal('d_T_R_46','2','b_R_46').
formal('d_T_R_46','3','d_R_46').
ptsTo('q_R_47','d_q_R_47').
heapPtsTo('d_q_R_47','prototype','p_q_R_47').
prototype('p_q_R_47','h_FP').
methodRet('d_q_R_47','q_R_47').
formal('d_q_R_47','1','a_R_47').
formal('d_q_R_47','2','b_R_47').
ptsTo('u_R_49','d_u_R_49').
heapPtsTo('d_u_R_49','prototype','p_u_R_49').
prototype('p_u_R_49','h_FP').
methodRet('d_u_R_49','u_R_49').
formal('d_u_R_49','1','a_R_49').
ptsTo('H_R_50','d_H_R_50').
heapPtsTo('d_H_R_50','prototype','p_H_R_50').
prototype('p_H_R_50','h_FP').
methodRet('d_H_R_50','H_R_50').
formal('d_H_R_50','1','a_R_50').
ptsTo('A_R_51','d_A_R_51').
heapPtsTo('d_A_R_51','prototype','p_A_R_51').
prototype('p_A_R_51','h_FP').
methodRet('d_A_R_51','A_R_51').
formal('d_A_R_51','1','a_R_51').
formal('d_A_R_51','2','b_R_51').
ptsTo('I_R_54','d_I_R_54').
heapPtsTo('d_I_R_54','prototype','p_I_R_54').
prototype('p_I_R_54','h_FP').
methodRet('d_I_R_54','I_R_54').
store('b_R_10','pageLang_R_?','b_R_10').
store('b_R_10','userLang_R_?','d_R_10').
store('b_R_10','autoTrans_R_?','e_R_10').
assign('b_R_10','__objectInit__').
load('t223','b_R_10','content').
actual('47','1','r_R_9').
callRet('47','r_R_9').
actual('47','2','b_R_10').
callRet('47','b_R_10').
actual('48','1','t224').
callRet('48','t224').
store('b_R_10','content','t225').
load('t227','i_R_?','tabs').
load('t228','t227','executeScript_R_?').
actual('49','1','s_R_?').
callRet('49','s_R_?').
actual('49','2','b_R_10').
callRet('49','b_R_10').
store('t229','code_R_?','t230').
actual('50','1','a_R_10').
callRet('50','a_R_10').
actual('50','2','t229').
callRet('50','t229').
assign('t226','t231').
store('b_R_11','noEvents_R_?','c_R_9').
actual('51','1','window["_GOOG_TRANS_EXT_VER"] = "1";').
callRet('51','window["_GOOG_TRANS_EXT_VER"] = "1";').
store('b_R_11','content_R_?','t232').
assign('b_R_11','__objectInit__').
load('t234','i_R_?','tabs').
load('t235','t234','executeScript_R_?').
actual('52','1','s_R_?').
callRet('52','s_R_?').
actual('52','2','b_R_11').
callRet('52','b_R_11').
store('t236','code_R_?','t237').
actual('53','1','a_R_11').
callRet('53','a_R_11').
actual('53','2','t236').
callRet('53','t236').
assign('t233','t238').
load('t239','this','t').
store('this','t','a_R_12').
load('t240','this','f').
load('t241','this','n').
assign('t241','f_R_?').
store('this','f','t241').
load('t242','a_R_13','f').
store('a_R_13','f','c_R_9').
load('t244','a_R_14','n').
load('t245','a_R_14','f').
assign('t247','t246').
assign('t243','t247').
load('t248','a_R_14','n').
store('a_R_14','n','c_R_9').
load('t249','a_R_14','u').
load('t250','b_R_14','url').
store('a_R_14','u','t250').
load('t251','a_R_14','l').
store('a_R_14','l','t252').
load('t253','a_R_14','o').
store('a_R_14','o','').
actual('54','1','a_R_14').
callRet('54','a_R_14').
assign('t254','t255').
load('t257','navigator_R_?','platform').
load('t258','t257','toLowerCase_R_?').
load('t260','t259','indexOf_R_?').
actual('56','1','win').
callRet('56','win').
load('t263','i_R_?','tabs').
load('t264','t263','detectLanguage_R_?').
load('t265','a_R_15','t').
load('t266','a_R_15','m').
actual('57','1','t266').
callRet('57','t266').
actual('57','2','a_R_15').
callRet('57','a_R_15').
actual('58','1','t265').
callRet('58','t265').
actual('58','2','t267').
callRet('58','t267').
load('t269','a_R_15','m_R_?').
actual('59','1','und_non_win').
callRet('59','und_non_win').
assign('None','t268').
assign('t256','t270').
load('t272','this','f').
assign('t273','t272').
assign('t271','t273').
assign('t275','a_R_16').
load('t280','a_R_16','match_R_?').
actual('60','1','invalid').
callRet('60','invalid').
assign('t274','t282').
assign('a_R_16','auto').
load('t283','this','o').
store('this','o','a_R_16').
actual('61','1','this').
callRet('61','this').
assign('t284','t285').
load('t287','i_R_?','i18n').
load('t288','t287','getAcceptLanguages_R_?').
load('t289','a_R_17','r').
actual('62','1','t289').
callRet('62','t289').
actual('62','2','a_R_17').
callRet('62','a_R_17').
actual('63','1','t290').
callRet('63','t290').
assign('t286','t291').
load('t293','this','f').
assign('t294','t293').
assign('t292','t294').
assign('a_R_18','t296').
assign('t295','t297').
load('t298','this','e').
store('this','e','a_R_18').
actual('64','1','this').
callRet('64','this').
assign('t299','t300').
load('t302','a_R_19','e').
load('t303','t302','j_R_?').
assign('t301','t304').
assign('b_R_19','G_R_?').
load('t305','b_R_19','targetLang_R_?').
load('t307','a_R_19','e').
load('t308','t307','0').
assign('t310','t309').
assign('t311','t310').
assign('d_R_?','t311').
load('t312','a_R_19','o').
assign('e_R_?','t313').
load('t314','b_R_19','targetLang').
load('t316','a_R_19','e').
load('t317','t316','0').
actual('67','1','t319').
callRet('67','t319').
assign('n_R_?','t320').
load('t321','a_R_19','o').
actual('68','1','t321').
callRet('68','t321').
assign('k_R_?','t322').
assign('D_R_?','__objectInit__').
assign('o_R_?','0').
assign('t324','o_R_?').
assign('t323','t324').
load('t325','D_R_?','H_R_50').
load('t326','t325','a_R_19').
load('t327','t326','e').
load('t328','t327','o_R_?').
store('t327','o_R_?','c_R_9').
assign('b_R_19','G_R_?').
load('t329','b_R_19','targetLang_R_?').
load('t331','a_R_19','e').
load('t332','t331','0').
assign('t334','t333').
assign('t335','t334').
assign('d_R_?','t335').
load('t336','a_R_19','o').
assign('e_R_?','t337').
load('t338','b_R_19','targetLang').
load('t340','a_R_19','e').
load('t341','t340','0').
actual('71','1','t343').
callRet('71','t343').
assign('n_R_?','t344').
load('t345','a_R_19','o').
actual('72','1','t345').
callRet('72','t345').
assign('k_R_?','t346').
assign('D_R_?','__objectInit__').
assign('o_R_?','0').
assign('o_R_?','f_R_?').
assign('t347','d_R_?').
load('t349','a_R_19','l').
load('t351','b_R_19','autoTrans_R_?').
assign('t348','t353').
load('t355','a_R_19','l').
assign('t354','t356').
assign('t357','t359').
assign('o_R_?','c_R_9').
load('t361','b_R_19','autoTransUrls_R_?').
load('t363','t362','has_R_?').
load('t364','a_R_19','u').
actual('75','1','t364').
callRet('75','t364').
load('t368','b_R_19','autoTransLangs_R_?').
load('t370','t369','has').
actual('77','1','k_R_?').
callRet('77','k_R_?').
assign('t360','t373').
assign('o_R_?','c_R_9').
assign('E_R_19','c_R_9').
assign('F_R_?','t374').
load('t376','a_R_19','l').
assign('t378','o_R_?').
assign('t375','t379').
load('t381','b_R_19','autoDisplay_R_?').
assign('t383','t382').
assign('t384','e_R_?').
assign('t386','d_R_?').
load('t390','D_R_?','k_R_?').
load('t392','b_R_19','disabledLangs_R_?').
load('t394','t393','has').
actual('81','1','k_R_?').
callRet('81','k_R_?').
load('t397','b_R_19','disabledUrls_R_?').
load('t399','t398','has').
load('t400','a_R_19','u').
actual('83','1','t400').
callRet('83','t400').
load('t403','F_R_?','0').
load('t405','F_R_?','1').
assign('t380','t408').
assign('E_R_19','f_R_?').
load('t410','a_R_19','t').
actual('84','1','t410').
callRet('84','t410').
actual('84','2','k_R_?').
callRet('84','k_R_?').
actual('84','3','n_R_?').
callRet('84','n_R_?').
actual('84','4','o_R_?').
callRet('84','o_R_?').
assign('t409','t412').
load('t413','a_R_19','n').
store('a_R_19','n','f_R_?').
load('t414','this','c').
store('this','c','__objectInit__').
load('t416','this','c').
load('t417','t416','a_R_21').
load('t418','this','c').
load('t419','t418','a_R_21').
ptsTo('t420','n_w_R_?_3').
prototype('n_w_R_?_3', 'p_w_R_?').
actual('85','1','a_R_21').
callRet('85','a_R_21').
assign('t419','t420').
assign('t415','t421').
load('t423','this','c').
load('t424','t423','a_R_21').
actual('85','1','t424').
callRet('85','t424').
actual('85','2','b_R_21').
callRet('85','b_R_21').
actual('85','3','d_R_21').
callRet('85','d_R_21').
assign('t422','t425').
actual('86','1','a_R_21').
callRet('86','a_R_21').
assign('t426','t427').
load('t429','this','c').
load('t430','t429','a_R_22').
assign('t428','t430').
load('t432','this','c').
load('t433','t432','a_R_22').
actual('87','1','t433').
callRet('87','t433').
assign('t431','t434').
load('t436','this','c').
load('t437','t436','a_R_22').
assign('t435','t437').
load('t438','this','d').
store('this','d','a_R_23').
load('t439','this','p').
store('this','p','b_R_23').
load('t440','this','d').
load('t441','t440','a_R_24').
store('t440','a_R_24','c_R_9').
load('t443','this','p').
load('t444','t443','p_R_?').
assign('t442','t445').
load('t447','this','d').
load('t448','t447','a_R_25').
assign('t446','t448').
load('t450','this','p').
load('t451','t450','p_R_?').
assign('t449','t452').
assign('a_R_26','a_R_26').
load('t454','this','d').
load('t455','t454','b_R_26').
load('t456','a_R_26','push_R_?').
actual('90','1','b_R_26').
callRet('90','b_R_26').
assign('t453','t458').
assign('b_R_26','__undefined__').
methodRet('d_lambda_R_26','a_R_26').
load('t459','this','d').
load('t460','t459','a_R_27').
assign('t461','t460').
assign('t462','t461').
methodRet('d_lambda_R_27','t462').
load('t463','this','b').
store('this','b','a_R_28').
load('t464','this','q').
store('this','q','b_R_28').
load('t466','this','b').
load('t467','t466','push_R_?').
store('t468','type_R_?','a_R_29').
store('t468','pattern_R_?','b_R_29').
actual('91','1','t468').
callRet('91','t468').
assign('t465','t469').
load('t471','this','q').
load('t472','t471','p_R_?').
assign('t470','t473').
load('t475','this','b').
load('t476','t475','splice_R_?').
actual('93','1','a_R_30').
callRet('93','a_R_30').
actual('93','2','1').
callRet('93','1').
assign('t474','t477').
load('t479','this','q').
load('t480','t479','p_R_?').
assign('t478','t481').
load('t483','this','b').
load('t484','t483','j_R_?').
assign('t482','t485').
assign('a_R_31','a_R_31').
assign('b_R_?','0').
assign('t487','b_R_?').
assign('t486','t487').
load('t488','a_R_31','b_R_?').
load('t489','this','b').
load('t490','t489','b_R_?').
load('t491','t490','type').
store('t488','type_R_?','t491').
load('t492','this','b').
load('t493','t492','b_R_?').
load('t494','t493','pattern').
store('t488','pattern_R_?','t494').
store('a_R_31','b_R_?','__objectInit__').
assign('a_R_31','a_R_31').
assign('b_R_?','0').
methodRet('d_lambda_R_31','a_R_31').
load('t496','this','b').
load('t497','t496','j_R_?').
assign('t495','t498').
assign('b_R_32','0').
assign('t500','b_R_32').
assign('t499','t500').
load('t501','this','b').
load('t502','t501','b_R_32').
assign('d_R_32','t502').
load('t504','d_R_32','type').
assign('t503','t505').
load('t507','a_R_32','indexOf_R_?').
load('t508','d_R_32','pattern').
actual('95','1','t508').
callRet('95','t508').
assign('t506','t510').
methodRet('d_lambda_R_32','c_R_9').
load('t512','a_R_32','match_R_?').
load('t513','d_R_32','pattern').
actual('96','1','t513').
callRet('96','t513').
assign('t511','t514').
methodRet('d_lambda_R_32','c_R_9').
assign('b_R_32','0').
methodRet('d_lambda_R_32','f_R_?').
load('t515','this','noSave').
store('this','noSave','f_R_?').
load('t516','this','a').
store('this','a','__objectInit__').
actual('97','1','this').
callRet('97','this').
assign('t517','t518').
assign('t519','d_R_34').
assign('n_R_34','a_R_34').
load('t520','a_R_34','b_R_34').
store('a_R_34','b_R_34','lambda_R_35').
ptsTo('lambda_R_35','d_lambda_R_35').
heapPtsTo('d_lambda_R_35','prototype','p_lambda_R_35').
prototype('p_lambda_R_35','h_FP').
methodRet('d_lambda_R_35','lambda_R_35').
load('t521','a_R_34','set_').
load('t522','t521','b_R_34').
store('t521','b_R_34','lambda_R_36').
ptsTo('lambda_R_36','d_lambda_R_36').
heapPtsTo('d_lambda_R_36','prototype','p_lambda_R_36').
prototype('p_lambda_R_36','h_FP').
methodRet('d_lambda_R_36','lambda_R_36').
formal('d_lambda_R_36','1','k_R_36').
load('t523','a_R_34','a').
load('t524','t523','b_R_34').
ptsTo('t525','n_d_R_34_4').
prototype('n_d_R_34_4', 'p_d_R_34').
actual('98','1','t524').
callRet('98','t524').
actual('98','2','a_R_34').
callRet('98','a_R_34').
assign('e_R_34','t525').
load('t526','a_R_34','b_R_34').
store('a_R_34','b_R_34','lambda_R_37').
ptsTo('lambda_R_37','d_lambda_R_37').
heapPtsTo('d_lambda_R_37','prototype','p_lambda_R_37').
prototype('p_lambda_R_37','h_FP').
methodRet('d_lambda_R_37','lambda_R_37').
load('t527','n_R_34','a').
load('t528','t527','b_R_34').
methodRet('d_lambda_R_35','t528').
load('t529','n_R_34','a').
load('t530','t529','b_R_34').
store('t529','b_R_34','k_R_36').
load('t532','n_R_34','p_R_?').
assign('t531','t533').
methodRet('d_lambda_R_37','e_R_34').
load('t534','localStorage_R_?','getItem_R_?').
actual('99','1','user_options').
callRet('99','user_options').
assign('b_R_38','t535').
store('d_R_?','targetLang_R_?','').
store('d_R_?','autoDisplay_R_?','c_R_9').
store('d_R_?','disabledLangs_R_?','t536').
store('d_R_?','disabledUrls_R_?','t537').
store('d_R_?','autoTrans_R_?','f_R_?').
store('d_R_?','autoTransLangs_R_?','t538').
store('d_R_?','autoTransUrls_R_?','t539').
assign('d_R_?','__objectInit__').
assign('t540','b_R_38').
load('t541','a_R_38','a').
store('a_R_38','a','d_R_?').
load('t542','a_R_38','a').
load('t543','JSON_R_?','parse_R_?').
actual('100','1','b_R_38').
callRet('100','b_R_38').
store('a_R_38','a','t544').
load('t546','a_R_38','a').
load('t547','a_R_38','a').
load('t548','t547','e_R_38').
load('t549','d_R_?','e_R_38').
assign('t548','t549').
assign('t545','t550').
assign('e_R_38','__undefined__').
load('t552','a_R_38','p_R_?').
assign('t551','t553').
actual('102','1','a_R_38').
callRet('102','a_R_38').
actual('102','2','targetLang').
callRet('102','targetLang').
assign('t554','t555').
actual('103','1','a_R_38').
callRet('103','a_R_38').
actual('103','2','autoDisplay').
callRet('103','autoDisplay').
assign('t556','t557').
actual('104','1','a_R_38').
callRet('104','a_R_38').
actual('104','2','autoTrans').
callRet('104','autoTrans').
assign('t558','t559').
actual('105','1','a_R_38').
callRet('105','a_R_38').
actual('105','2','disabledLangs').
callRet('105','disabledLangs').
actual('105','3','K_R_?').
callRet('105','K_R_?').
assign('t560','t561').
actual('106','1','a_R_38').
callRet('106','a_R_38').
actual('106','2','disabledUrls').
callRet('106','disabledUrls').
actual('106','3','L_R_?').
callRet('106','L_R_?').
assign('t562','t563').
actual('107','1','a_R_38').
callRet('107','a_R_38').
actual('107','2','autoTransLangs').
callRet('107','autoTransLangs').
actual('107','3','K_R_?').
callRet('107','K_R_?').
assign('t564','t565').
actual('108','1','a_R_38').
callRet('108','a_R_38').
actual('108','2','autoTransUrls').
callRet('108','autoTransUrls').
actual('108','3','L_R_?').
callRet('108','L_R_?').
assign('t566','t567').
load('t569','this','noSave').
load('t570','localStorage_R_?','setItem_R_?').
load('t571','JSON_R_?','stringify_R_?').
load('t572','this','a').
actual('109','1','t572').
callRet('109','t572').
actual('110','1','user_options').
callRet('110','user_options').
actual('110','2','t573').
callRet('110','t573').
assign('t568','t575').
load('t577','this','s').
load('t578','this','s_R_?').
assign('t576','t580').
ptsTo('t581','n_M_R_?_5').
prototype('n_M_R_?_5', 'p_M_R_?').
assign('a_R_40','t581').
load('t582','a_R_40','noSave').
store('a_R_40','noSave','c_R_9').
methodRet('d_lambda_R_40','a_R_40').
load('t583','a_R_41','noSave').
store('a_R_41','noSave','f_R_?').
load('t585','a_R_41','p_R_?').
assign('t584','t586').
load('t587','a_R_41','noSave').
store('a_R_41','noSave','c_R_9').
actual('113','1','this').
callRet('113','this').
assign('t588','t589').
load('t590','this','s').
store('this','s','a_R_42').
methodRet('d_Q_R_43','P_R_9').
methodRet('d_R_R_44','G_R_?').
load('t591','b_R_45','split_R_?').
actual('114','1','.').
callRet('114','.').
assign('b_R_45','t592').
load('t594','b_R_45','j_R_?').
assign('t593','t596').
assign('d_R_45','h_R_?').
assign('e_R_?','0').
assign('t598','e_R_?').
assign('t597','t598').
load('t599','b_R_45','e_R_?').
load('t600','d_R_45','t599').
load('t601','b_R_45','e_R_?').
load('t602','d_R_45','t601').
assign('t602','__objectInit__').
assign('d_R_45','t603').
assign('d_R_45','h_R_?').
assign('e_R_?','0').
load('t604','d_R_45','b_R_45').
load('t605','t604','b_R_45').
load('t606','t605','j_R_?').
load('t607','t606','1').
store('t606','1','a_R_45').
load('t608','a_R_46','l_R_?').
load('t609','t608','b_R_46').
store('t608','b_R_46','d_R_46').
load('t610','a_R_47','m_R_?').
actual('115','1','{"regexp": "\\{\\{\\$.*?\\}\\}", "modifiers": "g"}').
callRet('115','{"regexp": "\\{\\{\\$.*?\\}\\}", "modifiers": "g"}').
actual('115','2','lambda_R_48').
callRet('115','lambda_R_48').
methodRet('d_q_R_47','t611').
ptsTo('lambda_R_48','d_lambda_R_48').
heapPtsTo('d_lambda_R_48','prototype','p_lambda_R_48').
prototype('p_lambda_R_48','h_FP').
methodRet('d_lambda_R_48','lambda_R_48').
formal('d_lambda_R_48','1','d_R_48').
load('t612','d_R_48','substr_R_?').
load('t613','d_R_48','j_R_?').
actual('116','1','3').
callRet('116','3').
actual('116','2','t614').
callRet('116','t614').
assign('d_R_48','t615').
load('t616','b_R_47','d_R_48').
actual('117','1','t616').
callRet('117','t616').
methodRet('d_lambda_R_48','t618').
load('t619','a_R_49','m_R_?').
actual('118','1','{"regexp": "\\\\", "modifiers": "g"}').
callRet('118','{"regexp": "\\\\", "modifiers": "g"}').
actual('118','2','\\').
callRet('118','\\').
load('t621','t620','m_R_?').
actual('119','1','{"regexp": """, "modifiers": "g"}').
callRet('119','{"regexp": """, "modifiers": "g"}').
actual('119','2','\"').
callRet('119','\"').
load('t623','t622','m_R_?').
actual('120','1','{"regexp": """, "modifiers": "g"}').
callRet('120','{"regexp": """, "modifiers": "g"}').
actual('120','2','\"').
callRet('120','\"').
load('t625','t624','m_R_?').
actual('121','1','{"regexp": "\\n", "modifiers": "g"}').
callRet('121','{"regexp": "\\n", "modifiers": "g"}').
actual('121','2','\n').
callRet('121','\n').
methodRet('d_u_R_49','t626').
actual('122','1','a_R_50').
callRet('122','a_R_50').
load('t628','t627','toLowerCase_R_?').
load('t630','t629','m_R_?').
actual('124','1','_').
callRet('124','_').
actual('124','2','-').
callRet('124','-').
assign('a_R_50','t631').
assign('t632','t633').
assign('t634','t635').
methodRet('d_H_R_50','zh-TW').
methodRet('d_H_R_50','zh-CN').
load('t636','a_R_50','indexOf_R_?').
actual('125','1','-').
callRet('125','-').
assign('b_R_50','t637').
load('t639','a_R_50','substring_R_?').
actual('126','1','0').
callRet('126','0').
actual('126','2','b_R_50').
callRet('126','b_R_50').
assign('(None, "a_R_50")','t640').
assign('a_R_50','a_R_50').
assign('t641','t642').
methodRet('d_H_R_50','zh-CN').
methodRet('d_H_R_50','a_R_50').
assign('b_R_51','h_R_?').
assign('t643','t644').
load('t646','arguments_R_?','j_R_?').
assign('t645','t647').
methodRet('d_A_R_51','lambda_R_52').
ptsTo('lambda_R_52','d_lambda_R_52').
heapPtsTo('d_lambda_R_52','prototype','p_lambda_R_52').
prototype('p_lambda_R_52','h_FP').
methodRet('d_lambda_R_52','lambda_R_52').
load('t648','Array_R_?','l_R_?').
load('t649','t648','slice').
load('t650','t649','call_R_?').
actual('127','1','arguments_R_?').
callRet('127','arguments_R_?').
actual('127','2','2').
callRet('127','2').
assign('d_R_51','t651').
methodRet('d_A_R_51','lambda_R_53').
ptsTo('lambda_R_53','d_lambda_R_53').
heapPtsTo('d_lambda_R_53','prototype','p_lambda_R_53').
prototype('p_lambda_R_53','h_FP').
methodRet('d_lambda_R_53','lambda_R_53').
load('t652','a_R_51','apply_R_?').
actual('128','1','b_R_51').
callRet('128','b_R_51').
actual('128','2','arguments_R_?').
callRet('128','arguments_R_?').
methodRet('d_lambda_R_52','t653').
load('t654','Array_R_?','l_R_?').
load('t655','t654','slice').
load('t656','t655','call_R_?').
actual('129','1','arguments_R_?').
callRet('129','arguments_R_?').
assign('e_R_53','t657').
load('t659','Array_R_?','l_R_?').
load('t660','t659','unshift').
load('t661','t660','apply_R_?').
actual('130','1','e_R_53').
callRet('130','e_R_53').
actual('130','2','d_R_51').
callRet('130','d_R_51').
assign('t658','t662').
load('t663','a_R_51','apply').
actual('131','1','b_R_51').
callRet('131','b_R_51').
actual('131','2','e_R_53').
callRet('131','e_R_53').
methodRet('d_lambda_R_53','t664').
load('t665','navigator_R_?','userAgent').
load('t666','t665','match_R_?').
actual('132','1','{"regexp": "Chrome\\/(\\d+)\\.(\\d+).(\\d+)?", "modifiers": ""}').
callRet('132','{"regexp": "Chrome\\/(\\d+)\\.(\\d+).(\\d+)?", "modifiers": ""}').
assign('a_R_54','t667').
store('b_R_?','0','0').
store('b_R_?','1','0').
store('b_R_?','2','0').
assign('b_R_?','b_R_?').
assign('t668','a_R_54').
load('t669','b_R_?','0').
load('t670','a_R_54','1').
actual('133','1','t670').
callRet('133','t670').
actual('133','2','10').
callRet('133','10').
store('b_R_?','0','t672').
load('t673','b_R_?','1').
load('t674','a_R_54','2').
actual('134','1','t674').
callRet('134','t674').
actual('134','2','10').
callRet('134','10').
store('b_R_?','1','t676').
load('t677','b_R_?','2').
load('t678','a_R_54','3').
actual('135','1','t678').
callRet('135','t678').
actual('135','2','10').
callRet('135','10').
store('b_R_?','2','t680').
methodRet('d_I_R_54','b_R_?').
assign('e_R_55','document').
ptsTo('f_R_56','d_f_R_56').
heapPtsTo('d_f_R_56','prototype','p_f_R_56').
prototype('p_f_R_56','h_FP').
methodRet('d_f_R_56','f_R_56').
formal('d_f_R_56','1','a_R_56').
formal('d_f_R_56','2','c_R_56').
ptsTo('g_R_57','d_g_R_57').
heapPtsTo('d_g_R_57','prototype','p_g_R_57').
prototype('p_g_R_57','h_FP').
methodRet('d_g_R_57','g_R_57').
formal('d_g_R_57','1','a_R_57').
formal('d_g_R_57','2','c_R_57').
assign('h_R_55','appendChild').
assign('i_R_?','length').
assign('j_R_?','prototype').
assign('k_R_?','selectedIndex').
assign('l_R_?','checked').
assign('m_R_?','value').
assign('n_R_?','style').
assign('o_R_?','options').
assign('p_R_?','createElement').
assign('q_R_?','firstChild').
assign('r_R_?','addEventListener').
ptsTo('s_R_58','d_s_R_58').
heapPtsTo('d_s_R_58','prototype','p_s_R_58').
prototype('p_s_R_58','h_FP').
methodRet('d_s_R_58','s_R_58').
assign('v_R_55','__undefined__').
ptsTo('w_R_59','d_w_R_59').
heapPtsTo('d_w_R_59','prototype','p_w_R_59').
prototype('p_w_R_59','h_FP').
methodRet('d_w_R_59','w_R_59').
formal('d_w_R_59','1','a_R_59').
formal('d_w_R_59','2','c_R_59').
formal('d_w_R_59','3','b_R_59').
ptsTo('x_R_60','d_x_R_60').
heapPtsTo('d_x_R_60','prototype','p_x_R_60').
prototype('p_x_R_60','h_FP').
methodRet('d_x_R_60','x_R_60').
formal('d_x_R_60','1','a_R_60').
formal('d_x_R_60','2','c_R_60').
formal('d_x_R_60','3','b_R_60').
ptsTo('y_R_61','d_y_R_61').
heapPtsTo('d_y_R_61','prototype','p_y_R_61').
prototype('p_y_R_61','h_FP').
methodRet('d_y_R_61','y_R_61').
formal('d_y_R_61','1','a_R_61').
formal('d_y_R_61','2','c_R_61').
formal('d_y_R_61','3','b_R_61').
formal('d_y_R_61','4','d_R_61').
ptsTo('B_R_62','d_B_R_62').
heapPtsTo('d_B_R_62','prototype','p_B_R_62').
prototype('p_B_R_62','h_FP').
methodRet('d_B_R_62','B_R_62').
formal('d_B_R_62','1','a_R_62').
load('t681','y_R_?','j_R_?').
load('t682','t681','n').
store('t681','n','lambda_R_63').
ptsTo('lambda_R_63','d_lambda_R_63').
heapPtsTo('d_lambda_R_63','prototype','p_lambda_R_63').
prototype('p_lambda_R_63','h_FP').
methodRet('d_lambda_R_63','lambda_R_63').
load('t683','y_R_?','j_R_?').
load('t684','t683','o').
store('t683','o','lambda_R_64').
ptsTo('lambda_R_64','d_lambda_R_64').
heapPtsTo('d_lambda_R_64','prototype','p_lambda_R_64').
prototype('p_lambda_R_64','h_FP').
methodRet('d_lambda_R_64','lambda_R_64').
ptsTo('D_R_65','d_D_R_65').
heapPtsTo('d_D_R_65','prototype','p_D_R_65').
prototype('p_D_R_65','h_FP').
methodRet('d_D_R_65','D_R_65').
formal('d_D_R_65','1','a_R_65').
formal('d_D_R_65','2','c_R_65').
formal('d_D_R_65','3','b_R_65').
ptsTo('E_R_66','d_E_R_66').
heapPtsTo('d_E_R_66','prototype','p_E_R_66').
prototype('p_E_R_66','h_FP').
methodRet('d_E_R_66','E_R_66').
formal('d_E_R_66','1','a_R_66').
load('t685','D_R_?','j_R_?').
load('t686','t685','q').
store('t685','q','lambda_R_67').
ptsTo('lambda_R_67','d_lambda_R_67').
heapPtsTo('d_lambda_R_67','prototype','p_lambda_R_67').
prototype('p_lambda_R_67','h_FP').
methodRet('d_lambda_R_67','lambda_R_67').
load('t687','D_R_?','j_R_?').
load('t688','t687','r').
store('t687','r','lambda_R_68').
ptsTo('lambda_R_68','d_lambda_R_68').
heapPtsTo('d_lambda_R_68','prototype','p_lambda_R_68').
prototype('p_lambda_R_68','h_FP').
methodRet('d_lambda_R_68','lambda_R_68').
load('t689','chrome','extension').
load('t690','t689','getBackgroundPage').
assign('F_R_55','t691').
ptsTo('G_R_69','d_G_R_69').
heapPtsTo('d_G_R_69','prototype','p_G_R_69').
prototype('p_G_R_69','h_FP').
methodRet('d_G_R_69','G_R_69').
load('t692','G_R_?','j_R_?').
load('t693','t692','g').
store('t692','g','lambda_R_70').
ptsTo('lambda_R_70','d_lambda_R_70').
heapPtsTo('d_lambda_R_70','prototype','p_lambda_R_70').
prototype('p_lambda_R_70','h_FP').
methodRet('d_lambda_R_70','lambda_R_70').
ptsTo('H_R_72','d_H_R_72').
heapPtsTo('d_H_R_72','prototype','p_H_R_72').
prototype('p_H_R_72','h_FP').
methodRet('d_H_R_72','H_R_72').
formal('d_H_R_72','1','a_R_72').
load('t694','G_R_?','j_R_?').
load('t695','t694','w').
store('t694','w','lambda_R_73').
ptsTo('lambda_R_73','d_lambda_R_73').
heapPtsTo('d_lambda_R_73','prototype','p_lambda_R_73').
prototype('p_lambda_R_73','h_FP').
methodRet('d_lambda_R_73','lambda_R_73').
load('t696','G_R_?','j_R_?').
load('t697','t696','s').
store('t696','s','lambda_R_74').
ptsTo('lambda_R_74','d_lambda_R_74').
heapPtsTo('d_lambda_R_74','prototype','p_lambda_R_74').
prototype('p_lambda_R_74','h_FP').
methodRet('d_lambda_R_74','lambda_R_74').
load('t698','G_R_?','j_R_?').
load('t699','t698','t').
store('t698','t','lambda_R_75').
ptsTo('lambda_R_75','d_lambda_R_75').
heapPtsTo('d_lambda_R_75','prototype','p_lambda_R_75').
prototype('p_lambda_R_75','h_FP').
methodRet('d_lambda_R_75','lambda_R_75').
load('t700','G_R_?','j_R_?').
load('t701','t700','v').
store('t700','v','lambda_R_76').
ptsTo('lambda_R_76','d_lambda_R_76').
heapPtsTo('d_lambda_R_76','prototype','p_lambda_R_76').
prototype('p_lambda_R_76','h_FP').
methodRet('d_lambda_R_76','lambda_R_76').
load('t702','G_R_?','j_R_?').
load('t703','t702','u').
store('t702','u','lambda_R_77').
ptsTo('lambda_R_77','d_lambda_R_77').
heapPtsTo('d_lambda_R_77','prototype','p_lambda_R_77').
prototype('p_lambda_R_77','h_FP').
methodRet('d_lambda_R_77','lambda_R_77').
ptsTo('I_R_78','d_I_R_78').
heapPtsTo('d_I_R_78','prototype','p_I_R_78').
prototype('p_I_R_78','h_FP').
methodRet('d_I_R_78','I_R_78').
formal('d_I_R_78','1','a_R_78').
actual('137','1','G_R_?').
callRet('137','G_R_?').
actual('137','2','OptionsControl').
callRet('137','OptionsControl').
assign('t704','t705').
load('t707','G_R_?','j_R_?').
load('t708','t707','g').
actual('138','1','G_R_?').
callRet('138','G_R_?').
actual('138','2','init').
callRet('138','init').
actual('138','3','t708').
callRet('138','t708').
assign('t706','t709').
ptsTo('z_R_79','d_z_R_79').
heapPtsTo('d_z_R_79','prototype','p_z_R_79').
prototype('p_z_R_79','h_FP').
methodRet('d_z_R_79','z_R_79').
formal('d_z_R_79','1','a_R_79').
ptsTo('J_R_80','d_J_R_80').
heapPtsTo('d_J_R_80','prototype','p_J_R_80').
prototype('p_J_R_80','h_FP').
methodRet('d_J_R_80','J_R_80').
formal('d_J_R_80','1','a_R_80').
formal('d_J_R_80','2','c_R_80').
ptsTo('K_R_81','d_K_R_81').
heapPtsTo('d_K_R_81','prototype','p_K_R_81').
prototype('p_K_R_81','h_FP').
methodRet('d_K_R_81','K_R_81').
formal('d_K_R_81','1','a_R_81').
formal('d_K_R_81','2','c_R_81').
formal('d_K_R_81','3','b_R_81').
ptsTo('A_R_82','d_A_R_82').
heapPtsTo('d_A_R_82','prototype','p_A_R_82').
prototype('p_A_R_82','h_FP').
methodRet('d_A_R_82','A_R_82').
formal('d_A_R_82','1','a_R_82').
formal('d_A_R_82','2','c_R_82').
ptsTo('C_R_84','d_C_R_84').
heapPtsTo('d_C_R_84','prototype','p_C_R_84').
prototype('p_C_R_84','h_FP').
methodRet('d_C_R_84','C_R_84').
formal('d_C_R_84','1','a_R_84').
formal('d_C_R_84','2','c_R_84').
load('t710','a_R_56','selectedIndex').
assign('t710','c_R_56').
methodRet('d_f_R_56','t710').
load('t711','a_R_57','display').
assign('t711','c_R_57').
methodRet('d_g_R_57','t711').
assign('v_R_55','t713').
methodRet('d_s_R_58','t714').
assign('d_R_59','0').
load('t715','e_R_55','p_R_?').
actual('139','1','option').
callRet('139','option').
assign('u_R_59','t716').
load('t717','u_R_59','value').
store('u_R_59','value','t_R_59').
load('t718','u_R_59','text').
load('t719','c_R_59','t_R_59').
store('u_R_59','text','t719').
load('t720','u_R_59','A').
assign('t721','d_R_59').
store('u_R_59','A','t721').
load('t723','a_R_59','h_R_55').
actual('140','1','u_R_59').
callRet('140','u_R_59').
assign('t722','t724').
assign('t725','t726').
load('t727','u_R_59','selected').
store('u_R_59','selected','true').
assign('t_R_59','__undefined__').
assign('t729','b_R_59').
assign('t728','t729').
assign('t732','1').
assign('None','t732').
actual('141','1','a_R_59').
callRet('141','a_R_59').
actual('141','2','0').
callRet('141','0').
assign('t730','t733').
load('t734','a_R_60','o_R_?').
load('t735','t734','b_R_60').
assign('d_R_60','t735').
load('t737','a_R_60','removeChild_R_?').
actual('142','1','d_R_60').
callRet('142','d_R_60').
assign('t736','t738').
load('t740','a_R_60','o_R_?').
load('t741','t740','b_R_60').
assign('None','b_R_60').
actual('143','1','a_R_60').
callRet('143','a_R_60').
actual('143','2','t742').
callRet('143','t742').
assign('t739','t743').
assign('a_R_60','false').
load('t745','c_R_60','o_R_?').
load('t746','t745','i_R_?').
assign('t744','t747').
assign('b_R_60','0').
assign('t749','b_R_60').
assign('t748','t749').
load('t751','d_R_60','A').
load('t752','c_R_60','o_R_?').
load('t753','t752','b_R_60').
load('t754','t753','A').
assign('t750','t755').
load('t757','c_R_60','insertBefore_R_?').
load('t758','c_R_60','o_R_?').
load('t759','t758','b_R_60').
actual('144','1','d_R_60').
callRet('144','d_R_60').
actual('144','2','t759').
callRet('144','t759').
assign('t756','t760').
actual('145','1','c_R_60').
callRet('145','c_R_60').
actual('145','2','b_R_60').
callRet('145','b_R_60').
assign('t761','t762').
assign('a_R_60','true').
assign('t764','a_R_60').
assign('t763','t764').
load('t766','c_R_60','h_R_55').
actual('146','1','d_R_60').
callRet('146','d_R_60').
assign('t765','t767').
load('t769','c_R_60','o_R_?').
load('t770','t769','i_R_?').
actual('147','1','c_R_60').
callRet('147','c_R_60').
actual('147','2','t771').
callRet('147','t771').
assign('t768','t772').
actual('148','1','langMapTemplate').
callRet('148','langMapTemplate').
load('t774','t773','m_R_?').
assign('t_R_61','t774').
load('t775','this','z').
store('this','z','a_R_61').
load('t776','b_R_61','selectId').
store('b_R_61','selectId','t777').
load('t778','b_R_61','listId').
store('b_R_61','listId','t779').
load('t780','b_R_61','addBtnId').
store('b_R_61','addBtnId','t781').
load('t782','b_R_61','removeBtnId').
store('b_R_61','removeBtnId','t783').
load('t784','c_R_61','innerHTML').
actual('153','1','t_R_61').
callRet('153','t_R_61').
actual('153','2','b_R_61').
callRet('153','b_R_61').
store('c_R_61','innerHTML','t785').
load('t786','this','b').
load('t787','b_R_61','selectId').
actual('154','1','t787').
callRet('154','t787').
store('this','b','t788').
load('t789','this','d').
load('t790','b_R_61','listId').
actual('155','1','t790').
callRet('155','t790').
store('this','d','t791').
load('t792','this','l').
load('t793','b_R_61','addBtnId').
actual('156','1','t793').
callRet('156','t793').
store('this','l','t794').
load('t795','this','m').
load('t796','b_R_61','removeBtnId').
actual('157','1','t796').
callRet('157','t796').
store('this','m','t797').
load('t799','this','b').
actual('158','1','t799').
callRet('158','t799').
actual('158','2','d_R_61').
callRet('158','d_R_61').
assign('t798','t800').
load('t801','a_R_61','list_R_?').
assign('a_R_61','t802').
load('t804','a_R_61','i_R_?').
assign('t803','t805').
assign('c_R_61','0').
assign('t807','c_R_61').
assign('t806','t807').
load('t808','a_R_61','c_R_61').
assign('b_R_61','t808').
load('t810','this','b').
load('t811','t810','o_R_?').
load('t812','t811','i_R_?').
assign('t809','t813').
assign('d_R_61','0').
assign('t815','d_R_61').
assign('t814','t815').
load('t817','this','b').
load('t818','t817','o_R_?').
load('t819','t818','d_R_61').
load('t820','t819','m_R_?').
assign('t816','t821').
load('t823','this','b').
load('t824','this','d').
actual('160','1','t823').
callRet('160','t823').
actual('160','2','t824').
callRet('160','t824').
actual('160','3','d_R_61').
callRet('160','d_R_61').
assign('t822','t825').
load('t827','this','b').
load('t828','t827','q_R_?').
assign('t826','t828').
load('t830','this','b').
actual('161','1','t830').
callRet('161','t830').
actual('161','2','0').
callRet('161','0').
assign('t829','t831').
actual('162','1','this').
callRet('162','this').
assign('t832','t833').
load('t835','this','l').
load('t836','t835','r_R_?').
load('t837','this','n').
actual('163','1','t837').
callRet('163','t837').
actual('163','2','this').
callRet('163','this').
actual('164','1','click').
callRet('164','click').
actual('164','2','t838').
callRet('164','t838').
assign('t834','t839').
load('t841','this','m').
load('t842','t841','r_R_?').
load('t843','this','o').
actual('165','1','t843').
callRet('165','t843').
actual('165','2','this').
callRet('165','this').
actual('166','1','click').
callRet('166','click').
actual('166','2','t844').
callRet('166','t844').
assign('t840','t845').
load('t846','a_R_62','l').
load('t847','t846','disabled').
load('t848','a_R_62','b').
load('t849','t848','q_R_?').
assign('t850','t849').
assign('(deque(["t846", "disabled"]), "t847")','disabled').
store('t846','disabled','').
load('t851','a_R_62','m').
load('t852','t851','disabled').
load('t853','a_R_62','d').
load('t854','t853','q_R_?').
assign('t855','t854').
assign('(deque(["t851", "disabled"]), "t852")','disabled').
store('t851','disabled','').
load('t857','this','b').
load('t858','t857','k_R_?').
assign('t860','t859').
assign('t856','t860').
load('t862','this','z').
load('t863','t862','add_R_?').
load('t864','this','b').
load('t865','t864','o_R_?').
load('t866','this','b').
load('t867','t866','k_R_?').
load('t868','t865','t867').
load('t869','t868','m_R_?').
actual('167','1','t869').
callRet('167','t869').
assign('t861','t870').
load('t872','this','b').
load('t873','this','d').
load('t874','this','b').
load('t875','t874','k_R_?').
actual('168','1','t872').
callRet('168','t872').
actual('168','2','t873').
callRet('168','t873').
actual('168','3','t875').
callRet('168','t875').
assign('t871','t876').
actual('169','1','this').
callRet('169','this').
assign('t877','t878').
load('t880','this','d').
load('t881','t880','k_R_?').
assign('t883','t882').
assign('t879','t883').
load('t885','this','z').
load('t886','t885','remove_R_?').
load('t887','this','d').
load('t888','t887','o_R_?').
load('t889','this','d').
load('t890','t889','k_R_?').
load('t891','t888','t890').
load('t892','t891','m_R_?').
actual('170','1','t892').
callRet('170','t892').
assign('t884','t893').
load('t895','this','d').
load('t896','this','b').
load('t897','this','d').
load('t898','t897','k_R_?').
actual('171','1','t895').
callRet('171','t895').
actual('171','2','t896').
callRet('171','t896').
actual('171','3','t898').
callRet('171','t898').
assign('t894','t899').
actual('172','1','this').
callRet('172','this').
assign('t900','t901').
actual('173','1','urlListTemplate').
callRet('173','urlListTemplate').
load('t903','t902','m_R_?').
assign('d_R_65','t903').
load('t904','this','F').
store('this','F','a_R_65').
load('t905','b_R_65','textId').
store('b_R_65','textId','t906').
load('t907','b_R_65','reChkId').
store('b_R_65','reChkId','t908').
load('t909','b_R_65','listId').
store('b_R_65','listId','t910').
load('t911','b_R_65','addBtnId').
store('b_R_65','addBtnId','t912').
load('t913','b_R_65','removeBtnId').
store('b_R_65','removeBtnId','t914').
load('t915','c_R_65','innerHTML').
actual('179','1','d_R_65').
callRet('179','d_R_65').
actual('179','2','b_R_65').
callRet('179','b_R_65').
store('c_R_65','innerHTML','t916').
load('t917','this','D').
load('t918','b_R_65','textId').
actual('180','1','t918').
callRet('180','t918').
store('this','D','t919').
load('t920','this','B').
load('t921','b_R_65','reChkId').
actual('181','1','t921').
callRet('181','t921').
store('this','B','t922').
load('t923','this','a').
load('t924','b_R_65','listId').
actual('182','1','t924').
callRet('182','t924').
store('this','a','t925').
load('t926','this','G').
load('t927','b_R_65','addBtnId').
actual('183','1','t927').
callRet('183','t927').
store('this','G','t928').
load('t929','this','p').
load('t930','b_R_65','removeBtnId').
actual('184','1','t930').
callRet('184','t930').
store('this','p','t931').
load('t932','a_R_65','list_R_?').
assign('a_R_65','t933').
load('t935','a_R_65','i_R_?').
assign('t934','t936').
assign('c_R_65','0').
assign('t938','c_R_65').
assign('t937','t938').
load('t939','a_R_65','c_R_65').
assign('b_R_65','t939').
load('t940','e_R_55','p_R_?').
actual('186','1','option').
callRet('186','option').
assign('d_R_65','t941').
load('t942','d_R_65','text').
load('t943','b_R_65','type').
assign('(deque(["d_R_65", "text"]), "t942")','[RE]').
load('t945','b_R_65','pattern').
store('d_R_65','text','t946').
load('t948','this','a').
load('t949','t948','h_R_55').
actual('187','1','d_R_65').
callRet('187','d_R_65').
assign('t947','t950').
actual('188','1','this').
callRet('188','this').
assign('t951','t952').
load('t954','this','G').
load('t955','t954','r_R_?').
load('t956','this','q').
actual('189','1','t956').
callRet('189','t956').
actual('189','2','this').
callRet('189','this').
actual('190','1','click').
callRet('190','click').
actual('190','2','t957').
callRet('190','t957').
assign('t953','t958').
load('t960','this','p').
load('t961','t960','r_R_?').
load('t962','this','r').
actual('191','1','t962').
callRet('191','t962').
actual('191','2','this').
callRet('191','this').
actual('192','1','click').
callRet('192','click').
actual('192','2','t963').
callRet('192','t963').
assign('t959','t964').
load('t965','a_R_66','p').
load('t966','t965','disabled').
load('t967','a_R_66','a').
load('t968','t967','q_R_?').
assign('t969','t968').
assign('(deque(["t965", "disabled"]), "t966")','disabled').
store('t965','disabled','').
load('t971','this','F').
load('t972','t971','add_R_?').
load('t973','this','B').
load('t974','t973','l_R_?').
assign('None','re').
load('t975','this','D').
load('t976','t975','m_R_?').
actual('193','1','str').
callRet('193','str').
actual('193','2','t976').
callRet('193','t976').
assign('t970','t977').
load('t978','e_R_55','p_R_?').
actual('194','1','option').
callRet('194','option').
assign('a_R_67','t979').
load('t980','a_R_67','text').
load('t981','this','B').
load('t982','t981','l_R_?').
assign('(deque(["a_R_67", "text"]), "t980")','[RE]').
load('t983','this','D').
load('t984','t983','m_R_?').
store('a_R_67','text','t985').
load('t987','this','a').
load('t988','t987','h_R_55').
actual('195','1','a_R_67').
callRet('195','a_R_67').
assign('t986','t989').
load('t991','this','a').
load('t992','this','a').
load('t993','t992','o_R_?').
load('t994','t993','i_R_?').
actual('196','1','t991').
callRet('196','t991').
actual('196','2','t995').
callRet('196','t995').
assign('t990','t996').
actual('197','1','this').
callRet('197','this').
assign('t997','t998').
load('t1000','this','a').
load('t1001','t1000','k_R_?').
assign('t1003','t1002').
assign('t999','t1003').
load('t1005','this','F').
load('t1006','t1005','remove_R_?').
load('t1007','this','a').
load('t1008','t1007','k_R_?').
actual('198','1','t1008').
callRet('198','t1008').
assign('t1004','t1009').
load('t1010','this','a').
load('t1011','t1010','k_R_?').
assign('a_R_68','t1011').
load('t1013','this','a').
load('t1014','t1013','removeChild_R_?').
load('t1015','this','a').
load('t1016','t1015','o_R_?').
load('t1017','this','a').
load('t1018','t1017','k_R_?').
load('t1019','t1016','t1018').
actual('199','1','t1019').
callRet('199','t1019').
assign('t1012','t1020').
load('t1022','this','a').
load('t1023','this','a').
load('t1024','t1023','o_R_?').
load('t1025','t1024','a_R_68').
assign('None','a_R_68').
actual('200','1','t1022').
callRet('200','t1022').
actual('200','2','t1026').
callRet('200','t1026').
assign('t1021','t1027').
actual('201','1','this').
callRet('201','this').
assign('t1028','t1029').
load('t1030','this','c').
load('t1031','F_R_55','translate').
load('t1032','t1031','getUserOptions_R_?').
load('t1034','t1033','clone_R_?').
store('this','c','t1035').
load('t1036','this','k').
actual('204','1','targetLangSel').
callRet('204','targetLangSel').
store('this','k','t1037').
load('t1038','this','e').
actual('205','1','autoDisplayChk').
callRet('205','autoDisplayChk').
store('this','e','t1039').
load('t1040','this','f').
actual('206','1','autoTransChk').
callRet('206','autoTransChk').
store('this','f','t1041').
load('t1042','this','h').
actual('207','1','autoDisplayMoreDiv').
callRet('207','autoDisplayMoreDiv').
store('this','h','t1043').
load('t1044','this','i').
actual('208','1','autoTransDiv').
callRet('208','autoTransDiv').
store('this','i','t1045').
load('t1046','this','H').
actual('209','1','saveBtn').
callRet('209','saveBtn').
store('this','H','t1047').
load('t1048','this','C').
actual('210','1','saveStatus').
callRet('210','saveStatus').
store('this','C','t1049').
load('t1050','window','_callback_').
actual('211','1','lambda_R_71').
callRet('211','lambda_R_71').
actual('211','2','this').
callRet('211','this').
store('window','_callback_','t1051').
ptsTo('lambda_R_71','d_lambda_R_71').
heapPtsTo('d_lambda_R_71','prototype','p_lambda_R_71').
prototype('p_lambda_R_71','h_FP').
methodRet('d_lambda_R_71','lambda_R_71').
formal('d_lambda_R_71','1','c_R_71').
load('t1052','e_R_55','p_R_?').
actual('212','1','script').
callRet('212','script').
assign('a_R_70','t1053').
load('t1054','a_R_70','charset').
store('a_R_70','charset','UTF-8').
load('t1055','a_R_70','src').
store('a_R_70','src','http://translate.google.com/translate_a/l?client=tee&cb=_callback_').
load('t1057','e_R_55','getElementsByTagName_R_?').
actual('213','1','head').
callRet('213','head').
load('t1059','t1058','0').
load('t1060','t1059','h_R_55').
actual('214','1','a_R_70').
callRet('214','a_R_70').
assign('t1056','t1061').
load('t1062','this','j').
load('t1063','c_R_71','tl').
store('this','j','t1063').
actual('215','1','this').
callRet('215','this').
assign('t1064','t1065').
load('t1067','a_R_72','k').
load('t1068','a_R_72','j').
load('t1069','a_R_72','c').
load('t1070','t1069','targetLang_R_?').
actual('217','1','t1067').
callRet('217','t1067').
actual('217','2','t1068').
callRet('217','t1068').
actual('217','3','t1072').
callRet('217','t1072').
assign('t1066','t1073').
load('t1075','a_R_72','k').
load('t1076','t1075','r_R_?').
load('t1077','a_R_72','w').
actual('218','1','t1077').
callRet('218','t1077').
actual('218','2','a_R_72').
callRet('218','a_R_72').
actual('219','1','change').
callRet('219','change').
actual('219','2','t1078').
callRet('219','t1078').
assign('t1074','t1079').
load('t1080','a_R_72','e').
load('t1081','t1080','checked').
load('t1082','a_R_72','c').
load('t1083','t1082','autoDisplay_R_?').
store('t1080','checked','t1084').
load('t1086','a_R_72','e').
load('t1087','t1086','r_R_?').
load('t1088','a_R_72','s').
actual('221','1','t1088').
callRet('221','t1088').
actual('221','2','a_R_72').
callRet('221','a_R_72').
actual('222','1','change').
callRet('222','change').
actual('222','2','t1089').
callRet('222','t1089').
assign('t1085','t1090').
load('t1091','a_R_72','f').
load('t1092','t1091','checked').
load('t1093','a_R_72','c').
load('t1094','t1093','autoTrans_R_?').
store('t1091','checked','t1095').
load('t1097','a_R_72','f').
load('t1098','t1097','r_R_?').
load('t1099','a_R_72','t').
actual('224','1','t1099').
callRet('224','t1099').
actual('224','2','a_R_72').
callRet('224','a_R_72').
actual('225','1','change').
callRet('225','change').
actual('225','2','t1100').
callRet('225','t1100').
assign('t1096','t1101').
load('t1102','a_R_72','I').
load('t1103','a_R_72','c').
load('t1104','t1103','disabledLangs_R_?').
load('t1106','a_R_72','h').
load('t1107','t1106','q_R_?').
store('t1102','title_R_?','Excluded languages:').
load('t1108','a_R_72','j').
ptsTo('t1109','n_y_R_?_6').
prototype('n_y_R_?_6', 'p_y_R_?').
actual('227','1','t1105').
callRet('227','t1105').
actual('227','2','t1107').
callRet('227','t1107').
actual('227','3','__objectInit__').
callRet('227','__objectInit__').
actual('227','4','t1108').
callRet('227','t1108').
store('a_R_72','I','t1109').
load('t1110','a_R_72','J').
load('t1111','a_R_72','c').
load('t1112','t1111','disabledUrls_R_?').
load('t1114','a_R_72','h').
load('t1115','t1114','lastChild').
store('t1110','title_R_?','Excluded URLs:').
ptsTo('t1116','n_D_R_?_7').
prototype('n_D_R_?_7', 'p_D_R_?').
actual('228','1','t1113').
callRet('228','t1113').
actual('228','2','t1115').
callRet('228','t1115').
actual('228','3','__objectInit__').
callRet('228','__objectInit__').
store('a_R_72','J','t1116').
load('t1117','a_R_72','K').
load('t1118','a_R_72','c').
load('t1119','t1118','autoTransLangs_R_?').
load('t1121','a_R_72','i').
load('t1122','t1121','q_R_?').
store('t1117','title_R_?','Included languages:').
load('t1123','a_R_72','j').
ptsTo('t1124','n_y_R_?_8').
prototype('n_y_R_?_8', 'p_y_R_?').
actual('229','1','t1120').
callRet('229','t1120').
actual('229','2','t1122').
callRet('229','t1122').
actual('229','3','__objectInit__').
callRet('229','__objectInit__').
actual('229','4','t1123').
callRet('229','t1123').
store('a_R_72','K','t1124').
load('t1125','a_R_72','L').
load('t1126','a_R_72','c').
load('t1127','t1126','autoTransUrls_R_?').
load('t1129','a_R_72','i').
load('t1130','t1129','lastChild').
store('t1125','title_R_?','Included URLs:').
ptsTo('t1131','n_D_R_?_9').
prototype('n_D_R_?_9', 'p_D_R_?').
actual('230','1','t1128').
callRet('230','t1128').
actual('230','2','t1130').
callRet('230','t1130').
actual('230','3','__objectInit__').
callRet('230','__objectInit__').
store('a_R_72','L','t1131').
load('t1133','a_R_72','H').
load('t1134','t1133','r_R_?').
load('t1135','a_R_72','v').
actual('230','1','t1135').
callRet('230','t1135').
actual('230','2','a_R_72').
callRet('230','a_R_72').
actual('231','1','click').
callRet('231','click').
actual('231','2','t1136').
callRet('231','t1136').
assign('t1132','t1137').
load('t1139','a_R_72','c').
load('t1140','t1139','setOnSave_R_?').
load('t1141','a_R_72','u').
actual('232','1','t1141').
callRet('232','t1141').
actual('232','2','a_R_72').
callRet('232','a_R_72').
actual('233','1','t1142').
callRet('233','t1142').
assign('t1138','t1143').
actual('234','1','a_R_72').
callRet('234','a_R_72').
assign('t1144','t1145').
load('t1147','this','c').
load('t1148','t1147','set_targetLang_R_?').
load('t1149','this','k').
load('t1150','t1149','m_R_?').
actual('235','1','t1150').
callRet('235','t1150').
assign('t1146','t1151').
load('t1153','this','c').
load('t1154','t1153','set_autoDisplay_R_?').
load('t1155','this','e').
load('t1156','t1155','l_R_?').
actual('236','1','t1156').
callRet('236','t1156').
assign('t1152','t1157').
actual('237','1','this').
callRet('237','this').
assign('t1158','t1159').
load('t1161','this','c').
load('t1162','t1161','set_autoTrans_R_?').
load('t1163','this','f').
load('t1164','t1163','l_R_?').
actual('238','1','t1164').
callRet('238','t1164').
assign('t1160','t1165').
actual('239','1','this').
callRet('239','this').
assign('t1166','t1167').
load('t1169','F_R_55','translate').
load('t1170','t1169','getUserOptions_R_?').
load('t1172','t1171','assign_R_?').
load('t1173','this','c').
actual('241','1','t1173').
callRet('241','t1173').
assign('t1168','t1174').
load('t1176','this','C').
load('t1177','t1176','n_R_?').
actual('242','1','t1177').
callRet('242','t1177').
actual('242','2','').
callRet('242','None').
assign('t1175','t1178').
load('t1180','this','C').
load('t1181','t1180','n_R_?').
actual('243','1','t1181').
callRet('243','t1181').
actual('243','2','none').
callRet('243','none').
assign('t1179','t1182').
load('t1184','a_R_78','e').
load('t1185','t1184','l_R_?').
assign('t1186','t1185').
assign('t1183','t1186').
load('t1188','a_R_78','h').
load('t1189','t1188','n_R_?').
actual('244','1','t1189').
callRet('244','t1189').
actual('244','2','none').
callRet('244','none').
assign('t1187','t1190').
load('t1192','a_R_78','f').
load('t1193','t1192','l_R_?').
assign('t1194','t1193').
assign('t1191','t1194').
load('t1196','a_R_78','i').
load('t1197','t1196','n_R_?').
actual('245','1','t1197').
callRet('245','t1197').
actual('245','2','none').
callRet('245','none').
assign('t1195','t1198').
load('t1199','e_R_55','getElementById_R_?').
actual('246','1','a_R_79').
callRet('246','a_R_79').
methodRet('d_z_R_79','t1200').
load('t1201','c_R_80','split_R_?').
actual('247','1','.').
callRet('247','.').
assign('c_R_80','t1202').
load('t1204','c_R_80','i_R_?').
assign('t1203','t1206').
assign('b_R_80','window').
assign('d_R_?','0').
assign('t1208','d_R_?').
assign('t1207','t1208').
load('t1209','c_R_80','d_R_?').
load('t1210','b_R_80','t1209').
load('t1211','c_R_80','d_R_?').
load('t1212','b_R_80','t1211').
assign('t1212','__objectInit__').
assign('b_R_80','t1213').
assign('b_R_80','window').
assign('d_R_?','0').
load('t1214','b_R_80','c_R_80').
load('t1215','t1214','c_R_80').
load('t1216','t1215','i_R_?').
load('t1217','t1216','1').
store('t1216','1','a_R_80').
load('t1218','a_R_81','j_R_?').
load('t1219','t1218','c_R_81').
store('t1218','c_R_81','b_R_81').
load('t1220','a_R_82','replace_R_?').
actual('248','1','{"regexp": "\\{\\{\\$.*?\\}\\}", "modifiers": "g"}').
callRet('248','{"regexp": "\\{\\{\\$.*?\\}\\}", "modifiers": "g"}').
actual('248','2','lambda_R_83').
callRet('248','lambda_R_83').
methodRet('d_A_R_82','t1221').
ptsTo('lambda_R_83','d_lambda_R_83').
heapPtsTo('d_lambda_R_83','prototype','p_lambda_R_83').
prototype('p_lambda_R_83','h_FP').
methodRet('d_lambda_R_83','lambda_R_83').
formal('d_lambda_R_83','1','b_R_83').
load('t1222','b_R_83','substr_R_?').
load('t1223','b_R_83','i_R_?').
actual('249','1','3').
callRet('249','3').
actual('249','2','t1224').
callRet('249','t1224').
assign('b_R_83','t1225').
load('t1226','c_R_82','b_R_83').
actual('250','1','t1226').
callRet('250','t1226').
methodRet('d_lambda_R_83','t1228').
assign('c_R_84','window').
assign('t1229','t1230').
load('t1232','arguments_R_?','i_R_?').
assign('t1231','t1233').
methodRet('d_C_R_84','lambda_R_85').
ptsTo('lambda_R_85','d_lambda_R_85').
heapPtsTo('d_lambda_R_85','prototype','p_lambda_R_85').
prototype('p_lambda_R_85','h_FP').
methodRet('d_lambda_R_85','lambda_R_85').
load('t1234','Array_R_?','j_R_?').
load('t1235','t1234','slice').
load('t1236','t1235','call_R_?').
actual('251','1','arguments_R_?').
callRet('251','arguments_R_?').
actual('251','2','2').
callRet('251','2').
assign('b_R_84','t1237').
methodRet('d_C_R_84','lambda_R_86').
ptsTo('lambda_R_86','d_lambda_R_86').
heapPtsTo('d_lambda_R_86','prototype','p_lambda_R_86').
prototype('p_lambda_R_86','h_FP').
methodRet('d_lambda_R_86','lambda_R_86').
load('t1238','a_R_84','apply_R_?').
actual('252','1','c_R_84').
callRet('252','c_R_84').
actual('252','2','arguments_R_?').
callRet('252','arguments_R_?').
methodRet('d_lambda_R_85','t1239').
load('t1240','Array_R_?','j_R_?').
load('t1241','t1240','slice').
load('t1242','t1241','call_R_?').
actual('253','1','arguments_R_?').
callRet('253','arguments_R_?').
assign('d_R_86','t1243').
load('t1245','Array_R_?','j_R_?').
load('t1246','t1245','unshift').
load('t1247','t1246','apply_R_?').
actual('254','1','d_R_86').
callRet('254','d_R_86').
actual('254','2','b_R_84').
callRet('254','b_R_84').
assign('t1244','t1248').
load('t1249','a_R_84','apply').
actual('255','1','c_R_84').
callRet('255','c_R_84').
actual('255','2','d_R_86').
callRet('255','d_R_86').
methodRet('d_lambda_R_86','t1250').
load('t1252','changeInfo_R_87','status').
assign('t1251','t1253').
load('t1255','translate_R_?','getTranslateManager_R_?').
load('t1257','t1256','attach_R_?').
actual('257','1','tabId_R_87').
callRet('257','tabId_R_87').
actual('257','2','tab_R_87').
callRet('257','tab_R_87').
actual('257','3','page_load').
callRet('257','page_load').
assign('t1254','t1258').
load('t1260','translate_R_?','getTranslateManager_R_?').
load('t1262','t1261','detach_R_?').
actual('259','1','tabId_R_88').
callRet('259','tabId_R_88').
assign('t1259','t1263').
load('t1265','translate_R_?','getTranslateManager_R_?').
load('t1267','t1266','attach_R_?').
load('t1268','tab_R_89','id').
actual('261','1','t1268').
callRet('261','t1268').
actual('261','2','tab_R_89').
callRet('261','tab_R_89').
actual('261','3','user_click').
callRet('261','user_click').
assign('t1264','t1269').
load('t1271','request_R_90','disabledLang').
assign('t1270','t1271').
load('t1273','translate_R_?','getUserOptions_R_?').
load('t1275','t1274','disabledLangs_R_?').
load('t1277','t1276','add_R_?').
load('t1278','request_R_90','disabledLang').
actual('264','1','t1278').
callRet('264','t1278').
assign('t1272','t1279').
load('t1280','document','getElementById_R_?').
actual('265','1','id_R_91').
callRet('265','id_R_91').
load('t1282','t1281','style').
assign('style_R_91','t1282').
load('t1283','style_R_91','display').
load('t1284','style_R_91','display').
assign('(deque(["style_R_91", "display"]), "t1283")','').
store('style_R_91','display','none').
load('t1285','document','getElementById_R_?').
actual('266','1','_added_by_transform_0').
callRet('266','_added_by_transform_0').
assign('temp_R_92','t1286').
load('t1288','temp_R_92','addEventListener_R_?').
actual('267','1','load').
callRet('267','load').
actual('267','2','lambda_R_93').
callRet('267','lambda_R_93').
assign('t1287','t1289').
ptsTo('lambda_R_93','d_lambda_R_93').
heapPtsTo('d_lambda_R_93','prototype','p_lambda_R_93').
prototype('p_lambda_R_93','h_FP').
methodRet('d_lambda_R_93','lambda_R_93').
formal('d_lambda_R_93','1','event_R_93').
ptsTo('t1291','n_OptionsControl_R_?_10').
prototype('n_OptionsControl_R_?_10', 'p_OptionsControl_R_?').
load('t1292','t1291','init_R_?').
assign('t1290','t1293').
load('t1294','document','getElementById_R_?').
actual('269','1','_added_by_transform_1').
callRet('269','_added_by_transform_1').
assign('temp_R_94','t1295').
load('t1297','temp_R_94','addEventListener_R_?').
actual('270','1','click').
callRet('270','click').
actual('270','2','lambda_R_95').
callRet('270','lambda_R_95').
assign('t1296','t1298').
ptsTo('lambda_R_95','d_lambda_R_95').
heapPtsTo('d_lambda_R_95','prototype','p_lambda_R_95').
prototype('p_lambda_R_95','h_FP').
methodRet('d_lambda_R_95','lambda_R_95').
formal('d_lambda_R_95','1','event_R_95').
load('t1300','history_R_?','go_R_?').
actual('271','1','0').
callRet('271','0').
assign('t1299','t1301').
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

