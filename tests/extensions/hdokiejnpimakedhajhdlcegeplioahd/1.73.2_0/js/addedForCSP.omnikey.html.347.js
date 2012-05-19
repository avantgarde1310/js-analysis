
(function(){ var temp = document.getElementById('cancel');
temp.addEventListener('click',function(event){omnikey_callback_called = true; omnikey_callback(''); setTimeout(function() { getBG().closecurrenttab('omnikey.html'); }, 0);});

})();
