<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">팝업관리 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="popupVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		$("#ntceBgnde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#ntceEndde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#ntceBgnde').datepicker("option", "maxDate", $("#ntceEndde").val());
		$('#ntceBgnde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceEndde").datepicker( "option", "minDate", selectedDate );
		});
		$('#ntceEndde').datepicker("option", "minDate", $("#ntceBgnde").val());
		$('#ntceEndde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceBgnde").datepicker( "option", "maxDate", selectedDate );
		});
		
		/* 링크일 경우 */
		/* $('.linkUrl').on('change', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		});
		$('.linkUrl').on('keyup', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		}); */
		
		/* 새창여부 */
		$('#popupVO').on('change', '#chk01_1, #chk01_2', function() {
			if($('#chk01_1:checked').length > 0) {
				$('#popupTargetYn').val('Y');
			} else {
				$('#popupTargetYn').val('N');
			}
		});
		
		/* 게시여부 */
		$('#popupVO').on('change', '#chk02_1, #chk02_2', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#ntceAt').val('Y');
			} else {
				$('#ntceAt').val('N');
			}
		});
		
		/* 첨부파일 하나만 삭제버튼 */
		$('#popupVO').on('click', '.remOneFile', function() {
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
		document.getElementById("popupVO").popupTitleNm.focus();
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deletePopup(form) {
		if(confirm("<spring:message code="common.delete.msg" />")) {	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updatePopup(form) {
		if(form.popupTitleNm.value == '') {
			alert('제목은 필수입니다.');
			form.popupTitleNm.focus();
			return false;
		}
		if(confirm("<spring:message code="common.save.msg" />")) {
			//게시기간 
			if($("#ntceBgnde").length > 0) {
				var ntceBgnde = getRemoveFormat(form.ntceBgnde.value);
				var ntceEndde = getRemoveFormat(form.ntceEndde.value);
				
				if(ntceBgnde == '' && ntceEndde != '') {
					form.ntceBgnde.value = '1900-01-01';
				}
				if(ntceBgnde != '' && ntceEndde == '') {
					form.ntceEndde.value = '9999-12-31';
				}
				if(ntceBgnde == '' && ntceEndde == '') {
					form.ntceBgnde.value = '1900-01-01';
					form.ntceEndde.value = '9999-12-31';
				}
				
				ntceBgnde = getRemoveFormat(form.ntceBgnde.value);
				ntceEndde = getRemoveFormat(form.ntceEndde.value);
				
				if(ntceBgnde > ntceEndde) {
					alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
					return;
				}
			}
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectPopupList(form) {
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

<form:form commandName="popupVO" name="formUpdate" action="/admin/hpm/umm/updatePopup.do" method="post" onSubmit="updatePopup(document.formUpdate); return false;" enctype="multipart/form-data"> 
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="popupTitleNm" title="제목" cssClass="inp_txt w_full" maxlength="100" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시기간</th>
					<td class="ta_l">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="ntceBgnde" name="ntceBgnde" class="inp_txt wd110 date_pick" title="" placeholder="" value="<c:out value='${popupVO.ntceBgnde}' />">
								<span> - </span>
								<input type="text" id="ntceEndde" name="ntceEndde" class="inp_txt wd110 date_pick" title="" placeholder="" value="<c:out value='${popupVO.ntceEndde}' />">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList and not empty fileList[0]}">
								<div id="fileList1">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${popupVO.atchFileId}', '${fileList[0].fileSn }');">${fileList[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = this.value">
								<span id="b_file_txt1"></span>
								<span class="dc">*이미지 사이즈 : 450*600 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>모바일 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList and not empty fileList[1]}">
								<div id="fileList2">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${popupVO.atchFileId}', '${fileList[1].fileSn }');">${fileList[1].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
								<span id="b_file_txt2"></span>
								<span class="dc">*이미지 사이즈 : 450*600 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="fileUrl" title="링크" cssClass="inp_txt w_full linkUrl" maxlength="200" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display01" id="chk01_1"<c:if test="${popupVO.popupTargetYn eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display01" id="chk01_2"<c:if test="${popupVO.popupTargetYn ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk01_2">페이지이동</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1"<c:if test="${popupVO.ntceAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2"<c:if test="${popupVO.ntceAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk02_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l"><c:out value="${popupVO.frstRegisterPnttm}" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:deletePopup(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updatePopup(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectPopupList(document.formList)" class="btn_ty">취소하기</a>
	</div>

	<form:hidden path="popupTargetYn" />
	<form:hidden path="ntceAt" />
	<form:hidden path="searchCondition" />
	<form:hidden path="searchKeyword" />
	<form:hidden path="pageIndex" />
	<form:hidden path="atchFileId" />
	<input type="hidden" id="popupId" name="popupId" value="<c:out value='${popupVO.popupId}'/>" readonly="readonly" />
	<input type="hidden" id="posblAtchFileNumber" name="posblAtchFileNumber" value="1" >
	<input type="hidden" id="deleteFileSn1" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1" name="deleteFileYn1" value="N">
	<input type="hidden" id="deleteFileSn2" name="deleteFileSn2" value="1">
	<input type="hidden" id="deleteFileYn2" name="deleteFileYn2" value="N">
</form:form>

<form name="formDelete" action="<c:url value='/admin/hpm/umm/deletePopup.do'/>" method="post">
	<input type="hidden" name="popupId" value="${popupVO.popupId}" readonly="readonly">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/umm/selectPopupList.do'/>" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCondition" value="POPUP_SJ_NM">
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
	<input type="hidden" name="ntceAt" value="${searchVO.ntceAt}">
	<input type="hidden" name="ntceBgnde" value="<c:out value='${searchVO.ntceBgnde}'/>" />
	<input type="hidden" name="ntceEndde" value="<c:out value='${searchVO.ntceEndde}'/>" />
</form>