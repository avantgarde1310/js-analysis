
(function(){ var temp = document.getElementById('ff_birthday_year');
temp.addEventListener('change',function(event){ff_fix_birthday()});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Your 4 digit birth year'))});

})();
