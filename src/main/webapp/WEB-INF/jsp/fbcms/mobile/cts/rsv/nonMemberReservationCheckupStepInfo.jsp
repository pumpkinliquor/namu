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
			
	<h5 class="con_in_tit01 mt40 mar20">예약절차 안내</h5>
			

	<ol class="re_step_list">
		<li>검진정보 입력</li>
		<li>예약신청</li>
		<li>상담 전화 후 예약 확정</li>
		<li>택비 발송 및 검진 준비물 수령</li>
	</ol>
	
	<div class="box_blue mar20">
		<ul>
			<li>검진 예약 및 변경은 5일 전까지 가능합니다</li>
			<li>검진 신청일로부터 5일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
			<li><span>문의전화</span><a href="tel:1577-7502">1577-7502</a></li>
		</ul>
	</div>

	<div class="btn_Lbox"><!-- btn box -->
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationMain.do');" class="btn btn02 bgreen">이전</a>
		<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationCheckup.do');" class="btn btn02 bblue">예약하기</a>
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
