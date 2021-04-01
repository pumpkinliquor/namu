<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">채용공고 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#customDate1").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#customDate2").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#customDate1').datepicker("option", "maxDate", $("#customDate2").val());
		$('#customDate1').datepicker("option", "onClose", function (selectedDate) {
			$("#customDate2").datepicker( "option", "minDate", selectedDate );
		});
		$('#customDate2').datepicker("option", "minDate", $("#customDate1").val());
		$('#customDate2').datepicker("option", "onClose", function (selectedDate) {
			$("#customDate1").datepicker( "option", "maxDate", selectedDate );
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
	function selectEPAList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertEPAView() {
		document.listForm.action = "<c:url value='/admin/epm/epa/insertEPAView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectEPADetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/epm/epa/selectEPADetail.do'/>";
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

<form name="listForm" action="<c:url value='/admin/epm/epa/selectEPAList.do'/>" method="post" onSubmit="selectEPAList(); return false;">
	<!-- 검색 -->
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="width:34%;">
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l"> 제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCnd" value="0" />
							<input type="text" name="searchWrd" class="w_full" title="제목" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
					<th scope="row" class="ta_l"> 직군</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="custom2" class="w_full" title="직군" value='<c:out value="${searchVO.custom2}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">모집기간</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="customDate1" name="customDate1" value="<c:out value='${searchVO.customDate1}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="customDate2" name="customDate2" value="<c:out value='${searchVO.customDate2}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectEPAList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="nttId" type="hidden" value="0">
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="border_box option_bx">
	<div class="btns ta_l">
		<ul>
			<li>
				<a href="javascript:void(0);" class="sm btn_down">엑셀 다운로드</a>
			</li>
		</ul>
	</div>
</div>

<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:10%">
			<col style="width:10%">
			<col style="">
			<col style="width:20%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>경력</th>
				<th>직군</th>
				<th>제목</th>
				<th>모집기간</th>
				<th>등록일</th>
				<th>지원자</th>
				<th>게시여부</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td>
						<c:if test="${resultInfo.custom1 eq '1'}">경력</c:if>
						<c:if test="${resultInfo.custom1 eq '2'}">신입</c:if>
						<c:if test="${resultInfo.custom1 eq '3'}">무관</c:if>
					</td>
					<td><c:out value="${resultInfo.custom2}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:selectEPADetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td><c:out value="${resultInfo.customDate1}"/>~<c:out value="${resultInfo.customDate2}"/></td>
					<td><c:out value="${resultInfo.frstRegisterPnttm}"/></td>
					<td><c:out value="${resultInfo.appCnt}"/></td>
					<td><c:out value="${resultInfo.postingYn}"/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="8"><spring:message code="common.nodata.msg" /></td>
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
	<a href="#none" onclick="javascript:insertEPAView()" class="btn_ty03">등록하기</a>
</div>
