
      // TODO: This is a dumb race condition, and still has a bug where
      // if the user reloads/closes the options page within a second
      // of clicking this, the filters aren't rebuilt.  Call this inside
      // the feature change handler if it's this checkbox being clicked.
      $("#enable_show_google_search_text_ads").change(function() {
        // Give the setting a sec to get saved by the other
        // change handler before recalculating filters.
        window.setTimeout(function() { 
          BGcall("update_filters");
        }, 1000);
      });
    