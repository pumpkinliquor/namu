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
	
}

/*********************************************************
 * 진료시간표 수정
 ******************************************************** */
function fnUpdateTMM(MEDI_SBJ_CD) {
	document.updateForm.action="/admin/hpm/drm/updateTMMView.do";
	document.updateForm.MEDI_SBJ_CD.value = MEDI_SBJ_CD;
	document.updateForm.MNG_CD.value = MEDI_SBJ_CD;
	document.updateForm.submit();
}

</script>


<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="">
			<col style="width: 25%">
			<col style="width: 25%">
		</colgroup>
		<thead>
			<tr>
				<th>진료과목</th>
				<th>최종수정일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${subjectList}" var="subjectInfo">
				<tr>
					<td>${subjectInfo.MNG_NM}</td>
					<td>${subjectInfo.REG_DT}</td>
					<td><a href="javascript:fnUpdateTMM('${subjectInfo.MNG_CD}')" class="btn sm">관리하기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<form action="" method="post" name="updateForm">
	<input type="hidden" name="MEDI_SBJ_CD" value="">
	<input type="hidden" name="MNG_CD" value="">
</form>