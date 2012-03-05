/*
Basic test for threeaddress.py.

Should output:

    Function(name:__global__, parent:None)
    - a := 5
    - b := __undefined__
    - c := __undefined__
    - t0 := document . 0
    - d := t0
    - t1 := 5 * b
    - t2 := a + t1
    - e := t2
    - t3 := 3 * a
    - t4 := 5 * b
    - t5 := t4 / c
    - t6 := t3 + t5
    - f := t6
    - g := a
    ----------------------------------------

*/

var a = 5;
var b;
var c;
var d = document[0]; 
var e = a + 5 * b;
var f = 3 * a + 5 * b / c;
var g = +a;