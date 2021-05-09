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
    return s[0];
}

function aend (s) {
    return `[${changeUnicodeQuotes((s.substr(1)).trim ().replace (" ", ","))}]`;
}

