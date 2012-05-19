
(function(){ var temp = document.getElementById('saveallHk');
temp.addEventListener('blur',function(event){fixhk('saveallHk', event);});
temp.addEventListener('keydown',function(event){capturehk('saveallHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('saveallHk', event);});

})();
