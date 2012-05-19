
(function(){ var temp = document.getElementById('origmasterpassword');
temp.addEventListener('keyup',function(event){update_password_meter(g_username, document.getElementById('masterpassword').value);});

})();
