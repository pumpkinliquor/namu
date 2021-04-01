<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
	});
	
	/* ********************************************************
	 * 수정회면 처리 함수
	 ******************************************************** */
	function fnEPADetail(nttId) {
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/itd/epm/selectEPADetail.do'/>";
	  	document.detailForm.submit();
	}
	<c:if test="${not empty fn:trim(message) && message ne ''}">
    alert("${message}");
    </c:if>
</script>

<!-- contents s -->
<div class="contents">
	<section class="t_center w1200">
		<h4 class="con_in_tit08">인재상</h4>
		<dl class="recruit_box">
			<dt>VIEVIS NAMUH<br>인재상</dt>
			<dd>지혜와 사랑으로<br>
				고객의 건강을 위해<br>
				최선을 다하는 인재</dd>
			<dd>고객의 니즈 이상으로<br>
				최고의 서비스를 실현하는<br>
				열정적이고 책임감 있는 인재</dd>
		</dl>
	</section>
	
	<section class="recruit_gary">
		<h4 class="con_in_tit08">상시 채용절차</h4>
		<img src="/images/fbcms/user/img_recruiting01_02.png" alt="1.지원서 다운받기 2.지원서 접수 3.서류전형 4
		면접전형 5.채용검진 6.채용">
		<p>
			<strong>지원방법</strong><br>
			입사지원서를 작성하여 <span class="c_gray3">‘채용공고’</span>에 지원하시거나, 채용담당자 메일(<a href="mailto:recruit@namu.com" class="c_point">recruit@namu.com</a>)로 이력서를 송부해 주십시오.
		</p>
		<div class="btn_Lbox"><!-- btn box -->
			<a href="javascript:resourceFileDown('이력서(양식).hwp');" class="btn breservation">입사지원서 DOWNLOAD</a>
		</div>
	</section>
	
	<section class="w1200">
		<h4 class="con_in_tit08 t_center">채용공고</h4>
		<a href="<c:url value='/user/itd/epm/searchJACInfo.do'/>" class="recruitint_step05">입사지원 조회&middot수정</a>
		<ul class="recruit_list">
			<c:forEach var="resultInfo" items="${resultList}">
				<c:set var="custom1Name">무관</c:set>
				<c:if test="${resultInfo.custom1 eq '1'}"><c:set var="custom1Name">경력</c:set></c:if>
				<c:if test="${resultInfo.custom1 eq '2'}"><c:set var="custom1Name">신입</c:set></c:if>
				<%-- 날짜 차이 계산 --%>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="nowDay"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></c:set>
				<fmt:parseDate var="nowDateTime" value="${nowDay}" pattern="yyyy.MM.dd" />
				<fmt:parseDate var="endDate" value="${resultInfo.customDate2}" pattern="yyyy.MM.dd" />
				<fmt:parseNumber var="nowDate" value="${nowDateTime.time  / (1000*60*60*24)}" integerOnly="true" />
				<fmt:parseNumber var="expDate" value="${endDate.time / (1000*60*60*24)}" integerOnly="true" />
				<c:set var="diffDate">${expDate - nowDate}</c:set>
				<li>
					<a href="#none" onclick="javascript:fnEPADetail('<c:out value="${resultInfo.nttId}"/>')">
						<header>
							<span>[<c:out value="${custom1Name}"/>][<c:out value="${resultInfo.custom2}"/>]</span>
							<c:choose>
								<c:when test="${fn:length(resultInfo.nttSj) gt 24 }"><c:out value='${fn:substring(resultInfo.nttSj, 0, 24)}'/>...</c:when>
								<c:otherwise><c:out value='${fn:substring(resultInfo.nttSj, 0, 24)}'/></c:otherwise>
							</c:choose>
						</header>
						<c:choose>
							<c:when test="${diffDate gt 0}">
								<em>진행중 <span>D-<c:out value="${diffDate }" /></span></em>
							</c:when>
							<c:when test="${diffDate eq 0}">
								<em>진행중 <span>D-Day</span></em>
							</c:when>
							<c:otherwise>
								<em>종료 </em>
							</c:otherwise>
						</c:choose>
						<strong><c:out value="${resultInfo.customDate1}"/> ~ <c:out value="${resultInfo.customDate2}"/></strong>
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>
	
	<%-- 상세페이지 이동 폼 --%>
	<form name="detailForm" method="post" action="">
		<input type="hidden" name="nttId" value="">
	</form>