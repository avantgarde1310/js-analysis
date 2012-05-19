var ischrome = true,
    g_tsstart = (new Date).getTime(),
    g_bg = null,
    g_getdata_page = "",
    g_getdata_handler = null,
    g_user_prefs_to_write = [],
    g_global_prefs_to_write = [],
    g_delete_group_callback = null,
    g_delete_aid_callback = null,
    g_security_prompt_handler = null,
    g_language = null,
    g_included_language = false,
    g_language_data = "",
    g_langs = {
        "": "Default",
        ar: "Arabic",
        bg: "Bulgarian",
        ca: "Catalan",
        zh_CN: "Chinese (Simplified)",
        zh_TW: "Chinese (Traditional)",
        hr: "Croatian",
        cs: "Czech",
        da: "Danish",
        nl: "Dutch",
        en_US: "English",
        en_GB: "English (United Kingdom)",
        et: "Estonian",
        fi: "Finnish",
        fr: "French",
        de: "German",
        el: "Greek",
        he: "Hebrew",
        hu: "Hungarian",
        id: "Indonesian",
        it: "Italian",
        ja: "Japanese",
        ko: "Korean",
        lv: "Latvian",
        lt: "Lithuanian",
        nb: "Norwegian",
        pl: "Polish",
        pt_PT: "Portuguese",
        pt_BR: "Portuguese (Brazilian)",
        ro: "Romanian",
        ru: "Russian",
        sr: "Serbian",
        sk: "Slovak",
        sl: "Slovenian",
        es: "Spanish",
        es_419: "Spanish (Mexico)",
        sv: "Swedish",
        th: "Thai",
        tr: "Turkish",
        uk: "Ukrainian",
        vi: "Vietnamese"
    };

function include_language(a) {
    if (!g_included_language) {
        g_included_language = true;
        if (a == "") {
            a = navigator.language;
            a = a.replace("-", "_");
            if (a == "es_MX") a = "es_419";
            if (typeof g_langs[a] == "undefined") a = a.substring(0, 2);
            if (typeof g_langs[a] == "undefined") for (var b in g_langs) if (b.substring(0, 2) == a) {
                a = b;
                break
            }
            if (typeof g_langs[a] == "undefined") a = "en_US"
        }
        var c = [];
        a != "en_US" && c.push("en_US");
        c.push(a);
        for (b = 0; b < c.length; b++) {
            a = c[b];
            var d = new XMLHttpRequest;
            a = "_locales/" + a + "/messages.js";
            if (typeof safari != "undefined" && typeof safari.extension != "undefined" && typeof safari.extension.baseURI != "undefined") a = safari.extension.baseURI + a;
            d.open("GET", a, false);
            d.send(null);
            g_language_data = d.responseText;
            eval(g_language_data);
            if (b > 0) for (var e in lptranslationsother) lptranslations[e] = lptranslationsother[e]
        }
    }
}
var matches = document.location.href.match(/[?&]lplanguage=([^&]*)/);
if (matches) {
    g_language = matches[1];
    include_language(g_language)
}
var lpgslocales = [],
    lpgscache = [];

function gs(a, b) {
    var c = a.replace(/[^a-zA-Z0-9_]/g, "_"),
        d = "";
    if (typeof b != "undefined" && b && typeof translations != "undefined" && typeof translations[b] != "undefined" && typeof translations[b][a] != "undefined") d = translations[b][a];
    else if (typeof chrome != "undefined" && typeof chrome.i18n != "undefined" && typeof chrome.i18n.getMessage == "function") d = chrome.i18n.getMessage(c);
    else if (typeof lptranslations != "undefined") if (typeof lptranslations[c] != "undefined" && typeof lptranslations[c].message != "undefined") d = lptranslations[c].message;
    if (typeof d == "undefined" || d == null) d = "";
    if (d == "") d = a;
    if (g_issafari) {
        d = d.replace(/Google Chrome/g, "Safari");
        d = d.replace(/Chrome/g, "Safari")
    } else if (g_isopera) {
        d = d.replace(/Google Chrome/g, "Opera");
        d = d.replace(/Chrome/g, "Opera")
    }
    return d
}
function CheckStringForObfuscation(a, b, c) {
    if (a.indexOf("ff_") != 0 || c == null || typeof c == "undefined" || c.indexOf("__") != 0) return lpgscache[b] = c;
    c = c.substr(2);
    a = "";
    for (var d = 0; d < 8; d++) a += "arti";
    c = lpdec(c, a);
    return lpgscache[b] = c
}

function ApplyOverrides(a) {
    origlocale = a;
    a = a == "" ? "en-US" : a;
    var b = typeof g_ff == "undefined" ? "" : g_ff;
    if (b != null && b != "") {
        b = b.split("\n");
        for (var c = false, d = 0; d < b.length; d++) {
            if (c && b[d].indexOf("lang=") == 0) return;
            if (!c && b[d] == "lang=" + a) c = true;
            else if (c) {
                var e = b[d].indexOf("=");
                if (e != -1) {
                    var g = b[d].substr(0, e);
                    e = b[d].substr(e + 1);
                    CheckStringForObfuscation(g, origlocale + g, e)
                }
            }
        }
        lpgslocales[origlocale] = 1
    }
}
function ApplyAllOverrides() {
    lpgscache = [];
    lpgslocales = []
}

function sr(a, b, c, d) {
    (a = a.getElementById(b)) && a.setAttribute(c, gs(d))
}
function L(a) {
    console_log((new Date).getTime() - g_tsstart + " : " + a)
}
function probe(a, b) {
    var c = a;
    for (i in b) {
        var d = typeof b[i];
        if (d == "string" || d == "number") d = b[i];
        c += "\n" + i + " : " + d
    }
    L(c)
}

function getchromeurl(a) {
    if (g_ischrome) return chrome.extension.getURL(a);
    else if (g_issafari || g_isopera) {
        var b = "";
        if (typeof g_language != "undefined" && g_language) b = g_language;
        else if (typeof lpGetPref == "function") b = lpGetPref("language", "");
        a += (a.indexOf("?") != -1 ? "&" : "?") + "lplanguage=" + encodeURIComponent(b);
        return (g_issafari ? safari.extension.baseURI : "") + a
    }
}

function getdata_message_handler(a) {
    if (g_isopera) {
        a.message = a.data;
        a.name = a.data.messagetype
    }
    if (a.name == "gotdata") {
        for (var b in a.message) getBG()[b] = a.message[b];
        lp_iscbc = a.message.lp_iscbc;
        getBG().g_userprefs = LPJSON.parse(getBG().g_userprefsstr);
        g_userprefs = getBG().g_userprefs;
        getBG().g_gblprefs = LPJSON.parse(getBG().g_gblprefsstr);
        g_gblprefs = getBG().g_gblprefs;
        getBG().g_prompts = LPJSON.parse(getBG().g_promptsstr);
        g_prompts = getBG().g_prompts;
        if (g_getdata_page == "login") {
            if (getBG().g_reprompt_callback) getBG().g_reprompt_callback = function() {
                dispatch_message("reprompt_callback", {
                    g_user_prefs_to_write: LPJSON.stringify(g_user_prefs_to_write)
                })
            };
            if (getBG().g_reprompt_error_callback) getBG().g_reprompt_error_callback = function() {
                dispatch_message("reprompt_error_callback", {})
            }
        } else if (g_getdata_page == "omnikey") {
            if (getBG().g_omnikey_callback) getBG().g_omnikey_callback = function(c) {
                dispatch_message("omnikey_callback", {
                    pin: c,
                    g_user_prefs_to_write: LPJSON.stringify(g_user_prefs_to_write)
                })
            }
        } else if (g_getdata_page == "vault") {
            if (typeof a.message.g_sites != "undefined") getBG().g_pendings = LPJSON.parse(getBG().g_pendings)
        } else if (g_getdata_page == "formfill") getBG().g_formfill_data = LPJSON.parse(getBG().g_formfill_data);
        else if (g_getdata_page == "site") getBG().g_site_data = fix_fields(LPJSON.parse(getBG().g_site_data));
        if (typeof a.message.g_icons != "undefined") g_icons = getBG().g_icons = LPJSON.parse(getBG().g_icons);
        if (typeof a.message.g_sites != "undefined") {
            getBG().g_sites = LPJSON.parse(getBG().g_sites);
            if (typeof a.message.g_sites_tld != "undefined") getBG().g_sites_tld = LPJSON.parse(getBG().g_sites_tld);
            else getBG().g_sites_tld = getBG().g_sites
        }
        if (typeof a.message.g_securenotes != "undefined") getBG().g_securenotes = LPJSON.parse(getBG().g_securenotes);
        if (typeof a.message.g_formfills != "undefined") getBG().g_formfills = LPJSON.parse(getBG().g_formfills);
        if (typeof a.message.g_identities != "undefined") getBG().g_identities = LPJSON.parse(getBG().g_identities);
        if (typeof a.message.g_nevers != "undefined") getBG().g_nevers = LPJSON.parse(getBG().g_nevers);
        if (typeof a.message.g_prefoverrides != "undefined") getBG().g_prefoverrides = LPJSON.parse(getBG().g_prefoverrides);
        if (typeof getBG().g_local_key != "undefined") g_local_key = getBG().g_local_key;
        if (typeof getBG().ischrome != "undefined") ischrome = getBG().ischrome;
        g_getdata_handler()
    } else if (a.name == "delete_group_callback") typeof g_delete_group_callback == "function" && g_delete_group_callback();
    else if (a.name == "delete_aid_callback") typeof g_delete_aid_callback == "function" && g_delete_aid_callback();
    else if (a.name == "security_prompt_callback") typeof g_security_prompt_handler == "function" && g_security_prompt_handler();
    else if (a.name == "generatepasswordfound") typeof getBG().g_checkgeneratepasswordcallback == "function" && getBG().g_checkgeneratepasswordcallback();
    else if (a.name == "unprotect_data_callback") {
        for (b in passwords) if (passwords[b] == a.message.protected_data) {
            passwords[b] = a.message.unprotected_data;
            break
        }
        if (document.getElementById("p").value == a.message.protected_data) document.getElementById("p").value = a.message.unprotected_data
    }
}

function get_data(a, b) {
    if (g_ischrome) b();
    else if (g_issafari) {
        safari.self.addEventListener("message", getdata_message_handler, false);
        g_getdata_page = a;
        g_getdata_handler = b;
        dispatch_message("getdata", {
            page: a
        })
    } else if (g_isopera) {
        opera.extension.onmessage = getdata_message_handler;
        g_getdata_page = a;
        g_getdata_handler = b;
        dispatch_message("getdata", {
            page: a
        })
    }
}

function fakebg() {
    this.lpGetPref = function(a, b) {
        return lpGetPref(a, b)
    };
    this.lpPutUserPref = function(a, b) {
        g_user_prefs_to_write[a] = b
    };
    this.lpPutGblPref = function(a, b) {
        g_global_prefs_to_write[a] = b
    };
    this.lpWriteAllPrefs = function() {};
    this.LP_do_login = function(a, b, c, d, e, g) {
        dispatch_message("LP_do_login", {
            u: a,
            p: b,
            rememberemail: c,
            rememberpassword: d,
            donotclearmultifactor: e,
            showvault: g
        })
    };
    this.openURL = function(a, b, c) {
        a = {
            url: a
        };
        if (c) a.g_site_data = LPJSON.stringify(c);
        dispatch_message("openURL", a)
    };
    this.set_last_reprompt_time = function() {};
    this.have_nplastpass = function() {
        return typeof this.g_have_nplastpass != "undefined" && this.g_have_nplastpass
    };
    this.is_chrome_portable = function() {
        return false
    };
    this.update_prefs = function(a) {
        var b = {
            page: a,
            g_user_prefs_to_write: LPJSON.stringify(g_user_prefs_to_write),
            g_global_prefs_to_write: LPJSON.stringify(g_global_prefs_to_write)
        };
        if (a == "generate") b.g_genpws = this.g_genpws;
        dispatch_message("update_prefs", b)
    };
    this.update_prompts = function() {
        var a = {
            g_prompts: LPJSON.stringify(g_prompts)
        };
        dispatch_message("update_prompts", a)
    };
    this.check_ident_aid = function() {
        return true
    };
    this.check_ident_ffid = function() {
        return true
    };
    this.DeleteOTP = function() {};
    this.deletesavedpw = function() {};
    this.start_idle_checker = function() {};
    this.setprefs = function() {};
    this.get_searchNotesB64Length = function() {
        return this.maxnotesizeb64
    };
    this.IsIconsUpdated = function(a) {
        if (this.lpclearrecent) {
            this.lpclearrecent = false;
            return true
        }
        return this.g_icons_length != a
    };
    this.getClearRecentTime = function() {
        return this.clearRecentTime
    };
    this.getRecentCount = function() {
        return this.recentCount
    };
    this.hex2bin = function(a) {
        return AES.hex2bin(a)
    };
    this.bin2hex = function(a) {
        return AES.bin2hex(a)
    };
    this.lp_sort_case_insensitive_name = function(a, b) {
        a = a.name.toLowerCase();
        b = b.name.toLowerCase();
        return a < b ? -1 : 1
    };
    this.geticonhtml = function(a, b) {
        return geticonhtml(a, b)
    };
    this.geticonurl = function(a, b) {
        return geticonurl(a, b)
    };
    this.db_prepend = function(a) {
        return a
    };
    this.dec = function(a, b, c) {
        return dec(a, b, c)
    };
    this.enc = function(a, b) {
        return enc(a, b)
    };
    this.lpmdec = function(a, b) {
        return lpmdec(a, b)
    };
    this.lpmenc = function(a, b, c) {
        return lpmenc(a, b, c)
    };
    this.lpenc = function(a) {
        return lpenc(a)
    };
    this.lpdec = function(a) {
        return lpdec(a)
    };
    this.openall = function(a) {
        dispatch_message("openall", {
            group: a
        })
    };
    this.deleteGroup = function(a, b, c) {
        if (!(g_isopera && !confirm(gs("Are you sure you would like to delete?")))) {
            g_delete_group_callback = c;
            dispatch_message("deleteGroup", {
                group: a
            })
        }
    };
    this.copyusername = function(a) {
        dispatch_message("copyusername", {
            aid: a
        })
    };
    this.copypassword = function(a) {
        dispatch_message("copypassword", {
            aid: a
        })
    };
    this.deleteAid = function(a, b, c, d, e) {
        if (!(g_isopera && !confirm(gs("Are you sure you would like to delete?")))) {
            g_delete_aid_callback = e;
            dispatch_message("deleteAid", {
                aid: a
            })
        }
    };
    this.editAid = function(a) {
        dispatch_message("editAid", {
            aid: a
        })
    };
    this.gotourl = function(a) {
        dispatch_message("gotourl", {
            aid: a
        })
    };
    this.launch = function(a) {
        dispatch_message("launch", {
            aid: a
        })
    };
    this.open_login = function(a) {
        dispatch_message("open_login", {
            forcetab: a
        })
    };
    this.addprofile = function() {
        dispatch_message("addprofile", {})
    };
    this.addcreditcard = function() {
        dispatch_message("addcreditcard", {})
    };
    this.editprofile = function(a) {
        dispatch_message("editprofile", {
            ffid: a
        })
    };
    this.openprefs = function(a) {
        dispatch_message("openprefs", {
            tab: a
        })
    };
    this.openbaseurl = function(a) {
        dispatch_message("openbaseurl", {
            suffix: a
        })
    };
    this.changemasterpassword = function() {
        dispatch_message("changemasterpassword", {})
    };
    this.openaddsecurenote = function() {
        dispatch_message("openaddsecurenote", {})
    };
    this.loggedOut = function(a, b) {
        dispatch_message("loggedOut", {
            skiprequest: a,
            from: b
        })
    };
    this.switch_identity = function(a) {
        dispatch_message("switch_identity", {
            iid: a
        })
    };
    this.renameGroup = function(a, b) {
        dispatch_message("renameGroup", {
            origgrp: a,
            newgrp: b
        })
    };
    this.addEmptyGroup = function(a) {
        dispatch_message("addEmptyGroup", {
            newgrp: a
        })
    };
    this.moveSelectedToGroup = function(a, b) {
        dispatch_message("moveSelectedToGroup", {
            group: a,
            aids: b
        })
    };
    this.en = function(a) {
        return encodeURIComponent(a)
    };
    this.update_state = function(a) {
        g_getdata_page = "vault";
        if (a == "vault") g_getdata_handler = function() {
            checkLoggedInHome(true)
        };
        else if (a == "search") g_getdata_handler = function() {
            checkVersion(true)
        };
        dispatch_message("getdata", {
            page: "vault",
            g_username: this.g_username,
            g_local_accts_version: this.g_local_accts_version,
            lploggedin: this.lploggedin,
            g_identity: this.g_identity,
            g_isadmin: this.g_isadmin
        })
    };
    this.security_prompt = function(a) {
        g_security_prompt_handler = a;
        dispatch_message("security_prompt", {})
    };
    this.savePassword = function(a, b, c, d) {
        dispatch_message("savePassword", {
            pass: a,
            url: b,
            tabid: c,
            nofill: d
        })
    };
    this.checkgeneratepassword = function(a) {
        dispatch_message("checkgeneratepassword", {
            tabid: a
        })
    };
    this.fillform = function(a, b, c, d) {
        dispatch_message("fillform", {
            ffid: a,
            origtabid: c,
            ccffid: d
        })
    };
    this.getsites = function() {
        return this.g_sites_tld
    };
    this.changePassword = function(a, b) {
        dispatch_message("changePassword", {
            password: a,
            aids: b
        })
    };
    this.getusernamefromacct = function(a) {
        return getusernamefromacct(a)
    };
    this.receiveTS = function(a, b) {
        dispatch_message("receiveTS", b)
    };
    this.deleteformfill = function(a) {
        dispatch_message("deleteformfill", {
            ffid: a
        })
    };
    this.addeditformfill = function(a, b) {
        dispatch_message("addeditformfill", {
            ffdata: LPJSON.stringify(a),
            site: LPJSON.stringify(b)
        })
    };
    this.getname_url = function(a) {
        return getname_url(a)
    };
    this.createNewAcct = function() {
        return createNewAcct()
    };
    this.fix_tlds = function(a, b, c) {
        dispatch_message("fix_tlds", {
            oldtld: a,
            newtld: b,
            aid: c
        })
    };
    this.increment_local_accts_version = function() {
        dispatch_message("increment_local_accts_version", {})
    };
    this.rewritelocalfile = function() {
        dispatch_message("rewritelocalfile", {})
    };
    this.saveSite = function(a, b) {
        dispatch_message("saveSite", {
            postdata: a,
            acct: LPJSON.stringify(b)
        })
    };
    this.saveAllSite = function(a, b) {
        dispatch_message("saveAllSite", {
            postdata: a,
            acct: LPJSON.stringify(b)
        })
    };
    this.saveSiteFromSubmit = function(a, b) {
        dispatch_message("saveSiteFromSubmit", {
            postdata: a,
            acct: LPJSON.stringify(b)
        })
    };
    this.saveFields = function(a, b, c) {
        dispatch_message("saveFields", {
            getdata: a,
            postdata: b,
            aData: LPJSON.stringify(c)
        })
    };
    this.update_site = function(a) {
        var b = null;
        if (typeof this.g_sites[a] != "undefined") b = this.g_sites[a];
        else if (typeof this.g_securenotes[a] != "undefined") b = this.g_securenotes[a];
        b && dispatch_message("update_site", {
            site: LPJSON.stringify(b)
        })
    };
    this.update_fields = function(a, b) {
        dispatch_message("update_fields", {
            aid: a,
            fields: LPJSON.stringify(b)
        })
    };
    this.set_editfieldsopener = function() {
        dispatch_message("set_editfieldsopener", {})
    };
    this.close_editfieldsopener = function() {
        dispatch_message("close_editfieldsopener", {})
    };
    this.unprotect_data = function(a) {
        dispatch_message("unprotect_data", {
            data: a
        });
        return a
    };
    this.select_selectedtabid = function() {
        dispatch_message("select_selectedtabid", {})
    };
    this.closecurrenttab = function(a) {
        g_isopera ? window.close() : dispatch_message("closecurrenttab", {
            page: a
        })
    };
    this.add_identity = function() {
        dispatch_message("add_identity", {})
    };
    this.checkforupdates = function() {
        dispatch_message("checkforupdates", {})
    };
    this.clearforms = function() {
        dispatch_message("clearforms", {})
    };
    this.clearrecent = function() {
        dispatch_message("clearrecent", {})
    };
    this.openabout = function() {
        dispatch_message("openabout", {})
    };
    this.openaddsite = function() {
        dispatch_message("openaddsite", {})
    };
    this.openchooseprofilecc = function() {
        dispatch_message("openchooseprofilecc", {})
    };
    this.openexport = function() {
        dispatch_message("openexport", {})
    };
    this.openfavorites = function() {
        dispatch_message("openfavorites", {})
    };
    this.openfeedback = function() {
        dispatch_message("openfeedback", {})
    };
    this.opengenpw = function() {
        dispatch_message("opengenpw", {})
    };
    this.openhelp = function() {
        dispatch_message("openhelp", {})
    };
    this.openimport = function() {
        dispatch_message("openimport", {})
    };
    this.openimportchrome = function() {
        dispatch_message("openimportchrome", {})
    };
    this.openlastpassexport = function() {
        dispatch_message("openlastpassexport", {})
    };
    this.openpremium = function() {
        dispatch_message("openpremium", {})
    };
    this.opensearch = function() {
        dispatch_message("opensearch", {})
    };
    this.openseccheck = function() {
        dispatch_message("openseccheck", {})
    };
    this.opensessions = function() {
        dispatch_message("opensessions", {})
    };
    this.openvault = function() {
        dispatch_message("openvault", {})
    };
    this.recheckpage = function() {
        dispatch_message("recheckpage", {})
    };
    this.refreshsites = function() {
        dispatch_message("refreshsites", {})
    };
    this.saveall = function() {
        dispatch_message("saveall", {})
    };
    this.upgradetoserver = function() {
        dispatch_message("upgradetoserver", {})
    };
    this.clearCache = function(a) {
        dispatch_message("clearCache", {
            noprompt: a
        })
    };
    this.deleteNever = function(a) {
        dispatch_message("deleteNever", {
            n: LPJSON.stringify(a)
        })
    };
    this.fillaid = function(a) {
        dispatch_message("fillaid", {
            aid: a
        })
    };
    this.openprint = function(a) {
        dispatch_message("openprint", {
            notes: a
        })
    };
    this.getmatchingsites = function() {
        var a = this.g_sites_tld,
            b, c, d = [];
        for (b in a) {
            c = a[b].aid;
            if (typeof this.g_sites[c] != "undefined") {
                c = this.g_sites[c];
                d.push({
                    aid: c.aid,
                    name: c.name,
                    username: getusernamefromacct(c),
                    fiid: c.fiid
                })
            }
        }
        return d
    };
    this.getnevers = function() {
        return this.g_nevers
    };
    this.getmenuheight = function() {
        return g_menuheight
    }
}

function getBG() {
    if (g_bg != null) return g_bg;
    try {
        if (g_ischrome) {
            if (typeof chrome.extension.getBackgroundPage == "function") {
                g_bg = chrome.extension.getBackgroundPage();
                if (g_bg != null) return g_bg
            }
            var a = chrome.extension.getViews(),
                b;
            for (b in a) if (typeof a[b].receiveTS == "function") return g_bg = a[b]
        } else if (g_issafari || g_isopera) {
            if (g_issafari) if (typeof safari.extension.globalPage != "undefined") return g_bg = safari.extension.globalPage.contentWindow;
            return g_bg = new fakebg
        }
        L("TS : getBG FAILED");
        return null
    } catch (c) {
        L("TS : getBG FAILED error=" + c)
    }
    return null
}
function array_length(a) {
    var b = 0,
        c;
    for (c in a) b++;
    return b
}
Clipboard = {};
Clipboard.utilities = {};
Clipboard.utilities.createTextArea = function(a) {
    var b = document.createElement("textarea");
    b.style.position = "absolute";
    b.style.left = "-100%";
    if (a != null) b.value = a;
    document.body.appendChild(b);
    return b
};
Clipboard.copy = function(a) {
    if (a != null) {
        if (a == "") a = " ";
        a = Clipboard.utilities.createTextArea(a);
        a.select();
        document.execCommand("Copy");
        document.body.removeChild(a)
    }
};
Clipboard.paste = function() {
    var a = Clipboard.utilities.createTextArea();
    a.focus();
    document.execCommand("Paste");
    var b = a.value;
    document.body.removeChild(a);
    return b
};

