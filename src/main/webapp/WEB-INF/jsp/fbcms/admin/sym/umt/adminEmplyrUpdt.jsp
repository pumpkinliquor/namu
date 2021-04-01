<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h3 class="mid_tit mg_t50">관리자 정보 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="adminAdminManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

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
	function updateEmplyr(form) {
		if(!validateAdminAdminManageVO(form)) {
			return;
		}
		
		if(confirm("<spring:message code="common.update.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function emplyrDetail(form) {
		form.action = "<c:url value='/admin/sym/umt/emplyrDetail.do'/>";
		form.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form:form commandName="adminAdminManageVO" name="formUpdate" action="/admin/sym/umt/updateEmplyr.do" method="post" onSubmit="updateEmplyr(document.formUpdate); return false;">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%;">
				<col span="1" style="width:15%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${loginVO.orgnztId eq 'ORGNZT_9999999999999' }">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>관리자</th>
							<td class="ta_l" colspan="2">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="display01" id="chk01_1"<c:if test="${adminAdminManageVO.orgnztId ne 'ORGNZT_9999999999999'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
											<label for="chk01_1">일반관리자</label>
										</span>
										<span>
											<input type="radio" name="display01" id="chk01_2"<c:if test="${adminAdminManageVO.orgnztId eq 'ORGNZT_9999999999999'}"> checked="checked"</c:if> class="ez-hide">
											<label for="chk01_2">슈퍼관리자</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
				<tr>
					<th scope="row" class="ta_r"> 부서</th>
					<td class="ta_l" colspan="2">
						<div class="input_wrap">
							<form:input path="ofcpsNm" title="부서" cssClass="inp_txt w_m" maxlength="50" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이름</th>
					<td class="ta_l" colspan="2">
						<div class="input_wrap">
							<form:input path="emplyrNm" title="이름" cssClass="inp_txt w_m" maxlength="60" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>아이디</th>
					<td class="ta_l" colspan="2">
						<form:hidden path="emplyrId" title="아이디" cssClass="inp_txt w_m" maxlength="60" />
						<c:out value="${adminAdminManageVO.emplyrId}" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>비밀번호</th>
					<td class="ta_l" colspan="2">
						<div class="input_wrap">
							<form:password path="password" title="비밀번호" cssClass="inp_txt w_m" maxlength="20" />
							<span class="dc">4~20자 이상의 영문, 숫자(특수문자 입력가능) </span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>비밀번호 확인</th>
					<td class="ta_l" colspan="2">
						<div class="input_wrap">
							<input type="password" class="inp_txt w_m" name="password2" maxlength="20" >
							<span class="dc">비밀번호를 한번 더 입력하세요</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">이메일</th>
					<td class="ta_l" colspan="2">
						<div class="input_wrap">
							<form:input path="emailAdres" title="이메일" cssClass="inp_txt w_m" maxlength="50" />
							<span class="dc">예) abc@namu.com</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btns">
		<a href="#none" onclick="javascript:updateEmplyr(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:emplyrDetail(document.formDetail)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="emplyrSttusCode" value="P"/><!-- 회원상태 -->
	<input type="hidden" id="orgnztId" name="orgnztId" value="${adminAdminManageVO.orgnztId }"/><!-- 기본값(일반관리자) -->
	<input type="hidden" id="uniqId" name="uniqId" value="${adminAdminManageVO.uniqId }"/><!-- uniqId -->
</form:form>

<form name="formDetail" action="<c:url value='/admin/sym/umt/emplyrDetail.do'/>" method="post">
</form>
