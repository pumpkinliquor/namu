<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
/***************************
 * 예약조회 페이지 이동
 ***************************/
function fnRSVList(usrId){
	window.location.href = "/user/cts/rsv/userRSVList.do";
}
</script>
<!-- contents s -->
<div class="contents">

	<div class="box_tit">
		<p>진료 예약 또는 검진예약을 선택해주세요</p>
	</div>

	<div class="box_gate gate_border">
		<a href="/user/cts/rsv/userRSVClinic.do" class="b_gate03">진료 예약</a> 
		<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="b_gate04">검진 예약</a>
	</div>

	<div class="box_tit02">
		<p>예약을 조회하시려면 아래의 예약 조회하기를 선택해주세요</p>
	</div>
	<div class="box_gate gate_border mb0">
		<a href="/user/cts/rsv/userRSVList.do" class="b_gate05">예약 조회</a>
	</div>


</div>
<!-- //contents e -->

<form>

</form>