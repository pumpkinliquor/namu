<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- contents s -->
<div class="contents w1200">

	<ul class="step reser_step"><!-- 진행 스텝 -->
		<li class="selected">검진대상자 정보입력</li>
		<li>검진정보 입력</li>
		<li>예약완료</li>
	</ul>

	<div class="box_blue">
		<ul>
			<li>검진 상담 받으실 분의 정보를 확인하는 절차입니다</li>
			<li>예약자 본인일 경우 : 본인이 검진 상담 대상자일 경우 선택</li>
			<li>예약자 본인이 아닐 경우 : 본인의 가족이 검진 예약 대상자일 경우</li>
			<li class="point">예약자 본인이 아닌 경우는 부모, 부부, 형제자매, 자녀까지 예약가능 대상자입니다</li>
			<li class="point">본인이 아닌 가족에 대한 예약상황 조회 및 변경은 온라인상에서 불가능합니다</li>
		</ul>
	</div>

	<div class="box_radio">
		<input type="radio" name="reservation" id="me" checked><label for="me">예약자 본인일 경우</label>
		<input type="radio" name="reservation" id="others"><label for="others">예약자 본인이 아닐 경우</label>
	</div>

	<p class="n_txt"><em class="ootc">*</em>표시는 필수입력 항목 입니다</p>

	<div class="tbox tdetail02">
		<form method="post" action="" id="reservationForm" name="reservationForm">
		<input type="hidden" name="reservation" id="reservation" value="me">
			<table>
				<caption>리스트 상세 등록 페이지</caption>
				<col style="width:15%">
				<col>
				<tbody>
					<tr>
						<th scope="row"><em class="ootc">*</em>이름</th>
						<td><input type="text" name="usrNm" id="usrNm" class="w1400" title="이름" value="${userInfo.name}" maxlength="13"><input type="hidden" name="usrNmTemp" id="usrNmTemp" class="w1400" title="이름" value="${userInfo.name}" maxlength="13"></td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>생년월일</th>
						<td>
							<input type="text" name="usrBd" id="usrBd" class="w400" title="생년월일" placeholder="숫자입력 YYYYMMDD (예: 19880101)" onkeypress="onlyNumber()" maxlength="8">
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>성별</th>
						<td>
							<select name="gender" id="gender" title="성별" class="w245">
								<option value="F">여성</option>
								<option value="M">남성</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>예약자와의 관계</th>
						<td>
							<select name="APPO_RLT_CD" id="APPO_RLT_CD" title="예약자와의 관계" class="w245">
								<option value="01">부모</option>
								<option value="02">부부</option>
								<option value="03">형제자매</option>
								<option value="04">자녀</option>
							</select>
						</td>
					</tr>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>휴대폰</th>
						<td>
							<select name="fCtn" id="fCtn" title="휴대폰 앞자리" class="w120">
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
							<input type="text" name="mCtn" id="mCtn" class="w120" title="휴대폰 가운데 자리" required="required" onkeypress="onlyNumber()" maxlength="4">
							<span>-</span>
							<input type="text" name="lCtn" id="lCtn" class="w120" title="휴대폰 뒷 자리" required="required" onkeypress="onlyNumber()" maxlength="4">
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc_none"></em>전화번호</th>
						<td>
							<select name="fTel" id="fTel" title="전화번호 앞자리" class="w120">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="070">070</option>
							</select>
							<span>-</span>
							<input type="text" name="mTel" id="mTel" class="w120" title="전화번호 가운데 자리" onkeypress="onlyNumber()" maxlength="4">
							<span>-</span>
							<input type="text" name="lTel" id="lTel" class="w120" title="전화번호 뒷 자리" onkeypress="onlyNumber()" maxlength="4">
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>이메일</th>
						<td>
							<input type="text" class="w245" title="이메일 입력" name="emailDetail" id="emailDetail">
							<span>@</span>
							<input type="text" class="w245" title="이메일 입력" name="emailDomain" id="emailDomain">
							<select title="메일선택" class="w120 ml5" name="emailSelect" id="emailSelect">
								<option>직접입력</option>
								<option value="gmail.com">구글</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
								<option value="kakao.com">카카오</option>
								<option value="nate.com">네이트</option>
							</select>
						</td>
						<input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value=""/>
					</tr>
					<tr>
						<th scope="row"><em class="ootc">*</em>주소</th>
						<td>
							<div>
								<input type="text" class="w510 disabled" id="address" title="주소입력" disabled>
								<input type="hidden" name="ADDR_TX" id="_address"/>
								<input type="hidden" name="POST_NO" id="postCode" value=""/>
								<a href="javascript:execDaumPostcode();" id="searchAddress" class="btn bs ml5">주소등록</a>
							</div>
							<div>
								<input type="text" name="ADDR_DTIL_TX" id="ADDR_DTIL_TX" class="w510 disabled mt10" title="상세 주소입력" placeholder="상세주소를 입력해주세요">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><em class="ootc_none"></em>문의 및 전달사항</th>
						<td>
							<textarea name="content" id="content" title="내용" class="textarea_240"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	
	<div class="btn_Lbox"><!-- btn box -->
		<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn bgreen">이전</a>
		<a href="javascript:formSubmit();" class="btn bblue">검진 정보 입력</a>
	</div>


