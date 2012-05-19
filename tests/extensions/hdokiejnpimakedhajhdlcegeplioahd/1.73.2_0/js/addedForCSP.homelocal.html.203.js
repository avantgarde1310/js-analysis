
(function(){ var temp = document.getElementById('q');
temp.addEventListener('keyup',function(event){if(event.keyCode==34||event.keyCode==33||event.keyCode==40||event.keyCode==38){MoveFocus(event);}else if(gSearchWhileType && event.keyCode!=13){SearchTree();}});

})();
