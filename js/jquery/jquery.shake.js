jQuery.fn.extend({
	shake: function() {
		return this.each(function() {
			$(this).hover(function() {
				$(this).css({
					"position": "relative"
				});
				$(this).animate({
					"top": "20px"
				}, 250).animate({
					"top": "0px"
				}, 250).animate({
					"top": "20px"
				}, 250).animate({
					"top": "0px"
				}, 250);
			}).mouseout(function() {
				$(this).stop().animate({ "top": "0px" });
				$(this).stop().animate({ "top": "0px" });
				$(this).stop().animate({ "top": "0px" });
			});
		});
       }
});

function getArr(n){
	var a = [],
	    m = 0,
	    s;

	a.length = n+1;

	s = a.toString().replace(/,/g, function() {
		return ++m;
	});

	return s.split("");
}

document.write(getArr(5));
