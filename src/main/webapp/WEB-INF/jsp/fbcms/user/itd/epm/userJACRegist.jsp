<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="now" value="<%=new java.util.Date()%>" />

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
		
		// 생년월일 숫자만 입력
		$('#customDateCheckl1').on('keydown', function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
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
	function insertJAC(form) {
		//input item Client-Side validate
		if ($('#ntcrNm').val() == '') {
			alert('이름은 필수항목입니다.');
			$('#ntcrNm').focus();
			return false;
		} else if ($('#customDateCheckl1').val() == '') {
			alert('생년월일은 필수항목입니다.');
			$('#customDateCheckl1').focus();
			return false;
		} else if (!isValidDate($('#customDateCheckl1').val())) {
			alert('생년월일은 날짜형식에 맞게 해주세요.YYYYMMDD');
			$('#customDateCheckl1').focus();
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
		} else if ($('#password').val() == '') {
			$('#password').parent().find('.t_message02').show();
			alert('비밀번호를 입력해주세요.');
			$('#password').focus();
		} else if (!checkPassword($('#password').val())) {
			$('#password').parent().find('.t_message02').show();
			alert('비밀번호는 영문 대/소문자, 숫자, 특수문자 중  3가지 이상 8자 최대 16자 까지 입력 가능합니다.');
			$('#password').focus();
		} else if ($('#password_confirm').val() == '') {
			$('#password').parent().find('.t_message02').hide();
			$('#password_confirm').parent().find('.t_message02').show();
			alert('비밀번호확인을 입력해주세요.');
			$('#password_confirm').focus();
		} else if ($('#password').val() != $('#password_confirm').val()) {
			$('#password').parent().find('.t_message02').hide();
			$('#password_confirm').parent().find('.t_message02').show();
			alert('비밀번호가 맞지 않습니다.');
			$('#password').focus();
			return false;
		} else if (document.getElementById('b_file_txt').value == '') {
			alert('입사지원서를 업로드하세요');
			return false;
		} else if ($('#agree02:checked').length < 1) {
			$('#password').parent().find('.t_message02').hide();
			$('#password_confirm').parent().find('.t_message02').hide();
			alert('개인정보 수집 및 활용에 동의해주세요.');
			$('#agree02').focus();
			return false;
		} else {
			$('#password').parent().find('.t_message02').hide();
			$('#password_confirm').parent().find('.t_message02').hide();
			$('#custom4').val($('#custom4_1').val() + '@' + $('#custom4_2').val());
			if(confirm("<spring:message code="common.regist.msg" />")) {
				$('#customDate1').val(
						$('#customDateCheckl1').val().substring(0,4) + '.' 
						+ $('#customDateCheckl1').val().substring(4,6) + '.'
						+ $('#customDateCheckl1').val().substring(6,8));
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 패스워드 검증함수
	 ******************************************************** */
	function checkPassword(pwdValue) {
		var numCheck = pwdValue.search(/[0-9]/g);
		var engCheck = pwdValue.search(/[a-z]/ig);
		var speCheck = pwdValue.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if (pwdValue.length < 8 || pwdValue.length > 16 ) {
			return false;
        } else if (numCheck < 0 || engCheck < 0 || speCheck < 0) {
        	return false;
        }
		
        return true;
    }
</script>

<!-- contents s -->
<div class="contents w1200">
	<section class="re_login joinbox">
		<header>입사 지원하기</header>
		<p class="n_txt"><em class="ootc">*</em>표시는 필수입력 항목 입니다</p>
		<form:form commandName="articleVO" name="formInsert" action="/user/itd/epm/insertJAC.do" method="post" onSubmit="fnRegistJAC(document.formInsert); return false;" enctype="multipart/form-data">
			<div class="tbox tdetail02 tbox02">
				<table>
					<caption>리스트 상세 등록 페이지</caption>
					<colgroup>
						<col style="width:190px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><em class="ootc">*</em>이름</th>
							<td>
								<input type="text" id="ntcrNm" name="ntcrNm" class="w510" title="이름" maxlength="20" placeholder="이름을 입력해주세요" value="" />
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>생년월일</th>
							<td>
								<div class="input_wrap">
									<input type="text" id="customDateCheckl1" name="customDateCheckl1" class="w510" maxlength="8" placeholder="YYYYMMDD" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '');"/>
									<input type="hidden" id="customDate1" name="customDate1" value="" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>휴대폰</th>
							<td>
								<select id="custom1" name="custom1" class="w120" title="휴대전화 앞자리">
									<option value="">선택하세요</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="012">012</option>
									<option value="0130">0130</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<span>-</span>
								<input type="text" id="custom2" name="custom2" class="w120" title="휴대전화 가운데 자리" maxlength="4" />
								<span>-</span>
								<input type="text" id="custom3" name="custom3" class="w120" title="휴대전화 뒷 자리" maxlength="4" />
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>이메일</th>
							<td>
								<input type="text" id="custom4_1" name="custom4_1" class="w245" title="이메일 입력" maxlength="100" value="" />
								<span>@</span>
								<input type="text" id="custom4_2" name="custom4_2" class="w244" title="이메일 입력" maxlength="100" value="" />
								<select class="w120 ml5" title="메일선택" id="emailSelect" name="emailSelect">
									<option>직접입력</option>
									<option value="gmail.com">구글</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="kakao.com">카카오</option>
									<option value="nate.com">네이트</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>비밀번호</th>
							<td>
								<input type="password" id="password" name="password" class="w510" title="비밀번호" maxlength="16" placeholder="비밀번호를 입력해주세요" value="" />
								<p class="t_message">※ 입사지원내역 조회/수정 시 필요합니다. 비밀번호 분실 시 입사지원내역 조회/수정은 불가능합니다.</p>
								<p class="t_message">※ 영문 대/소문자, 숫자, 특수문자 중 3가지 이상 8자, 최대 16자까지 입력 가능합니다.</p>
								<p class="t_message02" style="display:none">* 비밀번호는 영문 대/소문자, 숫자, 특수문자 중  3가지 이상 8자 최대 16자 까지 입력 가능합니다.</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>비밀번호확인</th>
							<td>
								<input type="password" id="password_confirm" name="password_confirm" class="w510" title="비밀번호 확인" maxlength="16" placeholder="비밀번호를 입력해주세요" value="" />
								<p class="t_message02" style="display:none">* 비밀번호가 일치하지 않습니다.</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>입사지원서 업로드</th>
							<td>
								<input type="file" id="file_1" name="file_1" style="display:none" title="파일선택" onchange="javascript:changeFile1(this.value)">
								<input type="text" id="b_file_txt" class="w510" title="파일선택" maxlength="40" placeholder="파일을 선택하세요" value="" disabled="disabled" >
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
				<a href="<c:url value='/user/itd/epm/employmentGuide.do' />" class="btn bgreen">취소</a>
				<a href="#none" onclick="javascript:insertJAC(document.formInsert)" class="btn bblue">지원하기</a>
			</div>
		
			<input type="hidden" id="custom4" name="custom4" />
			<input type="hidden" id="parnts" name="parnts" value="<c:out value='${searchVO.nttId}'/>"/>
			<input type="hidden" id="nttSj" name="nttSj" value="입사 지원하기" />
			<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
			<input type="hidden" id="postingYn" name="postingYn" value="Y" />
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
			<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
			<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
			<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
			<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
			<input type="hidden" name="blogId" value="<c:out value='${searchVO.blogId}'/>" />
			<input type="hidden" name="blogAt" value="<c:out value='${articleVO.blogAt}'/>"/>
			<input type="hidden" name="cmd" value="<c:out value='save'/>">
			<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
		</form:form>
	</section>
