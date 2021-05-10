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

