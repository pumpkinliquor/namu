<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>

<script type="text/javascript">

/*********************************************************
 * 초기화
 *********************************************************/

function fnInit() {
	// 팝업데이터 순서변경 처리
	$('table[id$="popupTable"]').tableDnD({
		onDrop: function(table, row){
			var mngCd = $(table).find('#mngCd').val();
			var trCnt = $('#trCountIn'+mngCd).val();
			
			var rows = table.tBodies[0].rows; 
			var debugStr = row.id;
			{
				// form 초기화
				$('form[name=orderForm]').remove();
				
				var form = $("<form>");
				form.prop("name", "orderForm");
				form.prop("method", "post");
				form.prop("action", "");
				
				for(var i = 0; i < trCnt; i++) {
					$("#"+rows[i].id).find("td").eq(0).html((i+1));
					$("#"+rows[i].id).find("td").eq(1).children().eq(0).val($("#"+rows[i].id).find("td").eq(0).html());
					var input1 = $("<input>");
					input1.prop("type", "hidden");
					input1.val($("#"+rows[i].id).find("td").eq(0).html());
					input1.prop("name", "seq"+(i+1)+"Order");
					
					var input2 = $("<input>");
					input2.prop('type', 'hidden');
					input2.val($("#"+rows[i].id).find("input").val());
					input2.prop('name', "seq"+(i+1)+"MngSeq");
					
					form.append(input1);
					form.append(input2);
				}
				
				var input3 = $("<input>");
				input3.prop('type', 'hidden');
				input3.val(trCnt);
				input3.prop('name', 'trCount');
				
				form.append(input3);
				
				var input4 = $("<input>");
				input4.prop('type', 'hidden');
				input4.val(mngCd);
				input4.prop('name', 'mngCd');
				
				form.append(input4);
				
				$('body').append(form);
			}
		}
	});
}

/*********************************************************
 * 등록
 *********************************************************/
function fnInsertPage(MNG_CD) {
	document.detailForm.action="<c:url value='/admin/hpm/cln/insertCLNView.do'/>";
	document.detailForm.MNG_CD.value=MNG_CD;
	document.detailForm.submit();
}

/*********************************************************
 * 수정
 *********************************************************/
function fnUpdatePage(MNG_CD, MNG_SEQ) {
	document.detailForm.action="<c:url value='/admin/hpm/cln/updateCLNView.do'/>";
	document.detailForm.MNG_CD.value=MNG_CD;
	document.detailForm.MNG_SEQ.value=MNG_SEQ;
	document.detailForm.submit();
}

/*********************************************************
 * 삭제
 *********************************************************/
function fnDelete(MNG_CD, MNG_SEQ) {
	if(confirm("게시물을 삭제하시겠습니까? 삭제 후 복원은 불가능합니다.")) {
		alert("삭제되었습니다.")
		document.detailForm.action = "<c:url value='/admin/hpm/cln/deleteCLN.do'/>";
		document.detailForm.MNG_CD.value=MNG_CD;
		document.detailForm.MNG_SEQ.value=MNG_SEQ;
		document.detailForm.submit();
	}
}

/*********************************************************
 * 정렬 순서변경 저장
 *********************************************************/
function fnOrderChange() {
	if(confirm("순서변경을 완료하시겠습니까?")) {
		document.orderForm.action = "<c:url value='/admin/hpm/cln/updateOrderChange.do'/>";
		document.orderForm.submit();
	}
}

/*********************************************************
 * 정렬 순서변경 취소
 *********************************************************/
function fnOrderPopCancel(popId) {
	if(confirm("순서변경을 취소하시겠습니까?")) {
		trListcount = 0;
		pop_close('#'+popId);
	}
}

</script>

