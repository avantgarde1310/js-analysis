
          $("#titletext span").click(function() {
            var url = "https://chrome.google.com/webstore/detail/gighmmpiobklfepjocnamgkkbiglidom";
            chrome.tabs.create({url:url});
          });
        