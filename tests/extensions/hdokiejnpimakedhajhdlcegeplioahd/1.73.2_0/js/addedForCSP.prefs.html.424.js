
(function(){ var temp = document.getElementById('language');
temp.addEventListener('focus',function(event){if(g_ischrome){showChromeLanguageError();return false;}return true;});

})();