function es(a) {
    a = a.replace(/\\/g, "\\\\");
    a = a.replace(/'/g, "\\'");
    return a = a.replace(/"/g, '\\"')
}

function show_password_meter(a) {
    document.writeln('<div id="page_passwordmeterback" style="text-align:left;height:10px;border:1px solid #B5B8C8;width:' + a + 'px;background-image:url(images/passwordmeter_back.gif);margin-top:3px;">');
    document.writeln('<div id="page_passwordmeterfront" style="background-image:url(images/passwordmeter_front.gif);height:10px;width:50px;line-height:1px;font-size:1px;">');
    document.writeln("</div>");
    document.writeln("</div>")
}

function update_password_meter(a, b) {
    var c = getpasswordstrength(a, b);
    update_password_meter_manual(c)
}
function update_password_meter_manual(a) {
    var b = parseInt(document.getElementById("page_passwordmeterback").style.width);
    a = Math.round(a * b / 100) + "px";
    document.getElementById("page_passwordmeterfront").style.width = a
}

function getpasswordstrength(a, b) {
    var c = 0;
    if (a == "" && b == "") return 0;
    if (b == a) return 1;
    if (a != "" && a.indexOf(b) != -1) c -= 15;
    if (a != "" && b.indexOf(a) != -1) c -= a.length;
    c += b.length;
    if (b.length > 0 && b.length <= 4) c += b.length;
    else if (b.length >= 5 && b.length <= 7) c += 6;
    else if (b.length >= 8 && b.length <= 15) c += 12;
    else if (b.length >= 16) c += 18;
    if (b.match(/[a-z]/)) c += 1;
    if (b.match(/[A-Z]/)) c += 5;
    if (b.match(/\d/)) c += 5;
    if (b.match(/.*\d.*\d.*\d/)) c += 5;
    if (b.match(/[!,@,#,$,%,^,&,*,?,_,~]/)) c += 5;
    if (b.match(/.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~]/)) c += 5;
    if (b.match(/(?=.*[a-z])(?=.*[A-Z])/)) c += 2;
    if (b.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/)) c += 2;
    if (b.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!,@,#,$,%,^,&,*,?,_,~])/)) c += 2;
    var d = [],
        e = 0,
        g, j;
    for (g = 0; g < b.length; ++g) {
        j = b.charAt(g);
        if (typeof d[j] == "undefined") {
            d[j] = 1;
            ++e
        }
    }
    if (e == 1) return 2;
    c *= 2;
    if (c < 0) c = 0;
    else if (c > 100) c = 100;
    return c
}
function geticonhtml(a, b) {
    return "<image src='" + geticonurl(a, b) + "'/>"
}

function getNoteValue(a, b, c) {
    a += ":";
    if (!b) return null;
    b = "\n" + b;
    var d = b.indexOf("\n" + a);
    if (a == "NoteType:") {
        if (d != 0) return null
    } else if (d == -1) return null;
    d++;
    c = c ? "-1" : b.indexOf("\n", d);
    if (c == -1) c = b.length;
    return b.substring(d + a.length, c).replace(/^\s*/, "").replace(/\s*$/, "")
}

function geticonurl(a, b) {
    var c = "data:image/gif;base64,R0lGODlhEAAQAIcAAAAAAExnf1BpgWR0iHZ6hHeBkX+GkYiOmpeaopucoaSlqqWmqrm9w7q+xL+/wry/xcXGyc3Oz9HS1NPU1tnZ2d/h4+Di5OLj5uPl5+Tk5OXm6O7u7+7v8O/w8e/w8vDw8fHx8vLy8/Pz8/Pz9PT09fX19fX29vb29vf39/f3+Pj4+Pj4+fn5+vr6+/v7/Pz8/P39/f7+/v///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAAAALAAAAAAQABAAAAiQAAEIHEiw4MAFCBEmQCjBIIAFMiLK8CBjA4QIBiFu2Fgh4oYJDgpq5Chxw4KCCiqSlKigIAKVGyowYNDgAYGCB2BWsHABgwYDBQvA/CCiBAoVBQoOUNlBhAkVLV4MKCigIgenK1zAiCGgYICKIEhAhRExgFcZHEKcYEG27NkOI1K0aCvDLMEAePPqteuwr8CAADs=";
    if (a == "sn") return "data:image/gif;base64,R0lGODlhEAAQAPfBAFdCGCpgtyxity1kuS5kuS5luS9lujBlujBmujFmuzFnuzNpvIdhK4JmLjZvvzhxvzt2wTt2xKZoJjx4wT98xUB8xEKAxUKAxkWCxUWCxkeExkmFxEmIxkqIxkuIxWCFrUuJxUuJxkyJxr56Gk2LyE+Lx0+MyE+MyU+NyKqJQ8mFQWWU27yJTMKMSMeMSMWYSWWo0siZZLOfcNqYSduZS9CdRk+y99iaVFGy99mbUVW0+NOfZuChUdejY32y4tilWGG8+2K8/GK9/GO9+2C+/Ge9/GS+/GW++2i//W7C/duxhb+2ptW2etG3kNa5dprJ4+e+d+fAi8zGsMzGs+TJVcLLtpPU/8nNr5TV/+3KbefLd5XW//nHlPnJke3QeM3S2tDUvrjW9O7TebrW9fDTecjV4u7UffHUe9XWve7Vgc3W4fLWeu/SrPDStMHb+PbTrvXcXvXcX8Lc+MTd+fXfW/bdbPffY8Xf+ffhWsfg+sjg+ffiW8jg+8ng+/jiXcjh+8nh+8rh+sni+8vi+83j+83j/Onf0s7j+8/j/M/k/NDk+9Hk/PHjr9Xl/tPm/Nfm8tTm/NTm/fzgxPnjstPn/dXn/dbn/dbn/tfn/tbo/tfo/tjo/tzq9t7q9t7r9t/r9d/s9+Pt9+bw9+jx+Orx+Ory+uvy+Ozy9+zy+Ovz+uzz+e3z+O30+O30+e70+O/0+f/y4PD0+f32wv32xPH1+f/z5f33x/L2+vL3+/P3/PT3+/T4/PX5/Pf6/fj7/fj7//3+/v///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////yH5BAEKAP8ALAAAAAAQABAAAAj+AP/9I2GioAkUJ0qAiCCw4YZTrlitmojq1CMfKxr+83ArDyBBfO64CfOryg8lNQSKoFXoEKFBeuSMYQSlTS02Lv6FoIVIUaJCgeZcSTMpyhtJO3TGcgSJ0iJCYMzMqpOlRwyBHV5hslQpEhoxtuLsWcPjg0AOrTZt0iRFiy04eM7QMJRBoAZVmTRNcSLLjh8yM8qUuiAQg6lLS5g0oULHSw41gHBREGhhVKMUsG6MeNHiS58/vSAIrCBKRwMuXVRIgIHDhg1eDgROCJUEAAMWMp5swWLliC4FAh98QlLkiBEjQoYAIRLE1wCBC0iB8tSJE6dUqUrl2gUsQMMDCRAMiD9goEABAgQECAwIADs=";
    if (a != null) if (typeof g_icons[a + ".gif"] != "undefined") c = "data:image/gif;base64," + g_icons[a + ".gif"];
    else if (typeof g_icons[a + ".ico"] != "undefined") c = "data:image/ico;base64," + g_icons[a + ".ico"];
    else if (b) {
        c = geticonsntemplate(a);
        if (c == null) c = "data:image/gif;base64,R0lGODlhEAAQAPfBAFdCGCpgtyxity1kuS5kuS5luS9lujBlujBmujFmuzFnuzNpvIdhK4JmLjZvvzhxvzt2wTt2xKZoJjx4wT98xUB8xEKAxUKAxkWCxUWCxkeExkmFxEmIxkqIxkuIxWCFrUuJxUuJxkyJxr56Gk2LyE+Lx0+MyE+MyU+NyKqJQ8mFQWWU27yJTMKMSMeMSMWYSWWo0siZZLOfcNqYSduZS9CdRk+y99iaVFGy99mbUVW0+NOfZuChUdejY32y4tilWGG8+2K8/GK9/GO9+2C+/Ge9/GS+/GW++2i//W7C/duxhb+2ptW2etG3kNa5dprJ4+e+d+fAi8zGsMzGs+TJVcLLtpPU/8nNr5TV/+3KbefLd5XW//nHlPnJke3QeM3S2tDUvrjW9O7TebrW9fDTecjV4u7UffHUe9XWve7Vgc3W4fLWeu/SrPDStMHb+PbTrvXcXvXcX8Lc+MTd+fXfW/bdbPffY8Xf+ffhWsfg+sjg+ffiW8jg+8ng+/jiXcjh+8nh+8rh+sni+8vi+83j+83j/Onf0s7j+8/j/M/k/NDk+9Hk/PHjr9Xl/tPm/Nfm8tTm/NTm/fzgxPnjstPn/dXn/dbn/dbn/tfn/tbo/tfo/tjo/tzq9t7q9t7r9t/r9d/s9+Pt9+bw9+jx+Orx+Ory+uvy+Ozy9+zy+Ovz+uzz+e3z+O30+O30+e70+O/0+f/y4PD0+f32wv32xPH1+f/z5f33x/L2+vL3+/P3/PT3+/T4/PX5/Pf6/fj7/fj7//3+/v///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////yH5BAEKAP8ALAAAAAAQABAAAAj+AP/9I2GioAkUJ0qAiCCw4YZTrlitmojq1CMfKxr+83ArDyBBfO64CfOryg8lNQSKoFXoEKFBeuSMYQSlTS02Lv6FoIVIUaJCgeZcSTMpyhtJO3TGcgSJ0iJCYMzMqpOlRwyBHV5hslQpEhoxtuLsWcPjg0AOrTZt0iRFiy04eM7QMJRBoAZVmTRNcSLLjh8yM8qUuiAQg6lLS5g0oULHSw41gHBREGhhVKMUsG6MeNHiS58/vSAIrCBKRwMuXVRIgIHDhg1eDgROCJUEAAMWMp5swWLliC4FAh98QlLkiBEjQoYAIRLE1wCBC0iB8tSJE6dUqUrl2gUsQMMDCRAMiD9goEABAgQECAwIADs="
    }
    return c
}

function geticonsntemplate(a) {
    if (typeof getBG().g_securenotes[a] != "undefined") if (getBG().g_securenotes[a].extra.length < 512) if ((a = getNoteValue("NoteType", lpmdec(getBG().g_securenotes[a].extra, true))) && typeof sntemplateicons[a] != "undefined") return sntemplateicons[a];
    return null
}
function getcount(a) {
    var b = 0,
        c;
    for (c in a) b++;
    return b
}

function getusernamefromacct(a) {
    if (a.save_all) {
        for (var b = 0; b < a.fields.length; b++) if (("text" == a.fields[b].type || "email" == a.fields[b].type) && a.fields[b].value != "") return lpmdec(a.fields[b].value, true);
        return ""
    } else return typeof a.unencryptedUsername != "undefined" ? a.unencryptedUsername : ""
}

function createNewAcct() {
    var a = [];
    a.aid = "";
    a.name = "";
    a.group = "";
    a.url = "";
    a.tld = "";
    a.extra = "";
    a.fav = "0";
    a.sharedfromuid = "";
    a.username = "";
    a.unencryptedUsername = "";
    a.password = "";
    a.pwprotect = 0;
    a.genpw = 0;
    a.sn = 0;
    a.last_touch = "";
    a.autologin = 0;
    a.never_autofill = 0;
    a.realm_data = "";
    a.fiid = "";
    a.custom_js = "";
    a.submit_id = "";
    a.captcha_id = "";
    a.urid = "0";
    a.basic_auth = "0";
    a.method = "";
    a.action = "";
    a.fields = [];
    return a
}

function fix_fields(a) {
    if (typeof a.fields != "undefined" && typeof a.fields.length == "undefined") {
        var b = [],
            c;
        for (c in a.fields) b[b.length] = a.fields[c];
        a.fields = b
    }
    return a
}
function console_log(a) {
    g_isopera ? window.opera.postError(a) : console.log(a)
}
function console_warn(a) {
    g_isopera ? window.opera.postError(a) : console.warn(a)
}
function console_error(a) {
    g_isopera ? window.opera.postError(a) : console.error(a)
}

function dispatch_message(a, b) {
    if (g_issafari) safari.self.tab.dispatchMessage(a, b);
    else if (g_isopera) {
        b.messagetype = a;
        opera.extension.postMessage(b)
    }
}
var g_port = null,
    g_foundmanual = false,
    LP_last_form = null,
    g_docnum = null,
    lpsavedform = null,
    lpsavedformfields = [],
    lpsharedpasswordfills = [],
    g_fillaid = null,
    g_setup_hotkey_handler = false,
    curr_notification_type = "",
    lpgenpassforms = [],
    lpgenpasscurrentpwfields = [],
    g_sites = [],
    g_formfills = [],
    g_ischrome = typeof chrome != "undefined" && typeof chrome.extension != "undefined",
    g_issafari = typeof safari != "undefined" && typeof safari.self != "undefined",
    g_isopera = typeof opera != "undefined" && typeof opera.extension != "undefined",
    disable_check_form_fill = true;

function message_handler(a) {
    if (g_issafari) a.name == "message" && receiveBG(a.message);
    else g_isopera && a.data.messagetype == "message" && receiveBG(a.data)
}
function send_focus() {
    if (g_issafari) safari.self.tab.dispatchMessage("focus", {
        url: document.location.href
    });
    else g_isopera && opera.extension.postMessage({
        messagetype: "focus",
        url: document.location.href
    })
}

function onLoad() {
    if (g_ischrome) {
        g_port = chrome.extension.connect({
            name: document.location.href
        });
        g_port.onMessage.addListener(receiveBG);
        g_port.onDisconnect.addListener(function(a) {
            receiveBG(null, a, 1)
        })
    } else if (g_issafari) {
        safari.self.addEventListener("message", message_handler, false);
        g_docnum = Math.floor(Math.random() * 1E8);
        safari.self.tab.dispatchMessage("connect", {
            name: document.location.href,
            docnum: g_docnum
        });
        if (window == lpgettop()) {
            send_focus();
            window.addEventListener("focus", function() {
                send_focus()
            }, false)
        }
    } else if (g_isopera) {
        opera.extension.onmessage = message_handler;
        g_docnum = Math.floor(Math.random() * 1E8);
        opera.extension.postMessage({
            messagetype: "connect",
            name: document.location.href,
            docnum: g_docnum,
            topurl: lpgettopurl()
        })
    }
}
var g_lp_hotkeys = ["generateHk", "recheckHk", "searchHk", "nextHk", "prevHk", "homeHk", "submitHk", "saveallHk", "logoffHk", "defaultffidHk"],
    g_hotkey_data = [];

function handle_hotkey(a) {
    var b = a.keyCode != 0 ? a.keyCode : a.charCode;
    if (!(b < 32)) {
        var c = "";
        c += a.ctrlKey ? "control" : "";
        c += a.metaKey ? (c != "" ? " " : "") + "meta" : "";
        c += a.altKey ? (c != "" ? " " : "") + "alt" : "";
        c += a.shiftKey ? (c != "" ? " " : "") + "shift" : "";
        if (!(c == "" || c == "shift")) for (a = 0; a < g_lp_hotkeys.length; a++) {
            var d = g_lp_hotkeys[a];
            if (g_hotkey_data[d + "KeyCode"] == b && g_hotkey_data[d + "Mods"] == c) {
                sendBG({
                    cmd: "runhotkey",
                    hotkey: d
                });
                break
            }
        }
    }
}
function disconnectBG() {
    if (g_port) {
        g_port.disconnect();
        g_port = null
    }
}

function sendBG(a) {
    a.docnum = g_docnum;
    if (g_ischrome) g_port ? g_port.postMessage(a) : L("CS -> BG : FAILED " + a.cmd);
    else if (g_issafari) safari.self.tab.dispatchMessage("message", a);
    else if (g_isopera) {
        a.messagetype = "message";
        a.topurl = lpgettopurl();
        opera.extension.postMessage(a)
    }
}
var g_form = null,
    g_fillreqdocs = [];

function receiveBG(a, b, c) {
    if (!((g_issafari || g_isopera) && typeof a.docnum != "undefined" && a.docnum != g_docnum)) if (c) {
        L("BG -> CS : DISCONNECT");
        g_port = null
    } else if (typeof a.cmd == "undefined") L("BG -> CS : INVALIDMSG");
    else switch (a.cmd) {
    case "setdocnum":
        g_docnum = a.docnum;
        g_ff = a.ff;
        if (g_issafari || g_isopera) eval(a.language_data);
        sendBG({
            cmd: "getprefs",
            url: document.location.href,
            username_val: get_username_val(document)
        });
        evalScriptsInFrame(window, document);
        break;
    case "rsadecrypt":
        g_form.eventtype.value = a.rc;
        g_form.eventdata4.value = a.sharekeyhex;
        break;
    case "plug2web":
        g_form.eventdata1.value = a.username;
        g_form.eventdata2.value = a.key;
        g_form.eventdata3.value = a.version;
        g_form.eventdata4.value = a.identity;
        setTimeout(function() {
            evaluntilfindmanual()
        }, 500);
        break;
    case "fillfield":
        fillfield(a);
        break;
    case "fillbest":
        fillbest(a);
        break;
    case "run_custom_js":
        if (a.custom_js != "") {
            b = a.docid ? g_fillreqdocs[a.docid] : document;
            run_custom_js(b, lpPrepareCustomJS(a.custom_js, a.username, a.password, a.loc + "", a.onlyfill, b))
        }
        break;
    case "submit":
        submit(a);
        break;
    case "fillform":
        fillform(a);
        break;
    case "clearforms":
        lpClearForms(null, document, 1, window);
        break;
    case "saveall":
        saveall();
        break;
    case "setprefs":
        lpdisableHighlightField = a.highlightFields == 0;
        lpwarninsecureforms = a.warninsecureforms;
        lpdontfillautocompleteoff = a.dontfillautocompleteoff;
        lpdonotoverwritefilledfields = a.donotoverwritefilledfields;
        lpOfferGeneratePasswd = a.showGenerateNotifications;
        lpShowFormFillNotifications = a.showFormFillNotifications;
        lpNotificationsAfterClick = a.showNotificationsAfterClick;
        alwayschooseprofilecc = a.alwayschooseprofilecc;
        automaticallyFill = a.automaticallyFill;
        b = false;
        for (c = 0; c < g_lp_hotkeys.length; c++) {
            var d = g_lp_hotkeys[c];
            if (a[d + "KeyCode"] != 0) b = true;
            g_hotkey_data[d + "KeyCode"] = a[d + "KeyCode"];
            g_hotkey_data[d + "Mods"] = a[d + "Mods"]
        }
        if (b && !g_setup_hotkey_handler) {
            g_setup_hotkey_handler = true;
            window.addEventListener("keydown", function(e) {
                handle_hotkey(e)
            }, false)
        }
        break;
    case "setuuid":
        g_form.eventdata1.value = a.uuid;
        break;
    case "recover":
        g_form.eventdata2.value = a.otp;
        break;
    case "recheck":
        evalScriptsInFrame(window, document, true);
        break;
    case "loadurl":
        document.location.href = a.url;
        break;
    case "setupmultifactor":
        g_form.eventdata3.value = a.result;
        break;
    case "setupsinglefactor":
        g_form.eventdata4.value = a.result;
        break;
    case "checkmultifactorsupport":
        g_form.eventdata4.value = a.type;
        g_form.eventdata3.value = a.result;
        break;
    case "multifactorauth":
        g_form.eventdata5.value = a.multifactorresponse;
        g_form.eventdata3.value = a.result;
        break;
    case "multifactorreprompt":
        g_form.eventdata3.value = a.result;
        break;
    case "showfillnotification":
        lpshownotification("fill", a);
        break;
    case "showaddnotification":
        lpshownotification("add", a);
        break;
    case "showchangenotification":
        lpshownotification("change", a);
        break;
    case "showerrornotification":
        lpshownotification("error", a);
        break;
    case "showbasicauthnotification":
        lpshownotification("basicauth", a);
        break;
    case "closenotification":
        lpclosenotification();
        break;
    case "checkgenpwfillforms":
        checkgenpwfillforms(a);
        break;
    case "fillcurrent":
        fillcurrent(a);
        break;
    case "checkgeneratepassword":
        lpCheckGeneratePassword(null, document, true, window) && sendBG({
            cmd: "generatepasswordfound"
        });
        break;
    case "populategeneratedpassword":
        a.url == document.location.href && populategeneratedpassword(a.url, a.password, a.nofill);
        break;
    default:
        L("BG -> CS : INVALIDMSG")
    }
}
function fillcurrent(a) {
    if (typeof lpgenpasscurrentpwfields[document.location.href] != "undefined" && lpgenpasscurrentpwfields[document.location.href]) lpgenpasscurrentpwfields[document.location.href].value = a.password
}

function checkgenpwfillforms(a) {
    g_sites = LPJSON.parse(a.sites);
    g_formfills = LPJSON.parse(a.formfills);
    a.nevergenerate || lpCheckGeneratePassword(null, document, false, window)
}

function evalScriptsInFrame(a, b, c) {
    try {
        for (var d = 0; b.frames && d < b.frames.length; d++) evalScriptsInFrame(b.frames[d], b.frames[d].document, c)
    } catch (e) {}
    d = b.readyState;
    if (c || d == "loaded" || d == "complete") {
        if (b.body && typeof b.body._lpcrdone == "undefined") {
            b.body._lpcrdone = 1;
            hookAllFormSubmits(b)
        } else if (!c) return;
        c = c ? 1 : 0;
        sendBG({
            cmd: "fill",
            url: b.location.href,
            docid: g_fillreqdocs.length,
            force: c
        });
        g_fillreqdocs[g_fillreqdocs.length] = b;
        d != "complete" && window.addEventListener("load", function() {
            sendBG({
                cmd: "fill",
                url: b.location.href,
                docid: g_fillreqdocs.length - 1,
                force: c
            })
        }, false)
    } else setTimeout(function() {
        evalScriptsInFrame(a, b, 0)
    }, 100)
}

function hookAllFormSubmits(a) {
    try {
        if (lp_gettld_url(a.location.href) != "acidtests.org" && a.getElementById("hiddenlpsubmitdiv") == null && a.forms.length > 0) {
            var b = a.createElement("div");
            b.style.display = "none";
            b.id = "hiddenlpsubmitdiv";
            a.body && a.body.appendChild(b);
            run_custom_js(a, 'for(var lastpass_iter=0; lastpass_iter < document.forms.length; lastpass_iter++){ var lastpass_f = document.forms[lastpass_iter]; if(typeof(lastpass_f.lpsubmitorig2)=="undefined"){ lastpass_f.lpsubmitorig2 = lastpass_f.submit; lastpass_f.submit = function(){ var form=this; var customEvent = document.createEvent("Event"); customEvent.initEvent("lpCustomEvent", true, true); var d = document.getElementById("hiddenlpsubmitdiv"); for(var i = 0; i < document.forms.length; i++){ if(document.forms[i]==form){ d.innerText=i; } } d.dispatchEvent(customEvent); form.lpsubmitorig2(); } } }');
            b.addEventListener("lpCustomEvent", function() {
                handle_form_submit(a, a.forms[parseInt(b.innerText)])
            })
        }
        for (var c = 0; c < a.forms.length; c++) {
            var d = a.forms[c];
            if (typeof d.lpsubmitorig == "undefined") {
                if (d.name == "lpmanualform") g_foundmanual = true;
                d.lpsubmitorig = true;
                d.addEventListener("submit", function(k) {
                    handle_form_submit(a, k.target)
                }, false);
                if (typeof d.elements != "function") for (var e = 0; e < d.elements.length; e++) {
                    var g = d.elements[e];
                    if ("text" == g.type || "email" == g.type || "password" == g.type) g.addEventListener("change", lpfieldchange, false)
                }
            }
        }
    } catch (j) {}
}

function handle_form_submit(a, b) {
    try {
        if (b.name == "lpwebsiteeventform") lpwebsiteevent(a, b);
        else if (b.name == "lpmanualform") lpmanuallogin(a, b);
        else {
            var c = LP_get_form_save(b);
            if (c == null) return false;
            if (typeof a.LPlpsaveforminfo != "undefined") lpupdatefields(a, c);
            else typeof a.LPlpsaveforminfoaddurid != "undefined" ? lpaddurid(a, c) : lpformsubmit(a, c)
        }
    } catch (d) {}
}
function lpupdatefields(a, b) {
    sendBG({
        cmd: "updatefields",
        url: a.location.href,
        formdata: b,
        aid: a.LPlpsaveforminfo
    })
}

function lpaddurid(a, b) {
    sendBG({
        cmd: "addurid",
        url: a.location.href,
        formdata: b,
        aid: a.LPlpsaveforminfoaddurid
    })
}
function lpformsubmit(a, b) {
    sendBG({
        cmd: "save",
        url: a.location.href,
        formdata: b
    })
}
function lpmanuallogin(a, b) {
    sendBG({
        cmd: "launchautologin",
        url: a.location.href,
        aid: b.aid.value
    })
}

function lpwebsiteevent(a, b) {
    sendBG({
        cmd: "log",
        msg: "Event: " + b.eventtype.value
    });
    if (b.eventtype.value == "keyplug2web") {
        g_form = b;
        sendBG({
            cmd: "plug2web",
            url: a.location.href,
            username: b.eventdata1.value
        })
    } else if (b.eventtype.value == "keyweb2plug") sendBG({
        cmd: "web2plug",
        url: a.location.href,
        key: b.eventdata1.value,
        username: b.eventdata2.value,
        rsa: b.eventdata3.value
    });
    else if (b.eventtype.value == "logoff") sendBG({
        cmd: "logoff",
        url: a.location.href
    });
    else if (b.eventtype.value == "login") sendBG({
        cmd: "login",
        url: a.location.href,
        wxusername: b.eventdata1.value,
        keyhex: b.eventdata2.value,
        wxhash: b.eventdata3.value,
        wxsessid: b.eventdata5.value
    });
    else if (b.eventtype.value == "rsadecrypt") {
        g_form = b;
        sendBG({
            cmd: "rsadecrypt",
            url: a.location.href,
            sharerpublickeyhex: b.eventdata1.value,
            sharekeyenchexsig: b.eventdata2.value,
            sharekeyenchex: b.eventdata3.value
        })
    } else if (b.eventtype.value == "clearcache") sendBG({
        cmd: "clearcache",
        url: a.location.href
    });
    else if (b.eventtype.value == "recover") {
        g_form = b;
        sendBG({
            cmd: "recover",
            url: a.location.href,
            username: b.eventdata1.value
        })
    } else if (b.eventtype.value == "refresh") sendBG({
        cmd: "refresh",
        url: a.location.href,
        from: b.eventdata1.value,
        type: b.eventdata2.value
    });
    else if (b.eventtype.value == "switchidentity") sendBG({
        cmd: "switchidentity",
        url: a.location.href,
        iid: b.eventdata1.value
    });
    else if (b.eventtype.value == "getuuid") {
        g_form = b;
        sendBG({
            cmd: "getuuid"
        })
    } else if (b.eventtype.value == "setupmultifactor") {
        b.eventdata3.value = "working";
        g_form = b;
        sendBG({
            cmd: "setupmultifactor",
            type: b.eventdata1.value,
            username: b.eventdata2.value
        })
    } else if (b.eventtype.value == "setupsinglefactor") {
        if (b.eventdata5.value != "1") b.eventdata4.value = "working";
        g_form = b;
        sendBG({
            cmd: "setupsinglefactor",
            type: b.eventdata1.value,
            username: b.eventdata2.value,
            password: b.eventdata3.value,
            silent: b.eventdata5.value
        })
    } else if (b.eventtype.value == "checkmultifactorsupport") {
        g_form = b;
        sendBG({
            cmd: "checkmultifactorsupport",
            type: b.eventdata1.value
        })
    } else if (b.eventtype.value == "multifactorauth") {
        b.eventdata3.value = "working";
        g_form = b;
        sendBG({
            cmd: "multifactorauth",
            type: b.eventdata1.value,
            username: b.eventdata2.value,
            challenge: b.eventdata4.value
        })
    } else if (b.eventtype.value == "multifactorreprompt") {
        b.eventdata3.value = "working";
        g_form = b;
        sendBG({
            cmd: "multifactorreprompt",
            type: b.eventdata1.value,
            username: b.eventdata2.value,
            challenge: b.eventdata4.value
        })
    } else b.eventtype.value == "gohome" && sendBG({
        cmd: "gohome",
        email: b.eventdata1.value,
        sesameotp: b.eventdata2.value
    })
}

function run_custom_js(a, b) {
    try {
        if (b != "") if (!(lp_gettld_url(a.location.href) == "facebook.com" && a.getElementsByTagName("form").length == 0)) {
            b = b.replace(/lpcurrpage./g, "");
            b = "try{" + b + "}catch(e){}";
            var c = a.createElement("script"),
                d = a.createTextNode(b);
            c.appendChild(d);
            a.body && a.body.appendChild(c)
        }
    } catch (e) {}
}

function lpPrepareCustomJS(a, b, c, d, e, g) {
    if (d == "3") {
        if (a.indexOf("lpcurruser") != -1) {
            if (!g.getElementById("lpcurruserelt")) if (g.body) {
                var j = g.createElement("input");
                j.setAttribute("style", "display: none;");
                j.setAttribute("type", "text");
                j.setAttribute("id", "lpcurruserelt");
                j.setAttribute("value", "");
                g.body.appendChild(j)
            }
            if (g.getElementById("lpcurruserelt")) g.getElementById("lpcurruserelt").value = b
        }
        if (a.indexOf("lpcurrpass") != -1) {
            if (!g.getElementById("lpcurrpasselt")) if (g.body) {
                b = g.createElement("input");
                b.setAttribute("style", "display: none;");
                b.setAttribute("type", "password");
                b.setAttribute("id", "lpcurrpasselt");
                b.setAttribute("value", "");
                g.body.appendChild(b)
            }
            if (g.getElementById("lpcurrpasselt")) g.getElementById("lpcurrpasselt").value = c
        }
    }
    a = "if (typeof(lpcurruser) == 'undefined') lpcurruser = ''; if (document.getElementById('lpcurruserelt') && document.getElementById('lpcurruserelt').value != '') { lpcurruser = document.getElementById('lpcurruserelt').value; document.getElementById('lpcurruserelt').value = ''; } if (typeof(lpcurrpass) == 'undefined') lpcurrpass=''; if (document.getElementById('lpcurrpasselt') && document.getElementById('lpcurrpasselt').value != '') { lpcurrpass = document.getElementById('lpcurrpasselt').value; document.getElementById('lpcurrpasselt').value = ''; } var lploc=" + es(d) + ";" + (e == 1 ? "var lponlyfill=1;" : "var lponlyfill=null;") + a + "lpcurruser = ''; lpcurrpass = '';";
    a = a.replace(/lpcurrpage\./g, "");
    a = a.replace(/lpframe1\./g, "");
    a = a.replace(/lpframe2\./g, "");
    return a = a.replace(/lpframe3\./g, "")
}
function checkdomain(a, b) {
    for (var c = lp_gettld_url(a.location.href), d = b.split(","), e = 0; e < d.length; e++) if (d[e] == c) return true;
    return false
}
var firstfill = true;

function fillfield(a) {
    var b = a.docid ? g_fillreqdocs[a.docid] : document,
        c = typeof a.doconfirm != "undefined" ? a.doconfirm : false,
        d = typeof a.allowforce != "undefined" ? a.allowforce : 0,
        e = typeof a.aid != "undefined" ? a.aid : 0,
        g = typeof a.tabid != "undefined" ? a.tabid : 0,
        j = typeof a.custom_js != "undefined" ? a.custom_js : "",
        k = typeof a.manualfill != "undefined" ? a.manualfill : false,
        l = typeof a.username != "undefined" ? a.username : "",
        f = typeof a.password != "undefined" ? a.password : "",
        p = typeof a.onlyfill != "undefined" ? a.onlyfill : false;
    if (checkdomain(b, a.domains)) {
        if (firstfill) if (j != "") {
            run_custom_js(b, lpPrepareCustomJS(j, l, f, "1", p, b));
            run_custom_js(b, lpPrepareCustomJS(j, l, f, "2", p, b))
        }
        if (a.highlight == 0) lpdisableHighlightField = 1;
        if (j = LP_setval(b, a.name, a.value, a.checked, a.aid, a.formname, a.type, a.sharedsite, a.otherfield)) g_fillaid = e;
        if (firstfill) firstfill = false;
        c && sendBG({
            cmd: "fillfieldconfirm",
            manualfill: k,
            url: b.location.href,
            result: j,
            aid: e,
            docid: a.docid,
            tabid: g,
            allowforce: d
        })
    } else console_error("Not filling because tld mismatch between " + b.location.href + " and " + a.domains)
}
function fillbest(a) {
    var b = a.docid ? g_fillreqdocs[a.docid] : document;
    if (checkdomain(b, a.domains)) {
        if (a.highlight == 0) lpdisableHighlightField = 1;
        run_custom_js(b, typeof a.custom_js != "undefined" ? a.custom_js : "");
        LP_setval_bestmatch(b, a.username, a.password, a.aid, a.updatefields, a.sharedsite, a.addurid)
    } else console_error("Not filling because tld mismatch between " + b.location.href + " and " + a.domains)
}

function submit(a) {
    var b = a.docid ? g_fillreqdocs[a.docid] : document;
    LP_last_form != null && LP_doSubmit(b, LP_last_form, a.submit_id)
}
function fillform(a) {
    LP_to_formfill = eval("(" + a.toformfill + ")");
    translations = LPJSON.parse(a.translations);
    LP_form_fill()
}
function saveall() {
    var a = "";
    if (typeof document.location != "undefined") a = document.location.href;
    sendBG({
        cmd: "saveall",
        addsite: 1,
        url: a,
        formdata: LP_get_form_save_all()
    })
}

function LP_truncate_text_if(a) {
    if (typeof a == "string" && a.length > 45E3) a = a.substring(0, 45E3);
    return a
}
function LP_en(a) {
    return encodeURIComponent(a)
}
function LP_getname(a, b) {
    if (b && typeof a.id != "undefined" && a.id != "") return a.id;
    if (typeof a != "undefined" && a != null) if (typeof a.name == "string" && a.name != "") return a.name;
    else if (typeof a.id != "undefined") return a.id;
    return ""
}

function LP_getform_for_input(a, b) {
    for (var c = a.getElementsByTagName("form"), d = 0; d < c.length; d++) for (var e = c[d].elements, g = 0; g < e.length; g++) {
        var j = e[g];
        if (b == j) {
            if (LP_last_form != c[d] && (!LP_last_form || lpIsVisible(j))) LP_last_form = c[d];
            return c[d]
        }
    }
}

function LP_setval(a, b, c, d, e, g, j, k, l) {
    e = a.getElementsByTagName(j == "select-one" ? "select" : j == "textarea" ? "textarea" : "input");
    for (var f = false, p = false, o = 1; o <= 2; o++) {
        var h = 0,
            n = e.length - 1;
        if (o == 2) {
            n = -1;
            if (l && !f) {
                var s = b.match(/^(input|select|textarea)(\d+)$/);
                if (s) {
                    s = parseInt(s[2]);
                    if (e.length > s) h = n = s
                }
            }
        }
        for (h = h; h <= n; h++) {
            s = e[h];
            if (o == 2 || LP_getname(s) == b) if (!(o == 1 && g != "" && (typeof s.form == "undefined" || !s.form || LP_getname(s.form) != g))) {
                f = true;
                if ("password" == s.type || "text" == s.type || "email" == s.type || "textarea" == s.type || "select-one" == s.type) {
                    if (s.form && !lpCheckWarnInsecure(s.form, s.form.ownerDocument, false)) return false;
                    if (j == "password" && s.type != "password") return false;
                    if (k && j == "password") lpsharedpasswordfills[lpsharedpasswordfills.length] = s;
                    s.value = c;
                    lphighlightField(s);
                    LP_getform_for_input(a, s);
                    p = true
                } else if ("radio" == s.type) {
                    if (s.value == c) {
                        s.checked = d;
                        p = true
                    }
                } else if ("checkbox" == s.type) {
                    s.checked = d;
                    p = true
                }
            }
        }
    }
    return p
}

function LP_force(a, b) {
    for (var c = document.getElementsByTagName("form"), d = 0; d < c.length; d++) for (var e = c[d].elements, g = 0; g < e.length; g++) {
        var j = e[g];
        if ("password" == j.type && "password" == a || "text" == j.type && "text" == a || "email" == j.type && "email" == a) {
            j.value = b;
            LP_last_form = c[d];
            return c[d]
        }
    }
}

function LP_setval_bestmatch(a, b, c, d, e, g, j) {
    for (var k = null, l = 0, f = null, p = null, o = a.getElementsByTagName("form"), h = 0; h < o.length; h++) {
        for (var n = o[h].elements, s = 0, u = 0, t = null, y = null, J = 0; J < n.length; J++) {
            var G = n[J];
            if ("text" == G.type || "email" == G.type) {
                if (s == 0) t = LP_getname(G);
                s++
            }
            if (G.type == "password") {
                if (u == 0) y = LP_getname(G);
                u++
            }
        }
        if (u == 1) if (!k || s == 1 && l != 1) {
            l = s;
            k = o[h];
            f = t;
            p = y
        }
    }
    if (k) {
        f && LP_setval(a, f, b, 0, d, LP_getname(k), "", g);
        LP_setval(a, p, c, 0, d, LP_getname(k), "", g);
        if (e) a.LPlpsaveforminfo = d;
        else if (j) a.LPlpsaveforminfoaddurid = d
    }
}

function lpCheckWarnInsecure(a, b, c) {
    if (a) {
        if (!c && typeof lpdontfillautocompleteoff != "undefined" && lpdontfillautocompleteoff) if (a.getAttribute("autocomplete") == "off") return null;
        if (typeof lpwarninsecureforms != "undefined" && lpwarninsecureforms) if (a.method && a.method.toUpperCase() == "GET" || typeof a.action == "string" && a.action.indexOf("mailto:") == 0) if (c) {
            if (!confirm(gs("LastPass detected a login form that is insecure.\n\nWould you like to continue?"))) return null
        } else if (typeof b.m_warnedUserThisPage == "undefined") if (confirm(gs("LastPass detected a login form that is insecure.\n\nWould you still like LastPass to fill the form?"))) b.m_warnedUserThisPage = 1;
        else {
            b.m_warnedUserThisPage = 2;
            return null
        } else if (b.m_warnedUserThisPage == 2) return null
    }
    return a
}

function lphighlightField(a, b) {
    if (!(typeof lpdisableHighlightField != "undefined" && lpdisableHighlightField)) if (!(a.type != "text" && a.type != "password" && a.type != "email")) {
        var c = false;
        if (typeof b == "undefined") c = b = true;
        var d = a.style.width.replace(/px/, "");
        if (d == "") try {
            var e = a.ownerDocument.defaultView.getComputedStyle(a, "");
            d = e.width.replace(/px/, "")
        } catch (g) {}
        if (!(d > 0 && d < 30)) {
            d = a.style.backgroundImage;
            if (d == "") try {
                e = a.ownerDocument.defaultView.getComputedStyle(a, "");
                d = e.backgroundImage
            } catch (j) {}
            if (d == "none") d = "";
            if (d == "") a.style.backgroundImage = b ? "url(data:image/gif;base64,R0lGODlhEAAQAPZVADsBAkECBFEGCmQDBGoEB3UIDWcOEn0dHnZGRnhBQntbXIILEoIMEoENFI8QGI0UHJMQGKERGqURGq4QGIsaIZ4fJq8WI68YJrQXJLIZJbgZJ7gZKLwcK74dLa4gKq4iLLUgLaApMLwpNrwsOKUzOcAfL8EhMcUjM8YkNMgoOJw+QKY8QtA5Sdo/T6dARa5FS6tOUr9MUqRRVrRVWY9pa5BmaZBqbMRKVNlRYclud/14iLyIiKuoqNGbneyPmfOAkPeElNGvsNO3t+aorfGjq+y/w8zMzNXU1N3S0t7W1t3a2uLR0e3U1vLd4OLh4ejo6Png4/bx8ff09Pr5+f7+/v///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAFYALAAAAAAQABAAAAfEgFaCVlCFhoWDgzk6QD+Oj0A6OYMyLSwdJR2amywtMoITKZgbFRsYIRqaKROCEpgZO1IkMFM7GJgSghGZKEVVQktVQyclJRG6JR8uM1NVVVEvKx7GyDHO11VUVTHUVgEECUlIR+RHSUoJBAGCAAMHKgpO8koIKgcDAIICCwwGRk89gjzhUYABAwGCGly4IIIIkxE3mvgAkeFCA0EPMBQ7gcNEio7FMDwQVAOCBQ6bNnGwAKHGIBoUHMicKZOCjUQ4cw4KBAA7)" : "";
            else c = false;
            e = a.offsetWidth;
            if (d == "") {
                a.style.paddingRight = b ? "18px" : "0px";
                a.style.backgroundRepeat = "no-repeat";
                a.style.backgroundAttachment = "scroll";
                a.style.backgroundPosition = "center right"
            }
            a.style.border = "1px solid #c01f2f";
            if (e > 0) {
                a.style.width = e + "px";
                a.style.width = 2 * e - a.offsetWidth + "px"
            }
            if (c && e > 0 && e < 54) {
                a.addEventListener("focus", function() {
                    lphighlightField(a, false)
                }, false);
                a.addEventListener("blur", function() {
                    lphighlightField(a, true)
                }, false)
            }
        }
    }
}

function LP_fireEvent(a, b, c) {
    c || (c = "HTMLEvents");
    if (document.createEventObject) {
        c = document.createEventObject();
        return a.fireEvent("on" + b, c)
    } else {
        c = document.createEvent(c);
        c.initEvent(b, true, true);
        return !a.dispatchEvent(c)
    }
}

function LP_doSubmit(a, b, c) {
    var d = 0;
    if (c != "") {
        var e = a.getElementById(c);
        if (!e) {
            var g = a.getElementsByName(c);
            if (g && g.length > 0) e = g[0]
        }
        if (!e) if (g = a.getElementsByTagName("INPUT")) for (var j = 0; j < g.length; j++) if (g[j].value == c) e = g[j];
        if (!e) if (g = a.getElementsByTagName("A")) for (j = 0; j < g.length; j++) if (g[j].href == c) e = g[j];
        if (e) {
            LP_fireEvent(e, "click", "MouseEvents");
            d = 1
        }
    }
    d || (d = LP_InputClickToSubmit(a, b, "submit"));
    d || (d = LP_InputClickToSubmit(a, b, "image"));
    d || (d = LP_InputClickToSubmit(a, b, "button"));
    if (!d) {
        if (lp_gettld_url(a.location.href) != "bankofamerica.com") {
            try {
                LP_fireEvent(b, "submit")
            } catch (k) {}
            try {
                b.submit()
            } catch (l) {
                return l.toString()
            }
        }
        b = null;
        if (g = a.getElementsByTagName("INPUT")) for (j = 0; j < g.length; j++) if (g[j].type == "password") b = g[j];
        if (b) {
            b.focus();
            a.createEvent("KeyboardEvent").initKeyboardEvent("keypress", true, true, lpgettop(), "Enter", 0, false, false, false, false)
        }
    }
}

function LP_get_form_save_all() {
    for (var a = "", b = document.getElementsByTagName("form"), c = [""], d = 0; d < b.length; d++) a += LP_get_form_save(b[d], true, c);
    b = "";
    for (var e = ["input", "select", "textarea"], g = 0; g < e.length; g++) {
        var j = document.getElementsByTagName(e[g]);
        for (d = 0; d < j.length; d++) if (j[d].form == null || lp_in_array(LP_getname(j[d]), c)) {
            var k = lp_in_array(LP_getname(j[d]), c) ? e[g] + d : null;
            b += LP_get_field_text("", j[d], {}, {}, false, k)
        }
    }
    if (b != "") {
        b += "0\taction\t\taction\n";
        b += "0\tmethod\t\tmethod\n";
        a += b
    }
    return a
}

function LP_get_form_save(a, b, c) {
    var d = "",
        e = {};
    e.value = 0;
    var g = a.elements,
        j = {};
    j.value = false;
    var k = [],
        l = [],
        f = [],
        p = [];
    if (b) for (var o = 0; o < g.length; o++) {
        if (typeof k[g[o].name] != "undefined") f[g[o].name] = true;
        k[g[o].name] = true;
        if (typeof l[g[o].id] != "undefined") p[g[o].id] = true;
        l[g[o].id] = true
    }
    for (o = 0; o < g.length; o++) {
        if (b) {
            k = LP_getname(g[o]);
            if (k == "" || typeof f[k] != "undefined" && typeof p[k] != "undefined") {
                c[c.length] = k;
                continue
            }
        }
        d += LP_get_field_text(LP_getname(a), g[o], e, j, b)
    }
    if (j.value && !lpCheckWarnInsecure(a, a.ownerDocument, true)) return null;
    d += "0\taction\t" + LP_en(a.action) + "\taction\n";
    d += "0\tmethod\t" + LP_en(a.method) + "\tmethod\n";
    if (e.value) return d;
    return ""
}

function LP_get_field_text(a, b, c, d, e, g) {
    var j = "";
    g = g ? g : LP_getname(b);
    var k = b.type,
        l = LP_truncate_text_if(b.value);
    if (e && l == "" && b.name && b.name != "") for (var f = document.getElementsByName(b.name), p = 0; p < f.length; p++) if (LP_getname(f[p].form) == a && LP_getname(f[p]) == g && f[p].type == k && f[p].value != "") return "";
    if (k == "password") d.value = true;
    if ("password" == k || "text" == k || "email" == k || "textarea" == k || "hidden" == k) {
        if ("hidden" != k) c.value = 1;
        if (!e && lpsavedform == b.form) for (c = 0; c < lpsavedformfields.length; c++) if (lpsavedformfields[c].name == LP_getname(b)) {
            if (lpsavedformfields[c].value != l) if (l == "" || l.match(/^\*+$/)) l = lpsavedformfields[c].value;
            else if (l.length == lpsavedformfields[c].value.length) {
                d = true;
                for (p = 0; p < l.length; p++) if (l.charAt(p) != lpsavedformfields[c].value.charAt(p) && l.charAt(p) != "*") {
                    d = false;
                    break
                }
                if (d) l = lpsavedformfields[c].value
            }
            break
        }
        if (k == "password") for (c = 0; c < lpsharedpasswordfills.length; c++) if (lpsharedpasswordfills[c] == b) {
            l = "";
            break
        }
        j += a + "\t" + LP_en(g) + "\t" + LP_en(l) + "\t" + LP_en(k) + "\n"
    } else if ("checkbox" == k || "radio" == k) {
        l += b.checked ? "-1" : "-0";
        j += a + "\t" + LP_en(g) + "\t" + LP_en(l) + "\t" + LP_en(k) + "\n"
    } else if ("select-one" == k || "dropdown" == k || "select-multiple" == k) {
        if (k == "select-multiple") {
            p = l = "";
            for (c = 0; c < b.options.length; c++) if (b.options[c].selected) {
                l += p + LP_en(iel.options[c].value);
                p = "|"
            }
        } else l = b.selectedIndex < 0 || b.selectedIndex >= b.options.length || typeof b.options[b.selectedIndex] == "undefined" ? "" : b.options[b.selectedIndex].value;
        j += a + "\t" + LP_en(g) + "\t" + LP_en(l) + "\t" + LP_en(k) + "\n"
    } else if ("image" == k) {
        l = b.src;
        j += a + "\t" + LP_en(g) + "\t" + LP_en(l) + "\t" + LP_en(k) + "\n"
    }
    return j
}
function evaluntilfindmanual() {
    if (!g_foundmanual) {
        var a = lpgettop().document;
        hookAllFormSubmits(a);
        try {
            for (var b = 0; a.frames && b < a.frames.length; b++) hookAllFormSubmits(a.frames[b].document)
        } catch (c) {}
        lpgettop().setTimeout(function() {
            evaluntilfindmanual()
        }, 500)
    }
}

function lpfieldchange(a) {
    a = a ? a.target : this;
    if (a.form) {
        lpsavedform = a.form;
        if (LP_getname(a) != "" && ("text" == a.type || "email" == a.type || "password" == a.type)) {
            for (var b = false, c = 0; c < lpsavedformfields.length; c++) if (lpsavedformfields[c].formname == LP_getname(lpsavedform) && lpsavedformfields[c].name == LP_getname(a)) {
                lpsavedformfields[c].value = a.value;
                b = true;
                break
            }
            if (!b) {
                b = {};
                b.name = LP_getname(a);
                b.type = a.type;
                b.value = a.value;
                b.formname = LP_getname(lpsavedform);
                lpsavedformfields[lpsavedformfields.length] = b
            }
        }
    }
}

function addStyle() {
    var a = document.createElement("style");
    a.type = "text/css";
    var b = document.createTextNode(" #lastpass-notification { height: 13px;padding: 7px 10px;text-align: left;position: relative;font-family: Arial,Helvetica,Garuda,sans-serif;;font-size: 11px;z-index: 1000000099;color: black;vertical-align: top; float: none;} #lastpass-content {display: inline;  padding-left: 5px;vertical-align: top;text-align: left; " + (g_isopera ? "float: left; min-width: 0px;" : "float: none; width: 100%;") + ' font-family: Arial,Helvetica,Garuda,sans-serif;;font-size: 11px;} .lppopup {position: absolute;border: 1px solid black;z-index: 99999;background: #fff;overflow: auto;x: 0px;y: 0px;width: 300px;height: 200px;display: none;} .lppopup table {float:none; display:table; margin: 0px; padding: 0px; border-spacing: 1px;} .lppopup tr:hover {background-color: #c9cdec;} .lppopup tr {background-color: #fff; height: 22px;} .lppopup td {font-size: 11px;font-family: Arial,Helvetica,Garuda,sans-serif;color: black;cursor: default;} .lpbutton,#lastpass-notification button[type="button"] {background:transparent; text-indent:0px; height:22px; border-width: 1px;font-size: 11px;font-family: Arial,Helvetica,Garuda,sans-serif;float: right; margin: -4px 5px 2px 2px; padding: 2px 5px; border: outset 2px;color: black !important;background-color: #f0f0f0; border-radius: 0px; width:auto;} .lpbutton:hover {background-color: #e4e6f8;} #lastpass-notification img {margin: 0px 0px 0px 0px;padding: 0px 0px 0px 0px;} ');
    a.appendChild(b);
    document.head ? document.head.appendChild(a) : document.body.appendChild(a)
}

function lpshownotification(a, b) {
    try {
        if (!document.getElementById("lastpass-notification")) if (window == lpgettop()) {
            var c = document.body;
            if (c) if (!(typeof b.docnum != "undefined" && g_docnum != b.docnum)) {
                var d = true;
                if (a == "fill") {
                    if (checkForLoginForm(document)) {
                        var e = getAutoFillArray(LPJSON.parse(b.sites));
                        if (getcount(e) == 1) for (var g in e) {
                            d = typeof e[g].fields == "undefined" || getcount(e[g].fields) == 0 || !canFindForm(e[g].fields) || !g_fillaid;
                            break
                        }
                    } else d = false;
                    if (g_fillaid == null) b.text = gs("Simplify your life: Use LastPass to autofill in this site's login info!")
                }
                if (d) {
                    addStyle();
                    run_custom_js(document, showMenuScript());
                    var j = document.createElement("div");
                    j.id = "lastpass-notification";
                    j.style.background = "url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAbCAIAAAAoBpKtAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTFGMTM4RkQ1NzlFMTFERjlBODlDOUVCQTI0NEFFMDgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTFGMTM4RkU1NzlFMTFERjlBODlDOUVCQTI0NEFFMDgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1MUYxMzhGQjU3OUUxMURGOUE4OUM5RUJBMjQ0QUUwOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1MUYxMzhGQzU3OUUxMURGOUE4OUM5RUJBMjQ0QUUwOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoGckHoAAABdSURBVHjarNLRCYAwDEXRFN1/mq7gAu7gBIJQTF66wv14/T7cJNCxnhngnce6kRvvhVzkx5ySuSpvT6zXdC50LdpLuJ+8+5nvdbsu+l/k7Yn2fm8PuuiAc5HbAgwAGOw78UxnUzUAAAAASUVORK5CYII=')";
                    j.style.backgroundRepeat = "repeat-x";
                    var k = window.getComputedStyle(c, null);
                    j.style.marginLeft = -1 * (parseInt(k.getPropertyValue("margin-left")) + parseInt(k.getPropertyValue("padding-left")) + parseInt(k.getPropertyValue("border-left-width"))) + "px";
                    j.style.marginRight = -1 * (parseInt(k.getPropertyValue("margin-right")) + parseInt(k.getPropertyValue("padding-right")) + parseInt(k.getPropertyValue("border-right-width"))) + "px";
                    j.style.marginTop = -1 * (parseInt(k.getPropertyValue("margin-top")) + parseInt(k.getPropertyValue("padding-top")) + parseInt(k.getPropertyValue("border-top-width"))) + "px";
                    d = g_isopera ? "float:left;" : "";
                    j.innerHTML = '<img width="16" height="16" style="width:16px;height:16px;display:inline;' + d + '" src="data:image/gif;base64,R0lGODlhEAAQAPZVADsBAkECBFEGCmQDBGoEB3UIDWcOEn0dHnZGRnhBQntbXIILEoIMEoENFI8QGI0UHJMQGKERGqURGq4QGIsaIZ4fJq8WI68YJrQXJLIZJbgZJ7gZKLwcK74dLa4gKq4iLLUgLaApMLwpNrwsOKUzOcAfL8EhMcUjM8YkNMgoOJw+QKY8QtA5Sdo/T6dARa5FS6tOUr9MUqRRVrRVWY9pa5BmaZBqbMRKVNlRYclud/14iLyIiKuoqNGbneyPmfOAkPeElNGvsNO3t+aorfGjq+y/w8zMzNXU1N3S0t7W1t3a2uLR0e3U1vLd4OLh4ejo6Png4/bx8ff09Pr5+f7+/v///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAFYALAAAAAAQABAAAAfEgFaCVlCFhoWDgzk6QD+Oj0A6OYMyLSwdJR2amywtMoITKZgbFRsYIRqaKROCEpgZO1IkMFM7GJgSghGZKEVVQktVQyclJRG6JR8uM1NVVVEvKx7GyDHO11VUVTHUVgEECUlIR+RHSUoJBAGCAAMHKgpO8koIKgcDAIICCwwGRk89gjzhUYABAwGCGly4IIIIkxE3mvgAkeFCA0EPMBQ7gcNEio7FMDwQVAOCBQ6bNnGwAKHGIBoUHMicKZOCjUQ4cw4KBAA7"/>';
                    if (typeof b.icon != "undefined") j.innerHTML = '<img style="display:inline;' + d + '" src="' + b.icon + '"/>';
                    j.innerHTML += '<div id="lastpass-content">' + b.text + "</div>";
                    j.innerHTML += '<img width="16" height="16" lptype="close" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Qzc0REJCN0E1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Qzc0REJCN0I1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNzREQkI3ODU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNzREQkI3OTU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pi85GUUAAAHnSURBVHjalFPdShtBFP72pybZJl0RU9HGJEv8i0pCLV4Ug1BKKYFS6G0v+gw+Qh/BZ+gjVFBRg2KQoCCC0i25sBHFi1YQmri7cZPd7ZkhGxqEmBz4ODPnnPn4zpkZYen9R7QsTHhN0NDdLglHhFu2kVvBacJGMpHU1Gdq19PVWhWVi8oNLfOEY59gdTm3rGUzWfRi+k89WtgtfKPlnE+Q05IaLMvqiYDVBoPB2Xq9HvUJwrZtg0EQBLwYGcL171t4nseTA09kxMeGUbn6A8d1eUwUReZCos9qmAbHaFTFq0wak4kRUmSi2bSRTsUwO5XC0KDSrvPJ5TaBYXD/o/wLg5GnmJlMwXU9KKEA4rExnJzqPOfbAwLTNNvJ7eIhq8DiQhaO46BYOkLp+KxjDp7bhUAJBSGIAhqNBu9VItDASJH7uAJFCSH/ZgmJ8Rj2iiWoagTZ+TRXsr6z3x6i67mdBHfGHff5tzkkE+Nc9trWLgKBAXz+9AEvM3P4W61ivbDfoUCKT7BHiK+iIHLJ5xeXNGUT3zd3+N6y6jjVy4iEFWzvHRBJjcfZlRPJqtD6CzVZksPow5pOk7nnfgule/v+HeuzF2ODlWW5TMsb/yGtSJJUab2uXg6zz/Tl/yHqhAwl+v7O/wQYADmm0h9caEy1AAAAAElFTkSuQmCC" onmouseover="this.src=\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Qzc0REJCNzY1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Qzc0REJCNzc1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNzREQkI3NDU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNzREQkI3NTU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PtBSHX0AAAJSSURBVHjalFNNaBNBFP5m/5JstkZL2sYkBVNaShV66C1QPKiIVg96Lnjx4FUQBCl4FUGwxYsHPVi8WEQPFYKCYFAoNAhFQehB0ChJMZA1iWST7GbHN5vdpK1QcOBjeG/e9+33Zt+wp0cQLIOQJWRw8CoSNglVESh+cpqQi8eMjB7SAMbARJb5p9zfOIfVtlGpNSoUnid8DASWZ46lMxOpMUiyBCaxHnwFweeuS+BwaS+WKyOfvxZXKX0iEJgfTyWAUIg8yUTuiQgnnhH6MogsRNDtIp1OYrtYOt6xnREp6F+OREkgDK4bMOfPgUeHgLDuoTs8il8XFuEaMTAtAmhhSJIseBGlfzUa9a6qHlk5exnlVAZH376ES6I/FxYxNDmNet3EoUIexO676wtwSQWXNcS2NrEzPgljLouSosEhJ8bEFDob7xD/VIAraVQ7+CUDAVIUYHYbidwadsjiWPYktdxFPf8G8fc5v0ZcKvtXgBU+UJpDIvDDw+BnLsG2bXIrwa2ZYPnXgEOxV0UCdmevQIsgnAlydWkZ0ZlZ/H6+im4iDf30RZSIFFu5TSIO3MFoDAQsyJ4x6+pN6ERurj9D5OFdKHoUjVv3YJxaQJWchB/d783FfgEHqrfLjx+g+eM7lLUn6IDmokknd5bw59oNKOsvYPt1wZgy/y005pJJQwpGePcYY984++FWuQzHdUeDH7JRtSwaQhmKovQgq3vRzyswWy1B3iZeJWjh+jfTfFVrtTIhVT3IANq2A9Nqisd0ZfcdfCHMmpaVhWX913P+K8AAt/3RI0KZhqwAAAAASUVORK5CYII=\'" onmouseout="this.src=\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Qzc0REJCN0E1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Qzc0REJCN0I1Nzk4MTFERjlBODlDOUVCQTI0NEFFMDgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNzREQkI3ODU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNzREQkI3OTU3OTgxMURGOUE4OUM5RUJBMjQ0QUUwOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pi85GUUAAAHnSURBVHjalFPdShtBFP72pybZJl0RU9HGJEv8i0pCLV4Ug1BKKYFS6G0v+gw+Qh/BZ+gjVFBRg2KQoCCC0i25sBHFi1YQmri7cZPd7ZkhGxqEmBz4ODPnnPn4zpkZYen9R7QsTHhN0NDdLglHhFu2kVvBacJGMpHU1Gdq19PVWhWVi8oNLfOEY59gdTm3rGUzWfRi+k89WtgtfKPlnE+Q05IaLMvqiYDVBoPB2Xq9HvUJwrZtg0EQBLwYGcL171t4nseTA09kxMeGUbn6A8d1eUwUReZCos9qmAbHaFTFq0wak4kRUmSi2bSRTsUwO5XC0KDSrvPJ5TaBYXD/o/wLg5GnmJlMwXU9KKEA4rExnJzqPOfbAwLTNNvJ7eIhq8DiQhaO46BYOkLp+KxjDp7bhUAJBSGIAhqNBu9VItDASJH7uAJFCSH/ZgmJ8Rj2iiWoagTZ+TRXsr6z3x6i67mdBHfGHff5tzkkE+Nc9trWLgKBAXz+9AEvM3P4W61ivbDfoUCKT7BHiK+iIHLJ5xeXNGUT3zd3+N6y6jjVy4iEFWzvHRBJjcfZlRPJqtD6CzVZksPow5pOk7nnfgule/v+HeuzF2ODlWW5TMsb/yGtSJJUab2uXg6zz/Tl/yHqhAwl+v7O/wQYADmm0h9caEy1AAAAAElFTkSuQmCC\'" style="width:16px;height:16px;float: right; margin-right: 10px; margin-bottom: -10px;" onclick="this.dispatchEvent(lpcustomEvent); document.getElementById(\'lastpass-notification\').style.display=\'none\'"/> ';
                    if (a == "fill") j.innerHTML += createFillMenus(b);
                    else if (a == "add") {
                        j.innerHTML += createAddButtons(b);
                        j.style.background = "#87d087"
                    } else if (a == "generate") j.innerHTML += createGenerateButtons(b);
                    else if (a != "formfill") if (a == "change") j.innerHTML += createChangeButtons(b);
                    else if (a == "error") {
                        j.innerHTML += createErrorButtons(b);
                        if (typeof b.yellow == "undefined" || !b.yellow) j.style.background = "#ff0000"
                    } else if (a == "basicauth") j.innerHTML += createBasicAuthButtons(b);
                    run_custom_js(document, "document.addEventListener('mouseup', function(e){ if(typeof(closelpmenus)=='function'){closelpmenus();}}, false)");
                    c.insertBefore(j, c.firstChild);
                    curr_notification_type = a
                } else sendBG({
                    cmd: "checkgenpwfillforms",
                    url: document.location.href
                })
            }
        }
    } catch (l) {
        console_log(l)
    }
}
function lpclosenotification() {
    if (document.getElementById("lastpass-notification") && curr_notification_type != "error") {
        document.body.removeChild(document.getElementById("lastpass-notification"));
        curr_notification_type = ""
    }
}

function sitesMatchTLD(a) {
    var b = lp_gettld_url(document.location.href),
        c;
    for (c in a) if (b == lp_gettld_url(a[c].url)) return true;
    return false
}

function createFillMenus(a) {
    var b = "";
    a = getAutoFillArray(LPJSON.parse(a.sites));
    var c = getcount(a),
        d = getAutoLoginArray(a),
        e = getcount(d);
    b += "<button type='button' id='lpnever' class='lpbutton' value='" + gs("Never...") + "' onclick='lpshowmenudiv(\"never\");return false;'>" + gs("Never...") + "</button>";
    if (c == 1) for (var g in a) b += "<button lptype='autofillsingle' aid=\"" + a[g].aid + "\" type='button' id='lpautofill' class='lpbutton' value='" + gs("AutoFill") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("AutoFill") + "</button>";
    else b += "<button type='button' id='lpautofill' class='lpbutton' value='" + gs("AutoFill") + " (" + c + ")' onclick='lpshowmenudiv(\"autofill\")'>" + gs("AutoFill") + " (" + c + ")</button>";
    if (1 == e) for (g in d) b += "<button lptype='autologinsingle' aid=\"" + d[g].aid + "\" type='button' id='lpautologin' class='lpbutton' value='" + gs("AutoLogin") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("AutoLogin") + "</button>";
    else if (e > 0) b += "<button type='button' id='lpautologin' class='lpbutton' value='" + gs("AutoLogin") + " (" + e + ")' onclick='lpshowmenudiv(\"autologin\")'>" + gs("AutoLogin") + " (" + e + ")</button>";
    if (e > 0) b += createMenu("autologin", d, e);
    b += createMenu("autofill", a, c);
    b += createNeverMenu(g_fillaid != null);
    document.addEventListener("lpCustomEventMenu", function(j) {
        var k = j.srcElement.getAttribute("lptype");
        if (k == "autologin") {
            sendBG({
                cmd: "autologinaid",
                aid: j.srcElement.getAttribute("aid")
            });
            document.getElementById("lppopupautologin").style.display = "none"
        } else if (k == "autologinsingle") {
            sendBG({
                cmd: "autologinaid",
                aid: j.srcElement.getAttribute("aid")
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else if (k == "autofill") {
            sendBG({
                cmd: "autofillaid",
                aid: j.srcElement.getAttribute("aid")
            });
            document.getElementById("lppopupautofill").style.display = "none"
        } else if (k == "autofillsingle") {
            sendBG({
                cmd: "autofillaid",
                aid: j.srcElement.getAttribute("aid")
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else if (k == "neverautofill" || k == "neverpage" || k == "neverdomain") {
            sendBG({
                cmd: k,
                url: document.location.href,
                aid: g_fillaid
            });
            document.getElementById("lppopupnever").style.display = "none";
            document.getElementById("lastpass-notification").style.display = "none"
        }
    }, false);
    return b
}

function createAddButtons(a) {
    var b = "";
    b += "<button type='button' lptype='notnow' id='lpnotnow' class='lpbutton' value='" + gs("Not Now") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Not Now") + "</button>";
    b += "<button type='button' id='lpnever' class='lpbutton' value='" + gs("Never...") + "' onclick='lpshowmenudiv(\"never\");'>" + gs("Never...") + "</button>";
    b += "<button type='button' lptype='addsite' id='lpaddsite' class='lpbutton' value='" + gs("Save Site") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Save Site") + "</button>";
    b += createNeverMenu();
    document.addEventListener("lpCustomEventMenu", function(c) {
        c = c.srcElement.getAttribute("lptype");
        if (c == "addsite") {
            sendBG({
                cmd: "savethesite",
                notificationdata: a.notificationdata
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else if (c == "notnow") {
            sendBG({
                cmd: "notnow",
                notificationdata: a.notificationdata,
                tld: lp_gettld_url(document.location.href)
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else if (c == "close") sendBG({
            cmd: "clearnotification"
        });
        else if (c == "neverpage" || c == "neverdomain") {
            sendBG({
                cmd: c,
                url: a.notificationdata.url,
                fromsave: "1",
                notificationdata: a.notificationdata,
                tld: lp_gettld_url(document.location.href)
            });
            document.getElementById("lppopupnever").style.display = "none";
            document.getElementById("lastpass-notification").style.display = "none"
        }
    }, false);
    return b
}

function createChangeButtons(a) {
    var b = "";
    b += "<button type='button' lptype='savenewsite' id='lpsavenewsite' class='lpbutton' value='" + gs("Save New Site") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Save New Site") + "</button>";
    b += "<button type='button' lptype='confirm' id='lpconfirm' class='lpbutton' value='" + gs("Confirm") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Confirm") + "</button>";
    document.addEventListener("lpCustomEventMenu", function(c) {
        c = c.srcElement.getAttribute("lptype");
        if (c == "savenewsite") {
            sendBG({
                cmd: "savethesite",
                notificationdata: a.notificationdata
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else if (c == "confirm") {
            sendBG({
                cmd: "changepw",
                notificationdata: a.notificationdata
            });
            document.getElementById("lastpass-notification").style.display = "none"
        } else c == "close" && sendBG({
            cmd: "clearnotification"
        })
    }, false);
    return b
}

function createErrorButtons(a) {
    var b = "";
    if (a.notificationdata.multifactor_disable_url) b += "<button type='button' lptype='disablebtn' id='lpdisablebtn' class='lpbutton' value='" + gs("Disable Multifactor Authentication") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Disable Multifactor Authentication") + "</button>";
    if (a.notificationdata.showCreateAccount) b += "<button type='button' lptype='createaccountbtn' id='lpcreateaccountbtn' class='lpbutton' value='" + gs("Create Account") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Create Account") + "</button>";
    if (a.notificationdata.showLogin) b += "<button type='button' lptype='tryagainbtn' id='lptryagainbtn' class='lpbutton' value='" + gs("Try Again") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Try Again") + "</button>";
    if (a.notificationdata.showFeedback) b += "<button type='button' lptype='feedbackbtn' id='lpfeedbackbtn' class='lpbutton' value='" + gs("Feedback") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Feedback") + "</button>";
    document.addEventListener("lpCustomEventMenu", function(c) {
        c = c.srcElement.getAttribute("lptype");
        sendBG({
            cmd: c,
            notificationdata: a.notificationdata
        });
        document.getElementById("lastpass-notification").style.display = "none"
    }, false);
    return b
}

function createBasicAuthButtons(a) {
    var b = "";
    b += "<button type='button' lptype='basicauthneverbtn' id='lpbasicauthneverbtn' class='lpbutton' value='" + gs("Never Show Again") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Never Show Again") + "</button>";
    var c = a.needbinary == 1 ? gs("Install") : gs("More Information");
    b += "<button type='button' lptype='basicauthmoreinfobtn' id='lpbasicauthmoreinfobtn' class='lpbutton' value='" + c + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + c + "</button>";
    document.addEventListener("lpCustomEventMenu", function(d) {
        d = d.srcElement.getAttribute("lptype");
        sendBG({
            cmd: d,
            notificationdata: a.notificationdata
        });
        document.getElementById("lastpass-notification").style.display = "none"
    }, false);
    return b
}

function createGenerateButtons() {
    var a = "";
    a += "<button type='button' id='lpnever' class='lpbutton' value='" + gs("Never...") + "' onclick='lpshowmenudiv(\"never\");'>" + gs("Never...") + "</button>";
    a += createNeverMenu();
    a += "<button type='button' lptype='generate' id='lpgenerate' class='lpbutton' value='" + gs("Generate") + "' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Generate") + "</button>";
    createGenerateFormFillListener();
    return a
}

function createFormFillButtons() {
    var a = "";
    a = "";
    a += "<button type='button' id='lpnever' class='lpbutton' value='" + gs("Never...") + "' onclick='lpshowmenudiv(\"never\");'>" + gs("Never...") + "</button>";
    a += createNeverMenu();
    if (alwayschooseprofilecc) a += "<button type='button' lptype='chooseprofilecc' id='lpchooseprofilecc' class='lpbutton' value='" + gs("Fill Form") + " (" + getcount(g_formfills) + ")' onclick='this.dispatchEvent(lpcustomEvent);'>" + gs("Fill Form") + " (" + getcount(g_formfills) + ")</button>";
    else {
        a += "<button type='button' id='lpfillform' class='lpbutton' value='" + gs("Fill Form") + " (" + getcount(g_formfills) + ")' onclick='lpshowmenudiv(\"fillform\");'>" + gs("Fill Form") + " (" + getcount(g_formfills) + ")</button>";
        a += createMenu("fillform", g_formfills, getcount(g_formfills))
    }
    createGenerateFormFillListener();
    return a
}

function createGenerateFormFillListener() {
    document.addEventListener("lpCustomEventMenu", function(a) {
        a = a.srcElement.getAttribute("lptype");
        if (a != "fillform") if (a != "addprofile") if (a == "addcreditcard") {
            sendBG({
                cmd: "addcreditcard"
            });
            document.getElementById("lppopupfillform").style.display = "none"
        } else if (a == "clearforms") {
            sendBG({
                cmd: "clearforms"
            });
            document.getElementById("lppopupfillform").style.display = "none"
        } else if (a != "chooseprofilecc") if (a != "fillcurrent") if (a == "generate") {
            sendBG({
                cmd: "generate"
            });
            if (!document.getElementById("lppopupfillform") && !document.getElementById("lppopupfillcurrent")) document.getElementById("lastpass-notification").style.display = "none"
        } else if (a == "neverpage" || a == "neverdomain") {
            a = {
                cmd: a,
                url: document.location.href
            };
            if (document.getElementById("lpgenerate")) a.fromgenerate = 1;
            else a.fromformfill = 1;
            sendBG(a);
            document.getElementById("lppopupnever").style.display = "none";
            document.getElementById("lastpass-notification").style.display = "none"
        }
    }, false)
}

function getAutoFillArray(a) {
    var b = [];
    lpcanonizeUrl(document.location.href);
    for (var c in a) a[c].genpw || (b[c] = a[c]);
    return b
}
function getAutoLoginArray(a) {
    var b = [],
        c;
    for (c in a) typeof a[c].fields == "undefined" || getcount(a[c].fields) == 0 || !canFindForm(a[c].fields) || (b[c] = a[c]);
    return b
}

function canFindForm(a) {
    for (var b = document.getElementsByTagName("form"), c = 0; c < b.length; c++) {
        var d = [],
            e;
        for (e in a) if ("text" == a[e].type || "password" == a[e].type || "email" == a[e].type) d[a[e].type + a[e].name] = 0;
        var g = false,
            j = b[c].elements,
            k = [];
        for (e = 0; e < j.length; e++) {
            var l = j[e];
            if ("text" == l.type || "email" == l.type || "password" == l.type) {
                if (typeof d[l.type + l.name] != "undefined") d[l.type + l.name] = 1;
                if (l.type == "password") g = true;
                k[l.type + l.name] = 0
            }
        }
        for (e in a) if ("text" == a[e].type || "password" == a[e].type || "email" == a[e].type) if (typeof k[a[e].type + a[e].name] != "undefined") k[a[e].type + a[e].name] = 1;
        if (g) {
            g = true;
            for (e in d) if (d[e] == 0) {
                g = false;
                break
            }
            d = true;
            for (e in k) if (k[e] == 0) {
                d = false;
                break
            }
            if (g || d) return true
        }
    }
    return false
}

function createMenu(a, b, c) {
    var d = "",
        e = "",
        g = false,
        j = false,
        k = c;
    if (a == "fillform") {
        c > 0 && k++;
        k += 3;
        for (var l in g_formfills) {
            if (g_formfills[l].profiletype == 0) g = true;
            if (g_formfills[l].ccnum != "") j = true
        }
        g && j && k++
    }
    if (k < 12) e = " style='height:" + k * 24 + "px'";
    d += "<div id='lppopup" + a + "' class='lppopup' " + e + "><table width='100%'>";
    for (l in b) {
        e = "";
        if (a != "fillform" && b[l].useusername != "") e = " (" + b[l].useusername + ")";
        k = a == "fillform" ? "ffid" : "aid";
        d += "<tr lptype='" + a + "' " + k + '="' + b[l][k] + "\" onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + b[l][a == "fillform" ? "decprofilename" : "name"] + e + "</td></tr>"
    }
    if (a == "fillform") {
        if (c > 0) d += "<tr style='background-color: #fff;'><td><hr></td></tr>";
        d += "<tr lptype='addprofile' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Add Profile") + "</td></tr>";
        d += "<tr lptype='addcreditcard' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Add Credit Card") + "</td></tr>";
        d += "<tr lptype='clearforms' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Clear Forms") + "</td></tr>";
        if (g && j) d += "<tr lptype='chooseprofilecc' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Choose Profile and Credit Card") + "</td></tr>"
    }
    d += "</table></div>";
    addMenuIdToPage(a);
    return d
}

function createNeverMenu(a) {
    var b = "";
    b += "<div id='lppopupnever' class='lppopup' " + (" style='height:" + (a ? "72" : "48") + "px'") + "><table width='100%'>";
    if (a) b += "<tr lptype='neverautofill' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Never AutoFill") + "</td></tr>";
    b += "<tr lptype='neverpage' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Never For This Page") + "</td></tr>";
    b += "<tr lptype='neverdomain' onclick='this.dispatchEvent(lpcustomEvent);'><td>&nbsp;" + gs("Never For This Domain") + "</td></tr>";
    b += "</table></div>";
    addMenuIdToPage("never");
    return b
}
function addMenuIdToPage(a) {
    run_custom_js(document, "if(typeof(lpgblmenus)=='undefined'){ lpgblmenus = new Array(); }   lpgblmenus[lpgblmenus.length] = 'lppopup" + a + "';   ")
}

function showMenuScript() {
    return "function lpshowmenudiv(id){   closelpmenus(id);   var div = document.getElementById('lppopup'+id);   var btn = document.getElementById('lp'+id);   if(btn && div){     var btnstyle = window.getComputedStyle(btn, null);     var divstyle = window.getComputedStyle(div, null);     var posx = btn.offsetLeft;     posx -= 80;     var divwidth = parseInt(divstyle.getPropertyValue('width'));     if(posx + divwidth > window.innerWidth - 25){       posx -= ((posx + divwidth) - window.innerWidth + 25);     }     div.style.left = posx + \"px\";     div.style.top = (btn.offsetTop + btnstyle.getPropertyValue('height')) + \"px\";         if(div.style.display=='block') div.style.display = 'none';     else div.style.display = 'block';       } }function closelpmenus(id){   if(typeof(lpgblmenus)!='undefined'){     for(var i=0; i < lpgblmenus.length; i++){       if(id==null || lpgblmenus[i]!='lppopup'+id)         document.getElementById(lpgblmenus[i]).style.display = 'none';     }   }} var lpcustomEvent = document.createEvent('Event'); lpcustomEvent.initEvent('lpCustomEventMenu', true, true); "
}

function checkForLoginForm(a) {
    a = a.getElementsByTagName("form");
    for (var b = 0; b < a.length; b++) {
        for (var c = 0, d = a[b].elements, e = 0; e < d.length; e++) if (d[e].type == "password") if (g_fillaid) return true;
        else if (++c >= 2) return false;
        if (c == 1) return true
    }
    return false
}
function lp_notification_exists(a, b) {
    return b == curr_notification_type || b == "autologin" && curr_notification_type == "fill"
}
function never_gen() {
    return false
}
function never_ff() {
    return false
}

function lp_showNotification(a, b, c, d, e, g, j, k) {
    lpshownotification(d, {
        text: gs(a),
        aid: c,
        extra: e,
        extra2: j,
        extra3: k
    })
}
if (typeof g_is_formfill == "undefined") g_isopera ? window.addEventListener("DOMContentLoaded", function() {
    onLoad()
}, false) : onLoad();

function lpgettop() {
    return g_isopera ? window.top : top
}
function lpgettopurl() {
    try {
        return lpgettop().document.location.href
    } catch (a) {
        return document.location.href
    }
}
var lpParseUriCache = [],
    lpParseUriNumber = 0;

function lpParseUri(a) {
    if (typeof a != "string") return "";
    if (lpParseUriCache[a] != null) return lpParseUriCache[a];
    var b = null,
        c = null,
        d = a;
    if (a.indexOf("#") != -1) {
        c = a.substring(a.indexOf("#") + 1);
        a = a.substring(0, a.indexOf("#"))
    }
    if (a.indexOf("?") != -1) {
        b = a.substring(a.indexOf("?") + 1);
        a = a.substring(0, a.indexOf("?"))
    }
    var e = a.match(/^(.*:\/\/[^\/]+\/.*)@/);
    if (e) a = a.substring(0, e[1].length) + a.substring(e[1].length).replace(/@/g, "%40");
    if (a.length > 2047) return "";
    var g = lpParseUri.options;
    a = g.parser[g.strictMode ? "strict" : "loose"].exec(a);
    var j = {};
    for (e = 14; e--;) j[g.key[e]] = a[e] || "";
    j[g.q.name] = {};
    j[g.key[12]].replace(g.q.parser, function(l, f, p) {
        if (f) j[g.q.name][f] = p
    });
    if (b != null) {
        j.query = b;
        if (c != null) j.anchor = c
    }
    if (lpParseUriNumber > 500) {
        for (var k in lpParseUriCache) {
            delete lpParseUriCache[k];
            break
        }
        lpParseUriNumber = 0
    }
    lpParseUriCache[d] = j;
    lpParseUriNumber++;
    return j
}
lpParseUri.options = {
    strictMode: false,
    key: ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"],
    q: {
        name: "queryKey",
        parser: /(?:^|&)([^&=]*)=?([^&]*)/g
    },
    parser: {
        strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
        loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }
};
var lpCanUrlCache = [],
    lpCanUrlExNumber = 0;

function lpcanonizeUrl(a, b) {
    if ("about:blank" == a) return "";
    if (lpCanUrlCache[a] != null) return lpCanUrlCache[a];
    if (b == null) b = lpParseUri(a);
    var c = "";
    if (b.port != "") if (b.port != get_default_port(b.protocol)) c = ":" + b.port;
    if (b.host) c = b.host.toLowerCase() + c + b.path;
    else {
        if (!a) return "";
        c = a
    }
    if (c.indexOf(";") != -1) c = c.substring(0, c.indexOf(";"));
    if (lpCanUrlExNumber > 500) {
        for (var d in lpCanUrlCache) {
            delete lpCanUrlCache[d];
            break
        }
        lpCanUrlExNumber = 0
    }
    lpCanUrlCache[a] = c;
    lpCanUrlExNumber++;
    return c
}

function lp_gettld(a, b) {
    if (typeof lp_all_tlds == "undefined" || lp_all_tlds == null) lp_init_tlds();
    if (typeof a != "string") return "";
    if (a == "" && typeof b == "string" && b.indexOf("file://") == 0) return "file:";
    a = a.toLowerCase();
    a = a.replace(/\.$/, "");
    var c = a.split("."),
        d;
    if (a.match(/^\d+\.\d+\.\d+\.\d+$/)) d = 4;
    else {
        d = 2;
        if (c.length >= 2) {
            var e = c[c.length - 1];
            if (typeof lp_all_tlds[e] != "undefined") if (lp_in_array(c[c.length - 2], lp_all_tlds[e])) d = 3
        }
    }
    for (; c.length > d;) c.shift();
    return c.join(".")
}

function lp_gettld_url(a) {
    var b = lpParseUri(a);
    return lp_gettld(b.host, a)
}
function getname_url(a) {
    a = lpParseUri(a);
    return (typeof a.host == "string" ? a.host : "").replace(/^www\./, "")
}
function lptrim(a) {
    if (typeof a != "string") return a;
    return a.replace(/^\s+|\s+$/g, "")
}
function lp_regexp_quote(a) {
    return (a + "").replace(/([\\\.\+\*\?\[\^\]\$\(\)\{\}\=\!<>\|\:])/g, "\\$1")
}

function getname(a, b) {
    if (b && typeof a.id != "undefined" && a.id != "") return a.id;
    if (typeof a != "undefined" && a != null) if (typeof a.name != "undefined" && a.name != "") return a.name;
    else if (typeof a.id != "undefined") return a.id;
    return ""
}

function lpIsVisible(a, b) {
    for (; a && a.tagName != "BODY"; a = a.parentNode) {
        if (typeof a.style != "undefined" && (a.style.visibility == "hidden" || a.style.display == "none")) return false;
        try {
            var c = a.ownerDocument.defaultView.getComputedStyle(a, "");
            if (c.visibility == "hidden" || c.display == "none") return false
        } catch (d) {}
        if (b) break
    }
    return true
}
function lp_in_array(a, b) {
    for (var c = b.length, d = 0; d <= c; d++) if (typeof b[d] != "undefined" && b[d] == a) {
        lpArrayOffset = d;
        return true
    }
    return false
}

function strip(a) {
    if (!a.length) return a;
    a = a.replace(/\s+/g, " ");
    a = a.replace(/^\s+|\s+$/g, "");
    a = a.replace(/[\|]+$/g, "");
    var b = a.match(/\|([^\|]+)$/);
    if (b) {
        a = b[1];
        a = a.replace(/^\s+|\s+$/g, "")
    }
    return a
}
function lpxmlescape(a) {
    if (typeof a == "number") a = "" + a;
    a = a.replace(/&/g, "&amp;");
    a = a.replace(/</g, "&lt;");
    a = a.replace(/>/g, "&gt;");
    return a.replace(/"/g, "&quot;")
}

function lpxmlunescape(a) {
    if (typeof a == "number") a = "" + a;
    a = a.replace(/&lt;/g, "<");
    a = a.replace(/&gt;/g, ">");
    a = a.replace(/&quot;/g, '"');
    return a.replace(/&amp;/g, "&")
}
var lpRegExCache = [],
    lpRegExNumber = 0;

function regexp_match_c(a, b) {
    var c = a.toString() + "_" + b;
    if (c.length > 80) if (typeof fasthash == "function") c = fasthash(c);
    else if (typeof SHA256 == "function") c = SHA256(c);
    if (lpRegExCache[c] != null) return lpRegExCache[c] == "1";
    var d = a.exec(b);
    if (lpRegExNumber > 2500) {
        for (var e in lpRegExCache) {
            delete lpRegExCache[e];
            break
        }
        lpRegExNumber = 0
    }
    lpRegExCache[c] = d ? "1" : "0";
    lpRegExNumber++;
    return d
}

function fire_onchange(a, b) {
    try {
        if (a) {
            if (a.ownerDocument && typeof a.ownerDocument.createEvent == "function") {
                var c = a.ownerDocument.createEvent("Events");
                c.initEvent("change", true, true);
                a.dispatchEvent(c)
            } else typeof a.fireEvent != "undefined" && a.fireEvent("onchange");
            if (typeof b == "undefined" || b == null || b) typeof sendKey == "function" && sendKey("SHIFT", a);
            if (typeof lpGetBrowserForDocument == "function") {
                var d = lpGetBrowserForDocument(a.ownerDocument);
                if (d) d.lpfieldchanged = true
            }
        }
    } catch (e) {}
}

function get_default_port(a) {
    switch (a) {
    case "http":
        return 80;
    case "https":
        return 443;
    case "ftp":
        return 21;
    default:
        return 0
    }
}
function get_port(a) {
    var b = 0;
    if (typeof a.port != "undefined" && a.port) b = a.port;
    else if (typeof a.protocol != "undefined" && a.protocol) b = get_default_port(a.protocol);
    return b
}
function compare_ports(a, b) {
    var c = a.port != "" ? a.port : get_default_port(a.protocol),
        d = b.port != "" ? b.port : get_default_port(b.protocol);
    return c == d
}

function array_size(a) {
    var b = a.length ? --a.length : -1,
        c;
    for (c in a) b++;
    return b
}
function lpgetlocalts() {
    return (new Date).getTime()
}
function lp_get_gmt_timestamp() {
    var a = (new Date).getTime();
    return parseInt(a / 1E3)
}
function lp_get_local_timestamp() {
    return lp_get_gmt_timestamp()
}

function lp_init_tlds() {
    if (typeof lp_all_tlds == "undefined" || lp_all_tlds == null) {
        lp_all_tlds = [];
        lp_all_tlds.hu = ["2000", "agrar", "bolt", "casino", "city", "co", "com", "erotica", "erotika", "film", "forum", "games", "hotel", "info", "ingatlan", "jogasz", "konyvelo", "lakas", "media", "news", "nui", "org", "priv", "reklam", "sex", "shop", "sport", "suli", "szex", "tm", "tozsde", "utazas", "video"];
        lp_all_tlds.nl = ["752"];
        lp_all_tlds.ca = ["ab", "bc", "gc", "mb", "nb", "nf", "nl", "ns", "nt", "nu", "on", "pe", "qc", "sk", "yk"];
        lp_all_tlds.pa = ["abo", "ac", "com", "edu", "gob", "ing", "med", "net", "nom", "org", "sld"];
        lp_all_tlds.se = ["ab", "ac", "bd", "brand", "com", "c", "d", "e", "fh", "fhsk", "fhv", "f", "g", "h", "i", "komforb", "kommunalforbund", "komvux", "k", "lanarb", "lanbib", "mil", "m", "naturbruksgymn", "net", "n", "org", "o", "parti", "pp", "press", "s", "sshn", "tm", "t", "u", "w", "x", "y", "z"];
        lp_all_tlds.ac = ["ac", "co", "com", "edu", "gov", "gv", "mil", "net", "or", "org"];
        lp_all_tlds.ae = ["ac", "com", "gov", "mil", "name", "net", "org", "pro", "sch"];
        lp_all_tlds.at = ["ac", "co", "gv", "or", "priv"];
        lp_all_tlds.be = ["ac", "ap", "co", "com", "fgov", "to", "xa"];
        lp_all_tlds.cn = ["ac", "ah", "bj", "com", "cq", "edu", "fj", "gd", "gov", "gs", "gx", "gz", "ha", "hb", "he", "hi", "hk", "hl", "hn", "jl", "js", "jx", "ln", "mo", "net", "nm", "nx", "org", "qh", "sc", "sd", "sh", "sn", "sx", "tj", "tw", "xj", "xz", "yn", "zj"];
        lp_all_tlds.cr = ["ac", "co", "ed", "fi", "go", "or", "sa"];
        lp_all_tlds.cy = ["ac", "biz", "com", "ekloges", "gov", "info", "ltd", "name", "net", "org", "parliament", "press", "pro", "tm"];
        lp_all_tlds.fj = ["ac", "biz", "com", "gov", "id", "info", "mil", "name", "net", "org", "pro", "school"];
        lp_all_tlds.fk = ["ac", "co", "gov", "net", "nom", "org"];
        lp_all_tlds.gg = ["ac", "alderney", "co", "gov", "guernsey", "ind", "ltd", "net", "org", "sark", "sch"];
        lp_all_tlds.gn = ["ac", "com", "gov", "net", "org"];
        lp_all_tlds.gt = ["com", "edu", "gob", "ind", "mil", "net", "org"];
        lp_all_tlds.id = ["ac", "co", "go", "mil", "net", "or", "sch", "web"];
        lp_all_tlds.il = ["ac", "co", "gov", "idf", "k12", "muni", "net", "org"];
        lp_all_tlds.im = ["ac", "co", "gov", "net", "nic", "org"];
        lp_all_tlds["in"] = ["ac", "co", "edu", "ernet", "firm", "gen", "gov", "ind", "mil", "net", "nic", "org", "res"];
        lp_all_tlds.ir = ["ac", "co", "gov", "net", "org", "sch"];
        lp_all_tlds.is = ["ac", "org"];
        lp_all_tlds.je = ["ac", "co", "gov", "ind", "jersey", "ltd", "net", "org", "sch"];
        lp_all_tlds.jp = ["ac", "ad", "aichi", "akita", "aomori", "chiba", "co", "ed", "ehime", "fukui", "fukuoka", "fukushima", "gifu", "go", "gov", "gr", "gunma", "hiroshima", "hokkaido", "hyogo", "ibaraki", "ishikawa", "iwate", "kagawa", "kagoshima", "kanagawa", "kawasaki", "kitakyushu", "kobe", "kochi", "kumamoto", "kyoto", "lg", "mie", "miyagi", "miyazaki", "nagano", "nagasaki", "nagoya", "nara", "ne", "net", "niigata", "oita", "okayama", "okinawa", "org", "or", "osaka", "saga", "saitama", "sapporo", "sendai", "shiga", "shimane", "shizuoka", "tochigi", "tokushima", "tokyo", "tottori", "toyama", "wakayama", "yamagata", "yamaguchi", "yamanashi", "yokohama"];
        lp_all_tlds.kr = ["ac", "co", "go", "ne", "nm", "or", "re"];
        lp_all_tlds.mw = ["ac", "com", "co", "coop", "edu", "gov", "int", "museum", "net", "org"];
        lp_all_tlds.nz = ["ac", "co", "cri", "geek", "gen", "govt", "iwi", "maori", "mil", "net", "org", "school"];
        lp_all_tlds.ru = ["ac", "com", "int", "msk", "net", "org", "pp"];
        lp_all_tlds.rw = ["ac", "com", "co", "edu", "gouv", "gov", "int", "mil", "net"];
        lp_all_tlds.au = ["act", "asn", "com", "conf", "csiro", "edu", "gov", "id", "info", "net", "nsw", "nt", "org", "oz", "qld", "sa", "tas", "telememo", "vic", "wa"];
        lp_all_tlds.th = ["ac", "co", "go", "in", "mi", "net", "or"];
        lp_all_tlds.tj = ["ac", "biz", "com", "co", "edu", "go", "gov", "int", "mil", "name", "net", "org", "web"];
        lp_all_tlds.tz = ["ac", "co", "go", "ne", "or"];
        lp_all_tlds.ug = ["ac", "co", "go", "ne", "or", "sc"];
        lp_all_tlds.uk = ["ac", "bl", "british-library", "com", "co", "gov", "icnet", "jet", "ltd", "me", "mil", "mod", "national-library-scotland", "nel", "net", "nhs", "nic", "nls", "org", "parliament", "plc", "police", "sch"];
        lp_all_tlds.vn = ["ac", "biz", "com", "edu", "gov", "health", "info", "int", "name", "net", "org", "pro"];
        lp_all_tlds.yu = ["ac", "co", "edu", "org"];
        lp_all_tlds.za = ["ac", "alt", "city", "com", "co", "edu", "gov", "law", "mil", "net", "ngo", "nom", "org", "school", "tm", "web"];
        lp_all_tlds.zm = ["ac", "co", "gov", "org", "sch"];
        lp_all_tlds.zw = ["ac", "co", "gov", "org"];
        lp_all_tlds.br = ["adm", "adv", "agr", "am", "arq", "art", "ato", "bio", "bmd", "cim", "cng", "cnt", "com", "coop", "dpn", "ecn", "edu", "eng", "esp", "etc", "eti", "far", "fm", "fnd", "fot", "fst", "g12", "ggf", "gov", "imb", "ind", "inf", "jor", "lel", "mat", "med", "mil", "mus", "net", "nom", "not", "ntr", "odo", "org", "ppg", "pro", "psc", "psi", "qsl", "rec", "slg", "srv", "tmp", "trd", "tur", "tv", "vet", "zlg"];
        lp_all_tlds.ht = ["adult", "art", "asso", "com", "coop", "edu", "firm", "gouv", "info", "med", "net", "org", "perso", "pol", "pro", "rel", "shop"];
        lp_all_tlds.mv = ["aero", "biz", "com", "coop", "edu", "gov", "info", "int", "mil", "museum", "name", "net", "org", "pro"];
        lp_all_tlds.pl = ["agro", "aid", "art", "atm", "auto", "bialystok", "biz", "com", "edu", "gdansk", "gda", "gmina", "gov", "gsm", "info", "krakow", "lodz", "lublin", "mail", "media", "miasta", "mil", "net", "ngo", "nom", "olsztyn", "org", "pc", "poznan", "priv", "realestate", "rel", "shop", "sklep", "slupsk", "sos", "szczecin", "targi", "tm", "torun", "tourism", "travel", "turystyka", "warszawa", "waw", "wroclaw", "wroc"];
        lp_all_tlds.us = ["ak", "al", "ar", "az", "ca", "com", "co", "ct", "dc", "de", "dni", "fed", "fl", "ga", "hi", "ia", "id", "il", "in", "isa", "kids", "ks", "ky", "la", "ma", "md", "me", "mi", "mn", "mo", "ms", "mt", "nc", "nd", "ne", "nh", "nj", "nm", "nsn", "nv", "ny", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "va", "vt", "wa", "wi", "wv", "wy"];
        lp_all_tlds.fi = ["aland"];
        lp_all_tlds.mil = ["army", "navy"];
        lp_all_tlds["do"] = ["art", "com", "edu", "gob", "gov", "mil", "net", "org", "sld", "web"];
        lp_all_tlds.dz = ["art", "asso", "com", "edu", "gov", "net", "org", "pol"];
        lp_all_tlds.co = ["arts", "com", "edu", "firm", "gov", "info", "int", "mil", "net", "nom", "org", "rec", "store", "uk", "web"];
        lp_all_tlds.ro = ["arts", "com", "firm", "info", "nom", "nt", "org", "rec", "store", "tm", "www"];
        lp_all_tlds.ve = ["arts", "bib", "com", "co", "edu", "firm", "gov", "info", "int", "mil", "net", "nom", "org", "rec", "store", "tec", "web"];
        lp_all_tlds.lv = ["asn", "com", "conf", "edu", "eu", "gov", "id", "mil", "net", "org"];
        lp_all_tlds.lk = ["assn", "com", "edu", "gov", "grp", "hotel", "int", "ltd", "net", "ngo", "org", "sch", "soc", "web"];
        lp_all_tlds.fr = ["asso", "com", "gouv", "nom", "prd", "presse", "tm"];
        lp_all_tlds.gp = ["asso", "com", "edu", "net", "org"];
        lp_all_tlds.mc = ["asso", "tm"];
        lp_all_tlds.tr = ["av", "bbs", "bel", "biz", "com", "dr", "edu", "gen", "gov", "info", "k12", "mil", "name", "net", "org", "pol", "tel", "web"];
        lp_all_tlds.az = ["biz", "com", "edu", "gov", "info", "int", "mil", "name", "net", "org", "pp"];
        lp_all_tlds.et = ["biz", "com", "edu", "gov", "info", "name", "net", "org"];
        lp_all_tlds.nr = ["biz", "com", "co", "edu", "gov", "info", "net", "org"];
        lp_all_tlds.om = ["biz", "com", "co", "edu", "gov", "med", "mil", "museum", "net", "org", "pro", "sch"];
        lp_all_tlds.pk = ["biz", "com", "edu", "fam", "gob", "gok", "gon", "gop", "gos", "gov", "net", "org", "web"];
        lp_all_tlds.pr = ["biz", "com", "edu", "gov", "info", "isla", "name", "net", "org", "pro"];
        lp_all_tlds.tt = ["biz", "com", "co", "edu", "gov", "info", "name", "net", "org", "pro", "us"];
        lp_all_tlds.ua = ["cherkassy", "chernigov", "chernovtsy", "ck", "cn", "com", "crimea", "cv", "dnepropetrovsk", "dn", "donetsk", "dp", "edu", "gov", "if", "ivano-frankivsk", "kharkov", "kherson", "khmelnitskiy", "kh", "kiev", "kirovograd", "km", "kr", "ks", "kv", "lg", "lugansk", "lutsk", "lviv", "mk", "net", "nikolaev", "odessa", "od", "org", "pl", "poltava", "rovno", "rv", "sebastopol", "sumy", "ternopil", "te", "uzhgorod", "vinnica", "vn", "zaporizhzhe", "zhitomir", "zp", "zt"];
        lp_all_tlds.tw = ["club", "com", "ebiz", "edu", "game", "gove", "gov", "idv", "mil", "net", "org"];
        lp_all_tlds.ag = ["co", "com", "net", "nom", "org"];
        lp_all_tlds.ao = ["co", "ed", "gv", "it", "og", "pb"];
        lp_all_tlds.bw = ["co", "org"];
        lp_all_tlds.ck = ["co"];
        lp_all_tlds.ls = ["co", "org"];
        lp_all_tlds.ma = ["co", "gov", "net", "org"];
        lp_all_tlds.af = ["com", "edu", "gov", "net"];
        lp_all_tlds.ai = ["com", "net", "off", "org"];
        lp_all_tlds.al = ["com", "edu", "gov", "inima", "net", "org", "soros", "tirana", "uniti", "upt"];
        lp_all_tlds.an = ["com", "edu", "net", "org"];
        lp_all_tlds.ar = ["com", "gov", "int", "mil", "net", "org"];
        lp_all_tlds.aw = ["com"];
        lp_all_tlds.bb = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.bd = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.bm = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.bn = ["com", "edu", "net", "org"];
        lp_all_tlds.bo = ["com", "edu", "gob", "gov", "int", "mil", "net", "org", "tv"];
        lp_all_tlds.bs = ["com", "net", "org"];
        lp_all_tlds.bt = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.cd = ["com", "net", "org"];
        lp_all_tlds.ch = ["com", "gov", "net", "org"];
        lp_all_tlds.cu = ["com", "edu", "gov", "inf", "net", "org"];
        lp_all_tlds.dm = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.ec = ["com", "edu", "fin", "gov", "info", "k12", "med", "mil", "net", "org", "pro"];
        lp_all_tlds.ee = ["com", "fie", "org", "pri"];
        lp_all_tlds.eg = ["com", "edu", "eun", "gov", "mil", "net", "org", "sci"];
        lp_all_tlds.es = ["com", "edu", "gob", "nom", "org"];
        lp_all_tlds.eu = ["com"];
        lp_all_tlds.gb = ["com", "net"];
        lp_all_tlds.ge = ["com", "edu", "gov", "mil", "net", "org", "pvt"];
        lp_all_tlds.gh = ["com", "edu", "gov", "mil", "org"];
        lp_all_tlds.gi = ["com", "edu", "gov", "ltd", "mod", "org"];
        lp_all_tlds.gr = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.gu = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.hk = ["com", "edu", "gov", "idv", "net", "org"];
        lp_all_tlds.hn = ["com", "edu", "gob", "mil", "net", "org"];
        lp_all_tlds.hr = ["com", "from", "iz", "name"];
        lp_all_tlds.jm = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.jo = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.kh = ["com", "edu", "gov", "mil", "net", "org", "per"];
        lp_all_tlds.kw = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.ky = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.kz = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.la = ["com", "net", "org"];
        lp_all_tlds.lb = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.lc = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.li = ["com", "gov", "net", "org"];
        lp_all_tlds.lr = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.ly = ["com", "edu", "gov", "id", "med", "net", "org", "plc", "sch"];
        lp_all_tlds.mg = ["com", "edu", "gov", "mil", "nom", "org", "prd", "tm"];
        lp_all_tlds.mk = ["com", "org"];
        lp_all_tlds.mm = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.mo = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.mt = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.mu = ["com", "co"];
        lp_all_tlds.mx = ["com", "edu", "gob", "gov", "net", "org"];
        lp_all_tlds.my = ["com", "edu", "gov", "mil", "name", "net", "org"];
        lp_all_tlds.na = ["com", "net", "org"];
        lp_all_tlds.nc = ["com", "net", "org"];
        lp_all_tlds.ng = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.ni = ["com", "edu", "gob", "net", "nom", "org"];
        lp_all_tlds.no = ["com", "fhs", "folkebibl", "fylkesbibl", "herad", "idrett", "kommune", "mil", "museum", "priv", "stat", "vgs"];
        lp_all_tlds.np = ["com", "edu", "gov", "mil", "net", "org", "ort"];
        lp_all_tlds.pe = ["com", "edu", "gob", "mil", "net", "nom", "org"];
        lp_all_tlds.pf = ["com", "edu", "org"];
        lp_all_tlds.pg = ["com", "net"];
        lp_all_tlds.ph = ["com", "gov", "mil", "net", "ngo", "org"];
        lp_all_tlds.ps = ["com", "edu", "gov", "net", "org", "plo", "sec"];
        lp_all_tlds.pt = ["com", "edu", "gov", "int", "net", "nome", "org", "publ"];
        lp_all_tlds.py = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.qc = ["com"];
        lp_all_tlds.sa = ["com", "edu", "gov", "med", "net", "org", "pub", "sch"];
        lp_all_tlds.sb = ["com", "edu", "gov", "net"];
        lp_all_tlds.sc = ["com", "edu", "gov", "net", "org"];
        lp_all_tlds.sd = ["com", "edu", "gov", "info", "med", "net", "org", "tv"];
        lp_all_tlds.sg = ["com", "edu", "gov", "idn", "net", "org", "per"];
        lp_all_tlds.sh = ["com", "edu", "gov", "mil", "net", "org"];
        lp_all_tlds.sv = ["com", "co", "edu", "gob", "org", "red"];
        lp_all_tlds.sy = ["com", "gov", "net", "org"];
        lp_all_tlds.tn = ["com", "edunet", "ens", "fin", "gov", "ind", "info", "intl", "nat", "net", "org", "rnrt", "rns", "rnu", "tourism"];
        lp_all_tlds.uy = ["com", "edu", "gub", "mil", "net", "org"];
        lp_all_tlds.vi = ["com", "co", "edu", "gov", "net", "org"];
        lp_all_tlds.ye = ["com", "net"];
        lp_all_tlds.pro = ["cpa", "law", "med"];
        lp_all_tlds.arpa = ["e164", "in-addr", "ip6", "iris", "uri", "urn"];
        lp_all_tlds["int"] = ["eu"];
        lp_all_tlds.bf = ["gov"];
        lp_all_tlds.by = ["gov", "mil"];
        lp_all_tlds.cx = ["gov"];
        lp_all_tlds.ie = ["gov"];
        lp_all_tlds.it = ["gov", "pisa"];
        lp_all_tlds.lt = ["gov", "mil"];
        lp_all_tlds.lu = ["gov", "mil", "net", "org"];
        lp_all_tlds.to = ["gov"];
        lp_all_tlds.tp = ["gov"];
        lp_all_tlds.tv = ["gov"];
        lp_all_tlds.mobi = ["music", "weather"];
        lp_all_tlds.mh = ["net"];
        lp_all_tlds.ad = ["nom"];
        lp_all_tlds.sr = ["rs"];
        lp_all_tlds.va = ["vatican"]
    }
}

function checkurlrules(a, b, c, d, e, g, j) {
    if (b.length == 0) return b;
    for (var k = [], l = [], f = 0; f < a.length; f++) {
        if (typeof a[f].tld == "undefined") {
            a[f].tld = lp_gettld_url(a[f].url);
            a[f].parts = lpParseUri(a[f].url);
            a[f].path = typeof a[f].parts.path == "string" ? a[f].parts.path : ""
        }
        if (c == a[f].tld) if (a[f].path != "" && d.indexOf(a[f].path) != 0) l[l.length] = a[f];
        else if (e == a[f].parts.host || a[f].exacthost == 1 && e.indexOf("." + a[f].parts.host) != -1 || a[f].exacthost == 0) k[k.length] = a[f];
        else l[l.length] = a[f]
    }
    if (k.length == 0 && l.length == 0) return b;
    if (k.length > 0) {
        a = b;
        for (f = 0; f < k.length; f++) {
            c = applyurlrule(b, k[f], d, e, j);
            if (c.length < a.length) a = c
        }
        return a
    } else {
        for (f = 0; f < l.length; f++) removeurlrule(b, l[f], g, e, j);
        return b
    }
}

function applyurlrule(a, b, c, d, e) {
    var g = b.path;
    if (g != "" && c.indexOf(g) != 0) return a;
    for (var j = g.split("/").length, k = [], l = false, f = 0; f < a.length; f++) {
        var p = a[f],
            o = p.pathlevelmatch,
            h = p.servermatch,
            n = p.portmatch;
        if (typeof o == "undefined") {
            o = c.split("/");
            p = lpParseUri(p.url);
            p.path = typeof p.path != "undefined" ? p.path : "";
            h = p.path.split("/");
            for (n = 0; n < o.length && n < h.length; n++) if (h[n] != o[n]) break;
            o = n;
            h = d == p.host;
            n = e == get_port(p)
        }
        if (!(g != "" && o < j)) {
            l = l || b.exacthost == 1 || b.exactport == 1 ? true : false;
            if ((h || b.exacthost == 0) && (n || b.exactport == 0)) {
                l = true;
                k[k.length] = a[f]
            }
        }
    }
    if (!l) return a;
    return k
}
function removeurlrule(a, b, c, d, e) {
    for (var g = b.path, j = 0; j < a.length; j++) {
        var k = typeof a[j].id != "undefined" ? a[j].id : a[j].aid;
        if (typeof c[k] != "undefined") {
            k = lpParseUri(c[k].url);
            k.path = typeof k.path != "undefined" ? k.path : "";
            if (g != "") if (k.path.indexOf(g) != 0) continue;
            if ((b.exacthost == "0" || d == k.host) && (b.exactport == "0" || e == get_port(k))) {
                a.splice(j, 1);
                j -= 1
            }
        }
    }
}

function lpsubstring(a, b, c) {
    var d = "",
        e = c - b;
    for (c = 0; c < e; ++c) d += a[c + b];
    return d
}
function lpcreaterandomhexstring(a) {
    for (var b = "", c = 0; c < a; c++) {
        var d = get_random(0, 15);
        b += "0123456789ABCDEF".substring(d, d + 1)
    }
    return b
}

function reencryptShareeAutoPushes(a, b) {
    var c = ["name", "group", "username", "password", "extra"],
        d = {},
        e = true;
    for (m in c) {
        var g = c[m];
        if (b[g] != null) {
            d[g] = lpdec(b[g], a);
            if (b[g] != "" && (d[g] == null || d[g] == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing id=" + b.id + " because we failed to decrypt : " + g + "=" + b[g]);
                e = false;
                break
            }
            var j = lpenc(d[g]);
            if (d[g] != "" && (j == null || j == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing aid=" + aid + " id=" + b.id + " because we failed to reencrypt : " + g);
                e = false;
                break
            }
            d[g] = j
        }
    }
    if (!e) return null;
    for (var k in b.fields) {
        c = b.fields[k];
        if ("email" == c.type || c.type == "text" || c.type == "password" || c.type == "textarea" || c.type == "hidden") {
            g = c.value;
            c = lpdec(g, a);
            if (g != "" && (c == null || c == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing aid=" + aid + " id=" + b.id + " because we failed to decrypt field" + k + "=" + g);
                e = false;
                break
            }
            g = lpenc(c);
            if (c != "" && (g == null || g == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing aid=" + aid + " id=" + b.id + " because we failed to reencrypt field" + k + "=" + c);
                e = false;
                break
            }
            b.fields[k].value = g
        }
    }
    if (!e) return null;
    for (k in b.otherfields) {
        c = b.otherfields[k];
        if ("email" == c.type || c.type == "text" || c.type == "password" || c.type == "textarea" || c.type == "hidden") {
            g = c.value;
            c = lpdec(g, a);
            if (g != "" && (c == null || c == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing aid=" + aid + " id=" + b.id + " because we failed to decrypt otherfield" + k + "=" + g);
                e = false;
                break
            }
            g = lpenc(c);
            if (c != "" && (g == null || g == "")) {
                lpReportError("lprsa_acceptshareeautopushes : failing aid=" + aid + " id=" + b.id + " because we failed to reencrypt otherfield" + k + "=" + c);
                e = false;
                break
            }
            b.otherfields[k].value = g
        }
    }
    if (!e) return null;
    e = {};
    for (i in b) if (i == "fields") {
        e.numf = b.fields.length;
        for (k in b.fields) {
            e["f" + k + "urid"] = b.fields[k].urid;
            e["f" + k + "name"] = b.fields[k].name;
            e["f" + k + "value"] = b.fields[k].value;
            e["f" + k + "type"] = b.fields[k].type
        }
    } else if (i == "otherfields") {
        e.numof = b.otherfields.length;
        for (k in b.otherfields) {
            e["of" + k + "urid"] = b.otherfields[k].urid;
            e["of" + k + "name"] = b.otherfields[k].name;
            e["of" + k + "value"] = b.otherfields[k].value;
            e["of" + k + "type"] = b.otherfields[k].type;
            e["of" + k + "formname"] = b.otherfields[k].formname
        }
    } else if (i != "sharekeyhexenc" && b[i] != null) e[i] = typeof d[i] != "undefined" ? d[i] : b[i];
    return e
}

function createShareeAutoPushesResponse(a, b, c) {
    a = a.responseXML.documentElement;
    var d = a.getElementsByTagName("sharerpublickeys"),
        e = a.getElementsByTagName("shareepublickeys"),
        g = a.getElementsByTagName("encfields"),
        j = a.getElementsByTagName("encofields");
    if (d.length <= 0 && e.length <= 0) return false;
    a = b.aid;
    var k = b.postdata;
    b = typeof b.newvalues == "undefined" ? [] : b.newvalues;
    if (typeof c == "undefined" || c == null) {
        lpReportError("SHARE : createShareeAutoPushesResponse failed for aid=" + a, null);
        return false
    }
    var l = {},
        f = g[0].getElementsByTagName("encfield");
    k += "&numencf=" + LP.en(f.length);
    for (g = 0; g < f.length; ++g) {
        var p = f[g].getAttribute("afid"),
            o = f[g].getAttribute("value");
        l[p] = o
    }
    f = {};
    j = j[0].getElementsByTagName("encofield");
    k += "&numencof=" + LP.en(j.length);
    for (g = 0; g < j.length; ++g) {
        p = j[g].getAttribute("afid");
        o = j[g].getAttribute("value");
        f[p] = o
    }
    k += "&numvalueenc=" + LP.en(b.length);
    for (u = 0; u < b.length; ++u) {
        g = lpenc(b[u]);
        k += "&valueenc" + u + "=" + LP.en(g)
    }
    if (e.length > 0) {
        j = e[0].getElementsByTagName("sharee");
        k += "&numsharees=" + LP.en(j.length);
        for (g = 0; g < j.length; ++g) {
            var h = j[g].getAttribute("uid");
            u = j[g].getAttribute("key");
            o = lpcreaterandomhexstring(64);
            e = lp_hex2bin(o);
            o = lprsa_encryptdata(u, o);
            if (o == false) {
                lpReportError("SHARE : lprsa_encryptdata failed for shareeuid=" + h + " using shareepublickeyhex=" + u, null);
                return false
            }
            k += "&sharee" + g + "uid=" + LP.en(h);
            k += "&sharee" + g + "sharekeyhexenc=" + LP.en(o);
            o = {
                name: c.name,
                grouping: c.group,
                username: typeof g_sites != "undefined" ? lpmdec(c.username, true) : lpdec(c.username),
                password: typeof g_sites != "undefined" ? lpmdec(c.password, true) : lpdec(c.password),
                extra: typeof g_sites != "undefined" ? lpmdec(c.extra, true) : lpdec(c.extra)
            };
            for (var n in o) {
                var s = lpenc(o[n], e);
                if (o[n] != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting aid=" + a + " for shareeuid=" + h, null);
                    return false
                }
                k += "&sharee" + g + n + "=" + LP.en(s)
            }
            var u = 0;
            for (p in l) {
                o = lpdec(l[p]);
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting field afid=" + p + " aid=" + a + " for shareeuid=" + h, null);
                    return false
                }
                k += "&sharee" + g + "fafid" + u + "=" + LP.en(p);
                k += "&sharee" + g + "fvalue" + u + "=" + LP.en(s);
                ++u
            }
            u = 0;
            for (p in f) {
                o = lpdec(f[p]);
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting otherfield afid=" + p + " aid=" + a + " for shareeuid=" + h, null);
                    return false
                }
                k += "&sharee" + g + "ofafid" + u + "=" + LP.en(p);
                k += "&sharee" + g + "ofvalue" + u + "=" + LP.en(s);
                ++u
            }
            for (u = 0; u < b.length; ++u) {
                o = b[u];
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting newvalues k=" + u + " aid=" + a + " for shareeuid=" + h, null);
                    return false
                }
                k += "&sharee" + g + "valueenc" + u + "=" + LP.en(s)
            }
        }
    }
    if (d.length > 0) {
        d = d[0].getElementsByTagName("sharer");
        k += "&numsharers=" + LP.en(d.length);
        for (g = 0; g < d.length; ++g) {
            j = d[g].getAttribute("uid");
            h = d[g].getAttribute("key");
            o = lpcreaterandomhexstring(64);
            e = lp_hex2bin(o);
            o = lprsa_encryptdata(h, o);
            if (o == false) {
                lpReportError("SHARE : lprsa_encryptdata failed for shareruid=" + j + " using sharerpublickeyhex=" + h, null);
                return false
            }
            k += "&sharer" + g + "uid=" + LP.en(j);
            k += "&sharer" + g + "sharekeyhexenc=" + LP.en(o);
            o = {
                name: c.name,
                grouping: c.group,
                username: typeof g_sites != "undefined" ? lpmdec(c.username, true) : lpdec(c.username),
                password: typeof g_sites != "undefined" ? lpmdec(c.password, true) : lpdec(c.password),
                extra: typeof g_sites != "undefined" ? lpmdec(c.extra, true) : lpdec(c.extra)
            };
            for (n in o) {
                s = lpenc(o[n], e);
                if (o[n] != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting aid=" + a + " for shareruid=" + j, null);
                    return false
                }
                k += "&sharer" + g + n + "=" + LP.en(s)
            }
            u = 0;
            for (p in l) {
                o = lpdec(l[p]);
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting field afid=" + p + " aid=" + a + " for shareruid=" + j, null);
                    return false
                }
                k += "&sharer" + g + "fafid" + u + "=" + LP.en(p);
                k += "&sharer" + g + "fvalue" + u + "=" + LP.en(s);
                ++u
            }
            u = 0;
            for (p in f) {
                o = lpdec(f[p]);
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting otherfield afid=" + p + " aid=" + a + " for shareruid=" + j, null);
                    return false
                }
                k += "&sharer" + g + "ofafid" + u + "=" + LP.en(p);
                k += "&sharer" + g + "ofvalue" + u + "=" + LP.en(s);
                ++u
            }
            for (u = 0; u < b.length; ++u) {
                o = b[u];
                s = lpenc(o, e);
                if (o != "" && (s == null || s == "")) {
                    lpReportError("SHARE : error AES encrypting newvalues k=" + u + " aid=" + a + " for shareruid=" + j, null);
                    return false
                }
                k += "&sharer" + g + "valueenc" + u + "=" + LP.en(s)
            }
        }
    }
    return k
}

function parseAutoPushMobile(a, b) {
    for (var c = 0; a != null && c < a.length; c++) {
        var d = new lpshareeautopushinfo;
        d.fields = [];
        d.otherfields = [];
        var e = true,
            g = ["id", "aid", "sharekeyhexenc", "name", "group", "username", "password", "extra", "url", "rurl", "fav", "never_autofill", "pwprotect", "basic_auth", "autologin", "last_touch", "last_modified", "urid", "last_pw_change", "numf", "numof", "favico", "nexturid", "method", "is_http", "manual"],
            j;
        for (j in g) if (typeof a[c][g[j]] != "undefined") d[g[j]] = a[c][g[j]];
        else if (g[j] == "id" || g[j] == "aid" || g[j] == "sharekeyhexenc") {
            lpReportError("SHARE: shareeautopushes : error missing required arg=" + g[j], null);
            e = false;
            break
        } else d[g[j]] = null;
        if (e) {
            e = d.numf != null ? d.numf : 0;
            for (j = 0; j < e; ++j) {
                g = {};
                g.urid = a[c]["f" + j + "urid"];
                g.name = a[c]["f" + j + "name"];
                g.value = a[c]["f" + j + "value"];
                g.type = a[c]["f" + j + "type"];
                d.fields.push(g)
            }
            e = d.numof != null ? d.numof : 0;
            for (j = 0; j < e; ++j) {
                g = {};
                g.urid = a[c]["of" + j + "urid"];
                g.name = a[c]["of" + j + "name"];
                g.value = a[c]["of" + j + "value"];
                g.type = a[c]["of" + j + "type"];
                g.formname = a[c]["of" + j + "formname"];
                d.otherfields.push(g)
            }
            if (typeof b[d.aid] == "undefined") b[d.aid] = [];
            b[d.aid].push(d)
        }
    }
}

function iso2to3(a) {
    return {
        AD: "AND",
        AE: "ARE",
        AF: "AFG",
        AF: "AFG",
        AG: "ATG",
        AL: "ALB",
        AM: "ARM",
        AO: "AGO",
        AQ: "ATA",
        AR: "ARG",
        AT: "AUT",
        AU: "AUS",
        AW: "ABW",
        AZ: "AZE",
        BA: "BIH",
        BB: "BRB",
        BD: "BGD",
        BE: "BEL",
        BF: "BFA",
        BG: "BGR",
        BH: "BHR",
        BI: "BDI",
        BJ: "BEN",
        BM: "BMU",
        BN: "BRN",
        BO: "BOL",
        BR: "BRA",
        BS: "BHS",
        BT: "BTN",
        BW: "BWA",
        BY: "BLR",
        BZ: "BLZ",
        CA: "CAN",
        CD: "COD",
        CF: "CAF",
        CG: "COG",
        CH: "CHE",
        CI: "CIV",
        CL: "CHL",
        CM: "CMR",
        CN: "CHN",
        CO: "COL",
        CR: "CRI",
        CU: "CUB",
        CV: "CPV",
        CY: "CYP",
        CZ: "CZE",
        DE: "DEU",
        DJ: "DJI",
        DK: "DNK",
        DM: "DMA",
        DO: "DOM",
        DZ: "DZA",
        EC: "ECU",
        EE: "EST",
        EG: "EGY",
        EH: "ESH",
        ER: "ERI",
        ES: "ESP",
        ET: "ETH",
        FI: "FIN",
        FJ: "FJI",
        FM: "FSM",
        FO: "FRO",
        FR: "FRA",
        GA: "GAB",
        GB: "GBR",
        GD: "GRD",
        GE: "GEO",
        GF: "GUF",
        GH: "GHA",
        GM: "GMB",
        GN: "GIN",
        GP: "GLP",
        GQ: "GNQ",
        GR: "GRC",
        GT: "GTM",
        GW: "GNB",
        GY: "GUY",
        HN: "HND",
        HR: "HRV",
        HT: "HTI",
        HU: "HUN",
        ID: "IDN",
        IE: "IRL",
        IL: "ISR",
        IN: "IND",
        IO: "IOT",
        IQ: "IRQ",
        IR: "IRN",
        IS: "ISL",
        IT: "ITA",
        JE: "JEY",
        JM: "JAM",
        JO: "JOR",
        JP: "JPN",
        KE: "KEN",
        KG: "KGZ",
        KH: "KHM",
        KI: "KIR",
        KM: "COM",
        KN: "KNA",
        KP: "PRK",
        KR: "KOR",
        KW: "KWT",
        KZ: "KAZ",
        LA: "LAO",
        LB: "LBN",
        LC: "LCA",
        LI: "LIE",
        LK: "LKA",
        LR: "LBR",
        LS: "LSO",
        LT: "LTU",
        LU: "LUX",
        LV: "LVA",
        LY: "LBY",
        MA: "MAR",
        MC: "MCO",
        MD: "MDA",
        ME: "MNE",
        MG: "MDG",
        MK: "MKD",
        ML: "MLI",
        MM: "MMR",
        MN: "MNG",
        MO: "MAC",
        MQ: "MTQ",
        MR: "MRT",
        MS: "MSR",
        MU: "MUS",
        MV: "MDV",
        MW: "MWI",
        MX: "MEX",
        MY: "MYS",
        MZ: "MOZ",
        NA: "NAM",
        NE: "NER",
        NG: "NGA",
        NI: "NIC",
        NL: "NLD",
        NO: "NOR",
        NP: "NPL",
        NZ: "NZL",
        OM: "OMN",
        PA: "PAN",
        PE: "PER",
        PG: "PNG",
        PH: "PHL",
        PK: "PAK",
        PL: "POL",
        PS: "PSE",
        PT: "PRT",
        PW: "PLW",
        PY: "PRY",
        QA: "QAT",
        RE: "REU",
        RO: "ROU",
        RS: "SRB",
        RU: "RUS",
        RW: "RWA",
        SA: "SAU",
        SB: "SLB",
        SC: "SYC",
        SD: "SDN",
        SE: "SWE",
        SH: "SHN",
        SI: "SVN",
        SK: "SVK",
        SL: "SLE",
        SM: "SMR",
        SN: "SEN",
        SO: "SOM",
        SR: "SUR",
        ST: "STP",
        SV: "SLV",
        SY: "SYR",
        SZ: "SWZ",
        TD: "TCD",
        TF: "ATF",
        TG: "TGO",
        TH: "THA",
        TJ: "TJK",
        TL: "TLS",
        TM: "TKM",
        TN: "TUN",
        TR: "TUR",
        TT: "TTO",
        TW: "TWN",
        TZ: "TZA",
        UA: "UKR",
        UG: "UGA",
        US: "USA",
        UY: "URY",
        UZ: "UZB",
        VC: "VCT",
        VE: "VEN",
        VN: "VNM",
        VU: "VUT",
        YE: "YEM",
        ZA: "ZAF",
        ZM: "ZMB",
        ZW: "ZWE"
    }[a]
}

function crypto_atob(a) {
    if (a && a.length >= 17 && a.charAt(0) == "!") {
        var b = a.indexOf("|");
        if (b != -1) return "!" + atob(a.substring(1, b)) + atob(a.substring(b + 1))
    }
    return atob(a)
}
function crypto_btoa(a) {
    return a && a.length >= 33 && a.length % 16 == 1 && a.charAt(0) == "!" ? "!" + btoa(a.substring(1, 17)) + "|" + btoa(a.substring(17)) : btoa(a)
}

function CompareLastPassVersions(a, b, c) {
    var d = 0,
        e = 0,
        g = 0,
        j = 0,
        k = 0,
        l = 0,
        f = a.split(".");
    for (a = 0; a < f.length; a++) if (a == 0) d = parseInt(f[a]);
    else if (a == 1) e = parseInt(f[a]);
    else if (a == 2) g = parseInt(f[a]);
    b = b.split(".");
    for (a = 0; a < b.length; a++) if (a == 0) j = parseInt(b[a]);
    else if (a == 1) k = parseInt(b[a]);
    else if (a == 2) l = parseInt(b[a]);
    if (d != j) return d > j ? 1 : -1;
    if (e != k) return e > k ? 1 : -1;
    if (c) return 0;
    if (g != l) return g > l ? 1 : -1;
    return 0
}
var lpffregexpnames = ["combineddummy", "phoneext", "gender", "ssn1", "ssn2", "ssn3", "ssn", "birthyear", "birthmonth", "birthday", "birthdate", "city", "county", "state", "zip1", "zip2", "zip", "country", "email", "mobileemail", "housenumbername", "housenumber", "housename", "address1", "ccphone", "address2", "address3", "mobilephone1", "mobilephone2", "mobilephone3", "mobilephone", "evephone1", "evephone2", "evephone3", "evephone", "phone1", "phone2", "phone3", "phone", "fax1", "fax2", "fax3", "fax", "title", "ccname", "ccnum1", "ccnum2", "ccnum3", "ccnum4", "cccsc", "ccnum", "ccstartmonth", "ccstartyear", "ccstart", "ccexpmonth", "ccexpyear", "ccexp", "cctype", "ccissuenum", "firstname3", "firstname2", "firstname", "middlename", "middleinitial", "lastname3", "lastname2", "lastname", "fulllastname", "address", "company", "username", "bankname", "addrbookname", "name", "age", "timezone", "bankacctnum", "bankroutingnum"],
    lpffdummyregexpnames = ["securityanswer", "promocode", "maiden", "comments", "invoice", "addrbookname", "emailalert", "combineddummy"],
    lpffregexpparents = [];
lpffregexpparents.ssn1 = lpffregexpparents.ssn2 = lpffregexpparents.ssn3 = "ssn";
lpffregexpparents.birthyear = lpffregexpparents.birthmonth = lpffregexpparents.birthday = "birthdate";
lpffregexpparents.address1 = lpffregexpparents.address2 = lpffregexpparents.address3 = "address";
lpffregexpparents.phone1 = lpffregexpparents.phone2 = lpffregexpparents.phone3 = lpffregexpparents.phone23 = "phone";
lpffregexpparents.evephone1 = lpffregexpparents.evephone2 = lpffregexpparents.evephone3 = lpffregexpparents.evephone23 = "evephone";
lpffregexpparents.mobilephone1 = lpffregexpparents.mobilephone2 = lpffregexpparents.mobilephone3 = lpffregexpparents.mobilephone23 = "mobilephone";
lpffregexpparents.fax1 = lpffregexpparents.fax2 = lpffregexpparents.fax3 = lpffregexpparents.fax23 = "fax";
lpffregexpparents.ccnum1 = lpffregexpparents.ccnum2 = lpffregexpparents.ccnum3 = lpffregexpparents.ccnum4 = "ccnum";
lpffregexpparents.ccexpmonth = lpffregexpparents.ccexpyear = "ccexp";
lpffregexpparents.ccstartmonth = lpffregexpparents.ccstartyear = "ccstart";
lpffregexpparents.firstname = lpffregexpparents.middlename = lpffregexpparents.middleinitial = lpffregexpparents.lastname = lpffregexpparents.lastname2 = "name";
lpffregexpparents.zip1 = lpffregexpparents.zip2 = "zip";
lpffregexpparents.lastname = lpffregexpparents.lastname2 = "fulllastname";
var lpffregexps = [],
    lpfftextregexps = [],
    lastname2_index = -1,
    lastname3_index = -1;

function lptofillinfo() {}

function lpCheckFormFill(a, b, c, d, e, g, j, k, l) {
    var f = typeof l == "string" ? true : false;
    l = typeof l == "string" ? l : "";
    if (typeof g == "undefined" || g == null) g = 1;
    if (g > 10) return false;
    if (!a && !j) return false;
    var p = null;
    if (typeof LP == "object" && !LP.isFennec && LP.getBrowser().selectedTab == null) return false;
    var o = null;
    if (typeof LP == "object") o = LP.isFennec ? a : LP.getBrowser().selectedTab.linkedBrowser;
    var h = o && o.contentDocument ? o.contentDocument : null;
    try {
        if (typeof j == "undefined" || j == null) j = a.contentWindow;
        p = a ? LP.lpgetcurrenturl(a) : j.location.href;
        if (typeof lpformfills != "undefined" && lpformfills.length == 0 && !f) {
            if (o) {
                var n = o.contentDocument;
                if (n) n.m_abortedFormFillChecking = true
            }
            return false
        }
        var s = b.getElementsByTagName("form");
        if (h && !c) if (typeof h.m_checkfillformresult != "undefined" && h.m_checkfillformnumforms == s.length) return h.m_checkfillformresult;
        if (!c && typeof lpShowFormFillNotifications != "undefined" && !lpShowFormFillNotifications) {
            if (o) if (n = o.contentDocument) n.m_abortedFormFillChecking = true;
            if (h) {
                h.m_checkfillformresult = false;
                h.m_checkfillformnumforms = s.length
            }
            return false
        }
        if (!c && !d && typeof lp_notification_exists != "undefined" && (lp_notification_exists(a, "autologin") || lp_notification_exists(a, "generate") || lp_notification_exists(a, "formfill"))) {
            if (o) if (n = o.contentDocument) n.m_abortedFormFillChecking = true;
            if (h) {
                h.m_checkfillformresult = false;
                h.m_checkfillformnumforms = s.length
            }
            return false
        }
        n = null;
        if (e) for (var u = 0; u < lpformfills.length; u++) {
            if (lpformfills[u].ffid == e) {
                n = lpformfills[u];
                break
            }
        } else if (typeof lpformfills != "undefined" && !f) n = lpformfills[0];
        var t, y;
        t = p.indexOf("https://") == 0 ? y = true : y = false;
        if (!c) {
            var J = lpParseUri(p),
                G = lpcanonizeUrl(p, J),
                H = lp_gettld(J.host, p);
            if (typeof never_ff != "undefined" && never_ff(G, H)) {
                if (h) {
                    h.m_checkfillformresult = false;
                    h.m_checkfillformnumforms = s.length
                }
                return false
            }
        }
        lpFormFillInitRegexps("en-US");
        J = null;
        var w = lpffregexps["en-US"],
            I = lpfftextregexps["en-US"];
        G = lpffregexpnames;
        if (e) for (u = 0; u < lpformfills.length; u++) {
            if (lpformfills[u].ffid == e) {
                n = lpformfills[u];
                var C = lpdec(n.profilelanguage);
                if (C.length == 5) J = C;
                J != "en-US" && lpFormFillInitRegexps(J);
                w = lpffregexps[J];
                I = lpfftextregexps[J];
                if (typeof n.customfields != "undefined" && n.customfields.length > 0) {
                    w = [];
                    I = [];
                    G = [];
                    for (var x = 0; x < lpffregexps[J].length; x++) {
                        w[x] = lpffregexps[J][x];
                        I[x] = lpfftextregexps[J][x];
                        G[x] = lpffregexpnames[x]
                    }
                    for (x = 0; x < n.customfields.length; x++) {
                        var v = lpdec(n.customfields[x].text),
                            T = lpdec(n.customfields[x].alttext).split(/\r\n|\r|\n/g);
                        T.unshift(v);
                        H = C = "";
                        for (var F = 0; F < T.length; F++) {
                            v = lptrim(T[F]);
                            if (v != "") {
                                C += H + lp_regexp_quote(v);
                                H = "|"
                            }
                        }
                        if (C != "") {
                            w[w.length] = RegExp(C, "i");
                            I[I.length] = RegExp(C, "i");
                            G[G.length] = "customfield" + x
                        }
                    }
                }
                break
            }
        } else if (f) {
            n = new lpformfillinfo;
            n.ffid = "0";
            n.profiletype = "";
            n.profilename = "translation";
            n.profilelanguage = lpenc(l);
            n.firstname = lpenc("firstname");
            n.firstname2 = lpenc("firstname2");
            n.firstname3 = lpenc("firstname3");
            n.middlename = lpenc("middlename");
            n.lastname = lpenc("lastname");
            n.lastname2 = lpenc("lastname2");
            n.lastname3 = lpenc("lastname3");
            n.email = lpenc("email");
            n.mobileemail = lpenc("mobileemail");
            n.company = lpenc("company");
            n.ssn = lpenc("ssn");
            n.birthday = lpenc("birthday");
            n.address1 = lpenc("address1");
            n.address2 = lpenc("address2");
            n.address3 = lpenc("address3");
            n.city = lpenc("city");
            n.county = lpenc("county");
            n.state = lpenc("state");
            n.state_name = lpenc("state_name");
            n.zip = lpenc("zip");
            n.country = lpenc("country");
            n.country_cc3l = lpenc("country_cc3l");
            n.country_name = lpenc("country_name");
            n.countryphone = "countryphone";
            n.countryevephone = "countryevephone";
            n.countryfaxphone = "countryfaxphone";
            n.countrymobphone = "countrymobphone";
            n.phoneext = lpenc("phoneext");
            n.evephoneext = lpenc("evephoneext");
            n.faxphoneext = lpenc("faxphoneext");
            n.mobilephoneext = lpenc("mobilephoneext");
            n.phone = lpenc("phone");
            n.evephone = lpenc("evephone");
            n.fax = lpenc("fax");
            n.mobilephone = lpenc("mobilephone");
            n.ccname = lpenc("ccname");
            n.ccnum = lpenc("ccnum");
            n.ccstart = lpenc("ccstart");
            n.ccexp = lpenc("ccexp");
            n.cccsc = lpenc("cccsc");
            n.ccissuenum = lpenc("ccissuenum");
            n.username = lpenc("username");
            n.gender = lpenc("gender");
            n.title = lpenc("title");
            n.pwprotect = "0";
            n.customfields = [];
            n.timezone = lpenc("timezone");
            n.bankname = lpenc("bankname");
            n.bankacctnum = lpenc("bankacctnum");
            n.bankroutingnum = lpenc("bankroutingnum");
            n.notes = lpenc("notes");
            C = l;
            if (C.length == 5) J = C;
            J != "en-US" && lpFormFillInitRegexps(J);
            w = lpffregexps[J];
            I = lpfftextregexps[J]
        }
        C = T = v = null;
        try {
            if (c) if (j.getSelection) {
                v = j.getSelection();
                if (v.toString() == "") v = T = C = null;
                else {
                    if (v.getRangeAt) T = v.getRangeAt(0);
                    if (b.createRange) C = b.createRange()
                }
            } else if (b.selection) {
                v = b.selection.createRange();
                C = b.body.createTextRange();
                if (v.text == "") v = T = C = null
            }
        } catch (P) {
            v = T = C = null
        }
        H = {};
        H.value = 0;
        o = {};
        o.value = 0;
        var S = {},
            A = {},
            U = {},
            z = {};
        S.value = false;
        A.value = false;
        U.value = false;
        z.value = false;
        for (u = 0; u < s.length + 1; u++) {
            var R = u < s.length ? s[u] : null,
                W;
            if (R != null) W = R.elements;
            else {
                W = [];
                var N = ["input", "select", "textarea"];
                for (x = 0; x < N.length; x++) {
                    var Q = b.getElementsByTagName(N[x]);
                    for (F = 0; F < Q.length; F++) if (typeof Q[F].form == "unknown" || Q[F].form == null) W[W.length] = Q[F]
                }
            }
            if (typeof W != "undefined") {
                var q = {};
                q.value = 0;
                N = [];
                for (F = 0; F < w.length; F++) N[G[F]] = 0;
                var D = [],
                    B = {};
                B.value = false;
                var aa = populateToFillForFormFill(W, a, q, N, D, B, c, v, T, C, o, w, G, I, H, d, S, A, U, z, j);
                if (aa == 0) {
                    if (h) {
                        h.m_checkfillformresult = false;
                        h.m_checkfillformnumforms = s.length
                    }
                    return false
                } else if (aa == 1) {
                    if (h) {
                        h.m_checkfillformresult = true;
                        h.m_checkfillformnumforms = s.length
                    }
                    return true
                }
                if (c) {
                    B = "birthday";
                    var r = "birthmonth";
                    if (n && lpdec(n.country) == "US") {
                        B = "birthmonth";
                        r = "birthday"
                    }
                    q = [];
                    if (lastname2_index == -1 || w[lastname2_index] == null || lastname3_index == -1 || w[lastname3_index] == null) {
                        q[q.length] = ["name", "name", "name", "firstname", "middlename", "lastname"];
                        q[q.length] = ["firstname", "firstname", "lastname", "firstname", "middlename", "lastname"];
                        q[q.length] = ["firstname", "lastname", "lastname", "firstname", "middlename", "lastname"];
                        q[q.length] = ["name", "name", "firstname", "lastname"];
                        q[q.length] = ["name", "lastname", "firstname", "lastname"];
                        q[q.length] = ["lastname", "lastname", "lastname", "firstname", "middlename", "lastname"];
                        q[q.length] = ["lastname", "lastname", "firstname", "lastname"];
                        q[q.length] = ["firstname", "firstname", "firstname", "lastname"];
                        q[q.length] = ["firstname", "lastname", "firstname", "firstname", "middlename", "lastname"];
                        q[q.length] = ["firstname", "name", "firstname", "lastname"]
                    } else {
                        q[q.length] = ["name", "lastname", "lastname", "firstname", "lastname", "lastname2"];
                        q[q.length] = ["name", "lastname", "lastname2", "firstname", "lastname", "lastname2"];
                        q[q.length] = ["name", "lastname", "firstname", "fulllastname"];
                        q[q.length] = ["firstname", "lastname", "lastname", "firstname", "lastname", "lastname2"];
                        q[q.length] = ["fulllastname", "fulllastname", "lastname", "lastname2"]
                    }
                    q[q.length] = ["address", "address", "address", "address1", "address2", "address3"];
                    q[q.length] = ["address2", "address2", "address", "address1", "address2", "address3"];
                    q[q.length] = ["address1", "address3", "address2", "address1", "address2", "address3"];
                    q[q.length] = ["address", "address", "address1", "address2"];
                    q[q.length] = ["address", "address2", "address1", "address2"];
                    q[q.length] = ["address1", "address1", "address1", "address2"];
                    q[q.length] = ["address", "address1", "address1", "address2"];
                    q[q.length] = ["address2", "address2", "address1", "address2"];
                    q[q.length] = ["address1", "address3", "address1", "address2"];
                    q[q.length] = ["address", "address3", "address1", "address2"];
                    q[q.length] = ["ssn", "ssn", "ssn", "ssn1", "ssn2", "ssn3"];
                    q[q.length] = ["zip", "zip", "zip1", "zip2"];
                    q[q.length] = ["birthmonth", "birthdate", "birthyear", B, r, "birthyear"];
                    q[q.length] = ["birthday", "birthday", "birthday", B, r, "birthyear"];
                    q[q.length] = ["birthdate", "birthdate", "birthdate", B, r, "birthyear"];
                    q[q.length] = ["birthdate", "birthdate", "birthyear", B, r, "birthyear"];
                    q[q.length] = ["birthday", "birthday", B, r];
                    q[q.length] = ["birthdate", "birthdate", B, r];
                    for (B = 1; B <= 4; B++) {
                        r = "evephone";
                        if (2 == B) r = "phone";
                        if (3 == B) r = "fax";
                        if (4 == B) r = "mobilephone";
                        q[q.length] = [r, r, r, r + "1", r + "2", r + "3"];
                        q[q.length] = [r + "1", r + "2", r, r + "1", r + "2", r + "3"];
                        q[q.length] = [r + "1", r + "1", r + "2", r + "1", r + "2", r + "3"];
                        q[q.length] = [r + "1", r + "1", r + "1", r + "1", r + "2", r + "3"];
                        q[q.length] = [r + "1", r, r, r + "1", r + "2", r + "3"];
                        q[q.length] = [r, r, r + "2", r + "1", r + "2", r + "3"];
                        q[q.length] = [r, r + "2", r + "3", r + "1", r + "2", r + "3"];
                        q[q.length] = [r, r + "2", r, r + "1", r + "2", r + "3"];
                        q[q.length] = [r, r + "3", r, r + "1", r + "2", r + "3"];
                        q[q.length] = [r, r, r + "1", r + "23"]
                    }
                    q[q.length] = ["ccnum", "ccnum", "ccnum", "ccnum", "ccnum1", "ccnum2", "ccnum3", "ccnum4"];
                    q[q.length] = ["ccnum", "ccnum", "ccnum", "ccnum1", "amexccnum2", "amexccnum3"];
                    q[q.length] = ["ccexp", "ccexp", "ccexpmonth", "ccexpyear"];
                    q[q.length] = ["ccexp", "ccexpyear", "ccexpmonth", "ccexpyear"];
                    q[q.length] = ["ccexpyear", "ccexpyear", "ccexpmonth", "ccexpyear"];
                    q[q.length] = ["ccstart", "ccstart", "ccstartmonth", "ccstartyear"];
                    q[q.length] = ["ccstart", "ccstartyear", "ccstartmonth", "ccstartyear"];
                    q[q.length] = ["cctype", "cctype", "cctype", "firstname", "middlename", "lastname"];
                    if (A.value || S.value || z.value || U.value) {
                        B = true;
                        for (x = 0; x < D.length; x++) {
                            if (D[x].namematch == "country" && D[x].textmatch == "country") B = false;
                            if (D[x].namematch == "state" && D[x].textmatch == "state") B = false
                        }
                        if (B) {
                            B = [];
                            r = [];
                            for (x = 0; x < D.length; x++) {
                                var X = D[x].namematch,
                                    E = D[x].textmatch;
                                if ("" != X) r[X] = 1;
                                if ("" != E) B[E] = 1
                            }
                            var Z = array_size(r),
                                da = array_size(B);
                            if (Z > da) for (x = 0; x < D.length; x++) if (D[x].namematch) D[x].regexpname = D[x].namematch
                        }
                    }
                    CheckForLoners(D);
                    for (x = 0; x < D.length; x++) {
                        var V = D[x],
                            M = V.elt;
                        if (lpIsVisible(M)) {
                            var K = V.regexpname;
                            B = false;
                            for (F = 0; F < q.length; F++) {
                                var $ = q[F];
                                if ($.length % 2 == 0) if (K == $[0]) {
                                    var ba = $.length / 2;
                                    if (!(x >= D.length - (ba - 1))) if (!($[0] == "cctype" && $[3] == "firstname" && (M.type == "select-one" || M.type == "radio"))) {
                                        for (r = 0; r < ba; r++) {
                                            if (!check_size_or_maxlen(D[x + r].elt, $[ba + r])) break;
                                            if (r >= 1) if (D[x + r].regexpname != $[r] || !D[x + r].last_field_filled) break
                                        }
                                        if (!(r < ba)) {
                                            K = $[ba];
                                            for (r = 1; r < ba; r++) D[x + r].regexpname = $[ba + r];
                                            B = true;
                                            break
                                        }
                                    }
                                }
                            }
                            if (!B && K == "cctype" && M.type != "select-one" && M.type != "radio") {
                                for (var Y = false, O = 0; O < D.length; O++) if (D[O].regexpname.indexOf("ccnum") == 0) {
                                    Y = true;
                                    break
                                }
                                Y || (K = "ccnum")
                            } else if (!B && K == "bankacctnum") {
                                r = B = Y = false;
                                for (O = 0; O < D.length; O++) if (D[O].regexpname.indexOf("ccnum") == 0) {
                                    Y = true;
                                    break
                                } else if (D[O].regexpname.indexOf("cc") == 0) B = true;
                                else if (D[O].regexpname.indexOf("bank") == 0 && D[O].regexpname != "bankacctnum") {
                                    r = true;
                                    break
                                }
                                if (!Y && B && !r) K = "ccnum"
                            } else if (!B && K == "cccsc") {
                                Y = false;
                                for (O = 0; O < D.length; O++) if (D[O].regexpname.indexOf("ccnum") == 0) {
                                    Y = true;
                                    break
                                }
                                if (!Y) continue
                            } else if (!B && K.indexOf("ccnum") == 0 && M.type == "select-one") K = "cctype";
                            else if (K == "address3" && n.address3 == "" && n.city != "") {
                                B = false;
                                for (O = 0; O < D.length; O++) if (D[O].regexpname == "city") {
                                    B = true;
                                    break
                                }
                                B || (K = "city")
                            } else if (K == "address" && M.type == "textarea") {
                                B = false;
                                for (O = 0; O < D.length; O++) if (D[O].regexpname == "city" || D[O].regexpname == "county" || D[O].regexpname == "state") {
                                    B = true;
                                    break
                                }
                                B || (K = "fulladdress")
                            }
                            if (typeof lpdonotoverwritefilledfields != "undefined" && lpdonotoverwritefilledfields) if (("email" == M.type || "text" == M.type || "password" == M.type || "textarea" == M.type) && M.value != "") continue;
                            else if (M.type == "select-one" && M.selectedIndex != 0) continue;
                            else if ((M.type == "checkbox" || M.type == "radio") && M.checked) continue;
                            if (K.indexOf("cc") == 0) if (t && !y) continue;
                            else if (!t || !y) {
                                B = K;
                                if (typeof lpffregexpparents[K] != "undefined") B = lpffregexpparents[K];
                                else if (K == "cctype") B = "ccnum";
                                if (n && typeof n[B] != "undefined" && n[B] != "") {
                                    if (!t) {
                                        y = lpConfirmYesNo(lpgs("InsecureSite", J)) ? true : false;
                                        t = true
                                    }
                                    if (!y) continue
                                }
                            }
                            var fa = M.value;
                            lpFillFormField(h, M, K, e, k, J, f, n, l);
                            if (M.value != fa) {
                                if (typeof N[K] == "undefined") N[K] = 0;
                                N[K]++
                            }
                        }
                    }
                }
            }
        }
        if (j && j.frames && (!c || v == null)) for (u = 0; u < j.frames.length; u++) try {
            if (j.frames[u].document) {
                var ea = lpCheckFormFill(a, j.frames[u].document, c, d, e, g + 1, j.frames[u].window, k);
                if (ea && !c) {
                    if (h) {
                        h.m_checkfillformresult = ea;
                        h.m_checkfillformnumforms = s.length
                    }
                    return ea
                }
            }
        } catch (ga) {}
        c && typeof lploglogins != "undefined" && lploglogins && g == 1 && lplogformfill(e)
    } catch (ca) {
        lpReportError("Failure with checking formfill: " + ca + " ln: " + ca.lineNumber, p)
    }
    if (!c) {
        if (h) {
            h.m_checkfillformresult = false;
            h.m_checkfillformnumforms = s.length
        }
        return false
    }
}
function DoFillReplace(a, b) {
    for (var c = a[0], d = 0; d < a.length; d++) for (var e = 0; e < b.length; e++) if (b[e].regexpname == a[d]) {
        b[e].regexpname = c;
        if (b[e].namematch == a[d]) b[e].namematch = c;
        if (b[e].textmatch == a[d]) b[e].textmatch = c
    }
}

function CheckForLoners(a) {
    var b = [];
    b[b.length] = ["birthdate", "birthday", "birthmonth"];
    for (var c = "", d = 0; d < a.length; d++) c += "," + a[d].regexpname;
    for (d = 0; d < b.length; d++) {
        for (var e = 0, g = 1; g < b[d].length; g++) e += c.indexOf("," + b[d][g]) == -1 ? 0 : 1;
        e == 1 && DoFillReplace(b[d], a)
    }
}

function populateToFillForFormFill(a, b, c, d, e, g, j, k, l, f, p, o, h, n, s, u, t, y, J, G, H) {
    for (var w = a.length, I = 0, C = 0; C < w; C++) {
        var x = false,
            v = a[C];
        if ("email" == v.type || v.type == "text" || v.type == "password" || v.type == "select-one" || v.type == "textarea" || v.type == "radio") if (!(v.type == "select-one" && v.disabled == true)) {
            if (++I > 100) break;
            var T = getname(v),
                F = false;
            if (T != "") {
                try {
                    if (j && k != null) if (H.navigator.userAgent.indexOf("Opera") != -1) {
                        f.setStart(v, 0);
                        f.setEnd(v, 0);
                        var P = l.compareBoundaryPoints(Range.START_TO_START, f),
                            S = l.compareBoundaryPoints(Range.END_TO_END, f);
                        if (P > 0 || S < 0) continue
                    } else if (typeof k.containsNode == "function") {
                        if (!k.containsNode(v, true)) continue
                    } else if (f != null && typeof f.moveToElementText != "undefined") {
                        var A = v;
                        if (A.type == "select-one") {
                            for (var U = A.previousSibling, z = false; U;) {
                                if (U.nodeType == 1 && U.tagName != "SELECT") {
                                    A = U;
                                    z = true;
                                    break
                                }
                                U = U.previousSibling
                            }
                            if (!z) A = A.parentNode
                        }
                        f.moveToElementText(A);
                        P = k.compareEndPoints("StartToStart", f);
                        S = k.compareEndPoints("EndToEnd", f);
                        if (P > 0 || S < 0) continue
                    }
                } catch (R) {}
                var W = 0,
                    N = 0;
                if (typeof v.size != "undefined") W = parseInt(v.size);
                if (typeof v.maxLength != "undefined") N = parseInt(v.maxLength);
                if (W <= 0 && N <= 0 && v.style) {
                    A = v.style.width;
                    if (A.match(/^\d+px$/)) {
                        A = parseInt(A.substring(0, A.length - 2));
                        if (A % 10 == 0) W = A / 10
                    }
                }
                z = false;
                A = [];
                var Q = [],
                    q = false,
                    D = true,
                    B = "";
                if (j || ++p.value <= 5) if (j) B = lpGetTextBeforeFormField(v);
                if (!j && p.value > 20) return false;
                var aa = 2,
                    r = 1;
                j || (aa = r = B != "" ? 2 : 1);
                if (typeof o != "undefined" && typeof o.length != "undefined") for (var X = 0; X < o.length && D && !z; X++) if (o[X] != null) {
                    var E = h[X];
                    if (!(v.type == "radio" && E != "gender" && E != "cctype" && E.indexOf("customfield") != 0)) if (!(v.type == "select-one" && E != "state" && E != "country" && E != "cctype" && E != "timezone" && E != "city" && E.indexOf("birth") != 0 && E != "title" && E.indexOf("ccexp") != 0 && E.indexOf("ccstart") != 0 && E != "gender" && E != "age" && E.indexOf("customfield") != 0)) if (!(v.type == "password" && E.indexOf("ccnum") != 0 && E != "cccsc" && E != "ccissuenum" && E != "cctype" && E != "bankacctnum" && E.indexOf("customfield") != 0)) if (!((v.type == "text" || v.type == "textarea" || "email" == v.type) && (E == "cctype" || E == "timezone" || E == "gender"))) if (check_size_or_maxlen(v, E, true, W, N)) if (!(E.indexOf("address") == 0 && N > 0 && N < 15)) {
                        for (var Z = false, da = false, V = aa; V >= r; V--) {
                            if (V == 1 && !Z && Q.length > 0 && v.type != "select-one") break;
                            var M;
                            if (V == 1) M = T;
                            else if (V == 2) {
                                M = B;
                                if (M == "") continue
                            }
                            var K = 1 == V ? o[X] : n[X];
                            if ((typeof d[E] == "undefined" || d[E] < 2) && regexp_match_c(K, M)) {
                                if (V == 2 && (E == "evephone" || E == "mobilephone")) q = true;
                                if (V == 2 && E == "phone" && q) break;
                                if (!j && !F) {
                                    if (!lpIsVisible(v)) {
                                        D = false;
                                        x = g.value;
                                        break
                                    }
                                    F = true
                                }
                                if (!lp_in_array(E, lpffdummyregexpnames)) {
                                    s.value++;
                                    c.value++
                                }
                                if (j) if (V == 1) {
                                    A[A.length] = E;
                                    da = true
                                } else {
                                    Q[Q.length] = E;
                                    Z = true
                                } else {
                                    if (typeof d[E] == "undefined") d[E] = 0;
                                    d[E]++;
                                    if (s.value >= 3) {
                                        if (!u && (typeof lp_notification_exists == "undefined" || !lp_notification_exists(b, "addconfirm"))) if (lpNotificationsAfterClick) {
                                            a = typeof LP != "undefined" ? LP.getBrowser().selectedTab.linkedBrowser.contentDocument : document;
                                            a.LPlpfillforms = true;
                                            setupFocusEvent(a)
                                        } else lp_showNotification("FillableFormDetected", b, 0, "formfill");
                                        if (b) b.contentDocument.ffidindex = -1;
                                        else document.ffidindex = -1;
                                        return true
                                    }
                                    z = true;
                                    break
                                }
                            }
                        }
                        if (Z && da) break
                    }
                }
                if (j && D) {
                    F = [];
                    for (z = 0; z < Q.length; z++) if (lp_in_array(Q[z], A)) F[F.length] = Q[z];
                    else if (typeof lpffregexpparents[Q[z]] != "undefined" && lp_in_array(lpffregexpparents[Q[z]], A)) F[F.length] = Q[z];
                    z = null;
                    if (F.length > 0) z = F[0];
                    else if (Q.length > 0) z = Q[0];
                    else if (A.length > 0) {
                        if (A[0].indexOf("ccnum") == 0 && v.type == "select-one") for (z = 1; z < A.length; z++) if (A[z].indexOf("ccexp") == 0) {
                            A.shift();
                            break
                        }
                        z = A[0]
                    }
                    if (z != null) {
                        if (z == "name" && lp_in_array("name", F) && lp_in_array("company", Q)) z = "company";
                        if (z == "ccexp" && v.type == "select-one" && lp_in_array("ccexp", Q) && lp_in_array("cctype", A)) if (v.options.length != 12 && v.options.length != 13) {
                            for (x = 0; x < v.options.length; x++) if (v.options[x].value.match(/^(?:\d{1,2}|\d{4}|\d{2}\/?(?:\d{2}|\d{4}))$/) || v.options[x].text.match(/^(?:\d{1,2}|\d{4}|\d{2}\/?(?:\d{2}|\d{4}))$/)) break;
                            if (x == v.options.length) z = "cctype"
                        }
                        if (z == "ccexp" && v.type == "text" && lp_in_array("ccexp", Q) && lp_in_array("cccsc", A) && typeof v.maxLength != "undefined" && v.maxLength >= 3 && v.maxLength <= 4) z = "cccsc";
                        x = new lptofillinfo;
                        x.elt = v;
                        x.regexpname = z;
                        x.last_field_filled = g.value;
                        z = F = "";
                        if (Q.length > 0) z = Q[0];
                        if (A.length > 0) {
                            if ("state" == A[0] && z != "state" && "select-one" == v.type) y.value = true;
                            if ("country" == A[0] && z != "country" && "select-one" == v.type) t.value = true;
                            if ("ccexpmonth" == A[0] && z != "ccexpmonth" && z != "ccexp" && "select-one" == v.type) J.value = true;
                            if ("ccexpyear" == A[0] && z != "ccexpyear" && z != "ccexp" && "select-one" == v.type) G.value = true;
                            F = A[0]
                        }
                        x.namematch = F;
                        x.textmatch = z;
                        e[e.length] = x;
                        x = true
                    }
                }
            }
            g.value = x
        }
    }
    return 2
}

function lpClearForms(a, b, c, d) {
    if (typeof c == "undefined" || c == null) c = 1;
    if (c > 10) return false;
    if (!a && !d || !b) return false;
    for (var e = ["input", "select"], g = 0; g < e.length; g++) for (var j = b.getElementsByTagName(e[g]), k = 0; k < j.length; k++) {
        var l = j[k];
        if (!l.readOnly && !l.disabled) if ("email" == l.type || l.type == "text" || l.type == "password") {
            if (l.value != "") {
                l.value = "";
                fire_onchange(l)
            }
        } else if (l.type == "select-one") {
            if (l.selectedIndex != 0) {
                l.selectedIndex = 0;
                fire_onchange(l)
            }
        } else if (l.type == "radio" || l.type == "checkbox") if (l.checked) {
            l.checked = false;
            fire_onchange(l)
        }
    }
    if (typeof d == "undefined" || d == null) d = a.contentWindow;
    if (d && d.frames) for (g = 0; g < d.frames.length; g++) d.frames[g].document && lpClearForms(a, d.frames[g].document, c + 1, d.frames[g].window)
}
var g_lastmodifiedlocalefile = {},
    g_overrideregexps = {};

function lpFormFillInitRegexps(a) {
    var b = false;
    if (typeof lpLastModifiedFile == "function") {
        var c = lpLastModifiedFile(a + ".properties");
        if (c) if (typeof g_lastmodifiedlocalefile[a] == "undefined" || g_lastmodifiedlocalefile[a] < c) {
            b = true;
            g_lastmodifiedlocalefile[a] = c;
            g_overrideregexps[a] = {};
            if (c = lpReadFile(a + ".properties", null, 1)) {
                c = c.replace("\r", "");
                var d = c.split("\n"),
                    e = d.length;
                for (c = 0; c < e; ++c) {
                    var g = d[c];
                    if (g.indexOf("ff_") == 0) {
                        var j = g.indexOf("=");
                        if (j != -1) {
                            var k = g.substring(0, j);
                            g = g.substring(j + 1);
                            g_overrideregexps[a][k] = g
                        }
                    }
                }
            }
        }
    }
    if (b || typeof lpffregexps[a] == "undefined") {
        lpffregexps[a] = [];
        lpfftextregexps[a] = []
    }
    if (!(lpffregexps[a].length > 0)) for (c = 0; c < lpffregexpnames.length; c++) {
        b = "ff_" + lpffregexpnames[c] + "_regexp";
        d = lpgs(b, a, true);
        if (typeof g_overrideregexps[a] != "undefined" && typeof g_overrideregexps[a][b] != "undefined") d = g_overrideregexps[a][b];
        lpffregexps[a][c] = d.length ? RegExp(d, "i") : null;
        if (lpffregexpnames[c] == "lastname2") lastname2_index = c;
        if (lpffregexpnames[c] == "lastname3") lastname3_index = c;
        b = "ff_text_" + lpffregexpnames[c] + "_regexp";
        d = lpgs(b, a, true);
        if (typeof g_overrideregexps[a] != "undefined" && typeof g_overrideregexps[a][b] != "undefined") d = g_overrideregexps[a][b];
        lpfftextregexps[a][c] = d.length && d != b ? RegExp(d, "i") : lpffregexps[a][c]
    }
}

function lpGetTextBeforeFormField(a) {
    var b = "";
    try {
        if (a.id != "" && typeof a.ownerDocument != "undefined" && a.ownerDocument != null) for (var c = a.ownerDocument.getElementsByTagName("label"), d = 0; d < c.length; d++) if (c[d].htmlFor == a.id) {
            var e = strip(lpGetText(c[d], a, false, true));
            if (e.length >= 2) return e;
            break
        }
        var g = a.parentNode;
        if (g && (g.tagName == "DIV" || g.tagName == "SPAN")) g = g.parentNode;
        if (g && "TD" == g.tagName) {
            var j = strip(lpGetText(g, a, false, true));
            if (j.length >= 2) return j;
            var k = g.parentNode,
                l = strip(lpGetText(k, a, false, true));
            if (l.length >= 2) return l;
            j = c = -1;
            var f = g.offsetParent;
            if (f) for (l = 0; l < f.rows.length; l++) if (k == f.rows[l]) {
                c = l;
                break
            }
            for (l = 0; l < k.cells.length; l++) if (typeof k.cells[l] != "undefined" && g == k.cells[l]) {
                j = l;
                break
            }
            g = 0;
            if (c > 0 && j != -1) {
                for (d = l = k = 0; d <= j; d++) {
                    var p = f.rows[c].cells[d],
                        o = 1;
                    if (p && typeof p.colSpan == "number") o = p.colSpan;
                    if (d < j) k += o;
                    else l = k + o - 1
                }
                var h = 0;
                for (d = 0; d <= l; d++) {
                    p = f.rows[c - 1].cells[d];
                    o = 1;
                    if (p && typeof p.colSpan == "number") o = p.colSpan;
                    var n = 1;
                    if (p && typeof p.rowSpan == "number") n = p.rowSpan;
                    if (n > 1) {
                        k += n - 1;
                        l += n - 1
                    }
                    n = h;
                    var s = h + o - 1;
                    if (k >= n && k <= s || l >= n && l <= s) if (p) {
                        e = strip(lpGetText(p, a, false, true));
                        if (e.length >= 2) {
                            b = e;
                            g = 1;
                            break
                        }
                    }
                    h += o
                }
            }
            if (!g && c != -1 && j != -1) if (p = f.rows[c].cells[0]) {
                e = strip(lpGetText(p, a, false, true));
                if (e.length >= 2) b = e
            }
        }
    } catch (u) {}
    if (b == "") b = lpGetTextBeforeFormField_orig(a);
    return b
}

function innerHTMLParse(a, b) {
    var c = "",
        d = a.innerHTML,
        e = RegExp("<(input|select|textarea)[^>]+name=[\"']?" + lp_regexp_quote(lpxmlescape(getname(b))) + "[\"']?[^>]*>", "i");
    e = e.exec(d);
    if (!e) {
        e = RegExp("<(input|select|textarea)[^>]+id=[\"']?" + lp_regexp_quote(lpxmlescape(getname(b))) + "[\"']?[^>]*>", "i");
        e = e.exec(d);
        if (!e) return ""
    }
    var g = d.indexOf(e[0]);
    e = 0;
    var j = g > 1001 ? g - 1001 : 0;
    for (g -= 1; g >= j; g--) {
        var k = d.charAt(g);
        if (k == ">") {
            if (e <= 0) {
                c = c.replace(/&nbsp;/, " ");
                c = strip(c);
                if (c.length > 2) return c;
                c = ""
            }
            e++
        } else if (k == "<") e > 0 && e--;
        else if (e <= 0) c = k + c
    }
    c = c.replace(/&nbsp;/, " ");
    c = strip(c);
    if (c.length > 2) return c;
    return ""
}
function lpGetTextBeforeFormField_orig(a) {
    if (getname(a) == "") return "";
    for (var b = a, c = "", d = 0; d < 10; d++) {
        if (!b.parentNode) break;
        b = b.parentNode;
        c = strip(lpGetText(b, a));
        if (c.length > 200) return innerHTMLParse(b, a);
        if (c.length >= 2) break
    }
    return c
}

function check_size_or_maxlen(a, b, c, d, e) {
    if (b == "ssn1" || b == "ssn2" || b == "ssn3" || b == "ccnum1" || b == "ccnum2" || b == "ccnum3" || b == "ccnum4" || b == "phone1" || b == "phone2" || b == "phone3" || b == "phone23" || b == "evephone1" || b == "evephone2" || b == "evephone3" || b == "evephone23" || b == "mobilephone1" || b == "mobilephone2" || b == "mobilephone3" || b == "mobilephone23" || b == "fax1" || b == "fax2" || b == "fax3" || b == "fax23" || b == "zip1" || b == "zip2" || b == "amexccnum2" || b == "amexccnum3") {
        if (typeof d == "undefined" || typeof e == "undefined") {
            e = d = 0;
            if (typeof a.size != "undefined") d = parseInt(a.size);
            if (typeof a.maxLength != "undefined") e = parseInt(a.maxLength);
            if (d <= 0 && e <= 0 && a.style) {
                a = a.style.width;
                if (a.match(/^\d+px$/)) {
                    a = parseInt(a.substring(0, a.length - 2));
                    if (a % 10 == 0) d = a / 10
                }
            }
        }
        if (b == "ssn2") b = a = 2;
        else if (b == "ssn1" || b == "phone1" || b == "phone2" || b == "fax1" || b == "fax2" || b == "evephone1" || b == "evephone2" || b == "mobilephone1" || b == "mobilephone2") b = a = 3;
        else if (b == "zip1") {
            b = 5;
            a = 2
        } else if (b == "phone23" || b == "fax23" || b == "evephone23" || b == "mobilephone23") {
            b = 8;
            a = 7
        } else if (b == "ccnum4" || b == "zip2") {
            b = 4;
            a = 3
        } else if (b == "amexccnum2") b = a = 6;
        else if (b == "amexccnum3") b = a = 5;
        else if (b == "phone3" || b == "fax3" || b == "mobilephone3" || b == "evephone3") {
            b = 5;
            a = 4
        } else b = a = 4;
        if ((d <= 0 || d > b) && (e <= 0 || e > b)) return false;
        if (c && e > 0 && e < a) return false
    }
    return true
}
var g_allowtruncate = true;

function lpFillFormField(a, b, c, d, e, g, j, k, l) {
    if (j = typeof j != "undefined" ? j : false) g_allowtruncate = false;
    try {
        if (e && c.indexOf("cc") == 0) d = e;
        e = null;
        if (d) for (var f = 0; f < lpformfills.length; f++) {
            if (lpformfills[f].ffid == d) {
                e = lpformfills[f];
                break
            }
        } else if (j) {
            if (j) e = k
        } else e = lpformfills[0];
        if (e) if (!(b.readOnly || b.disabled)) {
            if (a) a.formfillffid = d;
            d = k = 0;
            if (typeof b.size != "undefined") k = parseInt(b.size);
            if (typeof b.maxLength != "undefined") d = parseInt(b.maxLength);
            check_size_or_maxlen(b, c) || (c = c.replace(/\d+$/, ""));
            var p = b.value;
            if (c.indexOf("customfield") == 0) {
                var o = parseInt(c.substring(11));
                e.customfields.length > o && lpSetValue(a, b, lpdec(e.customfields[o].value))
            }
            if (c == "birthmonth" && b.type == "select-one" && b.options.length >= 28) c = b.options[0].value.match(/^\d{4}$/) ? "birthyear" : "birthday";
            else if (c == "birthday" && b.type == "select-one" && b.options.length < 28) c = "birthmonth";
            else if (c == "birthyear" && b.type == "select-one" && b.options.length > 0 && b.options[0].value.match(/^\d$/) && b.options[0].value != 0) c = "birthday";
            if (c == "ccexpmonth" && b.type == "select-one" && b.options.length > 0 && (b.options[b.options.length - 1].value.match(/^\d{4}$/) || b.options[b.options.length - 1].text.match(/^\d{4}$/))) c = "ccexpyear";
            if (c == "cctype" && b.type == "select-one" && b.options.length >= 100) for (f = 0; f < b.options.length; f++) if (b.options[f].value == "US" || b.options[f].value == "USA") {
                c = "country";
                break
            }
            if (j) {
                f = {
                    title: 1,
                    name: 1,
                    firstname: 1,
                    middlename: 1,
                    middleinitial: 1,
                    lastname: 1,
                    username: 1,
                    maiden: 1,
                    birthdate: 1,
                    birthday: 1,
                    birthmonth: 1,
                    birthyear: 1,
                    age: 1,
                    ssn: 1,
                    ssn1: 1,
                    ssn2: 1,
                    ssn3: 1,
                    company: 1,
                    addrbookname: 1,
                    address: 1,
                    address1: 1,
                    address2: 1,
                    address3: 1,
                    city: 1,
                    housenumbername: 1,
                    housenumber: 1,
                    housename: 1,
                    county: 1,
                    state: 1,
                    zip: 1,
                    zip1: 1,
                    zip2: 1,
                    country: 1,
                    phone: 1,
                    phone1: 1,
                    phone2: 1,
                    phone3: 1,
                    phone23: 1,
                    phoneext: 1,
                    fax: 1,
                    fax1: 1,
                    fax2: 1,
                    fax3: 1,
                    fax23: 1,
                    evephone: 1,
                    evephone1: 1,
                    evephone2: 1,
                    evephone3: 1,
                    evephone23: 1,
                    mobilephone: 1,
                    mobilephone1: 1,
                    mobilephone2: 1,
                    mobilephone3: 1,
                    mobilephone23: 1,
                    ccname: 1,
                    ccnum: 1,
                    ccnum1: 1,
                    ccnum2: 1,
                    ccnum3: 1,
                    ccnum4: 1,
                    ccstart: 1,
                    ccstartmonth: 1,
                    ccstartyear: 1,
                    ccexp: 1,
                    ccexpmonth: 1,
                    ccexpyear: 1,
                    cccsc: 1,
                    ccissuenum: 1,
                    cctype: 1,
                    ccphone: 1,
                    bankname: 1,
                    bankacctnum: 1,
                    bankroutingnum: 1,
                    email: 1,
                    emailalert: 1,
                    search: 1,
                    securityanswer: 1,
                    captcha: 1,
                    combineddummy: 1,
                    comments: 1,
                    promocode: 1,
                    invoice: 1,
                    currpass: 1,
                    gender: 1,
                    timezone: 1
                };
                switch (l) {
                case "es-ES":
                case "es-MX":
                    f.lastname2 = 1;
                    break;
                case "ja-JP":
                    f.mobileemail = 1;
                    f.firstname = "namestdfirst";
                    f.firstname2 = "namefurfirst";
                    f.firstname3 = "nameromfirst";
                    f.lastname = "namestdlast";
                    f.lastname2 = "namefurlast";
                    f.lastname3 = "nameromlast"
                }
                var h = typeof f[c] != "undefined" ? f[c] == 1 ? c : f[c] : "UNKNOWN:" + c;
                lpSetValue(a, b, h)
            } else switch (c) {
            case "firstname":
                lpSetValue(a, b, lpdec(e.firstname));
                break;
            case "firstname2":
                lpSetValue(a, b, lpdec(e.firstname2));
                break;
            case "firstname3":
                lpSetValue(a, b, lpdec(e.firstname3));
                break;
            case "lastname":
                lpSetValue(a, b, lpdec(e.lastname));
                break;
            case "lastname2":
                lpSetValue(a, b, lpdec(e.lastname2));
                break;
            case "lastname3":
                lpSetValue(a, b, lpdec(e.lastname3));
                break;
            case "email":
                lpSetValue(a, b, lpdec(e.email));
                break;
            case "mobileemail":
                lpSetValue(a, b, lpdec(e.mobileemail));
                break;
            case "company":
                lpSetValue(a, b, lpdec(e.company));
                break;
            case "address1":
                lpSetValue(a, b, lpdec(e.address1));
                break;
            case "address2":
                lpSetValue(a, b, lpdec(e.address2), false, false, e.address1 != "" ? true : false);
                break;
            case "address3":
                lpSetValue(a, b, lpdec(e.address3), false, false, e.address1 != "" ? true : false);
                break;
            case "username":
                lpSetValue(a, b, lpdec(e.username), true);
                break;
            case "phoneext":
                lpSetValue(a, b, lpdec(e.phoneext), false, false, e.phone != "");
                break;
            case "bankname":
                lpSetValue(a, b, lpdec(e.bankname));
                break;
            case "bankacctnum":
                lpSetValue(a, b, lpdec(e.bankacctnum));
                break;
            case "bankroutingnum":
                lpSetValue(a, b, lpdec(e.bankroutingnum));
                break;
            case "county":
                lpSetValue(a, b, lpdec(e.county));
                break;
            case "ccname":
                lpSetValue(a, b, lpdec(e.ccname));
                break;
            case "ccissuenum":
                lpSetValue(a, b, lpdec(e.ccissuenum), true);
                break;
            case "securityanswer":
                lpSetValue(a, b, "");
                break;
            case "promocode":
                lpSetValue(a, b, "");
                break;
            case "maiden":
                lpSetValue(a, b, "");
                break;
            case "ccphone":
                lpSetValue(a, b, "");
                break;
            case "comments":
                lpSetValue(a, b, "");
                break;
            case "invoice":
                lpSetValue(a, b, "");
                break;
            case "addrbookname":
                lpSetValue(a, b, "");
                break;
            case "emailalert":
                lpSetValue(a, b, "");
                break;
            case "combineddummy":
                lpSetValue(a, b, "");
                break;
            case "timezone":
                h = lpdec(e.timezone);
                if (b.type == "select-one") {
                    if (h == "") break;
                    var n = h.match(/^([-+]?\d{2}):(\d{2}),(\d)$/);
                    if (n) {
                        var s = parseInt(n[1]),
                            u = parseInt(n[2]);
                        parseInt(n[3]);
                        var t = s + u / 60,
                            y = "GMT\\s*" + (s < 0 ? "-" : "\\+") + "\\s*" + (Math.abs(s) < 10 ? "0?" : "") + Math.abs(s);
                        if (u != 0) y += ":" + u;
                        var J = RegExp(y);
                        for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].text == h || b.options[f].value == t || b.options[f].text == t || J.exec(b.options[f].value) || J.exec(b.options[f].text)) {
                            b.selectedIndex = f;
                            break
                        }
                    }
                } else lpSetValue(a, b, h);
                break;
            case "ccnum":
                f = false;
                if (4 == d || 3 == d) f = true;
                if (!f) {
                    var G = lpdec(e.ccnum);
                    lpSetValue(a, b, G);
                    break
                }
            case "cccsc":
                lpSetValue(a, b, lpdec(e.cccsc), true);
                break;
            case "zip":
                h = lpdec(e.zip);
                if (h.match(/^\d{5}-?(?:\d{4})?$/)) {
                    if (d > 0 && d < h.length) h = d == 9 && h.length == 10 ? h.substring(0, 5) + h.substring(6, 10) : d == 4 ? h.length >= 9 ? h.substring(h.length - 4) : "" : h.substring(0, 5)
                } else if (d > 0 && d < h.length) h = h.replace(/[^A-Za-z0-9]/g, "");
                lpSetValue(a, b, h);
                break;
            case "city":
                h = lpdec(e.city);
                if (b.type == "select-one") {
                    if (h == "") break;
                    h = h.toLowerCase();
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase() == h || b.options[f].text.toLowerCase() == h) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h);
                break;
            case "ssn":
                var H = lpdec(e.ssn);
                if (4 == d) {
                    var w = H.replace(/\D/g, "");
                    if (w.length == 9) H = w.substring(5, 9);
                    else break
                } else if (d > 0 && d < 11) H = H.replace(/-/g, "");
                lpSetValue(a, b, H);
                break;
            case "name":
                h = lpdec(e.firstname) + (e.firstname != "" && e.lastname != "" ? " " : "") + lpdec(e.lastname);
                lpSetValue(a, b, h);
                break;
            case "fulllastname":
                h = lpdec(e.lastname) + (e.lastname != "" && e.lastname2 != "" ? " " : "") + lpdec(e.lastname2);
                lpSetValue(a, b, h);
                break;
            case "ssn1":
                H = lpdec(e.ssn);
                w = H.replace(/\D/g, "");
                if (w.length == 9) {
                    h = w.substring(0, 3);
                    lpSetValue(a, b, h)
                }
                break;
            case "ssn2":
                H = lpdec(e.ssn);
                w = H.replace(/\D/g, "");
                if (w.length == 9) {
                    h = w.substring(3, 5);
                    lpSetValue(a, b, h)
                }
                break;
            case "ssn3":
                H = lpdec(e.ssn);
                w = H.replace(/\D/g, "");
                if (w.length == 9) {
                    h = w.substring(5, 9);
                    lpSetValue(a, b, h)
                }
                break;
            case "birthmonth":
                if (e.birthday == "") break;
                h = lpdec(e.birthday).substring(5, 7);
                if (b.type == "select-one") {
                    t = h;
                    if (t.charAt(0) == "0") t = t.substring(1);
                    y = lpgs("month" + t, g).toLowerCase();
                    var I = lpgs("mon" + t, g).toLowerCase();
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(y) != -1 || b.options[f].value.toLowerCase().indexOf(I) != -1 || b.options[f].text.toLowerCase().indexOf(y) != -1 || b.options[f].text.toLowerCase().indexOf(I) != -1) {
                        b.selectedIndex = f;
                        break
                    }
                    if (f == b.options.length) for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h);
                break;
            case "birthday":
                if (e.birthday == "") break;
                h = lpdec(e.birthday).substring(8, 10);
                if (b.type == "select-one") {
                    t = h;
                    if (t.charAt(0) == "0") t = t.substring(1);
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h);
                break;
            case "birthyear":
                if (e.birthday == "") break;
                var C = lpdec(e.birthday);
                h = C.substring(0, 4);
                t = C.substring(2, 4);
                if (b.type == "select-one") for (f = 0; f < b.options.length; f++) {
                    if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else {
                    if (2 == d) h = t;
                    lpSetValue(a, b, h)
                }
                break;
            case "birthdate":
                C = lpdec(e.birthday);
                e && lpdec(e.country);
                if (C.length >= 4) {
                    C = 4 == d ? C.substring(0, 4) : 2 == d ? C.substring(2, 4) : lpdec(e.country) == "US" ? C.substring(5, 7) + "/" + C.substring(8, 10) + "/" + C.substring(0, 4) : C.substring(8, 10) + "/" + C.substring(5, 7) + "/" + C.substring(0, 4);
                    lpSetValue(a, b, C)
                }
                break;
            case "address":
            case "fulladdress":
                var x = b.type == "textarea" ? "\n" : " ",
                    v = [e.address1, e.address2, e.address3];
                if (c == "fulladdress") {
                    v[v.length] = e.city;
                    v[v.length] = e.county;
                    v[v.length] = e.state
                }
                h = "";
                for (f = 0; f < v.length; f++) if (v[f] != "") h += (h != "" ? x : "") + lpdec(v[f]);
                lpSetValue(a, b, h);
                break;
            case "title":
                h = lpdec(e.title);
                if (b.type == "select-one") {
                    if (h == "") break;
                    n = a = "";
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase() == h || b.options[f].value.toLowerCase().indexOf(h) != -1 || b.options[f].text.toLowerCase() == h || b.options[f].text.toLowerCase().indexOf(h) != -1) {
                        if (!("" == a && "" == n)) if (b.options[f].value.length <= a.length && b.options[f].text.length <= n.length) {
                            if (!(b.options[f].value.length < a.length || b.options[f].text.length < n.length)) continue
                        } else continue;
                        a = b.options[f].value;
                        n = b.options[f].text;
                        b.selectedIndex = f
                    }
                } else {
                    h = h.substring(0, 1).toUpperCase() + h.substring(1);
                    lpSetValue(a, b, h)
                }
                break;
            case "state":
                h = lpdec(e.state);
                if (b.type == "select-one") {
                    h = h.toLowerCase();
                    t = lpdec(e.state_name).toLowerCase();
                    if (h == "" && t == "") break;
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase() == h || b.options[f].value.toLowerCase() == t || b.options[f].text.toLowerCase() == h || b.options[f].text.toLowerCase() == t) {
                        b.selectedIndex = f;
                        break
                    }
                    if (f == b.options.length) {
                        for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(t) != -1 || b.options[f].text.toLowerCase().indexOf(t) != -1) {
                            b.selectedIndex = f;
                            break
                        }
                        if (f == b.options.length) {
                            for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(h) != -1 || b.options[f].text.toLowerCase().indexOf(h) != -1) {
                                b.selectedIndex = f;
                                break
                            }
                            if (f == b.options.length && h.length == 2) {
                                y = h.charAt(0) + "." + h.charAt(1) + ".";
                                for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(y) != -1 || b.options[f].text.toLowerCase().indexOf(y) != -1) {
                                    b.selectedIndex = f;
                                    break
                                }
                            }
                        }
                    }
                } else lpSetValue(a, b, h);
                break;
            case "country":
                h = lpdec(e.country_name);
                if (b.type == "select-one") {
                    h = h.toLowerCase();
                    t = lpdec(e.country).toLowerCase();
                    y = lpdec(e.country_cc3l).toLowerCase();
                    I = y == "usa" ? "United States of America" : "";
                    if (h == "" && t == "" && y == "") break;
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value != "") if (b.options[f].value.toLowerCase() == h || b.options[f].value.toLowerCase() == t || b.options[f].value.toLowerCase() == y || b.options[f].value.toLowerCase() == I || b.options[f].text.toLowerCase() == h || b.options[f].text.toLowerCase() == t || b.options[f].text.toLowerCase() == y || b.options[f].text.toLowerCase() == I) {
                        b.selectedIndex = f;
                        break
                    }
                } else if (d == 3) lpSetValue(a, b, lpdec(e.country_cc3l));
                else d == 2 ? lpSetValue(a, b, lpdec(e.country)) : lpSetValue(a, b, h);
                break;
            case "cctype":
                h = lpGetCCType(lpdec(e.ccnum));
                if (h != "UNK") if (b.type == "select-one") {
                    a = -1;
                    for (f = 0; f < b.options.length; f++) {
                        var T = b.options[f].value.toUpperCase(),
                            F = b.options[f].text.toUpperCase();
                        if (T == h || F == h) {
                            b.selectedIndex = f;
                            break
                        }
                        if (CCTypeMatch(h, T) || CCTypeMatch(h, F)) a = f
                    }
                    if (f == b.options.length && a != -1) b.selectedIndex = a
                } else if (b.type == "radio") {
                    T = b.value.toUpperCase();
                    F = b.id.toUpperCase();
                    a = false;
                    if (CCTypeMatch(h, T) || CCTypeMatch(h, F)) a = true;
                    if (!a) {
                        var P = b.parentNode;
                        if (P && P.childNodes) {
                            for (f = 0; f < P.childNodes.length; f++) if (P.childNodes[f] == b) break;
                            if (f < P.childNodes.length - 1) {
                                var S = P.childNodes[f + 1];
                                if (S.nodeType == 3 && CCTypeMatch(h, S.nodeValue)) a = true;
                                else if (S.nodeType == 3 && f < P.childNodes.length - 2 || S.nodeType == 1) {
                                    var A = S.nodeType == 1 ? P.childNodes[f + 1] : P.childNodes[f + 2];
                                    if (A.nodeType == 1 && A.tagName == "LABEL" && A.htmlFor == b.id) {
                                        var U = lpGetText(A, b);
                                        if (CCTypeMatch(h, U)) a = true
                                    } else if (A.nodeType == 1 && A.tagName == "IMG" && typeof A.alt == "string") {
                                        U = A.alt;
                                        if (CCTypeMatch(h, U)) a = true
                                    }
                                }
                            }
                        }
                    }
                    if (a) {
                        b.checked = true;
                        b.click()
                    }
                } else lpSetValue(a, b, h);
                break;
            case "ccexpmonth":
                if (e.ccexp == "") break;
                h = lpdec(e.ccexp).substring(5, 7);
                if (b.type == "select-one") {
                    t = h;
                    if (t.charAt(0) == "0") t = t.substring(1);
                    y = lpgs("month" + t, g).toLowerCase();
                    I = lpgs("mon" + t, g).toLowerCase();
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(y) != -1 || b.options[f].value.toLowerCase().indexOf(I) != -1 || b.options[f].text.toLowerCase().indexOf(y) != -1 || b.options[f].text.toLowerCase().indexOf(I) != -1) {
                        b.selectedIndex = f;
                        break
                    }
                    if (f == b.options.length) for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h);
                break;
            case "ccexpyear":
                if (e.ccexp == "") break;
                var z = lpdec(e.ccexp);
                h = z.substring(0, 4);
                if (b.type == "select-one") {
                    t = z.substring(2, 4);
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h, false, true);
                break;
            case "ccexp":
                z = lpdec(e.ccexp);
                h = z.length == 10 ? z.substring(5, 7) + "/" + z.substring(2, 4) : "";
                if (b.type == "select-one") {
                    if (h == "") break;
                    t = z.length == 10 ? z.substring(5, 7) + "/" + z.substring(0, 4) : "";
                    y = z.length == 10 ? z.substring(5, 7) + z.substring(2, 4) : "";
                    I = z.length == 10 ? z.substring(5, 7) + z.substring(0, 4) : "";
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].value == y || b.options[f].value == I || b.options[f].text == h || b.options[f].text == t || b.options[f].text == y || b.options[f].text == I) {
                        b.selectedIndex = f;
                        break
                    }
                } else {
                    if (z.length == 10) if (4 == d) h = z.substring(5, 7) + z.substring(2, 4);
                    lpSetValue(a, b, h)
                }
                break;
            case "ccstartmonth":
                if (e.ccstart == "") break;
                h = lpdec(e.ccstart).substring(5, 7);
                if (b.type == "select-one") {
                    t = h;
                    if (t.charAt(0) == "0") t = t.substring(1);
                    y = lpgs("month" + t, g).toLowerCase();
                    I = lpgs("mon" + t, g).toLowerCase();
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value.toLowerCase().indexOf(y) != -1 || b.options[f].value.toLowerCase().indexOf(I) != -1 || b.options[f].text.toLowerCase().indexOf(y) != -1 || b.options[f].text.toLowerCase().indexOf(I) != -1) {
                        b.selectedIndex = f;
                        break
                    }
                    if (f == b.options.length) for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h);
                break;
            case "ccstartyear":
                if (e.ccstart == "") break;
                var R = lpdec(e.ccstart);
                h = R.substring(0, 4);
                if (b.type == "select-one") {
                    t = R.substring(2, 4);
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].text == h || b.options[f].text == t) {
                        b.selectedIndex = f;
                        break
                    }
                } else lpSetValue(a, b, h, false, true);
                break;
            case "ccstart":
                R = lpdec(e.ccstart);
                h = R.length == 10 ? R.substring(5, 7) + "/" + R.substring(2, 4) : "";
                if (b.type == "select-one") {
                    if (h == "") break;
                    t = R.length == 10 ? R.substring(5, 7) + "/" + R.substring(0, 4) : "";
                    y = R.length == 10 ? R.substring(5, 7) + R.substring(2, 4) : "";
                    I = R.length == 10 ? R.substring(5, 7) + R.substring(0, 4) : "";
                    for (f = 0; f < b.options.length; f++) if (b.options[f].value == h || b.options[f].value == t || b.options[f].value == y || b.options[f].value == I || b.options[f].text == h || b.options[f].text == t || b.options[f].text == y || b.options[f].text == I) {
                        b.selectedIndex = f;
                        break
                    }
                } else {
                    if (R.length == 10) if (4 == d) h = R.substring(5, 7) + R.substring(2, 4);
                    lpSetValue(a, b, h)
                }
                break;
            case "ccnum1":
                h = lpdec(e.ccnum).substring(0, 4);
                lpSetValue(a, b, h);
                break;
            case "ccnum2":
                h = lpdec(e.ccnum).substring(4, 8);
                lpSetValue(a, b, h);
                break;
            case "ccnum3":
                h = lpdec(e.ccnum).substring(8, 12);
                lpSetValue(a, b, h);
                break;
            case "ccnum4":
                h = lpdec(e.ccnum).substring(12);
                lpSetValue(a, b, h);
                break;
            case "amexccnum2":
                h = lpdec(e.ccnum).substring(4, 10);
                lpSetValue(a, b, h);
                break;
            case "amexccnum3":
                h = lpdec(e.ccnum).substring(10, 15);
                lpSetValue(a, b, h);
                break;
            case "middlename":
                h = lpdec(e.middlename);
                var W = h.substring(0, 1);
                1 == d || 2 == d ? lpSetValue(a, b, W) : lpSetValue(a, b, h);
                break;
            case "middleinitial":
                h = lpdec(e.middlename).substring(0, 1);
                lpSetValue(a, b, h);
                break;
            case "mobilephone1":
            case "mobilephone2":
            case "mobilephone3":
            case "evephone1":
            case "evephone2":
            case "evephone3":
            case "phone1":
            case "phone2":
            case "phone3":
            case "fax1":
            case "fax2":
            case "fax3":
                var N = c.substring(0, c.length - 1),
                    Q = c.substring(c.length - 1),
                    q = e.phone;
                if ("evephone" == N) q = e.evephone;
                if ("mobilephone" == N) q = e.mobilephone;
                if ("fax" == N) q = e.fax;
                h = lpdec(q);
                if (h.length <= 3) h = "";
                w = h.replace(/\D/g, "");
                if (w.length == 10 && w.charAt(0) >= "2" && w.charAt(3) >= "2") w = "1" + w;
                if (w.length == 11 && w.charAt(0) == "1" && w.charAt(1) >= "2" && w.charAt(4) >= "2") switch (Q) {
                case "1":
                    lpSetValue(a, b, w.substring(1, 4));
                    break;
                case "2":
                    lpSetValue(a, b, w.substring(4, 7));
                    break;
                case "3":
                    lpSetValue(a, b, w.substring(7, 11))
                } else lpSetValue(a, b, h, true);
                break;
            case "mobilephone23":
            case "evephone23":
            case "phone23":
            case "fax23":
                N = c.substring(0, c.length - 2);
                q = e.phone;
                if ("evephone" == N) q = e.evephone;
                if ("fax" == N) q = e.fax;
                if ("mobilephone" == N) q = e.mobilephone;
                h = lpdec(q);
                if (h.length <= 3) h = "";
                w = h.replace(/\D/g, "");
                if (w.length == 10 && w.charAt(0) >= "2" && w.charAt(3) >= "2") w = "1" + w;
                if (w.length == 11 && w.charAt(0) == "1" && w.charAt(1) >= "2" && w.charAt(4) >= "2") {
                    f = (k <= 0 || k >= 8) && (d <= 0 || d >= 8) ? true : false;
                    lpSetValue(a, b, w.substring(4, 7) + (f ? "-" : "") + w.substring(7, 11))
                } else lpSetValue(a, b, h, true);
                break;
            case "mobilephone":
            case "evephone":
            case "phone":
            case "fax":
                N = c;
                q = e.phone;
                var D = e.countryphone;
                if ("evephone" == N) {
                    q = e.evephone;
                    D = e.countryevephone
                }
                if ("fax" == N) {
                    q = e.fax;
                    D = e.countryfaxphone
                }
                if ("mobilephone" == N) {
                    q = e.mobilephone;
                    D = e.countrymobphone
                }
                h = lpdec(q);
                if (h.length <= 3) h = "";
                if (h.length == 11 && h.match(/^\d+$/) && h.charAt(0) == "1" && h.charAt(1) >= "2" && h.charAt(4) >= "2") {
                    h = h.substring(1);
                    if (d <= 0 || d >= 12) h = h.substring(0, 3) + "-" + h.substring(3, 6) + "-" + h.substring(6, 10)
                } else if (h.length >= 2) {
                    var B = lpdec(D),
                        aa = get_phone_code(B);
                    if (aa && h.indexOf(aa) == 0 && h.charAt(aa.length) == "0") h = h.substring(aa.length)
                }
                lpSetValue(a, b, h, true);
                break;
            case "zip1":
                h = lpdec(e.zip);
                w = h.replace(/\D/g, "");
                if (w.length == 5 || w.length == 9) h = w.substring(0, 5);
                else if (g == "ja-JP" && w.length == 7) h = w.substring(0, 3);
                else {
                    var r = h.replace(/[^A-Za-z0-9]/g, "");
                    if (r.match(/^(?:[A-Za-z]\d){3}$/)) h = r.substring(0, 3);
                    else if (r.match(/^[A-Za-z]{1,2}\d[A-Za-z0-9]?\d[A-Za-z]{2}$/)) h = r.substring(0, r.length - 3);
                    else if (r.length < h.length) {
                        var X = h.split(/[^A-Za-z0-9]+/);
                        h = X[0]
                    }
                }
                lpSetValue(a, b, h);
                break;
            case "zip2":
                h = lpdec(e.zip);
                w = h.replace(/\D/g, "");
                f = false;
                if (w.length == 5) {
                    h = "";
                    f = true
                } else if (w.length == 9) h = w.substring(5, 9);
                else if (g == "ja-JP" && w.length == 7) h = w.substring(3, 7);
                else {
                    r = h.replace(/[^A-Za-z0-9]/g, "");
                    if (r.match(/^(?:[A-Za-z]\d){3}$/)) h = r.substring(3, 6);
                    else if (r.match(/^[A-Za-z]{1,2}\d[A-Za-z0-9]?\d[A-Za-z]{2}$/)) h = r.substring(r.length - 3);
                    else if (r.length < h.length) {
                        X = h.split(/[^A-Za-z0-9]+/);
                        h = X[1]
                    }
                }
                lpSetValue(a, b, h, false, false, f);
                break;
            case "gender":
                h = lpdec(e.gender).toUpperCase();
                if (h != "") {
                    t = h;
                    if (h == "M") t = lpgs("Male", g);
                    if (h == "F") t = lpgs("Female", g);
                    t = t.toUpperCase();
                    if (b.type == "select-one") for (f = 0; f < b.options.length; f++) {
                        var E = lptrim(b.options[f].text).toUpperCase(),
                            Z = lptrim(b.options[f].value).toUpperCase();
                        if (Z.indexOf(h) == 0 || E.indexOf(h) == 0 || Z.indexOf(t) == 0 || E.indexOf(t) == 0) {
                            b.selectedIndex = f;
                            break
                        }
                    } else if (b.type == "radio") {
                        Z = lptrim(b.value).toUpperCase();
                        if (Z.indexOf(h) == 0 || Z.indexOf(t) == 0) b.checked = true;
                        else if ((P = b.parentNode) && P.childNodes) {
                            for (f = 0; f < P.childNodes.length; f++) if (P.childNodes[f] == b) break;
                            if (f < P.childNodes.length - 1) {
                                S = P.childNodes[f + 1];
                                var da = lptrim(S.nodeValue).toUpperCase();
                                if (S.nodeType == 3 && (da.indexOf(h) == 0 || da.indexOf(t) == 0)) b.checked = true;
                                else if (S.nodeType == 3 && f < P.childNodes.length - 2 || S.nodeType == 1) {
                                    A = S.nodeType == 1 ? P.childNodes[f + 1] : P.childNodes[f + 2];
                                    if (A.nodeType == 1 && A.tagName == "LABEL" && A.htmlFor == b.id) {
                                        U = lpGetText(A, b);
                                        var V = lptrim(U).toUpperCase();
                                        if (V.indexOf(h) == 0 || V.indexOf(t) == 0) b.checked = true
                                    } else if (A.nodeType == 1 && A.tagName == "IMG" && typeof A.alt == "string") {
                                        U = A.alt;
                                        var M = lptrim(U).toUpperCase();
                                        if (M.indexOf(h) == 0 || M.indexOf(t) == 0) b.checked = true
                                    }
                                }
                            }
                        }
                    } else lpSetValue(a, b, h)
                }
                break;
            case "age":
                var K = lpdec(e.birthday);
                if (K != "") {
                    var $ = parseInt(K.substring(0, 4)),
                        ba = parseInt(K.substring(5, 7));
                    C = parseInt(K.substring(8, 10));
                    var Y = new Date,
                        O = Y.getFullYear(),
                        fa = Y.getMonth() + 1,
                        ea = Y.getDate();
                    h = O - $;
                    if (fa < ba || fa == ba && ea < C) h--;
                    if (b.type == "select-one") for (f = 0; f < b.options.length; f++) {
                        var ga = b.options[f].text;
                        w = a = -1;
                        if (n = ga.match(/(\d+)\D+(\d+)/)) {
                            a = parseInt(n[1]);
                            w = parseInt(n[2])
                        } else if (n = ga.match(/^\d+/)) {
                            var ca = parseInt(n[0]);
                            if (f < b.options.length / 2) {
                                a = 0;
                                w = ca
                            } else {
                                a = ca;
                                w = 99999
                            }
                        } else if (n = ga.match(/\d+$/)) {
                            ca = parseInt(n[0]);
                            if (f < b.options.length / 2) {
                                a = 0;
                                w = ca - 1
                            } else {
                                a = ca + 1;
                                w = 99999
                            }
                        }
                        if (a != -1 && w != -1 && h >= a && h <= w) {
                            b.selectedIndex = f;
                            break
                        }
                    } else lpSetValue(a, b, h)
                }
                break;
            case "housenumber":
            case "housenumbername":
                h = lpdec(e.address1);
                n = h.match(/^\d+/);
                if (!n) {
                    h = lpdec(e.address2);
                    n = h.match(/^\d+/)
                }
                if (!n) {
                    h = lpdec(e.address3);
                    n = h.match(/^\d+/)
                }
                if (n) {
                    lpSetValue(a, b, n[0]);
                    break
                } else if (c == "housenumber") break;
            case "housename":
                h = lpdec(e.address1);
                h = h.replace(/^\d+\s*/, "");
                lpSetValue(a, b, h)
            }
            b.value != p && fire_onchange(b)
        }
    } catch (ha) {
        lpReportError("Failure with filling form field: " + ha + " ln: " + ha.lineNumber)
    }
}

