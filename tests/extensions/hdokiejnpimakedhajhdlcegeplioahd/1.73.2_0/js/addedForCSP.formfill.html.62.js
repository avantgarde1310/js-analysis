
(function(){ var temp = document.getElementById('ff_tabcreditcard');
temp.addEventListener('click',function(event){return ffshow('ff_panecreditcard')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Your credit card information'))});

})();
