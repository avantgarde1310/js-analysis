
(function(){ var temp = document.getElementById('submitHk');
temp.addEventListener('blur',function(event){fixhk('submitHk', event);});
temp.addEventListener('keydown',function(event){capturehk('submitHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('submitHk', event);});

})();
