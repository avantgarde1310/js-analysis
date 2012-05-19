
(function(){ var temp = document.getElementById('rememberpassword');
temp.addEventListener('click',function(event){if (this.checked && !confirm(gs('Are you sure you want to have LastPass remember your password? This will significantly decrease the security of your LastPass account!'))) { this.checked = false; } if (this.checked) document.getElementById('rememberemail').checked = true;});

})();
