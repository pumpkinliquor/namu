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
<h3 class="mid_tit mg_t50">안저판독리스트 상세</h3>

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
	function updateEGDView(nttId) {
		document.articleForm.nttId.value = nttId;
	  	document.articleForm.action = "<c:url value='/admin/egd/egd/updateEGDView.do'/>";
	  	document.articleForm.submit();
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectEGDList(form) {
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
				<td class="ta_l" style="height:200px;vertical-align:top"><c:out value="${fn:replace(result.nttCn , crlf , '<br/>')}" escapeXml="false" /></td>
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
	<a href="#none" onclick="javascript:updateEGDView('<c:out value="${result.nttId}"/>')" class="btn_ty02"> 수정하기 </a>
	<a href="#none" onclick="javascript:selectEGDList(document.formList)" class="btn_ty"> 목록으로</a>
</div>

<form name="articleForm" action="<c:url value='/admin/egd/egd/updateEGDView.do'/>" method="post">
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
	<input type="hidden" name="nttId" value="<c:out value="${result.nttId}" />">
	<input type="hidden" name="bbsId" value="<c:out value="${boardMasterVO.bbsId}" />">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/egd/egd/selectEGDList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="<c:out value='${boardMasterVO.bbsId}' />">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
	<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
</form>