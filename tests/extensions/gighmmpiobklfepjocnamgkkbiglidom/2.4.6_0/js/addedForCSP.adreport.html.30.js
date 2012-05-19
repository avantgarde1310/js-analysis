
      //check for updates
      var AdBlockVersion;
      try {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", chrome.extension.getURL('manifest.json'), false);
        xhr.onreadystatechange = function() {
          if(this.readyState == 4) {
            //get the current version
            AdBlockVersion = JSON.parse(this.responseText).version;
            //check for newer versions
            var xhr2 = new XMLHttpRequest();
            var checkURL = "http://clients2.google.com/service/update2/crx?" +
                "x=id%3Dgighmmpiobklfepjocnamgkkbiglidom%26v%3D" +
                AdBlockVersion + "%26uc";
            if (SAFARI) 
              checkURL = "http://safariadblock.com/update.plist";
            //fetch the version check file
            xhr2.open("GET", checkURL, false);
            xhr2.onreadystatechange = function() {
              if(this.readyState == 4) {
                var updateURL;
                if (!SAFARI) {
                  var usefultext = this.responseText.match(/\<updatecheck.+status\=\".*\"\/\>/)[0];
                  if (!usefultext) return;
                  var status = usefultext.match(/status\=\"([^\"]*)\"/)[1];
                  if (status == "ok")
                    updateURL = usefultext.match(/codebase\=\"([^\"]*)\"/)[1];
                } else {
                  var version = this.responseText.match(/\<string\>\d+\.\d+\.\d+\<\/string\>/)[0];
                  version = version.replace(/\<[^\<]+\>/g,'');
                  if (version != AdBlockVersion) {
                    updateURL = this.responseText.match(/http\:\/\/.*\.safariextz/)[0];
                  }
                }
                //new version available
                if (updateURL) {
                  $("#whattodo").html(translate("updatefromoldversion", ["<a href='" + updateURL + "'>", "</a>"]));
                  $("div[id^='step'][id$='DIV']").css('display', 'none');
                }
              }
            };
            xhr2.send();
          }
        };
        xhr.send();
      } catch (ex) {}
    