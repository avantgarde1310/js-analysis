
(function(){ var temp = document.getElementById('email');
temp.addEventListener('change',function(event){checkEmail();});
temp.addEventListener('keyup',function(event){update_password_meter(document.getElementById('email').value, document.getElementById('masterpassword').value);});

})();
