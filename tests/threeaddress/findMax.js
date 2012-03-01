// function tryFunc(a, b){
    // if (a == b) {
        // return a + b;
    // } 
    // a - b;
    // return a - b;
// }

// z = new tryFunc(3, 5);
// var b = z;

function findMax(arr){
    if (arr.length == 0)
        return "Invalid array";
    if (arr.length == 1)
        return arr[0];
    var max = arr[0];
    var i = 1;
    for (i = 1; i < arr.length; i = i + 1){
        if (arr[i] > max)
            max = arr[i];
    }
    return max;
}