// Basic Test
/* 
Upon completion of alpha-renaming, the following should happen:
1. All functions renamed
2. All formal parameters renamed
3. All identifiers renamed accordingly
*/
function localVars(x, y){
    var a = 6;
    function innerVars(){
        var a = 10;
        b = a;
    }
    var b = 7;
    function innerVars2(){
        var c = 11;
        var d = b;
    }
    innerVars();
    return b;
}
localVars(3,4);
function secondFunc(x){
    var inSec = 60;
    var a = inSec;
    var b = a;
    
    for(var i = 0; i < 10; i++){
        var p = 5;
    }
}
secondFunc(5);
for(var x in ob){
	var p = x;
}


