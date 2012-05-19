
          $(function() {
            var info_ver = chrome.extension.getBackgroundPage().version_to_notify;
            // If there was badge text set, informing the user of a new
            // version, clear it.
            chrome.browserAction.setBadgeText({text: ''});
            chrome.browserAction.setTitle({title: ''});
            localStorage.setItem('saw_badge_version', info_ver);

            if (localStorage.getItem('saw_badge_info_version') != info_ver) {
              // If the user hasn't dismissed the latest notice, show it.
              $("#div_new_release").show();

              $("#new_release_close").click(function() {
                $("#div_new_release").slideUp();
                localStorage.setItem('saw_badge_info_version', info_ver);
              });
            }
          });
        