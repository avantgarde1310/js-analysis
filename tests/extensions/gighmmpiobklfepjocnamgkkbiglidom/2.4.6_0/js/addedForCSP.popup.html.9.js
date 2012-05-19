
          $("#div_pause_adblock").click(function() {
            localStorage.setItem('adblock_is_paused', true);
            BG.updateButtonUIAndContextMenus();
            chrome.contextMenus.removeAll();
            window.close();
          });
        