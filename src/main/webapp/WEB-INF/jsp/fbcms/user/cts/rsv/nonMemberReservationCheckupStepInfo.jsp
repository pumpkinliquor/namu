<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!-- contents s -->
<div class="contents w1200">

	<div class="box_tit">
		<strong>검진상담 예약 절차안내</strong>
	</div>

	<ol class="re_step">
		<li class="line2">검진정보<br>입력</li>
		<li>예약 신청</li>
		<li class="line2">상담전화 후<br>예약확정</li>
		<li class="line2">택배 발송 및<br> 검진 준비물 수령</li>
	</ol>

	<div class="btn_Lbox"><!-- btn box -->
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationMain.do');" class="btn bgreen">이전</a>
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationCheckup.do');" class="btn bblue">예약하기</a>
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