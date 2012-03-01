/*
Should output:
    Function(name:__global__, parent:None)
    executeWithFive := function(['fn']){...}
    adder := function(['x', 'y']){...}
    t2 := t1 (['adder'])
    z := executeWithFive
    adder := function(['x', 'y']){...}
    ----------------------------------------

    Function(name:executeWithFive, parent:__global__)
    t3 := fn (['a', 5])
    return t3
    ----------------------------------------

    Function(name:adder, parent:__global__)
    t4 := x + y
    return t4
    ----------------------------------------
*/

function executeWithFive(fn){
    return fn(a, 5);
}

var z = executeWithFive(function adder(x, y) {return x + y;});