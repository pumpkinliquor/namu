<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title"/></c:set>
<h3 class="mid_tit mg_t50">자주하는 질문 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		//검색어 엔터 
		$('input[name=searchWrd]').on('keydown', function(key) {
			if (key.keyCode == 13) {
				selectFaqList();
			}
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
	function selectFaqList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertFaqView() {
		document.listForm.action = "<c:url value='/admin/hpm/faq/insertFaqView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectFaqDetail(faqId) {
		// 사이트 키값(siteId) 셋팅.
		document.listForm.faqId.value = faqId;
	  	document.listForm.action = "<c:url value='/admin/hpm/faq/selectFaqDetail.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateFaqView(faqId) {
		document.listForm.faqId.value = faqId;
	  	document.listForm.action = "<c:url value='/admin/hpm/faq/updateFaqView.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/hpm/faq/selectFaqList.do'/>" method="post" onSubmit="selectFaqList(); return false;">
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
							<input type="hidden" name="searchCnd" value="0" />
							<input type="text" name="searchWrd" class="w_full" size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" />
						</div>
					</td>
					<th scope="row" class="ta_l">게시여부</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select name="postingYn" class="select">
								<option value="">선택하세요</option>
								<option value="Y"<c:if test="${searchVO.postingYn eq 'Y'}"> selected</c:if>>Y</option>
								<option value="N"<c:if test="${searchVO.postingYn eq 'N'}"> selected</c:if>>N</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">등록일</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="datepicker02" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="datepicker02" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectFaqList()" class="btn_ty02">검색하기</a>
	</div>
	<input type="hidden" name="faqId" value="">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
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
		<caption>${pageTitle} <spring:message code="title.list" /></caption>
		<colgroup>
			<col style="width:7%">
			<col style="">
			<col style="width:20%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>질문</th>
				<th>등록일</th>
				<th>게시여부</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<c:set var="subject">${resultInfo.qestnSj }</c:set>
				<c:if test="${not empty resultInfo.categoryNm }">
					<c:set var="subject"><${resultInfo.categoryNm}> ${resultInfo.qestnSj }</c:set>
				</c:if>
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateFaqView('<c:out value="${resultInfo.faqId}"/>')"><c:out value='${fn:substring(subject, 0, 100)}'/></a></td>
					<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
					<td><c:out value='${resultInfo.postingYn}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="4"><spring:message code="common.nodata.msg" /></td>
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
	<a href="#none" onclick="javascript:insertFaqView()" class="btn_ty03">등록하기</a>
</div>
