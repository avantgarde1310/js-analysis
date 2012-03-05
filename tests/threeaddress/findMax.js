/*
Test for threeaddress.py on an arbitrary function.

Should output:
    Function(name:__global__, parent:None)
    - findMax := function(['arr']){...}
    ----------------------------------------

    Function(name:findMax, parent:__global__)
    - t1 := arr . length
    - t2 := t1 == 0
    - t0 := t2
    - return Invalid array
    - t4 := arr . length
    - t5 := t4 == 1
    - t3 := t5
    - t6 := arr . 0
    - return t6
    - t7 := arr . 0
    - max := t7
    - i := 1
    - t9 := arr . length
    - t10 := i < t9
    - t8 := t10
    - i := 1
    - t12 := ++ i
    - t11 := t12
    - t14 := arr . i
    - t15 := t14 > max
    - t13 := t15
    - t16 := arr . i
    - max := t16
    - t18 := i < 1000
    - t17 := t18
    - t20 := ++ i
    - t19 := t20
    - return max
    ----------------------------------------
    
*/

function findMax(arr){
    if (arr.length == 0)
        return "Invalid array";
    if (arr.length == 1)
        return arr[0];
    var max = arr[0];
    var i = 1;
    for (i = 1; i < arr.length; i++){
        if (arr[i] > max)
            max = arr[i];
    }
    do {
        i++;
    } while (i < 1000);
    return max;
}