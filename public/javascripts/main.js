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

function orderParticipants(participantsContainer){
	
	var participants = participantsContainer.find('.participant');
   	var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

   	for(var i=0; i<str.length; i++){
      	var nextChar = str.charAt(i);
      	participants.each(function(){
      		var part = $(this).find('.name span').html();
	      	if(part.charAt(0) === nextChar){
	      		if($("#" + nextChar + "-group").length > 0){
	      			$("#" + nextChar + "-group").append($(this));
	      		}else{
	      			var group = '<div class="participant-group" id="' + nextChar + '-group"><h2>' + nextChar + '</h2></div>';
	      			participantsContainer.append(group);
	      			var group = $("#"+nextChar+"-group");
	      			group.append($(this));
	      		}
	      	}	      		
      	});
   	}
   	var leftover = participantsContainer.find('> .participant');
   	$(leftover).each(function(){
		if($("#rest-group").length > 0){
			$("#rest-group").append($(this));
		}else{
			var group = '<div class="participant-group" id="rest-group"><h2>*</h2></div>';
			participantsContainer.append(group);
			var group = $("#rest-group");
			group.append($(this));
		}
   	});
}

function videoResize(test){
	var height = $('#landing-header').height();
	var width = $('#landing-header').width();
	var RATIO = 0.54375;

	if((height/width) < RATIO){
		$('iframe').height(height/RATIO).width(width);
		var videoHeight = height/RATIO;
		var diff = (height - videoHeight) / 2;
		$('iframe').css({top: diff, left: 0});			
	}else{
		$('iframe').height(height).width(width/RATIO);
		var videoWidth = width/RATIO;
		var diff = (width - videoWidth) /2;
		$('iframe').css({left: diff, top:0});	
	}
}


$(function(){
	
	// call updateContainer on load and on resize
   	updateContainer();	
    $(window).resize(function() {
    	updateContainer();
    	if ($('#about-page').length === 1){
    		videoResize();
    	}
    });

    // for the about section
	if ($('#about-page').length === 1) {
		videoResize();
	}
    



	// nav bar expand and contract
	// $('.back-to-top').click(function(){
	// 	$("html, body").animate({ scrollTop: 0 }, "slow");
	// });
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
	if ($('#events-page,#project-page,.space').length > 0) {
		console.log('here');
		$('#nav-main').addClass('black-on-white');
		$('#white-logo').hide();
		$('#black-logo').show();
	}

	$('.name').click(function(){
		var $partAdditional = $(this).parent().find('.participant-additional');
		var $arrow = $(this).find('svg g polyline');
		console.log($arrow);
		if($(this).hasClass('selected')){
			$(this).removeClass('selected');
			$partAdditional.slideUp(100);
			$arrow.attr('stroke','#5000ff');
		}else{
			$(this).addClass('selected');
			$partAdditional.slideDown(100);
			$arrow.attr('stroke','#000000');
		}
	});

	orderParticipants($('.participants-all'));


});