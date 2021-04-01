<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>
<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
	var REG_DT = '${doctorTimeTable.LAST_MOD_DT}'.split('/');
	if(REG_DT.length == 2){
		$("#REG_DT").html(REG_DT[0]);
		$("#REG_TIME").html(REG_DT[1]);
	}else if(REG_DT.length == 1){
		$("#REG_DT").html(REG_DT[0]);
	}
	$("input[type=checkbox]").each(function(e) {
		var inputBIGO = $(this).prop("name").slice(0,-8)+"_BIGO";	
		if($(this).is(":checked")){
			$("input[name="+inputBIGO+"]").prop("disabled",false);
			$("input[name="+inputBIGO+"]").removeClass("graybg btn-disabled");
		}else{
			$("input[name="+inputBIGO+"]").prop("disabled",true);
			$("input[name="+inputBIGO+"]").addClass("graybg btn-disabled");
		}
	});
	fnEventBind();
}
/*********************************************************
 * 이벤트 바인드
 ******************************************************** */
 function fnEventBind(){
	$("input[type=checkbox]").on("click", function(e){
		var inputBIGO = $(this).prop("name").slice(0,-8)+"_BIGO";	
		if($(this).is(":checked")){
			$("input[name="+inputBIGO+"]").prop("disabled",false);
			$("input[name="+inputBIGO+"]").removeClass("graybg btn-disabled");
		}else{
			$("input[name="+inputBIGO+"]").prop("disabled",true);
			$("input[name="+inputBIGO+"]").addClass("graybg btn-disabled");
		}
	});
}
 /*********************************************************
  * 진료 시간표 저장
  ******************************************************** */
function fnUpdateTimeTable() {
	if(confirm("저장 하시겠습니까?")){
		document.timetableForm.action = '/admin/hpm/drm/updateTMM.do';
		document.timetableForm.submit();
	}
}
/*********************************************************
 * 취소하기
 ******************************************************** */
function fnCancelTimeTable() {
	if(confirm("수정을 취소 하시겠습니까?")){
		window.location.href='/admin/hpm/drm/selectTMMList.do';
	}
}
</script>

<h3 class="mid_tit mg_t50">진료시간표 관리</h3>

<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 15%">
			<col span="1" style="width: *">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">진료과목</th>
				<td class="ta_l">${MEDI_SBJ_CD}</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">최종수정일</th>
				<td class="ta_l"><span id="REG_DT"></span><span class="mg_l20" id="REG_TIME"></span></td>
			</tr>
		</tbody>
	</table>
