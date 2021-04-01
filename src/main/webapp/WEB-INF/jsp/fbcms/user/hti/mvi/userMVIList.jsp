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
	function selectMVIList(custom1) {
		document.listForm.custom1.value = custom1;
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectMVIDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/hti/mvi/selectMVIDetail.do'/>";
	  	document.listForm.submit();
	}
-->
</script>

<!-- contents s -->
<div class="contents w1200">
	<ul class="tab_list02"><!-- tab -->
		<li<c:if test="${searchVO.custom1 eq ''}"> class="selected"</c:if>><a href="#none" onclick="javascipt:selectMVIList('')">전체</a>
		<c:forEach var="cmmCodeInfo" items="${listMVIComCode }">
			<li<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> class="selected"</c:if>><a href="#none" onclick="javascipt:selectMVIList('${cmmCodeInfo.code}')"><c:out value="${cmmCodeInfo.codeNm }" /></a>
		</c:forEach>
	</ul>
	
	<section class="tab_box" style="display:block"><!-- tab contents1 s -->
		<form name="listForm" method="POST" action="<c:url value='/user/hti/mvi/selectMVIList.do'/>"><!-- 검색 -->
			<div class="search_input">
				<input type="hidden" name="nttId" value="0">
				<input type="hidden" name="custom1" value="<c:out value='${searchVO.custom1}'/>" />
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
				<input type="hidden" name="searchCnd" value="0" />
				<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
				<input type="submit" value="검색버튼">
			</div>
		</form>
	
		<div class="tbox">
			<table>
				<caption>번호 제목 등록일자로 이루어진 리스트</caption>
				<colgroup>
					<col style="width:15%">
					<col style="width:20%">
					<col style="">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
						<tr>
							<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
							<td>
								<span class="c_blue">
									<c:forEach var="cmmCodeInfo" items="${listMVIComCode }">
										<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
									</c:forEach>
								</span>
							</td>
							<td class="t_hidden"><a href="#none" onclick="javascript:selectMVIDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
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
	</section><!-- //tab contents1 e -->
	
	<section class="tab_box"><!-- tab contents2 s -->
	</section><!-- //tab contents2 e -->
	
	<section class="tab_box"><!-- tab contents3 s -->
	</section><!-- //tab contents3 e -->
	
	<section class="tab_box"><!-- tab contents4 s -->
	</section><!-- //tab contents4 e -->
	
	<section class="tab_box"><!-- tab contents5 s -->
	</section><!-- //tab contents5 e -->
