
      var BG = chrome.extension.getBackgroundPage();

      var domain = '';
      var resources = {};
      var domaindata;
      var custom_filters = [];

      // TODO Copy-and-modified from adblock_start.js
      function FakeFilterSet(serializedFilters) {
        var filters = [];
        for (var i = 0; i < serializedFilters.length; i++) {
          filters.push(PatternFilter.fromData(serializedFilters[i]));
          filters[i]._text = serializedFilters[i][3];
        }
        this.filters = filters;
      };
      FakeFilterSet.prototype = {
        matches: function(url, loweredUrl, elementType, pageDomain, isThirdParty) {
          var f = this.filters, len = f.length;
          for (var i = 0; i < len; i++) {
            if (f[i].matches(url, loweredUrl, elementType, isThirdParty))
              return f[i];
          }
          return null;
        }
      }
      // TODO end copied part

      // Creates the table that shows all blockable items
      function generateTable() {
        var local_filterset = new BlockingFilterSet(
          new FakeFilterSet(domaindata.patternSerialized),
          new FakeFilterSet(domaindata.whitelistSerialized)
        );
        delete domaindata;

        function htmlEscape(unsafe) {
          var safe = unsafe.
            replace(/\&/g, '&amp;').replace(/\</g, '&lt;').
            replace(/\>/g, '&gt;').replace(/\"/g, '&quot;');
          return safe;
        }
        // Trunkates a resource URL if it is too long. Also escapes some
        // characters when they have a special meaning in HTML.
        // Inputs: the string to truncate
        // Returns the truncated string
        function truncateI(j) {
          if (j.length > 90)
            if (j.indexOf('?') > 43 && j.indexOf('?') <= 85)
              j = j.substring(0, j.indexOf('?') + 1) + '[...]';
          if (j.length > 90)
            j = j.substring(0, 86) + '[...]';

          return htmlEscape(j);
        }
        // Converts the ElementTypes number back into an readable string
        // or hiding or 'unknown' if it wasn't in ElementTypes.
        // Inputs: One out of ElementTypes or 'undefined'
        // Returns a string with the element type
        function getTypeName(type) {
          switch(type) {
            case undefined: return "hiding";
            case ElementTypes.script: return "script";
            case ElementTypes.image: return "image";
            case ElementTypes.background: return "image";
            case ElementTypes.stylesheet: return "stylesheet";
            case ElementTypes.object: return "object";
            case ElementTypes.subdocument: return "subdocument";
            case ElementTypes.media: return "media";
            case ElementTypes.document:
            case ElementTypes.elemhide: return "page";
            default: return "unknown";
          }
        }
        // Checks if the filter is in the custom filters and can be removed
        // Inputs: the filter that could be in the custom filters
        // Returns true if the filter was in the custom filters
        function inCustomFilters(filter) {
          if (!filter) return false;
          for (var i=0; i<custom_filters.length; i++)
            if (matchingfilter == custom_filters[i])
              return true;
          return false;
        }
        
        // Now create that table row-by-row
        var rows = [];
        for (var i in resources) {
          var matchingfilter = resources[i].filter;
          if (!matchingfilter)
            matchingfilter = local_filterset.matches(i, resources[i].type, domain, true);

          var type = {sort:3, name:undefined};
          if (matchingfilter)
            if (matchingfilter[0] == '@')
              type = {sort:2, name:'whitelisted'};
            else if (i[0] == '#')
              type = {sort:0, name:'hiding'};
            else
              type = {sort:1, name:'blocked'};

          var disabled = (type.name == 'whitelisted' || type.name == 'hiding');

          var row = $("<tr>");
          if (type.name) row.addClass(type.name);

          // Cell 1: Checkbox
          var cell = $("<td><input type='checkbox'/></td>");
          if (disabled) cell.find("input").attr("disabled", "disabled");
          row.append(cell);

          // Cell 2: URL
          $("<td>", { title: i, text: truncateI(i) }).appendTo(row);

          // Cell 3: Type
          var typeName = getTypeName(resources[i].type);
          $("<td>", { name: typeName, text: translate('type' + typeName) }).appendTo(row);

          // Cell 4: hidden sorting field
          cell = $("<td>");
          var span = $("<span>", { "class": "sorter", text: "3" }).appendTo(cell);
          if (type.name) {
            span.text(type.sort);
            cell.append(matchingfilter);
          }
          row.append(cell);

          // Cells 2-4 may get class=clickableRow
          if (!disabled)
            row.find("td:not(:first-child)").addClass("clickableRow");

          // Cell 5: Matched filter
          if (inCustomFilters(matchingfilter))
            $("<td>", { "class": "deleterule", title: translate("removelabel") }).appendTo(row);
          else
            $("<td>").appendTo(row);

          rows.push(row);
        }
        $("#loading").remove();
        $("#resourceslist tbody").text("");
        for (var i = 0; i < rows.length; i++) {
          $("#resourceslist tbody").append(rows[i]);
        }
        $(".deleterule").click(function() {
          var filter = $(this).prev().text().substring(1);
          BG.remove_custom_filter(filter);
          if ($(this).prev().prev().attr("name") == "page") {
            alert(translate("excludefilterremoved"));
            window.close();
          } else
            document.location.reload();
        });
      };

      //Generate a list of pre-defined url filters
      function generateFilterSuggestions() {
        var url = $(".selected td:nth-of-type(2)").attr('title');
        url = url.replace(/\s{5}\(.*\)$/, '').replace(/\#.*$/, '');
        var isBlocked = ($(".selected").hasClass("blocked"));
        var blocksuggestions = [];
        var strippedUrl = url.replace(/^[a-z\-]+\:\/\/(www\.)?/, '');
        blocksuggestions.push(strippedUrl);
        if (strippedUrl.indexOf("?") > 0 || strippedUrl.indexOf("#") > 0) {
          strippedUrl = strippedUrl.replace(/(\?|\#).*/, '');
          blocksuggestions.push(strippedUrl);
        }
        if (strippedUrl.indexOf("/") > 0 && 
            strippedUrl.lastIndexOf('/') != strippedUrl.indexOf('/')) {
          strippedUrl = strippedUrl.substr(0, strippedUrl.lastIndexOf('/') + 1);
          blocksuggestions.push(strippedUrl);
        }
        if (strippedUrl.indexOf('/') > 0) {
          strippedUrl = strippedUrl.substr(0, strippedUrl.indexOf('/'));
          blocksuggestions.push(strippedUrl);
        }
        if (strippedUrl.indexOf('.') != strippedUrl.lastIndexOf('.')) {
          if (strippedUrl.replace('.co.', '').indexOf('.') != -1) {
            strippedUrl = strippedUrl.match(/[^.]+\.(co\.)?[^.]+$/i)[0];
            blocksuggestions.push(strippedUrl);
          }
        }

        var suggestions = [];
        for (var i in blocksuggestions) {
          var inputBox = $("<input>", {
            type: "radio",
            name: "urloption",
            id: "suggest_" + i,
            value: (isBlocked ? "@@||" : "||") + blocksuggestions[i]
          });
          var label = $("<label>", {
            "for": "suggest_" + i,
            text: blocksuggestions[i]
          });
          suggestions.push(inputBox);
          suggestions.push(label);
          suggestions.push("<br/>");
        }
        $("#suggestions").text("");
        for (var i = 0; i < suggestions.length; i++)
          $("#suggestions").append(suggestions[i]);
        if ($("#suggestions").find('input:first-child').val().indexOf('?') > 0)
          $($("#suggestions").children('input')[1]).attr('checked', 'checked');
        else
          $("#suggestions").find('input:first-child').attr('checked', 'checked');
        
        if (!isBlocked)
          $("#selectblockableurl b").text(translate("blockeverycontaining"));
        else
          $("#selectblockableurl b").text(translate("whitelisteverycontaining"));
        var inputBox = $('<input>', {
          type: "text",
          id: "customurl",
          size: "99",
          value: url,
          title: translate("wildcardhint")
        });
        $("#custom + label").text('Custom: ').append(inputBox);
      }

      // Create the filter that will be applied from the chosen options
      // Returns the filter
      function createfilter() {
        var isBlocked = ($(".selected").hasClass("blocked"));
        var urlfilter = '';
        if ($('#selectblockableurl #customurl').length != 0)
          urlfilter = (isBlocked ? '@@' : '') + $('#customurl').val();
        else
          urlfilter = $('#selectblockableurl input').val();
        if ((/^(\@\@)?\/.*\/$/).test(urlfilter))
          urlfilter += '*';

        var options = [];
        $("#chooseoptions > input:checked, #types > input:not(:checked)").each(
        function() {
          if ($(this).val())
            options.push($(this).val());
        });

        return urlfilter + ((options.length != 0) ? '$' + options.join(',') : '');
      }

      // Get the third-party domain
      // Inputs: the domain of which the third-party-check part is requested
      // Returns the third-party-check domain
      function GetThirdPartyDomain(domain) {
        var match = domain.match(/[^.]+\.(co\.)?[^.]+$/) || [ domain ];
        return match[0].toLowerCase();
      }

      // Checks if it is a third-party resource or not
      // Inputs: the two domains to check
      // Returns true if third-party, false otherwise
      function CheckThirdParty(domain1, domain2) {
        var match1 = GetThirdPartyDomain(domain1);
        var match2 = GetThirdPartyDomain(domain2);
        return (match1 != match2);
      }

      // Checks if the text in the domain list textbox is valid or not
      // Inputs: the text from the text box
      // Returns true if the domain list was valid, false otherwise
      function isValidDomainList(text) {
        if (!text)
          return false;
        try {
          FilterNormalizer.normalizeLine('*$domain=' + text);
          return true;
        } catch(ex) {
          return false;
        }
      }

      // After getting annoyed by the time it takes to get the required data
      // finally start generating some content for the user, and allowing him to
      // do some things, instead of looking at 'LOADING'
      function finally_it_has_loaded_its_stuff() {
        if (domaindata.settings.debug_logging)
          $(".onlyifdebug").show();
        // Create the table of resources and make it sortable
        generateTable();
        $("#resourceslist").tablesorter({
          headers: { 0: {sorter:false}, 4: {sorter:false}},
          cancelSelection: true,
          sortList: [[3,0],[1,0],[3,0]]
        });
        $("#resourceslist tbody tr").mouseenter(function() {
          if ($(this).hasClass('selected'))
            return;
          $(this).children(":not(:first-child)").
            css("border-top", "black 1px dotted").
            css("border-bottom", "black 1px dotted");
        });
        $("#resourceslist tr").mouseleave(function() {
          $(this).children().
            css("border", "none");
        });

        // Close the legend
        $("#legend a").click(function(event) {
          event.preventDefault();
          $("#legend").remove();
        });

        // An item has been selected
        $('.clickableRow, input:enabled', '#resourceslist').click(function() {
          if ($('.selected','#resourceslist').length > 0)
            return; //already selected a resource
          $("#choosedifferentresource").show();
          $("#choosedifferentresource").click(function() {
            document.location.reload();
          });
          $(this).parents('tr').addClass('selected');
          $("#resourceslist tr:not(.selected)").remove();
          $("#resourceslist tr input").
            attr('checked', 'checked').
            attr('disabled', 'disabled');
          $('.clickableRow').removeClass('clickableRow');
          $('#resourceslist tr').css('border', 'black 1px dotted');
          $('#legend').remove();
          
          // Show the 'choose url' area
          $("#selectblockableurl").show();
          generateFilterSuggestions();
          // If the user clicks the 'next' button
          $("#confirmUrl").click(function() {
            if ($('#custom:checked').length == 1 && 
                $('#customurl').val().trim() == '') {
              alert(translate('novalidurlpattern'));
              return;
            }
            // Hide unused stuff
            $("#selectblockableurl input:radio:not(:checked)").
                nextUntil('input').remove();
            $("#selectblockableurl input:radio:not(:checked)").remove();
            $("#confirmUrl").next().remove();
            $("#confirmUrl").remove();
            $("#selectblockableurl *:not(br):not(b)").attr("disabled", "disabled");

            // Show the options
            $("#chooseoptions").show();
            var domainOfSelectedUrl = $(".selected td:nth-of-type(2)").
                attr('title').replace(/^[a-z]{0,5}\:\/\//, '').match(/^[^\/]+/)[0];
            var isThirdParty = CheckThirdParty(domain, domainOfSelectedUrl);
            if (!isThirdParty) {
              $("#thirdparty + * + *").remove();
              $("#thirdparty + *").remove();
              $("#thirdparty").remove();
            } else
              // Use .find().text() so data from query string isn't injected as HTML
              $("#thirdparty + label").
                html(translate("thirdpartycheckbox", "<i></i>")).
                find("i").text(GetThirdPartyDomain(domainOfSelectedUrl));
            $("#domainlist").
              val(domain.replace(/^www\./, '')).
              click(function() {
                $("#domainis").
                  attr("checked", "checked").
                  change();
              }).
              keyup(function() {
                if (isValidDomainList($(this).val().trim().
                    replace(/[a-z](\ |\,\ ?|\;\ ?)\~?[a-z0-9]/gi,'a|a'))){
                  $("#domainis").val('domain=' + 
                      $(this).val().trim().replace(/(\ |\,|\;)+/g,'|'));
                  $("#domainlist").css('color', 'black');
                } else {
                  $("#domainis").val('');
                  $("#domainlist").css('color', 'red');
                }
                $("#filterpreview").text(createfilter());
              });
            $("#domainis").val('domain=' + domain.replace(/^www\./, ''));
            var selectorForFixedType = '[value="~' + 
                $(".selected td:nth-of-type(3)").attr('name') + '"]';
            $(selectorForFixedType).attr('disabled', 'disabled');

            // Update the preview filter
            $("#chooseoptions *").change(function() {
              $("#filterpreview").text(createfilter());
            });
            $("#filterpreview").text(createfilter());

            // Add the filter
            $("#addthefilter").click(function() {
              BGcall('add_custom_filter', createfilter(), function() {
                alert(translate("filterhasbeenadded"));
                window.close();
              });
            });
          });
        });
      }
      
      $(function() {
        // Translation
        localizePage();

        var url;
        if (window.location.search) {
          // Can be of the forms
          //  ?url=(page url)&itemType=(someElementType)&itemUrl=(item url)
          //  ?url=(page url)
          var query = window.location.search.substring(1);
          var parts = query.split('&');
          var qps = {};
          for (var i = 0; i < parts.length; i++) {
            var matchKeyAndValue = parts[i].match(/(.*?)=(.*)/);
            if (!matchKeyAndValue) continue;
            qps[matchKeyAndValue[1]] = matchKeyAndValue[2];
          }
          console.log(qps);
          function validateUrl(url) {
            if (!/^https?:\/\//.test(url)) {
              console.warn("Invalid URL in query param: " + url);
              window.close();
              return;
        }
          }
          function validateItemType(itemType) {
            if (!ElementTypes[itemType]) {
              console.warn("Invalid ElementType in query param: " + itemType);
              window.close();
              return;
            }
          }
          if (qps.url) {
            url = unescape(qps.url);
            validateUrl(url);

            domain = BlockingFilterSet._domainFor(url);
          }
          if (qps.itemType) {
            var itemUrl = unescape(qps.itemUrl);
            validateUrl(itemUrl);
            validateItemType(qps.itemType);

            resources[itemUrl] = {type:ElementTypes[qps.itemType]};
          }
        }

        var opts = {
          domain: domain,
          include_texts: true
        };
        BGcall('get_content_script_data', opts, function(data) {
          delete data.selectors;
          domaindata = data;
          if (data.adblock_is_paused) {
            alert(translate("adblock_is_paused"));
            window.close();
            return;
          }
          if (!qps.itemUrl) {
            // Show $elemhide and $document rules that match on the page
            var excludeRule = BG.page_is_whitelisted(url, ElementTypes.document, true);
            if (excludeRule)
              resources[url] = {type: ElementTypes.document, filter: excludeRule};
            else {
              excludeRule = BG.page_is_whitelisted(url, ElementTypes.elemhide, true);
              if (excludeRule)
                resources[url] = {type: ElementTypes.elemhide, filter: excludeRule};
            }

            // Load all stored resources
            var cache = BG.show_resourceblocker.cached_resources;
            var loaded_resources = cache.get(url);
            // Convert all resources to the object type
            if (loaded_resources)
              for (var i = 0; i < loaded_resources.length || 0; i++) {
                if (loaded_resources[i].indexOf(chrome.extension.getURL("")) == 4)
                  continue; // Blacklister resources shouldn't be visible
                if (/\<|\"/.test(loaded_resources[i]))
                  continue;
                if (/^HIDE\:.+/.test(loaded_resources[i])) {
                  var filter = "##" + loaded_resources[i].substring(5);
                  resources[filter] = {filter: filter};
                } else {
                  var blockmatches = loaded_resources[i].split(':|:', 2);
                  resources[blockmatches[1]] = {type: Number(blockmatches[0])};
                }
              }
            if (Object.keys(resources).length == 0) {
              alert(translate('noresourcessend'));
              window.close();
              return;
            }
          }
          var filters = BG.get_custom_filters_text();
          filters = FilterNormalizer.normalizeList(filters);
          if (filters.replace('\n').length != 0) {
            filters = filters.split('\n');
            for (var i=0; i<filters.length; i++)
              if (!/\#\#/.test(filters[i]))
                custom_filters.push(filters[i])
          }

          finally_it_has_loaded_its_stuff();
          // If opened by the context menu, this variable exists
          if (qps.itemUrl) {
            if ($("#resourceslist input").attr("disabled")) {
              // In case the resource has been whitelisted and can't be removed
              if ($(".deleterule").length == 0) {
                alert(translate('resourceiswhitelisted'));
                window.close();
                return;
              }
            } else
              $("#resourceslist input").click();
            $("#choosedifferentresource").remove();
          } else
            $("#legend").show();
        });
      });
    