'use strict';
// empty

function gen () {
    var i = scopeGet ("counter");
    scopeModify ("counter", i + 1);
    return i.toString ();
}

function resetBlock () {
    scopeAdd ('block' , 0);
}

function convertIndentationToBlockNumber (octoString) {
    return octoString.length;
}

function asNumber (s) {
    return parseInt (s, 10);
}

