<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>

<script type="text/javascript">

/*********************************************************
 * 초기화
 ******************************************************** */
function fnInit() {
	// 팝업데이터 순서변경 처리
	$("#popupTable").tableDnD({
		onDrop: function(table, row){
			var rows = table.tBodies[0].rows; 
			var debugStr = row.id;
			
			{
				// form 초기화
				$('form[name=orderForm]').remove();
				
				var form = $("<form>");
				form.prop("name","orderForm" );
				form.prop("method","post");
				form.prop("action","");
				
				for(var i = 0; i < rows.length; i++) {
					var input1 = $("<input>");
					input1.prop("type", "hidden");
					input1.val(i+1);
					input1.prop("name", "seq"+(i+1)+"Order");
					
					var input2 = $("<input>");
					input2.prop('type', 'hidden');
					input2.val($("#"+rows[i].id+"DtilCd").val());
					input2.prop('name', "seq"+(i+1)+"DtilCd");
					
					form.append(input1);
					form.append(input2);
				}
				
				var input3 = $("<input>");
				input3.prop('type', 'hidden');
				input3.val('${fn:length(checkupList)}');
				input3.prop('name','trCount');
				
				form.append(input3);
				
				$('body').append(form);
			}
		}
	});
}

/*********************************************************
 * 엑셀다운
 ******************************************************** */
function fnExcelDown() {
	document.detailForm.action = "<c:url value='/admin/rcm/cpm/selectCPMListExcel.do'/>";
	document.detailForm.submit();
}

/*********************************************************
 * 삭제
 *********************************************************/
function fnDelete(DTIL_CD) {
	if(confirm("게시물을 삭제하시겠습니까? 삭제 후 복원은 불가능합니다.")) {
		alert("삭제되었습니다.")
		document.detailForm.action = "<c:url value='/admin/rcm/cpm/deleteCPM.do'/>";
		document.detailForm.DTIL_CD.value=DTIL_CD;
		document.detailForm.submit();
	}
}

/*********************************************************
 * 정렬 순서변경 저장
 *********************************************************/
function fnOrderChange() {
	if(confirm("순서변경을 완료하시겠습니까?")) {
		document.orderForm.action = "<c:url value='/admin/rcm/cpm/updateOrderChange.do'/>";
		document.orderForm.submit();
	}
}

/*********************************************************
 * 정렬 순서변경 취소
 *********************************************************/
function fnOrderPopCancel() {
	if(confirm("순서변경을 취소하시겠습니까?")) {
		pop_close('#lypop01');
	}
}

/*********************************************************
 * 수정페이지
 *********************************************************/
function fnUpdate(DTIL_CD) {
	document.detailForm.action="<c:url value='/admin/rcm/cpm/updateCPMView.do'/>";
	document.detailForm.DTIL_CD.value=DTIL_CD;
	document.detailForm.submit();
}

</script>


<div class="border_box option_bx">
	<div class="btns ta_l">
		<ul>
			<li><a href="javascript:fnExcelDown();" class="sm btn_down">엑셀 다운로드</a></li>
		</ul>
	</div>
</div>
<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width: 7%">
			<col style="">
			<col style="width: 10%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<tr>
				<th>코드</th>
				<th>검진프로그램</th>
				<th>사용여부</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${checkupList}" var="checkupProgramInfo" varStatus="status">
				<tr>
					<td><c:out value="${checkupProgramInfo.DTIL_CD}" /></td>
					<td class="ta_l">
						<a href="javascript:fnUpdate('${checkupProgramInfo.DTIL_CD}')">
						<c:out value="${checkupProgramInfo.DTIL_CODE_NM}" /></a>
					</td>
					<td><c:out value="${checkupProgramInfo.USE_YN}" /></td>
					<td>
						<a href="javascript:fnDelete('${checkupProgramInfo.DTIL_CD}')" class="btn ico_st memo">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="btns ta_r">
	<a href="javascript:pop_open('#lypop01');" class="btn_ty">순서변경</a> 
	<a href="/admin/rcm/cpm/insertCPMView.do" class="btn_ty03">등록하기</a>
</div>

<!-- 순서변경 레이어팝업 -->
<div class="lypop_wrap" id="lypop01">
	<div class="sm_con" style="top: 300px">
		<div class="pop_top">
			<h2>순서변경</h2>
			<a href="javascript:void(0);" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit">
				<strong>검진프로그램</strong>
			</h3>

			<div class="board_ty ds02">
				<table id="popupTable">
					<colgroup>
						<col style="width: 15%">
						<col style="width: *">
					</colgroup>
					<thead>
						<tr>
							<th>노출순서</th>
							<th>프로그램명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="checkupProgramInfo" items="${checkupList}" varStatus="status">
							<c:if test="${checkupProgramInfo.USE_YN == 'Y'}">
								<tr id="seq${status.count}">
									<td><c:out value="${status.count}"/></td>
									<td class="ta_l"><c:out value="${checkupProgramInfo.DTIL_CODE_NM}"/></td>
								</tr>
								
								<input type="hidden" id="seq${status.count}DtilCd" value="${checkupProgramInfo.DTIL_CD}"/>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="javascript:fnOrderChange();" class="btn_ty02">저장하기</a>
				<a href="javascript:fnOrderPopCancel();" class="btn_ty p_cancle">취소하기</a>
			</div>
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>
<!-- //순서변경 레이어팝업 -->

<form action="" method="post" name="orderForm">
	<c:forEach items="${checkupList}" var="checkupInfo" varStatus="status">
		<input type="hidden" value="${status.count}" name="seq${status.count}Order">
		<input type="hidden" value=value="${checkupInfo.DTIL_CD}" name="seq${status.count}DtilCd">
	</c:forEach>
	
	<input type="hidden" value="${fn:length(checkupList)}" name="trCount">
</form>

<form action="" name="detailForm" method="post">
	<input type="hidden" name="DTIL_CD"/>
</form>
