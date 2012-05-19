
var preferredTargetMap={};var currentTabId;var pubIDTabMap={};$(document).ready(function(){isAddThis()?addthis.addEventListener('addthis.ready',onAddThisReady):onAddThisReady();});function dfltTargets(){var defaultList=[{facebook:"Facebook"},{email:"Email"},{twitter:"Twitter"},{delicious:"Delicious"},{myspace:"Myspace",google:"Google",stumbleupon:"Stumbleupon",digg:"Digg"}];for(var i=0;i<defaultList.length;i++){var defaultService=defaultList[i];for(var service in defaultService)
preferredTargetMap[service]=new OExchangeTarget(service,defaultService[service]);}}
function loadPreferredTargets(){preferredTargetMap={};if(localStorage["addthis_sshp"]==undefined){localStorage["addthis_sshp"]="facebook,myspace,google,twitter,digg,delicious,email,stumbleupon";}
var prefServices=localStorage["addthis_sshp"].split(',');if(prefServices.length){for(var i=0;i<prefServices.length;i++){var target=new OExchangeTarget(prefServices[i],isAddThis()?addthis.util.getServiceName(prefServices[i]):"");preferredTargetMap[target.name]=target;}}}
function onAddThisReady(evt){populatePreferredItems();}
function getFinalPreferredTargets(){populatePreferredItems();return preferredTargetMap;}
function injectContentScript(tabID){chrome.tabs.executeScript(tabID!=null?tabID:null,{file:"scripts/utils/addthisutil/content-script.js"});chrome.extension.onRequest.addListener(function(pub,sender){if(pub){pubid=pub;pubIDTabMap[((typeof(sender)!="undefined"))&&(sender&&sender.tab&&sender.tab.id)?sender.tab.id:currentTabId]=pub;}else
pubIDTabMap[((typeof(sender)!="undefined"))&&(sender&&sender.tab&&sender.tab.id)?sender.tab.id:currentTabId]="AddThis";});}
function populatePreferredItems(){loadPreferredTargets();if(preferredTargetMap==null||preferredTargetMap=={}){dfltTargets();}}
function isAddThis(){return(typeof(addthis)!="undefined");}