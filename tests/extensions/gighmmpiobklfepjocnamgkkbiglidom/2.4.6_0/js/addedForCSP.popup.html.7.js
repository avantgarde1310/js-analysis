
          $("#div_status_whitelisted a").click(function() {
            BG.getCurrentTabInfo(function(info) {
              if (BG.try_to_unwhitelist(info.tab.url)) {
                // Reload the tab
                chrome.tabs.update(info.tab.id, {url: info.tab.url});
                window.close();
              } else {
                $("#div_status_whitelisted").
                  replaceWith(translate("disabled_by_filter_lists"));
              }
            });
          });
        