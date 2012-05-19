
          $("#div_help_hide").click(function() {
            $("#help_hide_explanation").slideDown();
          });
          (function() {
            // TODO TEMP: OS X stable users can't hide the browser button yet.
            // This support was added in Chrome 11.  See crbug.com/72746
            var ua = navigator.userAgent.match(/Chrome\/(\d+)\./i);
            if (navigator.platform == "MacIntel" && ua[1] < 11)
              $("#help_hide_explanation").attr("i18n", 'chromebutton_hide_macOSX');
          })();
        