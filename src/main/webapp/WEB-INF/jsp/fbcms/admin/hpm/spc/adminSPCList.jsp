<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function updateSPCView(nttId, custom1) {
		document.listForm.nttId.value = nttId;
		document.listForm.custom1.value = custom1;
	  	document.listForm.action = "<c:url value='/admin/hpm/spc/updateSPCView.do'/>";
	  	document.listForm.submit();
	}
-->
</script>

<form name="listForm" action="<c:url value='/admin/hpm/spc/updateSPCView.do'/>" method="post">
	<!-- 검색 -->
	<!-- //검색 -->
	<input name="parntsCustom1" type="hidden" value="SPC">
	<input name="custom1" type="hidden" value="">
	<input name="nttId" type="hidden" value="0">
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
</form>

<div class="board_ty ds02 mg_t30">
	<table>
		<colgroup>
			<col style="">
			<col style="width:20%">
			<col style="width:20%">
		</colgroup>
		<thead>
			<tr>
				<th>센터</th>
				<th>최종수정일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<c:if test="${resultInfo.custom1 ne 'SPC009' and resultInfo.custom1 ne 'SPC010' }">
				<tr>
					<td class="ta_l"><c:out value='${resultInfo.nttSj}'/></td>
					<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
					<td><a href="#none" onclick="javascript:updateSPCView('<c:out value="${resultInfo.nttId}"/>', '<c:out value="${resultInfo.custom1}"/>')" class="btn sm">관리하기</a></td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