function lpGetCCType(a) {
    var b = "UNK";
    if ((a.substring(0, 2) == "34" || a.substring(0, 2) == "37") && a.length == 15) b = "AMEX";
    else if ((a.substring(0, 4) == "6011" || a.substring(0, 2) == "65") && a.length == 16) b = "DISC";
    else if ((a.substring(0, 2) == "51" || a.substring(0, 2) == "52" || a.substring(0, 2) == "53" || a.substring(0, 2) == "54" || a.substring(0, 2) == "55") && a.length == 16) b = "MC";
    else if ((a.substring(0, 6) == "417500" || a.substring(0, 4) == "4917" || a.substring(0, 4) == "4913" || a.substring(0, 4) == "4508" || a.substring(0, 4) == "4844") && a.length == 16) b = "ELECTRON";
    else if (a.substring(0, 1) == "4" && a.length == 16) b = "VISA";
    else if ((a.substring(0, 4) == "5018" || a.substring(0, 4) == "5020" || a.substring(0, 4) == "5038" || a.substring(0, 4) == "6304" || a.substring(0, 4) == "6759" || a.substring(0, 4) == "6761") && a.length >= 12 && a.length <= 19) b = "MAESTRO";
    else if ((a.substring(0, 4) == "6334" || a.substring(0, 4) == "6767") && (a.length == 16 || a.length == 18 || a.length == 19)) b = "SOLO";
    return b
}

