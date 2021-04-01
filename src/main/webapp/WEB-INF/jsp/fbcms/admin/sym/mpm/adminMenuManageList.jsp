<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">관리자메뉴관리 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
	});

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
	function selectMenuManageList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertMenuManageView() {
		document.listForm.action = "<c:url value='/admin/sym/mpm/insertMenuManageView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateMenuManageView(menuNo) {
		document.listForm.menuNo.value = menuNo;
	  	document.listForm.action = "<c:url value='/admin/sym/mpm/updateMenuManageView.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/sym/mpm/selectMenuManageList.do'/>" method="post" onSubmit="selectMenuManageList(); return false;">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l"><spring:message code="comSymMnuMpm.menuManage.menuNmHn"/></th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="searchKeyword" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectMenuManageList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="menuNo" type="hidden" value="0">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="">
			<col style="width:20%">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th><spring:message code="comSymMnuMpm.menuManage.menuNo"/></th>
				<th><spring:message code="comSymMnuMpm.menuManage.menuNmHn"/></th>
				<th><spring:message code="comSymMnuMpm.menuManage.progrmFileNm"/></th>
				<th><spring:message code="comSymMnuMpm.menuManage.menuDc"/></th>
				<th><spring:message code="comSymMnuMpm.menuManage.upperMenuNo"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultInfo.menuNo}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateMenuManageView('<c:out value="${resultInfo.menuNo}"/>')"><c:out value='${fn:substring(resultInfo.menuNm, 0, 100)}'/></a></td>
					<td><c:out value='${resultInfo.progrmFileNm}'/></td>
					<td><c:out value='${resultInfo.menuDc}'/></td>
					<td><c:out value='${resultInfo.upperMenuNo}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="5"><spring:message code="common.nodata.msg" /></td>
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
	<a href="#none" onclick="javascript:insertMenuManageView()" class="btn_ty03">등록하기</a>
</div>
