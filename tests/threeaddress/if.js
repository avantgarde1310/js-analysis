/*
Should result in: 

    Function(name:__global__, parent:None)
    a := 3
    b := 6
    t1 := a == 3
    t0 := t1
    t2 := a - b
    b := t2
    t3 := a + b
    b := t3
    ----------------------------------------

*/

var a = 3;
var b = 6;

if (a == 3){
    b = a + b;
}
else {
    b = a - b;
}


