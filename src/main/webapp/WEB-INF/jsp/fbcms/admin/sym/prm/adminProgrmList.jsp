<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">프로그램목록관리 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectProgrmList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertProgrmView() {
		document.listForm.action = "<c:url value='/admin/sym/prm/insertProgrmView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateProgrmView(progrmFileNm) {
		document.listForm.progrmFileNm.value = progrmFileNm;
	  	document.listForm.action = "<c:url value='/admin/sym/prm/updateProgrmView.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form name="listForm" action ="<c:url value='/admin/sym/prm/selectProgrmList.do' />" method="post">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">프로그램명</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="searchKeyword" class="w_full" size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectProgrmList()" class="btn_ty02">검색하기</a>
	</div>
	<input type="hidden" name="progrmFileNm" value="">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:20%">
			<col style="width:15%">
			<col style="">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>프로그램파일명</th>
				<th>프로그램명</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateProgrmView('<c:out value="${resultInfo.progrmFileNm}"/>')"><c:out value='${fn:substring(resultInfo.progrmFileNm, 0, 100)}'/></a></td>
					<td><c:out value='${resultInfo.progrmKoreanNm}'/></td>
					<td><c:out value='${resultInfo.url}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="4"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
</div>
<!-- //paginate -->

<div class="btns ta_r mt_m">
	<a href="#none" onclick="javascript:insertProgrmView()" class="btn_ty03">등록하기</a>
</div>
