
(function(){ var temp = document.getElementById('ff_addcustomfield');
temp.addEventListener('click',function(event){return ff_addcustomfield()});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Shows another custom field entry'))});

})();
