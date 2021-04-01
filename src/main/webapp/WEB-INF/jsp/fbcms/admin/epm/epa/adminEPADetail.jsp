<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<h3 class="mid_tit mg_t50">채용공고 상세</h3>

<script type="text/javascript">
<!--
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 수정회면 처리 함수
	 ******************************************************** */
	function updateEPA(nttId) {
		document.articleForm.nttId.value = nttId;
	  	document.articleForm.action = "<c:url value='/admin/epm/epa/updateEPAView.do'/>";
	  	document.articleForm.submit();
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectEPAList(form) {
		form.submit();
	}
-->
</script>

<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width:15%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">경력</th>
				<td class="ta_l">
					<c:if test="${result.custom1 eq '1'}">경력</c:if>
					<c:if test="${result.custom1 eq '2'}">신입</c:if>
					<c:if test="${result.custom1 eq '3'}">무관</c:if>
				</td>
				<th scope="row" class="ta_r">직군</th>
				<td class="ta_l"><c:out value="${result.custom2}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">모집기간</th>
				<td class="ta_l"><c:out value="${result.customDate1}"/>~<c:out value="${result.customDate2}"/></td>
				<th scope="row" class="ta_r">지원자수</th>
				<td class="ta_l"><c:out value="${result.appCnt}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">제목</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttSj}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">내용</th>
				<td class="ta_l" colspan="3"><c:out value="${fn:replace(result.nttCn , crlf , '<br/>')}" escapeXml="false" /></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">게시여부</th>
				<td class="ta_l" colspan="3"><c:out value="${result.postingYn}" /></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">등록일</th>
				<td class="ta_l" colspan="3"><c:out value="${result.frstRegisterPnttm}" /></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="#none" onclick="javascript:updateEPA('<c:out value="${result.nttId}"/>')" class="btn_ty02"> 수정하기 </a>
	<a href="#none" onclick="javascript:selectEPAList(document.formList)" class="btn_ty">목록으로</a>
</div>

<form name="articleForm" action="<c:url value='/admin/epm/epa/updateEPAView.do'/>" method="post">
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
	<input name="nttId" type="hidden" value="<c:out value="${result.nttId}" />">
	<input name="bbsId" type="hidden" value="<c:out value="${boardMasterVO.bbsId}" />">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/epm/epa/selectEPAList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="custom2" value="<c:out value='${searchVO.custom2}'/>" />
	<input type="hidden" name="customDate1" value="<c:out value='${searchVO.customDate1}'/>" />
	<input type="hidden" name="customDate2" value="<c:out value='${searchVO.customDate2}'/>" />
</form>
