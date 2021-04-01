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
	 * 삭제 처리
	 ******************************************************** */
	 function deleteEGD(form){
		if(confirm("<spring:message code="common.delete.msg" />")){	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장 처리
	 ******************************************************** */
	function updateEGD(form) {
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
	function selectEGDList(form) {
		form.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
-->
</script>

<!-- 상단타이틀 -->
<form:form commandName="articleVO" name="formUpdate" action="/admin/egd/egd/updateEGD.do" method="post" onSubmit="updateEGD(document.formUpdate); return false;" enctype="multipart/form-data">
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
								<option value="1"<c:if test="${articleVO.custom1 eq '1'}"> selected="selected"</c:if>>검사</option>
								<option value="2"<c:if test="${articleVO.custom1 eq '2'}"> selected="selected"</c:if>>결과</option>
							</select>
						</div>
					</td>
					<th scope="row" class="ta_r">작성자</th>
					<td class="ta_l"><c:out value="${articleVO.ntcrNm }"/></td>
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
					<th scope="row" class="ta_r">파일첨부</th>
					<td class="ta_l" colspan="3">
						<div class="add_file_wrap">
							<div id="fileList1">
								<c:if test="${not empty fileList and not empty fileList[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${articleVO.atchFileId}', '${fileList[0].fileSn }');">${fileList[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt').innerText = this.value">
								<span id="b_file_txt"></span>
								<span class="dc">* 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
						<%-- <input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comCopBbs.articleVO.regist.atchFile"/>"/><!-- 첨부파일 -->
				    	<div id="egovComFileList"></div> --%>
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
		<a href="#none" onclick="javascript:deleteEGD(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateEGD(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectEGDList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" id="noticeAt" name="noticeAt" value="<c:out value='${articleVO.noticeAt}'/>" />
	<input type="hidden" id="postingYn" name="postingYn" value="<c:out value='${articleVO.postingYn}'/>" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="atchFileId" value="${articleVO.atchFileId }">
	<input type="hidden" id="deleteFileSn1" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1" name="deleteFileYn1" value="N">
</form:form>

<form name="formDelete" action="<c:url value='/admin/egd/egd/deleteEGD.do'/>" method="post">
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/egd/egd/selectEGDList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
	<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
</form>