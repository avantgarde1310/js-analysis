// var a = 5;
// var a = {};

a.b(function(){return 5;});
a().b;
a.b();
chrome.extensions.sendRequest();

a().b.c().d(x, 5).
// f();
// obj(selector).forEach(function(){return 5;});
// Right operand is a dot expression
// a.b.c.d.e;
// function z(){return a.b.c;}
// Right operand is a call + dot expression
// var d = a.c();
// var e = {};
// var f = {};
// // Left operand is a dot expression
// e.g = c.d;

// f.b = chrome.bookmarks.add();