<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnReservationDetail01(searchKeyword) {
	document.detailForm01.searchKeyword.value = searchKeyword;
  	document.detailForm01.action = "<c:url value='/user/cts/rsv/userRSVDetail.do'/>";
  	document.detailForm01.submit();
}
function fnReservationDetail02(searchKeyword) {
	document.detailForm02.searchKeyword.value = searchKeyword;
  	document.detailForm02.action = "<c:url value='/user/cts/rsv/userRSVDetail.do'/>";
  	document.detailForm02.submit();
}
/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fnSelectLinkPage1(pageNo) {
	document.detailForm01.pageIndex.value = pageNo;
	document.detailForm01.action = "<c:url value='/user/cts/rsv/userRSVList.do'/>";
   	document.detailForm01.submit();
}
function fnSelectLinkPage2(pageNo) {
	document.detailForm02.pageIndex.value = pageNo;
	document.detailForm02.action = "<c:url value='/user/cts/rsv/userRSVList.do'/>";
   	document.detailForm02.submit();
}
/*********************************************************
 * 취소 처리 함수
 ******************************************************** */
function fnCancel(searchKeyword) {
	document.cancelForm.searchKeyword.value = searchKeyword;
  	document.cancelForm.action = "<c:url value='/user/cts/rsv/userRSVCancel.do'/>";
  	if(confirm("예약을 취소하시겠습니까?\n예약이 취소되면 예약내역에서도 삭제됩니다")){
  		document.cancelForm.submit();
	}
}

$(function() {
	if('${result}' == 503) {
		alert('회원 정보가 유효하지 않습니다.');
	}
});

