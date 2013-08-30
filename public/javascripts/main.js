$(function(){
	// for hero block
	var windowHeight = $(window).height(); 
	$('#landing-header').css({
		'height': windowHeight
	});
	var eventCallout = $('.event-callout').height();
	eventCallout = - (eventCallout / 2);
	$('.event-callout').css({
		'margin-top': eventCallout
	});
	
	// $('body').waypoint(function(direction) {
	// 	if(direction === 'down'){
	// 		$('#nav').addClass('not-top');
	// 	}else{
	// 		$('#nav').removeClass('not-top');
	// 	}
	// },{offset: -1});
});