function CCTypeMatch(a, b) {
    a = a.toUpperCase();
    b = b.toUpperCase();
    if (a == "AMEX" && b.indexOf("BANAMEX") != -1) return false;
    if (b.indexOf(a) != -1) return true;
    else switch (a) {
    case "AMEX":
        return b.indexOf("AMERICAN") != -1 || b.indexOf("AMX") != -1;
    case "DISC":
        return b.indexOf("DIS") != -1;
    case "MC":
        return b.indexOf("MASTER") != -1;
    case "VISA":
        return b.indexOf("VSA") != -1;
    default:
        return false
    }
}

function lpSetValue(a, b, c, d, e, g) {
    if (c != "" || g) {
        if (typeof b.maxLength != "undefined" && g_allowtruncate) {
            g = parseInt(b.maxLength);
            if (g > 0 && c.length > g) {
                if (d) return;
                c = e ? c.substring(c.length - g) : c.substring(0, g)
            }
        }
        if (a) {
            if (typeof a.formfillfields == "undefined") a.formfillfields = [];
            a.formfillfields[getname(b)] = c
        }
        b.value = c
    }
}
var lpgettext_abort = false;

function lpGetText(a, b, c, d) {
    c || (lpgettext_abort = false);
    if (a == b) {
        lpgettext_abort = true;
        return ""
    }
    if (a.nodeType == 3) return strip(a.nodeValue).length > 2 ? a.nodeValue : "";
    c = [];
    var e = 0,
        g = typeof a.tagName == "string" ? a.tagName : "";
    if (a.lp_too_many) return "";
    var j = a && a.style && !lpIsVisible(a, true);
    d = false;
    if (g == "LABEL") d = true;
    e = 0;
    if (g != "OPTION" && g != "SCRIPT" && g != "TEXTAREA" && !j) for (; typeof a.childNodes[e] != "undefined";) {
        c[c.length] = lpGetText(a.childNodes[e], b, true, d);
        if (lpgettext_abort) break;
        if (e++ > 50) {
            a.lp_too_many = 1;
            return ""
        }
    }
    a = "|";
    if (typeof d != "undefined" && d) a = "";
    return c.join(a)
}

