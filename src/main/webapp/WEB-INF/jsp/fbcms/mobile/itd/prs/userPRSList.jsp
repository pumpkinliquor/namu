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
<div class="contents">
	<div class="mb50 mt40 mar20">
		<img src="/images/fbcms/mobile/img_a_press01.png" alt="" >
	</div>

	<form name="listForm" action="<c:url value='/user/itd/prs/selectPRSList.do'/>" method="post">
		<input type="hidden" name="nttId" value="0">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	</form>
	
	<ul class="tbox">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<li class="fw_500">
				<div>
					<p class="pressbox">
						<c:choose>
							<c:when test="${resultInfo.custom2 eq 'N'}">
								<c:choose>
									<c:when test="${fn:indexOf(resultInfo.custom3, 'http:') eq 0
										or fn:indexOf(resultInfo.custom3, 'https:') eq 0}">
										<a href="<c:out value='${resultInfo.custom3 }' />" class="press_txt" title="새창" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
									</c:when>
									<c:otherwise>
										<a href="http://<c:out value='${resultInfo.custom3 }' />" class="press_txt" title="새창" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" class="press_txt" onclick="javascript:selectPRSDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a>
							</c:otherwise>
						</c:choose>
					</p>
					<span class="date"><c:out value='${resultInfo.customDate1}'/></span>
				</div>
			</tr>
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
