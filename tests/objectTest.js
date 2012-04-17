function browser_canLoad(event, data){
    LOADED_TOO_FAST.push({data:event});
    function nested(){write({a:5,b:6,c:7});}
    var a = {testField1:5, testField2:6};
    return a;
}