function get_phone_code(a) {
    var b = [];
    b.AND = 376;
    b.ARE = 971;
    b.AFG = 93;
    b.ATG = 1;
    b.AIA = 1;
    b.ALB = 355;
    b.ARM = 374;
    b.ANT = 599;
    b.AGO = 244;
    b.ATA = 672;
    b.ARG = 54;
    b.ASM = 1;
    b.AUT = 43;
    b.AUS = 61;
    b.ABW = 297;
    b.ALA = 358;
    b.AZE = 994;
    b.BIH = 387;
    b.BRB = 1;
    b.BGD = 880;
    b.BEL = 32;
    b.BFA = 226;
    b.BGR = 359;
    b.BHR = 973;
    b.BDI = 257;
    b.BEN = 229;
    b.BLM = 590;
    b.BMU = 1;
    b.BRN = 673;
    b.BOL = 591;
    b.BRA = 55;
    b.BHS = 1;
    b.BTN = 975;
    b.BVT = 47;
    b.BWA = 267;
    b.BLR = 375;
    b.BLZ = 501;
    b.CAN = 1;
    b.CCK = 61;
    b.COD = 243;
    b.CAF = 236;
    b.COG = 242;
    b.CHE = 41;
    b.CIV = 225;
    b.COK = 682;
    b.CHL = 56;
    b.CMR = 237;
    b.CHN = 86;
    b.COL = 57;
    b.CRI = 506;
    b.CUB = 53;
    b.CPV = 238;
    b.CXR = 61;
    b.CYP = 357;
    b.CZE = 420;
    b.DEU = 49;
    b.DJI = 253;
    b.DNK = 45;
    b.DMA = 1;
    b.DOM = 1;
    b.DZA = 213;
    b.ECU = 593;
    b.EST = 372;
    b.EGY = 20;
    b.ESH = 212;
    b.ERI = 291;
    b.ESP = 34;
    b.ETH = 251;
    b.FIN = 358;
    b.FJI = 679;
    b.FLK = 500;
    b.FSM = 691;
    b.FRO = 298;
    b.FRA = 33;
    b.GAB = 241;
    b.GBR = 44;
    b.GRD = 1;
    b.GEO = 995;
    b.GUF = 594;
    b.GGY = 44;
    b.GHA = 233;
    b.GIB = 350;
    b.GRL = 299;
    b.GMB = 220;
    b.GIN = 224;
    b.GLP = 590;
    b.GNQ = 240;
    b.GRC = 30;
    b.SGS = 995;
    b.GTM = 502;
    b.GUM = 1;
    b.GNB = 245;
    b.GUY = 592;
    b.HKG = 852;
    b.HMD = 672;
    b.HND = 504;
    b.HRV = 385;
    b.HTI = 509;
    b.HUN = 36;
    b.IDN = 62;
    b.IRL = 353;
    b.ISR = 972;
    b.IMM = 44;
    b.IND = 91;
    b.IOT = 246;
    b.IRQ = 964;
    b.IRN = 98;
    b.ISL = 354;
    b.ITA = 39;
    b.JEY = 44;
    b.JAM = 1;
    b.JOR = 962;
    b.JPN = 81;
    b.KEN = 254;
    b.KGZ = 996;
    b.KHM = 855;
    b.KIR = 686;
    b.COM = 269;
    b.KNA = 1;
    b.PRK = 850;
    b.KOR = 82;
    b.KWT = 965;
    b.CYM = 1;
    b.KAZ = 7;
    b.LAO = 856;
    b.LBN = 961;
    b.LCA = 1;
    b.LIE = 423;
    b.LKA = 94;
    b.LBR = 231;
    b.LSO = 266;
    b.LTU = 370;
    b.LUX = 352;
    b.LVA = 371;
    b.LBY = 218;
    b.MAR = 212;
    b.MCO = 377;
    b.MDA = 373;
    b.MNE = 382;
    b.MAF = 590;
    b.MDG = 261;
    b.MHL = 692;
    b.MKD = 389;
    b.MLI = 223;
    b.MMR = 95;
    b.MNG = 976;
    b.MAC = 853;
    b.MNP = 1;
    b.MTQ = 596;
    b.MRT = 222;
    b.MSR = 1;
    b.MLT = 356;
    b.MUS = 230;
    b.MDV = 960;
    b.MWI = 265;
    b.MEX = 52;
    b.MYS = 60;
    b.MOZ = 258;
    b.NAM = 264;
    b.NCL = 687;
    b.NER = 227;
    b.NFK = 672;
    b.NGA = 234;
    b.NIC = 505;
    b.NLD = 31;
    b.NOR = 47;
    b.NPL = 977;
    b.NRU = 674;
    b.NIU = 683;
    b.NZL = 64;
    b.OMN = 968;
    b.PAN = 507;
    b.PER = 51;
    b.PYF = 689;
    b.PNG = 675;
    b.PHL = 63;
    b.PAK = 92;
    b.POL = 48;
    b.SPM = 508;
    b.PCN = 872;
    b.PRI = 1;
    b.PSE = 970;
    b.PRT = 351;
    b.PLW = 680;
    b.PRY = 595;
    b.QAT = 974;
    b.REU = 262;
    b.ROU = 40;
    b.SRB = 381;
    b.RUS = 7;
    b.RWA = 250;
    b.SAU = 966;
    b.SLB = 677;
    b.SYC = 248;
    b.SDN = 249;
    b.SWE = 46;
    b.SGP = 65;
    b.SHN = 290;
    b.SVN = 386;
    b.SJM = 47;
    b.SVK = 421;
    b.SLE = 232;
    b.SMR = 378;
    b.SEN = 221;
    b.SOM = 252;
    b.SUR = 597;
    b.STP = 239;
    b.SLV = 503;
    b.SYR = 963;
    b.SWZ = 268;
    b.TCA = 1;
    b.TCD = 235;
    b.ATF = 596;
    b.TGO = 228;
    b.THA = 66;
    b.TJK = 992;
    b.TKL = 690;
    b.TLS = 670;
    b.TKM = 993;
    b.TUN = 216;
    b.TON = 676;
    b.TUR = 90;
    b.TTO = 1;
    b.TUV = 688;
    b.TWN = 886;
    b.TZA = 255;
    b.UKR = 380;
    b.UGA = 256;
    b.UMI = 1;
    b.USA = 1;
    b.URY = 598;
    b.UZB = 998;
    b.VAT = 379;
    b.VCT = 1;
    b.VEN = 58;
    b.VGB = 1;
    b.VIR = 1;
    b.VNM = 84;
    b.VUT = 678;
    b.WLF = 681;
    b.WSM = 685;
    b.YEM = 967;
    b.MYT = 262;
    b.YUG = 381;
    b.ZAF = 27;
    b.ZMB = 260;
    b.ZWE = 263;
    return typeof b[a] != "undefined" ? "" + b[a] : null
}
function lpReportError(a) {
    console_log(a)
}

