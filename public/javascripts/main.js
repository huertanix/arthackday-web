$(function(){
	// hero block height
	var windowHeight = $(window).height(); 
	$('#landing-header').css({
		'height': windowHeight
	});
	var eventCallout = $('.event-callout').height();
	eventCallout = - (eventCallout / 2);
	$('.event-callout').css({
		'margin-top': eventCallout
	});

	// nav bar expand and contract
	$('.back-to-top').click(function(){
		$("html, body").animate({ scrollTop: 0 }, "slow");
	});
	$('body').waypoint(function(direction) {
		if(direction === 'down'){
			$('#nav-main').removeClass('slideDown').addClass('slideUp');
			$('#nav-drop').removeClass('slideUp invisible').addClass('slideDown');
		}else{
			$('#nav-main').removeClass('slideUp').addClass('slideDown');
			$('#nav-drop').removeClass('slideDown').addClass('slideUp');
		}
	},{offset: -40});


	// footer email appear
	$('#signup').click(function(){
		$(this).hide();
		$('#signup-input').show();
	});

});