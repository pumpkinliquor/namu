
$(function(){
	// utill leng
	$('.utill p').click(function(event) { 
		if($(this).next().is(':hidden')){
			$(this).next().slideDown();
		}else{
			$(this).next().slideUp();
		}
	});
	$('.utill ul a').click(function(event) {
		$('.utill li > ul').slideUp();
	});

	/* snb */
	$('.snb > ul > li > a').on('click',function(event) {
		if($(this).next('ul').is(':hidden')){
			$(this).addClass('on');
			$(this).next('ul').stop().slideDown('swing');
		}else{
			$(this).removeClass('on');
			$(this).next('ul').stop().slideUp('swing');
		}
	});
	$('.snb > ul ul li').on('click',function(event) {
		var txt = $(this).children('a').text();
		$(this).parents('.snb > ul ul').stop().slideUp('swing');
		$(this).parents('.snb > ul > li ul').prev('a').text(txt);
		$(this).parents('.snb > ul > li ul').prev('a').removeClass('on');
	});
});
