
(function(){ var temp = document.getElementById('homeHk');
temp.addEventListener('blur',function(event){fixhk('homeHk', event);});
temp.addEventListener('keydown',function(event){capturehk('homeHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('homeHk', event);});

})();
