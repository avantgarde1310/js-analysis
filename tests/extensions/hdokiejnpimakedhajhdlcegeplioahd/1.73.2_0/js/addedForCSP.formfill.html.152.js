
(function(){ var temp = document.getElementById('ff_extmobile');
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Your phone number extension'))});
temp.addEventListener('keydown',function(event){onkeydownext(this,event);});

})();
