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
	// 사용여부
	var USE_YN ='${checkupProgramInfo.USE_YN}';
	if(USE_YN == 'Y') {
		$("input:radio[name='USE_YN']:input[value='Y']").trigger('click');
	} else {
		$("input:radio[name='USE_YN']:input[value='N']").trigger('click');
	}
}

/*********************************************************
 * 수정
 ******************************************************** */
function fnUpdateCPM() {
	// 필수입력 확인
	if($("input[name=DTIL_CD]").val() == "") {
		alert("코드를 입력해주세요.");
		return;
	}
	else if($("input[name=DTIL_CODE_NM]").val() == "") {
		alert("프로그램명을 입력해주세요.");
		return;
	}

	if(confirm("수정하시겠습니까?")) {
		document.updateForm.action= "<c:out value='/admin/rcm/cpm/updateCPM.do'/>";
		document.updateForm.submit();
	}
}

/*********************************************************
 * 삭제
 ******************************************************** */
function fnDeleteCPM() {
	if(confirm("삭제하시겠습니까? 삭제 후 복원은 불가능합니다.")) {
		alert("삭제되었습니다.")
		document.deleteForm.action= "<c:out value='/admin/rcm/cpm/deleteCPM.do'/>";
		document.deleteForm.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnUpdateCancel() {
	if(confirm("수정을 취소하시겠습니까?")) {
		window.location.href="/admin/rcm/cpm/selectCPMList.do";
	}
}

</script>

<h3 class="mid_tit mg_t50">검진프로그램관리</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<form method="post" action="" name="updateForm">
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 15%">
			<col span="1" style="width: *">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>코드</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" maxlength="40" class="inp_txt w_full" name="DTIL_CD" value="${checkupProgramInfo.DTIL_CD}">
						<input type="hidden" class="inp_txt w_full" name="DTIL_CD_CRT" value="${checkupProgramInfo.DTIL_CD}">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>프로그램명</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" maxlength="40" class="inp_txt w_full" name="DTIL_CODE_NM" value="${checkupProgramInfo.DTIL_CODE_NM}">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>사용여부</th>
				<td class="ta_l">
					<div class="input_wrap">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="USE_YN" id="chk02_1" class="ez-hide" value="Y">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk02_1">Y</label>
							</span> 
							<span> 
								<input type="radio" name="USE_YN" id="chk02_2" class="ez-hide" value="N"> 
								<label for="chk02_2">N</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnDeleteCPM();" class="btn_ty">삭제하기</a>
	<a href="javascript:fnUpdateCPM();" class="btn_ty02">저장하기</a>
	<a href="javascript:fnUpdateCancel();" class="btn_ty">취소하기</a>
</div>
</form>

<form method="post" action="" name="deleteForm">
	<input type="hidden" name="DTIL_CD" value="${checkupProgramInfo.DTIL_CD}"/>
</form>
