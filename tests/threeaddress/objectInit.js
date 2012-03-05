/*
Test for object initialization for threeaddress.py

Should output:

    Function(name:__global__, parent:None)
    - t0 := fakeEvent ref target
    - t1 := document . body
    - t0 := t1 deref
    - t2 := fakeEvent ref url
    - t2 := bgImage deref
    - t3 := fakeEvent ref mustBePurged
    - t3 := true deref
    - t4 := fakeEvent ref preventDefault
    - t4 := lambda0 deref
    - t5 := fakeEvent ref type
    - t5 := beforeload deref
    - fakeEvent := __objectInit__
    - lambda0 := function([]){...}
    ----------------------------------------

    Function(name:lambda0, parent:__global__)
    ----------------------------------------

*/

var fakeEvent = {
    target: document.body,
    url: bgImage,
    mustBePurged: true,
    preventDefault: function(){},
    type: "beforeload"
};