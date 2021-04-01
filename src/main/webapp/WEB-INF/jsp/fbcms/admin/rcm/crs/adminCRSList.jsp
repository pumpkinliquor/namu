<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
	// 달력설정
	$("#ntceBgnDe").datepicker({
		dateFormat : 'yy.mm.dd'
	});
	$("#ntceEndDe").datepicker({
		dateFormat : 'yy.mm.dd'
	});
	
	// 달력 유효일자 처리
	$("#ntceBgnDe").datepicker("option", "maxDate", $("#ntceEndDe").val());
	$("#ntceBgnDe").datepicker("option", "onClose", function(selectedDate) {
		$("#ntceEndDe").datepicker("option", "minDate", selectedDate);
	});
	$("#ntceEndDe").datepicker("option", "minDate", $("#ntceBgnDe").val());
	$("#ntceEndDe").datepicker("option", "onClose", function(selectedDate) {
		$("#ntceBgnDe").datepicker("option", "maxDate", selectedDate);
	});
	
	// 조회 조건 입력
	if ('${reservationVO.APPO_DT}' !== null	&& '${reservationVO.APPO_DT}' !== '')
		$("select[name=searchType]").val('APPO_DT').prop("selected", true);
	else if ('${reservationVO.FIRST_ADD_DT}' !== null && '${reservationVO.FIRST_ADD_DT}' !== '')
		$("select[name=searchType]").val('FIRST_ADD_DT').prop("selected", true);
	
	$("input[name=BGN_DATE]").val('${reservationVO.BGN_DATE}'.replace(/\-/g, "."));
	$("input[name=END_DATE]").val('${reservationVO.END_DATE}'.replace(/\-/g, "."));
	$("select[name=EXMN_PROG_CD]").val('${reservationVO.EXMN_PROG_CD}').prop("selected", true);
	$("select[name=APPO_STAT_CD]").val('${reservationVO.APPO_STAT_CD}').prop("selected", true);
}

/*********************************************************
 * 엔터값 이벤트
 ******************************************************** */
function enter() {
	if (window.event.keyCode == 13) {
		fnMemberSearch();
	}
}

/*********************************************************
 * 페이징 처리
 ******************************************************** */
function fnSelectLinkPage(pageNo, BGN_DATE, END_DATE) {
	document.reservationInfoForm.pageIndex.value = pageNo;
	document.reservationInfoForm.BGN_DATE.value = $("input[name=BGN_DATE]").val().replace(/\-/g, ".");
	document.reservationInfoForm.END_DATE.value = $("input[name=END_DATE]").val().replace(/\-/g, ".");
	document.reservationInfoForm.action = "<c:url value='/admin/rcm/crs/selectCRSList.do'/>";
	document.reservationInfoForm.submit();
}

/*********************************************************
 * 상세 페이지
 ******************************************************** */
function fnMemberDetail(APPO_NO) {
	document.detailForm.APPO_NO.value = APPO_NO;
	document.detailForm.action = "<c:url value='/admin/rcm/crs/selectCRSDetail.do'/>";
	document.detailForm.submit();
}

/*********************************************************
 * 검색하기
 ******************************************************** */
function fnMemberSearch() {
	document.searchForm.action = "<c:url value='/admin/rcm/crs/selectCRSList.do'/>";
	
	if (document.searchForm.searchType.value === "APPO_DT")
		document.searchForm.APPO_DT.value = document.searchForm.BGN_DATE.value;
	else if (document.searchForm.searchType.value === "FIRST_ADD_DT")
		document.searchForm.FIRST_ADD_DT.value = document.searchForm.BGN_DATE.value;
	
	document.searchForm.submit();
}

/*********************************************************
 * 엑셀다운
 ******************************************************** */
function fnExcelDown() {
	document.searchForm.action = "<c:url value='/admin/rcm/crs/selectCRSListExcel.do'/>";
	
	if (document.searchForm.searchType.value === "APPO_DT")
		document.searchForm.APPO_DT.value = document.searchForm.BGN_DATE.value;
	else if (document.searchForm.searchType.value === "FIRST_ADD_DT")
		document.searchForm.FIRST_ADD_DT.value = document.searchForm.BGN_DATE.value;
	
	document.searchForm.submit();
}

