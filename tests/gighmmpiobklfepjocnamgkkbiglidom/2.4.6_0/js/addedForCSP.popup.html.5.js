
                $(function() {
                  // TODO temp while yes_toolbar_button exists
                  chrome.extension.sendRequest("picdndbpdnapajibahnnogkjofaeooof", {}, 
                    function(data) {
                      if (data) {
                        $("#no_toolbar_button").hide();
                        $("#yes_toolbar_button").show();
                      }
                    }
                  );
                });
              