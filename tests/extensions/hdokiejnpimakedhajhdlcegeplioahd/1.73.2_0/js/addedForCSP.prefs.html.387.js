
(function(){ var temp = document.getElementById('searchHk');
temp.addEventListener('blur',function(event){fixhk('searchHk', event);});
temp.addEventListener('keydown',function(event){capturehk('searchHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('searchHk', event);});

})();
