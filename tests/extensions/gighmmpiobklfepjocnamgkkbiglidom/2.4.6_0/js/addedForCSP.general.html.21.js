
    $(function() {
      // Check or uncheck each loaded DOM option checkbox according to the 
      // user's saved settings.
      function load_options() {
        // Check or uncheck each option.
        for (var name in optionalSettings) {
          $("#enable_" + name).
            attr("checked", optionalSettings[name]);
        }
        $("input.feature:checkbox").change(function() {
          var is_enabled = $(this).is(':checked');
          var name = this.id.substring(7); // TODO: hack
          BGcall("set_setting", name, is_enabled);
        });
      }
      load_options();
    });
  