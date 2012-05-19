

        // Saves options to localStorage.
        function save_options() {

            var sort_order_radio = document.getElementsByName("sort_order");
            var tab_visibility_radio = document.getElementsByName("tab_visibility");

            for(var i = 0; i < sort_order_radio.length; i++) {
                if(sort_order_radio[i].checked)
                    localStorage.sort_order = sort_order_radio[i].value;
            }

            for(var i = 0; i < tab_visibility_radio.length; i++) {
                if(tab_visibility_radio[i].checked)
                    localStorage.tab_visibility = tab_visibility_radio[i].value;
            }

            // Update status to let user know options were saved.
            var status = document.getElementById("status");
            status.innerHTML = "Options saved!";

            setTimeout(function() { status.innerHTML = ""; }, 1000);

        }

        // Restores select box state to saved value from localStorage.
        function restore_options() {
            if (!localStorage.sort_order)
                localStorage.sort_order = "last_used";
            if (!localStorage.tab_visibility)
                localStorage.tab_visibility = "background";

            var sort_order = localStorage.sort_order;
            var tab_visibility = localStorage.tab_visibility;

            document.getElementById(sort_order).checked = true;
            document.getElementById(tab_visibility).checked = true;
        }
        