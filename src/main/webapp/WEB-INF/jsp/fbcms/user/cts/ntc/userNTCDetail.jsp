<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fnNTCDetail(nttId) {
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/cts/ntc/selectNTCDetail.do'/>";
	  	document.detailForm.submit();
	}
	
	/* ********************************************************
	 * 목록회면 처리 함수
	 ******************************************************** */
	function fnNTCList() {
	  	document.detailForm.action = "<c:url value='/user/cts/ntc/selectNTCList.do'/>";
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
	<div class="tbox tdetail">
		<table>
			<caption>리스트 상세페이지</caption>
			<colgroup>
				<col style="width:15%">
				<col>
				<col style="width:15%">
			</colgroup>
			<tbody>
				<tr>
					<td colspan="2" class="t_tit">
						<strong><c:out value="${result.nttSj}"/></strong></td>
					<td class="t_date t_right"><span><c:out value="${fn:substring(result.frstRegisterPnttm, 0, 10)}" /></span></td>
				</tr>
				<tr class="t_con">
					<td colspan="3">
						<div>
							<c:out value="${fn:replace(result.nttCn, crlf , '<br>')}" escapeXml="false" />
							<%-- <fbcms:editorTextareaContent value="${result.nttCn }" flag="2"/> --%>
						</div>
					</td>
				</tr>
				<c:if test="${not empty fileList and not empty fileList[0]}">
					<tr class="t_file">
						<th scope="row">첨부파일</th>
						<td colspan="2">
							<a href="#none" onclick="javascript:fnAtchDownFile('${result.atchFileId}', '${fileList[0].fileSn }');" class="file_down">${fileList[0].orignlFileNm }</a>
						</td>
					</tr>
				</c:if>
				<tr class="bgline">
					<th scope="row"><span class="bl_tprev">이전글</span></th>
					<td colspan="2">
						<c:choose>
							<c:when test="${not empty preBoardVO }"><a href="#none" onclick="javascript:fnNTCDetail('${preBoardVO.nttId}');"><c:out value="${preBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>이전글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row"><span class="bl_tnext">다음글</span></th>
					<td colspan="2">
						<c:choose>
							<c:when test="${not empty nextBoardVO }"><a href="#none" onclick="javascript:fnNTCDetail('${nextBoardVO.nttId}');"><c:out value="${nextBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>다음글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btn_Lbox">
		<a href="#none" onclick="javascript:fnNTCList();" class="btn bgray"> 목록으로</a>
	</div>
	
	<form id="detailForm" name="detailForm" method="POST">
		<input type="hidden" name="bbsId" value="${result.bbsId }">
		<input type="hidden" name="nttId" value="0">
		<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }">
	</form>
