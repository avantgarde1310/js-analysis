//write({a:5,b:6,c:7});
//var a = {testField1:5, testField2:6};
//var z = {
//    m : function(domainInfo){
//        for (var x in {a:5,b:6}){
//            document.write(x);
//        }
//    }
//};


//var z = {
//    m : function(domainInfo){
//        for (var x in objectInit){
//            document.write(x);
//        }
//    }
//};

FilterSet.prototype = {
  // Return a new FilterSet containing the subset of this FilterSet's entries
  // which relate to the given domain or any of its superdomains.  E.g.
  // sub.foo.com will get items['global', 'foo.com', 'sub.foo.com'] and
  // exclude['foo.com', 'sub.foo.com'].
    _viewFor: function(domain) {
      var result = new FilterSet();
      result.items['global'] = this.items['global'];
      var parts = domain.split('.');
      var nextDomain = parts[parts.length -1];
      for (var i = parts.length-2; i >=0; i--) {
        nextDomain = parts[i] + '.' + nextDomain;
        if (this.items[nextDomain])
          result.items[nextDomain] = this.items[nextDomain];
        if (this.exclude[nextDomain])
          result.exclude[nextDomain] = this.exclude[nextDomain];
      }
      return result;
    },

  // Get a list of all Filter objects that should be tested on the given
  // domain, and return it with the given map function applied.
    filtersFor: function(domain, mapper) {
      var limited = this._viewFor(domain);
      var data = {};
      // data = set(limited.items)
      for (var subdomain in limited.items) {
        var entry = limited.items[subdomain];
        for (var i = 0; i < entry.length; i++) {
          var filter = entry[i];
          data[filter.id] = filter;
        }
      } 
      // data -= limited.exclude
      for (var subdomain in limited.exclude) {
        for (var filterId in limited.exclude[subdomain]) {
          delete data[filterId];
        }
      }
      var result = [];
      for (var k in data) {
        result.push(mapper(data[k]));
      }
      return result;
    },

  // Return the filter that matches this url+elementType on this pageDomain:
  // the filter in a relevant entry in this.items who is not also in a 
  // relevant entry in this.exclude.
    matches: function(url, loweredUrl, elementType, pageDomain, isThirdParty) {
      var limited = this._viewFor(pageDomain);
      for (var k in limited.items) {
        var entry = limited.items[k];
        for (var i = 0; i < entry.length; i++) {
          var filter = entry[i];
          if (!filter.matches(url, loweredUrl, elementType, isThirdParty))
            continue; // no match
          // Maybe filter shouldn't match because it is excluded on our domain?
          var excluded = false;
          for (var k2 in limited.exclude) {
            if (limited.exclude[k2][filter.id]) {
              excluded = true;
              break;
            }
          }
          if (!excluded)
            return filter;
        }
      }
  
      return null;
    }
};

a = {b:5,c:6,d:7};

//var z = {
//    funcccca : function testOne(){
//      var a = {};
//      var b = {};
//      var c = {};
//    }
//}
//var a = {};
//var b = {};
//var c = {};


//var a = {
//    propOne  : 5,
//    propTwo  : function(domainName){
//                   var b = {};
//                   var c = 6;
//               },
//    propThree: "chrome"
//};
