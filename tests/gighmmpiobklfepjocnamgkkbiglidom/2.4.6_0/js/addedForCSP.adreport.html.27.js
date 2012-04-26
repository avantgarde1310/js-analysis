
      //if the user clicks an item
      var contact = "";
      $("#step2_lang").change(function() {
        var selected = $("#step2_lang option:selected");
        $("#step2").html("<span class='answer'>"+ selected.text() +"</span>");
        if (selected.text() == translate("other")) {
          $("#whattodo").html(translate("nodefaultfilter1", 
                                        ["<a href='http://adblockplus.org/en/subscriptions'>", "</a>"]));
          return;
        } else {
          var required_lists = selected.attr('value').split(';');
          for (var i=0; i < required_lists.length - 1; i++) {
            if (unsubscribed_default_filters[required_lists[i]]) {
              $("#whattodo").text(translate("retryaftersubscribe", [translate("filter" + required_lists[i])]));
              return;
            }
          }
        }
        contact = required_lists[required_lists.length-1];
        $("#step3DIV").css("display", "block");
      });
    