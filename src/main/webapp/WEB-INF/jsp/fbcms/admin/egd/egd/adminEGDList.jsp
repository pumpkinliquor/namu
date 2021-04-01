<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">안저판독 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#searchBgnDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#searchEndDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#searchBgnDe').datepicker("option", "maxDate", $("#searchEndDe").val());
		$('#searchBgnDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchEndDe").datepicker( "option", "minDate", selectedDate );
		});
		$('#searchEndDe').datepicker("option", "minDate", $("#searchBgnDe").val());
		$('#searchEndDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchBgnDe").datepicker( "option", "maxDate", selectedDate );
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		document.listForm.searchCnd.focus();
	}
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectEGDList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertEGDView() {
		document.listForm.action = "<c:url value='/admin/egd/egd/insertEGDView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectEGDDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/egd/egd/selectEGDDetail.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/egd/egd/selectEGDList.do'/>" method="post" onSubmit="selectEGDList(); return false;">
	<!-- 검색 -->
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCnd" value="0" />
							<input type="text" name="searchWrd" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">등록일</th>
					<td class="ta_l">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectEGDList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="nttId" type="hidden" value="0">
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<caption>${pageTitle} <spring:message code="title.list" /></caption>
		<colgroup>
			<col style="width:7%">
			<col style="width:10%">
			<col style="">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>첨부파일</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td>
						<c:if test="${resultInfo.custom1 eq '1'}">검사</c:if>
						<c:if test="${resultInfo.custom1 eq '2'}">결과</c:if>
					</td>
					<td class="ta_l"><a href="#none" onclick="javascript:selectEGDDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td>
						<c:if test="${not empty resultInfo.atchFileId}">
							<a href="#none" onclick="javascript:fnAtchDownFile('${resultInfo.atchFileId}', '0');" class="btn sm">다운로드</a>
						</c:if>
					</td>
					<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
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
	<a href="#none" onclick="javascript:insertEGDView()" class="btn_ty03">등록하기</a>
</div>