function lpgs(a, b) {
    var c = typeof b == "undefined" || b == null ? "" : b;
    if (typeof lpgscache[c + a] != "undefined") return lpgscache[c + a];
    if (typeof lpgslocales[c] == "undefined" && a.indexOf("ff_") == 0) {
        ApplyOverrides(c);
        if (typeof lpgscache[c + a] != "undefined") return lpgscache[c + a]
    }
    if (typeof translations != "undefined") {
        if (typeof b != "undefined" && b && typeof translations[b] != "undefined" && typeof translations[b][a] != "undefined") return translations[b][a];
        if (typeof translations["en-US"] != "undefined" && typeof translations["en-US"][a] != "undefined") return translations["en-US"][a]
    }
    return a
}
function lpdbg() {}
function lpConfirmYesNo(a) {
    return confirm(a)
}
function lpdec(a) {
    return a
}
function LP_form_fill() {
    LP_to_formfill.customfields = [];
    for (var a = 0; typeof LP_to_formfill["custom_field" + a] != "undefined"; a++) LP_to_formfill.customfields[a] = LP_to_formfill["custom_field" + a];
    lpformfills = Array(LP_to_formfill);
    lpCheckFormFill(null, document, true, false, LP_to_formfill.ffid, 1, window)
}
if (typeof lpgenpassforms == "undefined") lpgenpassforms = [];
if (typeof lpgenpasscurrentpwfields == "undefined") lpgenpasscurrentpwfields = [];

