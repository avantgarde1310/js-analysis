
(function(){ var temp = document.getElementById('masterpassword');
temp.addEventListener('keyup',function(event){update_password_meter(document.getElementById('email').value, document.getElementById('masterpassword').value);});

})();
