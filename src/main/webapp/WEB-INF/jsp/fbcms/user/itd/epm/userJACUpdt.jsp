<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script type="text/javascript">
	$(function() {
		// 스크롤
		$(window).on("load",function() {
			$.mCustomScrollbar.defaults.scrollButtons.enable=true;
			$.mCustomScrollbar.defaults.axis="yx";
			$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		});

		// 이메일 선택
		$('#emailSelect').on('change', function() {
			if($('#emailSelect').val() == '직접입력') {
				$('#custom4_2').val('');
				$('#custom4_2').removeAttr('readonly');
			} else {
				$('#custom4_2').attr('readonly', 'readonly');
				$('#custom4_2').val($('#emailSelect').val());
			}
			$('#custom4').val($('#custom4_1').val() + '@' + $('#custom4_2').val());
		});
		
		<%-- 첨부파일 하나만 삭제버튼 --%>
		$('#articleVO').on('click', '.remOneFile', function() {
			var deleteFileSn = $(this).parent().attr('id').replace('fileList', 'deleteFileYn');
			$(this).parent().remove();
			$('#'+deleteFileSn).val('Y');
		});
	});
	
	function changeFile1(value) {
		var txtValue = value;
		if(value != '') {
			var file1 = value.split("\\");
			txtValue = file1[file1.length - 1];
		}
		document.getElementById('b_file_txt').value = txtValue;
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateJAC(form) {
		//input item Client-Side validate
		if ($('#ntcrNm').val() == '') {
			alert('이름은 필수항목입니다.');
			$('#ntcrNm').focus();
			return false;
		} else if ($('#custom1').val() == '') {
			alert('휴대폰은 필수항목입니다.');
			$('#custom1').focus();
			return false;
		} else if ($('#custom2').val() == '') {
			alert('휴대폰은 필수항목입니다.');
			$('#custom2').focus();
			return false;
		} else if ($('#custom3').val() == '') {
			alert('휴대폰은 필수항목입니다.');
			$('#custom3').focus();
			return false;
		} else if ($('#custom4_1').val() == '') {
			alert('이메일은 필수항목입니다.');
			$('#custom4_1').focus();
			return false;
		} else if ($('#custom4_2').val() == '') {
			alert('이메일은 필수항목입니다.');
			$('#custom4_2').focus();
		} else if (document.getElementById('b_file_txt').value == '') {
			alert('입사지원서를 업로드하세요');
			return false;
		} else if ($('#agree02:checked').length < 1) {
			alert('개인정보 수집 및 활용에 동의해주세요.');
			$('#agree02').focus();
			return false;
		} else {
			$('#custom4').val($('#custom4_1').val() + '@' + $('#custom4_2').val());
			if(confirm("<spring:message code="common.update.msg" />")) {
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
</script>

<!-- contents s -->
<div class="contents w1200">
	<section class="re_login joinbox">
		<header>입사 지원내역 조회&middot;수정</header>
		<p class="n_txt"><em class="ootc">*</em>표시는 필수입력 항목 입니다</p>
		<form:form commandName="articleVO" name="formUpdate" action="/user/itd/epm/updateJAC.do" method="post" onSubmit="updateJAC(document.formUpdate); return false;" enctype="multipart/form-data">
			<div class="tbox tdetail02 tbox02">
				<table>
					<caption>리스트 상세 수정 페이지</caption>
					<colgroup>
						<col style="width:190px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><em class="ootc">*</em>이름</th>
							<td><c:out value="${articleVO.ntcrNm}" /></td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>생년월일</th>
							<td><c:out value="${articleVO.customDate1}" /></td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>휴대폰</th>
							<td>
								<select id="custom1" name="custom1" class="w120" title="휴대전화 앞자리">
									<option value="">선택하세요</option>
									<option value="010"<c:if test="${articleVO.custom1 eq '010'}"> selected="selected"</c:if>>010</option>
									<option value="011"<c:if test="${articleVO.custom1 eq '011'}"> selected="selected"</c:if>>011</option>
									<option value="012"<c:if test="${articleVO.custom1 eq '012'}"> selected="selected"</c:if>>012</option>
									<option value="0130"<c:if test="${articleVO.custom1 eq '0130'}"> selected="selected"</c:if>>0130</option>
									<option value="016"<c:if test="${articleVO.custom1 eq '016'}"> selected="selected"</c:if>>016</option>
									<option value="017"<c:if test="${articleVO.custom1 eq '017'}"> selected="selected"</c:if>>017</option>
									<option value="018"<c:if test="${articleVO.custom1 eq '018'}"> selected="selected"</c:if>>018</option>
									<option value="019"<c:if test="${articleVO.custom1 eq '019'}"> selected="selected"</c:if>>019</option>
								</select>
								<span>-</span>
								<form:input path="custom2" cssClass="w120" title="휴대전화 가운데 자리" maxlength="4" />
								<span>-</span>
								<form:input path="custom3" cssClass="w120" title="휴대전화 뒷 자리" maxlength="4" />
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>이메일</th>
							<td>
								<input type="text" id="custom4_1" name="custom4_1" class="w245" title="이메일 입력" maxlength="100" value="${fn:split(articleVO.custom4, '@')[0]}" />
								<span>@</span>
								<input type="text" id="custom4_2" name="custom4_2" class="w244" title="이메일 입력" maxlength="100" value="${fn:split(articleVO.custom4, '@')[1]}" />
								<select class="w120 ml5" title="메일선택" id="emailSelect" name="emailSelect">
									<option>직접입력</option>
									<option value="gmail.com"<c:if test="${articleVO.custom4 eq 'gmail.com'}"> selected="selected"</c:if>>구글</option>
									<option value="naver.com"<c:if test="${articleVO.custom4 eq 'naver.com'}"> selected="selected"</c:if>>네이버</option>
									<option value="daum.net"<c:if test="${articleVO.custom4 eq 'daum.net'}"> selected="selected"</c:if>>다음</option>
									<option value="kakao.com"<c:if test="${articleVO.custom4 eq 'kakao.com'}"> selected="selected"</c:if>>카카오</option>
									<option value="nate.com"<c:if test="${articleVO.custom4 eq 'nate.com'}"> selected="selected"</c:if>>네이트</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>입사지원서 업로드</th>
							<td>
								<input type="file" id="file_1" name="file_1" style="display:none" title="파일선택" onchange="javascript:changeFile1(this.value)">
								<input type="text" id="b_file_txt" class="w510" title="파일선택" maxlength="40" placeholder="파일을 선택하세요" <c:if test="${not empty fileList and not empty fileList[0]}">value="${fileList[0].orignlFileNm }"</c:if> disabled="disabled" >
								<a href="#none" onclick="javascript:document.getElementById('file_1').click();" class="btn bs ml5">파일 업로드</a>
								<p class="t_message">※ 입사지원서는 1개만 업로드 가능합니다.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<h4 class="con_in_tit01">개인정보취급방침</h4>
			
			<div class="agree_box s01">
				<header>개인정보의 수입&middot;이용 목적</header>
				<p>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용하지 않으며 이용 목적 이 변경될 시에는 사전 동의를 구하겠습니다.<br>
				이 다음 내용은 하단에 작성되며 양 끝 여백은 20px 기준으로 처리합니다.<br>
				3줄때는 이렇게 보여집니다. 줄을 바꿀 땐 행간 기준 1줄 여백 두고 작성합니다. </p>
				<p>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용하지 않으며 이용 목적 이 변경될 시에는 사전 동의를 구하겠습니다.<br>
				이 다음 내용은 하단에 작성되며 양 끝 여백은 20px 기준으로 처리합니다.<br>
				3줄때는 이렇게 보여집니다. 줄을 바꿀 땐 행간 기준 1줄 여백 두고 작성합니다. </p>
			</div>
			<p class="agree"><input type="checkbox" id="agree02"><label for="agree02">개인정보 수집 및 활용 동의(필수)</p>
		
			<div class="btn_Lbox">
				<a href="<c:url value='/user/itd/epm/employmentGuide.do'/>" class="btn bgreen">메인</a>
				<a href="#none" onclick="javascript:updateJAC(document.formUpdate)" class="btn bblue">수정</a>
			</div>
		
			<input type="hidden" id="custom4" name="custom4" value="<c:out value='${articleVO.custom4}'/>"/>
			<input type="hidden" id="nttSj" name="nttSj" value="입사 지원하기" />
			<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
			<input type="hidden" id="postingYn" name="postingYn" value="Y" />
			<input type="hidden" name="pageIndex" value="<c:out value='${articleVO.pageIndex}'/>"/>
			<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
			<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
			<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
			<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
			<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
			<input type="hidden" name="nttId" value="${articleVO.nttId}">
			<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
			<input type="hidden" name="atchFileId" value="${articleVO.atchFileId }">
			<input type="hidden" id="deleteFileSn1" name="deleteFileSn1" value="0">
			<input type="hidden" id="deleteFileYn1" name="deleteFileYn1" value="N">
		</form:form>
	</section>