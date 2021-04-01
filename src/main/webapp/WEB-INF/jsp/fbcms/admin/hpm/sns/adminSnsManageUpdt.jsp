<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">SNS관리 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>링크 입력이 없을 경우, 화면에 노출되지 않습니다.</p>

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
	function updateSnsManage(form) {
		if (confirm("<spring:message code="common.update.msg" />")) {
			form.submit();
		}
	}
-->
</script>

<c:choose>
<c:when test="${empty resultList }">
	<form:form commandName="articleVO" name="formUpdate" action="/admin/hpm/sns/insertSnsManage.do" method="post" onSubmit="updateSnsManage(document.formUpdate); return false;">
		<input type="hidden" name="unityLinkSeCode" value="SNS" >
		
		<div class="board_ty mg_t30">
			<table>
				<colgroup>
					<col span="1" style="width:15%">
					<col span="1" style="width:*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="ta_r">블로그</th>
						<td class="ta_l">
							<div class="input_wrap">
								<input type="hidden" name="unityLinkNm_1" value="블로그" >
								<input type="text" name="unityLinkUrl_1" class="inp_txt w_full linkUrl" maxlength="200" value="" />
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="ta_r">유튜브</th>
						<td class="ta_l">
							<div class="input_wrap">
								<input type="hidden" name="unityLinkNm_2" value="유튜브" >
								<input type="text" name="unityLinkUrl_2" class="inp_txt w_full linkUrl" maxlength="200" value="" />
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="ta_r">네이버포스트</th>
						<td class="ta_l">
							<div class="input_wrap">
								<input type="hidden" name="unityLinkNm_3" value="네이버포스트" >
								<input type="text" name="unityLinkUrl_3" class="inp_txt w_full linkUrl" maxlength="200" value="" />
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<div class="btns">
			<a href="#none" onclick="javascript:updateSnsManage(document.formUpdate)" class="btn_ty02">저장하기</a>
		</div>
	</form:form>
</c:when>
<c:otherwise>
	<form:form commandName="articleVO" name="formUpdate" action="/admin/hpm/sns/updateSnsManage.do" method="post" onSubmit="updateSnsManage(document.formUpdate); return false;">
		<input type="hidden" name="unityLinkSeCode" value="SNS" >
		
		<div class="board_ty mg_t30">
			<table>
				<colgroup>
					<col span="1" style="width:15%">
					<col span="1" style="width:*">
				</colgroup>
				<tbody>
					<c:forEach var="resultInfo" items="${resultList }" varStatus="status">
						<tr>
							<th scope="row" class="ta_r"><c:out value="${resultInfo.unityLinkNm }" /></th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="hidden" name="unityLinkId_${status.index }" value="<c:out value='${resultInfo.unityLinkId }'/>" >
									<input type="hidden" name="unityLinkNm_${status.index }" value="<c:out value='${resultInfo.unityLinkNm }'/>" >
									<input type="text" name="unityLinkUrl_${status.index }" class="inp_txt w_full linkUrl" maxlength="200" value="<c:out value='${resultInfo.unityLinkUrl }'/>" >
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<div class="btns">
			<a href="#none" onclick="javascript:updateSnsManage(document.formUpdate)" class="btn_ty02">저장하기</a>
		</div>
	</form:form>
</c:otherwise>
</c:choose>