
(function(){ var temp = document.getElementById('pff_cancel');
temp.addEventListener('click',function(event){return pff_cancel();});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Discard changes and close this window'))});

})();
