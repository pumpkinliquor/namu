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
	function selectHTMList(custom1) {
		document.listForm.custom1.value = custom1;
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectHTMDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/hti/htm/selectHTMDetail.do'/>";
	  	document.listForm.submit();
	}
-->
</script>

<!-- contents s -->
<div class="contents">

	<form name="listForm" method="POST" action="<c:url value='/user/hti/htm/selectHTMList.do'/>"><!-- 검색 -->
		<div class="search_input mt40 mar20"><!-- 검색 -->
			<input type="hidden" name="nttId" value="0">
			<input type="hidden" name="custom1" value="<c:out value='${searchVO.custom1}'/>" />
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="searchCnd" value="0" />
			<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색버튼">
		</div>
	</form>
	
	<ul class="ex_list mar20">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<li>
				<a href="#none" onclick="javascript:selectHTMDetail('<c:out value="${resultInfo.nttId}"/>')">
					<c:if test="${not empty resultInfo.listFile and not empty resultInfo.listFile[1] }">
						<img src="/getImage/${resultInfo.listFile[1].streFileNm }" alt="<c:out value='${resultInfo.listFile[1].orignlFileNm}'/>">
					</c:if>
					<strong><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- paginate -->
	<div class="paginate">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
	</div>
	<!-- //paginate -->