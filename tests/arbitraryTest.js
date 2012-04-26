//chrome = {
//    extension: {
//        onRequest : function(callerID){
//            return callerID;
//        }
//    },
//    tabs: {
//        execute : function(execID){
//            return execID;
//        }
//    }
//};
//if (SAFARI) {
//
//  // Replace the 'chrome' object with a Safari adapter.
//  chrome = {
//
//    extension: {
//
//      sendRequest: (function() {
//        // The function we'll return at the end of all this
//        function theFunction(data, callback) {
//          var callbackToken = "callback" + Math.random();
//
//          // Listen for a response for our specific request token.
//          addOneTimeResponseListener(callbackToken, callback);
//
//          var x = safari.self.tab || safari.application.activeBrowserWindow.activeTab.page;
//          x.dispatchMessage("request", {
//            data: data,
//            callbackToken: callbackToken
//          });
//        }
//
//        // Make a listener that, when it hears sendResponse for the given 
//        // callbackToken, calls callback(resultData) and deregisters the 
//        // listener.
//        function addOneTimeResponseListener(callbackToken, callback) {
//
//          var responseHandler = function(messageEvent) {
//            if (messageEvent.name != "response")
//              return;
//            if (messageEvent.message.callbackToken != callbackToken)
//              return;
//
//            callback(messageEvent.message.data);
//            // Change to calling in 0-ms setTimeout, as Safari team thinks
//            // this will work around their crashing until they can release
//            // a fix.
//            // safari.self.removeEventListener("message", responseHandler, false);
//            window.setTimeout(function() {
//              safari.self.removeEventListener("message", responseHandler, false);
//            }, 0);
//          };
//
//          addListener(responseHandler);
//        }
//
//        return theFunction;
//      })(),
//
//      onRequest: {
//        addListener: function(handler) {
//          addListener(function(messageEvent) {
//            // Only listen for "sendRequest" messages
//            if (messageEvent.name != "request")
//              return;
//
//            var request = messageEvent.message.data;
//            var id = chrome.__getTabId(messageEvent.target);
//
//            var sender = { tab: { id: id, url: messageEvent.target.url } };
//            var sendResponse = function(dataToSend) {
//              var responseMessage = { callbackToken: messageEvent.message.callbackToken, data: dataToSend };
//              messageEvent.target.page.dispatchMessage("response", responseMessage);
//            }
//            handler(request, sender, sendResponse);
//          });
//        },
//      },
//
//      connect: function(port_data) {
//        var portUuid = "portUuid" + Math.random();
//        var x = safari.self.tab || safari.application.activeBrowserWindow.activeTab.page;
//        x.dispatchMessage("port-create", {name: port_data.name, uuid: portUuid});
//
//        var newPort = {
//          name: port_data.name,
//          onMessage: { 
//            addListener: function(listener) {
//              addListener(function(messageEvent) {
//                // If the message was a port.postMessage to our port, notify our listener.
//                if (messageEvent.name != "port-postMessage") 
//                  return;
//                if (messageEvent.message.portUuid != portUuid)
//                  return;
//                listener(messageEvent.message.data);
//              });
//            } 
//          }
//        };
//        return newPort;
//      },
//
//      onConnect: {
//        addListener: function(handler) {
//          // Listen for port creations
//          addListener(function(messageEvent) {
//            if (messageEvent.name != "port-create")
//              return;
//
//            var portName = messageEvent.message.name;
//            var portUuid = messageEvent.message.uuid;
//
//            var id = chrome.__getTabId(messageEvent.target);
//
//            var newPort = {
//              name: portName,
//              sender: { tab: { id: id, url: messageEvent.target.url } },
//              onDisconnect: { 
//                addListener: function() { 
//                  console.log("CHROME PORT LIBRARY: chrome.extension.onConnect.addListener: port.onDisconnect is not implemented, so I'm doing nothing.");
//                }
//              },
//              postMessage: function(data) {
//                if (! messageEvent.target.page) {
//                  console.log("Oops, this port has already disappeared -- cancelling.");
//                  return;
//                }
//                messageEvent.target.page.dispatchMessage("port-postMessage", { portUuid: portUuid, data: data });
//              }
//            };
//
//            // Inform the onNewPort caller about the new port
//            handler(newPort);
//          });
//        }
//      },
//
//      onRequestExternal: {
//        addListener: function() {
//          console.log("CHROME PORT LIBRARY: onRequestExternal not supported.");
//        }
//      }
//    },
//
//    i18n: (function() {
//
//      function syncFetch(file, fn) {
//        var xhr = new XMLHttpRequest();
//        xhr.open("GET", chrome.extension.getURL(file), false);
//        xhr.onreadystatechange = function() {
//          if(this.readyState == 4 && this.responseText != "") {
//            fn(this.responseText);
//          }
//        };
//        try {
//          xhr.send();
//        }
//        catch (e) {
//          // File not found, perhaps
//        }
//      }
//
//      // Insert substitution args into a localized string.
//      function parseString(msgData, args) {
//        // If no substitution, just turn $$ into $ and short-circuit.
//        if (msgData.placeholders == undefined && args == undefined)
//          return msgData.message.replace(/\$\$/g, '$');
//
//        // Substitute a regex while understanding that $$ should be untouched
//        function safesub(txt, re, replacement) {
//          var dollaRegex = /\$\$/g, dollaSub = "~~~I18N~~:";
//          txt = txt.replace(dollaRegex, dollaSub);
//          txt = txt.replace(re, replacement);
//          // Put back in "$$" ("$$$$" somehow escapes down to "$$")
//          var undollaRegex = /~~~I18N~~:/g, undollaSub = "$$$$";
//          txt = txt.replace(undollaRegex, undollaSub);
//          return txt;
//        }
//
//        var $n_re = /\$([1-9])/g;
//        var $n_subber = function(_, num) { return args[num - 1]; };
//
//        var placeholders = {};
//        // Fill in $N in placeholders
//        for (var name in msgData.placeholders) {
//          var content = msgData.placeholders[name].content;
//          placeholders[name.toLowerCase()] = safesub(content, $n_re, $n_subber);
//        }
//        // Fill in $N in message
//        var message = safesub(msgData.message, $n_re, $n_subber);
//        // Fill in $Place_Holder1$ in message
//        message = safesub(message, /\$([a-zA-Z0-9_]+?)\$/g, function(full, name) {
//          var lowered = name.toLowerCase();
//          if (lowered in placeholders)
//            return placeholders[lowered];
//          return full; // e.g. '$FoO$' instead of 'foo'
//        });
//        // Replace $$ with $
//        message = message.replace(/\$\$/g, '$');
//
//        return message;
//      }
//
//      var l10nData = undefined;
//
//      var theI18nObject = {
//        // chrome.i18n.getMessage() may be used in any extension resource page
//        // without any preparation.  But if you want to use it from a content
//        // script in Safari, the content script must first run code like this:
//        //
//        //   get_localization_data_from_global_page_async(function(data) {
//        //     chrome.i18n._setL10nData(data);
//        //     // now I can call chrome.i18n.getMessage()
//        //   });
//        //   // I cannot call getMessage() here because the above call
//        //   // is asynchronous.
//        //
//        // The global page will need to receive your request message, call
//        // chrome.i18n._getL10nData(), and return its result.
//        //
//        // We can't avoid this, because the content script can't load
//        // l10n data for itself, because it's not allowed to make the xhr
//        // call to load the message files from disk.  Sorry :(
//        _getL10nData: function() {
//          var result = { locales: [] };
//
//          // == Find all locales we might need to pull messages from, in order
//          // 1: The user's current locale, converted to match the format of
//          //    the _locales directories (e.g. "en-US" becomes "en_US"
//          result.locales.push(navigator.language.replace('-', '_'));
//          // 2: Perhaps a region-agnostic version of the current locale
//          if (navigator.language.length > 2)
//            result.locales.push(navigator.language.substring(0, 2));
//          // 3: Set English 'en' as default locale
//          if (result.locales.indexOf("en") == -1)
//            result.locales.push("en");
//
//          // Load all locale files that exist in that list
//          result.messages = {};
//          for (var i = 0; i < result.locales.length; i++) {
//            locale = result.locales[i];
//            var file = "_locales/" + locale + "/messages.json";
//            // Doesn't call the callback if file doesn't exist
//            syncFetch(file, function(text) {
//              result.messages[locale] = JSON.parse(text);
//            });
//          }
//
//          return result;
//        },
//
//        // Manually set the localization data.  You only need to call this
//        // if using chrome.i18n.getMessage() from a content script, before
//        // the first call.  You must pass the value of _getL10nData(),
//        // which can only be called by the global page.
//        _setL10nData: function(data) {
//          l10nData = data;
//        },
//
//        getMessage: function(messageID, args) {
//          if (l10nData == undefined) {
//            // Assume that we're not in a content script, because content 
//            // scripts are supposed to have set l10nData already
//            chrome.i18n._setL10nData(chrome.i18n._getL10nData());
//          }
//          if (typeof args == "string")
//            args = [args];
//          for (var i = 0; i < l10nData.locales.length; i++) {
//            var map = l10nData.messages[l10nData.locales[i]];
//            // We must have the locale, and the locale must have the message
//            if (map && messageID in map)
//              return parseString(map[messageID], args);
//          }
//          return "";
//        }
//      };
//
//      return theI18nObject;
//    })(),
//
//    tabs: {
//      create: function(options) {
//        var window = safari.application.activeBrowserWindow;
//        var urlToOpen = chrome.extension.getURL(options.url);
//        window.openTab("foreground").url = urlToOpen;
//      }
//    }
//  };
//}

