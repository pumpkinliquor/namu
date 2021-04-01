<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
	// 예약일시 달력
	$("#APPO_DT").datepicker({
		dateFormat:'yy.mm.dd' 
	});
	
	// 생년월일 달력
	$("#BIRTH_DT").datepicker({
		dateFormat:'yy.mm.dd' 
	});

	// 검진프로그램
	$("select[name=EXMN_PROG_CD]").val('${reservationInfo.EXMN_PROG_CD}').prop('selected',true);
	
	// 예약자관계
	$("select[name=APPO_RLT_CD]").val('${reservationInfo.APPO_RLT_CD}').prop('selected',true);
	
	// 성별
	$("select[name=GENDER_CD]").val('${reservationInfo.GENDER_CD}').prop('selected',true);
	
	// 예약시간
	$("select[name=APPO_TIME]").val('${reservationInfo.APPO_TIME}').prop('selected',true);
	
	// 등록일
	var FIRST_ADD_DT = '${reservationInfo.FIRST_ADD_DT}'.split('/');
	$("#FIRST_ADD_DT").html(FIRST_ADD_DT[0]);
	$("#FIRST_ADD_TIME").html(FIRST_ADD_DT[1]);
	
	// 예약상태
	$("select[name=APPO_STAT_CD]").val('${reservationInfo.APPO_STAT_CD}').prop('selected',true);
	
	// 휴대폰
	var PHONE_NO = '${reservationInfo.PHONE_NO}'.split('-');
	if(PHONE_NO.length == 3){
		$("select[id=PHONE_NO01]").val(PHONE_NO[0]).prop('selected',true);
		$("#PHONE_NO02").val(PHONE_NO[1]);
		$("#PHONE_NO03").val(PHONE_NO[2]);
	}
	
	// 전화번호
	var MOBILE_PHONE_NO = '${reservationInfo.MOBILE_PHONE_NO}'.split('-');
	if(MOBILE_PHONE_NO.length == 3){
		$("select[id=MOBILE_PHONE_NO01]").val(MOBILE_PHONE_NO[0]).prop('selected',true);
		$("#MOBILE_PHONE_NO02").val(MOBILE_PHONE_NO[1]);
		$("#MOBILE_PHONE_NO03").val(MOBILE_PHONE_NO[2]);
	}
	
	// 이메일
	var EMAIL_ID = "${reservationInfo.EMAIL_ID}".split("@");
	if(EMAIL_ID.length == 2) {
		$("#mailId").val(EMAIL_ID[0]);
		$("#domain").val(EMAIL_ID[1]);
	}
	
	// 이메일 간편선택 변경시
	$("#eMailAddr").change(function(){
		$("#domain").val($("#eMailAddr").val());
    });
	
	// 주소
	$("#_address").html("${reservationInfo.POST_NO} ${reservationInfo.ADDR_TX}");
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
			$("#_address").html($("#zip").val() + "  " + $("#address").val());
			
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		}
	}).open();
};

/*********************************************************
 * 저장
 *********************************************************/
function fnUpdate(){
	// 필수입력 확인
	if($("select[name=EXMN_PROG_CD]").val() == "") {
		alert("검진프로그램을 입력해주세요.");
		return;
	}
	else if($("input[name=APPO_PRSN_NM]").val() == "") {
		alert("예약자를 입력해주세요.");
		return;
	}
	else if($("select[name=GENDER_CD]").val() == "") {
		alert("성별을 입력해주세요.");
		return;
	}
	else if($("input[name=APPO_DT]").val() == "" || $("select[name=APPO_TIME]").val() == "") {
		alert("예약일시를 입력해주세요.");
		return;
	}
	else if($("input[name=BIRTH_DT]").val() == "") {
		alert("생년월일을 입력해주세요.");
		return;
	}
	
	if(confirm("수정하시겠습니까?")) {
		document.updateForm.action = "<c:url value='/admin/rcm/crs/updateCRS.do'/>";
		document.updateForm.MOBILE_PHONE_NO.value = document.getElementById('MOBILE_PHONE_NO01').value
											  +"-"+ document.getElementById('MOBILE_PHONE_NO02').value
											  +"-"+ document.getElementById('MOBILE_PHONE_NO03').value;
		document.updateForm.PHONE_NO.value = document.getElementById('PHONE_NO01').value
									   +"-"+ document.getElementById('PHONE_NO02').value
									   +"-"+ document.getElementById('PHONE_NO03').value;
		document.updateForm.EMAIL_ID.value = document.getElementById('mailId').value
		   							   +"@"+ document.getElementById('domain').value;
		document.updateForm.submit();
	}
}

/*********************************************************
 * 삭제
 *********************************************************/
