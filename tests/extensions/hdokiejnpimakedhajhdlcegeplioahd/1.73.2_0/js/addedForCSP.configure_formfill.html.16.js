
(function(){ var temp = document.getElementById('continue');
temp.addEventListener('click',function(event){if (document.getElementById('yes').checked) { getBG().addprofile(); } document.location.href = 'congratulations.html';});

})();
