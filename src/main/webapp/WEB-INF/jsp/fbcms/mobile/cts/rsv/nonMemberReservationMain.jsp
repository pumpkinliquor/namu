<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- contents s -->
<div class="contents">

	<div class="box_tit">
		<p>진료 예약 또는 검진예약을 선택해주세요</p>
	</div>

	<div class="box_gate gate_border">
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationClinic.do');" class="b_gate03">진료 예약</a> 
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationCheckupStepInfo.do');" class="b_gate04">검진 예약</a>
	</div>

	<div class="box_tit02">
		<p>예약을 조회하시려면 아래의 예약 조회하기를 선택해주세요</p>
	</div>
	<div class="box_gate gate_border mb0">
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationList.do');" class="b_gate05">예약 조회</a>
	</div>


</div>
<!-- //contents e -->

<form method="post" action="" id="reservationForm" name="reservationForm">
	<input type="hidden" id="APPO_PRSN_NM" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
	<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
	<input type="hidden" id="BIRTH_DT" name="BIRTH_DT" value="${appointmentVO.BIRTH_DT}">
	<input type="hidden" id="GENDER_CD" name="GENDER_CD" value="${appointmentVO.GENDER_CD}">
</form>
<script type="text/javascript">
function fnGetProcess(usrId){
	document.reservationForm.action = usrId;
	document.reservationForm.submit();
}
</script>