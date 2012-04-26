
          $("#div_blacklist").click(function() {
            BG.getCurrentTabInfo(function(info) {
              BG.emit_page_broadcast(
                {fn:'top_open_blacklist_ui', options: { nothing_clicked: true }},
                { tab: info.tab } // fake sender to determine target page
              );
              window.close();
            });
          });
        