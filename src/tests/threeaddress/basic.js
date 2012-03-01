/*
Should output:

    Function(name:__global__, parent:None)
    a := 5
    b := 6
    t0 := 5 * b
    t1 := a + t0
    c := t1
    t2 := 3 * a
    t3 := 5 * b
    t4 := t3 / c
    t5 := t2 + t4
    d := t5
    ----------------------------------------

*/

var a = 5;
var b = 6;
var c = a + 5 * b;
var d = 3 * a + 5 * b / c;

