
(function(){ var temp = document.getElementById('ff_countrymobile');
temp.addEventListener('change',function(event){fix_phone(this);});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Your country name'))});

})();