</div>
<form method="post" name="timetableForm" action="">
	<input type="hidden" name="MNG_CD" value="${MNG_CD }"/>
	<input type="hidden" name="TR_CNT" value="${fn:length(doctorList)}">
	<h4 class="mg_t50">오전</h4>
	<div class="board_ty mg_t10">
		<table>
			<colgroup>
				<col span="1" style="width: 15%">
				<col span="1" style="width: 7%">
				<col span="1" style="width: 35%">
				<col span="1" style="width: 7%">
				<col span="1" style="width: *">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">오전 진료시간</th>
					<td class="ta_l" colspan="4">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="AM_BIGO" value="${doctorTimeTable.AM_CT}">
						</div>
					</td>
				</tr>
				<c:forEach items="${ doctorList}" var="doctorInfo" varStatus="status">
					<tr>
						<th scope="row" class="ta_r" rowspan="3">${doctorInfo.DR_NM }</th>
						<input type="hidden" name="seq${status.index }DR_ID" value="${doctorInfo.DR_ID }"/>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_MON ne 'Y' }">
										<input type="checkbox" id="chk02_1" name="seq${status.index }AM_DAY0_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_MON eq 'Y' }">
										<input type="checkbox" id="chk02_1" name="seq${status.index }AM_DAY0_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_1">월</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY0" value="MON">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" class="inp_txt w_full graybg btn-disabled" maxlength="50" name="seq${status.index }AM_DAY0_BIGO" value="${drTimeTableList[status.index].AM_MON_BIGO }" disabled="disabled">
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_THU ne 'Y' }">
										<input type="checkbox" id="chk02_4" name="seq${status.index }AM_DAY3_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_THU eq 'Y' }">
										<input type="checkbox" id="chk02_4" name="seq${status.index }AM_DAY3_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_4">목</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY3" value="THU">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" name="seq${status.index }AM_DAY3_BIGO" value="${drTimeTableList[status.index].AM_THU_BIGO }" disabled="disabled">
							</div>
						</td>
					</tr>
					<tr>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_TUE ne 'Y' }">
										<input type="checkbox" id="chk02_2" name="seq${status.index }AM_DAY1_POSB_YN"  class="chk_ty ez-hide " value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_TUE eq 'Y' }">
										<input type="checkbox" id="chk02_2" name="seq${status.index }AM_DAY1_POSB_YN"  class="chk_ty ez-hide " value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_2">화</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY1" value="TUE">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].AM_TUE_BIGO }" name="seq${status.index }AM_DAY1_BIGO" disabled>
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_FRI ne 'Y' }">
										<input type="checkbox" id="chk02_5" name="seq${status.index }AM_DAY4_POSB_YN" class="chk_ty ez-hide " value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_FRI eq 'Y' }">
										<input type="checkbox" id="chk02_5" name="seq${status.index }AM_DAY4_POSB_YN" class="chk_ty ez-hide " value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_5">금</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY4" value="FRI">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].AM_FRI_BIGO }" name="seq${status.index }AM_DAY4_BIGO" disabled>
							</div>
						</td>
					</tr>
					<tr>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_WED ne 'Y' }">
										<input type="checkbox" id="chk02_3" name="seq${status.index }AM_DAY2_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_WED eq 'Y' }">
										<input type="checkbox" id="chk02_3" name="seq${status.index }AM_DAY2_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_3">수</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY2" value="WED">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].AM_WED_BIGO }" name="seq${status.index }AM_DAY2_BIGO" disabled>
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].AM_SAT ne 'Y' }">
										<input type="checkbox" id="chk02_6" name="seq${status.index }AM_DAY5_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].AM_SAT eq 'Y' }">
										<input type="checkbox" id="chk02_6" name="seq${status.index }AM_DAY5_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_6">토</label>
								</span>
								<input type="hidden" name="seq${status.index }AM_DAY5" value="SAT">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].AM_SAT_BIGO }" name="seq${status.index }AM_DAY5_BIGO" disabled>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<h4 class="mg_t50">오후</h4>
	<div class="board_ty mg_t10">
		<table>
			<colgroup>
				<col span="1" style="width: 15%">
				<col span="1" style="width: 7%">
				<col span="1" style="width: 35%">
				<col span="1" style="width: 7%">
				<col span="1" style="width: *">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">오후 진료시간</th>
					<td class="ta_l" colspan="4">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="PM_BIGO" value="${doctorTimeTable.PM_CT}">
						</div>
					</td>
				</tr>
				<c:forEach items="${ doctorList}" var="doctorInfo" varStatus="status">	
					<tr>
						<th scope="row" class="ta_r" rowspan="3">${doctorInfo.DR_NM }</th>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].PM_MON ne 'Y' }">
										<input type="checkbox" id="chk02_1" name="seq${status.index }PM_DAY0_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_MON eq 'Y' }">
										<input type="checkbox" id="chk02_1" name="seq${status.index }PM_DAY0_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_1">월</label>
								</span>
								<input type="hidden" name="seq${status.index }PM_DAY0" value="MON">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_MON_BIGO }" name="seq${status.index }PM_DAY0_BIGO" disabled>
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].PM_THU ne 'Y' }">
										<input type="checkbox" id="chk02_4" name="seq${status.index }PM_DAY3_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_THU eq 'Y' }">
										<input type="checkbox" id="chk02_4" name="seq${status.index }PM_DAY3_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_4">목</label>
								</span>
								<input type="hidden" name="seq${status.index }PM_DAY3" value="THU">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_THU_BIGO }" name="seq${status.index }PM_DAY3_BIGO" disabled>
							</div>
						</td>
					</tr>
					<tr>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].PM_TUE ne 'Y' }">
										<input type="checkbox" id="chk02_2" name="seq${status.index }PM_DAY1_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_TUE eq 'Y' }">
										<input type="checkbox" id="chk02_2" name="seq${status.index }PM_DAY1_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_2">화</label>
								</span>
								<input type="hidden" name="seq${status.index }PM_DAY1" value="TUE">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_TUE_BIGO }" name="seq${status.index }PM_DAY1_BIGO"  disabled>
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox">
									<c:if test="${drTimeTableList[status.index].PM_FRI ne 'Y' }">
										<input type="checkbox" id="chk02_5" name="seq${status.index }PM_DAY4_POSB_YN" class="chk_ty ez-hide " value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_FRI eq 'Y' }">
										<input type="checkbox" id="chk02_5" name="seq${status.index }PM_DAY4_POSB_YN" class="chk_ty ez-hide " value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_5">금</label>
								</span>
								<input type="hidden" name="seq${status.index }PM_DAY4" value="FRI">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_FRI_BIGO }" name="seq${status.index }PM_DAY4_BIGO" disabled>
							</div>
						</td>
					</tr>
					<tr>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].PM_WED ne 'Y' }">
										<input type="checkbox" id="chk02_3" name="seq${status.index }PM_DAY2_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_WED eq 'Y' }">
										<input type="checkbox" id="chk02_3" name="seq${status.index }PM_DAY2_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_3">수</label>
									<input type="hidden" name="seq${status.index }PM_DAY2" value="WED">
								</span>
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_WED_BIGO }" name="seq${status.index }PM_DAY2_BIGO" disabled> 
							</div>
						</td>
						<td class="ta_l">
							<div class="input_wrap dis_inl mg_l20">
								<span class="ez-checkbox"> 
									<c:if test="${drTimeTableList[status.index].PM_SAT ne 'Y' }">
										<input type="checkbox" id="chk02_6" name="seq${status.index }PM_DAY5_POSB_YN" class="chk_ty ez-hide" value="Y">
									</c:if>
									<c:if test="${drTimeTableList[status.index].PM_SAT eq 'Y' }">
										<input type="checkbox" id="chk02_6" name="seq${status.index }PM_DAY5_POSB_YN" class="chk_ty ez-hide" value="Y" checked="checked">
									</c:if>
									<!-- id 변경시 label for 값 같이 변경 --> 
									<label for="chk02_6">토</label>
								</span>
								<input type="hidden" name="seq${status.index }PM_DAY5" value="SAT">
							</div>
						</td>
						<td>
							<div class="input_wrap">
								<input type="text" placeholder="입력한 텍스트가 노출됩니다" maxlength="50" class="inp_txt w_full graybg btn-disabled" value="${drTimeTableList[status.index].PM_SAT_BIGO }" name="seq${status.index }PM_DAY5_BIGO" disabled>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<div class="btns">
	<a href="javascript:fnUpdateTimeTable();" class="btn_ty02"> 저장하기 </a> 
	<a href="javascript:fnCancelTimeTable();" class="btn_ty"> 취소하기 </a>
</div>
</form>