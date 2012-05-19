
(function(){ var temp = document.getElementById('ff_tabcustomfields');
temp.addEventListener('click',function(event){return ffshow('ff_panecustomfields')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Set up custom form fields'))});

})();
