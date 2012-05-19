
(function(){ var temp = document.getElementById('nextHk');
temp.addEventListener('blur',function(event){fixhk('nextHk', event);});
temp.addEventListener('keydown',function(event){capturehk('nextHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('nextHk', event);});

})();
