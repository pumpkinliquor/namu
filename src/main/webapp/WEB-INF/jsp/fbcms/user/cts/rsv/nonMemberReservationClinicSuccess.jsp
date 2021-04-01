<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- contents s -->
<div class="contents w1200">

	<ul class="step reser_step"><!-- 진행 스텝 -->
		<li class="end"><span>완료</span>진료대상자 정보입력</li>
		<li class="end"><span>완료</span>진료정보 입력</li>
		<li class="selected"><span>완료</span>예약완료</li>
	</ul>

	<div class="box_blue">
		<ul>
			<li>진료 예약 및 변경은 2일 전까지 가능합니다</li>
			<li>진료 신청일로부터 2일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
			<li><span>문의전화</span>1577-7502</li>
		</ul>
	</div>

	<section class="re_login">
		<header class="complete">감사합니다
			<strong>신청하신 예약은 가예약으로 확정 여부는 별도로 연락드리겠습니다</strong>
		</header>
		<p>귀하의 비에비스 나무병원 진료 예약 신청이 완료되었습니다<br>
			예약하신 정보는 다음과 같습니다</p>
		<ul class="box_complete">
			<li>이름<strong>${userClinicVO.usrNm}</strong></li>
			<li>휴대폰<strong>${userClinicVO.fCtn}-${userClinicVO.mCtn}-${userClinicVO.lCtn}</strong></li>
			<li>진료과<strong>${userClinicVO.MEDI_SBJ_NM}</strong></li>
			<li>의료진<strong class="c_point">${userClinicVO.DR_NM}</strong></li>
			<li>예약일시<strong>${fn:substring(userClinicVO.RSV_DT, 0,4)}.${fn:substring(userClinicVO.RSV_DT, 4,6)}.${fn:substring(userClinicVO.RSV_DT, 6,8)}<span>${fn:substring(userClinicVO.RSV_TM, 0,2)}:${fn:substring(userClinicVO.RSV_TM, 2,4)}</span></strong></li>
		</ul>
		<div class="btn_Lbox"><!-- btn box -->
			<a href="/index.do" class="btn bgreen">메인</a>
			<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationList.do');" class="btn bblue">예약조회</a>
		</div>
	</section>


</div>
<!-- //contents e -->


<!-- layer: 예약신청 완료 s -->
<div class="layer w450">
	<h5 class="layer_tit">예약신청 완료</h5>
	<p class="layer_txt"><span class="c_gray3 fw_500">신청된 예약은</span> <span class="c_point fw_500">가예약입니다</span><br>
		상담간호사가 별도로 연락을 드린 후 예약이 확정됩니다</p>
	<div class="btn_Lbox"><!-- btn box -->
		<a href="javascript:void(0);" class="btn bblue close">확인</a>
	</div>
	<a href="javascript:void(0);" class="layer_close">닫기</a>
</div>
<!-- //layer: 예약신청 완료 e -->



<form method="post" action="" id="reservationForm" name="reservationForm">
	<input type="hidden" id="APPO_PRSN_NM" name="APPO_PRSN_NM" value="${userClinicVO.usrNm}">
	<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO" value="${userClinicVO.fCtn}-${userClinicVO.mCtn}-${userClinicVO.lCtn}">
	<input type="hidden" id="BIRTH_DT" name="BIRTH_DT" value="${userClinicVO.usrBd}">
	<input type="hidden" id="GENDER_CD" name="GENDER_CD" value="${userClinicVO.gender}">
</form>

<!-- //wrap e -->
<script>
	/* layer */
	$(window).load(function(event) {
		$('.layer').after('<div class="dim"></div>');
		$('.layer').show();
		$('.layer').attr('tabindex', -1).focus();
		$('.layer').css({
			marginLeft: - $('.layer').outerWidth() / 2,
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
