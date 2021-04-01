<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 다음 주소api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script type="text/javascript">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		$("#datepicker02").datepicker({
			dateFormat : 'yy.mm.dd'
		});
		
		$('#emailSelect').change(function() {
			if($('#emailSelect').val() == '직접입력') {
				$('#domain').val('');
				$('#domain').removeAttr('readonly');
			} else {
				$('#domain').attr('readonly', 'readonly');
				$('#domain').val($('#emailSelect').val());
			}
		});
	}
	/*********************************************************
	 * 등록
	 ******************************************************** */
	function fnMemberRegist() {

		if ($("input[name=MBER_ID]").val() == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if (document.memberInfoForm.mailId.value == "") {
			alert("이메일 앞부분을 입력해주세요.");
			return;
		} else if (document.memberInfoForm.domain.value == "") {
			alert("이메일 뒷부분을 입력해주세요.");
			return;
		} else if ($("select[name=SEXDSTN_CODE]").val() == "") {
			alert("성별을 입력해주세요.");
			return;
		} else if ($("input[name=BIRTH_DT]").val() == "") {
			alert("생년월일을 입력해주세요.");
			return;
		} else if (document.memberInfoForm.mbNumber01.value == "") {
			alert("핸드폰 번호 앞자리를 입력해주세요.");
			return;
		} else if (document.memberInfoForm.mbNumber02.value == "") {
			alert("핸드폰 번호 중간자리를 입력해주세요.");
			return;
		} else if (document.memberInfoForm.mbNumber03.value == "") {
			alert("핸드폰 번호 뒷자리를 입력해주세요.");
			return;
		} else if ($("input[name=ADRES]").val() == "") {
			alert("주소를 입력해주세요.");
			return;
		}

		if (confirm("등록하시겠습니까?")) {
			document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/registMBI.do'/>";
			document.memberInfoForm.MBTLNUM.value = document
					.getElementById('mbNumber01').value
					+ "-"
					+ document.getElementById('mbNumber02').value
					+ "-"
					+ document.getElementById('mbNumber03').value;
			
			document.memberInfoForm.MBER_EMAIL_ADRES.value = document
					.getElementById('mailId').value
					+ "@" + document.getElementById('domain').value;
			
			document.memberInfoForm.submit();
		} else {
			return;
		}
		// 필수 값 검증
	}

	/*********************************************************
	 * 취소하기
	 ******************************************************** */
	function fnCancel(USER_ID) {
		if (confirm("등록을 취소하시겠습니까?") == true) {
			document.memberInfoForm.MBER_ID.value = MBER_ID;
			document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/selectMBIList.do'/>";
			document.memberInfoForm.submit();
		} else {
			return false;
		}
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
	/*********************************************************
	 * 아이디 중복 검사
	 ******************************************************** */
	function fnIdChk() {
		var inputId = document.memberInfoForm.MBER_ID.value;

		var object = {
			url : "/admin/mbm/mbi/idCheck.do",
			data : {
				"userID" : inputId
			},
			fnSuccess : function(data) {
				if (data.integer > 0) {
					alert("이미 사용중인 아이디입니다.");
				} else {
					alert("사용 가능한 아이디입니다.");
				}

			}
		}
		fnAjax(object);
	}
</script>

<p class="te_ri_txt">
	<em class="ootc">*</em>필수입력 항목 입니다.
</p>
<form name="memberInfoForm"
	action="<c:out value="/admin/mbm/mbi/registMBI.do"/>" method="post">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width: 15%">
				<col span="1" style="width: 35%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: *">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이름</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="MBER_NM">
						</div>
					</td>
					<th scope="row" class="ta_r">상태</th>
					<td class="ta_l"></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>아이디</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_m" name="MBER_ID"> <a
								href="javascript:fnIdChk()" class="btn sm">중복확인</a>
						</div>
					</td>
					<th scope="row" class="ta_r">구분</th>
					<td class="ta_l">일반</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이메일</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_s" id="mailId"> <span
								class="pd_r05">@</span> <input type="text" class="inp_txt w_s"
								id="domain"> <select class="select" id="emailSelect">
								<option value="">직접입력</option>
								<option value="gmail.com">구글</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">다음</option>
								<option value="kakao.com">카카오</option>
								<option value="nate.com">네이트</option>
							</select>

						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">회원가입일</th>
					<td class="ta_l" colspan="3"></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>성별</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<select class="select" name="SEXDSTN_CODE">
								<option value="">선택</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" id="datepicker02" name="BIRTH_DT"
								class="inp_txt wd110 date_pick" title="" placeholder="">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>휴대전화</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<select class="select" id="mbNumber01">
								<option value="010">010</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
								<option value="0130">0130</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> <span> - </span> <input type="text" class="inp_txt wd110"
								title="" placeholder="" id="mbNumber02" maxlength="4"> <span> -
							</span> <input type="text" class="inp_txt wd110" title="" placeholder=""
								id="mbNumber03" maxlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">전화번호</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<select class="select" name="AREA_NO" id="Number01">
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
							<span> - </span>
							<input type="text" class="inp_txt wd110" name="MIDDLE_TELNO" title="" placeholder="" id="Number02" maxlength="4">
							<span> - </span>
							<input type="text" class="inp_txt wd110" name="END_TELNO" title="" placeholder="" id="Number03" maxlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>주소</th>
					<td class="ta_l" colspan="3"><a
						href="javascript:fnDaumPostcode()" class="btn sm">주소등록</a> <span
						id="_address"></span></td>

				</tr>
				<tr>
					<th scope="row" class="ta_r">상세주소</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="w_full" name="DETAIL_ADRES"
								id="detailAddress" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">이메일 수신여부</th>
					<td class="ta_l" colspan="3">
						<div class="chk_warp">
							<input type="checkbox" class="chk_ty" id="all01" value="Y"
								name="EMAIL_RECV_YN" checked> <label for="all01">수신</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" rowspan="3">계정 연동</th>
					<td class="ta_l" colspan="3"><img
						src="/images/fbcms/admin/ico/n.png" alt="네이버" style="width: 19px">
						네이버</td>
				</tr>
				<tr>
					<td class="ta_l" colspan="3"><img
						src="/images/fbcms/admin/ico/k.png" alt="카카오" style="width: 19px">
						카카오</td>
				</tr>
				<tr>
					<td class="ta_l" colspan="3"><img
						src="/images/fbcms/admin/ico/g.png" alt="구글" style="width: 19px">
						구글</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">마지막 로그인</th>
					<td class="ta_l" colspan="3"></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">비밀번호</th>
					<td class="ta_l" colspan="3"><span class="dc"> *신규등록 시
							비밀번호는 초기화 상태로 로그인 시 비밀번호 재설정 후 진행가능합니다. </span></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="javascript:fnMemberRegist()" class="btn_ty02"> 저장하기 </a> <a
			href="javascript:fnCancel('${memberInfo.MBER_ID }')" class="btn_ty">취소하기</a>
	</div>
	<input type="hidden" name="MBTLNUM"> 
	<input type="hidden" name="ADRES" id="address" /> 
	<input type="hidden" name="ZIP" id="zip" /> 
	<input type="hidden" name="MBER_EMAIL_ADRES" /> 
</form>