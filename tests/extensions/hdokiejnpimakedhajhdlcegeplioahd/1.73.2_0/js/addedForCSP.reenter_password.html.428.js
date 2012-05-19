
(function(){ var temp = document.getElementById('_added_by_transform_0');
temp.addEventListener('beforeunload',function(event){if (dobeforeunload) { return 'Do you really want to quit? You cannot use LastPass without creating an account.' }});
temp.addEventListener('unload',function(event){if (docleardata) { getBG().g_create_account_data = null; }});

})();
