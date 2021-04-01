<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/html/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	var oEditors = [];
	var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
	
	$(function() {
		
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateCST(form) {
		//input item Client-Side validate
		if ($('#nttSj').val() == '') {
			alert('제목은 필수항목입니다.');
			$('#nttSj').focus();
			return false;
		} else if ($('#nttCn').val() == '') {
			alert("내용은(는) 필수 입력값입니다.");
			$('#nttCn').focus();
			return false;
		} else {
			if (confirm("<spring:message code="common.update.msg" />")) {
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectCSTList(form) {
		form.action = "<c:url value='/user/cts/cst/selectCSTList.do'/>";
		form.submit();
	}
</script>

<!-- contents s -->
<div class="contents w1200">

	<h4 class="con_in_tit01">기본입력사항</h4>
	<p class="n_txt"><em class="ootc">*</em>표시는 필수입력 항목 입니다</p>
	
	<form:form commandName="articleVO" name="formUpdate" action="/user/cts/cst/updateCST.do" method="post" onSubmit="updateCST(document.formUpdate); return false;" enctype="multipart/form-data">
		<div class="tbox tdetail02">
			<table>
				<caption>리스트 상세 등록 페이지</caption>
				<col style="width:15%">
				<col>
				<tbody>
					<tr>
						<th scope="row"><em class="ootc">*</em>유형</th>
						<td>
							<select title="유형" id="custom1" name="custom1" class="w400">
								<option<c:if test="${articleVO.custom2 eq '1'}"> selected="selected"</c:if> value="1">비용관련 문의</option>
								<option<c:if test="${articleVO.custom2 eq '2'}"> selected="selected"</c:if> value="2">소화기 질환 증상 문의</option>
								<option<c:if test="${articleVO.custom2 eq '3'}"> selected="selected"</c:if> value="3">내시경 관련 문의(준비사항/과정 등)</option>
								<option<c:if test="${articleVO.custom2 eq '4'}"> selected="selected"</c:if> value="4">건강검진 문의(예약/추가검사 비용 등)</option>
								<option<c:if test="${articleVO.custom2 eq '5'}"> selected="selected"</c:if> value="5">수술관련 문의(수술준비사항 등)</option>
								<option<c:if test="${articleVO.custom2 eq '6'}"> selected="selected"</c:if> value="6">안티에이징/비만시술 문의</option>
								<option<c:if test="${articleVO.custom2 eq '7'}"> selected="selected"</c:if> value="7">유방/갑상선 질환 문의</option>
								<option<c:if test="${articleVO.custom2 eq '8'}"> selected="selected"</c:if> value="8">부인과 질환 문의</option>
								<option<c:if test="${articleVO.custom2 eq '9'}"> selected="selected"</c:if> value="9">만성질환(당뇨/고혈압 등) 문의</option>
								<option<c:if test="${articleVO.custom2 eq '10'}"> selected="selected"</c:if> value="10">기타 문의</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>제목</th>
						<td>
							<form:input path="nttSj" title="${subject }" cssClass="in_full" maxlength="50" />
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>내용</th>
						<td>
							<textarea id="nttCn" class="textarea_240" name="nttCn"><fbcms:editorTextareaContent value="${articleVO.nttCn }" flag="2"/></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
					
		<div class="btn_Lbox">
			<a href="#none" onclick="javascript:selectCSTList(document.formList)" class="btn bgreen">취소</a>
			<a href="#none" onclick="javascript:updateCST(document.formUpdate)" class="btn bblue">수정</a>
		</div>
		
		<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
		<input type="hidden" id="postingYn" name="postingYn" value="Y" />
		<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
		<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
		<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
		<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
		<input type="hidden" name="nttId" value="<c:out value='${articleVO.nttId}'/>">
	</form:form>
	
	<form name="formList" action="<c:url value='/user/cts/cst/deleteCST.do'/>" method="post">
		<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
		<input type="hidden" name="pageIndex" value="1" />
		<input type="hidden" name="postingYn" value="Y" />
		<input type="hidden" name="searchCnd" value="0">
		<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	</form>