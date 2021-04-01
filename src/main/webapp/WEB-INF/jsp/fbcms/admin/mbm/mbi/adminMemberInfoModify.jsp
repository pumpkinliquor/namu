<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 다음 주소api -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
				$("#datepicker02").datepicker({
		dateFormat : 'yy.mm.dd'
	});

	var FRIST_JOIN_DT = "${memberInfo.FRIST_JOIN_DT }";
	var FRIST_JOINtimestamp = FRIST_JOIN_DT.split("/");
	$("#FRIST_JOIN_DT").html(FRIST_JOINtimestamp[0]);
	$("#FRIST_JOIN_TM").html(FRIST_JOINtimestamp[1]);
	
	var LAST_LOGIN_DT = "${memberInfo.LAST_LOGIN_DT }";
	var LAST_LOGINtimestamp = LAST_LOGIN_DT.split("/");
	$("#LAST_LOGIN_DT").html(LAST_LOGINtimestamp[0]);
	$("#LAST_LOGIN_TM").html(LAST_LOGINtimestamp[1]);

	$("#_address").html("${memberInfo.ZIP } ${memberInfo.ADRES}");

	$("select[name=SEXDSTN_CODE]").val('${memberInfo.SEXDSTN_CODE}').prop("selected", true);

	var EMAIL_RECV_YN = "${memberInfo.EMAIL_RECV_YN}";
	if (EMAIL_RECV_YN === "Y") {
		$(".ez-checkbox").addClass("ez-checked");
		$("input:checkbox[id=EMAIL_RECV_YN]").prop("checked", true);
	}
	$("#EMAIL_RECV_YN").on('click',
		function() {
			if ($("input:checkbox[id='EMAIL_RECV_YN']").is(":checked") == true) {
					$("input[name=EMAIL_RECV_YN]").val('Y');
				} else {
					$("input[name=EMAIL_RECV_YN]").val('N');
				}
		});

	var MBER_EMAIL_ADRES = "${memberInfo.MBER_EMAIL_ADRES}";
	MBER_EMAIL_ADRES = MBER_EMAIL_ADRES.split("@");
	$("#mailId").val(MBER_EMAIL_ADRES[0]);
	$("#domain").val(MBER_EMAIL_ADRES[1]);
	
	var MBTLNUM = "${memberInfo.MBTLNUM}";
	MBTLNUM = MBTLNUM.split("-");
	$("select[id=mbNumber01]").val(MBTLNUM[0]).prop("selected",true);
	$("#mbNumber02").val(MBTLNUM[1]);
	$("#mbNumber03").val(MBTLNUM[2]);

	var PHONE_NO = "${memberInfo.AREA_NO}";
	$("select[id=Number01]").val(PHONE_NO).prop("selected", true);
}

/*********************************************************
 * 수정
 ******************************************************** */
function fnMemberModify() {

	// 유호성 검사
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

	document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/updateMBI.do'/>";
	document.memberInfoForm.MBTLNUM.value = document.getElementById('mbNumber01').value
											+ "-" + document.getElementById('mbNumber02').value
											+ "-" + document.getElementById('mbNumber03').value;
	document.memberInfoForm.MBER_EMAIL_ADRES.value = document.getElementById('mailId').value
									 + "@" + document.getElementById('domain').value;

	// 필수 값 검증
	document.memberInfoForm.submit();
}
	
/*********************************************************
 * 취소하기
******************************************************** */
function fnCancel(MBER_ID) {
	if (confirm("수정을 취소하시겠습니까?") == true) {
		document.memberInfoForm.MBER_ID.value = MBER_ID;
		document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/selectMBIDetail.do'/>";
		document.memberInfoForm.submit();
	} else {
		return false;
	}
}
/*********************************************************
 * 비밀번호 초기화
 ******************************************************** */
