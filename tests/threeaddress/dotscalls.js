/*
Test for dot operators and call operators for threeaddress.py.

Should output: 
    Function(name:__global__, parent:None)
    - a := 5
    - b := 7
    - t0 := chrome . tabs
    - t1 := t0 . open
    - t2 := t1 ([5, 'process'])
    - c := t2
    - t3 := document . open
    - t4 := t3 ([12643])
    - t5 := t4 . process
    - t6 := t5 (['a', 'b'])
    - d := t6
    - t7 := a . b
    - t8 := t7 . c
    - t9 := t8 . d
    - e := t9
    - t10 := document . close
    - t11 := t10 . process
    - t12 := differencer ([7, 6])
    - t13 := adder ([5, 6])
    - t14 := t11 (['t12', 't13'])
    - f := t14
    ----------------------------------------
*/

var a = 5;
var b = 7;

var c = {};
var d = document.open(12643).process(a, b);
c.d.e.f = "ghi";
c.d = "abc";
c = b;
var e = a.b.c.d;
var f = document.close.process(differencer(7,6), adder(5, 6));