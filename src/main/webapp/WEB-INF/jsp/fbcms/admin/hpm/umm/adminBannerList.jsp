<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">탑배너관리 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#ntceBgnde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#ntceEndde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#ntceBgnde').datepicker("option", "maxDate", $("#ntceEndde").val());
		$('#ntceBgnde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceEndde").datepicker( "option", "minDate", selectedDate );
		});
		$('#ntceEndde').datepicker("option", "minDate", $("#ntceBgnde").val());
		$('#ntceEndde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceBgnde").datepicker( "option", "maxDate", selectedDate );
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.articleForm.pageIndex.value = pageNo;
	   	document.articleForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectBannerList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertBannerView() {
		document.listForm.action = "<c:url value='/admin/hpm/umm/insertBannerView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateBannerView(bannerId) {
		document.listForm.bannerId.value = bannerId;
	  	document.listForm.action = "<c:url value='/admin/hpm/umm/updateBannerView.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/hpm/umm/selectBannerList.do'/>" method="post" onSubmit="selectBannerList(); return false;">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="width:34%;">
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCondition" value="1">
							<input type="text" name="searchKeyword" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${bannerVO.searchKeyword}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
					<th scope="row" class="ta_l">게시여부</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select name="postingYn" class="select">
								<option value="">선택하세요</option>
								<option value="Y"<c:if test="${bannerVO.postingYn eq 'Y'}"> selected</c:if>>Y</option>
								<option value="N"<c:if test="${bannerVO.postingYn eq 'N'}"> selected</c:if>>N</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">등록일</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="ntceBgnde" name="ntceBgnde" value="<c:out value='${bannerVO.ntceBgnde}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="ntceEndde" name="ntceEndde" value="<c:out value='${bannerVO.ntceEndde}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectBannerList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="bannerId" type="hidden" value="">
	<input name="pageIndex" type="hidden" value="<c:out value='${bannerVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="">
			<col style="width:20%">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>기간</th>
				<th>등록일</th>
				<th>게시여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="bannerInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((bannerVO.pageIndex-1) * bannerVO.pageSize + status.index)}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateBannerView('<c:out value="${bannerInfo.bannerId}"/>')"><c:out value='${fn:substring(bannerInfo.bannerNm, 0, 40)}'/></a></td>
					<td><c:out value='${bannerInfo.ntceBgnde}'/>~<c:out value='${bannerInfo.ntceEndde}'/></td>
					<td><c:out value='${bannerInfo.frstRegisterPnttm}'/></td>
					<td><c:out value='${bannerInfo.postingYn}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="5"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
</div>
<!-- //paginate -->

<div class="btns ta_r mt_m">
	<a href="#none" onclick="javascript:insertBannerView()" class="btn_ty03">등록하기</a>
</div>
