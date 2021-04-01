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
	function updateCSTView(nttId) {
	  	document.detailForm.action = "<c:url value='/user/cts/cst/updateCSTView.do'/>";
	  	document.detailForm.submit();
	}
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function deleteCST() {
	  	document.detailForm.action = "<c:url value='/user/cts/cst/deleteCST.do'/>";
	  	document.detailForm.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
</script>

<!-- contents s -->
<div class="contents w1200">
	
	<h4 class="con_in_tit01">상담내역</h4>
	<div class="tbox tdetail">
		<table>
			<caption>리스트 상세 보기 페이지</caption>
			<col style="width:15%">
			<col>
			<tbody>
				<tr>
					<th scope="row">등록일자</th>
					<td><c:out value="${fn:substring(result.frstRegisterPnttm, 0, 10)}" /></td>
				</tr>
				<tr>
					<th scope="row">상태</th>
					<td>
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
					<th scope="row">유형</th>
					<td>
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
					<th scope="row">제목</th>
					<td><c:out value="${result.nttSj}"/></td>
				</tr>
				<tr class="t_con02">
					<th scope="row">내용</th>
					<td>
						<c:out value="${fn:replace(result.nttCn, crlf , '<br>')}" escapeXml="false" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<c:choose>
		<c:when test="${not empty replyBoardVO }">
			<h4 class="con_in_tit01">답변</h4>
			<div class="tbox tdetail">
				<table>
					<caption>답변 보기 페이지</caption>
					<col style="width:15%">
					<col>
					<tbody>
						<tr>
							<th scope="row">답변일</th>
							<td><c:out value="${replyBoardVO.frstRegisterPnttm}" /></td>
						</tr>
						<tr class="t_con02">
							<th scope="row">답변</th>
							<td>
								<c:out value="${replyBoardVO.nttCn}" escapeXml="false"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="btn_Lbox">
				<a href="#none" onclick="javascipt:deleteCST();" class="btn bgreen">삭제</a>
				<a href="<c:url value='/user/cts/cst/selectCSTList.do'/>" class="btn bgray">목록</a>
				<a href="/user/cts/rsv/userRSVMain.do" class="btn breservation">예약 바로가기</a>
			</div>
		</c:when>
		<c:otherwise>
			<h4 class="con_in_tit01">답변</h4><!-- 답변대기 s -->
			<div class="tbox tdetail">
				<table>
					<caption>답변 보기</caption>
					<tbody>
						<tr>
							<td class="nonelist">답변을 준비중입니다</td>
						</tr>
					</tbody>
				</table>
			</div>		
			
			<div class="btn_Lbox">
				<c:if test="${loginVO.uniqId eq result.frstRegisterId}">
					<a href="#none" onclick="javascript:deleteCST();" class="btn bgreen">삭제</a>
					<a href="#none" onclick="javascript:updateCSTView();" class="btn bblue">수정</a>
				</c:if>
				<a href="<c:url value='/user/cts/cst/selectCSTList.do'/>" class="btn bgray"> 목록으로</a>
			</div>
		</c:otherwise>
	</c:choose>
	
	<form id="detailForm" name="detailForm" method="POST">
		<input type="hidden" name="bbsId" value="${result.bbsId }">
		<input type="hidden" name="nttId" value="${result.nttId }">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input type="hidden" name="postingYn" value="<c:out value='${searchVO.postingYn}'/>" />
		<input type="hidden" name="searchCnd" value="0">
		<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	</form>
