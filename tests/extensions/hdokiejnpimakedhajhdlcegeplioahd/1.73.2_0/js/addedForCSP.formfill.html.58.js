
(function(){ var temp = document.getElementById('ff_tabaddress');
temp.addEventListener('click',function(event){return ffshow('ff_paneaddress')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Your address information'))});

})();
