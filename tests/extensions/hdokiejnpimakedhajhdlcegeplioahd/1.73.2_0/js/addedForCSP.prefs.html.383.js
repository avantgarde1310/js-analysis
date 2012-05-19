
(function(){ var temp = document.getElementById('generateHk');
temp.addEventListener('blur',function(event){fixhk('generateHk', event);});
temp.addEventListener('keydown',function(event){capturehk('generateHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('generateHk', event);});

})();
