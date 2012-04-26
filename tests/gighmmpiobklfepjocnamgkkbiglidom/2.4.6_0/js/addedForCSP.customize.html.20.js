
      $(function() {
        $("#btnCleanUp").click(function() {
          //Don't save immediately, first allow them to review changes
          if ($("#btnEditAdvancedFilters").is(":visible"))
            $("#btnEditAdvancedFilters").click();
          var newFilters = FilterNormalizer.normalizeList($("#txtFiltersAdvanced").val(), true);
          newFilters = newFilters.replace(/(\n)+$/,'\n'); // Del trailing \n's
          $("#txtFiltersAdvanced").val(newFilters);
        });
      });
    