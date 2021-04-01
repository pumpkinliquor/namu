<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$('.disease_box li').each(function() {
			var dis = $(this).index();
			var bgnum = dis + 1;
			if($(this).hasClass('active')) {
				$('.disease_box li').removeClass('active');
				$(this).addClass('active');
				$('.disease_box li a').attr('title','');
				$(this).children('a').attr('title','선택된 탭');
				$('.disease_box').css('background','url(/images/fbcms/user/img_disease0' + bgnum + '.png) no-repeat center 0,#f9f9f9');	
			}
		});
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
<div class="contents w1200">
	<form name="listForm" method="POST" action="<c:url value='/user/hti/dsi/selectDSIList.do'/>"><!-- 검색 -->
		<div class="search_input">
			<input type="hidden" name="nttId" value="0">
			<input type="hidden" name="custom1" value="<c:out value='${searchVO.custom1}'/>" />
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="searchCnd" value="0" />
			<input type="text" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>" title="검색어 입력" placeholder="검색어를 입력해주세요">
			<input type="submit" value="검색버튼">
		</div>
		
		<ul class="disease_box">
			<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
				<li<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> class="active"</c:if>><a href="#none" onclick="javascipt:selectDSIList('${cmmCodeInfo.code}')"><c:out value="${cmmCodeInfo.codeNm }" /></a>
			</c:forEach>
		</ul>
	</form>
	
	<div class="tbox">
		<table>
			<caption>번호 제목 등록일자로 이루어진 리스트</caption>
			<colgroup>
				<col style="width:11%">
				<col style="width:17%">
				<col>
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
								<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
									<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
								</c:forEach>
							</span>
						</td>
						<td class="t_hidden"><a href="#none" onclick="javascript:selectDSIDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
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
