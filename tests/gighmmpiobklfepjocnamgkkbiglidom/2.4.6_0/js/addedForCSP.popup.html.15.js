
          $("#div_options").click(function() {
            chrome.tabs.create({url:chrome.extension.getURL("options/index.html")});
          });
        