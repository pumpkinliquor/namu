<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">

/*********************************************************
 * 초기화
*********************************************************/
function fnInit() {}

	
/*********************************************************
 * 관리하기 페이지
 *********************************************************/
function fnUpdateForm(MNG_CD, MNG_NM){
	document.updateForm.action="<c:url value ='/admin/hpm/sbm/updateSBMView.do'/>";
	document.updateForm.MNG_CD.value=MNG_CD;
	document.updateForm.MNG_NM.value=MNG_NM;
	document.updateForm.submit();
}
	
</script>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="">
			<col style="width: 40%">
			<col style="width: 20%">
		</colgroup>
		<thead>
			<tr>
				<th>진료과목</th>
				<th>최종수정일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${subjectList}" var="subjectInfo" varStatus="status">
				<tr>
					<c:if test="${subjectInfo.MNG_CD ne 'GO'}">
						<td>${subjectInfo.MNG_NM}</td>
						<td>${subjectInfo.UPDT_DT}</td>
					</c:if>
					<td>
						<div class="btns">
							<c:if test="${subjectInfo.MNG_CD ne 'GO'}">
								<a href="javascript:fnUpdateForm('${subjectInfo.MNG_CD}','${subjectInfo.MNG_NM}')" class="sm">관리하기</a>
							</c:if>
							<!-- // 활성화 : on 추가 -->
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<form action="" method="post" name="updateForm">
	<input type="hidden" name="MNG_GUBN_CD" value="01"/>
	<input type="hidden" name="MNG_CD"/>
	<input type="hidden" name="MNG_NM"/>
</form>