function get_username_val(a) {
    a = a.getElementById("Email");
    return a != null && a.type == "hidden" && a.name == "Email" ? a.value : ""
}

function lpCheckGeneratePassword(a, b, c, d, e) {
    if (typeof e == "undefined") e = 1;
    if (e > 10) return null;
    lpdbg("checkgenpw", "START checkonly=" + c);
    var g = typeof LP != "undefined" && typeof LP.getBrowser().getBrowserForDocument == "function" ? LP.getBrowser().getBrowserForDocument(b) : null;
    if (g) a = g;
    if (typeof LP != "undefined" && !a) return null;
    g = null;
    try {
        if (!c && typeof lp_notification_exists != "undefined" && (lp_notification_exists(a, "autologin") || lp_notification_exists(a, "generate"))) {
            lpdbg("checkgenpw", "aborting since notification already shown");
            return null
        }
        g = b.location.href;
        var j = lpParseUri(g),
            k = lpcanonizeUrl(g, j),
            l = lp_gettld(j.host, g);
        lpdbg("checkgenpw", "currenturl=" + g);
        if ((typeof lploggedin == "undefined" || lploggedin) && (c || (typeof lpOfferGeneratePasswd == "undefined" || lpOfferGeneratePasswd) && (typeof never_gen == "undefined" || !never_gen(k, l)))) for (var f = b.getElementsByTagName("form"), p = 0; p < f.length; p++) if (!(typeof p.offsetLeft != "undefined" && p.offsetLeft < 0 || typeof p.offsetTop != "undefined" && p.offsetTop < 0)) {
            var o = lpCountInputFields(f[p]);
            lpdbg("checkgenpw", "checking form#" + p + " numpasswords=" + o.password + " numpasswordsvisible=" + o.passwordvisible + " passwordscontigious=" + o.passwordsContiguous);
            if (2 <= o.password && o.password <= 4 && 2 <= o.passwordvisible && o.passwordvisible <= 4 && o.passwordsContiguous == true) {
                if (!c) {
                    var h = typeof LP != "undefined" ? LP.lpgetcurrenturl(a) : document.location.href;
                    lpdbg("genpw", "Adding url to lpgenpassforms: " + h);
                    lpgenpassforms[h] = f[p];
                    o = false;
                    if (typeof disable_check_form_fill == "undefined" || !disable_check_form_fill) o = lpCheckFormFill(a, b, false, true, null, 1, d);
                    var n = false,
                        s = lpCheckCurrentPWField(f[p]),
                        u = [];
                    if (s) {
                        var t = get_username_val(b);
                        n = true;
                        lpgenpasscurrentpwfields[h] = s;
                        var y = typeof j.path == "string" ? j.path.split("/") : [],
                            J = typeof lptlds != "undefined" && typeof lptlds[l] != "undefined" ? lptlds[l] : [],
                            G;
                        for (G in J) if (!(typeof lpaccts[G] == "undefined" || lpaccts[G].genpw || lpaccts[G].isbookmark)) if (LPAHasValue(lpaccts[G], 1)) {
                            var H = new lpautologininfo;
                            H.realmmatch = false;
                            H.id = lpaccts[G].id;
                            var w = lpParseUri(lpaccts[G].url);
                            H.usernamematch = lpaccts[G].unencryptedUsername != "" && lpaccts[G].unencryptedUsername == t;
                            H.urlmatch = lpcanonizeUrl(lpaccts[G].url, w) == k ? true : false;
                            H.servermatch = w.host == j.host ? true : false;
                            H.portmatch = compare_ports(w, j);
                            H.serverportmatch = H.servermatch && H.portmatch;
                            var I = typeof w.path == "string" ? w.path.split("/") : [],
                                C;
                            for (C = 0; C < y.length && C < I.length; C++) if (I[C] != y[C]) break;
                            H.pathlevelmatch = C;
                            H.url = g;
                            H.fieldmatchcount = 0;
                            u[u.length] = H
                        }
                        if (typeof lp_aids_sort_func != "undefined") {
                            u.sort(lp_aids_sort_func);
                            u = checkurlrules(lpurlrules, u, l, typeof j.path == "string" ? j.path : "", j.host, lpaccts, get_port(j))
                        }
                    }
                    typeof LP != "undefined" && LP.lpshowHelpDlg("genpw");
                    lpdbg("checkgenpw", o ? "showing generatepassword AND fillforms" : "showing generatepassword");
                    if (lpNotificationsAfterClick) {
                        var x = typeof LP != "undefined" ? LP.getBrowser().selectedTab.linkedBrowser.contentDocument : document;
                        x.LPlpgenerateandfill = o;
                        x.LPlpgenerateAids = u;
                        x.LPlpfillcurrent = n;
                        x.LPlpgenerateForm = f[p];
                        setupFocusEvent(x, !o)
                    } else lp_showNotification("GeneratePassword", a, u, "generate", f[p], null, o, n);
                    if (o) if (a) a.contentDocument.ffidindex = -1;
                    else document.ffidindex = -1
                }
                return f[p]
            }
        }
    } catch (v) {
        lpReportError("Failure with checking generate password: " + v + " ln: " + v.lineNumber, g)
    }
    if (typeof d == "undefined" || d == null) d = a.contentWindow;
    if (d && d.frames) for (G = 0; G < d.frames.length; G++) try {
        if (d.frames[G].document) return lpCheckGeneratePassword(a, d.frames[G].document, c, d.frames[G].window, e + 1)
    } catch (T) {}
    return null
}