function fnResetPasswd(MBER_ID) {
	if (confirm("비밀번호를 초기화 시키겠습니까?") == true) {
		
		var rand = Math.floor(Math.random() * 100000000);
		alert("비밀번호가 " + rand + "로 초기화 되었습니다");
		
		document.memberInfoForm.action = "<c:out value='/admin/mbm/mbi/updateMBI.do'/>";
		document.memberInfoForm.MBER_ID.value = MBER_ID;
		document.memberInfoForm.PASSWORD.value = rand;
		document.memberInfoForm.PW_INIT_YN.value = "Y";
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
			  url:"/admin/mbm/mbi/idCheck.do"
			, data: {"userID" : inputId}
			, fnSuccess: function(data){
				if(data.integer > 0) {
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
<form name="memberInfoForm" action="" method="post">
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
					<td class="ta_l">${memberInfo.MBER_NM }</td>
					<th scope="row" class="ta_r">상태</th>
					<td class="ta_l"><c:choose>
							<c:when test="${memberInfo.STAT_CD == '02' }">휴면</c:when>
							<c:when test="${memberInfo.STAT_CD == '01' }">정상</c:when>
							<c:otherwise>공백</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>아이디</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_m" name="MBER_ID"
								value="<c:out value='${memberInfo.MBER_ID }'/>"> <a
								href="javascript:fnIdChk()" class="btn sm">중복확인</a>

						</div>
					</td>
					<th scope="row" class="ta_r">구분</th>
					<td class="ta_l"><c:choose>
							<c:when test="${memberInfo.GUBN_CD == '01' }">일반회원</c:when>
							<c:when test="${memberInfo.GUBN_CD == '02' }">비스타회원</c:when>
							<c:when test="${memberInfo.GUBN_CD == '03' }">뷰회원</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이메일</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_s" id="mailId"> <span
								class="pd_r05">@</span> <input type="text" class="inp_txt w_s"
								id="domain"> <select class="select">
								<option value="">직접입력</option>
							</select>
						</div>

					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">회원가입일</th>
					<td class="ta_l" colspan="3"><span id="FRIST_JOIN_DT"></span>
						<span class="pd_l10" id="FRIST_JOIN_TM"></span></td>
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
							<input type="text" name="BIRTH_DT" id="datepicker02"
								value="<c:out value="${memberInfo.BIRTH_DT }"/>"
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
							</select> <span> - </span> <input type="text" class="inp_txt wd110"
								title="" placeholder="" id="mbNumber02"> <span> -
							</span> <input type="text" class="inp_txt wd110" title="" placeholder=""
								id="mbNumber03">
						</div>

					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">전화번호</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<select class="select" id="Number01">
								<option value="02">02</option>
							</select> <span> - </span> <input type="text" name="middleTelno"
								class="inp_txt wd110" title="" placeholder="" id="Number02">
							<span> - </span> <input type="text" name="endTelno"
								class="inp_txt wd110" title="" placeholder="" id="Number03">
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
								id="detailAddress"
								value="<c:out value='${memberInfo.DETAIL_ADRES }'/>" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">이메일 수신여부</th>
					<td class="ta_l" colspan="3">
						<div class="chk_warp">
							<input type="checkbox" class="chk_ty" id="EMAIL_RECV_YN">
							<label for="EMAIL_RECV_YN">수신</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" rowspan="3">계정 연동</th>
					<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/n.png" alt="네이버" style="width: 19px">네이버 
						<c:if test="${memberInfo.naver == 'Y' }">
							연동중
						</c:if>
						<c:if test="${memberInfo.naver ne 'Y' }">
							미연동
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/k.png" alt="카카오" style="width: 19px">카카오 
						<c:if test="${memberInfo.kakao == 'Y' }">
							연동중
						</c:if>
						<c:if test="${memberInfo.kakao ne 'Y' }">
							미연동
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/g.png" alt="구글" style="width: 19px">구글 
						<c:if test="${memberInfo.google == 'Y' }">
							연동중
						</c:if>
						<c:if test="${memberInfo.google ne 'Y' }">
							미연동
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">마지막 로그인</th>
					<td class="ta_l" colspan="3"><span id="LAST_LOGIN_DT"></span>
						<span class="pd_l10" id="LAST_LOGIN_TM"></span></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">비밀번호</th>
					<td class="ta_l" colspan="3"><a
						href="javascript:fnResetPasswd('${memberInfo.MBER_ID }')"
						class="btn sm">초기화</a></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="javascript:fnMemberModify()" class="btn_ty02"> 저장하기 </a> <a
			href="javascript:fnCancel('${memberInfo.MBER_ID }')" class="btn_ty">
			취소하기</a>
	</div>
				<input type="hidden" name="MBTLNUM" value="${memberInfo.MBTLNUM }"/>
				<input type="hidden" name="ADRES" id="address" value="${memberInfo.ADRES }"/>
				<input type="hidden" name="ZIP" id="zip" value="${memberInfo.ZIP }"/>
				<input type="hidden" name="EMAIL_RECV_YN" value="${memberInfo.EMAIL_RECV_YN }"/>
				<input type="hidden" name="MBER_EMAIL_ADRES" value="${memberInfo.MBER_EMAIL_ADRES }"/>
				<input type="hidden" name="AREA_NO" value="${memberInfo.AREA_NO }"/>
				<input type="hidden" name="MIDDLE_TELNO" id="Number02" value="${memberInfo.MIDDLE_TELNO }"/>
				<input type="hidden" name="END_TELNO" id="Number03" value="${memberInfo.END_TELNO }"/>
				<input type="hidden" name="LAST_LOGIN_DT" value="${memberInfo.LAST_LOGIN_DT }">
				<input type="hidden" name="PASSWORD" /> 
				<input type="hidden" name="PW_INIT_YN" />
</form>
