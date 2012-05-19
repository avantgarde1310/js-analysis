
(function(){ var temp = document.getElementById('searchbox');
temp.addEventListener('focus',function(event){g_searchhasfocus=true;clearkeyboardnav();});
temp.addEventListener('blur',function(event){g_searchhasfocus=false;});
temp.addEventListener('keyup',function(event){search_keyup(event)});

})();
