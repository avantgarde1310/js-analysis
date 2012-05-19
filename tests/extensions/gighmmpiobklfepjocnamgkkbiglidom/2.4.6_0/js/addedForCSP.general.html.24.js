
        $("#enable_hide_instead_of_remove").
          change(function() {
            $('[i18n="brokensite_beta_description"]').toggle(this.checked);
          }).
          trigger("change");
      