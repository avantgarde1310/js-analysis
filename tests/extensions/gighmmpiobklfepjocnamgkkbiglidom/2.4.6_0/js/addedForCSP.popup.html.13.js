
          $(function() {
            $("#div_show_resourcelist").click(function() {
              BG.getCurrentTabInfo(function(info) {
                chrome.tabs.sendRequest(info.tab.id, "open_resourcelist");
              });
            });
          });
        