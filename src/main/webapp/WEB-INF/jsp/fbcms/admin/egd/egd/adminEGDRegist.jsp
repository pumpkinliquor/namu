<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h3 class="mid_tit mg_t50"><c:out value="${boardMasterVO.bbsNm}"/> <spring:message code="title.create" /></h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스
		document.getElementById("articleVO").nttSj.focus();
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function insertEGD(form) {
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {
			if (confirm("<spring:message code="common.regist.msg" />")) {
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
-->
</script>

<form:form commandName="articleVO" name="formInsert" action="/admin/egd/egd/insertEGD.do" method="post" onSubmit="insertEGD(document.formInsert); return false;" enctype="multipart/form-data"> 
	<div class="board_ty">
		<table>
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
								<option value="1">검사</option>
								<option value="2">결과</option>
							</select>
						</div>
					</td>
					<th scope="row" class="ta_r">작성자</th>
					<td class="ta_l"><c:out value="${loginVO.name }"/></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>제목</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:input path="nttSj" title="제목" cssClass="inp_txt w_full" maxlength="100" />
	   						<div><form:errors path="nttSj" cssClass="error" /></div> 
						</div>
					</td>
				</tr>
				
				<!-- 글 내용  -->
				<tr>
					<th scope="row" class="ta_r">내용</th>
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
							<div class="input_wrap b_file_area">
								<label for="file_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt').innerText = this.value">
								<span id="b_file_txt"></span>
								<span class="dc">* 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l" colspan="3">
						<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /> <span class="pd_l10"><fmt:formatDate value="${now}" pattern="HH:mm:ss" /></span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:insertEGD(document.formInsert)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectEGDList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
	<input type="hidden" id="postingYn" name="postingYn" value="Y" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
</form:form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/egd/egd/selectEGDList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
	<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
</form>