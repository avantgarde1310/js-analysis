
      //If the user clicks a radio button
      $("#step3_yes").click(function() {
        $("#step3").html("<span class='answer'>" + translate("yes") + "</span>");
        if (/^mailto\:/.test(contact))
          contact = contact.replace(" at ", "@");
        var reportLink = "<a href='" + contact + "'>" + contact.replace(/^mailto\:/, '') + "</a>";
        $("#whattodo").html(translate("reportfilterlistproblem", [reportLink]));
      });
      $("#step3_no").click(function() {
        $("#step4DIV").css("display", "block");
        $("#step3").html("<span class='answer'>" + translate("no") + "</span>");
      });
      $("#step3_wontcheck").click(function() {
        $("#step3").html("<span class='answer'>" + translate("refusetocheck") + "</span>");
        $("#whattodo").html(translate("fixityourself"));
      });
    