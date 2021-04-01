<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="contents w1200">

	<ul class="step reser_step"><!-- 진행 스텝 -->
		<li class="selected">진료대상자 정보입력</li>
		<li>진료정보 입력</li>
		<li>예약완료</li>
	</ul>

	<div class="box_blue">
		<ul>
			<li>진료 상담 받으실 분의 정보를 확인하는 절차입니다.</li>
			<li>예약자 본인일 경우 : 로그인하신 온라인 회원 분이 진료 상담 대상자일 경우 선택</li>
			<li>예약자 본인이 아닐 경우 : 로그인하신 온라인 회원 분의 가족이 진료 예약 대상자일 경우</li>
			<li class="point">예약자 본인이 아닌 경우는 부모, 부부, 형제자매, 자녀까지 예약가능 대상자입니다.</li>
			<li class="point">본인이 아닌 가족에 대한 예약상황 조회 및 변경은 온라인상에서 불가능합니다.</li>
		</ul>
	</div>

	<form method="post" action="" id="reservationForm" name="reservationForm">
	<input type="hidden" id="DPT_CD" name="DPT_CD" value="${userClinicVO.DPT_CD}">
	<input type="hidden" id="DR_ID" name="DR_ID" value="${userClinicVO.DR_ID}">
	<input type="hidden" id="DR_NM" name="DR_NM" value="${userClinicVO.DR_NM}">
	<input type="hidden" id="RSV_DT" name="RSV_DT" value="${userClinicVO.RSV_DT}">
	<input type="hidden" id="MEDI_SBJ_CD" name="MEDI_SBJ_CD" value="${userClinicVO.DPT_CD}">
	<input type="hidden" id="MEDI_SBJ_NM" name="MEDI_SBJ_NM" value="${userClinicVO.MEDI_SBJ_NM}">
	
	<div class="box_radio">
		<input type="radio" name="reservation" id="reservation1" value="me" checked="checked"><label for="reservation1">예약자 본인일 경우</label>
		<input type="radio" name="reservation" id="reservation2" value="others"><label for="reservation2">예약자 본인이 아닐 경우</label>
	</div>

	<p class="n_txt"><em class="ootc">*</em>표시는 필수입력 항목 입니다</p>

	<!-- 예약자 본인일 경우 s -->
	<div class="tbox tdetail02">
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
						<input type="text" name="usrBd" id="usrBd" class="w400" title="생년월일" placeholder="숫자입력 YYYYMMDD (예: 19880101)" maxlength="8">
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
				<tr>
					<th scope="row"><em class="ootc">*</em>휴대폰</th>
					<td>
						<select name="fCtn" id="fCtn" title="휴대폰 앞자리" class="w120" required="required">
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
						<input type="text" name="mCtn" id="mCtn" class="w120" title="휴대폰 가운데 자리" required="required" maxlength="4">
						<span>-</span>
						<input type="text" name="lCtn" id="lCtn" class="w120" title="휴대폰 뒷 자리" required="required" maxlength="4">
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
						<input type="text" name="mTel" id="mTel" class="w120" title="전화번호 가운데 자리" maxlength="4">
						<span>-</span>
						<input type="text" name="lTel" id="lTel" class="w120" title="전화번호 뒷 자리" maxlength="4">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	
	
	
	
	<div class="btn_Lbox"><!-- btn box -->
		<a href="/user/cts/rsv/userRSVMain.do" class="btn bgreen">이전</a>
		<a href="javascript:formSubmit();" class="btn bblue">진료 정보 입력</a>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		if('${alertMsg}' == 500) {
			alert('회원 정보가 유효하지 않습니다.');
		}
		if($('#usrNmTemp').val() === '') {
			$('#usrNm').removeAttr('readonly');
		} else {
			$('#usrNm').attr('readonly', 'readonly');
		}
		$('.tbox table tr:eq(2)').hide();
		$('.tbox table tr:eq(3)').hide();
		$('label').click(function(e) {
			if(e.currentTarget.htmlFor == 'reservation1') {
				$('.tbox table tr:eq(2)').hide();
				$('.tbox table tr:eq(3)').hide();
				$('#gender').val('없음').prop("selected", true)
				if($('#usrNmTemp').val() === '') {
					$('#usrNm').removeAttr('readonly');
				} else {
					$('#usrNm').val($('#usrNmTemp').val());
					$('#usrNm').attr('readonly', 'readonly');
				}
			} else {
				$('.tbox table tr:eq(2)').show();
				$('.tbox table tr:eq(3)').show();
				$('#usrNm').val('');
				$('#usrNm').removeAttr('readonly');
			}
			onChangeClear();
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
	$('#gender').val('F').prop("selected", true);
	$('#APPO_RLT_CD').val('01').prop("selected", true);
	$('#fCtn').val('010').prop("selected", true);
	$('#mCtn').val('');
	$('#lCtn').val('');
	$('#fTel').val('02').prop("selected", true);
	$('#mTel').val('');
	$('#lTel').val('');
}
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
	document.reservationForm.action = "/user/cts/rsv/userRSVClinicInfo.do";
	document.reservationForm.submit();
}
</script>