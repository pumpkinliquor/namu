<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="now" value="<%=new java.util.Date()%>" />

<h2 class="big_tit">의료상담 답변</h2>

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
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "nttCn",
			sSkinURI : "/html/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fnReplyCST(form) {
		oEditors.getById["nttCn"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		//input item Client-Side validate
		if (confirm("<spring:message code="common.update.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fnCSTList() {
		articleVO.action = "<c:url value='/admin/rcm/cst/selectCSTList.do'/>";
		articleVO.submit();
	}
</script>

<div class="board_ty mg_t30">
	<table>
		<colgroup>
			<col span="1" style="width:15%;">
			<col span="1" style="width:35%;">
			<col span="1" style="width:15%;">
			<col span="1" style="auto">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">등록일자</th>
				<td class="ta_l"><c:out value="${result.frstRegisterPnttm}" /></td>
				<th scope="row" class="ta_r">상태</th>
				<td class="ta_l">
					<c:choose>
						<c:when test="${not empty replyBoardVO }">
							<span class="c_blue">답변완료</span>
						</c:when>
						<c:otherwise>
							대기
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">예약자</th>
				<td class="ta_l" colspan="3"><c:out value="${result.ntcrNm }" /></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">유형</th>
				<td class="ta_l" colspan="3">
					<c:if test="${result.custom1 eq '1'}">비용관련 문의</c:if>
					<c:if test="${result.custom1 eq '2'}">소화기 질환 증상 문의</c:if>
					<c:if test="${result.custom1 eq '3'}">내시경 관련 문의(준비사항/과정 등)</c:if>
					<c:if test="${result.custom1 eq '4'}">건강검진 문의(예약/추가검사 비용 등)</c:if>
					<c:if test="${result.custom1 eq '5'}">수술관련 문의(수술준비사항 등)</c:if>
					<c:if test="${result.custom1 eq '6'}">안티에이징/비만시술 문의</c:if>
					<c:if test="${result.custom1 eq '7'}">유방/갑상선 질환 문의</c:if>
					<c:if test="${result.custom1 eq '8'}">부인과 질환 문의</c:if>
					<c:if test="${result.custom1 eq '9'}">만성질환(당뇨/고혈압 등) 문의</c:if>
					<c:if test="${result.custom1 eq '10'}">기타 문의</c:if>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">제목</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttSj}"/></td>
			</tr>
			<tr class="t_con02" class="ta_r">
				<th scope="row" class="ta_r">내용</th>
				<td class="ta_l" colspan="3"><c:out value="${result.nttCn}" escapeXml="false"/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<form:form commandName="articleVO" name="formReply" action="/admin/rcm/cst/replyCST.do" method="post" onSubmit="fnReplyCST(document.formReply); return false;" enctype="multipart/form-data">
		<table class="mg_t30">
			<colgroup>
				<col span="1" style="width:15%;">
				<col span="1" style="width:35%;">
				<col span="1" style="width:15%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">답변 등록일</th>
					<td class="ta_l"><fmt:formatDate value="${now}" pattern="HH:mm:ss" />
						<c:choose>
							<c:when test="${not empty replyBoardVO }">
								<c:out value="${replyBoardVO.frstRegisterPnttm }" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /> <span class="pd_l10"><fmt:formatDate value="${now}" pattern="HH:mm:ss" /></span>
							</c:otherwise>
						</c:choose>
					</td>
					<th scope="row" class="ta_r">관리자</th>
					<td class="ta_l">
						<c:choose>
							<c:when test="${not empty replyBoardVO }">
								<c:out value="${replyBoardVO.ntcrNm }" />
							</c:when>
							<c:otherwise>
								<c:out value="${user.name }" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">답변</th>
					<td class="ta_l" colspan="3">
						<textarea id="nttCn" name="nttCn" title="답변" cols="300" rows="20" cssStyle="display:none;"><c:out value="${replyBoardVO.nttCn}" /></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<input type="hidden" name="nttSj" value="RE: <c:out value='${result.nttSj}'/>">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
		<input type="hidden" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
		<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
		<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
		
		<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
		<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
		<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
		
		<input name="nttId" type="hidden" value="${result.nttId}">
		<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
		<input name="cmd" type="hidden" value="<c:out value='save'/>">
	</form:form>
</div>

<div class="btns">
	<a href="#none" onclick="javascript:fnReplyCST(document.formReply)" class="btn_ty02">저장하기</a>
	<a href="#none" onclick="javascript:fnCSTList(document.formReply)" class="btn_ty">취소하기</a>
</div>
