<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50"><c:out value="${boardMasterVO.bbsNm}"/> <spring:message code="title.update"/></title>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		/* 게시여부 */
		$('#articleVO').on('change', '#chk02_1, #chk02_2', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#postingYn').val('Y');
			} else {
				$('#postingYn').val('N');
			}
		});
		
		/* 모집기간 셋팅 */
		$("#customDate1").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#customDate2").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#customDate1').datepicker("option", "maxDate", $("#customDate2").val());
		$('#customDate1').datepicker("option", "onClose", function (selectedDate) {
			$("#customDate2").datepicker( "option", "minDate", selectedDate );
		});
		$('#customDate2').datepicker("option", "minDate", $("#customDate1").val());
		$('#customDate2').datepicker("option", "onClose", function (selectedDate) {
			$("#customDate1").datepicker( "option", "maxDate", selectedDate );
		});
		
		/* 첨부파일 하나만 삭제버튼 */
		$('#articleVO').on('click', '.remOneFile', function() {
			var deleteFileSn = $(this).parent().attr('id').replace('fileList', 'deleteFileYn');
			$(this).parent().remove();
			$('#'+deleteFileSn).val('Y');
		});
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스
		document.getElementById("articleVO").nttSj.focus();
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deleteEPA(form){
		if(confirm("<spring:message code="common.delete.msg" />")){	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateEPA(form) {
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
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
	function selectEPAList(form) {
		form.submit();
	}
-->
</script>

<!-- 상단타이틀 -->
<form:form commandName="articleVO" name="formUpdate" action="/admin/epm/epa/updateEPA.do" method="post" onSubmit="updateEPA(document.formUpdate); return false;" enctype="multipart/form-data">
	<div class="board_ty">
		<table>
			<caption>${pageTitle} <spring:message code="title.update" /></caption>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:35%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>카테고리</th>
					<td class="ta_l">
						<div class="input_wrap">
							<select class="select" id="custom1" name="custom1">
								<option value="">선택하세요</option>
								<option value="1"<c:if test="${articleVO.custom1 eq '1'}"> selected="selected"</c:if>>경력</option>
								<option value="2"<c:if test="${articleVO.custom1 eq '2'}"> selected="selected"</c:if>>신입</option>
								<option value="3"<c:if test="${articleVO.custom1 eq '3'}"> selected="selected"</c:if>>무관</option>
							</select>
						</div>
					</td>
					<th scope="row" class="ta_r"><em class="ootc">*</em>직군</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="custom2" title="직군" cssClass="inp_txt w_full" maxlength="100" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">모집기간</th>
					<td class="ta_l">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="customDate1" name="customDate1" value="${articleVO.customDate1 }" class="inp_txt wd110 date_pick" title="" placeholder="">
								<span> - </span>
								<input type="text" id="customDate2" name="customDate2" value="${articleVO.customDate2 }" class="inp_txt wd110 date_pick" title="" placeholder="">
							</div>
						</div>
					</td>
					<th scope="row" class="ta_r">지원자수</th>
					<td class="ta_l"></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>제목</th>
					<td class="ta_l" colspan="3">
						<form:input path="nttSj" title="제목" cssClass="inp_txt w_full" maxlength="100" />
						<div><form:errors path="nttSj" cssClass="error" /></div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>내용</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:textarea path="nttCn" title="${title} ${inputTxt}" cols="300" rows="20" cssStyle="width:100%;height:300px"/>
							<div><form:errors path="nttCn" cssClass="error" /></div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1"<c:if test="${articleVO.postingYn eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2"<c:if test="${articleVO.postingYn ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk02_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l" colspan="3"><c:out value="${articleVO.frstRegisterPnttm}" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:deleteEPA(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateEPA(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectEPAList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" id="noticeAt" name="noticeAt" value="<c:out value='${articleVO.noticeAt}'/>" />
	<input type="hidden" id="postingYn" name="postingYn" value="<c:out value='${articleVO.postingYn}'/>" />
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="atchFileId" value="${articleVO.atchFileId }">
</form:form>

<form name="formDelete" action="<c:url value='/admin/epm/epa/deleteEPA.do'/>" method="post">
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/epm/epa/selectEPAList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="custom2" value="<c:out value='${searchVO.custom2}'/>" />
	<input type="hidden" name="customDate1" value="<c:out value='${searchVO.customDate1}'/>" />
	<input type="hidden" name="customDate2" value="<c:out value='${searchVO.customDate2}'/>" />
</form>