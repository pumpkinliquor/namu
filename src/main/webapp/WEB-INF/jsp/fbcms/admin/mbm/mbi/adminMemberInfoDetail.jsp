<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
	
	var FRIST_JOIN_DT = "${memberInfo.FRIST_JOIN_DT }";
	var FRIST_JOINtimestamp = FRIST_JOIN_DT.split("/");
	$("#FRIST_JOIN_DT").html(FRIST_JOINtimestamp[0]);
	$("#FRIST_JOIN_TM").html(FRIST_JOINtimestamp[1]);
	
	var LAST_LOGIN_DT = "${memberInfo.LAST_LOGIN_DT }";
	var LAST_LOGINtimestamp = LAST_LOGIN_DT.split("/");
	$("#LAST_LOGIN_DT").html(LAST_LOGINtimestamp[0]);
	$("#LAST_LOGIN_TM").html(LAST_LOGINtimestamp[1]);
}
/*********************************************************
 * 비밀번호 초기화
 ******************************************************** */
function fnResetPasswd(MBER_ID) {
	if(confirm("비밀번호를 초기화 시키겠습니까?")==true) {
		var rand = Math.floor(Math.random() * 100000000);
		alert("비밀번호가 " +rand+ "로 초기화 되었습니다");
		document.resetForm.action = "<c:out value='/admin/mbm/mbi/resetPw.do'/>";
		document.resetForm.MBER_ID.value = MBER_ID;
		document.resetForm.PASSWORD.value = rand;
		document.resetForm.PW_INIT_YN.value = "Y";
		document.resetForm.submit();
	} else {
		return false;
	}
}


/*********************************************************
 * 수정하기
 ******************************************************** */
function fnUpdateMember(MBER_ID) {
	document.detailForm.action = "<c:out value='/admin/mbm/mbi/updateMBIView.do'/>";
	document.detailForm.MBER_ID.value = MBER_ID;
	document.detailForm.submit();
}
/*********************************************************
 * 삭제하기
 ******************************************************** */
 function fnDeleteMember(MBER_ID) {
	if(confirm("탈퇴처리 하시겠습니까? 탈퇴처리 시 모든 회원정보는 삭제됩니다.")==true) {
		alert("탈퇴처리되었습니다.");
		document.detailForm.action = "<c:out value='/admin/mbm/mbi/deleteMBI.do'/>";
		document.detailForm.MBER_ID.value = MBER_ID;
		document.detailForm.submit();
	} else {
		return false;
	}
} 
/*********************************************************
 * 목록으로
 ******************************************************** */
