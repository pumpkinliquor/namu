<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#searchBgnDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#searchEndDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#searchBgnDe').datepicker("option", "maxDate", $("#searchEndDe").val());
		$('#searchBgnDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchEndDe").datepicker( "option", "minDate", selectedDate );
		});
		$('#searchEndDe').datepicker("option", "minDate", $("#searchBgnDe").val());
		$('#searchEndDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchBgnDe").datepicker( "option", "maxDate", selectedDate );
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		document.listForm.searchCnd.focus();
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
	function selectCSTList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function selectCSTDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/rcm/cst/selectCSTDetail.do'/>";
	  	document.listForm.submit();
	}
	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<form name="listForm" action="<c:url value='/admin/rcm/cst/selectCSTList.do'/>" method="post" onSubmit="selectCSTList(); return false;">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="width:34%;">
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l"> 작성자명</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="ntcrNm" class="w_full" title="작성자명" value='<c:out value="${searchVO.ntcrNm}"/>'  maxlength="40" style="ime-mode: active;"/>
						</div>
					</td>
					<th scope="row" class="ta_l"> 유형</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select class="select" id="custom1" name="custom1">
								<option value="">선택하세요</option>
								<option value="1"<c:if test="${searchVO.custom1 eq '1'}"> selected="selected"</c:if>>비용관련 문의</option>
								<option value="2"<c:if test="${searchVO.custom1 eq '2'}"> selected="selected"</c:if>>소화기 질환 증상 문의</option>
								<option value="3"<c:if test="${searchVO.custom1 eq '3'}"> selected="selected"</c:if>>내시경 관련 문의 (준비사항/과정 등)</option>
								<option value="4"<c:if test="${searchVO.custom1 eq '4'}"> selected="selected"</c:if>>건강검진 문의 (예약/추가검사 비용 등)</option>
								<option value="5"<c:if test="${searchVO.custom1 eq '5'}"> selected="selected"</c:if>>수술관련 문의 (수술준비사항 등)</option>
								<option value="6"<c:if test="${searchVO.custom1 eq '6'}"> selected="selected"</c:if>>안티에이징/비만시술 문의</option>
								<option value="7"<c:if test="${searchVO.custom1 eq '7'}"> selected="selected"</c:if>>유방/갑상선 질환 문의</option>
								<option value="8"<c:if test="${searchVO.custom1 eq '8'}"> selected="selected"</c:if>>부인과 질환 문의</option>
								<option value="9"<c:if test="${searchVO.custom1 eq '9'}"> selected="selected"</c:if>>만성질환(당뇨/고혈압 등) 문의</option>
								<option value="10"<c:if test="${searchVO.custom1 eq '10'}"> selected="selected"</c:if>>기타 문의</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCnd" value="1">
							<input type="text" name="searchWrd" class="w_full" title="제목" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
					<th scope="row" class="ta_l">상태</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select name="replyAt" class="select">
								<option value="">선택하세요</option>
								<option value="N"<c:if test="${searchVO.replyAt eq 'N'}"> selected</c:if>>대기</option>
								<option value="Y"<c:if test="${searchVO.replyAt eq 'Y'}"> selected</c:if>>답변완료</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">등록일</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectCSTList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="nttId" type="hidden" value="0">
	<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="border_box option_bx">
	<div class="btns ta_l">
		<ul>
			<li>
				<a href="#" class="sm btn_down">엑셀 다운로드</a>
			</li>
		</ul>
	</div>
</div>

<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="width:20%">
			<col style="">
			<col style="width:10%">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>유형</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td>
						<c:if test="${resultInfo.custom1 eq '1'}">비용관련 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '2'}">소화기 질환 증상 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '3'}">내시경 관련 문의(준비사항/과정 등)</c:if>
						<c:if test="${resultInfo.custom1 eq '4'}">건강검진 문의(예약/추가검사 비용 등)</c:if>
						<c:if test="${resultInfo.custom1 eq '5'}">수술관련 문의(수술준비사항 등)</c:if>
						<c:if test="${resultInfo.custom1 eq '6'}">안티에이징/비만시술 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '7'}">유방/갑상선 질환 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '8'}">부인과 질환 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '9'}">만성질환(당뇨/고혈압 등) 문의</c:if>
						<c:if test="${resultInfo.custom1 eq '10'}">기타 문의</c:if>
					</td>
					<td class="ta_l"><a href="#none" onclick="javascript:selectCSTDetail('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<td><c:out value='${resultInfo.frstRegisterNm}'/></td>
					<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
					<td>
						<c:choose>
							<c:when test="${resultInfo.appCnt gt 0 }">
								<span class="c_blue">답변완료</span>
							</c:when>
							<c:otherwise>
								대기
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="6"><spring:message code="common.nodata.msg" /></td>
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
