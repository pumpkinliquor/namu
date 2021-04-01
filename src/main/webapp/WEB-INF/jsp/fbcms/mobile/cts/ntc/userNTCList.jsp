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
	function selectNTCList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectNTCDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/cts/ntc/selectNTCDetail.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<!-- contents s -->
<div class="contents">
	<form name="listForm" action="<c:url value='/user/cts/ntc/selectNTCList.do'/>" method="post" onSubmit="selectNTCList(); return false;">
		<div class="search_input mt40 mar20"><!-- 검색 -->
			<input type="hidden" name="nttId" value="0">
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="searchCnd" value="0" />
			<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색버튼">
		</div>
	</form>
	
	<c:choose>
		<c:when test="${fn:length(resultList) == 0}">
			<!-- 검색 결과 없음 table s -->
			<div class="tbox tlist">
				<table>
					<caption>번호 제목 등록일자로 이루어진 리스트</caption>
					<tbody>
						<tr>
							<td class="nonelist">검색결과가 없습니다</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="btn_Lbox">
				<a href="/user/cts/ntc/selectNTCList.do" class="btn bgreen">이전</a>
			</div>
			<!-- //검색 결과 없음 table e -->
		</c:when>
		<c:otherwise>
			<ul class="tbox">
				<!-- 공지사항 본문 -->
				<c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
					<li class="fw_500">
						<a href="#none" onclick="javascript:selectNTCDetail('<c:out value="${noticeInfo.nttId}"/>')">
							<strong><span  class="important_n">공지</span><c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/></strong>
							<span class="date"><c:out value='${noticeInfo.frstRegisterPnttm}'/></span>
						</a>
					</li>
				</c:forEach>
				
				<!-- 게시글 본문 -->
				<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
					<li>
						<a href="#none" onclick="javascript:selectNTCDetail('<c:out value="${resultInfo.nttId}"/>')">
							<strong><c:out value='${fn:substring(resultInfo.nttSj, 0, 40)}'/></strong>
							<span class="date"><c:out value='${resultInfo.frstRegisterPnttm}'/></span>
						</a>
					</li>
				</c:forEach>
				
				<c:if test="${fn:length(resultList) == 0}">
					<!-- 글이 없는 경우 -->
					<li>
						<spring:message code="common.nodata.msg" />
					</li>
				</c:if>
			</ul>
			
			<!-- paginate -->
			<div class="paginate">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
			</div>
			<!-- //paginate -->
		</c:otherwise>
	</c:choose>
