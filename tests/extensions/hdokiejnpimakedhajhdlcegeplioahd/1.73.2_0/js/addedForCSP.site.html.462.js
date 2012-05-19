
(function(){ var temp = document.getElementById('notestype');
temp.addEventListener('change',function(event){buildSecureNotes()});
temp.addEventListener('focus',function(event){this.blur()});

})();
