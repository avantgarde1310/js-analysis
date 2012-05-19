
(function(){ var temp = document.getElementById('recheckHk');
temp.addEventListener('blur',function(event){fixhk('recheckHk', event);});
temp.addEventListener('keydown',function(event){capturehk('recheckHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('recheckHk', event);});

})();
