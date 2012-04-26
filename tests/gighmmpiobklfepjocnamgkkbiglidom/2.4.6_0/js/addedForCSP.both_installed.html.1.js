
      $(function() {
        $("#link_to_fix").click(function() {
          // Since users may not click links to chrome:// pages, we use a hack.
          chrome.tabs.create({url:"chrome://extensions"});
        });
      });
    