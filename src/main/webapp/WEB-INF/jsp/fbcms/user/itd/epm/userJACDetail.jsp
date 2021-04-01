<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>

<script type="text/javascript">
	/* ********************************************************
	 * 수정회면 처리 함수
	 ******************************************************** */
	function fnEGDUpdate(nttId) {
		document.articleForm.nttId.value = nttId;
	  	document.articleForm.action = "<c:url value='/admin/egd/egd/updateEGDView.do'/>";
	  	document.articleForm.submit();
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
	<h3 class="mid_tit mg_t50">검사</h3>
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>구분</th>
					<td class="ta_l">검사</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>제목</th>
					<td class="ta_l"><c:out value="${result.nttSj}"/></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">내용</th>
					<td class="ta_l" style="height:200px;vertical-align:top"><c:out value="${result.nttCn}"/></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>첨부파일</th>
					<td class="ta_l">
						<c:if test="${not empty fileList and not empty fileList[0]}">
							<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result.atchFileId}', '${fileList[0].fileSn }');">${fileList[0].orignlFileNm }</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l"><c:out value="${result.frstRegisterPnttm}" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btns">
		<a href="#none" onclick="javascript:fnEGDUpdate('<c:out value="${result.nttId}"/>')" class="btn_ty02"> 수정하기 </a>
		<a href="<c:url value='/admin/egd/egd/selectEGDList.do'/>" class="btn_ty"> 목록으로</a>
	</div>
	
	<form name="articleForm" action="<c:url value='/admin/egd/egd/updateEGDView.do'/>" method="post">
		<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
		<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
		<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
		<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
		<input type="hidden" name="nttId" value="<c:out value="${result.nttId}" />">
		<input type="hidden" name="bbsId" value="<c:out value="${boardMasterVO.bbsId}" />">
	</form>
