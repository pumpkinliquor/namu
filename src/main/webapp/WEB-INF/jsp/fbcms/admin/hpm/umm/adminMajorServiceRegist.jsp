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
<h3 class="mid_tit mg_t50">주요서비스 등록</h3>
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
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function insertMajorService(form) {
		//input item Client-Side validate
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
		if (confirm("<spring:message code="common.regist.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectMainManageList(form) {
		form.submit();
	}
-->
</script>

<form:form commandName="articleVO" name="formInsert" action="/admin/hpm/umm/insertMajorService.do" method="post" onSubmit="insertMajorService(document.formInsert); return false;" enctype="multipart/form-data">
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
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
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
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="http://" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display01" id="chk01_1" checked="checked" class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display01" id="chk01_2" class="ez-hide">
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
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div class="input_wrap b_file_area">
								<label for="file_1_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1_1" class="realFile_btn input_none" name="file_1_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt').innerText = this.value">
								<span id="b_file_txt"></span>
								<span class="dc">*이미지 사이즈 : 1920*852 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>모바일 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div class="input_wrap b_file_area">
								<label for="file_2_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2_1" class="realFile_btn input_none" name="file_2_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
								<span id="b_file_txt2"></span>
								<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="http://" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1" checked="checked" class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2" class="ez-hide">
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
							<textarea type="text" name="nttSj" style="width:100%;height:60px;" maxlength="100"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
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
							<input type="text" name="custom2" class="inp_txt w_full linkUrl" maxlength="200" value="http://" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display03" id="chk03_1" checked="checked" class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk03_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display03" id="chk03_2" class="ez-hide">
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
		<a href="#none" onclick="javascript:insertMajorService(document.formInsert)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectMainManageList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
	<input type="hidden" id="postingYn" name="postingYn" value="Y" />
	<input type="hidden" id="custom3_0" name="custom3" value="Y" />
	<input type="hidden" id="custom3_1" name="custom3" value="Y" />
	<input type="hidden" id="custom3_2" name="custom3" value="Y" />
</form:form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/umm/selectMainManageList.do'/>" method="post">
</form>