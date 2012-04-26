
          $(function() {
            $("#div_status_paused a").click(function() {
              localStorage.removeItem('adblock_is_paused');
              BG.updateButtonUIAndContextMenus();
              window.close();
            });
          });
        