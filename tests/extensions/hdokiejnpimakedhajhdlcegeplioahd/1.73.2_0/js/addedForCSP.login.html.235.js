
(function(){ var temp = document.getElementById('deleteicon');
temp.addEventListener('click',function(event){delete_user();});
temp.addEventListener('mouseout',function(event){this.src = 'xlarge.png';});
temp.addEventListener('mouseover',function(event){this.src = 'xlarge2.png';});

})();
