<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<h3 class="mid_tit mg_t50">의료상담 상세</h3>

<script type="text/javascript">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fnCSTReplay(nttId) {
		document.articleForm.nttId.value = nttId;
	  	document.articleForm.action = "<c:url value='/admin/rcm/cst/replyCSTView.do'/>";
	  	document.articleForm.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
</script>

<div class="board_ty mg_t30">
	<table>
		<caption>리스트 상세 보기 페이지</caption>
		<colgroup>
			<col span="1" style="width:15%;">
			<col span="1" style="width:35%;">
			<col span="1" style="width:15%;">
			<col span="1" style="auto">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">등록일자</th>
				<td class="ta_l"><c:out value="${result.frstRegisterPnttm}" /></td>
				<th scope="row" class="ta_r">상태</th>
				<td class="ta_l">
					<c:choose>
							<c:when test="${not empty replyBoardVO }">
							<span class="c_blue">답변완료</span>
						</c:when>
						<c:otherwise>
							대기
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">예약자</th>
				<td class="ta_l" colspan="3"><c:out value="${result.ntcrNm }" /></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">유형</th>
				<td class="ta_l" colspan="3">
					<c:if test="${result.custom1 eq '1'}">비용관련 문의</c:if>
					<c:if test="${result.custom1 eq '2'}">소화기 질환 증상 문의</c:if>
					<c:if test="${result.custom1 eq '3'}">내시경 관련 문의(준비사항/과정 등)</c:if>
					<c:if test="${result.custom1 eq '4'}">건강검진 문의(예약/추가검사 비용 등)</c:if>
					<c:if test="${result.custom1 eq '5'}">수술관련 문의(수술준비사항 등)</c:if>
					<c:if test="${result.custom1 eq '6'}">안티에이징/비만시술 문의</c:if>
					<c:if test="${result.custom1 eq '7'}">유방/갑상선 질환 문의</c:if>
					<c:if test="${result.custom1 eq '8'}">부인과 질환 문의</c:if>
					<c:if test="${result.custom1 eq '9'}">만성질환(당뇨/고혈압 등) 문의</c:if>
					<c:if test="${result.custom1 eq '10'}">기타 문의</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">제목</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttSj}"/></td>
			</tr>
			<tr class="t_con02" class="ta_r">
				<th scope="row" class="ta_r">내용</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttCn}" escapeXml="false"/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<table class="mg_t30">
		<colgroup>
			<col span="1" style="width:15%;">
			<col span="1" style="width:35%;">
			<col span="1" style="width:15%;">
			<col span="1" style="auto">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">답변 등록일</th>
				<td class="ta_l"><c:out value="${replyBoardVO.frstRegisterPnttm}" /></td>
				<th scope="row" class="ta_r">관리자</th>
				<td class="ta_l"><c:out value="${replyBoardVO.ntcrNm}" /></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">답변</th>
				<td class="ta_l" colspan="3">
					<c:out value="${fn:replace(replyBoardVO.nttCn, crlf , '<br>')}" escapeXml="false" />
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="#none" onclick="javascript:fnCSTReplay('<c:out value="${result.nttId}"/>')" class="btn_ty02"> 답변하기 </a>
	<!-- <a href="" class="btn_ty02"> 답변메일발송 </a> -->
	<a href="<c:url value='/admin/rcm/cst/selectCSTList.do'/>" class="btn_ty"> 목록으로</a>
</div>

<form name="articleForm" action="<c:url value='/admin/rcm/cst/replyCSTView.do'/>" method="post">
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
	<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
	<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
</form>