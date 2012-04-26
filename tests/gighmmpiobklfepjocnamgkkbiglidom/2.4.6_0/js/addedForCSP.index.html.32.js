
        var start = new Date();
        var steps = 0;
        (function() {
          // Show a loading progress indicator for a few seconds while the user
          // gets her bearings.

          var runLength = 2500; // Should take this many ms
          var pctTime = (new Date() - start) / runLength; // Goes from 0 to 1

          // Start slow, then speed up.
          var pctDone = Math.pow(pctTime, 4);

          var bar = $("#chrome-loading-progress");
          if (bar.length > 0) // Chrome
            bar[0].value = pctDone;
          else // Safari
            $("#safari-loading-progress").text(Math.min(100, Math.round(pctDone * 100)));

          if (pctDone < 1) {
            window.setTimeout(arguments.callee, 20);
            return;
          }

          window.setTimeout(function() {
            // Loaded
            $("#loading-wrapper").
              find("#done").fadeIn().end().
              delay(1800).
              fadeOut(function() {
                begin();
              });
          }, 200);
        })();
      