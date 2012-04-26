
      //Updating the users filters
      $("#UpdateFilters").click(function() {
        $(this).attr("disabled", "disabled");
        BGcall("update_subscriptions_now");
      });
      //if the user clicks a radio button
      $("#step1_no").click(function() {
        $("#step1").html("<span class='answer'>" + translate("no") + "</span>");
        $("#whattodo").text(translate("adalreadyblocked"));
      });
      $("#step1_yes").click(function() {
        $("#step1").html("<span class='answer'>" + translate("yes") + "</span>");
        $("#step2DIV").css("display", "block");
      });
    