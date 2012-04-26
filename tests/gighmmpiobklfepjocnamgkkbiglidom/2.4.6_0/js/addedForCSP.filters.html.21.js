
      $(function() {
        $("#subscribeAll").live("click", function(e) {
          var inputs = $("input:not(:checked)", ".subscription");
          for (var i=0; i<inputs.length; i++) {
            window.setTimeout((function() { // Catch i in closure
              var name = inputs[i].name;
              return (function() { subscribe(name); });
            })(), 1000 * i);
          }
          e.preventDefault();
        });
        $("#unsubscribeAll").live("click", function(e) {
          $("input", ".subscription").each(function(i, el) {
            if (el.checked == true) {
              unsubscribe($(el).attr("name"));
            }
          });
          e.preventDefault();
        });

        $("#btnShowLinks").click(function() {
          $(".linkToList").css("display", "inline");
          $("#btnShowLinks").attr("disabled", "disabled");
        });
      });
    