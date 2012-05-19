
(function(){ var temp = document.getElementById('ff_state');
temp.addEventListener('change',function(event){ff_state_changed()});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Your state or province name'))});

})();
