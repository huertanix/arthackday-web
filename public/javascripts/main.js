function updateContainer(wH){
	// executed everytime the window size changes, and on load

	// hero block height
	$('#landing-header').css({
		'height': $(window).height()
	});
	if($('.event-callout #sub-hero').length < 0){
		var eventCallout = $('.event-callout').height();
		eventCallout = - (eventCallout / 2);
		$('.event-callout').css({
			'margin-top': eventCallout
		});
	}
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




var sxsw = {

    full_bleed: function(boxWidth, boxHeight, imgWidth, imgHeight) {

        // Calculate new height and width...
        var initW = imgWidth;
        var initH = imgHeight;
        var ratio = initH / initW;

        imgWidth = boxWidth;
        imgHeight = boxWidth * ratio;

        // If the video is not the right height, then make it so...     
		
        if(imgHeight < boxHeight){
            imgHeight = boxHeight;
            imgWidth = imgHeight / ratio;
        }
		
		
        //  Return new size for video
        return {
            width: imgWidth,
            height: imgHeight
        };

    },

};


function videoResize(){
	 //get pixel size of browser window.
	var browserHeight = Math.round($(window).height());
    var browserWidth = Math.round($(window).width());
	
	console.log(browserHeight);
	console.log(browserWidth);
	//jquery all items on page with fill tag
	var fills = $('#about-video, video');
	console.log(fills )
	
	
	//for each fill, recalculate size and position and apply using jQuery
	fills.each(function () {
		
	//height of element. not neccessarily video
    var videoHeight = 540;
    var videoWidth = 960;


	//calculate new size
    var new_size = sxsw.full_bleed(browserWidth, browserHeight, videoWidth, videoHeight);
    console.log(new_size);

	//distance from top and left is half of the difference between the browser width and the size of the element
    $(this)
        .width(new_size.width)
        .height(new_size.height)
		.css("margin-left", ((browserWidth - new_size.width)/2))
		.css("margin-top", ((browserHeight - new_size.height)/2));
		
	});
}

function isThere(element){
	if($(element).length !== 0){
		return true;
	}else{
		return false;
	}
}

$(function(){
	
	// call updateContainer on load and on resize
   	updateContainer();	
    $(window).resize(function() {
    	updateContainer();
    	if (isThere('#about-page')){
    		videoResize();
    	}
    });

    // for the about section
	if ($('#about-page').length === 1) {
		videoResize();
	}
    

	// FOOTER
	$('#social-section svg').hover(         
		function () {
           $(this).attr('fill','#5000ff');
        }, 
        function () {
           $(this).attr('fill','#ffffff');
        }
    );

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

	// for the event 
	if(isThere('#event-video')){
		$('#event-video').fitVids();
	}

	// for the project page
	if(isThere('#project')){
		$('.project-item').fitVids();
	}


	if(isThere('#hero')){
		var heroText = $("#hero").html();
		var heroLength = heroText.length;
		$('#hero').fitText(heroLength * .08);
	}

	// for the about page
	if(isThere('#about-page')){
		var myPlayer = videojs('#about-video');
		$('#about-video-container').click(function(){
			$('.big-play').hide();
			// $('#about-video').trigger('click');
			myPlayer.play();
		});

		$('#play-button-svg').mouseenter( function(){
			// mouseing onto the play icon
			var polygon = $($(this).find('polygon'));
			polygon.attr('fill', '#ffffff');
		}).mouseleave( function(){
			// mousing off the play icon 
			var polygon = $($(this).find('polygon'));
			polygon.attr('fill', 'none');
		});
	}	


});





//credit to Alexander Stek, web developer. @ http://epicwebsites.com/
//additional credit to Drew Baker on StackOverflow, original post http://stackoverflow.com/questions/4380105/html5-video-scale-modes

