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
	 * 관리하기
	 ******************************************************** */
	function fnCenterManage(MNG_CD,MNG_NM) {
		document.updateForm.action = "/admin/hpm/ctm/updateCTMView.do" ;
		document.updateForm.MNG_CD.value = MNG_CD ;
		document.updateForm.MNG_NM.value = MNG_NM ;
		document.updateForm.submit();
	}
</script>
<div class="board_ty ds02 mg_t30">
	<table>
		<colgroup>
			<col style="">
			<col style="width: 20%">
			<col style="width: 20%">
		</colgroup>
		<thead>
			<tr>
				<th>센터</th>
				<th>최종수정일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${centerList }" var="centerInfo" varStatus="status">
				<tr>
					<td class="ta_l">${centerInfo.MNG_NM }</td>
					<td style="display: none;">${centerInfo.MNG_CD }</td>
					<td>${centerInfo.REG_DT }</td>
					<td><a href="javascript:fnCenterManage('${centerInfo.MNG_CD }','${centerInfo.MNG_NM }');" class="btn sm">관리하기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<form action="" method="post" name="updateForm">
	<input type="hidden" name="MNG_NM" value="" id=""/>
	<input type="hidden" name="MNG_CD" value="" id=""/>
</form>