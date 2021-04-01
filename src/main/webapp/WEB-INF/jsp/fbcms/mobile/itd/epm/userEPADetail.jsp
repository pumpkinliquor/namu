<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fnEPADetail(nttId) {
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/itd/epm/selectEPADetail.do'/>";
	  	document.detailForm.submit();
	}
	
	/* ********************************************************
	 * 입사지원 처리 함수
	 ******************************************************** */
	function fnJPARegist(nttId) {
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/itd/epm/insertJACView.do'/>";
	  	document.detailForm.submit();
	}
</script>

<!-- contents s -->
<div class="contents">
	<div class="tdetail">
		<table>
			<caption>리스트 상세페이지</caption>
			<colgroup>
				<col style="width:80px">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<c:set var="custom1Name">무관</c:set>
					<c:if test="${result.custom1 eq '1'}"><c:set var="custom1Name">경력</c:set></c:if>
					<c:if test="${result.custom1 eq '2'}"><c:set var="custom1Name">신입</c:set></c:if>
					<%-- 날짜 차이 계산 --%>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="nowDay"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></c:set>
					<fmt:parseDate var="nowDateTime" value="${nowDay}" pattern="yyyy.MM.dd" />
					<fmt:parseDate var="endDate" value="${result.customDate2}" pattern="yyyy.MM.dd" />
					<fmt:parseNumber var="nowDate" value="${nowDateTime.time  / (1000*60*60*24)}" integerOnly="true" />
					<fmt:parseNumber var="expDate" value="${endDate.time / (1000*60*60*24)}" integerOnly="true" />
					<c:set var="diffDate">${expDate - nowDate}</c:set>
					<td colspan="2" class="t_tit">
						<c:choose>
							<c:when test="${fn:length(result.nttSj) gt 24 }"><strong><c:out value='${fn:substring(result.nttSj, 0, 24)}'/>...</strong></c:when>
							<c:otherwise><strong><c:out value='${fn:substring(result.nttSj, 0, 24)}'/></strong></c:otherwise>
						</c:choose>
						<span>[<c:out value="${custom1Name}"/>][<c:out value="${result.custom2}"/>]<span class="t_date02"><c:out value="${result.customDate1}"/> ~ <c:out value="${result.customDate2}"/></span></span>
						<em>
							<c:choose>
								<c:when test="${diffDate gt 0}">
									진행중 <span>D-<c:out value="${diffDate }" /></span>
								</c:when>
								<c:when test="${diffDate eq 0}">
									진행중 <span>D-Day</span>
								</c:when>
								<c:otherwise>
									종료 </em>
								</c:otherwise>
							</c:choose>
						</em>
					</td>
				</tr>
				<tr class="t_con">
					<td colspan="2">
						<div>
							<c:out value="${fn:replace(result.nttCn, crlf , '<br>')}" escapeXml="false" />
						</div>
						<c:choose>
							<c:when test="${diffDate ge 0}">
								<div class="btn_Lbox"><!-- btn box -->
									<a href="#none" onclick="javascript:fnJPARegist('${result.nttId}');" class="btn breservation ">입사지원</a>
								</div>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr class="bgline">
					<th scope="row"><span class="bl_tprev">이전글</span></th>
					<td class="t_hidden">
						<c:choose>
							<c:when test="${not empty preBoardVO }"><a href="#none" onclick="javascript:fnEPADetail('${preBoardVO.nttId}');"><c:out value="${preBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>이전글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row"><span class="bl_tnext">다음글</span></th>
					<td class="t_hidden">
						<c:choose>
							<c:when test="${not empty nextBoardVO }"><a href="#none" onclick="javascript:fnEPADetail('${nextBoardVO.nttId}');"><c:out value="${nextBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>다음글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btn_Lbox">
		<a href="<c:url value='/user/itd/epm/employmentGuide.do'/>" class="btn bgray"> 목록으로</a>
	</div>
	
	<form id="detailForm" name="detailForm" method="POST">
		<input type="hidden" name="bbsId" value="${result.bbsId }">
		<input type="hidden" name="nttId">
	</form>
