
          $("#div_whitelist_page").click(function() {
            BG.getCurrentTabInfo(function(info) {
              var url = info.tab.url.replace(/#.*$/, '');  // Remove anchors
              var url_parts = url.match(/^([^\?]+)(\??)/); // Detect querystring
              var has_querystring = url_parts[2];
              var filter = '@@|' + url_parts[1] + 
                (has_querystring ? '?' : '|') + '$document';
              BG.add_custom_filter(filter);
              // Reload the tab
              chrome.tabs.update(info.tab.id, {url: info.tab.url});
              window.close();
            });
          });
        