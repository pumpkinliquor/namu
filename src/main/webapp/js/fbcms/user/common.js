$(window).resize(function(){
	/* width */
	if($(window).outerWidth() >= 1200){
		var W = ($(window).outerWidth() - 1200) / 2;
		$('header article').outerWidth(340 + W);// 퀵메뉴 width
		$('.con04_slide').outerWidth(900 + W);// 나무병원 의료진 width
	}
});

$(function(){

	/* header */
	$(window).scroll(function(){ // gnb 고정
		var scrollV = $(document).scrollTop();
		$('.header').removeClass('headfix');
		$('.container').css('margin-top','');
		if(scrollV >= 79 ){
			$('.header').addClass('headfix');
			$('.container').css('margin-top','130px');
			$('.maincon').css('margin-top','79px');
		}
	});

	$('.utill p').click(function(event) { // utill leng
		if($(this).next().is(':hidden')){
			$(this).next().slideDown();
		}else{
			$(this).next().slideUp();
		}
	});
	$('.utill ul a').click(function(event) {
		$('.utill li > ul').slideUp();
	});

	$('.gnb').on('mouseenter focusin', function(){ // gnb
		$('.gnb_back').stop().slideDown(200);
		$('.head article').stop().slideDown(200);
	});
	// 1206 수정
	$('.gnb > ul > li').on('mouseenter focusin', function(){
		//if($(this).children('div').is(':hidden')){
		$('.gnb > ul > li > div').stop().slideUp(200);
		$(this).children('div').stop().slideDown(200);

		$('.gnb > ul > li > a').removeClass('active');
		$(this).children('a').addClass('active');
		//}
		if($(this).children('div').children('ul').children('li').length >= 5){
			$(this).children('div').children('ul').css('background','url(/images/fbcms/user/bg_gnb.png) repeat-y 0 0');
		}else{
			$(this).children('div').children('ul').css('background','url(/images/fbcms/user/bg_gnb02.png) repeat-y 0 0');
		}
	});
	$('.gnb').on('mouseleave', function(){
		$('.gnb_back').stop().slideUp(200);
		$('.head article').stop().slideUp(200);
		$('.gnb > ul > li > a').removeClass('active');
		$('.gnb > ul > li').children('div').stop().slideUp(200);
	});
	$('.head article li:last-child a').on('focusout', function(){
		$('.gnb_back').stop().slideUp(200);
		$('.head article').stop().slideUp(200);
		$('.gnb > ul > li > a').removeClass('active');
		$('.gnb > ul > li').children('div').stop().slideUp(200);
	});
	$('h1').on('focusin', function(){
		$('.gnb_back').stop().slideUp(200);
		$('.head article').stop().slideUp(200);
		$('.gnb > ul > li > a').removeClass('active');
		$('.gnb > ul > li').children('div').stop().slideUp(200);
	});


	/* width */
	if($(window).outerWidth() >= 1200){
		var W = ($(window).outerWidth() - 1200) / 2;
		$('header article').outerWidth(340 + W);// 퀵메뉴 width
		$('.con04_slide').outerWidth(900 + W);// 나무병원 의료진 width
	}else{
		$('header article').outerWidth(340);
		$('.con04_slide').outerWidth(900);
	}

	/* top 버튼 */
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 200 ) {
			$( '.btn_top' ).fadeIn();
		} else {
			$( '.btn_top' ).fadeOut();
		}
	});
	$( '.btn_top' ).click( function() {
		$( 'html, body' ).animate( { scrollTop : 0 }, 100 ,'swing');
		return false;
	});

	/* 메인 컨텐츠 이동 버튼 */
	$( window ).scroll( function() {
		var winscr =  $( this ).scrollTop() + 300;

		$('.con_find a').each(function(){
			if (winscr >= 2981) {
				$('.con_find a').removeClass('active');
				$('.find04').addClass('active');
			}
			else if(winscr >= 1987){
				$('.con_find a').removeClass('active');
				$('.find03').addClass('active');
			}else if(winscr >= 1002){
				$('.con_find a').removeClass('active');
				$('.find02').addClass('active');
			}else{
				$('.con_find a').removeClass('active');
				$('.find01').addClass('active');
			}
		});
	});
	/*$('.con_find a').click(function(event) {
		if($(this).hasClass('find01')) {
			$('html,body').animate({ scrollTop : 50 },300,'swing', function() {
				$('.con_find a').removeClass('active');
				$('.find01').addClass('active');
			});
		}else if ($(this).hasClass('find02')) {
			$('html,body').animate({ scrollTop : 1002 },300,'swing', function() {
				$('.con_find a').removeClass('active');
				$('.find02').addClass('active');
			});
		}else if ($(this).hasClass('find03')) {
			$('html,body').animate({ scrollTop : 1987},300,'swing', function() {
				$('.con_find a').removeClass('active');
				$('.find03').addClass('active');
			});
		}else{
			$('html,body').animate({scrollTop : 2981},300,'swing', function() {
				$('.con_find a').removeClass('active');
				$('.find04').addClass('active');
			});
		}
	});*/

	/* tab */
	var tabs = $('.tab_list li, .tab_list02 li').length;
	$('.tab_list li, .tab_list02 li').css('width', 1200 / tabs);

	$('.tab_list li, .tab_list02 li').click(function(event) {
		 var i = $(this).index();
		$('.tab_list li, .tab_list02 li').removeClass('selected');
		$(this).addClass('selected');
		$('.tab_list li a, .tab_list02 li a').attr('title','');
		$(this).children('a').attr('title','선택된 탭');
		$(".tab_box").hide();
		$('.tab_box').eq(i).show();
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
