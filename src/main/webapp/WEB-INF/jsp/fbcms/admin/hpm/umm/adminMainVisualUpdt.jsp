<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">메인비주얼 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		/* 백그라운드 */
		$('#articleVO').on('change', '#chk01_1, #chk01_2', function() {
			if($('#chk01_1:checked').length > 0) {
				$('#custom1').val('1');
			} else {
				$('#custom1').val('2');
			}
		});
		$('#articleVO').on('change', '#chk03_1, #chk03_2', function() {
			if($('#chk03_1:checked').length > 0) {
				$('#custom5').val('1');
			} else {
				$('#custom5').val('2');
			}
		});
		
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
		$('#articleVO').on('change', '#chk02_1, #chk02_2', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#custom3').val('Y');
			} else {
				$('#custom3').val('N');
			}
		});
		
		/* 게시여부 */
		$('#articleVO').on('change', '#chk03_1, #chk03_2', function() {
			if($('#chk03_1:checked').length > 0) {
				$('#postingYn').val('Y');
			} else {
				$('#postingYn').val('N');
			}
		});
		
		/* 파일첨부 있을경우 */
		$('#file_1').on('change', function() {
			if($('#custom1').val() == '2') { // 이미지
				// 확장자 체크
				var ext = $(this).val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
					document.getElementById('b_file_txt1').innerText = '';
					alert('파일첨부가 허용된 파일이 아닙니다.');
					fileInit($(this));
					return;
				}
				
				// 파일 용량 체크
				var fileSize = this.files[0].size;
				var maxSize = 1024 * 1024 * 10;
				if(fileSize > maxSize) {
					document.getElementById('b_file_txt1').innerText = '';
					alert('파일용량 10MB를 초과했습니다.');
					fileInit($(this));
					return;
				}
			} else { // 동영상
				// 확장자 체크
				var ext = $(this).val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['mp4']) == -1) {
					document.getElementById('b_file_txt1').innerText = '';
					alert('파일첨부가 허용된 파일이 아닙니다.');
					fileInit($(this));
					return;
				}
				
				// 파일 용량 체크
				var fileSize = this.files[0].size;
				var maxSize = 1024 * 1024 * 100;
				if(fileSize > maxSize) {
					document.getElementById('b_file_txt1').innerText = '';
					alert('파일용량 100MB를 초과했습니다.');
					fileInit($(this));
					return;
				}
			}
			$('#deleteFileYn1').val("Y");
		});
		$('#file_2').on('change', function() {
			if($('#custom5').val() == '2') { // 이미지
				// 확장자 체크
				var ext = $(this).val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
					document.getElementById('b_file_txt2').innerText = '';
					alert('파일첨부가 허용된 파일이 아닙니다.');
					fileInit($(this));
					return;
				}
				
				// 파일 용량 체크
				var fileSize = this.files[0].size;
				var maxSize = 1024 * 1024 * 10;
				if(fileSize > maxSize) {
					document.getElementById('b_file_txt2').innerText = '';
					alert('파일용량 10MB를 초과했습니다.');
					fileInit($(this));
					return;
				}
			} else { // 동영상
				// 확장자 체크
				var ext = $(this).val().split('.').pop().toLowerCase();
				if($.inArray(ext, ['mp4']) == -1) {
					document.getElementById('b_file_txt2').innerText = '';
					alert('파일첨부가 허용된 파일이 아닙니다.');
					fileInit($(this));
					return;
				}
				
				// 파일 용량 체크
				var fileSize = this.files[0].size;
				var maxSize = 1024 * 1024 * 100;
				if(fileSize > maxSize) {
					document.getElementById('b_file_txt2').innerText = '';
					alert('파일용량 100MB를 초과했습니다.');
					fileInit($(this));
					return;
				}
			}
			$('#deleteFileYn2').val("Y");
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
		// 첫 입력란에 포커스
		document.getElementById("articleVO").nttSj.focus();
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deleteMainVisual(form){
		if(confirm("<spring:message code="common.delete.msg" />")){	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateMainVisual(form) {
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {
			if($('#fileList1').size() < 1 && document.getElementById('b_file_txt1').innerText == '') {
				alert('백그라운드는 필수입니다.');
				return;
			}
			if($('#fileList2').size() < 1 && document.getElementById('b_file_txt2').innerText == '') {
				alert('모바일 스틸컷은 필수입니다.');
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

<form:form commandName="articleVO" name="formUpdate" action="/admin/hpm/umm/updateMainVisual.do" method="post" onSubmit="updateMainVisual(document.formUpdate); return false;" enctype="multipart/form-data">
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
							<form:input path="nttSj" title="제목" cssClass="inp_txt w_full" maxlength="100" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" rowspan="2"><em class="ootc">*</em>백그라운드</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display" id="chk01_1"<c:if test="${articleVO.custom1 eq '1'}"> checked="checked"</c:if>><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">동영상</label>
								</span>
								<span>
									<input type="radio" name="display" id="chk01_2"<c:if test="${articleVO.custom1 ne '1'}"> checked="checked"</c:if>>
									<label for="chk01_2">이미지</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList and not empty fileList[0]}">
								<div id="fileList1">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${articleVO.atchFileId}', '${fileList[0].fileSn }');">${fileList[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = this.value">
								<span id="b_file_txt1"></span>
								<span class="dc">*동영상 사이즈 : 1920*850 | 용량: 100mb 이하 |  mp4<span class="pd_l50"></span>
												*이미지 사이즈 : 1920*850 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" rowspan="2"><em class="ootc">*</em>모바일 스틸컷</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display03" id="chk03_1"<c:if test="${articleVO.custom1 eq '1'}"> checked="checked"</c:if>><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk03_1">동영상</label>
								</span>
								<span>
									<input type="radio" name="display03" id="chk03_2"<c:if test="${articleVO.custom1 ne '1'}"> checked="checked"</c:if>>
									<label for="chk03_2">이미지</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td class="ta_l">
						<div class="add_file_wrap">
							<c:if test="${not empty fileList and not empty fileList[1]}">
								<div id="fileList2">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${articleVO.atchFileId}', '${fileList[1].fileSn }');">${fileList[1].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</div>
							</c:if>
							<div class="input_wrap b_file_area">
								<label for="file_2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
								<span id="b_file_txt2"></span>
								<span class="dc">*이미지 사이즈 : 750*1234 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">링크</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="custom2" title="링크" cssClass="inp_txt w_full linkUrl" maxlength="200" />
						</div>
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1"<c:if test="${articleVO.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">새창</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2"<c:if test="${articleVO.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk02_2">페이지이동</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">카피</th>
					<td class="ta_l">
						<div class="input_wrap mg_b05">
							<form:input path="custom4" title="카피" cssClass="inp_txt w_full" maxlength="200" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">서브 카피</th>
					<td class="ta_l">
						<div class="input_wrap mg_b05">
							<form:textarea path="nttCn" title="서브 카피" cols="300" rows="20" cssStyle="width:100%;height:300px"/>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display03" id="chk03_1"<c:if test="${articleVO.postingYn eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk03_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display03" id="chk03_2"<c:if test="${articleVO.postingYn ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk03_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l"><c:out value="${articleVO.frstRegisterPnttm}" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:deleteMainVisual(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateMainVisual(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectMainManageList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="atchFileId" value="${articleVO.atchFileId }">
	<input type="hidden" id="noticeAt" name="noticeAt" value="<c:out value='${articleVO.noticeAt}'/>" />
	<input type="hidden" id="postingYn" name="postingYn" value="<c:out value='${articleVO.postingYn}'/>" />
	<input type="hidden" id="custom1" name="custom1" value="<c:out value='${articleVO.custom1}'/>" />
	<input type="hidden" id="custom3" name="custom3" value="<c:out value='${articleVO.custom3}'/>" />
	<input type="hidden" id="custom5" name="custom5" value="<c:out value='${articleVO.custom5}'/>" />
	<input type="hidden" id="deleteFileSn1" name="deleteFileSn1" value="0">
	<input type="hidden" id="deleteFileYn1" name="deleteFileYn1" value="N">
	<input type="hidden" id="deleteFileSn2" name="deleteFileSn2" value="1">
	<input type="hidden" id="deleteFileYn2" name="deleteFileYn2" value="N">
</form:form>

<form name="formDelete" action="<c:url value='/admin/hpm/umm/deleteMainVisual.do'/>" method="post">
	<input type="hidden" name="nttId" value="${articleVO.nttId}">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/umm/selectMainManageList.do'/>" method="post">
</form>