<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<h3 class="mid_tit mg_t50">관리자 정보</h3>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>

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
	 * 수정처리
	 ******************************************************** */
	function updateEmplyrView(form) {
		form.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form:form commandName="adminAdminManageVO" name="formUpdate" action="/admin/sym/umt/updateEmplyrView.do" method="post" onSubmit="updateEmplyrView(document.formUpdate); return false;">
	<form:hidden path="emplyrId" />
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"> 관리자</th>
					<td class="ta_l">
						<c:choose>
							<c:when test="${loginVO.orgnztId eq 'ORGNZT_9999999999999' }">슈퍼관리자</c:when>
							<c:otherwise>일반관리자</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"> 부서</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.ofcpsNm }" /></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"> 이름</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.emplyrNm }" /></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">아이디</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.emplyrId }" /></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">이메일</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.emailAdres }" /></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"> 등록일</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.sbscrbDe }" /></td>
				</tr>
				<c:if test="${not empty adminAdminManageVO.lastUpdtPnttm }">
					<tr>
						<th scope="row" class="ta_r">수정일</th>
						<td class="ta_l"><c:out value="${adminAdminManageVO.lastUpdtPnttm }" /></td>
					</tr>
				</c:if>
				<tr>
					<th scope="row" class="ta_r"> 마지막 로그인</th>
					<td class="ta_l"><c:out value="${adminAdminManageVO.lastLoginDt }" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btns">
		<a href="#none" onclick="javascript:updateEmplyrView(document.formUpdate)" class="btn_ty02"> 수정하기 </a>
	</div>
	
	<input type="hidden" id="uniqId" name="uniqId" value="${adminAdminManageVO.uniqId }"/><!-- uniqId -->
</form:form>
