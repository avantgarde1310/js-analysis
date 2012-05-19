
      // Sanitize query params
      var QPS = (function() {
        var result = {};
        var parts = document.location.search.split('&');
        for (var i = 0; i < parts.length; i++) {
          var kv = parts[i].match(/([a-zA-Z_]+)=([a-zA-Z_0-9\.]*)/);
          if (!kv) continue;
          result[kv[1]] = kv[2];
        }
        return result;
      })();
      var installPageVersion = 1;
      localStorage['saw_install_page'] = installPageVersion;
      $(function() {
        // Slide cards upon nav link click
        $(".nav a").click(function() {
          var pad = 100; // Make darn sure elements slide offscreen
          $("body").css("overflow", "hidden"); // No scrollbars while sliding things around

          // Control whether things slide to the left or downward
          var edge = $(this).hasClass("down") ? "top" : "left";
          var diameterFn = $(this).hasClass("down") ? "height" : "width";

          // Where new content slides to
          var marker = $("#wrapper").position();

          // Put target card in place offscreen.
          var target = $("#" + this.name);
          // Give the donation card more room.
          if (this.name == 'last-step') {
            marker.top -= 90;
            $("#header").animate({"margin-bottom": 5, "margin-top": 5});
          }
          target.css(marker);
          target.css(edge, $(document)[diameterFn]() + pad);
          target.show();


          // Slide my card off screen
          var myCard = $(this).closest(".card");
          myCard.css("z-index", 1);
          var how = {};
          how[edge] = (myCard[diameterFn]() + pad) * -1;
          myCard.animate(how, function() { myCard.hide(); });

          // Slide target card onscreen
          target.css("z-index", 2);
          var that = this;
          target.animate(marker, function() {
            $("body").css("overflow", "auto");
            if (that.name == "last-step")
              $("#last-step #payment-types").each(function(el) { this.scrollIntoView(true); });
          });

          return false;
        });
      });

      // Called after progress bar finishes
      function begin() {
        var SAFARI = (!/chrome/i.test(navigator.userAgent) && /safari/i.test(navigator.userAgent));
        $("#header").fadeIn();
        var startCard = (SAFARI ? "#start-safari": "#start-chrome");
        $(startCard).css($("#wrapper").position()).fadeIn();
      }
    