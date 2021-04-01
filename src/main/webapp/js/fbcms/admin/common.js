
$(function(){

	/*** Form ***/
	if($("input[type='checkbox']").length > 0){
		$("input[type='checkbox']").ezMark();
	}
	if($("input[type='radio']").length > 0){
		$("input[type='radio']").ezMark();
	}

	/*** Gnb ***/
	$('.two_depth_wrap').closest('li').addClass('dep');

	var header = $('header');
	var gnb = $('.gnb .nav > li');
	var gnb_li = $('.gnb .nav > li > a');
	var gnb_dep = $('.gnb .nav > li.dep > a');

	gnb_li.bind('mouseover focusin',function(){
		gnb_close();
	});
	gnb_dep.bind('mouseover focusin',function(){
		$(this).closest(header).addClass('over');
		gnb.removeClass('over');
		$(this).closest('li').addClass('over');
		$(this).next('.two_depth_wrap').css('margin-left',- $(this).next('.two_depth_wrap').children('ul').outerWidth() / 2);
	});

	header.mouseleave(function(){
		gnb_close();
	});
	function gnb_close(){
		header.removeClass('over');
		gnb.removeClass('over');
	};

	/*** LNB ***/
	$('.sm_lnb').closest('li').addClass('btn_lnb');
	toggleAcc(); //lnb 아코디언
	leftToggle();//left메뉴 토글
	$('.sm_lnb > li').each(function() { // 2depth 아코디언 표시
		var has_sm = $(this).find('ul').length;
		if(has_sm) {
			$(this).find('> a').addClass('has_sm');
			$(this).find('> a').attr('href', '#n');
		}
	});
	toggleAccSmSm(); // 2depth 아코디언

	/*** cta btn ***/
	$('.btn_cta').on('click',function(){
		$('body').toggleClass('cta_open');
	});

	/*** 토글 검색 테이블 ***/
	$('.btn_tog_tbl').on('click',function(){
		if($('.tog_board').css('display') == "none") {
			$(this).addClass('open');
			$('.tog_board').slideDown();
		} else {
			$(this).removeClass('open');
			$('.tog_board').slideUp();
		}
	});

	/*** quick_menu ***/
	$('.quick_menu .btn_quick_menu').on('click',function(){
		$('.quick_menu').toggleClass('on');
	});

	/*** 팝업 ***/
	$('.pop_top .pop_close').on('click',function(){
		$('.lypop_wrap').fadeOut(function(){
			$('body').removeClass('pop_open');
		});
	});

}); //$(function(){})


/*** LNB ***/
function leftToggle(){
	var btnL = $('.left_menu').children('.btn_left_menu');
	btnL.on('click',function(){
		$('body').toggleClass('lnb_chk');
	})
}

function toggleAcc(){
	var acc_btn = $('.lnb > li.btn_lnb > a');
	var acc_pan = $('.lnb > li >.sm_lnb');
	acc_btn.on('click',function(e){
		e.preventDefault();
		var ta = $(this);
		var tp = ta.parent();
		var tps = tp.siblings();
		var tn = ta.next('.sm_lnb');

		if(!tp.hasClass('on')){
			acc_btn.removeClass('on');
			tp.addClass('on');
			tp.siblings().find('.has_sm').removeClass('on');
			tp.siblings().find('.sm_sm_lnb').hide();
			tps.removeClass('on');
			tps.children('.sm_lnb').removeClass('on');
			acc_pan.slideUp(400);

			if(!tn.hasClass('on')){
				tn.slideDown(400);
				tn.addClass('on');
			}
		}
	});
};

function toggleAccSmSm() {
	$('.sm_lnb > li > a.has_sm').on('click', function(e) {
		e.preventDefault();
		if($(this).next().is(':hidden')){
			$(this).addClass('on');
			$(this).next('.sm_sm_lnb').slideDown();
			$(this).parent().siblings().find('.sm_sm_lnb').slideUp();
			$(this).parent().siblings().find('.on').removeClass('on');
		}else{
			$(this).next('.sm_sm_lnb').slideUp();
			$(this).removeClass('on');							
		}
	});
};

/*** 팝업 ***/
function pop_open(obj){
	$('body').addClass('pop_open');
	$(obj).fadeIn();
};
function pop_close(obj){
	$(obj).fadeOut(function(){
		$('body').removeClass('pop_open');
	});
};


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

$( document ).ready(function() {
	// 셀렉트 박스
	$('.d_box').click(function(){
				var onscroll = $(this).siblings('.child_drop');
				var index = $(this).siblings('.child_drop').children('li.on').index();
				var hH = $(this).siblings('.child_drop').children('li').height();
		if ($(this).children('a').hasClass('on')) {

		}else{
			$('.chk_drop .d_tag').removeClass('on');
			$('.chk_drop .child_drop').hide();
			$(this).children('a').addClass('on');
			$(this).siblings('.child_drop').show();
			$(onscroll).scrollTop(index*27);
		}
	});
	// 셀렉트 박스 항목 선택 시 이벤트
	$('.child_drop label').click(function(){
		var t1 = $(this).text();
		var s1 = $(this).parents('li');
		var t2= $(this).parents().parents('.child_drop').siblings('.d_box').children('a').children('p');
		var $chbox =$('.child_drop li label').find('.chk_ty[type="checkbox"]');
		$chbox.change(function(){
			var countChk = $chbox.filter(':checked').length - 1;
			if(countChk < 0){
				countChk = 0;
			}
			$(t2).text( "외" + countChk + "건");
		 });
	});
	// 셀렉트 닫기
	$("body").click(function(event){
		if ( !$(event.target).closest( ".chk_drop" ).length ) {
			$('body').find('.d_tag.on').removeClass('on');
			$(".child_drop").hide();
		}
	});

});
