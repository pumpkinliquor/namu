<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">프로그램목록관리 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="adminProgrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		/* 추가버튼 */
		$('.board_ty table tbody').on('click', '.addBtn', function() {
			console.log('addBtn');
			var addHtml = '<tr>'
				+ '    <th scope="row" class="ta_r">상세URL</th>'
				+ '    <td class="ta_l">'
				+ '        <div class="input_wrap rem_btn">'
				+ '            <input name="detailUrl" title="URL" cssClass="inp_txt w_full" maxlength="100" />'
				+ '            <button type="button" class="btn btn_ty remBtn">- 삭제</button>'
				+ '        </div>'
				+ '    </td>'
				+ '</tr>';
			$('#detailUrlNextTr').before(addHtml);
		});
		
		/* 삭제버튼 */
		$('.board_ty table tbody').on('click', '.remBtn', function() {
			console.log('remBtn');
			$(this).closest('tr').remove();
		})
	});

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deleteProgrm(form) {
		if(confirm("<spring:message code="common.delete.msg" />")) {	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateProgrm(form) {
		if(!validateAdminProgrmManageVO(form)) {
			return;
		}
		if (confirm("<spring:message code="common.save.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectProgrmList(form) {
		form.action = "<c:url value='/admin/sym/prm/selectProgrmList.do'/>";
		form.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form:form commandName="progrmManageVO" action="/admin/sym/prm/updateProgrm.do" method="post" onSubmit="fnRegistProgrm(document.forms[0]); return false;">
	
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>프로그램파일명</th>
					<td class="ta_l">
					    <c:out value="${progrmManageVO.progrmFileNm}"/>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>저장경로</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="progrmStrePath" title="저장경로" cssClass="inp_txt w_full" maxlength="100" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>한글명</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="progrmKoreanNm" title="한글명" cssClass="inp_txt w_full" maxlength="100" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>URL</th>
					<td class="ta_l">
						<div class="input_wrap add_btn">
							<form:input path="url" title="URL" cssClass="inp_txt w_full" maxlength="100" />
							<button type="button" class="btn btn_ty03 addBtn">+ 추가</button>
						</div>
					</td>
				</tr>
				<c:forEach var="resultDetailUrlInfo" items="${resultDetailUrlList }">
					<tr>
						<th scope="row" class="ta_r">상세URL</th>
						<td class="ta_l">
							<div class="input_wrap rem_btn">
								<input name="detailUrl" title="URL" cssClass="inp_txt w_full" maxlength="100" value="${resultDetailUrlInfo.url }" />
								<button type="button" class="btn btn_ty remBtn">- 삭제</button>
							</div>
						</td>
					</tr>
				</c:forEach>
				<tr id="detailUrlNextTr">
					<th scope="row" class="ta_r">프로그램설명</th>
					<td class="ta_l">
						<form:textarea path="progrmDc" rows="14" cols="75" title="메뉴설명" cssStyle="height:200px"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:deleteProgrm(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateProgrm(document.forms[0])" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectProgrmList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="progrmFileNm" value="${progrmManageVO.progrmFileNm}" >
</form:form>

<form name="formDelete" action="<c:url value='/admin/sym/prm/deleteProgrm.do'/>" method="post">
	<input type="hidden" name="progrmFileNm" value="${progrmManageVO.progrmFileNm}" >
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/sym/prm/selectProgrmList.do'/>" method="post">
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>" >
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" >
</form>
