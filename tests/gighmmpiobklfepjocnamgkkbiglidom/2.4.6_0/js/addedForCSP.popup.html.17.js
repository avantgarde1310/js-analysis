
        $(function() {
          var state = "initial";
          var bodysize = { width: $("body").width(), height: $("body").height() };
          $("#donate_open").click(function() {
            if (state == "initial") {
              $("#donation_wrapper iframe").
                attr("src", "http://chromeadblock.com/donate/?src=chromepopup");
            }
            if (state == "open")
              return;
            state = "open";
            $("#donate_close").show();
            $("body").animate({width: 780, height: 490}, {queue:false});
            $("#menu-items").slideUp();
            $("#donation_wrapper").
              width(0).height(0).show().
              animate({width: 730, height: 450}, {queue:false});
          });
          $("#donate_close").click(function() {
            if (state != "open")
              return;
            state = "closed";
            $("body").animate(bodysize, {queue:false});
            $("#menu-items").slideDown();
            $("#donation_wrapper").animate({width: 0, height: 0}, {queue:false});
            $("#donate_close").hide();
            $("#donation_wrapper").slideUp();
          });
        });
      