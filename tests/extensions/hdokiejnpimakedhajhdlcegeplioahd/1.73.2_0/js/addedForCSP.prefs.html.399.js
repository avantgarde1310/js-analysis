
(function(){ var temp = document.getElementById('logoffHk');
temp.addEventListener('blur',function(event){fixhk('logoffHk', event);});
temp.addEventListener('keydown',function(event){capturehk('logoffHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('logoffHk', event);});

})();