function lpCheckCurrentPWField(a) {
    for (var b = RegExp(lpgs("ff_currpass_regexp"), "i"), c = 0; c < a.elements.length; c++) {
        var d = a.elements[c];
        if (d.type == "password") if (lpIsVisible(d)) if (b.exec(getname(d))) return d;
        else {
            var e = lpGetTextBeforeFormField(d);
            if (e != "" && b.exec(e)) return d
        }
    }
    return null
}

function lpCountInputFields(a, b) {
    var c = [];
    c.text = c.password = c["select-one"] = c.textarea = c.passwordValues = c.passwordvisible = c.uniquepasswords = 0;
    c.uname = c.pname = c.oname = "";
    for (var d = a.elements, e = false, g = false, j = [], k = typeof d != "undefined" ? d.length : 0, l = 0; l < k; l++) {
        var f = d[l].type,
            p = getname(d[l]),
            o = d[l].value;
        if (f == "password" || f == "text" || f == "select-one" || f == "textarea" || "email" == f) c[f]++;
        if (f == "password") {
            b || lpIsVisible(d[l]) && ++c.passwordvisible;
            o != "" && c.passwordValues++;
            if (e) g = true;
            e = true;
            lp_in_array(o, j) || (j[j.length] = o)
        } else if (f != "hidden") e = false;
        if (("text" == f || "email" == f) && p != "openid_url" && (c.uname == "" || c.pname == "")) c.uname = p;
        if (f == "password") c.pname = p;
        if (("text" == f || "email" == f) && p == "openid_url") c.oname = p
    }
    c.passwordsContiguous = g;
    c.uniquepasswords = j.length;
    return c
}

function setupFocusEvent(a, b, c, d) {
    if (typeof d == "undefined") d = 1;
    if (d > 10) return null;
    var e = typeof LP != "undefined" ? LP.getBrowser().selectedTab.linkedBrowser.contentDocument : document;
    if (!(a == e && typeof e.LPlpm_setupFocusHandler != "undefined" && e.LPlpm_setupFocusHandler == true)) {
        if (a == e) e.LPlpm_setupFocusHandler = true;
        e = ["input", "select"];
        for (var g = 0; g < e.length; g++) for (var j = a.getElementsByTagName(e[g]), k = 0, l = 0; l < j.length; l++) if (!(b && j[l].type != "password")) if (j[l].type == "text" || "email" == j[l].type || j[l].type == "password" || j[l].type == "select-one" || j[l].type == "textarea" || j[l].type == "radio") {
            if ("text" == j[l].type || "email" == j[l].type) {
                var f = RegExp(lpgs("ff_search_regexp"), "i");
                if (j[l].name != "" && f.exec(j[l].name)) continue
            }
            if (k > 20) break;
            else k++;
            j[l].addEventListener("focus", function(o) {
                typeof LP != "undefined" ? LP.FieldFocus(o) : FieldFocus(o)
            }, false)
        }
        if (typeof c == "undefined" || c == null) c = typeof LP != "undefined" ? LP.getBrowser().selectedTab.linkedBrowser.contentWindow : window;
        if (c && c.frames) for (g = 0; g < c.frames.length; g++) try {
            c.frames[g].document && setupFocusEvent(c.frames[g].document, b, c.frames[g].window, d + 1)
        } catch (p) {}
    }
}
this.FieldFocus = function(a) {
    var b = typeof LP != "undefined" ? LP.getBrowser().selectedTab.linkedBrowser : null;
    if (typeof LP == "undefined" || b) {
        var c = b ? b.contentDocument : document;
        if (!(!c || typeof c.FieldFocusDone != "undefined" && c.FieldFocusDone == true)) if (typeof c.LPlpUseLastPassLogin != "undefined" && c.LPlpUseLastPassLogin == true) if (lploggedin) {
            c.LPlpUseLastPassLogin = false;
            LP.FieldFocus(a)
        } else {
            lp_showNotification("UseLastPassLogin", b, 0, "login", null);
            c.LPlpUseLastPassLogin = false;
            c.LPlpm_setupFocusHandler = false;
            c.FieldFocusDone = false
        } else {
            if (typeof c.LPlpgenerateandfill == "undefined" && typeof c.LPlpfillforms != "undefined") lp_showNotification("FillableFormDetected", b, 0, "formfill");
            else if (typeof c.LPlpgenerateandfill != "undefined") lp_showNotification("GeneratePassword", b, c.LPlpgenerateAids, "generate", c.LPlpgenerateForm, null, c.LPlpgenerateandfill, c.LPlpfillcurrent);
            else return;
            c.FieldFocusDone = true
        }
    }
};

function populategeneratedpassword(a, b, c) {
    if (!lpgenpassforms[a]) {
        var d, e, g;
        if (typeof LP != "undefined") {
            d = LP.getBrowser().selectedTab.linkedBrowser;
            e = d.contentDocument;
            g = null
        } else {
            d = null;
            e = document;
            g = window
        }
        lpgenpassforms[a] = lpCheckGeneratePassword(d, e, true, g)
    }
    if (lpgenpassforms[a]) {
        form = lpgenpassforms[a];
        d = null;
        d = lpgenpasscurrentpwfields[a] ? lpgenpasscurrentpwfields[a] : lpCheckCurrentPWField(form);
        e = false;
        c = a = null;
        for (g = 1; g <= 2; g++) {
            e = false;
            a = c = null;
            var j = -1;
            if (g == 1) {
                if (d) for (var k = 0; k < form.elements.length; k++) if (form.elements[k] == d) {
                    j = k + 1;
                    break
                }
            } else j = 0;
            if (j != -1) {
                for (k = j; k < form.elements.length; k++) {
                    j = form.elements[k];
                    if (j.type == "password") {
                        if (!(!e && a && c)) {
                            c = a;
                            a = j;
                            if (e && a && c) break
                        }
                        e = true
                    } else e = false
                }
                if (a && c) break
            }
        }
        if (a && c) {
            if ((c.value != "" || c == d) && a.value == "" && k < form.elements.length - 1) for (k = k + 1; k < form.elements.length; k++) {
                j = form.elements[k];
                if (j.type == "password" && j.value == "") {
                    c = a;
                    a = j;
                    break
                } else if (j.type != "hidden") break
            }
            a.value = c.value = b;
            fire_onchange(a);
            fire_onchange(c);
            if (typeof LP != "undefined") {
                b = {};
                b.target = a;
                LP.lpfieldchange(b);
                b.target = c;
                LP.lpfieldchange(b)
            }
        } else lpReportError("Couldn't find password fields after generating. form:" + form, null)
    } else if (c == "0") {
        lpReportError("Could not find lpgenpassforms when generating pw", null);
        lpdbg("error", "url " + a + " is not in lpgenpassforms[]")
    }
}

function LP_InputClickToSubmit(a, b, c) {
    for (var d = a.getElementsByTagName("input"), e = 0, g = 0; g < d.length; g++) if (d[g].form == b) if ("password" == d[g].type && d[g].value != "") e = 1;
    else if (c == d[g].type) if (e && c != "button") {
        d[g].click();
        return 1
    }
    if ("button" == c) {
        c = null;
        d = a.getElementsByTagName("button");
        for (g = 0; g < d.length; g++) if (d[g].form == b) if ("button" == d[g].type || "submit" == d[g].type || "image" == d[g].type) if (e) if (c) {
            if ("submit" == d[g].type) c = d[g]
        } else c = d[g];
        if (c) {
            c.click();
            return 1
        }
    }
    return 0
}
this.LPJSON = {};
if (typeof ischrome == "undefined") {
    this.JSON = this.LPJSON;
    if (typeof JSON == "undefined") var JSON = this.JSON,
        LPJSON = this.LPJSON
}(function() {
    function a(f) {
        return f < 10 ? "0" + f : f
    }
    function b(f) {
        e.lastIndex = 0;
        return e.test(f) ? '"' + f.replace(e, function(p) {
            var o = k[p];
            return typeof o === "string" ? o : "\\u" + ("0000" + p.charCodeAt(0).toString(16)).slice(-4)
        }) + '"' : '"' + f + '"'
    }
    function c(f, p) {
        var o, h, n, s, u = g,
            t, y = p[f];
        if (y && typeof y === "object" && typeof y.toJSON === "function") y = y.toJSON(f);
        if (typeof l === "function") y = l.call(p, f, y);
        switch (typeof y) {
        case "string":
            return b(y);
        case "number":
            return isFinite(y) ? String(y) : "null";
        case "boolean":
        case "null":
            return String(y);
        case "object":
            if (!y) return "null";
            g += j;
            t = [];
            if (l && typeof l === "object") {
                s = l.length;
                for (o = 0; o < s; o += 1) {
                    h = l[o];
                    if (typeof h === "string") if (n = c(h, y)) t.push(b(h) + (g ? ": " : ":") + n)
                }
            } else for (h in y) if (Object.hasOwnProperty.call(y, h)) if (n = c(h, y)) t.push(b(h) + (g ? ": " : ":") + n);
            n = t.length === 0 ? "{}" : g ? "{\n" + g + t.join(",\n" + g) + "\n" + u + "}" : "{" + t.join(",") + "}";
            g = u;
            return n
        }
    }
    if (typeof ischrome != "undefined" && typeof Date.prototype.toJSON !== "function") {
        Date.prototype.toJSON = function() {
            return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + a(this.getUTCMonth() + 1) + "-" + a(this.getUTCDate()) + "T" + a(this.getUTCHours()) + ":" + a(this.getUTCMinutes()) + ":" + a(this.getUTCSeconds()) + "Z" : null
        };
        String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function() {
            return this.valueOf()
        }
    }
    var d = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        e = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        g, j, k = {
            "\u0008": "\\b",
            "\t": "\\t",
            "\n": "\\n",
            "\u000c": "\\f",
            "\r": "\\r",
            '"': '\\"',
            "\\": "\\\\"
        },
        l;
    if (typeof LPJSON.stringify !== "function") LPJSON.stringify = function(f, p, o) {
        var h;
        j = g = "";
        if (typeof o === "number") for (h = 0; h < o; h += 1) j += " ";
        else if (typeof o === "string") j = o;
        if ((l = p) && typeof p !== "function" && (typeof p !== "object" || typeof p.length !== "number")) throw Error("JSON.stringify");
        return c("", {
            "": f
        })
    };
    if (typeof LPJSON.parse !== "function") LPJSON.parse = function(f, p) {
        function o(n, s) {
            var u, t, y = n[s];
            if (y && typeof y === "object") for (u in y) if (Object.hasOwnProperty.call(y, u)) {
                t = o(y, u);
                if (t !== undefined) y[u] = t;
                else delete y[u]
            }
            return p.call(n, s, y)
        }
        var h;
        d.lastIndex = 0;
        if (d.test(f)) f = f.replace(d, function(n) {
            return "\\u" + ("0000" + n.charCodeAt(0).toString(16)).slice(-4)
        });
        if (/^[\],:{}\s]*$/.test(f.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) {
            h = eval("(" + f + ")");
            return typeof p === "function" ? o({
                "": h
            }, "") : h
        }
        throw new SyntaxError("JSON.parse");
    }
})();
