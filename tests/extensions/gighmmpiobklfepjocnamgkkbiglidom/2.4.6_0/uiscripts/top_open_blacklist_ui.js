// Global lock so we can't open more than once on a tab.
if (typeof may_open_dialog_ui === "undefined")
    may_open_dialog_ui = true;

function top_open_blacklist_ui(options) {
  if (!may_open_dialog_ui)
    return;

  may_open_dialog_ui = false;

  load_jquery_ui(function() {
    // If they chose "Block an ad on this page..." ask them to click the ad
    if (options.nothing_clicked)
      rightclicked_item = null;

    // If they right clicked in a frame in Chrome, use the frame instead
    if (options.info && options.info.frameUrl) {
      var frame = $("iframe").filter(function(i, el) {
        return el.src == options.info.frameUrl;
      });
      if (frame.length == 1)
        rightclicked_item = frame[0];
    }
    if (rightclicked_item && rightclicked_item.nodeName == "BODY")
      rightclicked_item = null;
    var blacklist_ui = new BlacklistUi(rightclicked_item);
    blacklist_ui.cancel(function() {
      may_open_dialog_ui = true;
    });
    blacklist_ui.block(function() {
      may_open_dialog_ui = true; // no-op, actually, since we now reload
      document.location.reload();
    });
    blacklist_ui.show();

  });
}
