if (typeof "ADBLOCK" == "undefined")
  ADBLOCK = {};

(function() {

  function getManifest() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", chrome.extension.getURL('manifest.json'), false);
    var theManifest;
    xhr.onreadystatechange = function() {
      if(this.readyState == 4) {
        theManifest = JSON.parse(this.responseText);
      }
    };
    xhr.send();
    return theManifest;
  }

  var manifest = getManifest();

  ADBLOCK.version = manifest.version;

  ['CrOS', 'Windows', 'Mac', 'Linux'].forEach(function(os) {
    if (navigator.appVersion.match(os))
      ADBLOCK.os = os.toLowerCase();
  });

  if (SAFARI)
    return;

  ADBLOCK.isApp = (manifest.app != undefined);

  if (ADBLOCK.isApp) {
    chrome.browserAction.setIcon = function() {};
    chrome.browserAction.setTitle = function() {};
    chrome.browserAction.setBadgeText = function() {};
    chrome.browserAction.setBadgeBackgroundColor = function() {};
  }

})();

(function() {

  if (SAFARI)
    return;

  var production = true;
  var app_id = (production ? 'eefkobgceabjladaefihncnghgdiilge' : 'aifkfjaklpofldkeigmbmimpjcaibjpn');
  var extension_id = (production ? 'gighmmpiobklfepjocnamgkkbiglidom' : 'kmgdmlmhfaihljjdpbbfhcephhafgdlf');
  var other_id = (ADBLOCK.isApp ? extension_id : app_id);

  var have_warned = false;
  function warn_both_installed() {
    if (have_warned)
      return;
    have_warned = true;
    webkitNotifications.createHTMLNotification('app/both_installed.html').show();
  }

  // If the other calls, respond; and if you're the app, panic.
  chrome.extension.onRequestExternal.addListener(function(data, sender, sendResponse) {
    if (sender.id != other_id)
      return;
    sendResponse('hello');
    if (ADBLOCK.isApp)
      warn_both_installed();
  });

  // Call the other, and if the app gets a response, panic.
  chrome.extension.sendRequest(other_id, {data:"hello?"}, function(response) {
    if (ADBLOCK.isApp && !chrome.extension.lastError)
      warn_both_installed();
  });
})();
