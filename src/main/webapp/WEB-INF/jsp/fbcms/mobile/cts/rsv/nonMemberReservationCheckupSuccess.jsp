<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

		<!-- contents s -->
		<div class="contents">
			<h4 class="con_in_tit04 mar20">검진예약하기</h4>
			<p class="con_in_txt mar20">온라인 예약을 이용하시는 경우, 
			<span class="c_gray3 fw_500">저희 상담간호사가 확인전화를 드려 예약확정</span> 
			및 주의사항 안내를 도와드리겠습니다 </p>

			<p class="step mar20 mt30">
				<span class="fl c_point">예약완료</span>
				<span class="fr"><strong class=" c_point">STEP 03</strong> / 03</span>
			</p>

			<div class="box_blue mar20">
				<ul>
					<li>검진 예약 및 변경은 5일 전까지 가능합니다</li>
					<li>검진 신청일로부터 5일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
					<li><span>문의전화</span><a href="tel:1577-7502">1577-7502</a></li>
				</ul>
			</div>

			<section class="re_list">
				<header class="complete">감사합니다
					<strong>신청하신 예약은 가예약으로 확정 여부는 별도로 연락드리겠습니다</strong>
				</header>
				<p class="con_in_txt">귀하의 비에비스 나무병원 검진 예약 신청이 완료되었습니다<br>
					예약하신 정보는 다음과 같습니다</p>
				<ul class="box_complete">
					<li><strong>이름</strong>${userCheckupVO.usrNm}</li>
					<li><strong>휴대폰</strong>${userCheckupVO.fCtn}-${userCheckupVO.mCtn}-${userCheckupVO.lCtn}</li>
					<li><strong>검진프로그램</strong>${userCheckupVO.DTIL_NM}</li>
					<li><strong>예약일시</strong>${fn:substring(userCheckupVO.RSVDT, 0,4)}.${fn:substring(userCheckupVO.RSVDT, 4,6)}.${fn:substring(userCheckupVO.RSVDT, 6,8)}</li>
					<%--
					<li><strong>예약일시</strong>${fn:substring(userCheckupVO.RSVDT, 0,4)}.${fn:substring(userCheckupVO.RSVDT, 4,6)}.${fn:substring(userCheckupVO.RSVDT, 6,8)}<span>${fn:substring(userCheckupVO.RSVTM, 0,2)}:${fn:substring(userCheckupVO.RSVTM, 2,4)}</span></li>
					 --%>
				</ul>
				<div class="btn_Lbox"><!-- btn box -->
					<a href="/index.do" class="btn btn02 bgreen">메인</a>
					<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationMain.do');" class="btn btn02 bblue">예약조회</a>
				</div>
			</section>

		</div>
		<!-- //contents e -->

		<!-- layer: 예약신청 완료 s -->
		<div class="layer">
			<h5 class="layer_tit">예약신청 완료</h5>
			<p class="layer_txt"><span class="c_gray3">신청된 예약은</span> <span class="c_point">가예약입니다</span><br>
				상담간호사가 별도로 연락을 드린 후 예약이 확정됩니다</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn bblue close">확인</a>
			</div>
			<a href="javascript:void(0);" class="layer_close">닫기</a>
		</div>
		<!-- //layer: 예약신청 완료 e -->


<form method="post" action="" id="reservationForm" name="reservationForm">
	<input type="hidden" id="APPO_PRSN_NM" name="APPO_PRSN_NM" value="${userCheckupVO.usrNm}">
	<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO" value="${userCheckupVO.fCtn}-${userCheckupVO.mCtn}-${userCheckupVO.lCtn}">
	<input type="hidden" id="BIRTH_DT" name="BIRTH_DT" value="${userCheckupVO.usrBd}">
	<input type="hidden" id="GENDER_CD" name="GENDER_CD" value="${userCheckupVO.gender}">
</form>


<script>
	/* layer */
	$(window).load(function(event) {
		$('.layer').after('<div class="dim"></div>');
		$('.layer').show();
		$('.layer').attr('tabindex', -1).focus();
		$('.layer').css({
			marginTop: - $('.layer').outerHeight() / 2
		});
	});
	$('.layer_close,.layer .close').click(function(event) {
		$('.dim').remove();
		$('.layer').hide();
		$('.layer').removeAttr('tabindex').blur();
	});
	
	function fnGetProcess(usrId){
		document.reservationForm.action = usrId;
		document.reservationForm.submit();
	}
</script>