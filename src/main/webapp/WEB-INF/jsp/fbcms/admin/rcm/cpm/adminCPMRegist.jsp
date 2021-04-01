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
 *********************************************************/
function fnInit() {}

/*********************************************************
 * 등록
 *********************************************************/
function fnInsertCPM() {
	// 필수입력 확인
	if($("input[name=DTIL_CD]").val() == "") {
		alert("코드를 입력해주세요.");
		return;
	}
	else if($("input[name=DTIL_CODE_NM]").val() == "") {
		alert("프로그램명을 입력해주세요.");
		return;
	}

	if(confirm("등록하시겠습니까?")) {
		document.insertForm.action="<c:url value='/admin/rcm/cpm/insertCPM.do'/>";
		document.insertForm.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnInsertCancel() {
	if(confirm("등록을 취소하시겠습니까?")) {
		window.location.href="/admin/rcm/cpm/selectCPMList.do";
	}
}

</script>

<h3 class="mid_tit mg_t50">검진프로그램관리</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<form action="" method="post" name="insertForm">
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
						<input type="text" maxlength="40" class="inp_txt w_full" name="DTIL_CD">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>프로그램명</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" maxlength="40" class="inp_txt w_full" name="DTIL_CODE_NM">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>사용여부</th>
				<td class="ta_l">
					<div class="input_wrap">
						<span class="ds_raido"> <span> 
						<input type="radio" id="chk02_1" checked="checked" class="ez-hide" name="USE_YN" value="Y">
							<!-- id 변경시 label for 값 같이 변경 --> 
							<label for="chk02_1">Y</label>
						</span> 
						<span> 
						<input type="radio" id="chk02_2" class="ez-hide" name="USE_YN" value="N">
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
	<a href="javascript:fnInsertCPM();" class="btn_ty02">저장하기</a>
	<a href="javascript:fnInsertCancel();" class="btn_ty">취소하기</a>
</div>

</form>