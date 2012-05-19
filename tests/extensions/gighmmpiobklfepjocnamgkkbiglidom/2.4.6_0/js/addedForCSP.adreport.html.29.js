
      //If the user clicks a radio button
      $("#step4_yes").click(function() {
        $("#step4").html("<span class='answer'>" + translate("yes") + "</span>");
        $("#whattodo").html(translate("cantblockflash"));
      });
      $("#step4_no").click(function() {
        $("#step4").html("<span class='answer'>" + translate("no") + "</span>");
        var reportLinkOpen = "<a href='" + generateReportURL() + "'>";
        var reportLinkClose = "</a>";
        $("#whattodo").html(translate("reporttous1", [reportLinkOpen, reportLinkClose]));
      });
    