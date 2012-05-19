
    function init() {
      document.title =
          chrome.i18n.getMessage("rss_subscription_default_title");
      i18nReplace('rss_subscription_subscribe_using');
      i18nReplace('rss_subscription_subscribe_button');
      i18nReplace('rss_subscription_always_use');
      i18nReplace('rss_subscription_feed_preview');
      i18nReplaceImpl('feedUrl', 'rss_subscription_feed_link', '');
      
      main();
    }
  