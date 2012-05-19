
(function(){ var temp = document.getElementById('ff_tabbankaccount');
temp.addEventListener('click',function(event){return ffshow('ff_panebankaccount')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Your bank account information'))});

})();
