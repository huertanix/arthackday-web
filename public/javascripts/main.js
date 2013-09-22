function updateContainer(wH){
	// executed everytime the window size changes, and on load

	// hero block height
	$('#landing-header').css({
		'height': $(window).height()
	});
	var eventCallout = $('.event-callout').height();
	eventCallout = - (eventCallout / 2);
	$('.event-callout').css({
		'margin-top': eventCallout
	});
}


$(function(){
	
	// call updateContainer on load and on resize
   	updateContainer();	
    $(window).resize(function() {
    	updateContainer();
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

	//check if it's the events page
	if ($('#events-page').length > 0) {
		$('#nav-main').addClass('black-on-white');
		$('#white-logo').hide();
		$('#black-logo').show();
	}

});