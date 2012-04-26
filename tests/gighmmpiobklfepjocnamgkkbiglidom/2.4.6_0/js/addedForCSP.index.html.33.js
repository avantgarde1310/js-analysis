
        $("#start-chrome.card input").change(function() {
          BGcall("set_setting", "show_google_search_text_ads", this.checked, function() {
            BGcall("update_filters");
          });
        });
      