function fnListMember() {
	document.detailForm.action = "<c:out value='/admin/mbm/mbi/selectMBIList.do'/>";
	document.detailForm.MBER_ID.value = "";
	document.detailForm.MBER_EMAIL_ADRES.value = "";
	document.detailForm.submit();
}
	
	
</script>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width:15%">
			<col span="1" style="width:35%">
			<col span="1" style="width:15%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>이름</th>
				<td class="ta_l"><c:out value="${memberInfo.MBER_NM }"/></td>
				<th scope="row" class="ta_r">상태</th>
				<td class="ta_l">
					<c:choose>
						<c:when test="${memberInfo.STAT_CD == '01' }">
							정상
						</c:when>
						<c:when test="${memberInfo.STAT_CD == '02' }">
							휴면
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>아이디</th>
				<td class="ta_l"><c:out value="${memberInfo.MBER_ID }"/></td>
				<th scope="row" class="ta_r">구분</th>
				<td class="ta_l">
					<c:choose>
						<c:when test="${memberInfo.GUBN_CD == '01' }">
							일반회원
						</c:when>
						<c:when test="${memberInfo.GUBN_CD == '02' }">
							비스타회원
						</c:when>
						<c:when test="${memberInfo.GUBN_CD == '03' }">
							뷰회원
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>이메일</th>
				<td class="ta_l" colspan="3"><c:out value="${memberInfo.MBER_EMAIL_ADRES }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">회원가입일</th>
				<td class="ta_l" colspan="3">
					<span id="FRIST_JOIN_DT"></span> <span class="pd_l10" id="FRIST_JOIN_TM"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>성별</th>
				<td class="ta_l" colspan="3">
					<c:choose>
						<c:when test="${memberInfo.SEXDSTN_CODE == 'F' }">
							여성
						</c:when>
						<c:when test="${memberInfo.SEXDSTN_CODE == 'M' }">
							남성
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>생년월일</th>
				<td class="ta_l" colspan="3"><c:out value="${memberInfo.BIRTH_DT }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>휴대전화</th>
				<td class="ta_l" colspan="3"><c:out value="${memberInfo.MBTLNUM }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">전화번호</th>
				<td class="ta_l" colspan="3">
					<c:out value="${memberInfo.AREA_NO }"/>
					<span>-</span>
					<c:out value="${memberInfo.MIDDLE_TELNO }"/>
					<span>-</span>
					<c:out value="${memberInfo.END_TELNO }"/>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>주소</th>
				<td class="ta_l" colspan="3"><c:out value="${memberInfo.ZIP } ${memberInfo.ADRES }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">상세주소</th>
				<td class="ta_l" colspan="3"><c:out value="${memberInfo.DETAIL_ADRES }"/></td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">이메일 수신여부</th>
				<td class="ta_l" colspan="3">
					<c:choose>
						<c:when test="${memberInfo.EMAIL_RECV_YN == 'Y' }">
							수신
						</c:when>
						<c:when test="${memberInfo.EMAIL_RECV_YN == 'N' }">
							거부
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r" rowspan="3">계정 연동</th>
				<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/n.png" alt="네이버" style="width:19px"> 네이버 
					<c:if test="${memberInfo.naver == 'Y' }">
						연동중
					</c:if>
					<c:if test="${memberInfo.naver ne 'Y' }">
						미연동
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/k.png" alt="카카오" style="width:19px"> 카카오 
					<c:if test="${memberInfo.kakao == 'Y' }">
						연동중
					</c:if>
					<c:if test="${memberInfo.kakao ne 'Y' }">
						미연동
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="ta_l" colspan="3"><img src="/images/fbcms/admin/ico/g.png" alt="구글" style="width:19px"> 구글 
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
				<td class="ta_l" colspan="3">
					<span id="LAST_LOGIN_DT"></span> <span class="pd_l10" id="LAST_LOGIN_TM"></span>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">비밀번호</th>
				<td class="ta_l" colspan="3">
					<a href="javascript:fnResetPasswd('${membersVO.MBER_ID }')" class="btn sm">초기화</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="#none" onclick="fnDeleteMember('${membersVO.MBER_ID}')" class="btn_ty">탈퇴처리</a>
	<a href="javascript:fnUpdateMember('${membersVO.MBER_ID }')" class="btn_ty02"> 수정하기 </a>
	<a href="javascript:fnListMember()" class="btn_ty"> 목록으로</a>
</div>

<form method="post" action="" name="detailForm">
		<input type="hidden" name="MBER_ID" value="${memberInfo.MBER_ID }">
		<input type="hidden" name="MBTLNUM" value="${memberInfo.MBTLNUM }"/>
		<input type="hidden" name="ADRES" id="address" value="${memberInfo.ADRES }"/>
		<input type="hidden" name="ZIP" id="zip" value="${memberInfo.ZIP }"/>
		<input type="hidden" name="EMAIL_RECV_YN" value="${memberInfo.EMAIL_RECV_YN }"/>
		<input type="hidden" name="MBER_EMAIL_ADRES" value="${memberInfo.MBER_EMAIL_ADRES }"/>
		<input type="hidden" name="AREA_NO" value="${memberInfo.AREA_NO }"/>
		<input type="hidden" name="MIDDLE_TELNO" value="${memberInfo.MIDDLE_TELNO }"/>
		<input type="hidden" name="END_TELNO" value="${memberInfo.END_TELNO }"/>
		<input type="hidden" name="PASSWORD" id="PASSWORD"/>
		<input type="hidden" name="PW_INIT_YN"/>
</form>

<form method="post" action="" name="resetForm">
		<input type="hidden" name="MBER_ID" value="${memberInfo.MBER_ID }">
		<input type="hidden" name="PASSWORD" id="PASSWORD"/>
		<input type="hidden" name="PW_INIT_YN"/>
</form>
