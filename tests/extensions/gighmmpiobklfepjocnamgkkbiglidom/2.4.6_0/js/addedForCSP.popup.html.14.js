
          $(function() {
            $("#div_report_an_ad").click(function() {
              BG.getCurrentTabInfo(function(info) {
                var url = chrome.extension.getURL("pages/adreport.html") +
                          "?url=" + escape(info.tab.url);
                chrome.tabs.create({url: url});
              });
            });
          });
        