
      $(function() {
        localizePage();
      });

      //fetching the options...
      var options = [];
      var search = document.location.search.substring(1).split('&');
      for (var item in search) {
        if (!/\=/.test(search[item])) continue;
        options[search[item].split('=')[0]] = 
                         unescape(search[item].split('=')[1]);
      }

      //get the list of subscribed filters and
      //all unsubscribed default filters
      var unsubscribed_default_filters = [];
      var subscribed_filter_names = [];
      BGcall("get_subscriptions_minus_text", function(subs) {
        for (var id in subs)
          if (!subs[id].subscribed && !subs[id].user_submitted)
            unsubscribed_default_filters[id] = subs[id];
          else if (subs[id].subscribed)
            subscribed_filter_names.push(subs[id].name);
      });

      //generate the URL to the issue tracker
      function generateReportURL() {
        var domain = "";
        if (options['url']) {
          domain = options['url'].substring(options['url'].indexOf("://") + 3);
          domain = domain.substring(0, domain.indexOf('/'));
        }
        var result = "http://code.google.com/p/adblockforchrome/issues/entry" +
                     "?template=Ad%20report%20from%20user&summary=";
        if (domain) 
          result = result + escape("Ad report: " + domain);
        else
          result = result + escape("Ad report at <enter URL of webpage here>");

        var body = [];
        var count = 1;
        body.push("Last step -- point me to the ad so I can fix the bug! " +
            "Don't leave anything out or I'll probably " +
            "have to ignore your report. Thanks!");
        body.push("");
        if (!options['url']) {
          body.push(count + ". Paste the URL of the webpage showing an ad: ");
          body.push("");
          body.push("");
          count++;
        }
        body.push(count + ". Exactly where on that page is the ad? What does it " +
            "look like? Attach a screenshot, with the ad clearly marked, " +
            "if you can.");
        body.push("");
        body.push("");
        count++;
        body.push(count + ". Paste a working filter, if you have one: ");
        body.push("");
        body.push("");
        count++;
        body.push(count + ". Any other information that would be helpful, besides " +
            "what is listed below: ");
        body.push("");
        body.push("");
        body.push("-------- Please don't touch below this line. ---------");
        if (options['url']) {
          body.push("=== URL with ad ===");
          body.push(options['url']);
          body.push("");
        }
        body.push("=== Subscribed filters ===");
        body.push(subscribed_filter_names.join('\n'));
        body.push("");
        body.push("=== Browser" + (AdBlockVersion ? ' & AdBlock' : '') + ": ===");
        body.push(SAFARI ? "Safari " :
          "Google Chrome " + navigator.userAgent.match('Chrome\/([0-9.]+)')[1]);
        if (AdBlockVersion) 
          body.push("AdBlock " + AdBlockVersion);

        result = result + "&comment=" + escape(body.join('\n'));

        return result;
      }
    