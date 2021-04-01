<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h4 class="mg_t30">차트 입력</h4>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript">
<!--
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
	function insertTRM(form) {
		//input item Client-Side validate
		if (confirm("<spring:message code="common.regist.msg" />")) {
			form.submit();
		}
	}
-->
</script>

<form:form commandName="articleVO" name="formInsert" action="/admin/hpm/trm/insertTRM.do" method="post" onSubmit="insertTRM(document.formInsert); return false;" enctype="multipart/form-data">
	<div class="board_ty ds02 mg_t10">
		<table>
			<colgroup>
				<col span="1" style="width:*">
				<col span="1" style="width:25%">
				<col span="1" style="width:15%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">항목</th>
					<th scope="col">수치</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj1" maxlength="20">
						</div>
					</td>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_1" maxlength="20">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj2" maxlength="20">
						</div>
					</td>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_2" maxlength="20">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj3" maxlength="20">
						</div>
					</td>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_3" maxlength="20">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj4" maxlength="20">
						</div>
					</td>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_4" maxlength="20">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj5" maxlength="20">
						</div>
					</td>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_5" maxlength="20">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<h4 class="mg_t50">기준일 입력</h4>
	<div class="board_ty ds02 mg_t10">
		<table>
			<colgroup>
				<col span="1" style="width:*">
				<col span="1" style="width:15%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">클리닉</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="nttSj" maxlength="2000">
						</div>
					</td>
					<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns ta_r">
		<a href="#none" onclick="javascript:insertTRM(document.formInsert)" class="btn_ty02">저장하기</a>
	</div>
	
	<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
	<input type="hidden" id="postingYn" name="postingYn" value="Y" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
	<input type="hidden" name="bbsId" value="<c:out value='${boardMasterVO.bbsId}'/>">
	<input type="hidden" name="nttCn" value="내용이 없는 게시판입니다.">
	<input type="hidden" name="nttCn1" value="내용이 없는 게시판입니다.">
	<input type="hidden" name="nttCn2" value="내용이 없는 게시판입니다.">
	<input type="hidden" name="nttCn3" value="내용이 없는 게시판입니다.">
	<input type="hidden" name="nttCn4" value="내용이 없는 게시판입니다.">
	<input type="hidden" name="nttCn5" value="내용이 없는 게시판입니다.">
</form:form>
