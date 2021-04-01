$(document).ready(function() {
	resize();
});
$(window).resize(function() {
	resize();
});
function resize() {

}

$(function(){
	//nav
	$('.header_gnb').click(function(){
		$('.gnb_box nav').animate({right : 0},300);
		$('.gnb_box nav').show();
		$('body').css('overflow','hidden');
	});
	$('.btn_gnb_close').click(function(){
		$('.gnb_box nav').animate({right :'-100%'},300);
		$('body').css('overflow','');
	});

	$('.gnb .depth01').click(function(){
		$('.gnb .depth01').removeClass('active');
		$('.gnb .depth02').hide();
		$(this).addClass('active');
		$(this).find('.depth02').show();
	});

	//snb
	$('.snb p').click(function(){
		if($(this).next('ul').is(':hidden') === true){
			$(this).next('ul').slideDown();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_snb_up.png) no-repeat right,#046a92',
				backgroundSize:'37px'
			})
		}else{
			$(this).next('ul').slideUp();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_snb.png) no-repeat right,#046a92',
				backgroundSize:'37px'
			})
		}
	});

	$('.snb ul li').click(function(){
		var txt = $(this).children().text();
		$('.snb p').text(txt);
		$('.snb ul').slideUp();
	});

	//tab
	$('.tab_box:eq(0)').show();
	$('.tab_list li, .tab_list02 li').click(function(event) {
		 var i = $(this).index();
		$('.tab_list li, .tab_list02 li').removeClass('selected');
		$(this).addClass('selected');
		$('.tab_list li a, .tab_list02 li a').attr('title','');
		$(this).children('a').attr('title','선택된 탭');
		$(".tab_box").hide();
		$('.tab_box').eq(i).show();
	});
	
	//tab slider
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 'auto',
        paginationClickable: true,
        spaceBetween:0,
        freeMode: true,
		pagination: false
    });

    //특화 img size 1210
    $('.section02 ul li img').height($('.section02 ul li img').width() * 0.556);
    $('.clinic_a09 div img').height($('.clinic_a09 div img').width() * 0.556); /* 1214 추가 */
});


/* 파일 초기화 */
function fileInit(element) {
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    // ie 일때 input[type=file] init.
	    $(element).replaceWith( $(element).clone(true) );
	} else {
	    //other browser 일때 input[type=file] init.
	    $(element).val('');
	}
};