<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="/js/fbcms/user/ajax_cmm.js"></script>

<script type="text/javascript">

/*********************************************************
 * 초기화
 *********************************************************/
function fnInit() {
	// 예약일시 달력
	$("#APPO_DT").datepicker({
		dateFormat:'yy.mm.dd' 
	});
	
	// 생년월일 달력
	$("#BIRTH_DT").datepicker({
		dateFormat:'yy.mm.dd' 
	});

	// 진료과
	$("select[name=MEDI_SBJ_CD]").val('${reservationInfo.MEDI_SBJ_CD}').prop('selected',true);
	
	// 진료과 변경시
	$("select[name=MEDI_SBJ_CD]").change(function() {
		var mediCd = $('select[name="MEDI_SBJ_CD"]').val();
		
		var object = {
				  url: "/admin/rcm/ors/selectDRList.do"
				, data: {"MEDI_SBJ_CD" : mediCd}
				, fnSuccess: function(data){
					// 의사 리스트 selectbox 셋팅
					$('select[name="DR_ID"] option').remove();
					
					$(data).each(function(i, e) {
						const option = '<option value="' + e.dr_ID + '">' + e.dr_NM + '</option>';
						$('select[name="DR_ID"]').append(option);
					});

					// 예약일시 초기화
					$("#APPO_DT").val("");
					$("select[name=APPO_TIME]").val("").prop('selected',true);
				}
		}
		fnAjax(object);
	});
	
	// 의료진
	var mediCd = "${reservationInfo.MEDI_SBJ_CD}";
	var object = {
			  url: "/admin/rcm/ors/selectDRList.do"
			, data: {"MEDI_SBJ_CD" : mediCd}
			, fnSuccess: function(data){
				// 의료진 리스트 selectbox 셋팅
				$('select[name="DR_ID"] option').remove();
				$(data).each(function(i, e) {
					const option = '<option value="' + e.dr_ID + '">' + e.dr_NM + '</option>';
					$('select[name="DR_ID"]').append(option);
				});
				
				// 의료진 셋팅
				$("select[name=DR_ID]").val('${reservationInfo.DR_ID}').prop('selected',true);
			}
	}
	fnAjax(object);		// Ajax 수행
	
	// 의료진 변경시
	$("select[name=DR_ID]").change(function(){
		// 예약일시 초기화
		$("#APPO_DT").val("");
		$("select[name=APPO_TIME]").val("").prop('selected',true);
    });
	
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
}

/*********************************************************
 * 저장
 *********************************************************/
function fnUpdate(){
	// 필수입력 확인
	if($("select[name=MEDI_SBJ_CD]").val() == "") {
		alert("진료과를 입력해주세요.");
		return;
	}
	else if($("select[name=DR_ID]").val() == "") {
		alert("의료진을 입력해주세요.");
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
		document.updateForm.action = "<c:url value='/admin/rcm/ors/updateORS.do'/>";
		document.updateForm.MOBILE_PHONE_NO.value = document.getElementById('MOBILE_PHONE_NO01').value
											  +"-"+ document.getElementById('MOBILE_PHONE_NO02').value
											  +"-"+ document.getElementById('MOBILE_PHONE_NO03').value;
		document.updateForm.PHONE_NO.value = document.getElementById('PHONE_NO01').value
									   +"-"+ document.getElementById('PHONE_NO02').value
									   +"-"+ document.getElementById('PHONE_NO03').value;
		document.updateForm.submit();
	}
}

/*********************************************************
 * 삭제
 *********************************************************/
function fnDelete(){
	if(confirm("게시물을 삭제하시겠습니까? 삭제 후 복원은 불가능합니다.")) {
		alert("삭제되었습니다.")
		document.updateForm.action = "<c:url value='/admin/rcm/ors/deleteORS.do'/>";
		document.updateForm.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnUpdateCancel() {
	if(confirm("수정을 취소하시겠습니까?")) {
		window.location.href="/admin/rcm/ors/selectORSList.do";
	}
}

</script>

<h3 class="mid_tit mg_t50">외래예약 수정</h3>
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
				<th scope="row" class="ta_r"><em class="ootc">*</em>진료과</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="MEDI_SBJ_CD">
							<option value="">선택하세요</option>
							<c:forEach var="mediSbjCdList" items="${mediSbjCdList}" varStatus="status">
								<option value="${mediSbjCdList.CODE}">${mediSbjCdList.NAME}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>의료진</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="DR_ID">
							<option value="">선택하세요</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>예약자</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" class="wd110" name="APPO_PRSN_NM" value="<c:out value='${reservationInfo.APPO_PRSN_NM}'/>"/>
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
							<option value="">선택하세요</option>
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
						<input type="text" id="APPO_DT" value="<c:out value='${reservationInfo.APPO_DT}'/>" name="APPO_DT" class="inp_txt wd110 date_pick" title="" placeholder="">
					</div>
					<div class="select_wrap dis_inl">
						<select class="select" name="APPO_TIME">
							<option value="">선택하세요</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<input type="text" id="BIRTH_DT" name="BIRTH_DT" value="<c:out value='${reservationInfo.BIRTH_DT}'/>" class="inp_txt wd110 date_pick" title="" placeholder="">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">휴대폰</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="MOBILE_PHONE_NO01">
							<option value="">선택하세요</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</select> 
						<span> - </span> 
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="MOBILE_PHONE_NO02"> 
						<span> - </span> 
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="MOBILE_PHONE_NO03">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">전화번호</th>
				<td class="ta_l" colspan="3">
					<div class="input_wrap">
						<select class="select" id="PHONE_NO01">
							<option value="">선택하세요</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
						</select>
						<span> - </span>
						<input type="text" class="inp_txt wd110" title="" placeholder="" id="PHONE_NO02"> 
						<span> - </span> 
						<input	type="text" class="inp_txt wd110" title="" placeholder="" id="PHONE_NO03">
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
	<a href="javascript:fnUpdateCancel();" class="btn_ty"> 취소하기 </a>
</div>

<input type="hidden" name="APPO_NO" value="${reservationInfo.APPO_NO}"/>
<input type="hidden" name="USER_ID" value="${reservationInfo.USER_ID}"/>
<input type="hidden" name="MOBILE_PHONE_NO" value="${reservationInfo.MOBILE_PHONE_NO}"/>
<input type="hidden" name="PHONE_NO" value="${reservationInfo.PHONE_NO}"/>

</form>
