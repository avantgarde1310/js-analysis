
(function(){ var temp = document.getElementById('ff_tabnotes');
temp.addEventListener('click',function(event){return ffshow('ff_panenotes')});
temp.addEventListener('mouseout',function(event){fftaboff(this);ttoff()});
temp.addEventListener('mouseover',function(event){fftabover(this);ttabove(this,gt('Enter arbitrary notes'))});

})();
