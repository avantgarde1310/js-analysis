
(function(){ var temp = document.getElementById('donotrepromptforsecs');
temp.addEventListener('change',function(event){document.getElementById('donotrepromptfor').checked = this.selectedIndex > 0;});

})();
