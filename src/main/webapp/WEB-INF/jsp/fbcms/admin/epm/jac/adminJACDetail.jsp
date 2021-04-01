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
<h3 class="mid_tit mg_t50">입사지원내역 상세</h3>

<script type="text/javascript">
<!--
	$(function() {
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectJACList(form) {
		form.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
-->
</script>

<div class="board_ty mg_t30">
	<table>
		<colgroup>
			<col span="1" style="width:15%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">경력</th>
				<td class="ta_l">
					<c:if test="${result.parntsCustom1 eq '1'}">경력</c:if>
					<c:if test="${result.parntsCustom1 eq '2'}">신입</c:if>
					<c:if test="${result.parntsCustom1 eq '3'}">무관</c:if>
				</td>
				<th scope="row" class="ta_r">직군</th>
				<td class="ta_l"><c:out value="${result.parntsCustom2}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">모집기간</th>
				<td class="ta_l"><c:out value="${result.parntsCustomDate1}"/> ~ <c:out value="${result.parntsCustomDate2}"/></td>
				<th scope="row" class="ta_r">조회수</th>
				<td class="ta_l"><c:out value="${result.inqireCo}"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">공고제목</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttSj}"/></td>
			</tr>
		</tbody>
	</table>
	
	<table class="mg_t30">
		<colgroup>
			<col span="1" style="width:15%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">입사지원자</th>
				<td class="ta_l"><c:out value="${result.ntcrNm }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">생년월일</th>
				<td class="ta_l"><c:out value="${result.customDate1 }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">휴대전화</th>
				<td class="ta_l"><c:out value="${result.custom1 }"/>-<c:out value="${result.custom2 }"/>-<c:out value="${result.custom3 }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">이메일</th>
				<td class="ta_l"><c:out value="${result.custom4 }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">입사지원서</th>
				<td class="ta_l">
					<c:if test="${not empty fileList and not empty fileList[0]}">
						<a href="#none" onclick="javascript:fnAtchDownFile('${result.atchFileId}', '${fileList[0].fileSn }');" class="btn sm">${fileList[0].orignlFileNm }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">입사지원일</th>
				<td class="ta_l"><c:out value="${result.frstRegisterPnttm}" /></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="#none" onclick="javascript:selectJACList(document.formList)" class="btn_ty"> 목록으로</a>
</div>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/epm/jac/selectJACList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="frstRegisterNm" value="<c:out value='${searchVO.frstRegisterNm}'/>" />
	<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
	<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
	<input type="hidden" name="custom4" value="<c:out value='${searchVO.custom4}'/>" />
</form>