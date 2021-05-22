'use strict';
// empty

function resetBlock () {
    scopeAdd ('block' , 0);
}

function convertIndentationToBlockNumber (octoString) {
    return octoString.length;
}

function asNumber (s) {
    return parseInt (s, 10);
}


function emitopenparen (block) {
    return emitOpen (block, "(");
}

function emitcloseparen (block) {
    return emitClose (block, ")");
}

function emitopenbrace (block) {
    return emitOpen (block, "{");
}

function emitclosebrace (block) {
    return emitClose (block, "}\n");
}

function emitOpen (block, c) {
    let prevblock = scopeGet ('block');
    let s = '';
    let b = asNumber (block);
    if (b > prevblock) {
	while (b > prevblock) {
	    s = s + c;
	    b -= 1;
	}
	return spaces (block) + s + '\n';
    } else {
	return '';
    }
    }

function emitClose (block, c) {
    let prevblock = scopeGet ('block');
    let s = '';
    let b = asNumber (block);
    if (b < prevblock) {
	while (b < prevblock) {
	    s = s + c;
	    b += 1;
	}
	return spaces (block) + s + '\n';
    } else {
	return '';
    }
}

function shiftblock (block) {
    scopeModify ('block', block);
    return "";
}

function spaces (n) {
    let s = '';
    while (n > 0) {
	s = s + ' ';
	n -= 1;
    }
    return s;
}