<c:forEach items="${centerList}" var="centerInfo" varStatus="centerStatus">
	<c:set var="clinic" value="clinicList${centerStatus.count}" />
	<h3 class="mid_tit mg_t50">
		<c:out value="${centerInfo.MNG_NM}"/>	<!-- 센터명 -->
	</h3>
	<p class="te_ri_txt">최대 6개까지 등록가능합니다.</p>
	
	<div class="board_ty ds02">
		<table>
			<colgroup>
				<col style="width:7%">
				<col style="">
				<col style="width:15%">
				<col style="width:15%">
				<col style="width:10%">
				<col style="width:10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>클리닉</th>
					<th>템플릿</th>
					<th>등록일</th>
					<th>게시여부</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope[clinic]}" var="clinicInfo" varStatus="status">
				<tr>
					<td><c:out value="${status.count}"/></td>
					<td class="ta_l"><a href="javascript:fnUpdatePage('${clinicInfo.MNG_CD}','${clinicInfo.MNG_SEQ}');"><c:out value="${clinicInfo.CLINIC_NM}"/></a></td>
					<td><c:out value="${clinicInfo.TEMPL_CD}"/></td>
					<td><c:out value="${clinicInfo.REG_DT}"/></td>
					<td><c:out value="${clinicInfo.POST_YN}"/></td>
					<td>
							<a href="javascript:fnDelete('${clinicInfo.MNG_CD}','${clinicInfo.MNG_SEQ}');" class="btn ico_st memo">삭제</a>  <!-- // 활성화 : on 추가 -->
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns ta_r">
		<a href="javascript:pop_open('#lypop01${centerInfo.MNG_CD}');" class="btn_ty">순서변경</a>
		<a href="javascript:fnInsertPage('${centerInfo.MNG_CD}');" class="btn_ty03">등록하기</a>
	</div>
	
	<!-- 순서변경 레이어팝업 -->
	<div class="lypop_wrap" id="lypop01${centerInfo.MNG_CD}">
		<input type="hidden" value="${fn:length(requestScope[clinic])}" id="trListcount">
		<div class="sm_con" style="top: 300px">
			<div class="pop_top">
				<h2>순서변경</h2>
				<a href="javascript:void(0);" class="pop_close"></a>
			</div>
			<!-- pop_cont -->
			<div class="pop_cont">
				<h3 class="pop_mid_tit">
					<strong>${centerInfo.MNG_NM}</strong>
				</h3>
	
				<div class="board_ty ds02">
					<table id="popupTable">
						<input type="hidden" value="${centerInfo.MNG_CD}" id="mngCd">
						<input type="hidden" value="${fn:length(requestScope[clinic])}" id="trCountIn${centerInfo.MNG_CD}">
						<colgroup>
							<col style="width: 15%">
							<col style="width: *">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>클리닉</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="checkupProgramInfo" items="${requestScope[clinic]}" varStatus="status">
								<tr id="${centerInfo.MNG_CD}_${status.count}">
									<td><c:out value="${status.count}"/></td>
									<td class="ta_l"><c:out value="${checkupProgramInfo.CLINIC_NM}"/></td>
									<input type="hidden" id="${centerInfo.MNG_CD}_${checkupProgramInfo.MNG_SEQ}MngSeq" value="${checkupProgramInfo.MNG_SEQ}"/>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
	
				<div class="btns">
					<a href="javascript:fnOrderChange('${centerInfo.MNG_CD}','${centerInfo.MNG_SEQ}');" class="btn_ty02">저장하기</a>
					<a href="javascript:fnOrderPopCancel('lypop01${centerInfo.MNG_CD}');" class="btn_ty p_cancle">취소하기</a>
				</div>
			</div>
			<!-- //pop_cont -->
		</div>
		<div class="dim"></div>
	</div>
	<!-- //순서변경 레이어팝업 -->

	
</c:forEach>

<form action="" method="post" name="orderForm">
	<c:forEach var="checkupProgramInfo" items="${requestScope[clinic]}" varStatus="status">
		<input type="hidden" value="${status.count}" name="seq${status.count}Order">
		<input type="hidden" value="${checkupProgramInfo.MNG_SEQ}" name="seq${status.count}MngSeq">
	</c:forEach>
	
	<input type="hidden" value="${fn:length(requestScope[clinic])}" name="trCount">
</form>



<form action="" name="detailForm" method="post">
	<input type="hidden" name="MNG_CD"/>
	<input type="hidden" name="MNG_SEQ"/>
</form>
