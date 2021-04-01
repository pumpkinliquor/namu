<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

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
}

/*********************************************************
 * 등록
 ******************************************************** */
function fnInsertORS() {
	document.insertForm.action = "<c:url value='/admin/rcm/ors/insertORS.do'/>";
	document.insertForm.MOBILE_PHONE_NO.value = document.getElementById('MOBILE_PHONE_NO01').value
										  +"-"+ document.getElementById('MOBILE_PHONE_NO02').value
										  +"-"+ document.getElementById('MOBILE_PHONE_NO03').value;
	document.insertForm.PHONE_NO.value = document.getElementById('PHONE_NO01').value
								   +"-"+ document.getElementById('PHONE_NO02').value
								   +"-"+ document.getElementById('PHONE_NO03').value;
	document.insertForm.submit();
}

</script>

<h3 class="mid_tit mg_t50">외래예약 등록</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<form action="" method="post" name="insertForm">
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
							<option value="AA00011">민영일</option>
							<option value="AA00291">홍성수</option>
							<option value="AA01271">노선희</option>
							<option value="AA00281">최원범</option>
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
					</div></td>
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
				<td class="ta_l" colspan="3"><span id="FIRST_ADD_DT"></span> <span class="mg_l20" id="FIRST_ADD_TIME"></span></td>
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
	<a href="javascript:fnInsertORS()" class="btn_ty02"> 저장하기 </a>
	<a href="/admin/rcm/ors/selectORSList.do" class="btn_ty"> 취소하기 </a>
</div>

<input type="hidden" name="MOBILE_PHONE_NO" value="" />
<input type="hidden" name="PHONE_NO" value="" />

</form>
