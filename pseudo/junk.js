function gen () {
    var i = scopeGet ("counter");
    scopeModify ("counter", i + 1);
    return i.toString ();
}

function closeb (depth, c) {
    let previous = scopeGet ('previousIndentation');
    let s = '';
    let n = asNumber (depth);
    let p = previous;
    while (p > n) {
	process.stderr.write (`${n} ${p}\n`);
	s = s + c;
	n = n + 1;
    };
    return s;
}

function shiftIndentation (depth) {
    scopeModify ('previousIndentation', depth);
    return '';
}

