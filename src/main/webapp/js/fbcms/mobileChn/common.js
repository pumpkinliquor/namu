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
		$(this).addClass('active');
	});

	/* top 버튼 */
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 200 ) {
			$( '.btn_top' ).fadeIn();
		} else {
			$( '.btn_top' ).fadeOut();
		}
	});


});
