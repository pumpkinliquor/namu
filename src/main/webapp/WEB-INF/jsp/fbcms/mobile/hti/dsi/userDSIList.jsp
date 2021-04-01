<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
	});
	
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
	function selectDSIList(custom1) {
		document.listForm.custom1.value = custom1;
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectDSIDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/hti/dsi/selectDSIDetail.do'/>";
	  	document.listForm.submit();
	}
-->
</script>

<!-- contents s -->
<div class="contents">

	<form name="listForm" method="POST" action="<c:url value='/user/hti/dsi/selectDSIList.do'/>"><!-- 검색 -->
		<ul class="disease_box mar20">
			<c:forEach var="cmmCodeInfo" items="${listDSIComCode }" varStatus="status">
				<c:set var="customClass"></c:set>
				<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"><c:set var="customClass">active</c:set></c:if>
				<c:if test="${status.count + 1 eq fn:length(listDSIComCode) and fn:length(listDSIComCode) % 3 eq 2}"><c:set var="customClass">${customClass} bott</c:set></c:if>
				<c:if test="${status.last and fn:length(listDSIComCode) % 3 eq 2}"><c:set var="customClass">${customClass} bott right</c:set></c:if>
				<c:if test="${status.last and fn:length(listDSIComCode) % 3 eq 1}"><c:set var="customClass">${customClass} bott right</c:set></c:if>
				<li class="${customClass}">
					<a href="#none" onclick="javascipt:selectDSIList('${cmmCodeInfo.code}')"><c:out value="${cmmCodeInfo.codeNm }" /></a>
				</li>
			</c:forEach>
		</ul>
		
		<div class="search_input mar20"><!-- 검색 -->
			<input type="hidden" name="nttId" value="0">
			<input type="hidden" name="custom1" value="<c:out value='${searchVO.custom1}'/>" />
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="searchCnd" value="0" />
			<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색버튼">
		</div>
	</form>
	
	<ul class="tbox">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<li>
				<a href="#none" onclick="javascript:selectDSIDetail('<c:out value="${resultInfo.nttId}"/>')">
					<strong><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></strong>
					<span class="c_blue">
						<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
							<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
						</c:forEach>
					</span>
					<span class="date"><c:out value='${resultInfo.frstRegisterPnttm}'/></span>
				</a>
			</li>
		</c:forEach>
	
		<c:if test="${fn:length(resultList) == 0}">
			<!-- 글이 없는 경우 -->
			<li class="nonelist">
				검색결과가 없습니다
			</li>
		</c:if>
	</ul>
	
	<!-- paginate -->
	<div class="paginate">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
	</div>
	<!-- //paginate -->
