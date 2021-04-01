<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">주요서비스 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		/* 링크일 경우 */
		$('.linkUrl').on('change', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		});
		$('.linkUrl').on('keyup', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		});
		
		/* 링크 */
		$('#articleVO').on('change', 'input[name=display01]', function() {
			if($('#chk01_1:checked').length > 0) {
				$('#custom3_0').val('Y');
			} else {
				$('#custom3_0').val('N');
			}
		});
		
		/* 링크 */
		$('#articleVO').on('change', 'input[name=display02]', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#custom3_1').val('Y');
			} else {
				$('#custom3_1').val('N');
			}
		});
		
		/* 링크 */
		$('#articleVO').on('change', 'input[name=display03]', function() {
			if($('#chk03_1:checked').length > 0) {
				$('#custom3_2').val('Y');
			} else {
				$('#custom3_2').val('N');
			}
		});
		
		/* 파일첨부 있을경우 */
		$('#file_1_0').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt1_0').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt1_0').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
		});
		$('#file_2_0').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2_0').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt2_0').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
		});
		$('#file_1_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt1_1').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt1_1').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
		});
		$('#file_2_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2_1').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt2_1').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
		});
		$('#file_1_2').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt1_2').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt1_2').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
		});
		$('#file_2_2').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2_2').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			if(fileSize > maxSize) {
				document.getElementById('b_file_txt2_2').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			}
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
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateMajorService(form) {
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {
			if($('#fileList1_0').size() < 1 && document.getElementById('b_file_txt1_0').innerText == '') {
				alert('PC 이미지는 필수입니다.');
				return;
			}
			if($('#fileList2_0').size() < 1 && document.getElementById('b_file_txt2_0').innerText == '') {
				alert('모바일 이미지는 필수입니다.');
				return;
			}
			if($('#fileList1_1').size() < 1 && document.getElementById('b_file_txt1_1').innerText == '') {
				alert('PC 이미지는 필수입니다.');
				return;
			}
			if($('#fileList2_1').size() < 1 && document.getElementById('b_file_txt2_1').innerText == '') {
				alert('모바일 이미지는 필수입니다.');
				return;
			}
			if($('#fileList1_2').size() < 1 && document.getElementById('b_file_txt1_2').innerText == '') {
				alert('PC 이미지는 필수입니다.');
				return;
			}
			if($('#fileList2_2').size() < 1 && document.getElementById('b_file_txt2_2').innerText == '') {
				alert('모바일 이미지는 필수입니다.');
				return;
			}
			
			if (confirm("<spring:message code="common.update.msg" />")) {
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	 function selectMainManageList(form) {
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

<form:form commandName="articleVO" name="formUpdate" action="/admin/hpm/umm/updateMajorService.do" method="post" onSubmit="updateMajorService(document.formUpdate); return false;" enctype="multipart/form-data">
	<c:if test="${not empty resultList && resultList.size() gt 0}">
		<c:set var="nttId_0">${resultList.get(0).nttId }</c:set>
		<c:set var="nttSj_0">${resultList.get(0).nttSj }</c:set>
		<c:set var="custom1_0">${resultList.get(0).custom1 }</c:set>
		<c:set var="custom2_0">${resultList.get(0).custom2 }</c:set>
		<c:set var="custom3_0">${resultList.get(0).custom3 }</c:set>
		<c:set var="atchFileId_0">${resultList.get(0).atchFileId }</c:set>
	</c:if>
	<c:if test="${not empty resultList && resultList.size() gt 1}">
		<c:set var="nttId_1">${resultList.get(1).nttId }</c:set>
		<c:set var="nttSj_1">${resultList.get(1).nttSj }</c:set>
		<c:set var="custom1_1">${resultList.get(1).custom1 }</c:set>
		<c:set var="custom2_1">${resultList.get(1).custom2 }</c:set>
		<c:set var="custom3_1">${resultList.get(1).custom3 }</c:set>
		<c:set var="atchFileId_1">${resultList.get(1).atchFileId }</c:set>
	</c:if>
	<c:if test="${not empty resultList && resultList.size() gt 2}">
		<c:set var="nttId_2">${resultList.get(2).nttId }</c:set>
		<c:set var="nttSj_2">${resultList.get(2).nttSj }</c:set>
		<c:set var="custom1_2">${resultList.get(2).custom1 }</c:set>
		<c:set var="custom2_2">${resultList.get(2).custom2 }</c:set>
		<c:set var="custom3_2">${resultList.get(2).custom3 }</c:set>
		<c:set var="atchFileId_2">${resultList.get(2).atchFileId }</c:set>
	</c:if>
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">번호</th>
					<td class="ta_l">1</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>카피</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"><c:out value='${nttSj_0 }'/></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList1 and not empty fileList1[0]}">
								<div id="fileList1_0">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_0}', '${fileList1[0].fileSn }');">${fileList1[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_1_0">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1_0" class="realFile_btn input_none" name="file_1_0" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1_0').innerText = this.value">
								<span id="b_file_txt1_0"></span>
								<span class="dc">*이미지 사이즈 : 1920*852 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>모바일 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList1 and not empty fileList1[1]}">
								<div id="fileList2_0">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_0}', '${fileList1[1].fileSn }');">${fileList1[1].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_2_0">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2_0" class="realFile_btn input_none" name="file_2_0" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2_0').innerText = this.value">
								<span id="b_file_txt2_0"></span>
								<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="<c:out value='${custom2_0 }'/>" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display01" id="chk01_1"<c:if test="${custom3_0 eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display01" id="chk01_2"<c:if test="${custom3_0 ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk01_2">페이지이동</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">번호</th>
					<td class="ta_l">2</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>카피</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"><c:out value='${nttSj_1 }'/></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList2 and not empty fileList2[0]}">
								<div id="fileList1_1">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_1}', '${fileList2[0].fileSn }');">${fileList2[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_1_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1_1" class="realFile_btn input_none" name="file_1_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1_1').innerText = this.value">
								<span id="b_file_txt1_1"></span>
								<span class="dc">*이미지 사이즈 : 1920*852 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>모바일 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList2 and not empty fileList2[1]}">
								<div id="fileList2_1">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_1}', '${fileList2[1].fileSn }');">${fileList2[1].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_2_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2_1" class="realFile_btn input_none" name="file_2_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2_1').innerText = this.value">
								<span id="b_file_txt2_1"></span>
								<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="<c:out value='${custom2_1 }'/>" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1"<c:if test="${custom3_1 eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2"<c:if test="${custom3_1 ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk02_2">페이지이동</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">번호</th>
					<td class="ta_l">3</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>카피</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"><c:out value='${nttSj_2 }'/></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList3 and not empty fileList3[0]}">
								<div id="fileList1_2">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_2}', '${fileList3[0].fileSn }');">${fileList3[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_1_2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1_2" class="realFile_btn input_none" name="file_1_2" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1_2').innerText = this.value">
								<span id="b_file_txt1_2"></span>
								<span class="dc">*이미지 사이즈 : 1920*852 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>모바일 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList3 and not empty fileList3[1]}">
								<div id="fileList2_2">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${atchFileId_2}', '${fileList3[1].fileSn }');">${fileList3[1].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_2_2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2_2" class="realFile_btn input_none" name="file_2_2" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2_2').innerText = this.value">
								<span id="b_file_txt2_2"></span>
								<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="<c:out value='${custom2_2 }'/>" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display03" id="chk03_1"<c:if test="${custom3_2 eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk03_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display03" id="chk03_2"<c:if test="${custom3_2 ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk03_2">페이지이동</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:updateMajorService(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectMainManageList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" id="nttId_0" name="arrayNttId" value="${nttId_0}" />
	<input type="hidden" id="nttId_1" name="arrayNttId" value="${nttId_1}" />
	<input type="hidden" id="nttId_2" name="arrayNttId" value="${nttId_2}" />
	<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
	<input type="hidden" id="postingYn" name="postingYn" value="Y" />
	<input type="hidden" id="custom3_0" name="custom3" value="${custom3_0}" />
	<input type="hidden" id="custom3_1" name="custom3" value="${custom3_1}" />
	<input type="hidden" id="custom3_2" name="custom3" value="${custom3_2}" />
	<input type="hidden" id="deleteFileSn1_0" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1_0" name="deleteFileYn1" value="N">
	<input type="hidden" id="deleteFileSn2_0" name="deleteFileSn2" value="1">
	<input type="hidden" id="deleteFileYn2_0" name="deleteFileYn2" value="N">
	<input type="hidden" id="deleteFileSn1_1" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1_1" name="deleteFileYn1" value="N">
	<input type="hidden" id="deleteFileSn2_1" name="deleteFileSn2" value="1">
	<input type="hidden" id="deleteFileYn2_1" name="deleteFileYn2" value="N">
	<input type="hidden" id="deleteFileSn1_2" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1_2" name="deleteFileYn1" value="N">
	<input type="hidden" id="deleteFileSn2_2" name="deleteFileSn2" value="1">
	<input type="hidden" id="deleteFileYn2_2" name="deleteFileYn2" value="N">
</form:form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/umm/selectMainManageList.do'/>" method="post">
</form>