function fnDelete(){
	if(confirm("게시물을 삭제하시겠습니까? 삭제 후 복원은 불가능합니다.")){
		alert("삭제되었습니다.")
		document.updateForm.action = "<c:url value='/admin/rcm/crs/deleteCRS.do'/>";
		document.updateForm.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnUpdateCancel() {
	if(confirm("수정을 취소하시겠습니까?")){
		window.location.href="/admin/rcm/crs/selectCRSList.do";
	}
}


</script>

<h3 class="mid_tit mg_t50">검진예약 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<form method="post" action="" name="updateForm">
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
							<c:forEach var="exmnProgCdList" items="${exmnProgCdList}" varStatus="status">
								<option value="${exmnProgCdList.CODE}">${exmnProgCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약자</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" class="wd110" name="APPO_PRSN_NM" value='<c:out value="${reservationInfo.APPO_PRSN_NM}"/>' />
					</div>
				</td>
				<th scope="row" class="ta_r"><em class="ootc">*</em>본인 외 예약</th>
				<td class="ta_l"><a href="javascript:void(0);"><c:out value="${reservationInfo.USER_NM}"/></a> (회원)
					<div class="select_wrap dis_inl mg_l20">
						<select class="select" name="APPO_RLT_CD">
							<option value="">선택하세요</option>
							<c:forEach var="appoRltCdList" items="${appoRltCdList}" varStatus="status">
								<option value="${appoRltCdList.CODE}">${appoRltCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>성별</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="GENDER_CD">
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
						<input type="text" id="APPO_DT" name="APPO_DT"
							value="<c:out value='${reservationInfo.APPO_DT }'/>"
							class="inp_txt wd110 date_pick" title="" placeholder="">
					</div>
					<div class="select_wrap dis_inl">
						<select class="select" name="APPO_TIME">
							<option value="">선택하세요</option>
							<option value="00:00">00:00</option>
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" id="BIRTH_DT" name="BIRTH_DT"
							value="<c:out value='${reservationInfo.BIRTH_DT}'/>"
							class="inp_txt wd110 date_pick" title="" placeholder="">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">휴대폰</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="MOBILE_PHONE_NO01">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">012</option>
							<option value="0130">0130</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> 
						<span> - </span> 
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="MOBILE_PHONE_NO02"> 
						<span>	- </span>
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="MOBILE_PHONE_NO03">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">전화번호</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="PHONE_NO01">
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
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="PHONE_NO02"> 
						<span> - </span> 
						<input	type="text" class="inp_txt wd110" title="" placeholder="" id="PHONE_NO03">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">E-mail</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="mailId" value="">
						<span> @ </span>
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="domain" value=""> 
						<select class="select" id="eMailAddr">
							<option value="">직접입력</option>
							<c:forEach var="emailCdList" items="${emailCdList}" varStatus="status">
								<option value="${emailCdList.CODE}">${emailCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">주소</th>
				<td class="ta_l" colspan="3">
					<a href="javascript:fnDaumPostcode();" class="btn sm">주소등록</a>
					<span id="_address"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">상세주소</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" class="w_full" name="ADDR_DTIL_TX" id="detailAddress"
							value="<c:out value='${reservationInfo.ADDR_DTIL_TX}'/>" />
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">등록일</th>
				<td class="ta_l" colspan="3">
					<span id="FIRST_ADD_DT"></span>
					<span class="mg_l20" id="FIRST_ADD_TIME"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">예약상태</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="APPO_STAT_CD">
							<c:forEach var="appoStatCdList" items="${appoStatCdList}" varStatus="status">
								<option value="${appoStatCdList.CODE}">${appoStatCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnDelete();" class="btn_ty"> 삭제하기 </a> 
	<a href="javascript:fnUpdate();" class="btn_ty02"> 저장하기 </a> 
	<a href="/admin/rcm/crs/selectCRSList.do" class="btn_ty"> 취소하기 </a>
</div>

<input type="hidden" name="APPO_NO" value="${reservationInfo.APPO_NO}"/>
<input type="hidden" name="USER_ID" value="${reservationInfo.USER_ID}"/>
<input type="hidden" name="MOBILE_PHONE_NO" value="${memberInfo.MOBILE_PHONE_NO}"/>
<input type="hidden" name="PHONE_NO" value="${reservationInfo.PHONE_NO}"/>
<input type="hidden" name="EMAIL_ID" value="${reservationInfo.EMAIL_ID}"/>
<input type="hidden" name="POST_NO" id="zip" value="${reservationInfo.POST_NO}"/>
<input type="hidden" name="ADDR_TX" id="address" value="${reservationInfo.ADDR_TX}"/>

</form>
