function triple(x, y, z){
    return [x, y, z];
}

function first(list){
    return list[0];
}

function second(list){
    return list[1];
}

function last(list){
    return list[list.length - 1];
}

function butfirst(list){
    return list.slice(1, list.length);
}

function butlast(list){
    return list.slice(0, list.length - 1);
}

function leaf(letter, weight){
    return triple("leaf", letter, weight);
}

function isLeaf(leaf){
    return first(leaf) === "leaf";
}

function weight(leaf){
    return last(leaf);
}

function letter(leaf){
    return second(leaf);
}

function tree(branch0, branch1){
    return triple(branch0, branch1, weight(branch0) + weight(branch1));
}

function branch0(tree){
    return first(tree);
}

function branch1(tree){
    return second(tree);
}

var aleaf = leaf("A", 8);
var bcd = tree(leaf("B", 3), tree(leaf("C", 1), leaf("D", 1)));
console.log(isLeaf(aleaf));
console.log(weight(aleaf));
console.log(letter(aleaf));
console.log(weight(bcd));
console.log(letter(branch0(bcd)))

function decodeHelper(x, fn, tree){
    return x[0] + fn(tree, butfirst(x));
}

function decode(tree, code){
    if(code.length === 0){
        return "";
    }
    return decodeHelper(decodeOne(tree, code), decode, tree)
}

function decodeOne(tree, code){
    if(isLeaf(tree)){
        return letter(tree) + code;
    }
    if(first(code) == "0"){
        return decodeOne(branch0(tree), butfirst(code));
    }
    if(first(code) == "1"){
        return decodeOne(branch1(tree), butfirst(code));
    }
}
var efgh = tree(tree(leaf("E", 1), leaf("F", 1)), tree(leaf("G", 1), leaf("H", 1)));
var abcdefgh = tree(aleaf, tree(bcd, efgh));

console.log(decodeOne(abcdefgh, "10001010"));
console.log(decode(abcdefgh, "10001010"));

function encodings(tree){
    var list = [];
    function encodingsHelper(tree, code){
        if(isLeaf(tree)) {list.push([letter(tree), code]); return;}
        encodingsHelper(branch0(tree), code + "0");
        encodingsHelper(branch1(tree), code + "1");
    }
    encodingsHelper(tree, "");
    return list;
}

console.log(encodings(abcdefgh))