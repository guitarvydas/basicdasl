/*
[hello] < (hello_r) > (hello_s) {
  on hello_r: send (hello_s) "Hello";
}
*/

function Hello () {
    return {
	initialize: function () {
	},
	handler: function (e) {
	    if ("hello_r" === e.tag) {
		engine.send ("hello_s", "Hello");
	    } else {
		error (`hello received illegal event ${e.tag} /${e.data}/\n`);
	    }
	}
    }
}
