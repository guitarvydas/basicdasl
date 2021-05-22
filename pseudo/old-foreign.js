'use strict';
// empty

function gen () {
    var i = scopeGet ("counter");
    scopeModify ("counter", i + 1);
    return i.toString ();
}

function changeUnicodeQuotes (s) {
    return s.replace("”",'"').replace("“",'"');
}

function abegin (s) {
    return s;
}

function aend (s) {
    return `[${changeUnicodeQuotes(s.trim ().replace (" ", ","))}]`;
}


function incDepth () {
    var i = scopeGet ("depth");
    scopeModify ("depth", i + 1);
    return i + 1;
}
function decDepth () {
    var i = scopeGet ("depth");
    scopeModify ("depth", i - 1);
    return i - 1;
}

function tab (depth) {
    let i = depth;
    while (i > 0) {
	process.stderr.write ('  ');
	i -= 1;
    }
}

function resetCounter () {
    scopeAdd ('counter', 0);
}

function resetLineNumber () {
    scopeAdd ('line', 0);
}

function incLineNumber () {
    var n = scopeGet ('line');
    scopeModify ('line', n + 1);
}

function sideEffectNewObject () {
    scopeAdd ('Object', "id" + gen ());
    return "";
}

function getObject () {
    return scopeGet ('object');
}

function newTextObject () {
    scopeAdd('textobject', "tid" + gen ());
}

function getTextObject () {
    return scopeGet('textobject');
}

function newContainer () {
    var container = getObject ();
    scopeAdd ('container', container);
    newObject ();
}    

function newArrow () {
    scopeAdd ("arrow", "a" + gen ());
}

function getArrow () {
    return scopeGet ('arrow');
}
