
(function(){ var temp = document.getElementById('defaultffidHk');
temp.addEventListener('blur',function(event){fixhk('defaultffidHk', event);});
temp.addEventListener('keydown',function(event){capturehk('defaultffidHk', event);});
temp.addEventListener('keypress',function(event){return false;});
temp.addEventListener('keyup',function(event){fixhk('defaultffidHk', event);});

})();
