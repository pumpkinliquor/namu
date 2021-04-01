<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>

<script type="text/javascript">
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fnPRSDetail(nttId) {
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/itd/prs/selectPRSDetail.do'/>";
	  	document.detailForm.submit();
	}
	
	/* ********************************************************
	 * 목록회면 처리 함수
	 ******************************************************** */
	function fnPRSList() {
	  	document.detailForm.action = "<c:url value='/user/itd/prs/selectPRSList.do'/>";
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
					<td colspan="2" class="t_tit">
						<strong><c:out value="${result.nttSj}"/></strong>
						<span><c:out value="${result.custom1 }"/><span class="t_date02"><c:out value="${fn:substring(result.customDate1, 0, 10)}" /></span></span>
					</td>
				</tr>
				<tr class="t_con">
					<td colspan="2">
						<div>
							<fbcms:editorTextareaContent value="${result.nttCn }" flag="2"/>
						</div>
						<div class="btn_Lbox"><!-- btn box -->
							<c:choose>
								<c:when test="${result.custom3 eq 'http://'
									or result.custom3 eq 'https://'}"></c:when>
								<c:when test="${fn:indexOf(result.custom3, 'http:') ge 0 
									or fn:indexOf(result.custom3, 'https:') ge 0}">
									<a href="<c:out value='${result.custom3 }'/>" class="btn bgreen" target="_blank">자세히 보기</a>
								</c:when>
								<c:otherwise>
									<a href="http://<c:out value='${result.custom3 }'/>" class="btn bgreen" target="_blank">자세히 보기</a>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
				<tr class="bgline">
					<th scope="row"><span class="bl_tprev">이전글</span></th>
					<td class="t_hidden">
						<c:choose>
							<c:when test="${not empty preBoardVO }"><a href="#none" onclick="javascript:fnPRSDetail('${preBoardVO.nttId}');"><c:out value="${preBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>이전글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row"><span class="bl_tnext">다음글</span></th>
					<td class="t_hidden">
						<c:choose>
							<c:when test="${not empty nextBoardVO }"><a href="#none" onclick="javascript:fnPRSDetail('${nextBoardVO.nttId}');"><c:out value="${nextBoardVO.nttSj }"/></a></c:when>
							<c:otherwise>다음글이 없습니다</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btn_Lbox">
		<a href="#none" onclick="javascript:fnPRSList();" class="btn bgray">목록</a>
	</div>
	
	<form id="detailForm" name="detailForm" method="POST">
		<input type="hidden" name="bbsId" value="${result.bbsId }">
		<input type="hidden" name="nttId" value="0">
		<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }">
	</form>
