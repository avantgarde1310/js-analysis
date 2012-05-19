
(function(){ var temp = document.getElementById('pff_done');
temp.addEventListener('click',function(event){return pff_save()});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Save your changes and close this window'))});

})();
