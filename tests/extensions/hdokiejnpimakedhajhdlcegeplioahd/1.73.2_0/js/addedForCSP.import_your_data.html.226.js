
(function(){ var temp = document.getElementById('continue');
temp.addEventListener('click',function(event){if (document.getElementById('yes').checked) { document.location.href = 'import.html?fromwelcome=1'; } else { document.location.href = 'configure_formfill.html'; }});

})();
