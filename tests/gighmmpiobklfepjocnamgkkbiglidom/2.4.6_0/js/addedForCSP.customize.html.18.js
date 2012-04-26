
    chrome.extension.onRequest.addListener(function(request) {
      if (request.command != "filters_updated")
        return;
      if ($("#txtFiltersAdvanced").attr("disabled") == false)
        return;
      BGcall("get_custom_filters_text", function(text) {
        $("#txtFiltersAdvanced").val(text);
      });
    });

    $(function() {

      function appendCustomFilter(filter) {
        var customFilterText = $("#txtFiltersAdvanced").val();
        $("#txtFiltersAdvanced").val(filter + "\n" + customFilterText);
        saveFilters();
      }

      $("#txtUserFilterCss").val('div[class*="exampleClass"][id="someBigAd"]');
      $("#txtUserFilterDomain").val('*');

      $("#txtBlockUrl").val(".com/flashAd");
      $("#txtBlockUrlDomain").val("*");

      $("#txtUnblock").val('http://sleeplessgeek.blogspot.com/');

      $("#btnAddUserFilter").click(function() {
        var blockCss = $("#txtUserFilterCss").val().trim();
        var blockDomain = $("#txtUserFilterDomain").val().trim();

        if (blockDomain == '.*' || blockDomain == "*" || blockDomain == '')
          appendCustomFilter("##" + blockCss);
        else
          appendCustomFilter(blockDomain + "##" + blockCss);

        $(this).closest(".entryTable").find("input:text").val("");
        $(this).attr("disabled", "disabled");
      });

      $("#btnAddExcludeFilter").click(function() {
        var excludeUrl = $("#txtUnblock").val().trim();

        //prevent regexes
        if (/^\/.*\/$/.test(excludeUrl))
          excludeUrl = excludeUrl + "*";

        appendCustomFilter('@@' + excludeUrl + '$document');

        $(this).closest(".entryTable").find("input:text").val("");
        $(this).attr("disabled", "disabled");
      });

      $("#btnAddUrlBlock").click(function() {
        var blockUrl = $("#txtBlockUrl").val().trim();
        var blockDomain = $("#txtBlockUrlDomain").val().trim();
        if (blockDomain == '*')
          blockDomain = '';

        //prevent regexes
        if (/^\/.*\/$/.test(blockUrl))
          blockUrl = blockUrl + "*";

        if (blockDomain == '')
          appendCustomFilter(blockUrl);
        else
          appendCustomFilter(blockUrl + "$domain=" + blockDomain);

        $(this).closest(".entryTable").find("input:text").val("");
        $(this).attr("disabled", "disabled");
      });

      var validateUrlFilter = function() {
        var blockUrl = $("#txtBlockUrl").val().trim();
        var blockDomain = $("#txtBlockUrlDomain").val().trim();
        if (blockDomain == '*')
          blockDomain = '';
        if (blockDomain)
          blockDomain = '$domain=' + blockDomain;
        var ok = false;
        try {
          if (FilterNormalizer.normalizeLine(blockUrl + blockDomain))
            ok = true;
          if (Filter.isSelectorFilter(blockUrl))
            ok = false;
        } catch(ex) {}
        $("#btnAddUrlBlock").attr("disabled", ok ? null : "disabled");
      }
      $("#divUrlBlock input:text").bind("input", validateUrlFilter);

      var validateCssFilter = function() {
        var blockCss = $("#txtUserFilterCss").val().trim();
        var blockDomain = $("#txtUserFilterDomain").val().trim();
        if (blockDomain == '*')
          blockDomain = '';
        var ok = false;
        try {
          if (FilterNormalizer.normalizeLine(blockDomain + "##" + blockCss))
            ok = true;
        } catch(ex) {}
        $("#btnAddUserFilter").attr("disabled", ok ? null : "disabled");
      }
      $("#divCssBlock input:text").bind("input", validateCssFilter);
      
      var validateExcludeFilter = function() {
        var unblockUrl = $("#txtUnblock").val().trim();
        var ok = false;
        try {
          if (FilterNormalizer.normalizeLine('@@' + unblockUrl + '$document'))
            ok = true;
          if (!unblockUrl || Filter.isSelectorFilter(unblockUrl))
            ok = false;
        } catch(ex) {}
        $("#btnAddExcludeFilter").attr("disabled", ok ? null : "disabled");
      }
      $("#divExcludeBlock input:text").bind("input", validateExcludeFilter);

      $('.entryTable input:text').keypress(function(event) {
        var submitButton = $(this).closest(".entryTable").find(":button");
        if (event.keyCode == '13' && submitButton.attr("disabled") == false) {
          event.preventDefault();
          submitButton.click();
        }
      });

      $("a.controlsLink").click(function() {
        event.preventDefault();
        var myControls = $(this).closest("div").find(".addControls");
        $(".addControls").not(myControls).slideUp();
        myControls.slideDown();
        $('input:text:not([id*="Domain"])', myControls).select();
      });

      $("#btnEditAdvancedFilters").click(function() {
        $("#divAddNewFilter").slideUp();
        $(".addControls").slideUp();
        $("#txtFiltersAdvanced").removeAttr("disabled");
        $("#spanSaveButton").show();
        $("#btnEditAdvancedFilters").hide();
        $("#txtFiltersAdvanced").focus();
      });

      function saveFilters() {
        BGcall("set_custom_filters_text", $("#txtFiltersAdvanced").val());

        $("#divAddNewFilter").slideDown();
        $("#txtFiltersAdvanced").attr("disabled", "disabled");
        $("#spanSaveButton").hide();
        $("#btnEditAdvancedFilters").show();
      }
      $("#btnSaveAdvancedFilters").click(saveFilters);

      BGcall("get_custom_filters_text", function(text) {
        $("#txtFiltersAdvanced").val(text);
      });
    });
  