</div>
<!-- //contents e -->
<script>
$(function() {
	$('.tbox table tr:eq(2)').hide();
	$('.tbox table tr:eq(3)').hide();
	
	$('label').click(function(e) {
		if(e.currentTarget.htmlFor == 'me') {
			$('.tbox table tr:eq(2)').hide();
			$('.tbox table tr:eq(3)').hide();
			$('#usrNm').val($('#usrNmTemp').val());
		} else {
			$('.tbox table tr:eq(2)').show();
			$('.tbox table tr:eq(3)').show();
			$('#usrNm').val("");
		}
		$('#reservation').val(e.currentTarget.htmlFor);
	});
	
	$('#emailDetail').change(function() {
		$('#EMAIL_ID').val($('#emailDetail').val()+'@'+$('#emailDomain').val());
	});
	$('#emailSelect').change(function() {
		if($('#emailSelect').val() == '직접입력') {
			$('#emailDomain').val('');
			$('#emailDomain').removeAttr('readonly');
		} else {
			$('#emailDomain').attr('readonly', 'readonly');
			$('#emailDomain').val($('#emailSelect').val());
		}
		$('#EMAIL_ID').val($('#emailDetail').val()+'@'+$('#emailDomain').val());
	});
	$('#emailDomain').change(function() {
		$('#EMAIL_ID').val($('#emailDetail').val()+'@'+$('#emailDomain').val());
	});
	
	$('#usrNm').change(function() {
		if(koEnRegex($('#usrNm').val()) == false) {
			$('#usrNm').val('');
			$('#usrNm').focus();
		}
	});
	$('#usrBd').change(function() {
		if(numberRegex($('#usrBd').val()) == false) {
			$('#usrBd').val('');
			$('#usrBd').focus();
		}
	});
	$('#mCtn').change(function() {
		if(numberRegex($('#mCtn').val()) == false) {
			$('#mCtn').val('');
			$('#mCtn').focus();
		}
	});
	$('#lCtn').change(function() {
		if(numberRegex($('#lCtn').val()) == false) {
			$('#lCtn').val('');
			$('#lCtn').focus();
		}
	});
	$('#mTel').change(function() {
		if(numberRegex($('#mTel').val()) == false) {
			$('#mTel').val('');
			$('#mTel').focus();
		}
	});
	$('#lTel').change(function() {
		if(numberRegex($('#lTel').val()) == false) {
			$('#lTel').val('');
			$('#lTel').focus();
		}
	});
	
});

function onChangeClear() {
	$('#usrBd').val('');
	$('#gender').val('여성').prop("selected", true);
	$('#APPO_RLT_CD').val('01').prop("selected", true);
	$('#fCtn').val('010').prop("selected", true);
	$('#mCtn').val('');
	$('#lCtn').val('');
	$('#fTel').val('02').prop("selected", true);
	$('#mTel').val('');
	$('#lTel').val('');
	
	// 주소등록

	$("#searchAddress").on("click", function(e) {
			e.preventDefault();
			execDaumPostcode();
		});

}

// 다음 우편번호API
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.roadAddress;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postCode').value = data.zonecode;
			document.getElementById("_address").value = addr;
			$("#address").val(
					$("#postCode").val() + "  " + $("#_address").val());
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("ADDR_DTIL_TX").focus();
		}
	}).open();
};

/*숫자체크*/
function numberRegex(text) {
	let regex= /[^0-9]/g
	if(regex.test(text)) {
		alert('숫자만 입력해 주시기 바랍니다.');
		return false;
	}
	return true;
}

/*영어, 한글만 허용*/
function koEnRegex(text) {
	let regex= /[^a-zA-z가-힣]/g
	if(regex.test(text)) {
		alert('영문 또는 한글로 입력해 주시기 바랍니다.');
		return false;
	}
	return true;
}

/*전송*/
function formSubmit() {

	/*Valiidation Check*/
	
	/*이름체크*/
	if(koEnRegex($('#usrNm').val()) == false) {
		$('#usrNm').val('');
		$('#usrNm').focus();
		return false;
	}
	if($('#usrNm').val().length < 2 || $('#usrNm').val() === '') {
		alert('이름을 입력하여 주시기 바랍니다.');
		$('#usrNm').focus();
		return false;
	}
	/*생년월일 체크*/
	if(numberRegex($('#usrBd').val()) == false) {
		$('#usrBd').val('');
		$('#usrBd').focus();
		return false;
	}
	if($('#usrBd').val().length != 8) {
		alert('생년월일 8자리를 입력하여 주시기 바랍니다.');
		$('#usrBd').focus();
		return false;
	}
	/*연락처 체크*/
	if(numberRegex($('#mCtn').val()) == false) {
		$('#mCtn').val('');
		$('#mCtn').focus();
		return false;
	}
	if($('#mCtn').val().length < 3) {
		alert('휴대폰번호를 정확히 입력하여 주시기 바랍니다.');
		$('#mCtn').focus();
		return false;
	}
	if(numberRegex($('#lCtn').val()) == false) {
		$('#lCtn').val('');
		$('#lCtn').focus();
		return false;
	}
	if($('#lCtn').val().length < 3) {
		alert('휴대폰번호를 정확히 입력하여 주시기 바랍니다.');
		$('#lCtn').focus();
		return false;
	}
	document.reservationForm.action = "<c:url value='/user/cts/rsv/userRSVCheckupInfo.do'/>";
	document.reservationForm.submit();
}
function onlyNumber(){
	if((event.keyCode<48)||(event.keyCode>57)) {
		event.returnValue=false;
	}
}
</script>