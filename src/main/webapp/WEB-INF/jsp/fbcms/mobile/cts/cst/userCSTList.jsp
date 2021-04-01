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
	function selectCSTList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertCSTView() {
		document.listForm.action = "<c:url value='/user/cts/cst/insertCSTView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectCSTDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/cts/cst/selectCSTDetail.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<!-- contents s -->
<div class="contents">
	
	<form name="listForm" action="<c:url value='/user/cts/cst/selectCSTList.do'/>" method="post" onSubmit="selectCSTList(); return false;">
		<div class="search_input mt40 mar20"><!-- 검색 -->
			<input type="hidden" name="nttId" value="0">
			<input type="hidden" name="custom1" value="<c:out value='${searchVO.custom1}'/>" />
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="searchCnd" value="0" />
			<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색버튼">
		</div>
	</form>
	
	<ul class="tbox tboxlist">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<li class="fw_500">
				<a href="#none" onclick="javascript:selectCSTDetail('<c:out value="${resultInfo.nttId}"/>')">
					<strong><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></strong>
					<span class="date"><c:out value='${resultInfo.frstRegisterPnttm}'/></span>
					<c:choose>
						<c:when test="${resultInfo.appCnt gt 0 }">
							<span class="state clear">답변완료</span>
						</c:when>
						<c:otherwise>
							<span class="state">대기</span>
						</c:otherwise>
					</c:choose>
				</a>
			</li>
		</c:forEach>
			
		<c:if test="${fn:length(resultList) == 0}">
			<!-- 글이 없는 경우 -->
			<li class="nonelist">
				상담내역이 없습니다
			</li>
		</c:if>
	</ul>
	
	<!-- paginate -->
	<div class="paginate">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
	</div>
	<!-- //paginate -->

	<div class="btn_Lbox bright"><!-- btn box -->
		<a href="#none" onclick="javascript:insertCSTView()" class="btn bblue">상담신청</a>
	</div>
