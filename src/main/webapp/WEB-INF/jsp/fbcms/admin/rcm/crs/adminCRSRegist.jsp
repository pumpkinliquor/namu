<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<h3 class="mid_tit mg_t50">검진예약 등록</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		$("#datepicker02").datepicker({
			dateFormat : 'yy.mm.dd'
		});

		$("#datepicker01").datepicker({
			dateFormat : 'yy.mm.dd'
		});
	}
	/*********************************************************
	 * 등록
	 ******************************************************** */
	function fnInsertCRS() {
		document.reservationForm.action = "<c:url value='/admin/rcm/crs/insertCRS.do'/>";
		document.reservationForm.MOBILE_PHONE_NO.value = document
				.getElementById('MOBILE_PHONE_NO01').value
				+ "-"
				+ document.getElementById('MOBILE_PHONE_NO02').value
				+ "-" + document.getElementById('MOBILE_PHONE_NO03').value;
		document.reservationForm.PHONE_NO.value = document
				.getElementById('PHONE_NO01').value
				+ "-"
				+ document.getElementById('PHONE_NO02').value
				+ "-"
				+ document.getElementById('PHONE_NO03').value;
		document.reservationForm.EMAIL_ID.value = document.getElementById('mailId').value
		   +"@"+ document.getElementById('domain').value;
		document.reservationForm.submit();
	}
	/*********************************************************
	 * 우편번호
	 ******************************************************** */
	function fnDaumPostcode() {
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
				document.getElementById('zip').value = data.zonecode;
				document.getElementById("address").value = addr;
				$("#_address").html(
						$("#zip").val() + "  " + $("#address").val());
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	};
</script>

<form action="" method="post" name="reservationForm">
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 15%;">
			<col span="1" style="width: 35%;">
			<col span="1" style="width: 15%;">
			<col span="1" style="">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>검진프로그램</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="EXMN_PROG_CD">
							<option value="">선택</option>
							<option value="01">01</option>
							<option value="02">02</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약자</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" class="wd110" name="APPO_PRSN_NM" />
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>성별</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="GENDER_CD">
							<option value="">선택</option>
							<option value="M">남성</option>
							<option value="F">여성</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약일시</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap dis_inl">
						<input type="text" id="datepicker02" value="" name="APPO_DT"
							class="inp_txt wd110 date_pick" title="" placeholder="">
					</div>
					<div class="select_wrap dis_inl">
						<select class="select" name="APPO_TIME">
							<option value="1100">11:00</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" id="datepicker01" value=""
							class="inp_txt wd110 date_pick" title="" placeholder=""
							name="BIRTH_DT">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">휴대폰</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="MOBILE_PHONE_NO01">
							<option value="010">010</option>
						</select> <span> - </span> <input type="text" class="inp_txt wd110"
							title="" placeholder="" id="MOBILE_PHONE_NO02"> <span>
							- </span> <input type="text" class="inp_txt wd110" title=""
							placeholder="" id="MOBILE_PHONE_NO03">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">전화번호</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="PHONE_NO01">
							<option value="02">02</option>
						</select> <span> - </span> <input type="text" class="inp_txt wd110"
							title="" placeholder="" id="PHONE_NO02"> <span> -
						</span> <input type="text" class="inp_txt wd110" title="" placeholder=""
							id="PHONE_NO03">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">E-mail</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="mailId">
						<span> @ </span> <input type="text" class="inp_txt wd110" title=""
							placeholder="" id="domain"> <select class="select">
							<option value="">직접입력</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">주소</th> 
				<td class="ta_l" colspan="3">
					<a href="javascript:fnDaumPostcode()" class="btn sm">주소등록</a>
					<span id="_address"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">상세주소</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" class="w_full" id="detailAddress" name="ADDR_DTIL_TX"/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">등록일</th>
				<td class="ta_l" colspan="3"></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">예약상태</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="APPO_STAT_CD">
							<option value="01">예약</option>
							<option value="02">예약확정</option>
							<option value="03">예약수정</option>
							<option value="04">취소</option>
						</select>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnInsertCRS()" class="btn_ty02"> 저장하기 </a> 
	<a href="/admin/rcm/crs/selectCRSList.do" class="btn_ty">취소하기</a>
</div>
<input type="hidden" name="MOBILE_PHONE_NO" value="" />
<input type="hidden" name="PHONE_NO" value="" />
<input type="hidden" name="POST_NO" id="zip" value="" />
<input type="hidden" name="ADDR_TX" id="address" value="" />
<input type="hidden" name="EMAIL_ID"/>
</form>