
      function load_options() {
        // Check or uncheck each option.
        BGcall("get_settings", function(settings) {
          optionalSettings = settings;
          $("#tabpages").
            tabs({ 
              spinner: "",
              cache: true,
              cookie: {},
              load: function() {
                //translation
                localizePage();

                $(".advanced").toggle(optionalSettings.show_advanced_options);
              },
            }).
            show();
        });
      }
      var optionalSettings = {};
      load_options();

      function note_visit() {
        if (localStorage.getItem('visited_options_at') != null)
          return;
        var now = new Date().getTime();
        localStorage.setItem('visited_options_at', now);
        var installed_at = localStorage.getItem('installed_at', 0);
        if (installed_at == null)
          installed_at = 2; // aka "we don't know"
        $.get("http://chromeadblock.com/api/visit.php", 
              {options_at:now, installed_at:installed_at});
      }

      function displayVersionNumber() {
        try {
          var xhr = new XMLHttpRequest();
          xhr.open("GET", chrome.extension.getURL('manifest.json'), false);
          xhr.onreadystatechange = function() {
            if(this.readyState == 4) {
              var theManifest = JSON.parse(this.responseText);
              $("#version_number").text(translate("optionsversion", [theManifest.version]));
            }
          };
          xhr.send();
        } catch (ex) {} // silently fail
      }

      $(function() {
        displayVersionNumber();

        note_visit();
        
        //translation
        localizePage();
      });
    