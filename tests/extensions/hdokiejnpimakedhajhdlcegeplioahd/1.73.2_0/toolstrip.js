var g_toolstripid=get_random(0,999999999),g_moles={},g_curmole=null,g_newmole=null,g_changepwnewpw="",g_changepwtld="",g_browseraction=document.location.href.indexOf("?browseraction=1")!=-1,g_yubikey=document.location.href.indexOf("&yubikey=1")!=-1,g_sesame=document.location.href.indexOf("&sesame=1")!=-1,g_grid=document.location.href.indexOf("&grid=1")!=-1,g_generate=document.location.href.indexOf("&generate=1")!=-1,g_chooseprofilecc=document.location.href.indexOf("&chooseprofilecc=1")!=-1,g_changepw=
document.location.href.indexOf("&changepw=1")!=-1,g_generate_url="",g_generate_found=false,g_tabid=null,matches=document.location.href.match(/&tabid=(\d+)/);if(matches)g_tabid=matches[1];var g_ismenu=false;
function onLoad(a){if(a){if(g_generate){g_generate_url=getBG().g_generate_url;if(getBG().g_generate_url!="")getBG().g_generate_url_prev=getBG().g_generate_url;getBG().g_generate_url=""}if(g_changepw){g_changepwnewpw=getBG().g_changepwnewpw;g_changepwtld=getBG().g_changepwtld}L("TS["+g_toolstripid+"] : loaded");g_ischrome&&sendBG({cmd:"getloginstate"});g_curmole="lpbutton";addmole("lpbutton");addmole("lpmenu",onheightmenu,oninitmenu,onshowmenu,onhidemenu);addmole("lpnotify",80,oninitnotify,onshownotify);
addmole("lpgenerate",300,oninitgenerate,onshowgenerate,onhidegenerate);addmole("lpchooseprofilecc",300,oninitchooseprofilecc,onshowchooseprofilecc,onhidechooseprofilecc);addmole("lpchangepw",300,oninitchangepw,onshowchangepw,onhidechangepw);addmole("lpyubikey",350,oninityubikey,onshowyubikey,onhideyubikey);addmole("lpsesame",350,oninitsesame,onshowsesame,onhidesesame);addmole("lpgrid",350,oninitgrid,onshowgrid,onhidegrid);for(var b in g_moles){if(b!="lpbutton"||g_browseraction)$("#"+b).hide();typeof g_moles[b].initfunc==
"function"&&g_moles[b].initfunc()}if(g_browseraction)if(g_yubikey)openmole("lpyubikey");else if(g_sesame)openmole("lpsesame");else if(g_grid)openmole("lpgrid");else if(g_generate)openmole("lpgenerate");else if(g_chooseprofilecc)openmole("lpchooseprofilecc");else if(g_changepw)openmole("lpchangepw");else if(getBG()!=null&&getBG().g_badgedata!=null){receiveBG(getBG().g_badgedata);getBG().clear_badge()}else{g_ismenu=true;openmenu()}}else get_data(g_changepw?"toolstripchangepw":"toolstrip",function(){onLoad(true)})}
var g_closed=false;function onUnload(){g_closed=true;typeof g_moles[g_curmole].hidefunc=="function"&&g_moles[g_curmole].hidefunc()}function sendBG(a){try{var b=getBG();if(b){L("TS -> BG : cmd="+a.cmd);return b.receiveTS(g_toolstripid,a)}L("TS -> BG : FAILED")}catch(c){L("TS -> BG : FAILED error="+c)}return null}
function receiveBG(a){if(typeof a.cmd=="undefined")L("BG -> TS : INVALIDMSG");else{L("BG -> TS : "+a.cmd);switch(a.cmd){case "login":$("#lpicon").attr("src","icon.gif");$("#lploggedin").show();$("#lplogin").hide();break;case "logoff":g_curmole=="lpmenu"&&closemole();$("#lpicon").attr("src","icon_gray.gif");$("#lploggedin").hide();$("#lplogin").show();break;case "genpw":openmole("lpgenerate");break;case "chooseprofilecc":openmole("lpchooseprofilecc");break;case "changepw":g_changepwnewpw=a.newpw;g_changepwtld=
a.tld;openmole("lpchangepw");break;case "yubikey":openmole("lpyubikey");break;case "sesame":openmole("lpsesame");break;case "notification":a=a.type;if(getBG().lpGetPref("showNotifications",1)!=0||a=="error"||a=="upgrade")openmole("lpnotify");break;default:L("BG -> TS : INVALIDMSG")}}}function isloggedin(){return getBG().lploggedin}function openmenu(){if(isloggedin())openmole("lpmenu");else{closemole();getBG().open_login(true)}}
function addmole(a,b,c,d,e){g_moles[a]={height:b,initfunc:c,showfunc:d,hidefunc:e}}function hidemenu(){$("#menucontainer").hide()}function hidemoles(){for(var a in g_moles)if(a!="lpbutton"||g_browseraction)$("#"+a).hide()}
function closemole(){if(g_browseraction)if(g_ismenu||g_yubikey||g_curmole=="lpnotify"||g_curmole=="lpchangepw")setTimeout(function(){window.close()},0);else{if(!g_closed){g_closed=true;setTimeout(function(){getBG().closecurrenttab("")},0)}}else{$("#body").css("background","");g_newmole=null;g_curmole!="lpbutton"&&chrome.toolstrip.collapse({})}}
function openmole(a){g_browseraction?hidemoles():closemole();$("#content").show();g_newmole=a;if(a=="lpbutton"){$("#lpbutton").show();typeof g_moles.lpbutton.showfunc=="function"&&g_moles.lpbutton.showfunc()}else if(g_curmole=="lpbutton"){$("#lpbutton").hide();typeof g_moles.lpbutton.hidefunc=="function"&&g_moles.lpbutton.hidefunc();if(g_ischrome)getBG().get_selected_tab(null,function(b){getBG().setcurrenttabid(b.id);getBG().setcurrenturl(b.url);if(g_browseraction)toolstrip_expanded();else{b=typeof g_moles[g_newmole].height==
"function"?g_moles[g_newmole].height():g_moles[g_newmole].height;chrome.toolstrip.expand({height:b})}});else if(g_issafari||g_isopera)toolstrip_expanded()}else if(g_browseraction)toolstrip_expanded();else{a=typeof g_moles[g_newmole].height=="function"?g_moles[g_newmole].height():g_moles[g_newmole].height;chrome.toolstrip.expand({height:a})}}
if(!g_browseraction){chrome.toolstrip.onCollapsed.addListener(function(){L("TS: collapsing mole="+g_curmole);typeof g_moles[g_curmole].hidefunc=="function"&&g_moles[g_curmole].hidefunc();$("#"+g_curmole).hide();g_curmole="lpbutton";$("#lpbutton").show();typeof g_moles.lpbutton.showfunc=="function"&&g_moles.lpbutton.showfunc()});chrome.toolstrip.onExpanded.addListener(toolstrip_expanded)}
function toolstrip_expanded(){g_curmole=g_newmole;g_newmole=null;typeof g_moles[g_curmole].showfunc=="function"&&g_moles[g_curmole].showfunc();$("#"+g_curmole).show()};