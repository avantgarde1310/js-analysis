
(function(){ var temp = document.getElementById('prevHk');
temp.addEventListener('blur',function(event){fixhk('prevHk', event);});
temp.addEventListener('keydown',function(event){capturehk('prevHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('prevHk', event);});

})();
