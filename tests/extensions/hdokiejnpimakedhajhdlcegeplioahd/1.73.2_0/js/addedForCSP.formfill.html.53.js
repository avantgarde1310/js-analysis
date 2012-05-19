
(function(){ var temp = document.getElementById('ff_language');
temp.addEventListener('change',function(event){retranslate(); fix_states();});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('The language of the Web sites where this Form Fill profile will be used'))});

})();
