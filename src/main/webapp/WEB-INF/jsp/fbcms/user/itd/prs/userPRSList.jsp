<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
	});
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectPRSDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/user/itd/prs/selectPRSDetail.do'/>";
	  	document.listForm.submit();
	}
</script>

<!-- contents s -->
<div class="contents w1200">
	<img src="/images/fbcms/user/img_a_press01.png" alt="" class="mb50">

	<form name="listForm" action="<c:url value='/user/itd/prs/selectPRSList.do'/>" method="post">
		<input type="hidden" name="nttId" value="0">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
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
					<th scope="col">날짜</th>
					<!-- <th scope="col">언론사</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
					<tr>
						<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
						<td class="t_hidden">
							<c:choose>
								<c:when test="${resultInfo.custom2 eq 'N'}">
									<c:choose>
										<c:when test="${fn:indexOf(resultInfo.custom3, 'http:') eq 0
											or fn:indexOf(resultInfo.custom3, 'https:') eq 0}">
											<a href="<c:out value='${resultInfo.custom3 }' />" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
										</c:when>
										<c:otherwise>
											<a href="http://<c:out value='${resultInfo.custom3 }' />" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a href="#none" onclick="javascript:selectPRSDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="t_date"><c:out value='${resultInfo.customDate1}'/></td>
						<%-- <td><c:out value="${resultInfo.custom1}"/></td> --%>
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
