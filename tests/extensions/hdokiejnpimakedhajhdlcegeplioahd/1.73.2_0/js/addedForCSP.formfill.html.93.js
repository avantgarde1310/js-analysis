
(function(){ var temp = document.getElementById('ff_birthday_month');
temp.addEventListener('change',function(event){ff_fix_birthday()});
temp.addEventListener('mouseout',function(event){ttoff()});
temp.addEventListener('mouseover',function(event){ttabove(this,gt('Your birth month'))});

})();
