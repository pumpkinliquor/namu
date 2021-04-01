<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">

/*********************************************************
 * 초기화
 *********************************************************/
function fnInit() {
	// 예약일시
	var FIRST_ADD_DT = '${reservationInfo.FIRST_ADD_DT}'.split('/');
	$("#FIRST_ADD_DT").html(FIRST_ADD_DT[0]);
	$("#FIRST_ADD_TIME").html(FIRST_ADD_DT[1]);
	
	// 예약상태
	$("select[name=APPO_STAT_CD]").val('${reservationInfo.APPO_STAT_CD}').prop('selected',true);
	
	// 예약상태 변경시
	$("select[name=APPO_STAT_CD]").change(function(){
		fnUpdateAppoStat();		// 예약상태 저장
    });
}

/*********************************************************
 * 예약상태 Update
 *********************************************************/
function fnUpdateAppoStat() {
	document.updateForm.APPO_STAT_CD.value = $("select[name=APPO_STAT_CD]").val();
	document.updateForm.action="<c:url value='/admin/rcm/ors/updateAppoStat.do'/>";
	document.updateForm.submit();
}

/*********************************************************
 * 수정
 *********************************************************/
function fnUpdateReservation() {
	document.updateForm.action="<c:url value='/admin/rcm/ors/updateORSView.do'/>";
	document.updateForm.submit();
}

</script>

<h3 class="mid_tit mg_t50">외래예약</h3>

<p class="te_ri_txt">
	<em class="ootc">*</em>필수입력 항목 입니다.
</p>
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 15%;">
			<col span="1" style="width: 35%;">
			<col span="1" style="width: 15%;">
			<col span="1" style="">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>진료과</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.MEDI_SBJ_NM}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>의료진</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.DR_NM}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약자</th>
				<td class="ta_l"><a href="javascript:void(0);"><c:out value="${reservationInfo.SEL_APPO_PRSN_NM}"/></a></td>
				<th scope="row" class="ta_r"><em class="ootc">*</em>본인 외 예약</th>
				<td class="ta_l"><a href="javascript:void(0);"><c:out value="${reservationInfo.OTHER_PRSN_NM}"/></a></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>성별</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.GENDER_NM}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약일시</th>
				<td class="ta_l" colspan="3">
					<c:out value="${reservationInfo.APPO_DT}"/>
					<span class="mg_l20"><c:out value="${reservationInfo.APPO_TIME}"/></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.BIRTH_DT}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">휴대폰</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.MOBILE_PHONE_NO}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">전화번호</th>
				<td class="ta_l" colspan="3"><c:out value="${reservationInfo.PHONE_NO}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">등록일</th>
				<td class="ta_l" colspan="3">
					<span id="FIRST_ADD_DT"></span>
					<span class="mg_l20" id="FIRST_ADD_TIME"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">예약상태</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="APPO_STAT_CD">
							<c:forEach var="appoStatCdList" items="${appoStatCdList}" varStatus="status">
								<option value="${appoStatCdList.CODE}">${appoStatCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnUpdateReservation();" class="btn_ty02"> 수정하기 </a>
	<a href="/admin/rcm/ors/selectORSList.do" class="btn_ty"> 목록으로 </a>
</div>

<form action="" method="post" name="updateForm">
	<input type="hidden" name="APPO_NO" value="${reservationInfo.APPO_NO}" />
	<input type="hidden" name="USER_ID" value="${reservationInfo.USER_ID}" />
	<input type="hidden" name="APPO_STAT_CD" value="" />
</form>
