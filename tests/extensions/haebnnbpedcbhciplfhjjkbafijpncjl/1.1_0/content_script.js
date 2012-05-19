var SERVER = 'www.tineye.com';
var CHROME_VERSION = '1.1';

// Create three context menu items for image, page and link clicks
var image_menu = chrome.contextMenus.create({"title": "Search Image on TinEye",
                                             "contexts": ["image"],
                                             "onclick": imageSearch});
var page_menu = chrome.contextMenus.create({"title": "Search Page on TinEye", 
                                            "contexts": ["page"],
                                            "onclick": pageSearch});

function sortOrder() {
    // Check which sort order the user wants
    sort_order = "";
    switch(localStorage.sort_order) {
        case "best_match":
            sort_order = "&sort=score&order=desc";
            break;
        case "most_changed":
            sort_order = "&sort=score&order=asc";
            break;
        case "biggest_image":
            sort_order = "&sort=size&order=desc";
            break;
        default:
            sort_order = "";
    }
    return sort_order;
}

function open_url(url) {
    // Check where the user wants the url to be open
    switch(localStorage.tab_visibility) {
        case "background":
            chrome.tabs.create({url: url, selected: false});
            window.close();
            break;
        case "foreground":
            chrome.tabs.create({url: url, selected: true});
            window.close();
            break;
        case "current":
            chrome.tabs.getSelected(null, function (tab) {
                chrome.tabs.update(tab.id, {url: url});
                window.close();
            });
            break;
        default:
            chrome.tabs.create({url: url, selected: false});
            window.close();                    
    }
}

function imageSearch(info, tab) {
    // Send the selected image to TinEye
    sort_order = sortOrder();
    open_url("http://" + SERVER + "/search/?pluginver=chrome-" + CHROME_VERSION +  sort_order + "&url=" + encodeURIComponent(info.srcUrl));
}

function pageSearch(info, tab) {
    // Send the selected page to TinEye
    sort_order = sortOrder();
    open_url("http://" + SERVER + "/search/?pluginver=chrome-" + CHROME_VERSION + sort_order + "&url=" + encodeURIComponent(info.pageUrl));
}
