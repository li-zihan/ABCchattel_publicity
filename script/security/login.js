
$(function() {
	document.onkeydown = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			$('#loginform').submit();
		}
	}
});

$(document).ready(function() {
	$('input')[0].focus();
});

jQuery(document).ready(function(){
	jQuery("#loginform").validationEngine();
});

function fn_refresh_img() {
	var imgcode = document.getElementById('imgcode');
	imgcode.src = basePath + 'security/imgcode.html?arg=' + Math.random();
}
function submit(){
	$("form").submit();
}

function op(){
	
	window.open(basePath+"security/bada.html");
}