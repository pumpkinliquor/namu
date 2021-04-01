<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script>

/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {

}

/*********************************************************
 * 페이징 처리
 ******************************************************** */
function fnSelectLinkPage(pageNo) {
	document.DropListForm.pageIndex.value = pageNo;
	document.DropListForm.action = "<c:url value='/admin/mbm/dur/selectDURList.do'/>";
	document.DropListForm.submit();
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectDURList() {
	document.DropListForm.pageIndex.value = 1;
	document.DropListForm.submit();
}

/*********************************************************
 * 엑셀다운
 ******************************************************** */
function fnExcelDown() {
	document.DropForm.action = "<c:url value='/admin/mbm/dur/selectDURListExcel.do'/>";
	document.DropForm.submit();
}

</script>

<h3 class="mid_tit mg_t50">탈퇴 회원 리스트</h3>

<form method="post" name="DropListForm"
	action="<c:url value='/admin/mbm/dur/selectDURList.do'/>"
	onSubmit="selectDURList(); return false;">
	
	<div class="board_ty ds02">
		<table>
			<colgroup>
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 45%">
				<col style="width: 25%">
			</colgroup>

			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>탈퇴사유</th>
					<th>탈퇴일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${dropMemberList}" var="dropMember"
					varStatus="status">
					<tr>
						<td><c:out value="${dropMemberListTotCnt -
											((dropMemberVO.pageIndex-1) *
											dropMemberVO.pageSize + status.index)}" />
						</td>
						<td><c:out value='${dropMember.USER_ID}' /></td>
						<td><c:out value='${dropMember.DROP_RESN_CD}' /></td>
						<td><c:out value='${dropMember.DROP_DT}' /></td>
					</tr>
					
				</c:forEach>
				<c:if test="${fn:length(dropMemberList) == 0}">
					<!-- 글이 없는 경우 -->
					<tr>
						<td colspan="4">탈퇴 회원이 없습니다.</td>
						<%-- <td colspan="4"><spring:message code="common.nodata.msg" /></td> --%>
					</tr>
				</c:if>

			</tbody>
		</table>
	</div>
	
	<input type="hidden" name="pageIndex" value="<c:out value='${dropMemberVO.pageIndex}'/>">
	
</form>
<br>

<div class="btns ta_l">
	<ul>
		<li><a href="javascript:fnExcelDown();" class="sm btn_down">엑셀 다운로드 </a></li>
	</ul>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image"
		jsFunction="fnSelectLinkPage" />
</div>
<!-- //paginate -->


<form method="post" action="" name="DropForm">
	<input type="hidden" name="DROP_RESN_CD" />
</form>