</script>


<form action="" method="post" name="searchForm">
<!-- 검색 -->
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 12%;">
			<col span="1" style="width: 34%;">
			<col span="1" style="width: 12%;">
			<col span="1" style="">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_l">예약자명</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" maxlength="40" class="w_full" name="APPO_PRSN_NM" value="<c:out value='${reservationVO.APPO_PRSN_NM}'/>" onkeypress="enter();">
					</div>
				</td>
				<th scope="row" class="ta_l">검진프로그램</th>
				<td class="ta_l">
					<div class="select_wrap">
						<select class="select" name="EXMN_PROG_CD">
							<option value="">선택하세요</option>
							<c:forEach var="exmnProgCdList" items="${exmnProgCdList}" varStatus="status">
								<option value="${exmnProgCdList.CODE}">${exmnProgCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_l">
					<div class="select_wrap">
						<select class="select" name="searchType">
							<option value="APPO_DT">예약일</option>
							<option value="FIRST_ADD_DT">등록일</option>
						</select>
					</div>
				</th>
				<td class="ta_l">
					<div class="tab_date_wrap">
						<div class="input_wrap">
							<input type="text" id="ntceBgnDe" class="inp_txt wd110 date_pick" title="" placeholder=""
									name="BGN_DATE"	value="<c:out value='${reservationVO.BGN_DATE}'/>"> 
							<span> - </span> 
							<input type="text" id="ntceEndDe" class="inp_txt wd110 date_pick" title="" placeholder=""
									name="END_DATE"	value="<c:out value='${reservationVO.END_DATE}'/>">
						</div>
					</div>
				</td>
				<th scope="row" class="ta_l">상태</th>
				<td class="ta_l">
					<div class="select_wrap">
						<select class="select" name="APPO_STAT_CD">
							<option value="">선택하세요</option>
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
	<a href="javascript:fnMemberSearch();" class="btn_ty02"> 검색하기 </a>
	<a href="" class="btn_ty"> 취소하기  </a>
</div>
<!-- //검색 -->
<input type="hidden" name="APPO_DT" />
<input type="hidden" name="FIRST_ADD_DT" />
</form>

<div class="border_box option_bx">
	<div class="btns ta_l">
		<ul>
			<li><a href="javascript:fnExcelDown();" class="sm btn_down"> 엑셀 다운로드 </a></li>
		</ul>
	</div>
</div>
<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width: 7%">
			<col style="">
			<col style="width: 10%">
			<col style="width: 15%">
			<col style="width: 20%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>검진프로그램</th>
				<th>예약자</th>
				<th>등록일</th>
				<th>예약일시</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reservationList}" var="reservationInfo" varStatus="status">
				<tr>
					<td><c:out
							value="${reservationListTotCnt - ((reservationVO.pageIndex-1) * reservationVO.pageSize + status.index)}" />
					</td>
					<td class="ta_l">
						<a href="javascript:fnMemberDetail('${reservationInfo.APPO_NO}')"><c:out value='${reservationInfo.EXMN_PROG_NM}' /></a>
					</td>
					<td><c:out value='${reservationInfo.APPO_PRSN_NM}' /></td>
					<td><c:out value='${reservationInfo.FIRST_ADD_DT}' /></td>
					<td><c:out value='${reservationInfo.APPO_DT}' /></td>
					<td><c:out value='${reservationInfo.APPO_STAT_NM}' /></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(reservationList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="6"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage" />
</div>
<!-- //paginate -->

<form action="" method="post" name="detailForm">
	<input type="hidden" name="APPO_NO" value="" />
</form>
<form action="" method="post" name="reservationInfoForm">
	<input type="hidden" name="pageIndex" value="" >
	<input type="hidden" name="BGN_DATE" value="" >
	<input type="hidden" name="END_DATE" value="" >
</form>
