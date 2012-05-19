assign('doRequest_R_0','lambda_R_1').
ptsTo('lambda_R_1','d_lambda_R_1').
heapPtsTo('d_lambda_R_1','prototype','p_lambda_R_1').
prototype('p_lambda_R_1','h_FP').
methodRet('d_lambda_R_1','lambda_R_1').
formal('d_lambda_R_1','1','url_R_1').
formal('d_lambda_R_1','2','callback_R_1').
assign('updateBadge_R_0','lambda_R_3').
ptsTo('lambda_R_3','d_lambda_R_3').
heapPtsTo('d_lambda_R_3','prototype','p_lambda_R_3').
prototype('p_lambda_R_3','h_FP').
methodRet('d_lambda_R_3','lambda_R_3').
formal('d_lambda_R_3','1','tabId_R_3').
assign('updateBrowserAction_R_0','lambda_R_4').
ptsTo('lambda_R_4','d_lambda_R_4').
heapPtsTo('d_lambda_R_4','prototype','p_lambda_R_4').
prototype('p_lambda_R_4','h_FP').
methodRet('d_lambda_R_4','lambda_R_4').
formal('d_lambda_R_4','1','tabId_R_4').
load('t1','chrome','extension').
load('t2','t1','onRequest').
load('t3','t2','addListener').
actual('0','1','lambda_R_8').
callRet('0','lambda_R_8').
assign('t0','t4').
ptsTo('lambda_R_8','d_lambda_R_8').
heapPtsTo('d_lambda_R_8','prototype','p_lambda_R_8').
prototype('p_lambda_R_8','h_FP').
methodRet('d_lambda_R_8','lambda_R_8').
formal('d_lambda_R_8','1','request_R_8').
formal('d_lambda_R_8','2','sender_R_8').
formal('d_lambda_R_8','3','sendResponse_R_8').
assign('t5','t6').
ptsTo('lambda_R_12','d_lambda_R_12').
heapPtsTo('d_lambda_R_12','prototype','p_lambda_R_12').
prototype('p_lambda_R_12','h_FP').
methodRet('d_lambda_R_12','lambda_R_12').
load('t8','window','AMZUWLXT').
assign('t7','t9').
assign('AMZUWLXT_R_0','__objectInit__').
load('t10','AMZUWLXT_R_0','Locale').
store('t11','US','us').
store('t11','DE','de').
store('t11','FR','fr').
store('t11','GB','uk').
store('t11','CA','ca').
store('t11','CN','cn').
store('t11','JP','jp').
store('t11','IT','it').
store('t10','_locale_defaults_R_?','t11').
store('t12','en','us').
store('t12','ja','jp').
store('t12','fr','fr').
store('t12','de','de').
store('t12','zh','cn').
store('t12','it','it').
store('t10','_lang_defaults_R_?','t12').
store('t13','us','').
store('t14','fr','frCA').
store('t14','en','enCA').
store('t14','default','enCA').
store('t13','ca','t14').
store('t13','de','deDE').
store('t13','fr','frFR').
store('t13','cn','zhCN').
store('t15','ja','jaJP').
store('t15','en','enJP').
store('t15','default','enJP').
store('t13','jp','t15').
store('t13','uk','enGB').
store('t13','it','itIT').
store('t10','_bookmarklet_langs_R_?','t13').
store('t16','us','www.amazon.com').
store('t16','ca','www.amazon.ca').
store('t16','de','www.amazon.de').
store('t16','fr','www.amazon.fr').
store('t16','uk','www.amazon.co.uk').
store('t16','cn','www.amazon.cn').
store('t16','jp','www.amazon.co.jp').
store('t16','it','www.amazon.it').
store('t10','_locale_domains_R_?','t16').
store('t10','resolveLocale_R_?','lambda_R_13').
store('t10','getDefaultLocale_R_?','lambda_R_14').
store('t10','getLanguageMapping_R_?','lambda_R_15').
store('t10','getLocaleDomain_R_?','lambda_R_16').
store('t10','getLanguage_R_?','lambda_R_17').
store('AMZUWLXT_R_0','Locale','__objectInit__').
ptsTo('lambda_R_13','d_lambda_R_13').
heapPtsTo('d_lambda_R_13','prototype','p_lambda_R_13').
prototype('p_lambda_R_13','h_FP').
methodRet('d_lambda_R_13','lambda_R_13').
formal('d_lambda_R_13','1','locale_R_13').
formal('d_lambda_R_13','2','lang_R_13').
ptsTo('lambda_R_14','d_lambda_R_14').
heapPtsTo('d_lambda_R_14','prototype','p_lambda_R_14').
prototype('p_lambda_R_14','h_FP').
methodRet('d_lambda_R_14','lambda_R_14').
formal('d_lambda_R_14','1','lang_R_14').
ptsTo('lambda_R_15','d_lambda_R_15').
heapPtsTo('d_lambda_R_15','prototype','p_lambda_R_15').
prototype('p_lambda_R_15','h_FP').
methodRet('d_lambda_R_15','lambda_R_15').
formal('d_lambda_R_15','1','locale_R_15').
formal('d_lambda_R_15','2','lang_R_15').
ptsTo('lambda_R_16','d_lambda_R_16').
heapPtsTo('d_lambda_R_16','prototype','p_lambda_R_16').
prototype('p_lambda_R_16','h_FP').
methodRet('d_lambda_R_16','lambda_R_16').
formal('d_lambda_R_16','1','locale_R_16').
formal('d_lambda_R_16','2','lang_R_16').
ptsTo('lambda_R_17','d_lambda_R_17').
heapPtsTo('d_lambda_R_17','prototype','p_lambda_R_17').
prototype('p_lambda_R_17','h_FP').
methodRet('d_lambda_R_17','lambda_R_17').
formal('d_lambda_R_17','1','lang_R_17').
load('t18','window','AMZUWLXT').
assign('t17','t19').
assign('AMZUWLXT_R_0','__objectInit__').
load('t20','AMZUWLXT_R_0','Settings').
store('t21','localeChanged','false').
store('t21','pushed','false').
store('t21','push','false').
store('t21','notify','true').
store('t21','locale','us').
store('t20','defaults_R_?','t21').
store('t23','us','1').
store('t23','de','1').
store('t23','fr','1').
store('t23','ca','1').
store('t23','jp','1').
store('t23','uk','1').
store('t23','cn','1').
store('t23','it','1').
store('t22','locale','t23').
store('t20','validation_R_?','t22').
store('t20','get_R_?','lambda_R_18').
store('t20','set_R_?','lambda_R_19').
store('t20','equals_R_?','lambda_R_20').
store('AMZUWLXT_R_0','Settings','__objectInit__').
ptsTo('lambda_R_18','d_lambda_R_18').
heapPtsTo('d_lambda_R_18','prototype','p_lambda_R_18').
prototype('p_lambda_R_18','h_FP').
methodRet('d_lambda_R_18','lambda_R_18').
ptsTo('lambda_R_19','d_lambda_R_19').
heapPtsTo('d_lambda_R_19','prototype','p_lambda_R_19').
prototype('p_lambda_R_19','h_FP').
methodRet('d_lambda_R_19','lambda_R_19').
formal('d_lambda_R_19','1','writeSettings_R_19').
ptsTo('lambda_R_20','d_lambda_R_20').
heapPtsTo('d_lambda_R_20','prototype','p_lambda_R_20').
prototype('p_lambda_R_20','h_FP').
methodRet('d_lambda_R_20','lambda_R_20').
formal('d_lambda_R_20','1','compareSettings_R_20').
load('t25','window','AMZUWLXT').
assign('t24','t26').
assign('AMZUWLXT_R_0','__objectInit__').
load('t28','AMZUWLXT_R_0','Strings').
assign('t27','t29').
load('t30','AMZUWLXT_R_0','Strings').
store('AMZUWLXT_R_0','Strings','__objectInit__').
load('t31','AMZUWLXT_R_0','Strings').
load('t32','t31','process').
store('t31','process','lambda_R_21').
ptsTo('lambda_R_21','d_lambda_R_21').
heapPtsTo('d_lambda_R_21','prototype','p_lambda_R_21').
prototype('p_lambda_R_21','h_FP').
methodRet('d_lambda_R_21','lambda_R_21').
formal('d_lambda_R_21','1','content_R_21').
formal('d_lambda_R_21','2','locale_R_21').
formal('d_lambda_R_21','3','vars_R_21').
load('t33','AMZUWLXT_R_0','Strings').
load('t34','t33','lookup').
store('t33','lookup','lambda_R_24').
ptsTo('lambda_R_24','d_lambda_R_24').
heapPtsTo('d_lambda_R_24','prototype','p_lambda_R_24').
prototype('p_lambda_R_24','h_FP').
methodRet('d_lambda_R_24','lambda_R_24').
formal('d_lambda_R_24','1','string_R_24').
formal('d_lambda_R_24','2','language_R_24').
formal('d_lambda_R_24','3','vars_R_24').
load('t35','AMZUWLXT_R_0','Strings').
load('t36','t35','strings').
store('t37','en','Whenever you visit a product page, you"ll see the &quot;Add to Amazon Wish List&quot; button animate in the top right corner of your browser as a reminder that you can add any item, from any website to your ${wishlist-link}').
store('t37','fr','Chaque fois que vous vous rendrez sur une page produit, vous verrez le bouton &laquo;&nbsp;Ajouter &agrave; votre Liste d"envies Amazon&nbsp;&raquo; s"animer 
dans le coin situ&eacute; en haut &agrave; droite de votre navigateur. Cette animation a pour but de vous rappeler que vous pouvez ajouter &agrave; votre ${wishlist-link} n"importe quel article depuis n"importe quel site Internet.').
store('t37','it','Ogni volta che si visita una pagina prodotto il pulsante &quot;Aggiungi alla Lista Desideri&quot;, che si trova nella parte superieore destra della pagina si animer&agrave;. Questo per ricordare che &egrave; possibile aggiungere alla propria ${wishlist-link} prodotti da qualsiasi sito web.').
store('t37','de','Immer wenn Sie eine Produktseite besuchen, erscheint der Button &quot;Auf meinen Wunschzettel&quot; oben in Ihrem Browser. Er erinnert Sie daran, dass Sie jeden beliebigen Artikel von jeder Website auf Ihren ${wishlist-link} setzen k&ouml;nnen.').
store('t37','ja','&#x307B;&#x304B;&#x306E;&#x30B5;&#x30A4;&#x30C8;&#x306E;&#x5546;&#x54C1;&#x30DA;&#x30FC;&#x30B8;&#x306B;&#x884C;&#x304F;&#x3068;&#x3001;&#x30D6;&#x30E9;&#x30A6;&#x30B6;&#x53F3;&#x4E0A;&#x306E;&#x300C;&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;&#x306B;&#x8FFD;&#x52A0;&#x3059;&#x308B;&#x300D;&#x3068;&#x3044;&#x3046;&#x30DC;&#x30BF;&#x30F3;&#x306B;&#x300C;+&#x300D;&#x306E;&#x8A18;&#x53F7;&#x304C;&#x30A2;&#x30CB;&#x30E1;&#x30FC;&#x30B7;&#x30E7;&#x30F3;&#x8868;&#x793A;&#x3055;&#x308C;&#x307E;&#x3059;&#x3002;&#x3053;&#x306E;&#x8A18;&#x53F7;&#x306B;&#x3088;&#x3063;&#x3066;&#x3001;&#x5546;&#x54C1;&#x3092;&#x898B;&#x9003;&#x3059;&#x3053;&#x3068;&#x306A;&#x304F; ${wishlist-link} &#x306B;&#x8FFD;&#x52A0;&#x3059;&#x308B;&#x3053;&#x3068;&#x304C;&#x3067;&#x304D;&#x307E;&#x3059;&#x3002;').
store('t37','zh','&#x5F53;&#x60A8;&#x8BBF;&#x95EE;&#x4EFB;&#x4F55;&#x4E00;&#x4E2A;&#x7F51;&#x7AD9;&#x7684;&#x5546;&#x54C1;&#x8BE6;&#x60C5;&#x9875;&#x65F6;&#xFF0C;&#x60A8;&#x90FD;&#x53EF;&#x4EE5;&#x770B;&#x5230;&#x6D4F;&#x89C8;&#x5668;&#x7684;&#x53F3;&#x4E0A;&#x89D2;&#x51FA;&#x73B0;&ldquo;&#x52A0;&#x5165;&#x5FC3;&#x613F;&#x5355;&rdquo;&#x6309;&#x94AE;&#x7684;&#x52A8;&#x6001;&#x63D0;&#x793A;&#xFF0C;&#x63D0;&#x9192;&#x60A8;&#x53EF;&#x4EE5;&#x5C06;&#x4EFB;&#x4F55;&#x7F51;&#x7AD9;&#x7684;&#x4EFB;&#x4F55;&#x5546;&#x54C1;&#x6DFB;&#x52A0;&#x5230;&#x60A8;&#x7684;&#x5353;&#x8D8A;&#x4E9A;&#x9A6C;&#x900A; ${wishlist-link}&#x3002;').
store('t37','en_gb','Whenever you visit a product page, you"ll see the &quot;Add to Amazon Wish List&quot; button animate in the top right corner of your browser as a reminder that you can add any item, from any website to your ${wishlist-link}').
store('t36','uwl-ext-chrome-pushdown-content-chrome','t37').
store('t38','en','Location').
store('t38','fr','Adresse').
store('t38','it','Posizione').
store('t38','de','Website').
store('t38','ja','&#x30ED;&#x30B1;&#x30FC;&#x30B7;&#x30E7;&#x30F3;').
store('t38','en_gb','Location').
store('t36','uwl-ext-location','t38').
store('t39','en','Amazon Wish List.').
store('t39','fr','Liste d"envies Amazon').
store('t39','it','Lista Desideri Amazon').
store('t39','de','Amazon-Wunschzettel').
store('t39','ja','Amazon.co.jp&#x306E;&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;').
store('t39','zh','&#x5353;&#x8D8A;&#x4E9A;&#x9A6C;&#x900A;&#x5FC3;&#x613F;&#x5355;').
store('t39','en_gb','Amazon Wish List.').
store('t36','uwl-ext-chrome-pushdown-content-linktext','t39').
store('t40','en','Settings').
store('t40','fr','Param&egrave;tres').
store('t40','it','Impostazioni').
store('t40','de','Einstellungen').
store('t40','ja','&#x8A2D;&#x5B9A;').
store('t40','zh','&#x8BBE;&#x7F6E;').
store('t40','en_gb','Settings').
store('t36','uwl-ext-pushdown-settings-text','t40').
store('t41','en','&copy; 1996-2010, Amazon.com, Inc. or its affiliates').
store('t41','fr','&copy; 1996-2010, Amazon.com, Inc. ou ses filiales.').
store('t41','it','&copy; 2010-2011, Amazon.com, Inc. o societ&agrave; affiliate.').
store('t41','de','&copy; 1998-2011, Amazon.com, Inc. oder Tochtergesellschaften').
store('t41','ja','&copy; 1996-2010, Amazon.com, Inc. or its affiliates').
store('t41','zh','&copy; 1999-2011, Amazon Joyo Co., Ltd.').
store('t41','en_gb','&#xFFFD; 1996-2011, Amazon.com, Inc. or its affiliates').
store('t36','uwl-ext-copy-footer','t41').
store('t42','en','Set default Wish List location to:').
store('t42','fr','Adresse &agrave; utiliser par d&eacute;faut pour cette Liste d"envies&nbsp;:').
store('t42','it','Imposta posizione predefinita per Lista Desideri:').
store('t42','de','Standard-Website f&uuml;r den Wunschzettel:').
store('t42','ja','&#x6B21;&#x306E;&#x30ED;&#x30B1;&#x30FC;&#x30B7;&#x30E7;&#x30F3;&#x3092;&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;&#x306E;&#x30C7;&#x30D5;&#x30A9;&#x30EB;&#x30C8;&#x306B;&#x8A2D;&#x5B9A;&#x3059;&#x308B;:').
store('t42','en_gb','Set default Wish List location to:').
store('t36','uwl-ext-set-default-location','t42').
store('t43','en','Enable the animation of the Add to Wish List button image on product pages').
store('t43','fr','Activer l"animation du bouton &laquo;&nbsp;Ajouter &agrave; votre Liste d"envies&nbsp;&raquo; sur les pages produits').
store('t43','it','Abilita l"animazione del pulsante &quot;Aggiungi alla Lista Desideri&quot; sulle pagine prodotto').
store('t43','de','Animierte Darstellung des &quot;Auf meinen Wunschzettel&quot;-Buttons auf Produktseiten aktivieren').
store('t43','ja','&#x5546;&#x54C1;&#x30DA;&#x30FC;&#x30B8;&#x3067;&#x3001;&#x300C;&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;&#x306B;&#x8FFD;&#x52A0;&#x3059;&#x308B;&#x300D;&#x30DC;&#x30BF;&#x30F3;&#x306E;&#x30A2;&#x30CB;&#x30E1;&#x30FC;&#x30B7;&#x30E7;&#x30F3;&#x3092;&#x6709;&#x52B9;&#x306B;&#x3059;&#x308B;').
store('t43','zh','&#x5728;&#x5546;&#x54C1;&#x8BE6;&#x7EC6;&#x9875;&#x6FC0;&#x6D3B;&ldquo;&#x52A0;&#x5165;&#x5FC3;&#x613F;&#x5355;&rdquo;&#x7684;&#x52A8;&#x6001;&#x63D0;&#x793A;').
store('t43','en_gb','Enable the animation of the Add to Wish List button image on product pages').
store('t36','uwl-ext-chrome-enable-animation','t43').
store('t44','en','Product Page Cue').
store('t44','fr','Pour signaler les pages produits').
store('t44','it','Cue pagina prodotto').
store('t44','de','Hinweis auf Produktseite').
store('t44','ja','&#x5546;&#x54C1;&#x30DA;&#x30FC;&#x30B8;&#x3067;&#x306E;&#x8868;&#x793A;').
store('t44','zh','&#x5546;&#x54C1;&#x8BE6;&#x7EC6;&#x9875;&#x63D0;&#x793A;').
store('t44','en_gb','Product Page Cue').
store('t36','uwl-ext-product-cue','t44').
store('t45','en','Add products from any website to your Amazon Wish List').
store('t45','fr','Ajoutez des articles à votre Liste d"envies Amazon depuis n"importe quel site Internet').
store('t45','it','Aggiungi prodotti da qualsiasi sito alla tua Lista Desideri Amazon').
store('t45','de','Fügen Sie Produkte von jeder beliebigen Website Ihrem Wunschzettel bei Amazon hinzu').
store('t45','ja','\u307B\u304B\u306E\u30B5\u30A4\u30C8\u306E\u5546\u54C1\u3092Amazon.co.jp\u306E\u307B\u3057\u3044\u7269\u30EA\u30B9\u30C8\u306B\u8FFD\u52A0\u3067\u304D\u307E\u3059').
store('t45','zh','\u5C06\u4EFB\u610F\u7F51\u7AD9\u7684\u5546\u54C1\u6DFB\u52A0\u5230\u4F60\u7684\u5353\u8D8A\u4E9A\u9A6C\u900A\u5FC3\u613F\u5355').
store('t45','en_gb','Add products from any website to your Amazon Wish List').
store('t36','uwl-ext-chrome-description','t45').
store('t46','en','Add This Item to Your Amazon Wish List').
store('t46','fr','Ajoutez cet article &agrave; votre Liste d"envies Amazon').
store('t46','it','Aggiungi questo articolo alla Lista Desideri Amazon').
store('t46','de','Diesen Artikel Ihrem Wunschzettel bei Amazon hinzuf&uuml;gen').
store('t46','ja','&#x3053;&#x306E;&#x5546;&#x54C1;&#x3092;Amazon.co.jp&#x306E;&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;&#x306B;&#x8FFD;&#x52A0;&#x3059;&#x308B;').
store('t46','zh','&#x5C06;&#x6B64;&#x5546;&#x54C1;&#x6DFB;&#x52A0;&#x5230;&#x60A8;&#x7684;&#x5353;&#x8D8A;&#x4E9A;&#x9A6C;&#x900A;&#x5FC3;&#x613F;&#x5355;').
store('t46','en_gb','Add This Item to Your Amazon Wish List').
store('t36','uwl-ext-pushdown-header','t46').
store('t47','en','Saved').
store('t47','fr','Param&egrave;tres enregistr&eacute;s').
store('t47','it','Salvata').
store('t47','de','Gespeichert').
store('t47','ja','&#x4FDD;&#x5B58;&#x3057;&#x307E;&#x3057;&#x305F;').
store('t47','zh','&#x5DF2;&#x4FDD;&#x5B58;').
store('t47','en_gb','Saved').
store('t36','uwl-ext-saved','t47').
store('t48','en','Add to Amazon Wish List').
store('t48','fr','Ajouter à votre Liste d"envies Amazon').
store('t48','it','Aggiungi alla Lista Desideri Amazon').
store('t48','de','Auf den Amazon-Wunschzettel').
store('t48','ja','Amazon.co.jp\u306E\u307B\u3057\u3044\u7269\u30EA\u30B9\u30C8\u306B\u8FFD\u52A0').
store('t48','zh','\u52A0\u5165\u5353\u8D8A\u4E9A\u9A6C\u900A\u5FC3\u613F\u5355').
store('t48','en_gb','Add to Amazon Wish List').
store('t36','uwl-ext-chrome-browseraction','t48').
store('t49','en','Amazon Wish List Extension Settings').
store('t49','fr','Param&egrave;tres de l"extension Liste d"envies Amazon').
store('t49','it','Impostazione estensione Lista Desideri Amazon').
store('t49','de','Erweiterte Einstellungen f&uuml;r den Amazon-Wunschzettel').
store('t49','ja','&#x307B;&#x3057;&#x3044;&#x7269;&#x30EA;&#x30B9;&#x30C8;&#x62E1;&#x5F35;&#x6A5F;&#x80FD;&#x8A2D;&#x5B9A;').
store('t49','zh','&#x5353;&#x8D8A;&#x4E9A;&#x9A6C;&#x900A;&#x5FC3;&#x613F;&#x5355;&#x6269;&#x5C55;&#x529F;&#x80FD;&#x8BBE;&#x7F6E;').
store('t49','en_gb','Amazon Wish List Extension Settings').
store('t36','uwl-ext-chrome-settings-title','t49').
store('t50','en','Add to Amazon Wish List').
store('t50','fr','Ajouter à votre Liste d"envies Amazon').
store('t50','it','Aggiungi alla Lista Desideri Amazon').
store('t50','de','Auf den Amazon-Wunschzettel').
store('t50','ja','Amazon.co.jp\u306E\u307B\u3057\u3044\u7269\u30EA\u30B9\u30C8\u306B\u8FFD\u52A0').
store('t50','zh','\u52A0\u5165\u5353\u8D8A\u4E9A\u9A6C\u900A\u5FC3\u613F\u5355').
store('t50','en_gb','Add to Amazon Wish List').
store('t36','uwl-ext-chrome-name','t50').
store('t35','strings','__objectInit__').
load('t52','chrome','extension').
load('t53','t52','sendRequest').
store('t54','command','localeData').
actual('2','1','t54').
callRet('2','t54').
actual('2','2','lambda_R_25').
callRet('2','lambda_R_25').
assign('t51','t55').
ptsTo('lambda_R_25','d_lambda_R_25').
heapPtsTo('d_lambda_R_25','prototype','p_lambda_R_25').
prototype('p_lambda_R_25','h_FP').
methodRet('d_lambda_R_25','lambda_R_25').
formal('d_lambda_R_25','1','response_R_25').
assign('t56','t57').
ptsTo('lambda_R_26','d_lambda_R_26').
heapPtsTo('d_lambda_R_26','prototype','p_lambda_R_26').
prototype('p_lambda_R_26','h_FP').
methodRet('d_lambda_R_26','lambda_R_26').
assign('t58','t59').
ptsTo('lambda_R_36','d_lambda_R_36').
heapPtsTo('d_lambda_R_36','prototype','p_lambda_R_36').
prototype('p_lambda_R_36','h_FP').
methodRet('d_lambda_R_36','lambda_R_36').
assign('getFirstChild_R_0','lambda_R_55').
ptsTo('lambda_R_55','d_lambda_R_55').
heapPtsTo('d_lambda_R_55','prototype','p_lambda_R_55').
prototype('p_lambda_R_55','h_FP').
methodRet('d_lambda_R_55','lambda_R_55').
formal('d_lambda_R_55','1','n_R_55').
assign('getNodesFromHTML_R_0','lambda_R_56').
ptsTo('lambda_R_56','d_lambda_R_56').
heapPtsTo('d_lambda_R_56','prototype','p_lambda_R_56').
prototype('p_lambda_R_56','h_FP').
methodRet('d_lambda_R_56','lambda_R_56').
formal('d_lambda_R_56','1','html_R_56').
load('t61','window','location').
load('t62','t61','toString_R_?').
load('t64','t63','match_R_?').
actual('6','1','{"regexp": "^chrome-extension", "modifiers": ""}').
callRet('6','{"regexp": "^chrome-extension", "modifiers": ""}').
assign('t66','t65').
load('t67','AMZUWLXT_R_0','canPushDown_R_?').
load('t68','document','body').
actual('7','1','t68').
callRet('7','t68').
actual('7','2','t69').
callRet('7','t69').
assign('t60','t71').
load('t73','chrome','extension').
load('t74','t73','sendRequest').
store('t75','command_R_?','pushdown').
actual('8','1','t75').
callRet('8','t75').
actual('8','2','lambda_R_57').
callRet('8','lambda_R_57').
assign('t72','t76').
ptsTo('lambda_R_57','d_lambda_R_57').
heapPtsTo('d_lambda_R_57','prototype','p_lambda_R_57').
prototype('p_lambda_R_57','h_FP').
methodRet('d_lambda_R_57','lambda_R_57').
formal('d_lambda_R_57','1','response_R_57').
assign('notifyIsDetail_R_0','lambda_R_59').
ptsTo('lambda_R_59','d_lambda_R_59').
heapPtsTo('d_lambda_R_59','prototype','p_lambda_R_59').
prototype('p_lambda_R_59','h_FP').
methodRet('d_lambda_R_59','lambda_R_59').
load('t78','chrome','extension').
load('t79','t78','sendRequest').
store('t80','command','shouldMessage').
actual('9','1','t80').
callRet('9','t80').
actual('9','2','lambda_R_60').
callRet('9','lambda_R_60').
assign('t77','t81').
ptsTo('lambda_R_60','d_lambda_R_60').
heapPtsTo('d_lambda_R_60','prototype','p_lambda_R_60').
prototype('p_lambda_R_60','h_FP').
methodRet('d_lambda_R_60','lambda_R_60').
formal('d_lambda_R_60','1','run_R_60').
assign('AMZUWLXT_R_0','__objectInit__').
load('t82','AMZUWLXT_R_0','tests').
store('t82','genBulkTest_R_?','lambda_R_61').
store('t82','genAndTest_R_?','lambda_R_63').
store('t82','genOrTest_R_?','lambda_R_64').
store('t82','genChildrenOrTest_R_?','lambda_R_65').
store('t82','popNodeData_R_?','lambda_R_67').
store('t82','leafNodeTest_R_?','lambda_R_68').
store('t82','genNodePropMaxSpreadTest_R_?','lambda_R_69').
store('t82','genPropRegexTest_R_?','lambda_R_71').
store('t82','genReTest_R_?','lambda_R_73').
store('t82','visibleTest_R_?','lambda_R_75').
store('t82','genLengthTest_R_?','lambda_R_76').
store('t82','genPositionRangeTest_R_?','lambda_R_78').
store('t82','negateTest_R_?','lambda_R_80').
store('t82','genParentsOrTest_R_?','lambda_R_82').
store('t82','genComputedStyleReTest_R_?','lambda_R_84').
store('t82','attributeExistsTest_R_?','lambda_R_86').
store('t82','genDomainTest_R_?','lambda_R_88').
store('t82','genLogTest_R_?','lambda_R_90').
store('AMZUWLXT_R_0','tests','__objectInit__').
ptsTo('lambda_R_61','d_lambda_R_61').
heapPtsTo('d_lambda_R_61','prototype','p_lambda_R_61').
prototype('p_lambda_R_61','h_FP').
methodRet('d_lambda_R_61','lambda_R_61').
formal('d_lambda_R_61','1','tests_R_61').
formal('d_lambda_R_61','2','isOr_R_61').
ptsTo('lambda_R_63','d_lambda_R_63').
heapPtsTo('d_lambda_R_63','prototype','p_lambda_R_63').
prototype('p_lambda_R_63','h_FP').
methodRet('d_lambda_R_63','lambda_R_63').
ptsTo('lambda_R_64','d_lambda_R_64').
heapPtsTo('d_lambda_R_64','prototype','p_lambda_R_64').
prototype('p_lambda_R_64','h_FP').
methodRet('d_lambda_R_64','lambda_R_64').
ptsTo('lambda_R_65','d_lambda_R_65').
heapPtsTo('d_lambda_R_65','prototype','p_lambda_R_65').
prototype('p_lambda_R_65','h_FP').
methodRet('d_lambda_R_65','lambda_R_65').
formal('d_lambda_R_65','1','test_R_65').
formal('d_lambda_R_65','2','maxDepth_R_65').
ptsTo('lambda_R_67','d_lambda_R_67').
heapPtsTo('d_lambda_R_67','prototype','p_lambda_R_67').
prototype('p_lambda_R_67','h_FP').
methodRet('d_lambda_R_67','lambda_R_67').
formal('d_lambda_R_67','1','node_R_67').
formal('d_lambda_R_67','2','nodeData_R_67').
formal('d_lambda_R_67','3','field_R_67').
ptsTo('lambda_R_68','d_lambda_R_68').
heapPtsTo('d_lambda_R_68','prototype','p_lambda_R_68').
prototype('p_lambda_R_68','h_FP').
methodRet('d_lambda_R_68','lambda_R_68').
formal('d_lambda_R_68','1','node_R_68').
ptsTo('lambda_R_69','d_lambda_R_69').
heapPtsTo('d_lambda_R_69','prototype','p_lambda_R_69').
prototype('p_lambda_R_69','h_FP').
methodRet('d_lambda_R_69','lambda_R_69').
formal('d_lambda_R_69','1','test_R_69').
formal('d_lambda_R_69','2','propName_R_69').
formal('d_lambda_R_69','3','spread_R_69').
ptsTo('lambda_R_71','d_lambda_R_71').
heapPtsTo('d_lambda_R_71','prototype','p_lambda_R_71').
prototype('p_lambda_R_71','h_FP').
methodRet('d_lambda_R_71','lambda_R_71').
formal('d_lambda_R_71','1','regex_R_71').
formal('d_lambda_R_71','2','props_R_71').
formal('d_lambda_R_71','3','recordKey_R_71').
ptsTo('lambda_R_73','d_lambda_R_73').
heapPtsTo('d_lambda_R_73','prototype','p_lambda_R_73').
prototype('p_lambda_R_73','h_FP').
methodRet('d_lambda_R_73','lambda_R_73').
formal('d_lambda_R_73','1','regex_R_73').
formal('d_lambda_R_73','2','field_R_73').
ptsTo('lambda_R_75','d_lambda_R_75').
heapPtsTo('d_lambda_R_75','prototype','p_lambda_R_75').
prototype('p_lambda_R_75','h_FP').
methodRet('d_lambda_R_75','lambda_R_75').
formal('d_lambda_R_75','1','node_R_75').
formal('d_lambda_R_75','2','nodeData_R_75').
ptsTo('lambda_R_76','d_lambda_R_76').
heapPtsTo('d_lambda_R_76','prototype','p_lambda_R_76').
prototype('p_lambda_R_76','h_FP').
methodRet('d_lambda_R_76','lambda_R_76').
formal('d_lambda_R_76','1','maxLength_R_76').
formal('d_lambda_R_76','2','field_R_76').
ptsTo('lambda_R_78','d_lambda_R_78').
heapPtsTo('d_lambda_R_78','prototype','p_lambda_R_78').
prototype('p_lambda_R_78','h_FP').
methodRet('d_lambda_R_78','lambda_R_78').
formal('d_lambda_R_78','1','minY_R_78').
formal('d_lambda_R_78','2','maxY_R_78').
formal('d_lambda_R_78','3','minX_R_78').
formal('d_lambda_R_78','4','maxX_R_78').
ptsTo('lambda_R_80','d_lambda_R_80').
heapPtsTo('d_lambda_R_80','prototype','p_lambda_R_80').
prototype('p_lambda_R_80','h_FP').
methodRet('d_lambda_R_80','lambda_R_80').
formal('d_lambda_R_80','1','test_R_80').
ptsTo('lambda_R_82','d_lambda_R_82').
heapPtsTo('d_lambda_R_82','prototype','p_lambda_R_82').
prototype('p_lambda_R_82','h_FP').
methodRet('d_lambda_R_82','lambda_R_82').
formal('d_lambda_R_82','1','test_R_82').
formal('d_lambda_R_82','2','maxHeight_R_82').
formal('d_lambda_R_82','3','offset_R_82').
ptsTo('lambda_R_84','d_lambda_R_84').
heapPtsTo('d_lambda_R_84','prototype','p_lambda_R_84').
prototype('p_lambda_R_84','h_FP').
methodRet('d_lambda_R_84','lambda_R_84').
formal('d_lambda_R_84','1','style_R_84').
formal('d_lambda_R_84','2','re_R_84').
ptsTo('lambda_R_86','d_lambda_R_86').
heapPtsTo('d_lambda_R_86','prototype','p_lambda_R_86').
prototype('p_lambda_R_86','h_FP').
methodRet('d_lambda_R_86','lambda_R_86').
formal('d_lambda_R_86','1','propName_R_86').
ptsTo('lambda_R_88','d_lambda_R_88').
heapPtsTo('d_lambda_R_88','prototype','p_lambda_R_88').
prototype('p_lambda_R_88','h_FP').
methodRet('d_lambda_R_88','lambda_R_88').
formal('d_lambda_R_88','1','locale_R_88').
ptsTo('lambda_R_90','d_lambda_R_90').
heapPtsTo('d_lambda_R_90','prototype','p_lambda_R_90').
prototype('p_lambda_R_90','h_FP').
methodRet('d_lambda_R_90','lambda_R_90').
formal('d_lambda_R_90','1','prefix_R_90').
assign('t83','t84').
ptsTo('lambda_R_92','d_lambda_R_92').
heapPtsTo('d_lambda_R_92','prototype','p_lambda_R_92').
prototype('p_lambda_R_92','h_FP').
methodRet('d_lambda_R_92','lambda_R_92').
load('t86','chrome','browserAction').
load('t87','t86','onClicked').
load('t88','t87','addListener').
actual('11','1','lambda_R_93').
callRet('11','lambda_R_93').
assign('t85','t89').
ptsTo('lambda_R_93','d_lambda_R_93').
heapPtsTo('d_lambda_R_93','prototype','p_lambda_R_93').
prototype('p_lambda_R_93','h_FP').
methodRet('d_lambda_R_93','lambda_R_93').
formal('d_lambda_R_93','1','tab_R_93').
load('t90','window','onload').
store('window','onload','lambda_R_94').
ptsTo('lambda_R_94','d_lambda_R_94').
heapPtsTo('d_lambda_R_94','prototype','p_lambda_R_94').
prototype('p_lambda_R_94','h_FP').
methodRet('d_lambda_R_94','lambda_R_94').
ptsTo('t91','n_XMLHttpRequest_R_?_0').
prototype('n_XMLHttpRequest_R_?_0', 'p_XMLHttpRequest_R_?').
assign('req_R_1','t91').
load('t92','req_R_1','onreadystatechange').
store('req_R_1','onreadystatechange','lambda_R_2').
ptsTo('lambda_R_2','d_lambda_R_2').
heapPtsTo('d_lambda_R_2','prototype','p_lambda_R_2').
prototype('p_lambda_R_2','h_FP').
methodRet('d_lambda_R_2','lambda_R_2').
formal('d_lambda_R_2','1','state_R_2').
load('t94','req_R_1','open_R_?').
actual('12','1','GET').
callRet('12','GET').
actual('12','2','url_R_1').
callRet('12','url_R_1').
actual('12','3','true').
callRet('12','true').
assign('t93','t95').
load('t97','req_R_1','overrideMimeType_R_?').
actual('13','1','text/plain; charset=us-ascii').
callRet('13','text/plain; charset=us-ascii').
assign('t96','t98').
load('t100','req_R_1','send_R_?').
actual('14','1','null').
callRet('14','null').
assign('t99','t101').
load('t103','req_R_1','readyState').
load('t105','req_R_1','status').
load('t107','req_R_1','status').
assign('t102','t110').
load('t112','req_R_1','responseText').
actual('15','1','t112').
callRet('15','t112').
assign('t111','t113').
load('t115','chrome','browserAction').
load('t116','t115','setBadgeBackgroundColor').
store('t118','0','9').
store('t118','1','175').
store('t118','2','216').
store('t118','3','255').
store('t117','color_R_?','t118').
store('t117','tabId_R_3','tabId_R_3').
actual('16','1','t117').
callRet('16','t117').
assign('t114','t119').
load('t121','chrome','browserAction').
load('t122','t121','setBadgeText').
store('t123','text_R_?','+').
store('t123','tabId_R_3','tabId_R_3').
actual('17','1','t123').
callRet('17','t123').
assign('t120','t124').
load('t125','document','createElement_R_?').
actual('18','1','canvas').
callRet('18','canvas').
assign('canvas_R_4','t126').
ptsTo('t127','n_Image_R_?_1').
prototype('n_Image_R_?_1', 'p_Image_R_?').
assign('srcImage_R_4','t127').
load('t128','AMZUWLXT_R_0','Settings').
load('t129','t128','get_R_?').
assign('settings_R_4','t130').
load('t131','srcImage_R_4','onload').
store('srcImage_R_4','onload','lambda_R_5').
ptsTo('lambda_R_5','d_lambda_R_5').
heapPtsTo('d_lambda_R_5','prototype','p_lambda_R_5').
prototype('p_lambda_R_5','h_FP').
methodRet('d_lambda_R_5','lambda_R_5').
load('t132','srcImage_R_4','src').
load('t133','chrome','extension').
load('t134','t133','getURL').
actual('20','1','images/glow.png').
callRet('20','images/glow.png').
store('srcImage_R_4','src','t135').
load('t136','canvas_R_4','width').
store('canvas_R_4','width','19').
load('t137','canvas_R_4','height').
store('canvas_R_4','height','19').
load('t138','canvas_R_4','getContext_R_?').
actual('21','1','"2d"').
callRet('21','"2d"').
assign('context_R_5','t139').
assign('frameNumber_R_5','0').
assign('runFrame_R_5','lambda_R_6').
ptsTo('lambda_R_6','d_lambda_R_6').
heapPtsTo('d_lambda_R_6','prototype','p_lambda_R_6').
prototype('p_lambda_R_6','h_FP').
methodRet('d_lambda_R_6','lambda_R_6').
formal('d_lambda_R_6','1','i_R_6').
load('t141','settings_R_4','notify').
assign('t140','t141').
actual('22','1','0').
callRet('22','0').
assign('t142','t143').
load('t145','context_R_5','clearRect_R_?').
actual('23','1','0').
callRet('23','0').
actual('23','2','0').
callRet('23','0').
actual('23','3','21').
callRet('23','21').
actual('23','4','21').
callRet('23','21').
assign('t144','t146').
load('t148','context_R_5','drawImage_R_?').
actual('24','1','srcImage_R_4').
callRet('24','srcImage_R_4').
actual('24','2','t150').
callRet('24','t150').
actual('24','3','0').
callRet('24','0').
actual('24','4','19').
callRet('24','19').
actual('24','5','19').
callRet('24','19').
actual('24','6','0').
callRet('24','0').
actual('24','7','0').
callRet('24','0').
actual('24','8','19').
callRet('24','19').
actual('24','9','19').
callRet('24','19').
assign('t147','t151').
load('t152','context_R_5','getImageData_R_?').
actual('25','1','0').
callRet('25','0').
actual('25','2','0').
callRet('25','0').
actual('25','3','19').
callRet('25','19').
actual('25','4','19').
callRet('25','19').
assign('iData_R_6','t153').
load('t155','chrome','browserAction').
load('t156','t155','setIcon').
store('t157','imageData_R_?','iData_R_6').
store('t157','tabId_R_4','tabId_R_4').
actual('26','1','t157').
callRet('26','t157').
assign('t154','t158').
load('t162','srcImage_R_4','width').
assign('t159','t163').
actual('27','1','tabId_R_4').
callRet('27','tabId_R_4').
assign('t164','t165').
actual('28','1','lambda_R_7').
callRet('28','lambda_R_7').
actual('28','2','50').
callRet('28','50').
assign('t166','t167').
ptsTo('lambda_R_7','d_lambda_R_7').
heapPtsTo('d_lambda_R_7','prototype','p_lambda_R_7').
prototype('p_lambda_R_7','h_FP').
methodRet('d_lambda_R_7','lambda_R_7').
load('t169','context_R_5','restore_R_?').
assign('t168','t170').
actual('30','1','t172').
callRet('30','t172').
assign('t171','t173').
load('t174','AMZUWLXT_R_0','Settings').
load('t175','t174','get_R_?').
assign('settings_R_8','t176').
load('t178','request_R_8','command').
assign('t177','t179').
load('t180','AMZUWLXT_R_0','Settings').
load('t181','t180','get').
load('t183','t182','locale').
assign('locale_R_8','t183').
load('t186','AMZUWLXT_R_0','Locale').
load('t187','t186','getLanguageMapping_R_?').
actual('33','1','locale_R_8').
callRet('33','locale_R_8').
store('t185','lang','t188').
load('t189','AMZUWLXT_R_0','Locale').
load('t190','t189','getLocaleDomain_R_?').
actual('34','1','locale_R_8').
callRet('34','locale_R_8').
store('t185','domain','t191').
actual('35','1','t185').
callRet('35','t185').
assign('t184','t192').
load('t194','request_R_8','command').
assign('t193','t195').
load('t197','settings_R_8','notify').
load('t198','settings_R_8','push').
load('t200','settings_R_8','pushed').
assign('t201','t200').
actual('36','1','t202').
callRet('36','t202').
assign('t196','t203').
load('t205','request_R_8','command').
assign('t204','t206').
load('t208','AMZUWLXT_R_0','Settings').
load('t209','t208','set_R_?').
store('t210','pushed','true').
actual('37','1','t210').
callRet('37','t210').
assign('t207','t211').
load('t213','request_R_8','command').
assign('t212','t214').
load('t216','sender_R_8','tab').
load('t217','t216','id').
actual('38','1','t217').
callRet('38','t217').
assign('t215','t218').
load('t220','settings_R_8','push').
load('t221','settings_R_8','pushed').
assign('t222','t221').
assign('t219','t223').
load('t225','chrome','tabs').
load('t226','t225','executeScript').
load('t227','sender_R_8','tab').
load('t228','t227','id').
store('t229','file_R_?','contentScripts/pushDownContent.js').
actual('39','1','t228').
callRet('39','t228').
actual('39','2','t229').
callRet('39','t229').
assign('t224','t230').
load('t232','chrome','tabs').
load('t233','t232','executeScript').
load('t234','sender_R_8','tab').
load('t235','t234','id').
store('t236','file_R_?','contentScripts/pushDownRun.js').
actual('40','1','t235').
callRet('40','t235').
actual('40','2','t236').
callRet('40','t236').
assign('t231','t237').
load('t239','request_R_8','command').
assign('t238','t240').
load('t242','chrome','extension').
load('t243','t242','getURL').
actual('41','1','pushdown.html').
callRet('41','pushdown.html').
actual('42','1','t244').
callRet('42','t244').
actual('42','2','lambda_R_9').
callRet('42','lambda_R_9').
assign('t241','t245').
ptsTo('lambda_R_9','d_lambda_R_9').
heapPtsTo('d_lambda_R_9','prototype','p_lambda_R_9').
prototype('p_lambda_R_9','h_FP').
methodRet('d_lambda_R_9','lambda_R_9').
formal('d_lambda_R_9','1','pushdownHTML_R_9').
load('t247','chrome','extension').
load('t248','t247','getURL').
actual('43','1','expander.html').
callRet('43','expander.html').
actual('44','1','t249').
callRet('44','t249').
actual('44','2','lambda_R_10').
callRet('44','lambda_R_10').
assign('t246','t250').
ptsTo('lambda_R_10','d_lambda_R_10').
heapPtsTo('d_lambda_R_10','prototype','p_lambda_R_10').
prototype('p_lambda_R_10','h_FP').
methodRet('d_lambda_R_10','lambda_R_10').
formal('d_lambda_R_10','1','expanderHTML_R_10').
load('t252','chrome','extension').
load('t253','t252','getURL').
actual('45','1','linktemplate.html').
callRet('45','linktemplate.html').
actual('46','1','t254').
callRet('46','t254').
actual('46','2','lambda_R_11').
callRet('46','lambda_R_11').
assign('t251','t255').
ptsTo('lambda_R_11','d_lambda_R_11').
heapPtsTo('d_lambda_R_11','prototype','p_lambda_R_11').
prototype('p_lambda_R_11','h_FP').
methodRet('d_lambda_R_11','lambda_R_11').
formal('d_lambda_R_11','1','linkHTML_R_11').
load('t256','AMZUWLXT_R_0','Locale').
load('t257','t256','getLocaleDomain_R_?').
load('t258','AMZUWLXT_R_0','Settings').
load('t259','t258','get_R_?').
load('t261','t260','locale').
actual('48','1','t261').
callRet('48','t261').
assign('domain_R_11','t262').
load('t263','chrome','extension').
load('t264','t263','getURL').
actual('49','1','').
callRet('49','None').
store('vars_R_11','ext-path','t265').
load('t266','AMZUWLXT_R_0','Strings').
load('t267','t266','process_R_?').
load('t268','navigator_R_?','language').
store('t269','href','t271').
load('t272','AMZUWLXT_R_0','Strings').
load('t273','t272','lookup_R_?').
load('t274','navigator_R_?','language').
actual('50','1','uwl-ext-chrome-pushdown-content-linktext').
callRet('50','uwl-ext-chrome-pushdown-content-linktext').
actual('50','2','t274').
callRet('50','t274').
store('t269','body','t275').
actual('51','1','linkHTML_R_11').
callRet('51','linkHTML_R_11').
actual('51','2','t268').
callRet('51','t268').
actual('51','3','t269').
callRet('51','t269').
store('vars_R_11','wishlist-link','t276').
assign('vars_R_11','__objectInit__').
load('t277','AMZUWLXT_R_0','Strings').
load('t278','t277','process').
load('t279','navigator_R_?','language').
actual('52','1','pushdownHTML_R_9').
callRet('52','pushdownHTML_R_9').
actual('52','2','t279').
callRet('52','t279').
actual('52','3','vars_R_11').
callRet('52','vars_R_11').
assign('pushdownHTML_R_9','t280').
store('t282','pushDownHtml','pushdownHTML_R_9').
store('t282','expanderHtml','expanderHTML_R_10').
actual('53','1','t282').
callRet('53','t282').
assign('t281','t283').
assign('version_R_12','1.0.0.4').
assign('t284','localStorage_R_?').
load('t286','localStorage_R_?','uwlVersion').
assign('t287','t286').
assign('t285','t287').
load('t289','localStorage_R_?','uwlVersion').
assign('t288','t290').
load('t291','localStorage_R_?','uwlVersion').
store('localStorage_R_?','uwlVersion','version_R_12').
load('t292','AMZUWLXT_R_0','Locale').
load('t293','t292','getDefaultLocale_R_?').
assign('myLocale_R_12','t294').
load('t296','AMZUWLXT_R_0','Settings').
load('t297','t296','set_R_?').
store('t298','locale','myLocale_R_12').
actual('55','1','t298').
callRet('55','t298').
assign('t295','t299').
load('t300','AMZUWLXT_R_0','Locale').
load('t301','t300','getLocaleDomain_R_?').
actual('56','1','myLocale_R_12').
callRet('56','myLocale_R_12').
assign('domain_R_12','t302').
ptsTo('t303','n_XMLHttpRequest_R_?_2').
prototype('n_XMLHttpRequest_R_?_2', 'p_XMLHttpRequest_R_?').
assign('xhr_R_12','t303').
load('t305','xhr_R_12','open_R_?').
actual('57','1','GET').
callRet('57','GET').
actual('57','2','t307').
callRet('57','t307').
actual('57','3','true').
callRet('57','true').
assign('t304','t308').
load('t310','xhr_R_12','send_R_?').
actual('58','1','null').
callRet('58','null').
assign('t309','t311').
load('t312','localStorage_R_?','uwlVersion').
store('localStorage_R_?','uwlVersion','version_R_12').
load('t314','chrome','tabs').
load('t315','t314','create').
store('t316','url_R_?','t318').
actual('59','1','t316').
callRet('59','t316').
assign('t313','t319').
load('t320','navigator_R_?','language').
assign('language_R_13','t322').
assign('t323','t324').
load('t325','this','getDefaultLocale_R_?').
actual('60','1','lang_R_13').
callRet('60','lang_R_13').
assign('locale_R_13','t326').
load('t328','this','_locale_domains').
load('t329','t328','locale_R_13').
assign('t327','t329').
methodRet('d_lambda_R_13','us').
methodRet('d_lambda_R_13','locale_R_13').
load('t330','navigator_R_?','language').
assign('language_R_14','t333').
assign('t334','language_R_14').
load('t335','language_R_14','split_R_?').
actual('61','1','-').
callRet('61','-').
assign('parts_R_14','t336').
assign('guess_R_14','__undefined__').
load('t338','parts_R_14','length').
assign('t337','t339').
load('t340','this','_locale_defaults').
load('t341','parts_R_14','1').
load('t342','t341','toUpperCase_R_?').
load('t344','t340','t343').
assign('guess_R_14','t344').
assign('t345','guess_R_14').
methodRet('d_lambda_R_14','guess_R_14').
load('t346','this','_lang_defaults').
load('t347','parts_R_14','0').
load('t348','t346','t347').
assign('guess_R_14','t348').
assign('t349','guess_R_14').
methodRet('d_lambda_R_14','guess_R_14').
methodRet('d_lambda_R_14','us').
assign('t350','t351').
load('t352','this','getDefaultLocale_R_?').
actual('63','1','lang_R_15').
callRet('63','lang_R_15').
assign('locale_R_15','t353').
load('t354','this','getLanguage_R_?').
actual('64','1','lang_R_15').
callRet('64','lang_R_15').
assign('language_R_15','t355').
load('t357','this','_bookmarklet_langs').
load('t358','t357','locale_R_15').
assign('t356','t359').
load('t360','this','_bookmarklet_langs').
load('t361','t360','locale_R_15').
methodRet('d_lambda_R_15','t361').
load('t362','this','_bookmarklet_langs').
load('t363','t362','locale_R_15').
load('t364','t363','language_R_15').
load('t365','this','_bookmarklet_langs').
load('t366','t365','locale_R_15').
load('t367','t366','default').
methodRet('d_lambda_R_15','t368').
assign('t369','t370').
load('t371','this','getDefaultLocale_R_?').
load('t372','navigator_R_?','language').
actual('65','1','t373').
callRet('65','t373').
assign('locale_R_16','t374').
load('t375','this','_locale_domains').
load('t376','t375','locale_R_16').
load('t377','this','_locale_domains').
load('t378','t377','us').
methodRet('d_lambda_R_16','t379').
load('t380','navigator_R_?','language').
load('t381','t380','split_R_?').
actual('66','1','-').
callRet('66','-').
load('t383','t382','0').
assign('language_R_17','t386').
load('t388','this','_lang_defaults').
load('t389','t388','language_R_17').
assign('t387','t389').
methodRet('d_lambda_R_17','en').
methodRet('d_lambda_R_17','language_R_17').
assign('settings_R_18','__objectInit__').
load('t391','localStorage_R_?','settings').
assign('t390','t391').
load('t392','JSON_R_?','parse_R_?').
load('t393','localStorage_R_?','settings').
actual('67','1','t393').
callRet('67','t393').
assign('settings_R_18','t394').
load('t396','this','defaults').
load('t397','t396','hasOwnProperty').
actual('68','1','i_R_18').
callRet('68','i_R_18').
assign('t395','t398').
load('t400','settings_R_18','i_R_18').
assign('t399','t401').
load('t402','settings_R_18','i_R_18').
load('t403','this','defaults').
load('t404','t403','i_R_18').
store('settings_R_18','i_R_18','t404').
load('t406','this','validation').
load('t407','t406','i_R_18').
assign('t405','t407').
load('t408','settings_R_18','i_R_18').
load('t409','settings_R_18','i_R_18').
assign('(deque(["settings_R_18", "i_R_18"]), "t408")','true').
store('settings_R_18','i_R_18','false').
load('t411','this','validation').
load('t412','t411','i_R_18').
load('t413','t412','hasOwnProperty_R_?').
load('t414','settings_R_18','i_R_18').
actual('69','1','t414').
callRet('69','t414').
assign('t416','t415').
assign('t410','t416').
load('t417','settings_R_18','i_R_18').
load('t418','this','defaults').
load('t419','t418','i_R_18').
store('settings_R_18','i_R_18','t419').
assign('i_R_18','__undefined__').
methodRet('d_lambda_R_18','settings_R_18').
load('t420','this','get_R_?').
assign('currentSettings_R_19','t421').
load('t423','this','defaults').
load('t424','t423','hasOwnProperty').
actual('71','1','i_R_19').
callRet('71','i_R_19').
assign('t422','t425').
load('t427','writeSettings_R_19','i_R_19').
assign('t426','t428').
load('t430','this','validation').
load('t431','t430','i_R_19').
load('t432','this','validation').
load('t433','t432','i_R_19').
load('t434','t433','hasOwnProperty_R_?').
load('t435','writeSettings_R_19','i_R_19').
actual('72','1','t435').
callRet('72','t435').
assign('t429','t437').
load('t438','currentSettings_R_19','i_R_19').
load('t439','writeSettings_R_19','i_R_19').
assign('(deque(["currentSettings_R_19", "i_R_19"]), "t438")','true').
store('currentSettings_R_19','i_R_19','false').
load('t440','currentSettings_R_19','i_R_19').
load('t441','writeSettings_R_19','i_R_19').
store('currentSettings_R_19','i_R_19','t441').
assign('i_R_19','__undefined__').
load('t442','localStorage_R_?','settings').
load('t443','JSON_R_?','stringify_R_?').
actual('73','1','currentSettings_R_19').
callRet('73','currentSettings_R_19').
store('localStorage_R_?','settings','t444').
load('t445','this','get_R_?').
assign('curSettings_R_20','t446').
load('t448','this','defaults').
load('t449','t448','hasOwnProperty_R_?').
actual('75','1','i_R_20').
callRet('75','i_R_20').
assign('t447','t450').
load('t452','compareSettings_R_20','i_R_20').
load('t453','curSettings_R_20','i_R_20').
assign('t451','t454').
methodRet('d_lambda_R_20','false').
assign('i_R_20','__undefined__').
methodRet('d_lambda_R_20','true').
assign('t455','t456').
load('t457','navigator_R_?','language').
assign('locale_R_21','t457').
assign('t458','t459').
assign('vars_R_21','__objectInit__').
assign('stringRegex_R_21','{"regexp": "string\\((.*?)\\)", "modifiers": "gm"}').
load('t460','content_R_21','replace_R_?').
actual('76','1','stringRegex_R_21').
callRet('76','stringRegex_R_21').
actual('76','2','lambda_R_22').
callRet('76','lambda_R_22').
assign('results_R_21','t461').
ptsTo('lambda_R_22','d_lambda_R_22').
heapPtsTo('d_lambda_R_22','prototype','p_lambda_R_22').
prototype('p_lambda_R_22','h_FP').
methodRet('d_lambda_R_22','lambda_R_22').
formal('d_lambda_R_22','1','s_R_22').
load('t462','results_R_21','replace').
actual('77','1','{"regexp": "\\$(?:\\{|%7B)(.*?)(?:\\}|%7D)", "modifiers": "gm"}').
callRet('77','{"regexp": "\\$(?:\\{|%7B)(.*?)(?:\\}|%7D)", "modifiers": "gm"}').
actual('77','2','lambda_R_23').
callRet('77','lambda_R_23').
assign('results_R_21','t463').
ptsTo('lambda_R_23','d_lambda_R_23').
heapPtsTo('d_lambda_R_23','prototype','p_lambda_R_23').
prototype('p_lambda_R_23','h_FP').
methodRet('d_lambda_R_23','lambda_R_23').
formal('d_lambda_R_23','1','v_R_23').
methodRet('d_lambda_R_21','results_R_21').
load('t464','AMZUWLXT_R_0','Strings').
load('t465','t464','lookup_R_?').
load('t466','{"regexp": "string\\((.*?)\\)", "modifiers": "m"}','exec_R_?').
actual('78','1','s_R_22').
callRet('78','s_R_22').
load('t468','t467','1').
actual('79','1','t468').
callRet('79','t468').
actual('79','2','locale_R_21').
callRet('79','locale_R_21').
actual('79','3','vars_R_21').
callRet('79','vars_R_21').
assign('str_R_22','t469').
methodRet('d_lambda_R_22','str_R_22').
load('t470','{"regexp": "\\$(?:\\{|%7B)(.*?)(?:\\}|%7D)", "modifiers": "m"}','exec_R_?').
actual('80','1','v_R_23').
callRet('80','v_R_23').
load('t472','t471','1').
assign('key_R_23','t472').
load('t473','vars_R_21','key_R_23').
methodRet('d_lambda_R_23','t475').
load('t476','AMZUWLXT_R_0','Strings').
load('t477','t476','strings').
load('t478','AMZUWLXT_R_0','Strings').
load('t479','t478','strings').
load('t480','t479','string_R_24').
assign('str_R_24','t481').
load('t482','language_R_24','toLowerCase_R_?').
assign('language_R_24','t484').
load('t487','str_R_24','language_R_24').
load('t490','language_R_24','split_R_?').
actual('82','1','-').
callRet('82','-').
load('t492','t491','0').
load('t493','str_R_24','t492').
load('t496','str_R_24','en').
methodRet('d_lambda_R_24','t500').
load('t501','(function(){var w=window,l=w.location,d=w.document,s=d.createElement("script"),e=encodeURIComponent,o="object",n="AUWLBook__LANG__",u="http://__DOMAIN__/wishlist/add",r="readyState",T=setTimeout,a="setAttribute",g=function(){d[r]&&d[r]!="complete"?T(g,200):!w[n]?(s[a]("charset","UTF-8"),s[a]("src",u+".js?ext=chr&loc="+e(l)+"&b="+n),d.body.appendChild(s),f()):f()},f=function(){!w[n]?T(f,200):w[n].showPopover()};typeof s!=o?l.href=u+"?u="+e(l)+"&t="+e(d.title):g()}())','replace').
load('t502','response_R_25','domain').
actual('83','1','__DOMAIN__').
callRet('83','__DOMAIN__').
actual('83','2','t502').
callRet('83','t502').
load('t504','t503','replace_R_?').
load('t505','response_R_25','lang').
actual('84','1','__LANG__').
callRet('84','__LANG__').
actual('84','2','t505').
callRet('84','t505').
assign('bookmarklet_R_25','t506').
actual('85','1','bookmarklet_R_25').
callRet('85','bookmarklet_R_25').
assign('t507','t508').
load('t509','document','createElement_R_?').
actual('86','1','script').
callRet('86','script').
assign('s_R_25','t510').
load('t511','s_R_25','textContent').
store('s_R_25','textContent','bookmarklet_R_25').
load('t513','document','body').
load('t514','t513','appendChild_R_?').
actual('87','1','s_R_25').
callRet('87','s_R_25').
assign('t512','t515').
load('t516','AMZUWLXT_R_0','tests').
assign('t_R_26','t516').
assign('addRegex_R_26','{"regexp": "(place|add)(\\b|_|-)*", "modifiers": "i"}').
assign('cartRegex_R_26','{"regexp": "basket|cart|bag", "modifiers": "i"}').
assign('buyRegex_R_26','{"regexp": "buy|order", "modifiers": "i"}').
assign('buyCompanionRegex_R_26','{"regexp": "now", "modifiers": "i"}').
assign('preOrderRegex_R_26','{"regexp": "pre(\\s|-)order", "modifiers": "i"}').
assign('addToCartRegex_R_26','{"regexp": "addbag|addcart|addtocart|addtobasket|addtobag|(add-to-cart)|(add-to-basket)|shoppingcar|shopcar", "modifiers": "i"}').
ptsTo('t517','n_RegExp_R_?_3').
prototype('n_RegExp_R_?_3', 'p_RegExp_R_?').
actual('88','1','(\u30AB\u30FC\u30C8\u306B\u8FFD\u52A0)|(\u30AB\u30FC\u30C8\u306B\u5165\u308C\u308B)|(\u30AB\u30FC\u30C8\u3078\u5165\u308C\u308B)|(\u8CB7\u3044\u7269\u304B\u3054\u306B\u5165\u308C\u308B)|(^\u653E\u5165\u8D2D\u7269\u8F66$)|(^\u6DFB\u52A0\u5230\u8D2D\u7269\u8F66$)|(^\u8D2D\u4E70$)|(^\u7ACB\u5373\u62A2\u8D2D$)|(^\u7ACB\u5373\u8D2D\u4E70$)|(^\u52A0\u5165\u8D2D\u7269\u8F66$)|(btn-atc)|addtoshoppingcar|addtobasket|buy_btn|Ajouter au panier|ajout_panier|(In den Einkaufswagen)|(In Den Warenkorb)|(In die Einkaufstasche)|(Artikel in den Warenkorb)|(^in den korb$)|(^in Warenkorb$)|(^kaufen$)|(^Acquista$)|(^Al carrello$)|(Metti nel carrello)|(aggiungi al carrello)(Aggiungere al carrello)|(Aggiungi al carrello)|(Metti questo articolo nel tuo carrello spesa)').
callRet('88','(\u30AB\u30FC\u30C8\u306B\u8FFD\u52A0)|(\u30AB\u30FC\u30C8\u306B\u5165\u308C\u308B)|(\u30AB\u30FC\u30C8\u3078\u5165\u308C\u308B)|(\u8CB7\u3044\u7269\u304B\u3054\u306B\u5165\u308C\u308B)|(^\u653E\u5165\u8D2D\u7269\u8F66$)|(^\u6DFB\u52A0\u5230\u8D2D\u7269\u8F66$)|(^\u8D2D\u4E70$)|(^\u7ACB\u5373\u62A2\u8D2D$)|(^\u7ACB\u5373\u8D2D\u4E70$)|(^\u52A0\u5165\u8D2D\u7269\u8F66$)|(btn-atc)|addtoshoppingcar|addtobasket|buy_btn|Ajouter au panier|ajout_panier|(In den Einkaufswagen)|(In Den Warenkorb)|(In die Einkaufstasche)|(Artikel in den Warenkorb)|(^in den korb$)|(^in Warenkorb$)|(^kaufen$)|(^Acquista$)|(^Al carrello$)|(Metti nel carrello)|(aggiungi al carrello)(Aggiungere al carrello)|(Aggiungi al carrello)|(Metti questo articolo nel tuo carrello spesa)').
actual('88','2','i').
callRet('88','i').
assign('intlAddToCart_R_26','t517').
assign('getAncestors_R_26','lambda_R_27').
ptsTo('lambda_R_27','d_lambda_R_27').
heapPtsTo('d_lambda_R_27','prototype','p_lambda_R_27').
prototype('p_lambda_R_27','h_FP').
methodRet('d_lambda_R_27','lambda_R_27').
formal('d_lambda_R_27','1','node_R_27').
formal('d_lambda_R_27','2','bottomUp_R_27').
assign('findMutualParent_R_26','lambda_R_28').
ptsTo('lambda_R_28','d_lambda_R_28').
heapPtsTo('d_lambda_R_28','prototype','p_lambda_R_28').
prototype('p_lambda_R_28','h_FP').
methodRet('d_lambda_R_28','lambda_R_28').
formal('d_lambda_R_28','1','first_R_28').
formal('d_lambda_R_28','2','second_R_28').
assign('getDpTest_R_26','lambda_R_29').
ptsTo('lambda_R_29','d_lambda_R_29').
heapPtsTo('d_lambda_R_29','prototype','p_lambda_R_29').
prototype('p_lambda_R_29','h_FP').
methodRet('d_lambda_R_29','lambda_R_29').
load('t518','t_R_26','genOrTest_R_?').
load('t519','t_R_26','genOrTest').
load('t520','t_R_26','genAndTest_R_?').
load('t521','t_R_26','genReTest_R_?').
actual('88','1','addRegex_R_26').
callRet('88','addRegex_R_26').
actual('88','2','html').
callRet('88','html').
load('t523','t_R_26','genReTest').
actual('89','1','cartRegex_R_26').
callRet('89','cartRegex_R_26').
actual('89','2','html').
callRet('89','html').
actual('90','1','t522').
callRet('90','t522').
actual('90','2','t524').
callRet('90','t524').
load('t526','t_R_26','genAndTest').
load('t527','t_R_26','genReTest').
actual('91','1','buyRegex_R_26').
callRet('91','buyRegex_R_26').
actual('91','2','html').
callRet('91','html').
load('t529','t_R_26','genReTest').
actual('92','1','buyCompanionRegex_R_26').
callRet('92','buyCompanionRegex_R_26').
actual('92','2','html').
callRet('92','html').
actual('93','1','t528').
callRet('93','t528').
actual('93','2','t530').
callRet('93','t530').
load('t532','t_R_26','genReTest').
load('t533','t_R_26','preOrderRegex').
actual('94','1','t533').
callRet('94','t533').
actual('94','2','html').
callRet('94','html').
load('t535','t_R_26','genReTest').
actual('95','1','addToCartRegex_R_26').
callRet('95','addToCartRegex_R_26').
actual('95','2','html').
callRet('95','html').
load('t537','t_R_26','genReTest').
actual('96','1','intlAddToCart_R_26').
callRet('96','intlAddToCart_R_26').
actual('96','2','html').
callRet('96','html').
actual('97','1','t525').
callRet('97','t525').
actual('97','2','t531').
callRet('97','t531').
actual('97','3','t534').
callRet('97','t534').
actual('97','4','t536').
callRet('97','t536').
actual('97','5','t538').
callRet('97','t538').
actual('98','1','t539').
callRet('98','t539').
assign('guessTest_R_26','t540').
assign('getOneBuyButton_R_26','lambda_R_30').
ptsTo('lambda_R_30','d_lambda_R_30').
heapPtsTo('d_lambda_R_30','prototype','p_lambda_R_30').
prototype('p_lambda_R_30','h_FP').
methodRet('d_lambda_R_30','lambda_R_30').
formal('d_lambda_R_30','1','nodes_R_30').
assign('runPage_R_26','lambda_R_31').
ptsTo('lambda_R_31','d_lambda_R_31').
heapPtsTo('d_lambda_R_31','prototype','p_lambda_R_31').
prototype('p_lambda_R_31','h_FP').
methodRet('d_lambda_R_31','lambda_R_31').
formal('d_lambda_R_31','1','win_R_31').
formal('d_lambda_R_31','2','notify_R_31').
load('t541','AMZUWLXT_R_0','runPage').
store('AMZUWLXT_R_0','runPage','runPage_R_26').
assign('t542','t543').
assign('bottomUp_R_27','true').
assign('parents_R_27','parents_R_27').
assign('traverse_R_27','node_R_27').
assign('t544','traverse_R_27').
assign('t545','bottomUp_R_27').
load('t547','parents_R_27','unshift_R_?').
actual('99','1','traverse_R_27').
callRet('99','traverse_R_27').
assign('t546','t548').
load('t550','parents_R_27','push_R_?').
actual('100','1','traverse_R_27').
callRet('100','traverse_R_27').
assign('t549','t551').
load('t552','traverse_R_27','parentNode').
assign('traverse_R_27','t552').
methodRet('d_lambda_R_27','parents_R_27').
actual('101','1','first_R_28').
callRet('101','first_R_28').
actual('101','2','false').
callRet('101','false').
assign('firstParents_R_28','t553').
actual('102','1','second_R_28').
callRet('102','second_R_28').
actual('102','2','false').
callRet('102','false').
assign('secondParents_R_28','t554').
load('t555','Math_R_?','min_R_?').
load('t556','firstParents_R_28','length').
load('t557','secondParents_R_28','length').
actual('103','1','t556').
callRet('103','t556').
actual('103','2','t557').
callRet('103','t557').
assign('size_R_28','t558').
assign('LCA_R_28','undefined').
assign('t559','t560').
assign('i_R_28','0').
assign('t562','i_R_28').
assign('t561','t562').
load('t564','firstParents_R_28','i_R_28').
load('t565','secondParents_R_28','i_R_28').
assign('t563','t566').
methodRet('d_lambda_R_28','LCA_R_28').
load('t567','firstParents_R_28','i_R_28').
assign('LCA_R_28','t567').
assign('i_R_28','0').
methodRet('d_lambda_R_28','LCA_R_28').
load('t568','t_R_26','genAndTest_R_?').
load('t569','t_R_26','genOrTest_R_?').
load('t570','t_R_26','leafNodeTest').
load('t571','t_R_26','genPropRegexTest_R_?').
store('t572','0','className').
store('t572','1','id').
store('t572','2','title').
store('t572','3','name').
store('t572','4','alt').
actual('104','1','addToCartRegex_R_26').
callRet('104','addToCartRegex_R_26').
actual('104','2','t572').
callRet('104','t572').
load('t574','t_R_26','genPropRegexTest').
store('t575','0','className').
store('t575','1','id').
store('t575','2','title').
store('t575','3','name').
store('t575','4','alt').
actual('105','1','intlAddToCart_R_26').
callRet('105','intlAddToCart_R_26').
actual('105','2','t575').
callRet('105','t575').
actual('106','1','t570').
callRet('106','t570').
actual('106','2','t573').
callRet('106','t573').
actual('106','3','t576').
callRet('106','t576').
load('t578','t_R_26','visibleTest').
load('t579','t_R_26','genOrTest').
load('t580','t_R_26','genReTest_R_?').
actual('107','1','intlAddToCart_R_26').
callRet('107','intlAddToCart_R_26').
load('t582','t_R_26','genPropRegexTest').
actual('108','1','intlAddToCart_R_26').
callRet('108','intlAddToCart_R_26').
load('t584','t_R_26','genAndTest').
load('t585','t_R_26','genReTest').
actual('109','1','addRegex_R_26').
callRet('109','addRegex_R_26').
load('t587','t_R_26','genReTest').
actual('110','1','cartRegex_R_26').
callRet('110','cartRegex_R_26').
load('t589','t_R_26','genLengthTest_R_?').
actual('111','1','25').
callRet('111','25').
actual('112','1','t586').
callRet('112','t586').
actual('112','2','t588').
callRet('112','t588').
actual('112','3','t590').
callRet('112','t590').
load('t592','t_R_26','genAndTest').
load('t593','t_R_26','genReTest').
actual('113','1','buyRegex_R_26').
callRet('113','buyRegex_R_26').
load('t595','t_R_26','genReTest').
actual('114','1','buyCompanionRegex_R_26').
callRet('114','buyCompanionRegex_R_26').
load('t597','t_R_26','genLengthTest').
actual('115','1','10').
callRet('115','10').
actual('116','1','t594').
callRet('116','t594').
actual('116','2','t596').
callRet('116','t596').
actual('116','3','t598').
callRet('116','t598').
load('t600','t_R_26','genAndTest').
load('t601','t_R_26','genReTest').
actual('117','1','preOrderRegex_R_26').
callRet('117','preOrderRegex_R_26').
load('t603','t_R_26','genLengthTest').
actual('118','1','10').
callRet('118','10').
actual('119','1','t602').
callRet('119','t602').
actual('119','2','t604').
callRet('119','t604').
load('t606','t_R_26','genNodePropMaxSpreadTest_R_?').
load('t607','t_R_26','genAndTest').
load('t608','t_R_26','genPropRegexTest').
actual('120','1','buyRegex_R_26').
callRet('120','buyRegex_R_26').
actual('120','2','undefined').
callRet('120','undefined').
actual('120','3','buy').
callRet('120','buy').
load('t610','t_R_26','genPropRegexTest').
actual('121','1','buyCompanionRegex_R_26').
callRet('121','buyCompanionRegex_R_26').
actual('121','2','undefined').
callRet('121','undefined').
actual('121','3','buy').
callRet('121','buy').
actual('122','1','t609').
callRet('122','t609').
actual('122','2','t611').
callRet('122','t611').
actual('123','1','t612').
callRet('123','t612').
actual('123','2','buy').
callRet('123','buy').
actual('123','3','10').
callRet('123','10').
load('t614','t_R_26','genNodePropMaxSpreadTest').
load('t615','t_R_26','genAndTest').
load('t616','t_R_26','genPropRegexTest').
actual('124','1','addRegex_R_26').
callRet('124','addRegex_R_26').
actual('124','2','undefined').
callRet('124','undefined').
actual('124','3','add').
callRet('124','add').
load('t618','t_R_26','genPropRegexTest').
actual('125','1','cartRegex_R_26').
callRet('125','cartRegex_R_26').
actual('125','2','undefined').
callRet('125','undefined').
actual('125','3','add').
callRet('125','add').
actual('126','1','t617').
callRet('126','t617').
actual('126','2','t619').
callRet('126','t619').
actual('127','1','t620').
callRet('127','t620').
actual('127','2','add').
callRet('127','add').
actual('127','3','10').
callRet('127','10').
load('t622','t_R_26','genPropRegexTest').
actual('128','1','preOrderRegex_R_26').
callRet('128','preOrderRegex_R_26').
actual('129','1','t581').
callRet('129','t581').
actual('129','2','t583').
callRet('129','t583').
actual('129','3','t591').
callRet('129','t591').
actual('129','4','t599').
callRet('129','t599').
actual('129','5','t605').
callRet('129','t605').
actual('129','6','t613').
callRet('129','t613').
actual('129','7','t621').
callRet('129','t621').
actual('129','8','t623').
callRet('129','t623').
load('t625','t_R_26','genOrTest').
load('t626','t_R_26','genPositionRangeTest_R_?').
actual('130','1','5').
callRet('130','5').
actual('130','2','800').
callRet('130','800').
load('t628','t_R_26','genDomainTest_R_?').
actual('131','1','{"regexp": "\\.jp$", "modifiers": ""}').
callRet('131','{"regexp": "\\.jp$", "modifiers": ""}').
actual('132','1','t627').
callRet('132','t627').
actual('132','2','t629').
callRet('132','t629').
load('t631','t_R_26','negateTest_R_?').
load('t632','t_R_26','inNavTest').
actual('133','1','t632').
callRet('133','t632').
load('t634','t_R_26','isClickableTest').
load('t635','t_R_26','negateTest').
load('t636','t_R_26','genParentsOrTest_R_?').
load('t637','t_R_26','genPropRegexTest').
store('t638','0','tagName').
actual('134','1','{"regexp": "map|area", "modifiers": "i"}').
callRet('134','{"regexp": "map|area", "modifiers": "i"}').
actual('134','2','t638').
callRet('134','t638').
actual('135','1','t639').
callRet('135','t639').
actual('135','2','5').
callRet('135','5').
actual('136','1','t640').
callRet('136','t640').
actual('137','1','t577').
callRet('137','t577').
actual('137','2','t578').
callRet('137','t578').
actual('137','3','t624').
callRet('137','t624').
actual('137','4','t630').
callRet('137','t630').
actual('137','5','t633').
callRet('137','t633').
actual('137','6','t634').
callRet('137','t634').
actual('137','7','t641').
callRet('137','t641').
methodRet('d_lambda_R_29','t642').
load('t644','nodes_R_30','length').
assign('t643','t645').
load('t646','nodes_R_30','0').
methodRet('d_lambda_R_30','t646').
load('t648','nodes_R_30','length').
assign('t647','t649').
methodRet('d_lambda_R_30','false').
load('t650','nodes_R_30','0').
assign('mutual_R_30','t650').
load('t652','nodes_R_30','length').
assign('t651','t653').
assign('i_R_30','1').
assign('t655','i_R_30').
assign('t654','t655').
load('t656','nodes_R_30','i_R_30').
actual('138','1','t656').
callRet('138','t656').
actual('138','2','mutual_R_30').
callRet('138','mutual_R_30').
assign('mutual_R_30','t657').
assign('i_R_30','1').
load('t659','nodes_R_30','length').
assign('t658','t660').
assign('i_R_30','0').
assign('t662','i_R_30').
assign('t661','t662').
load('t664','nodes_R_30','i_R_30').
assign('t663','t665').
methodRet('d_lambda_R_30','true').
methodRet('d_lambda_R_30','false').
load('t667','win_R_31','location').
load('t669','win_R_31','location').
load('t670','t669','hostname').
assign('t672','t671').
assign('t666','t672').
methodRet('d_lambda_R_31','null').
load('t674','window','location').
load('t675','t674','hostname').
load('t676','t675','match_R_?').
actual('139','1','{"regexp": "amazon\\.(.*?)$", "modifiers": ""}').
callRet('139','{"regexp": "amazon\\.(.*?)$", "modifiers": ""}').
assign('t673','t677').
methodRet('d_lambda_R_31','null').
load('t679','win_R_31','location').
load('t680','t679','toString_R_?').
load('t682','t681','match').
actual('141','1','{"regexp": "(\\/((product)|(dp))\\/)|productid=", "modifiers": "i"}').
callRet('141','{"regexp": "(\\/((product)|(dp))\\/)|productid=", "modifiers": "i"}').
load('t684','win_R_31','location').
load('t685','t684','toString').
load('t687','t686','match').
actual('143','1','{"regexp": "productid=($|&)", "modifiers": "i"}').
callRet('143','{"regexp": "productid=($|&)", "modifiers": "i"}').
assign('t689','t688').
load('t691','win_R_31','location').
load('t692','t691','toString').
load('t694','t693','match').
actual('145','1','{"regexp": "image", "modifiers": "i"}').
callRet('145','{"regexp": "image", "modifiers": "i"}').
assign('t696','t695').
assign('t678','t697').
assign('t698','t699').
methodRet('d_lambda_R_31','null').
load('t701','win_R_31','document').
load('t702','t701','body').
actual('147','1','t702').
callRet('147','t702').
actual('147','2','t703').
callRet('147','t703').
assign('t700','t704').
load('t705','win_R_31','document').
load('t706','t705','createTreeWalker_R_?').
load('t707','win_R_31','document').
load('t708','t707','body').
load('t709','NodeFilter_R_?','SHOW_ELEMENT').
load('t710','NodeFilter_R_?','SHOW_TEXT').
actual('148','1','t708').
callRet('148','t708').
actual('148','2','t711').
callRet('148','t711').
actual('148','3','lambda_R_32').
callRet('148','lambda_R_32').
actual('148','4','false').
callRet('148','false').
assign('walker_R_31','t712').
ptsTo('lambda_R_32','d_lambda_R_32').
heapPtsTo('d_lambda_R_32','prototype','p_lambda_R_32').
prototype('p_lambda_R_32','h_FP').
methodRet('d_lambda_R_32','lambda_R_32').
formal('d_lambda_R_32','1','node_R_32').
assign('matchNodes_R_31','matchNodes_R_31').
assign('dpTest_R_31','t713').
assign('walk_R_31','lambda_R_33').
ptsTo('lambda_R_33','d_lambda_R_33').
heapPtsTo('d_lambda_R_33','prototype','p_lambda_R_33').
prototype('p_lambda_R_33','h_FP').
methodRet('d_lambda_R_33','lambda_R_33').
formal('d_lambda_R_33','1','callback_R_33').
actual('150','1','lambda_R_35').
callRet('150','lambda_R_35').
assign('t714','t715').
ptsTo('lambda_R_35','d_lambda_R_35').
heapPtsTo('d_lambda_R_35','prototype','p_lambda_R_35').
prototype('p_lambda_R_35','h_FP').
methodRet('d_lambda_R_35','lambda_R_35').
load('t716','NodeFilter_R_?','FILTER_ACCEPT').
methodRet('d_lambda_R_32','t716').
assign('node_R_33','__undefined__').
assign('t717','t718').
assign('i_R_33','0').
assign('t720','i_R_33').
assign('t719','t720').
load('t721','walker_R_31','nextNode_R_?').
assign('node_R_33','t722').
assign('t724','node_R_33').
assign('t723','t724').
assign('t725','t726').
methodRet('d_lambda_R_33','null').
actual('153','1','node_R_33').
callRet('153','node_R_33').
actual('153','2','t728').
callRet('153','t728').
assign('t727','t729').
load('t731','matchNodes_R_31','push_R_?').
actual('154','1','node_R_33').
callRet('154','node_R_33').
assign('t730','t732').
assign('i_R_33','0').
actual('155','1','lambda_R_34').
callRet('155','lambda_R_34').
actual('155','2','100').
callRet('155','100').
assign('t733','t734').
ptsTo('lambda_R_34','d_lambda_R_34').
heapPtsTo('d_lambda_R_34','prototype','p_lambda_R_34').
prototype('p_lambda_R_34','h_FP').
methodRet('d_lambda_R_34','lambda_R_34').
actual('156','1','callback_R_33').
callRet('156','callback_R_33').
assign('t735','t736').
load('t738','matchNodes_R_31','length').
assign('t737','t739').
assign('i_R_35','0').
assign('t741','i_R_35').
assign('t740','t741').
load('t743','matchNodes_R_31','i_R_35').
load('t744','t743','nodeType').
assign('t742','t745').
load('t746','matchNodes_R_31','i_R_35').
load('t747','matchNodes_R_31','i_R_35').
load('t748','t747','parentNode').
store('matchNodes_R_31','i_R_35','t748').
assign('i_R_35','0').
actual('157','1','matchNodes_R_31').
callRet('157','matchNodes_R_31').
assign('buyNode_R_35','t749').
assign('t750','buyNode_R_35').
assign('t751','t752').
load('t753','AMZUWLXT_R_0','tests').
assign('t_R_36','t753').
assign('runPushDown_R_36','lambda_R_37').
ptsTo('lambda_R_37','d_lambda_R_37').
heapPtsTo('d_lambda_R_37','prototype','p_lambda_R_37').
prototype('p_lambda_R_37','h_FP').
methodRet('d_lambda_R_37','lambda_R_37').
formal('d_lambda_R_37','1','win_R_37').
formal('d_lambda_R_37','2','doc_R_37').
formal('d_lambda_R_37','3','content_R_37').
formal('d_lambda_R_37','4','expander_R_37').
formal('d_lambda_R_37','5','expandCallback_R_37').
formal('d_lambda_R_37','6','isWindows_R_37').
load('t754','t_R_36','negateTest_R_?').
load('t755','t_R_36','genChildrenOrTest_R_?').
load('t756','t_R_36','genAndTest_R_?').
load('t757','t_R_36','visibleTest').
load('t758','t_R_36','genComputedStyleReTest_R_?').
actual('159','1','position').
callRet('159','position').
actual('159','2','{"regexp": "absolute|fixed", "modifiers": "i"}').
callRet('159','{"regexp": "absolute|fixed", "modifiers": "i"}').
load('t760','t_R_36','negateTest').
load('t761','t_R_36','genPropRegexTest_R_?').
store('canPushDown_R_36','0','tagName').
actual('160','1','{"regexp": "^body$", "modifiers": "i"}').
callRet('160','{"regexp": "^body$", "modifiers": "i"}').
actual('160','2','canPushDown_R_36').
callRet('160','canPushDown_R_36').
actual('161','1','t762').
callRet('161','t762').
load('t764','t_R_36','genOrTest_R_?').
load('t765','t_R_36','negateTest').
load('t766','t_R_36','genComputedStyleReTest').
actual('162','1','left').
callRet('162','left').
actual('162','2','{"regexp": "auto", "modifiers": ""}').
callRet('162','{"regexp": "auto", "modifiers": ""}').
actual('163','1','t767').
callRet('163','t767').
load('t769','t_R_36','negateTest').
load('t770','t_R_36','genComputedStyleReTest').
actual('164','1','right').
callRet('164','right').
actual('164','2','{"regexp": "auto", "modifiers": ""}').
callRet('164','{"regexp": "auto", "modifiers": ""}').
actual('165','1','t771').
callRet('165','t771').
load('t773','t_R_36','negateTest').
load('t774','t_R_36','genComputedStyleReTest').
actual('166','1','top').
callRet('166','top').
actual('166','2','{"regexp": "auto", "modifiers": ""}').
callRet('166','{"regexp": "auto", "modifiers": ""}').
actual('167','1','t775').
callRet('167','t775').
load('t777','t_R_36','negateTest').
load('t778','t_R_36','genComputedStyleReTest').
actual('168','1','bottom').
callRet('168','bottom').
actual('168','2','{"regexp": "auto", "modifiers": ""}').
callRet('168','{"regexp": "auto", "modifiers": ""}').
actual('169','1','t779').
callRet('169','t779').
actual('170','1','t768').
callRet('170','t768').
actual('170','2','t772').
callRet('170','t772').
actual('170','3','t776').
callRet('170','t776').
actual('170','4','t780').
callRet('170','t780').
load('t782','t_R_36','negateTest').
load('t783','t_R_36','genParentsOrTest_R_?').
load('t784','t_R_36','genOrTest').
load('t785','t_R_36','genComputedStyleReTest').
actual('171','1','position').
callRet('171','position').
actual('171','2','{"regexp": "relative", "modifiers": "i"}').
callRet('171','{"regexp": "relative", "modifiers": "i"}').
load('t787','t_R_36','genPropRegexTest').
store('canPushDown_R_36','0','tagName').
actual('172','1','{"regexp": "iframe", "modifiers": "i"}').
callRet('172','{"regexp": "iframe", "modifiers": "i"}').
actual('172','2','canPushDown_R_36').
callRet('172','canPushDown_R_36').
actual('173','1','t786').
callRet('173','t786').
actual('173','2','t788').
callRet('173','t788').
actual('174','1','t789').
callRet('174','t789').
actual('174','2','5').
callRet('174','5').
actual('175','1','t790').
callRet('175','t790').
load('t792','t_R_36','genPositionRangeTest_R_?').
actual('176','1','0').
callRet('176','0').
actual('176','2','500').
callRet('176','500').
actual('176','3','0').
callRet('176','0').
load('t794','t_R_36','negateTest').
load('t795','t_R_36','genComputedStyleReTest').
actual('177','1','visibility').
callRet('177','visibility').
actual('177','2','hidden').
callRet('177','hidden').
actual('178','1','t796').
callRet('178','t796').
actual('179','1','t757').
callRet('179','t757').
actual('179','2','t759').
callRet('179','t759').
actual('179','3','t763').
callRet('179','t763').
actual('179','4','t781').
callRet('179','t781').
actual('179','5','t791').
callRet('179','t791').
actual('179','6','t793').
callRet('179','t793').
actual('179','7','t797').
callRet('179','t797').
actual('180','1','t798').
callRet('180','t798').
actual('180','2','3').
callRet('180','3').
actual('181','1','t799').
callRet('181','t799').
assign('canPushDown_R_36','t800').
load('t801','AMZUWLXT_R_0','canPushDown').
store('AMZUWLXT_R_0','canPushDown','canPushDown_R_36').
load('t802','AMZUWLXT_R_0','runPushDown').
store('AMZUWLXT_R_0','runPushDown','runPushDown_R_36').
assign('eachChild_R_37','lambda_R_38').
ptsTo('lambda_R_38','d_lambda_R_38').
heapPtsTo('d_lambda_R_38','prototype','p_lambda_R_38').
prototype('p_lambda_R_38','h_FP').
methodRet('d_lambda_R_38','lambda_R_38').
formal('d_lambda_R_38','1','node_R_38').
formal('d_lambda_R_38','2','f_R_38').
assign('negate_R_37','lambda_R_39').
ptsTo('lambda_R_39','d_lambda_R_39').
heapPtsTo('d_lambda_R_39','prototype','p_lambda_R_39').
prototype('p_lambda_R_39','h_FP').
methodRet('d_lambda_R_39','lambda_R_39').
formal('d_lambda_R_39','1','val_R_39').
assign('windowResizer_R_37','lambda_R_40').
ptsTo('lambda_R_40','d_lambda_R_40').
heapPtsTo('d_lambda_R_40','prototype','p_lambda_R_40').
prototype('p_lambda_R_40','h_FP').
methodRet('d_lambda_R_40','lambda_R_40').
load('t803','doc_R_37','body').
actual('182','1','t803').
callRet('182','t803').
actual('182','2','null').
callRet('182','null').
assign('computedBody_R_37','t804').
load('t805','computedBody_R_37','getPropertyValue_R_?').
actual('183','1','margin-top').
callRet('183','margin-top').
actual('184','1','t806').
callRet('184','t806').
store('counterMarginTop_R_37','0','t807').
load('t808','computedBody_R_37','getPropertyValue').
actual('185','1','margin-right').
callRet('185','margin-right').
actual('186','1','t809').
callRet('186','t809').
store('counterMarginTop_R_37','1','t810').
store('counterMarginTop_R_37','2','""0px""').
load('t811','computedBody_R_37','getPropertyValue').
actual('187','1','margin-left').
callRet('187','margin-left').
actual('188','1','t812').
callRet('188','t812').
store('counterMarginTop_R_37','3','t813').
load('t814','counterMarginTop_R_37','join_R_?').
actual('189','1',' ').
callRet('189',' ').
assign('counterMarginTop_R_37','t815').
load('t816','t_R_36','genAndTest_R_?').
load('t817','t_R_36','genComputedStyleReTest_R_?').
actual('190','1','background-image').
callRet('190','background-image').
actual('190','2','{"regexp": ".", "modifiers": ""}').
callRet('190','{"regexp": ".", "modifiers": ""}').
load('t819','t_R_36','genComputedStyleReTest').
actual('191','1','background-attachment').
callRet('191','background-attachment').
actual('191','2','{"regexp": "^scroll$", "modifiers": ""}').
callRet('191','{"regexp": "^scroll$", "modifiers": ""}').
load('t821','t_R_36','genComputedStyleReTest').
actual('192','1','background-position').
callRet('192','background-position').
actual('192','2','{"regexp": "^0% 0%$", "modifiers": ""}').
callRet('192','{"regexp": "^0% 0%$", "modifiers": ""}').
actual('193','1','t818').
callRet('193','t818').
actual('193','2','t820').
callRet('193','t820').
actual('193','3','t822').
callRet('193','t822').
load('t824','doc_R_37','body').
actual('194','1','t824').
callRet('194','t824').
actual('194','2','__objectInit__').
callRet('194','__objectInit__').
assign('moveBackgroundPosition_R_37','t825').
assign('animate_R_37','lambda_R_41').
ptsTo('lambda_R_41','d_lambda_R_41').
heapPtsTo('d_lambda_R_41','prototype','p_lambda_R_41').
prototype('p_lambda_R_41','h_FP').
methodRet('d_lambda_R_41','lambda_R_41').
formal('d_lambda_R_41','1','startF_R_41').
formal('d_lambda_R_41','2','endF_R_41').
formal('d_lambda_R_41','3','time_R_41').
formal('d_lambda_R_41','4','op_R_41').
formal('d_lambda_R_41','5','finished_R_41').
assign('contract_R_37','lambda_R_43').
ptsTo('lambda_R_43','d_lambda_R_43').
heapPtsTo('d_lambda_R_43','prototype','p_lambda_R_43').
prototype('p_lambda_R_43','h_FP').
methodRet('d_lambda_R_43','lambda_R_43').
assign('expand_R_37','lambda_R_47').
ptsTo('lambda_R_47','d_lambda_R_47').
heapPtsTo('d_lambda_R_47','prototype','p_lambda_R_47').
prototype('p_lambda_R_47','h_FP').
methodRet('d_lambda_R_47','lambda_R_47').
actual('195','1','content_R_37').
callRet('195','content_R_37').
actual('195','2','lambda_R_52').
callRet('195','lambda_R_52').
assign('t826','t827').
ptsTo('lambda_R_52','d_lambda_R_52').
heapPtsTo('d_lambda_R_52','prototype','p_lambda_R_52').
prototype('p_lambda_R_52','h_FP').
methodRet('d_lambda_R_52','lambda_R_52').
formal('d_lambda_R_52','1','n_R_52').
load('t828','expander_R_37','style').
load('t829','t828','height').
store('t828','height','0').
load('t830','expander_R_37','style').
load('t831','t830','margin').
store('t830','margin','counterMarginTop_R_37').
load('t833','doc_R_37','body').
load('t834','t833','insertBefore_R_?').
load('t835','doc_R_37','body').
load('t836','t835','firstChild').
actual('196','1','content_R_37').
callRet('196','content_R_37').
actual('196','2','t836').
callRet('196','t836').
assign('t832','t837').
load('t839','doc_R_37','body').
load('t840','t839','insertBefore').
load('t841','doc_R_37','body').
load('t842','t841','firstChild').
actual('197','1','expander_R_37').
callRet('197','expander_R_37').
actual('197','2','t842').
callRet('197','t842').
assign('t838','t843').
assign('t844','t845').
store('nodes_R_38','0','node_R_38').
assign('nodes_R_38','nodes_R_38').
load('t847','nodes_R_38','length').
assign('t846','t847').
load('t848','nodes_R_38','pop_R_?').
assign('n_R_38','t849').
load('t851','n_R_38','childNodes').
load('t852','t851','length').
assign('t850','t853').
assign('i_R_38','0').
assign('t855','i_R_38').
assign('t854','t855').
load('t857','n_R_38','childNodes').
load('t858','t857','i_R_38').
actual('200','1','t858').
callRet('200','t858').
assign('t856','t859').
load('t861','nodes_R_38','push_R_?').
load('t862','n_R_38','childNodes').
load('t863','t862','i_R_38').
actual('201','1','t863').
callRet('201','t863').
assign('t860','t864').
assign('i_R_38','0').
load('t865','val_R_39','replace_R_?').
actual('202','1','{"regexp": "([\\d\\.]+)", "modifiers": "g"}').
callRet('202','{"regexp": "([\\d\\.]+)", "modifiers": "g"}').
actual('202','2','-$1').
callRet('202','-$1').
methodRet('d_lambda_R_39','t866').
load('t867','expander_R_37','style').
load('t868','t867','height').
load('t869','content_R_37','clientHeight').
store('t867','height','t870').
ptsTo('t871','n_Date_R_?_4').
prototype('n_Date_R_?_4', 'p_Date_R_?').
load('t872','t871','getTime_R_?').
assign('startTime_R_41','t873').
assign('step_R_41','lambda_R_42').
ptsTo('lambda_R_42','d_lambda_R_42').
heapPtsTo('d_lambda_R_42','prototype','p_lambda_R_42').
prototype('p_lambda_R_42','h_FP').
methodRet('d_lambda_R_42','lambda_R_42').
assign('t874','t875').
assign('start_R_42','t876').
assign('end_R_42','t877').
ptsTo('t878','n_Date_R_?_5').
prototype('n_Date_R_?_5', 'p_Date_R_?').
load('t879','t878','getTime_R_?').
assign('v_R_42','t885').
assign('t886','t893').
assign('v_R_42','end_R_42').
actual('208','1','v_R_42').
callRet('208','v_R_42').
actual('208','2','start_R_42').
callRet('208','start_R_42').
actual('208','3','end_R_42').
callRet('208','end_R_42').
assign('t894','t895').
assign('t896','t897').
actual('209','1','step_R_41').
callRet('209','step_R_41').
actual('209','2','50').
callRet('209','50').
assign('t898','t899').
assign('t900','finished_R_41').
assign('t901','t902').
assign('targetHeight_R_43','0').
load('t903','expander_R_37','clientHeight').
assign('startHeight_R_43','t903').
actual('211','1','lambda_R_44').
callRet('211','lambda_R_44').
actual('211','2','lambda_R_45').
callRet('211','lambda_R_45').
actual('211','3','500').
callRet('211','500').
actual('211','4','lambda_R_46').
callRet('211','lambda_R_46').
assign('t904','t905').
ptsTo('lambda_R_44','d_lambda_R_44').
heapPtsTo('d_lambda_R_44','prototype','p_lambda_R_44').
prototype('p_lambda_R_44','h_FP').
methodRet('d_lambda_R_44','lambda_R_44').
ptsTo('lambda_R_45','d_lambda_R_45').
heapPtsTo('d_lambda_R_45','prototype','p_lambda_R_45').
prototype('p_lambda_R_45','h_FP').
methodRet('d_lambda_R_45','lambda_R_45').
ptsTo('lambda_R_46','d_lambda_R_46').
heapPtsTo('d_lambda_R_46','prototype','p_lambda_R_46').
prototype('p_lambda_R_46','h_FP').
methodRet('d_lambda_R_46','lambda_R_46').
formal('d_lambda_R_46','1','v_R_46').
formal('d_lambda_R_46','2','start_R_46').
formal('d_lambda_R_46','3','end_R_46').
methodRet('d_lambda_R_44','startHeight_R_43').
methodRet('d_lambda_R_45','0').
load('t906','expander_R_37','style').
load('t907','t906','height').
store('t906','height','t908').
load('t909','content_R_37','style').
load('t910','t909','marginTop').
store('t909','marginTop','t912').
load('t913','content_R_37','style').
load('t914','t913','opacity').
store('t913','opacity','t915').
assign('t916','moveBackgroundPosition_R_37').
load('t917','doc_R_37','body').
load('t918','t917','style').
load('t919','t918','backgroundPosition').
store('t918','backgroundPosition','t921').
load('t922','content_R_37','clientHeight').
assign('targetHeight_R_47','t922').
load('t923','expander_R_37','clientHeight').
assign('startHeight_R_47','t923').
load('t924','expander_R_37','style').
load('t925','t924','marginTop').
store('t924','marginTop','0').
actual('212','1','lambda_R_48').
callRet('212','lambda_R_48').
actual('212','2','lambda_R_49').
callRet('212','lambda_R_49').
actual('212','3','500').
callRet('212','500').
actual('212','4','lambda_R_50').
callRet('212','lambda_R_50').
actual('212','5','lambda_R_51').
callRet('212','lambda_R_51').
assign('t926','t927').
ptsTo('lambda_R_48','d_lambda_R_48').
heapPtsTo('d_lambda_R_48','prototype','p_lambda_R_48').
prototype('p_lambda_R_48','h_FP').
methodRet('d_lambda_R_48','lambda_R_48').
ptsTo('lambda_R_49','d_lambda_R_49').
heapPtsTo('d_lambda_R_49','prototype','p_lambda_R_49').
prototype('p_lambda_R_49','h_FP').
methodRet('d_lambda_R_49','lambda_R_49').
ptsTo('lambda_R_50','d_lambda_R_50').
heapPtsTo('d_lambda_R_50','prototype','p_lambda_R_50').
prototype('p_lambda_R_50','h_FP').
methodRet('d_lambda_R_50','lambda_R_50').
formal('d_lambda_R_50','1','v_R_50').
formal('d_lambda_R_50','2','start_R_50').
formal('d_lambda_R_50','3','end_R_50').
ptsTo('lambda_R_51','d_lambda_R_51').
heapPtsTo('d_lambda_R_51','prototype','p_lambda_R_51').
prototype('p_lambda_R_51','h_FP').
methodRet('d_lambda_R_51','lambda_R_51').
methodRet('d_lambda_R_48','0').
load('t928','content_R_37','clientHeight').
methodRet('d_lambda_R_49','t928').
load('t929','expander_R_37','style').
load('t930','t929','height').
store('t929','height','t931').
load('t932','content_R_37','style').
load('t933','t932','marginTop').
store('t932','marginTop','t936').
load('t937','doc_R_37','body').
load('t938','t937','style').
load('t939','t938','backgroundPosition').
store('t938','backgroundPosition','t941').
assign('t942','expandCallback_R_37').
assign('t943','t944').
assign('t945','t946').
load('t948','win_R_37','addEventListener_R_?').
actual('215','1','resize').
callRet('215','resize').
actual('215','2','windowResizer').
callRet('215','windowResizer').
actual('215','3','false').
callRet('215','false').
assign('t947','t949').
load('t951','n_R_52','className').
load('t953','n_R_52','className').
assign('t950','t955').
load('t957','n_R_52','className').
assign('t960','isWindows_R_37').
load('t961','n_R_52','className').
assign('t956','t964').
load('t965','n_R_52','style').
load('t966','t965','display').
store('t965','display','none').
load('t967','n_R_52','className').
store('n_R_52','className','').
load('t969','n_R_52','id').
assign('t968','t970').
load('t972','n_R_52','addEventListener_R_?').
actual('216','1','click').
callRet('216','click').
actual('216','2','lambda_R_53').
callRet('216','lambda_R_53').
actual('216','3','false').
callRet('216','false').
assign('t971','t973').
ptsTo('lambda_R_53','d_lambda_R_53').
heapPtsTo('d_lambda_R_53','prototype','p_lambda_R_53').
prototype('p_lambda_R_53','h_FP').
methodRet('d_lambda_R_53','lambda_R_53').
formal('d_lambda_R_53','1','e_R_53').
load('t975','n_R_52','id').
assign('t974','t975').
load('t977','n_R_52','id').
assign('t976','t978').
load('t980','n_R_52','addEventListener').
actual('217','1','click').
callRet('217','click').
actual('217','2','lambda_R_54').
callRet('217','lambda_R_54').
actual('217','3','false').
callRet('217','false').
assign('t979','t981').
ptsTo('lambda_R_54','d_lambda_R_54').
heapPtsTo('d_lambda_R_54','prototype','p_lambda_R_54').
prototype('p_lambda_R_54','h_FP').
methodRet('d_lambda_R_54','lambda_R_54').
formal('d_lambda_R_54','1','e_R_54').
load('t983','n_R_52','id').
assign('t982','t983').
load('t985','win_R_37','removeEventListener_R_?').
actual('218','1','resize').
callRet('218','resize').
actual('218','2','windowResizer').
callRet('218','windowResizer').
actual('218','3','false').
callRet('218','false').
assign('t984','t986').
assign('t987','t988').
load('t990','window','openDialog_R_?').
actual('220','1','chrome://amznuwl2/content/settings/settings.html').
callRet('220','chrome://amznuwl2/content/settings/settings.html').
actual('220','2','').
callRet('220','None').
actual('220','3','chrome,centerscreen').
callRet('220','chrome,centerscreen').
assign('t989','t991').
load('t993','n_R_55','childNodes').
load('t994','t993','length').
assign('t992','t995').
assign('i_R_55','0').
assign('t997','i_R_55').
assign('t996','t997').
load('t999','n_R_55','childNodes').
load('t1000','t999','i_R_55').
load('t1001','t1000','nodeType').
assign('t998','t1002').
load('t1003','n_R_55','childNodes').
load('t1004','t1003','i_R_55').
methodRet('d_lambda_R_55','t1004').
assign('i_R_55','0').
load('t1005','document','createElement_R_?').
actual('221','1','div').
callRet('221','div').
assign('d_R_56','t1006').
load('t1008','document','doctype').
load('t1009','document','doctype').
load('t1010','t1009','publicId').
load('t1012','document','doctype').
load('t1013','t1012','publicId').
load('t1014','t1013','match_R_?').
actual('222','1','{"regexp": "xhtml", "modifiers": "i"}').
callRet('222','{"regexp": "xhtml", "modifiers": "i"}').
load('t1017','document','doctype').
load('t1018','t1017','publicId').
load('t1019','t1018','match').
actual('223','1','{"regexp": "strict", "modifiers": "i"}').
callRet('223','{"regexp": "strict", "modifiers": "i"}').
assign('t1007','t1021').
load('t1022','html_R_56','replace_R_?').
actual('224','1','{"regexp": "<img(.*)?>", "modifiers": "ig"}').
callRet('224','{"regexp": "<img(.*)?>", "modifiers": "ig"}').
actual('224','2','<img$1/>').
callRet('224','<img$1/>').
assign('html_R_56','t1023').
load('t1024','html_R_56','replace').
actual('225','1','{"regexp": "<br(.*?)>", "modifiers": "ig"}').
callRet('225','{"regexp": "<br(.*?)>", "modifiers": "ig"}').
actual('225','2','<br$1/>').
callRet('225','<br$1/>').
assign('html_R_56','t1025').
load('t1026','html_R_56','replace').
actual('226','1','{"regexp": "&nbsp;", "modifiers": "ig"}').
callRet('226','{"regexp": "&nbsp;", "modifiers": "ig"}').
actual('226','2','&#160;').
callRet('226','&#160;').
assign('html_R_56','t1027').
load('t1028','d_R_56','innerHTML').
store('d_R_56','innerHTML','html_R_56').
actual('227','1','d_R_56').
callRet('227','d_R_56').
methodRet('d_lambda_R_56','t1029').
load('t1030','response_R_57','pushDownHtml').
actual('228','1','t1030').
callRet('228','t1030').
assign('pushDownDiv_R_57','t1031').
load('t1032','response_R_57','expanderHtml').
actual('229','1','t1032').
callRet('229','t1032').
assign('expanderDiv_R_57','t1033').
load('t1035','AMZUWLXT_R_0','runPushDown_R_?').
actual('230','1','window').
callRet('230','window').
actual('230','2','document').
callRet('230','document').
actual('230','3','pushDownDiv_R_57').
callRet('230','pushDownDiv_R_57').
actual('230','4','expanderDiv_R_57').
callRet('230','expanderDiv_R_57').
actual('230','5','lambda_R_58').
callRet('230','lambda_R_58').
assign('t1034','t1036').
ptsTo('lambda_R_58','d_lambda_R_58').
heapPtsTo('d_lambda_R_58','prototype','p_lambda_R_58').
prototype('p_lambda_R_58','h_FP').
methodRet('d_lambda_R_58','lambda_R_58').
load('t1038','chrome','extension').
load('t1039','t1038','sendRequest').
store('t1040','command_R_?','markPushed').
actual('231','1','t1040').
callRet('231','t1040').
assign('t1037','t1041').
load('t1043','chrome','extension').
load('t1044','t1043','sendRequest').
store('t1045','command','detailPageNotify').
actual('232','1','t1045').
callRet('232','t1045').
assign('t1042','t1046').
assign('t1047','run_R_60').
load('t1049','AMZUWLXT_R_0','runPage_R_?').
actual('233','1','window').
callRet('233','window').
actual('233','2','notifyIsDetail_R_0').
callRet('233','notifyIsDetail_R_0').
assign('t1048','t1050').
assign('t1051','t1052').
assign('isOr_R_61','false').
methodRet('d_lambda_R_61','lambda_R_62').
ptsTo('lambda_R_62','d_lambda_R_62').
heapPtsTo('d_lambda_R_62','prototype','p_lambda_R_62').
prototype('p_lambda_R_62','h_FP').
methodRet('d_lambda_R_62','lambda_R_62').
formal('d_lambda_R_62','1','node_R_62').
formal('d_lambda_R_62','2','nodeData_R_62').
load('t1054','tests_R_61','length').
assign('t1053','t1055').
assign('i_R_62','0').
assign('t1057','i_R_62').
assign('t1056','t1057').
load('t1059','tests_R_61','i_R_62').
actual('234','1','node_R_62').
callRet('234','node_R_62').
actual('234','2','nodeData_R_62').
callRet('234','nodeData_R_62').
assign('t1058','t1060').
assign('t1062','isOr_R_61').
assign('t1061','t1062').
methodRet('d_lambda_R_62','false').
assign('t1063','isOr_R_61').
methodRet('d_lambda_R_62','true').
assign('i_R_62','0').
assign('t1064','isOr_R_61').
methodRet('d_lambda_R_62','t1064').
load('t1065','this','genBulkTest_R_?').
actual('235','1','arguments_R_?').
callRet('235','arguments_R_?').
actual('235','2','false').
callRet('235','false').
methodRet('d_lambda_R_63','t1066').
load('t1067','this','genBulkTest_R_?').
actual('236','1','arguments_R_?').
callRet('236','arguments_R_?').
actual('236','2','true').
callRet('236','true').
methodRet('d_lambda_R_64','t1068').
methodRet('d_lambda_R_65','lambda_R_66').
ptsTo('lambda_R_66','d_lambda_R_66').
heapPtsTo('d_lambda_R_66','prototype','p_lambda_R_66').
prototype('p_lambda_R_66','h_FP').
methodRet('d_lambda_R_66','lambda_R_66').
formal('d_lambda_R_66','1','node_R_66').
formal('d_lambda_R_66','2','nodeData_R_66').
actual('237','1','node_R_66').
callRet('237','node_R_66').
actual('237','2','nodeData_R_66').
callRet('237','nodeData_R_66').
assign('t1069','t1070').
methodRet('d_lambda_R_66','true').
assign('nodes_R_66','nodes_R_66').
load('t1072','node_R_66','childNodes').
load('t1073','node_R_66','childNodes').
load('t1074','t1073','length').
assign('t1071','t1075').
load('t1077','nodes_R_66','push_R_?').
load('t1078','node_R_66','childNodes').
load('t1079','t1078','0').
actual('238','1','t1079').
callRet('238','t1079').
assign('t1076','t1080').
load('t1082','nodes_R_66','length').
assign('t1081','t1082').
load('t1083','nodes_R_66','pop_R_?').
assign('i_R_66','t1084').
actual('240','1','i_R_66').
callRet('240','i_R_66').
actual('240','2','t1086').
callRet('240','t1086').
assign('t1085','t1087').
methodRet('d_lambda_R_66','true').
load('t1089','i_R_66','childNodes').
load('t1090','i_R_66','childNodes').
load('t1091','t1090','length').
load('t1093','nodes_R_66','length').
assign('t1088','t1095').
load('t1097','i_R_66','nextSibling').
assign('t1096','t1097').
load('t1099','nodes_R_66','push').
load('t1100','i_R_66','nextSibling').
actual('241','1','t1100').
callRet('241','t1100').
assign('t1098','t1101').
load('t1103','i_R_66','nextSibling').
assign('t1102','t1103').
load('t1105','nodes_R_66','push').
load('t1106','i_R_66','nextSibling').
actual('242','1','t1106').
callRet('242','t1106').
assign('t1104','t1107').
load('t1109','nodes_R_66','push').
load('t1110','i_R_66','childNodes').
load('t1111','t1110','0').
actual('243','1','t1111').
callRet('243','t1111').
assign('t1108','t1112').
methodRet('d_lambda_R_66','false').
assign('t1114','field_R_67').
assign('t1113','t1114').
assign('field_R_67','text').
load('t1116','nodeData_R_67','field_R_67').
assign('t1115','t1117').
methodRet('d_lambda_R_67','null').
assign('t1118','t1119').
assign('t1120','t1121').
load('t1122','nodeData_R_67','html').
load('t1123','node_R_67','innerHTML').
store('nodeData_R_67','html','t1124').
load('t1125','nodeData_R_67','text').
load('t1126','node_R_67','alt').
load('t1127','node_R_67','innerText').
load('t1129','node_R_67','value').
load('t1131','node_R_67','title').
load('t1133','node_R_67','nodeValue').
store('nodeData_R_67','text','t1135').
assign('foundChild_R_68','false').
load('t1137','node_R_68','nodeType').
assign('t1136','t1138').
methodRet('d_lambda_R_68','true').
load('t1140','node_R_68','childNodes').
load('t1141','node_R_68','childNodes').
load('t1142','t1141','length').
assign('t1139','t1144').
load('t1146','node_R_68','childNodes').
load('t1147','t1146','length').
assign('t1145','t1148').
assign('i_R_68','0').
assign('t1150','i_R_68').
assign('t1149','t1150').
load('t1152','node_R_68','childNodes').
load('t1153','t1152','i_R_68').
load('t1154','t1153','nodeType').
assign('t1151','t1155').
assign('foundChild_R_68','true').
assign('i_R_68','0').
assign('t1156','foundChild_R_68').
methodRet('d_lambda_R_68','t1156').
methodRet('d_lambda_R_69','lambda_R_70').
ptsTo('lambda_R_70','d_lambda_R_70').
heapPtsTo('d_lambda_R_70','prototype','p_lambda_R_70').
prototype('p_lambda_R_70','h_FP').
methodRet('d_lambda_R_70','lambda_R_70').
formal('d_lambda_R_70','1','node_R_70').
formal('d_lambda_R_70','2','nodeData_R_70').
actual('244','1','node_R_70').
callRet('244','node_R_70').
actual('244','2','nodeData_R_70').
callRet('244','nodeData_R_70').
load('t1158','Math_R_?','max').
load('t1159','t1158','apply_R_?').
load('t1160','nodeData_R_70','propName_R_69').
actual('245','1','Math_R_?').
callRet('245','Math_R_?').
actual('245','2','t1160').
callRet('245','t1160').
load('t1162','Math_R_?','min').
load('t1163','t1162','apply').
load('t1164','nodeData_R_70','propName_R_69').
actual('246','1','Math_R_?').
callRet('246','Math_R_?').
actual('246','2','t1164').
callRet('246','t1164').
assign('x_R_70','t1168').
methodRet('d_lambda_R_70','x_R_70').
assign('t1170','props_R_71').
assign('t1169','t1170').
load('t1172','props_R_71','length').
assign('t1173','t1172').
assign('t1171','t1174').
store('props_R_71','0','props_R_71').
assign('props_R_71','props_R_71').
store('props_R_71','0','href').
store('props_R_71','1','action').
store('props_R_71','2','src').
store('props_R_71','3','id').
store('props_R_71','4','className').
assign('props_R_71','props_R_71').
methodRet('d_lambda_R_71','lambda_R_72').
ptsTo('lambda_R_72','d_lambda_R_72').
heapPtsTo('d_lambda_R_72','prototype','p_lambda_R_72').
prototype('p_lambda_R_72','h_FP').
methodRet('d_lambda_R_72','lambda_R_72').
formal('d_lambda_R_72','1','node_R_72').
formal('d_lambda_R_72','2','nodeData_R_72').
load('t1176','node_R_72','nodeType').
assign('t1175','t1178').
load('t1179','node_R_72','parentNode').
assign('node_R_72','t1179').
assign('t1180','node_R_72').
load('t1182','props_R_71','length').
assign('t1181','t1183').
assign('i_R_72','0').
assign('t1185','i_R_72').
assign('t1184','t1185').
load('t1187','props_R_71','i_R_72').
load('t1188','node_R_72','t1187').
load('t1189','props_R_71','i_R_72').
load('t1190','node_R_72','t1189').
load('t1191','t1190','search').
assign('t1186','t1192').
assign('t1193','1').
assign('searchResult_R_72','t1193').
load('t1195','props_R_71','i_R_72').
load('t1197','props_R_71','i_R_72').
assign('t1194','t1199').
load('t1200','props_R_71','i_R_72').
load('t1201','node_R_72','t1200').
load('t1202','t1201','search_R_?').
actual('247','1','regex_R_71').
callRet('247','regex_R_71').
assign('searchResult_R_72','t1203').
load('t1204','props_R_71','i_R_72').
load('t1205','node_R_72','t1204').
load('t1206','t1205','replace_R_?').
actual('248','1','{"regexp": "^http(s)*:\\/\\/.*?\\/", "modifiers": ""}').
callRet('248','{"regexp": "^http(s)*:\\/\\/.*?\\/", "modifiers": ""}').
actual('248','2','').
callRet('248','None').
assign('nodomain_R_72','t1207').
load('t1208','nodomain_R_72','search').
actual('249','1','regex_R_71').
callRet('249','regex_R_71').
assign('searchResult_R_72','t1209').
assign('t1211','1').
assign('t1210','t1212').
load('t1214','props_R_71','i_R_72').
assign('t1213','t1215').
load('t1217','node_R_72','href').
load('t1218','t1217','indexOf_R_?').
load('t1219','window','location').
load('t1220','t1219','toString_R_?').
actual('251','1','t1221').
callRet('251','t1221').
assign('t1223','1').
assign('t1216','t1224').
methodRet('d_lambda_R_72','false').
assign('t1225','recordKey_R_71').
load('t1227','nodeData_R_72','recordKey_R_71').
assign('t1228','t1227').
assign('t1226','t1228').
load('t1229','nodeData_R_72','recordKey_R_71').
store('nodeData_R_72','recordKey_R_71','t1229').
load('t1231','nodeData_R_72','recordKey_R_71').
load('t1232','t1231','push_R_?').
actual('252','1','searchResult_R_72').
callRet('252','searchResult_R_72').
assign('t1230','t1233').
methodRet('d_lambda_R_72','true').
assign('i_R_72','0').
methodRet('d_lambda_R_72','false').
assign('t1235','field_R_73').
assign('t1234','t1235').
assign('field_R_73','text').
methodRet('d_lambda_R_73','lambda_R_74').
ptsTo('lambda_R_74','d_lambda_R_74').
heapPtsTo('d_lambda_R_74','prototype','p_lambda_R_74').
prototype('p_lambda_R_74','h_FP').
methodRet('d_lambda_R_74','lambda_R_74').
formal('d_lambda_R_74','1','node_R_74').
formal('d_lambda_R_74','2','nodeData_R_74').
load('t1237','AMZUWLXT_R_0','tests').
load('t1238','t1237','popNodeData_R_?').
actual('253','1','node_R_74').
callRet('253','node_R_74').
actual('253','2','nodeData_R_74').
callRet('253','nodeData_R_74').
actual('253','3','field_R_73').
callRet('253','field_R_73').
assign('t1236','t1239').
load('t1240','nodeData_R_74','field_R_73').
load('t1242','nodeData_R_74','field_R_73').
load('t1243','t1242','match').
load('t1245','nodeData_R_74','field_R_73').
load('t1246','t1245','match_R_?').
actual('254','1','regex_R_73').
callRet('254','regex_R_73').
methodRet('d_lambda_R_74','t1248').
load('t1250','node_R_75','nodeType').
assign('t1249','t1251').
load('t1252','node_R_75','parentNode').
assign('node_R_75','t1252').
load('t1254','node_R_75','tagName').
load('t1255','node_R_75','tagName').
load('t1256','t1255','match_R_?').
actual('255','1','{"regexp": "img", "modifiers": "i"}').
callRet('255','{"regexp": "img", "modifiers": "i"}').
load('t1259','node_R_75','complete').
assign('t1260','t1259').
assign('t1253','t1261').
methodRet('d_lambda_R_75','true').
load('t1262','node_R_75','offsetWidth').
load('t1263','node_R_75','offsetHeight').
load('t1265','node_R_75','offsetWidth').
load('t1267','node_R_75','offsetHeight').
methodRet('d_lambda_R_75','t1270').
assign('t1272','field_R_76').
assign('t1271','t1272').
assign('field_R_76','text').
methodRet('d_lambda_R_76','lambda_R_77').
ptsTo('lambda_R_77','d_lambda_R_77').
heapPtsTo('d_lambda_R_77','prototype','p_lambda_R_77').
prototype('p_lambda_R_77','h_FP').
methodRet('d_lambda_R_77','lambda_R_77').
formal('d_lambda_R_77','1','node_R_77').
formal('d_lambda_R_77','2','nodeData_R_77').
load('t1274','AMZUWLXT_R_0','tests').
load('t1275','t1274','popNodeData_R_?').
load('t1276','nodeData_R_77','text').
actual('256','1','node_R_77').
callRet('256','node_R_77').
actual('256','2','t1276').
callRet('256','t1276').
actual('256','3','field_R_76').
callRet('256','field_R_76').
assign('t1273','t1277').
load('t1278','nodeData_R_77','field_R_76').
load('t1280','nodeData_R_77','field_R_76').
load('t1281','t1280','length').
methodRet('d_lambda_R_77','t1283').
methodRet('d_lambda_R_78','lambda_R_79').
ptsTo('lambda_R_79','d_lambda_R_79').
heapPtsTo('d_lambda_R_79','prototype','p_lambda_R_79').
prototype('p_lambda_R_79','h_FP').
methodRet('d_lambda_R_79','lambda_R_79').
formal('d_lambda_R_79','1','node_R_79').
formal('d_lambda_R_79','2','nodeData_R_79').
load('t1285','node_R_79','nodeType').
assign('t1284','t1286').
load('t1287','node_R_79','parentNode').
assign('node_R_79','t1287').
load('t1288','node_R_79','offsetTop').
assign('offsetY_R_79','t1288').
load('t1289','node_R_79','offsetLeft').
assign('offsetX_R_79','t1289').
load('t1291','node_R_79','offsetParent').
assign('t1290','t1291').
load('t1292','node_R_79','offsetParent').
assign('node_R_79','t1292').
load('t1293','node_R_79','offsetTop').
assign('offsetY_R_79','t1293').
load('t1294','node_R_79','offsetLeft').
assign('offsetX_R_79','t1294').
assign('t1310','t1309').
methodRet('d_lambda_R_79','t1310').
methodRet('d_lambda_R_80','lambda_R_81').
ptsTo('lambda_R_81','d_lambda_R_81').
heapPtsTo('d_lambda_R_81','prototype','p_lambda_R_81').
prototype('p_lambda_R_81','h_FP').
methodRet('d_lambda_R_81','lambda_R_81').
formal('d_lambda_R_81','1','node_R_81').
formal('d_lambda_R_81','2','nodeData_R_81').
actual('257','1','node_R_81').
callRet('257','node_R_81').
actual('257','2','nodeData_R_81').
callRet('257','nodeData_R_81').
assign('t1312','t1311').
methodRet('d_lambda_R_81','t1312').
assign('t1313','t1314').
assign('offset_R_82','false').
methodRet('d_lambda_R_82','lambda_R_83').
ptsTo('lambda_R_83','d_lambda_R_83').
heapPtsTo('d_lambda_R_83','prototype','p_lambda_R_83').
prototype('p_lambda_R_83','h_FP').
methodRet('d_lambda_R_83','lambda_R_83').
formal('d_lambda_R_83','1','node_R_83').
formal('d_lambda_R_83','2','nodeData_R_83').
assign('currentNode_R_83','node_R_83').
assign('height_R_83','0').
assign('t1315','t1317').
actual('258','1','currentNode_R_83').
callRet('258','currentNode_R_83').
actual('258','2','t1319').
callRet('258','t1319').
assign('t1318','t1320').
methodRet('d_lambda_R_83','true').
load('t1321','currentNode_R_83','parentNode').
assign('currentNode_R_83','t1321').
assign('t1323','height_R_83').
assign('t1322','t1323').
methodRet('d_lambda_R_83','false').
methodRet('d_lambda_R_84','lambda_R_85').
ptsTo('lambda_R_85','d_lambda_R_85').
heapPtsTo('d_lambda_R_85','prototype','p_lambda_R_85').
prototype('p_lambda_R_85','h_FP').
methodRet('d_lambda_R_85','lambda_R_85').
formal('d_lambda_R_85','1','node_R_85').
formal('d_lambda_R_85','2','nodeData_R_85').
load('t1325','node_R_85','nodeType').
assign('t1324','t1326').
load('t1327','node_R_85','parentNode').
assign('node_R_85','t1327').
load('t1329','nodeData_R_85','computedStyle').
assign('t1330','t1329').
assign('t1328','t1330').
load('t1332','node_R_85','tagName').
load('t1333','node_R_85','tagName').
assign('t1331','t1335').
load('t1336','nodeData_R_85','computedStyle').
load('t1337','node_R_85','ownerDocument').
load('t1338','t1337','defaultView').
load('t1339','t1338','getComputedStyle_R_?').
actual('259','1','node_R_85').
callRet('259','node_R_85').
actual('259','2','null').
callRet('259','null').
store('nodeData_R_85','computedStyle','t1340').
load('t1341','nodeData_R_85','computedStyle').
load('t1342','nodeData_R_85','computedStyle').
load('t1343','t1342','getPropertyValue').
load('t1345','nodeData_R_85','computedStyle').
load('t1346','t1345','getPropertyValue_R_?').
actual('260','1','style_R_84').
callRet('260','style_R_84').
load('t1348','t1347','match_R_?').
actual('261','1','re_R_84').
callRet('261','re_R_84').
methodRet('d_lambda_R_85','t1350').
methodRet('d_lambda_R_86','lambda_R_87').
ptsTo('lambda_R_87','d_lambda_R_87').
heapPtsTo('d_lambda_R_87','prototype','p_lambda_R_87').
prototype('p_lambda_R_87','h_FP').
methodRet('d_lambda_R_87','lambda_R_87').
formal('d_lambda_R_87','1','node_R_87').
formal('d_lambda_R_87','2','nodeData_R_87').
load('t1352','node_R_87','wrappedJSObject').
assign('t1351','t1352').
load('t1353','node_R_87','propName_R_86').
assign('None','true').
methodRet('d_lambda_R_87','false').
load('t1354','node_R_87','wrappedJSObject').
load('t1355','t1354','propName_R_86').
assign('None','true').
methodRet('d_lambda_R_87','false').
methodRet('d_lambda_R_88','lambda_R_89').
ptsTo('lambda_R_89','d_lambda_R_89').
heapPtsTo('d_lambda_R_89','prototype','p_lambda_R_89').
prototype('p_lambda_R_89','h_FP').
methodRet('d_lambda_R_89','lambda_R_89').
formal('d_lambda_R_89','1','node_R_89').
formal('d_lambda_R_89','2','nodeData_R_89').
load('t1356','node_R_89','ownerDocument').
load('t1357','t1356','defaultView').
load('t1358','t1357','location').
load('t1359','t1358','hostname').
load('t1360','t1359','match_R_?').
actual('262','1','locale_R_88').
callRet('262','locale_R_88').
assign('None','true').
methodRet('d_lambda_R_89','false').
methodRet('d_lambda_R_90','lambda_R_91').
ptsTo('lambda_R_91','d_lambda_R_91').
heapPtsTo('d_lambda_R_91','prototype','p_lambda_R_91').
prototype('p_lambda_R_91','h_FP').
methodRet('d_lambda_R_91','lambda_R_91').
formal('d_lambda_R_91','1','node_R_91').
formal('d_lambda_R_91','2','nodeData_R_91').
load('t1363','console','log_R_?').
actual('263','1','prefix_R_90').
callRet('263','prefix_R_90').
actual('263','2','node_R_91').
callRet('263','node_R_91').
assign('t1362','t1364').
methodRet('d_lambda_R_91','false').
load('t1365','AMZUWLXT_R_0','tests').
assign('t_R_92','t1365').
load('t1366','t_R_92','inNavTest').
load('t1367','t_R_92','genParentsOrTest_R_?').
load('t1368','t_R_92','genPropRegexTest_R_?').
store('t1366','0','id').
store('t1366','1','className').
actual('264','1','{"regexp": "nav|rcm|seemore|ad_|ad\\b", "modifiers": "i"}').
callRet('264','{"regexp": "nav|rcm|seemore|ad_|ad\\b", "modifiers": "i"}').
actual('264','2','t1366').
callRet('264','t1366').
actual('265','1','t1369').
callRet('265','t1369').
actual('265','2','15').
callRet('265','15').
store('t_R_92','inNavTest','t1370').
assign('clickButtonRe_R_92','{"regexp": "^INPUT|BUTTON|A$", "modifiers": "i"}').
load('t1371','t_R_92','genOrTest_R_?').
load('t1372','t_R_92','genPropRegexTest').
store('nodeClickable_R_92','0','tagName').
actual('266','1','clickButtonRe_R_92').
callRet('266','clickButtonRe_R_92').
actual('266','2','nodeClickable_R_92').
callRet('266','nodeClickable_R_92').
load('t1374','t_R_92','attributeExistsTest_R_?').
actual('267','1','onclick').
callRet('267','onclick').
actual('268','1','t1373').
callRet('268','t1373').
actual('268','2','t1375').
callRet('268','t1375').
assign('nodeClickable_R_92','t1376').
load('t1377','t_R_92','isClickableTest').
load('t1378','t_R_92','genOrTest').
load('t1379','t_R_92','genComputedStyleReTest_R_?').
actual('269','1','cursor').
callRet('269','cursor').
actual('269','2','{"regexp": "pointer", "modifiers": "i"}').
callRet('269','{"regexp": "pointer", "modifiers": "i"}').
load('t1381','t_R_92','genChildrenOrTest_R_?').
actual('270','1','nodeClickable_R_92').
callRet('270','nodeClickable_R_92').
load('t1383','t_R_92','genParentsOrTest').
actual('271','1','nodeClickable_R_92').
callRet('271','nodeClickable_R_92').
actual('271','2','5').
callRet('271','5').
actual('272','1','t1380').
callRet('272','t1380').
actual('272','2','nodeClickable_R_92').
callRet('272','nodeClickable_R_92').
actual('272','3','t1382').
callRet('272','t1382').
actual('272','4','t1384').
callRet('272','t1384').
store('t_R_92','isClickableTest','t1385').
load('t1387','chrome','tabs').
load('t1388','t1387','executeScript').
load('t1389','tab_R_93','id').
store('t1390','file_R_?','contentScripts/inject_bookmarklet.js').
actual('273','1','t1389').
callRet('273','t1389').
actual('273','2','t1390').
callRet('273','t1390').
assign('t1386','t1391').
load('t1392','document','getElementById_R_?').
actual('274','1','content').
callRet('274','content').
assign('content_R_94','t1393').
load('t1394','content_R_94','innerHTML').
load('t1395','AMZUWLXT_R_0','Strings').
load('t1396','t1395','process_R_?').
load('t1397','content_R_94','innerHTML').
load('t1398','AMZUWLXT_R_0','Locale').
load('t1399','t1398','getLanguage_R_?').
store('t1394','language','t1400').
load('t1401','AMZUWLXT_R_0','Settings').
load('t1402','t1401','get_R_?').
load('t1404','t1403','locale').
store('t1394','locale','t1404').
actual('277','1','t1397').
callRet('277','t1397').
actual('277','2','undefined').
callRet('277','undefined').
actual('277','3','__objectInit__').
callRet('277','__objectInit__').
store('content_R_94','innerHTML','t1405').
load('t1406','document','createElement_R_?').
actual('278','1','div').
callRet('278','div').
assign('titleEncoder_R_94','t1407').
load('t1408','titleEncoder_R_94','innerHTML').
load('t1409','AMZUWLXT_R_0','Strings').
load('t1410','t1409','process').
load('t1411','document','title').
actual('279','1','t1411').
callRet('279','t1411').
store('titleEncoder_R_94','innerHTML','t1412').
load('t1413','document','title').
load('t1414','titleEncoder_R_94','textContent').
store('document','title','t1414').
load('t1415','document','getElementById').
actual('280','1','submit').
callRet('280','submit').
assign('submit_R_94','t1416').
load('t1417','document','getElementById').
actual('281','1','saved').
callRet('281','saved').
assign('saved_R_94','t1418').
load('t1419','AMZUWLXT_R_0','Settings').
load('t1420','t1419','get').
assign('stagedSettings_R_94','t1421').
load('t1422','document','getElementById').
actual('283','1','notify').
callRet('283','notify').
store('settingsMapping_R_94','notify_R_?','t1423').
load('t1424','document','getElementById').
actual('284','1','push').
callRet('284','push').
store('settingsMapping_R_94','push_R_?','t1425').
load('t1426','document','getElementById').
actual('285','1','pushed').
callRet('285','pushed').
store('settingsMapping_R_94','pushed_R_?','t1427').
load('t1428','document','getElementById').
actual('286','1','locale').
callRet('286','locale').
store('settingsMapping_R_94','locale_R_?','t1429').
assign('settingsMapping_R_94','__objectInit__').
assign('updateSubmitDisplay_R_94','lambda_R_95').
ptsTo('lambda_R_95','d_lambda_R_95').
heapPtsTo('d_lambda_R_95','prototype','p_lambda_R_95').
prototype('p_lambda_R_95','h_FP').
methodRet('d_lambda_R_95','lambda_R_95').
assign('elementChange_R_94','lambda_R_96').
ptsTo('lambda_R_96','d_lambda_R_96').
heapPtsTo('d_lambda_R_96','prototype','p_lambda_R_96').
prototype('p_lambda_R_96','h_FP').
methodRet('d_lambda_R_96','lambda_R_96').
assign('localeChanged_R_94','lambda_R_97').
ptsTo('lambda_R_97','d_lambda_R_97').
heapPtsTo('d_lambda_R_97','prototype','p_lambda_R_97').
prototype('p_lambda_R_97','h_FP').
methodRet('d_lambda_R_97','lambda_R_97').
formal('d_lambda_R_97','1','oldLocale_R_97').
assign('submitForm_R_94','lambda_R_98').
ptsTo('lambda_R_98','d_lambda_R_98').
heapPtsTo('d_lambda_R_98','prototype','p_lambda_R_98').
prototype('p_lambda_R_98','h_FP').
methodRet('d_lambda_R_98','lambda_R_98').
load('t1431','stagedSettings_R_94','hasOwnProperty_R_?').
actual('287','1','i_R_94').
callRet('287','i_R_94').
load('t1433','settingsMapping_R_94','i_R_94').
assign('t1430','t1434').
load('t1436','settingsMapping_R_94','i_R_94').
load('t1437','t1436','type').
assign('t1435','t1438').
load('t1439','settingsMapping_R_94','i_R_94').
load('t1440','t1439','checked').
load('t1441','stagedSettings_R_94','i_R_94').
store('t1439','checked','t1441').
load('t1443','settingsMapping_R_94','i_R_94').
load('t1444','t1443','tagName').
load('t1445','t1444','match_R_?').
actual('288','1','{"regexp": "select", "modifiers": "i"}').
callRet('288','{"regexp": "select", "modifiers": "i"}').
assign('t1442','t1446').
load('t1447','settingsMapping_R_94','i_R_94').
load('t1448','t1447','value').
load('t1449','stagedSettings_R_94','i_R_94').
store('t1447','value','t1449').
load('t1450','settingsMapping_R_94','i_R_94').
load('t1451','t1450','onchange').
store('t1450','onchange','elementChange_R_94').
assign('i_R_94','__undefined__').
load('t1452','submit_R_94','onclick').
store('submit_R_94','onclick','submitForm_R_94').
assign('t1453','t1454').
load('t1456','AMZUWLXT_R_0','Settings').
load('t1457','t1456','equals_R_?').
actual('290','1','stagedSettings_R_94').
callRet('290','stagedSettings_R_94').
assign('t1455','t1458').
load('t1459','submit_R_94','style').
load('t1460','t1459','cursor').
store('t1459','cursor','pointer').
load('t1461','submit_R_94','style').
load('t1462','t1461','opacity').
store('t1461','opacity','1').
load('t1463','submit_R_94','disabled').
store('submit_R_94','disabled','false').
load('t1464','submit_R_94','style').
load('t1465','t1464','cursor').
store('t1464','cursor','default').
load('t1466','submit_R_94','style').
load('t1467','t1466','opacity').
store('t1466','opacity','0.5').
load('t1468','submit_R_94','disabled').
store('submit_R_94','disabled','true').
load('t1469','stagedSettings_R_94','this').
load('t1470','t1469','id').
load('t1471','this','value').
store('t1469','id','t1471').
assign('t1472','t1473').
load('t1474','saved_R_94','style').
load('t1475','t1474','display').
store('t1474','display','none').
load('t1476','AMZUWLXT_R_0','Settings').
load('t1477','t1476','get_R_?').
assign('settings_R_97','t1478').
load('t1480','settings_R_97','localeChanged').
assign('t1481','t1480').
assign('t1479','t1481').
load('t1482','AMZUWLXT_R_0','Locale').
load('t1483','t1482','getLocaleDomain_R_?').
load('t1484','settings_R_97','locale').
actual('293','1','t1484').
callRet('293','t1484').
assign('domain_R_97','t1485').
ptsTo('t1486','n_XMLHttpRequest_R_?_6').
prototype('n_XMLHttpRequest_R_?_6', 'p_XMLHttpRequest_R_?').
assign('xhr_R_97','t1486').
load('t1488','xhr_R_97','open_R_?').
actual('294','1','GET').
callRet('294','GET').
actual('294','2','t1492').
callRet('294','t1492').
actual('294','3','true').
callRet('294','true').
assign('t1487','t1493').
load('t1495','xhr_R_97','send_R_?').
actual('295','1','null').
callRet('295','null').
assign('t1494','t1496').
load('t1498','AMZUWLXT_R_0','Settings').
load('t1499','t1498','set_R_?').
store('t1500','localeChanged','true').
actual('296','1','t1500').
callRet('296','t1500').
assign('t1497','t1501').
load('t1502','AMZUWLXT_R_0','Settings').
load('t1503','t1502','get').
load('t1505','t1504','localeChanged').
assign('hasSubmitted_R_97','t1505').
load('t1507','submit_R_94','disabled').
assign('t1508','t1507').
assign('t1506','t1508').
load('t1509','AMZUWLXT_R_0','Settings').
load('t1510','t1509','get_R_?').
assign('before_R_98','t1511').
load('t1513','AMZUWLXT_R_0','Settings').
load('t1514','t1513','set_R_?').
actual('299','1','stagedSettings_R_94').
callRet('299','stagedSettings_R_94').
assign('t1512','t1515').
load('t1517','before_R_98','locale').
load('t1518','stagedSettings_R_94','locale').
assign('t1516','t1519').
load('t1521','before_R_98','locale').
actual('300','1','t1521').
callRet('300','t1521').
assign('t1520','t1522').
load('t1523','AMZUWLXT_R_0','Settings').
load('t1524','t1523','get').
assign('stagedSettings_R_94','t1525').
assign('t1526','t1527').
load('t1528','saved_R_94','style').
load('t1529','t1528','display').
store('t1528','display','inline').
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

