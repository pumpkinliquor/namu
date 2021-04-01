<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">메인비주얼</h3>
<p class="te_ri_txt">최대 5개까지 등록가능합니다.</p>

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
	 * 등록 처리 함수
	 ******************************************************** */
	function insertMainVisualView() {
		document.listForm.action = "<c:url value='/admin/hpm/umm/insertMainVisualView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertPromotionView() {
		document.listForm.action = "<c:url value='/admin/hpm/umm/insertPromotionView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function updateMainVisualView(bbsId, nttId) {
		document.listForm.bbsId.value = bbsId;
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/hpm/umm/updateMainVisualView.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function updateMajorServiceView(bbsId) {
		document.listForm.bbsId.value = bbsId;
		document.listForm.nttId.value = "";
	  	document.listForm.action = "<c:url value='/admin/hpm/umm/updateMajorServiceView.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function updatePromotionView(bbsId, nttId) {
		document.listForm.bbsId.value = bbsId;
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/hpm/umm/updatePromotionView.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 삭제 처리 함수
	 ******************************************************** */
	function deleteMainVisual(bbsId, nttId) {
		if(confirm("<spring:message code="common.delete.msg" />")) {	
			document.listForm.bbsId.value = bbsId;
			document.listForm.nttId.value = nttId;
		  	document.listForm.action = "<c:url value='/admin/hpm/umm/deleteMainVisual.do'/>";
		  	document.listForm.submit();
		}
	}
	
	/* ********************************************************
	 * 삭제 처리 함수
	 ******************************************************** */
	function deletePromotion(bbsId, nttId) {
		if(confirm("<spring:message code="common.delete.msg" />")) {	
			document.listForm.bbsId.value = bbsId;
			document.listForm.nttId.value = nttId;
		  	document.listForm.action = "<c:url value='/admin/hpm/umm/deletePromotion.do'/>";
		  	document.listForm.submit();
		}
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:15%">
			<col style="width:15%">
			<col style="">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>카피</th>
				<th>링크</th>
				<th>게시여부</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${listMainVisual}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updateMainVisualView('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td class="ta_l"><c:out value="${resultInfo.custom4}"/></td>
					<td class="ta_l"><c:out value="${resultInfo.custom2}"/></td>
					<td><c:out value="${resultInfo.postingYn}"/></td>
					<td>
						<a href="#none" onclick="javascript:deleteMainVisual('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')" class="btn ico_st memo">삭제</a>
					</td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(listMainVisual) lt 1}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="6">자료가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<div class="btns ta_r">
	<c:if test="${fn:length(listMainVisual) lt 5}">
		<a href="#none" onclick="javascript:insertMainVisualView()" class="btn_ty03">등록하기</a>
	</c:if>
</div>

<h2 class="mid_tit mg_t50">주요서비스</h2>
<p class="te_ri_txt">3개 고정노출 입니다.</p>
<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:30%">
			<col style="">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>카피</th>
				<th>링크</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${listMajorService}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td class="ta_l"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></td>
					<td class="ta_l"><c:out value="${resultInfo.custom2}"/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(listMajorService) lt 1}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="3">자료가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
<div class="btns ta_r">
	<a href="#none" onclick="javascript:updateMajorServiceView('BBSMSTR_000000000013')" class="btn_ty03">수정하기</a>
</div>

<h2 class="mid_tit mg_t50">프로모션</h2>
<p class="te_ri_txt">최대 5개까지 등록가능합니다.</p>
<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:30%">
			<col style="">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>링크</th>
				<th>게시여부</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${listPromotion}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updatePromotionView('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td class="ta_l"><c:out value="${resultInfo.custom2}"/></td>
					<td><c:out value="${resultInfo.postingYn}"/></td>
					<td>
						<a href="#none" onclick="javascript:deletePromotion('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')" class="btn ico_st memo">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
			<c:if test="${fn:length(listPromotion) lt 1}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="5">자료가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<div class="btns ta_r">
	<c:if test="${fn:length(listPromotion) lt 5}">
		<a href="#none" onclick="javascript:insertPromotionView()" class="btn_ty03">등록하기</a>
	</c:if>
</div>

<%-- 상세페이지 이동 폼 --%>
<form name="listForm" method="post" action="">
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="nttId" value="0">
    <input type="hidden" name="bbsId" value="">
</form>
