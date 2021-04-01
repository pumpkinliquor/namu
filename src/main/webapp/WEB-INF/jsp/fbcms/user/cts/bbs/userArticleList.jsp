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
	function selectArticleList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectArticleDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/cts/bbs/selectArticleDetail.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/user/cts/bbs/selectArticleList.do'/>" method="post" onSubmit="selectArticleList(); return false;">
	<div class="search_input"><!-- 검색 -->
		<input type="hidden" name="nttId" value="0">
		<input type="hidden" name="searchCnd" value="0" />
	    <input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
		<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색버튼">
	</div>
</form>

<div class="tbox">
	<table>
		<caption>번호 제목 등록일자로 이루어진 리스트</caption>
		<colgroup>
			<col style="width:15%">
			<col style="">
			<col style="width:15%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">등록일자</th>
			</tr>
		</thead>
		<tbody>
			<!-- 공지사항 본문 -->
			<c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
				<tr class="important_n">
					<td><strong>중요공지</strong></td>
					<td class="t_hidden"><a href="#none" onclick="javascript:selectArticleDetail('<c:out value="${noticeInfo.nttId}"/>')"><c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/></a></td>
					<td class="t_date"><c:out value='${noticeInfo.frstRegisterPnttm}'/></td>
				</tr>
			</c:forEach>
			
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td class="t_hidden"><a href="#none" onclick="javascript:selectArticleDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td class="t_date"><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="3"><spring:message code="common.nodata.msg" /></td>
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
