
(function(){ var temp = document.getElementById('body');
temp.addEventListener('unload',function(event){onUnload()});
temp.addEventListener('load',function(event){onLoad()});

})();
