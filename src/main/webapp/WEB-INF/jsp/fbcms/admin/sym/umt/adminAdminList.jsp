<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">관리자 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		document.listForm.searchKeyword.focus();
	}
	
	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************* */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectAdminList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertAdminView() {
		document.listForm.action = "<c:url value='/admin/sym/umt/insertAdminView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateAdminView(uniqId) {
		document.listForm.selectedId.value = uniqId;
		document.listForm.action = "<c:url value='/admin/sym/umt/updateAdminView.do' />";
		document.listForm.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/sym/umt/selectAdminList.do'/>" method="post" onSubmit="selectAdminList(); return false;">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">관리자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCondition" value="1" />
							<input type="text" name="searchKeyword" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectAdminList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="selectedId" type="hidden" />
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:10%">
			<col style="width:20%">
			<col style="width:15%">
			<col style="width:15%">
			<col style="">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>관리자</th>
				<th>부서</th>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td><c:out value='${resultInfo.orgnztNm}'/></td>
					<td><c:out value='${resultInfo.ofcpsNm}'/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateAdminView('<c:out value="${resultInfo.uniqId}"/>')"><c:out value='${fn:substring(resultInfo.userNm, 0, 100)}'/></a></td>
					<td><c:out value='${resultInfo.userId}'/></td>
					<td><c:out value='${resultInfo.emailAdres}'/></td>
					<td><c:out value='${resultInfo.sbscrbDe}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="7"><spring:message code="common.nodata.msg" /></td>
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
	<a href="#none" onclick="javascript:insertAdminView()" class="btn_ty03">등록하기</a>
</div>
