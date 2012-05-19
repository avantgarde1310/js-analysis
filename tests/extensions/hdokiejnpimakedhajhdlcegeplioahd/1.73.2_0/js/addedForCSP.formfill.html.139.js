
(function(){ var temp = document.getElementById('ff_npafax');
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('First 3 digits of your phone number'))});
temp.addEventListener('keyup',function(event){onkeyupnpa(this,event);});

})();
