var yubikeysubmit=false;function oninityubikey(){}function onshowyubikey(){document.getElementById("yubikeyotp").value="";setTimeout("document.getElementById('yubikeyotp').focus();",0);yubikeysubmit=false;sendBG({cmd:"turnofficon"})}function onhideyubikey(){yubikeysubmit||sendBG({cmd:"yubikeyauth",otp:""});closemole()}
function otpcheck(){var a="";if(document.getElementById("lptrustyubi").checked){a=document.getElementById("yubitrustlabel").value;if(a==""){document.getElementById("labelyubi").style.color="red";return}else a=a}var b=document.getElementById("yubikeyotp").value;if(b!=""){yubikeysubmit=true;sendBG({cmd:"yubikeyauth",otp:b,label:a})}onhideyubikey()}function lostkey(){sendBG({cmd:"lostkey"});closemole()}var sesamesubmit=false;function oninitsesame(){}
function onshowsesame(){document.getElementById("sesameotplocal").value="";setTimeout("document.getElementById('sesameotplocal').focus();",0);sesamesubmit=false;sendBG({cmd:"turnofficon"})}function onhidesesame(){sesamesubmit||sendBG({cmd:"sesameauth",otp:""});closemole()}
function sesameotpcheck(){var a="";if(document.getElementById("lptrustsesame").checked){a=document.getElementById("sesametrustlabel").value;if(a==""){document.getElementById("labelsesame").style.color="red";return}else a=a}var b=document.getElementById("sesameotplocal").value;if(b!=""){sesamesubmit=true;sendBG({cmd:"sesameauth",otp:b,label:a})}onhidesesame()}function sesamelostkey(){sendBG({cmd:"sesamelostkey"});closemole()}var gridsubmit=false;function oninitgrid(){}
function onshowgrid(){document.getElementById("lpgridinput1").value="";document.getElementById("lpgridinput2").value="";document.getElementById("lpgridinput3").value="";document.getElementById("lpgridinput4").value="";sendBG({cmd:"turnofficon"});var a=document.location.href;a=a.substr(a.indexOf("challenge=")+10);var b=a.indexOf("&");if(b!=-1)a=a.substring(0,b);a=decodeURIComponent(a);a=a.replace(/^\s+|\s+$/g,"");b=a.split(" ");for(var c=0;c<b.length;c++)document.getElementById("grid"+(c+1)+"label").innerHTML=
b[c];console_log(a);setTimeout("document.getElementById('lpgridinput1').focus();",0);gridsubmit=false}function onhidegrid(){gridsubmit||sendBG({cmd:"gridauth",gridvalues:""});closemole()}
function gridcheck(){var a="";if(document.getElementById("lptrustgrid").checked){a=document.getElementById("gridtrustlabel").value;if(a==""){document.getElementById("labelgrid").style.color="red";return}else a=a}var b="";if(document.getElementById("lpgridinput1").value!=""&&document.getElementById("lpgridinput2").value!=""&&document.getElementById("lpgridinput3").value!=""&&document.getElementById("lpgridinput4").value!="")b=document.getElementById("lpgridinput1").value+","+document.getElementById("lpgridinput2").value+
","+document.getElementById("lpgridinput3").value+","+document.getElementById("lpgridinput4").value;if(b!=""){gridsubmit=true;sendBG({cmd:"gridauth",gridvalues:b,label:a})}onhidegrid()}function lostgrid(){sendBG({cmd:"gridlostkey"});closemole()};