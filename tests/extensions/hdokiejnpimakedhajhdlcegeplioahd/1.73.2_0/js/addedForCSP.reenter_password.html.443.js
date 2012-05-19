
(function(){ var temp = document.getElementById('cancel');
temp.addEventListener('click',function(event){if (confirm(gs('Do you really want to quit? You cannot use LastPass without creating an account.'))) { alert(gs('Please visit https://lastpass.com to create an account at a later time.')); dobeforeunload = false; getBG().closecurrenttab('reenter_password.html'); }});

})();