</script>
<!-- contents s -->
<div class="contents w1200">

	<ul class="tab_list">
		<!-- tab -->
	<c:if test="${appointmentVO.APPO_GUBN_CD eq '01' or empty appointmentVO.APPO_GUBN_CD}">
		<li class="selected"><a href="javascript:void(0);" title="선택된 탭">진료예약</a></li>
		<li><a href="javascript:void(0);">검진예약</a></li>
	</c:if>
	<c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">
		<li><a href="javascript:void(0);">진료예약</a></li>
		<li class="selected"><a href="javascript:void(0);" title="선택된 탭">검진예약</a></li>
	</c:if>
	</ul>

	<section class="tab_box" <c:if test="${appointmentVO.APPO_GUBN_CD eq '01' or empty appointmentVO.APPO_GUBN_CD}">style="display: block"</c:if><c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">style="display: none"</c:if>>
		<!-- //tab contents1 s -->
		<div class="box_blue">
			<ul>
				<li>진료예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>진료예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, 1577-7502로 전화 후 예약변경이 가능합니다.</li>
			</ul>
		</div>

		<div class="tbox">
			<table>
				<caption>진료과 의료진 예약일시 수정,취소로로 이루어진 리스트</caption>
				<col>
				<col style="width: 15%">
				<col style="width: 20%">
				<col style="width: 20%">
				<thead>
					<tr>
						<th scope="col">진료과</th>
						<th scope="col">의료진</th>
						<th scope="col">예약일시</th>
						<th scope="col">수정/취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservationList}" var="reservationInfo"	varStatus="status">
						<tr class="t_reservation">
							<td class="t_left">
							<a href="/user/hpm/smt/SMTPage.do?code=${reservationInfo.MEDI_SBJ_CD}"> <c:out value='${reservationInfo.MEDI_SBJ_NM}'/> </a>
							</td>
							<td>
							<c:out value='${reservationInfo.DR_NM}' />
							</td>
							<td class="t_date">
								<c:out value='${fn:substring(reservationInfo.APPO_DT, 0, 4)}.${fn:substring(reservationInfo.APPO_DT, 4, 6)}.${fn:substring(reservationInfo.APPO_DT, 6, 8)}' />
								<em><c:out value='${fn:substring(reservationInfo.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo.APPO_TIME, 2, 4)}' /></em>
							</td>
							<td>
								<fmt:parseDate value="${today}" var="today1" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${today1.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
								<fmt:parseDate value="${reservationInfo.APPO_DT}" var="targetDt" pattern="yyyyMMdd"/>
								<fmt:parseNumber value="${targetDt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
								<c:if test="${endDate - strDate gt 4 and reservationInfo.APPO_STAT_CD eq 01}">
									<a href="javascript:fnReservationDetail01('${reservationInfo.APPO_NO }')" class="btn bxs bblue">예약수정</a>
								</c:if>
								<c:if test="${endDate - strDate gt 0 and reservationInfo.APPO_STAT_CD eq 01}">
									<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs ml5">예약취소</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage1"/>
		</div>

	</section>
	<!-- //tab contents1 e -->

	<section class="tab_box" <c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">style="display: block"</c:if><c:if test="${appointmentVO.APPO_GUBN_CD eq '01'}">style="display: none"</c:if>>
		<!-- tab contents2 s -->
		<div class="box_blue">
			<ul>
				<li>검진예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>검진예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, 1577-7502로 전화 후 예약변경이 가능합니다.</li>
				</li>
			</ul>
		</div>
		<div class="tbox">
			<table>
				<caption>검진프로그램, 예약일시, 수정/취소로 이루어진 리스트</caption>
				<col>
				<col style="width: 20%">
				<col style="width: 20%">
				<thead>
					<tr>
						<th scope="col">검진프로그램</th>
						<th scope="col">예약일시</th>
						<th scope="col">수정/취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservationList2}" var="reservationInfo2"	varStatus="status">
						<tr class="t_reservation">
							<td class="t_left">
							<a href="/user/cuc/ccc/infoCCC.do"> <c:out value='${reservationInfo2.EXMN_PROG_NM}'/> </a>
							</td>
							<td class="t_date">
								<c:out value='${fn:substring(reservationInfo2.APPO_DT, 0, 4)}.${fn:substring(reservationInfo2.APPO_DT, 4, 6)}.${fn:substring(reservationInfo2.APPO_DT, 6, 8)}' />
								<em><c:out value='${fn:substring(reservationInfo2.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo2.APPO_TIME, 2, 4)}' /></em>
							</td>
							<td>
								<fmt:parseDate value="${today}" var="today2" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${today2.time / (1000*60*60*24)}" integerOnly="true" var="strDate2"></fmt:parseNumber>
								<fmt:parseDate value="${reservationInfo2.APPO_DT}" var="targetDt2" pattern="yyyyMMdd"/>
								<fmt:parseNumber value="${targetDt2.time / (1000*60*60*24)}" integerOnly="true" var="endDate2"></fmt:parseNumber>
								<c:if test="${endDate2 - strDate2 gt 4 and reservationInfo2.APPO_STAT_CD eq 01}">
									<a href="javascript:fnReservationDetail02('${reservationInfo2.APPO_NO}')" class="btn bxs bblue">예약수정</a>
								</c:if>
								<c:if test="${endDate2 - strDate2 gt 0 and reservationInfo2.APPO_STAT_CD eq 01}">
									<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs ml5">예약취소</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fnSelectLinkPage2"/>
		</div>
		<!-- //paginate -->

	</section>
	<!-- //tab contents2 e -->

</div>
<!-- //contents e -->

<%-- 상세페이지 이동 폼 --%>
<form name="detailForm01" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="APPO_GUBN_CD" value="01">
	<input type="hidden" name="searchKeyword" value="<c:out value='${appointmentVO1.searchKeyword}'/>">
    <input type="hidden" name="pageIndex" value="<c:out value='${appointmentVO1.pageIndex}'/>">
</form>
<form name="detailForm02" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="APPO_GUBN_CD" value="02">
	<input type="hidden" name="searchKeyword" value="<c:out value='${appointmentVO2.searchKeyword}'/>">
    <input type="hidden" name="pageIndex" value="<c:out value='${appointmentVO2.pageIndex}'/>">
</form>
<%-- 예약취소 폼 --%>
<form name="cancelForm" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="searchKeyword" value="">
</form>