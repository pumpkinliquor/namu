<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	$(function() {
		$("#ntceBgnde").datepicker({
			dateFormat : 'yy.mm.dd'
		});

		$("#ntceEndDe").datepicker({
			dateFormat : 'yy.mm.dd'
		});
		
		$('#ntceBgnde').datepicker("option", "maxDate", $("#ntceEndDe").val());
		$('#ntceBgnde').datepicker("option", "onClose", function(selectedDate) {
			$("#ntceEndDe").datepicker("option", "minDate", selectedDate);
		});
		
		$('#ntceEndDe').datepicker("option", "minDate", $("#ntceBgnde").val());
		$('#ntceEndDe').datepicker("option", "onClose", function(selectedDate) {
			$("#ntceBgnde").datepicker("option", "maxDate", selectedDate);
		});
	});
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		/*상태 유지*/
		var MBER_ID = '${membersVO.MBER_ID}' !== "";
		var MBER_NM = '${membersVO.MBER_NM}' !== "";
		$("select[name=GUBN_CD]").val('${membersVO.GUBN_CD}').prop("selected",
				true);
		$("select[name=STAT_CD]").val('${membersVO.STAT_CD}').prop("selected",
				true);
		$("input[name=searchBgnDate]").val(
				'${membersVO.searchBgnDate}'.replace(/\-/g, "."));
		$("input[name=serachEndDate]").val(
				'${membersVO.serachEndDate}'.replace(/\-/g, "."));
		if (MBER_ID) {
			$("select[name=searchType]").val("MBER_ID").prop("selected", true);
		}
		if (MBER_NM) {
			$("select[name=searchType]").val("MBER_NM").prop("selected", true);
		}

	}

	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.memberInfoForm.pageIndex.value = pageNo;
		document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/selectMBIList.do'/>";
		document.memberInfoForm.submit();
	}
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function fnSearchMember() {
		document.memberInfoForm.pageIndex.value = 1;
		if (document.memberInfoForm.searchType.value === "MBER_ID") {
			document.memberInfoForm.MBER_ID.value = document.memberInfoForm.searchKeyword.value;
			document.memberInfoForm.MBER_NM.value = "";
		} else if (document.memberInfoForm.searchType.value === "MBER_NM") {
			document.memberInfoForm.MBER_NM.value = document.memberInfoForm.searchKeyword.value;
			document.memberInfoForm.MBER_ID.value = "";
		}
		document.memberInfoForm.submit();
	}
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fnMemberDetail(MBER_ID) {
		document.detailForm.MBER_ID.value = MBER_ID;
		document.detailForm.action = "<c:url value='/admin/mbm/mbi/selectMBIDetail.do'/>";
		document.detailForm.submit();
	}
	/*********************************************************
	 * 엑셀다운
	 ******************************************************** */
	function fnExcelDown() {
		document.memberInfoForm.action = "<c:url value='/admin/mbm/mbi/selectMBIListExcel.do'/>";

		document.memberInfoForm.pageIndex.value = 1;
		if (document.memberInfoForm.searchType.value === "MBER_ID") {
			document.memberInfoForm.MBER_ID.value = document.memberInfoForm.searchKeyword.value;
			document.memberInfoForm.MBER_NM.value = "";
		} else if (document.memberInfoForm.searchType.value === "MBER_NM") {
			document.memberInfoForm.MBER_NM.value = document.memberInfoForm.searchKeyword.value;
			document.memberInfoForm.MBER_ID.value = "";
		}

		document.memberInfoForm.submit();
	}
</script>
<form name="memberInfoForm"
	action="<c:url value='/admin/mbm/mbi/selectMBIList.do'/>" method="post">
	<!-- 검색 -->
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width: 12%;">
				<col span="1" style="width: 34%;">
				<col span="1" style="width: 12%;">
				<col span="1" style="">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">
						<div class="select_wrap">
							<select name="searchType" class="select">
								<option value="MBER_NM">이름</option>
								<option value="MBER_ID">아이디</option>
							</select>
						</div>
					</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="w_full" name="searchKeyword"
								value='<c:out value="${membersVO.searchKeyword }"/>' />
						</div>
					</td>
					<th scope="row" class="ta_l">구분</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select name="GUBN_CD" class="select">
								<option value="">선택하세요</option>
								<option value="01">일반회원</option>
								<option value="02">비스타회원</option>
								<option value="03">뷰회원</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">이메일</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="100" class="w_full" name="MBER_EMAIL_ADRES"
								value='<c:out value="${membersVO.MBER_EMAIL_ADRES }"/>' />
						</div>
					</td>
					<th scope="row" class="ta_l">상태</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select class="select" name="STAT_CD">
								<option value="">선택하세요</option>
								<option value="01">정상</option>
								<option value="02">휴면</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">회원가입일</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" name="searchBgnDate" id="ntceBgnde" value=''
									class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span> <input type="text" name="serachEndDate"
									id="ntceEndDe" value='' class="inp_txt wd110 date_pick"
									title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btns">
		<a href="javascript:fnSearchMember()" class="btn_ty02"> 검색하기 </a>
		 <a href="" class="btn_ty"> 취소하기 </a>
		 <!-- <a href="/user/cmm/mod/modifyPage.do" class="btn_ty02"> testPage </a> -->
		
		
	</div>
	<input name="MBER_ID" type="hidden" value=""> <input
		name="MBER_NM" type="hidden" value=""> <input name="pageIndex"
		type="hidden" value="<c:out value='${membersVO.pageIndex}'/>">
</form>
<!-- //검색 -->
<div class="border_box option_bx">
	<div class="btns ta_l">
		<ul>
			<li><a href="javascript:fnExcelDown();" class="sm btn_down">엑셀다운로드</a></li>
		</ul>
	</div>
</div>
<div class="board_ty ds02">
	<table>
		<colgroup>
			<col style="width: 7%">
			<col style="">
			<col style="width: 20%">
			<col style="width: 20%">
			<col style="width: 15%">
			<col style="width: 10%">
			<col style="width: 10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>회원가입일</th>
				<th>구분</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberList}" var="memberInfo" varStatus="status">
				<tr>
					<td><c:out
							value="${memberListTotCnt - ((membersVO.pageIndex-1) * membersVO.pageSize + status.index)}" />
					</td>
					<td><a href="javascript:fnMemberDetail('${memberInfo.MBER_ID }')">
					<c:out value='${memberInfo.MBER_NM}' /></a></td>
					<td><c:out value='${memberInfo.MBER_ID}' /></td>
					<td><c:out value="${memberInfo.MBER_EMAIL_ADRES }" /></td>
					<td><c:out value='${memberInfo.FRIST_JOIN_DT}' /></td>
					<td>
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
						</c:choose></td>
					<td><c:choose>
							<c:when test="${memberInfo.STAT_CD == '01' }">
								정상
							</c:when>
							<c:when test="${memberInfo.STAT_CD == '02' }">
								휴면
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(memberList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="7"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image"
		jsFunction="fnSelectLinkPage" />
</div>
<!-- //paginate -->
<div class="btns ta_r mt_m">
	<a href="/admin/mbm/mbi/registMBIView.do" class="btn_ty03">등록하기</a>
</div>
<%-- 상세페이지 이동 폼 --%>
<form name="detailForm" method="post" action="">
	<input type="hidden" name="MBER_ID" value="">
</form>