//if ("a" in chrome.tabs.onRequest){
//    execute();
//}

//(function(c,j){function k(a){return!c(a).parents().andSelf().filter(function(){return c.curCSS(this,"visibility")==="hidden"||c.expr.filters.hidden(this)}).length}c.ui=c.ui||{};if(!c.ui.version){c.extend(c.ui,{version:"1.8.11",keyCode:{ALT:18,BACKSPACE:8,CAPS_LOCK:20,COMMA:188,COMMAND:91,COMMAND_LEFT:91,COMMAND_RIGHT:93,CONTROL:17,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,INSERT:45,LEFT:37,MENU:93,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,
//NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SHIFT:16,SPACE:32,TAB:9,UP:38,WINDOWS:91}});c.fn.extend({_focus:c.fn.focus,focus:function(a,b){return typeof a==="number"?this.each(function(){var d=this;setTimeout(function(){c(d).focus();b&&b.call(d)},a)}):this._focus.apply(this,arguments)},scrollParent:function(){var a;a=c.browser.msie&&/(static|relative)/.test(this.css("position"))||/absolute/.test(this.css("position"))?this.parents().filter(function(){return/(relative|absolute|fixed)/.test(c.curCSS(this,
//"position",1))&&/(auto|scroll)/.test(c.curCSS(this,"overflow",1)+c.curCSS(this,"overflow-y",1)+c.curCSS(this,"overflow-x",1))}).eq(0):this.parents().filter(function(){return/(auto|scroll)/.test(c.curCSS(this,"overflow",1)+c.curCSS(this,"overflow-y",1)+c.curCSS(this,"overflow-x",1))}).eq(0);return/fixed/.test(this.css("position"))||!a.length?c(document):a},zIndex:function(a){if(a!==j)return this.css("zIndex",a);if(this.length){a=c(this[0]);for(var b;a.length&&a[0]!==document;){b=a.css("position");
//if(b==="absolute"||b==="relative"||b==="fixed"){b=parseInt(a.css("zIndex"),10);if(!isNaN(b)&&b!==0)return b}a=a.parent()}}return 0},disableSelection:function(){return this.bind((c.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(a){a.preventDefault()})},enableSelection:function(){return this.unbind(".ui-disableSelection")}});c.each(["Width","Height"],function(a,b){function d(f,g,l,m){c.each(e,function(){g-=parseFloat(c.curCSS(f,"padding"+this,true))||0;if(l)g-=parseFloat(c.curCSS(f,
//"border"+this+"Width",true))||0;if(m)g-=parseFloat(c.curCSS(f,"margin"+this,true))||0});return g}var e=b==="Width"?["Left","Right"]:["Top","Bottom"],h=b.toLowerCase(),i={innerWidth:c.fn.innerWidth,innerHeight:c.fn.innerHeight,outerWidth:c.fn.outerWidth,outerHeight:c.fn.outerHeight};c.fn["inner"+b]=function(f){if(f===j)return i["inner"+b].call(this);return this.each(function(){c(this).css(h,d(this,f)+"px")})};c.fn["outer"+b]=function(f,g){if(typeof f!=="number")return i["outer"+b].call(this,f);return this.each(function(){c(this).css(h,
//d(this,f,true,g)+"px")})}});c.extend(c.expr[":"],{data:function(a,b,d){return!!c.data(a,d[3])},focusable:function(a){var b=a.nodeName.toLowerCase(),d=c.attr(a,"tabindex");if("area"===b){b=a.parentNode;d=b.name;if(!a.href||!d||b.nodeName.toLowerCase()!=="map")return false;a=c("img[usemap=#"+d+"]")[0];return!!a&&k(a)}return(/input|select|textarea|button|object/.test(b)?!a.disabled:"a"==b?a.href||!isNaN(d):!isNaN(d))&&k(a)},tabbable:function(a){var b=c.attr(a,"tabindex");return(isNaN(b)||b>=0)&&c(a).is(":focusable")}});
//c(function(){var a=document.body,b=a.appendChild(b=document.createElement("div"));c.extend(b.style,{minHeight:"100px",height:"auto",padding:0,borderWidth:0});c.support.minHeight=b.offsetHeight===100;c.support.selectstart="onselectstart"in b;a.removeChild(b).style.display="none"});c.extend(c.ui,{plugin:{add:function(a,b,d){a=c.ui[a].prototype;for(var e in d){a.plugins[e]=a.plugins[e]||[];a.plugins[e].push([b,d[e]])}},call:function(a,b,d){if((b=a.plugins[b])&&a.element[0].parentNode)for(var e=0;e<b.length;e++)a.options[b[e][0]]&&
//b[e][1].apply(a.element,d)}},contains:function(a,b){return document.compareDocumentPosition?a.compareDocumentPosition(b)&16:a!==b&&a.contains(b)},hasScroll:function(a,b){if(c(a).css("overflow")==="hidden")return false;b=b&&b==="left"?"scrollLeft":"scrollTop";var d=false;if(a[b]>0)return true;a[b]=1;d=a[b]>0;a[b]=0;return d},isOverAxis:function(a,b,d){return a>b&&a<b+d},isOver:function(a,b,d,e,h,i){return c.ui.isOverAxis(a,d,h)&&c.ui.isOverAxis(b,e,i)}})}})(jQuery);

c.ui=c.ui||{};
