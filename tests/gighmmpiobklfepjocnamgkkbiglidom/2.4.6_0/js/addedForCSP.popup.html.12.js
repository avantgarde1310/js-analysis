
          $("#div_whitelist").click(function() {
            BG.getCurrentTabInfo(function(info) {
              BG.emit_page_broadcast(
                {fn:'top_open_whitelist_ui', options:{}},
                { tab: info.tab } // fake sender to determine target page
              );
              window.close();
            });
          });
        