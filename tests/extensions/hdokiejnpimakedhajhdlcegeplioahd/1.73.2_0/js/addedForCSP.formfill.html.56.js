
(function(){ var temp = document.getElementById('ff_tabpersonal');
temp.addEventListener('click',function(event){return ffshow('ff_panepersonal')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Your personal information'))});

})();
