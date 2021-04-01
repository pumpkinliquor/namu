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
	// 진료과목 셋팅
	$("select[name=MEDI_SBJ_CD]").val("${doctorVO.MEDI_SBJ_CD}").prop("selected",true);
	
	// 팝업데이터 순서변경 처리
	$("#dnd").tableDnD({
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
				
				for(var i=0; i < rows.length;i++){
					$("#"+rows[i].id).find("td").eq(0).html((i+1));
					$("#"+rows[i].id).find("td").eq(1).children().eq(0).val($("#"+rows[i].id).find("td").eq(0).html());
					var input1=$("<input>");
					input1.prop('type', 'hidden');
					input1.val($("#"+rows[i].id).find("td").eq(1).children().eq(0).val());
					input1.prop('name', $("#"+rows[i].id).find("td").eq(1).children().eq(0).prop("name").slice(0,-1));
					var input2=$("<input>");
					input2.prop('type', 'hidden');
					input2.val($("#"+rows[i].id).find("td").eq(3).children().eq(0).val());
					input2.prop('name', $("#"+rows[i].id).find("td").eq(3).children().eq(0).prop("name").slice(0,-1));
					form.append(input1);
					form.append(input2);
				}
				
				var input3=$("<input>");
				input3.prop('type', 'hidden');
				input3.val('${doctorVO.MEDI_SBJ_CD }');
				input3.prop('name', 'MEDI_SBJ_CD');
				
				var input4=$("<input>");
				input4.prop('type', 'hidden');
				input4.val('${fn:length(doctorListPopup) }');
				input4.prop('name','trCount');
				
				form.append(input3);
				form.append(input4);
				
				$('body').append(form);
			}
		}
	});
}

/*********************************************************
 * 페이징 처리 함수
 *********************************************************/
function fnSelectLinkPage(pageNo) {
	document.searchForm.pageIndex.value = pageNo;
	document.searchForm.action = "<c:url value='/admin/hpm/drm/selectDRMList.do'/>";
	document.searchForm.submit();
}

/*********************************************************
 * 상세 페이지 함수
 *********************************************************/
function fnDoctorDetail(DR_ID, MEDI_SBJ_CD) {
	document.detailForm.DR_ID.value = DR_ID;
	document.detailForm.MEDI_SBJ_CD.value = MEDI_SBJ_CD;
	document.detailForm.action = "<c:url value='/admin/hpm/drm/updateDRMView.do'/>";
	document.detailForm.submit();
}

/*********************************************************
 * 조회 처리 함수
 *********************************************************/
function fnDoctorSearch() {
	document.searchForm.action = "<c:url value='/admin/hpm/drm/selectDRMList.do'/>";
	document.searchForm.submit();
}

/*********************************************************
 * 등록하기
 *********************************************************/
function fnInsertDRM() {
	document.insertForm.action = "/admin/hpm/drm/insertDRMView.do";
	document.insertForm.MEDI_SBJ_CD.value = $("select[name=MEDI_SBJ_CD]").val();
	document.insertForm.submit();
}

/*********************************************************
 * 정렬 순서변경 저장
 *********************************************************/
function fnOrderChange() {
	if(confirm("순서변경을 완료하시겠습니까?")) {
		document.orderForm.action = "/admin/hpm/drm/updateOrderDRM.do";
		document.orderForm.submit();
	}
}

/*********************************************************
 * 정렬 순서변경 취소
 *********************************************************/
function fnCenterPopCancel() {
	if(confirm("순서변경을 취소하시겠습니까?")) {
		pop_close('#lypop01');
	}
}

</script>


<form method="post" action="" name="searchForm">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">진료과목</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select  class="select" name="MEDI_SBJ_CD">
								<c:forEach var="exmnProgCdInfo" items="${exmnProgCdList}" varStatus="status">
									<option value="${exmnProgCdInfo.CODE}">${exmnProgCdInfo.NAME}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="btns">
		<a href="javascript:fnDoctorSearch()" class="btn_ty02">확인</a>
	</div>
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="">
			<col style="width: 40%">
			<col style="width: 20%">
		</colgroup>
		<thead>
			<tr>
				<th>의료진명</th>
				<th>진료과목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${doctorList}" var="doctorInfo" varStatus="status">
				<tr>
					<td>
						<a href="javascript:fnDoctorDetail('${doctorInfo.DR_ID}','${doctorInfo.MEDI_SBJ_CD}')">
							<c:out value='${doctorInfo.DR_NM}'/>
						</a>
					</td>
					<td>
						<c:out value='${doctorInfo.MEDI_SBJ_NM}'/>
					</td>
					<td>
						<c:out value='${doctorInfo.REG_DT}'/>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(doctorList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="3"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage" />
</div>
<!-- //paginate -->

<div class="btns ta_r mt_m">
	<a href="javascript:pop_open('#lypop01');" class="btn_ty">순서변경</a>
	<a href="javascript:fnInsertDRM()" class="btn_ty03">등록하기</a>
</div>

<form action="" method="post" name="detailForm">
	<input type="hidden" name="DR_ID" value="" />
	<input type="hidden" name="MEDI_SBJ_CD" value="" />
</form>

<form action="" method="post" name="insertForm">
	<input type="hidden" name="MEDI_SBJ_CD" value="" />
</form>


<!-- 의료진 순서변경 레이어팝업 -->
<div class="lypop_wrap" id="lypop01">
	<div class="sm_con" style="top:300px">
		<div class="pop_top">
			<h2>순서변경</h2>
			<a href="javascript:fnCenterPopCancel();" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit"><strong>의료진</strong></h3>

			<div class="board_ty ds02">
				<table id="dnd">
					<colgroup>
						<col style="width:15%">
						<col style="width:*">
					</colgroup>
					<thead>
						<tr>
							<th>노출순서</th>
							<th>의료진</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${doctorListPopup}" var="doctorInfo" varStatus="status">
							<tr id="seq${status.count}">
								<td>${status.count}</td>
								<td style="display:none;"><input type="hidden" name="seq${status.count}Order1" value="${status.count}"/></td>
								<td class="ta_l">${doctorInfo.DR_NM}</td>
								<td style="display:none;"><input type="hidden" name="seq${status.count}DoctorId1" value="${doctorInfo.DR_ID}"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="javascript:fnOrderChange();" class="btn_ty02">저장하기</a>
				<a href="javascript:fnCenterPopCancel();" class="btn_ty p_cancle">취소하기</a>
			</div>
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div><!-- //순서변경 레이어팝업 -->

<form action="" method="post" name="orderForm">
	<c:forEach items="${doctorListPopup}" var="doctorInfo" varStatus="status">
		<input type="hidden" value="${status.count}" name="seq${status.count}Order">
		<input type="hidden" value="${doctorInfo.DR_ID}" name="seq${status.count}DoctorId">
	</c:forEach>
	
	<input type="hidden" value="${doctorVO.MEDI_SBJ_CD}" name="MEDI_SBJ_CD">
	<input type="hidden" value="${fn:length(doctorListPopup)}" name="trCount">
</form>
