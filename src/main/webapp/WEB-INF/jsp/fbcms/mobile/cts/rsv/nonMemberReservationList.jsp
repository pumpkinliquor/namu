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
	if(document.detailForm01.pageIndex.value === '') {
		document.detailForm01.pageIndex.value = 1;
	}
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
/*********************************************************
 * 
 ******************************************************** */
 $(document).ready(function(){
	$("#gubn01").on("click",function(){
		$("#gubn01page").css("display","block");
		$("#gubn02page").css("display","none");
	});
	$("#gubn02").on("click",function(){
		$("#gubn02page").css("display","block");
		$("#gubn01page").css("display","none");
	});
})
 
</script>
<!-- contents s -->
<div class="contents">

	<ul class="tab_list02">
		<!-- tab -->
	<c:if test="${appointmentVO.APPO_GUBN_CD ne '02'}">
		<li class="selected"><a href="javascript:void(0);" id="gubn01" title="선택된 탭">진료예약</a></li>
		<li><a href="javascript:void(0);" id="gubn02">검진예약</a></li>
	</c:if>
	<c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">
		<li><a href="javascript:void(0);" id="gubn01">진료예약</a></li>
		<li class="selected"><a href="javascript:void(0);" id="gubn02" title="선택된 탭">검진예약</a></li>
	</c:if>
	</ul>

<!-- 진료예약 s -->
<c:if test="${appointmentVO.APPO_GUBN_CD ne '02'}">
	<div id="gubn01page" style="display:block;">
	<div class="tab_box pd0">
		<!-- //tab contents1 s -->
		<div class="box_blue mt40 mar20">
			<ul>
				<li>진료예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>진료예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
			</ul>
		</div>

		<ul class="tbox treserv">
			<c:forEach items="${reservationList}" var="reservationInfo"	varStatus="status">
			<li>
				<a href="/user/hpm/smt/SMTPage.do?code=${reservationInfo.MEDI_SBJ_CD}">
					<strong><c:out value='${reservationInfo.MEDI_SBJ_NM}'/></strong>
					<span class="c_blue"><c:out value='${reservationInfo.DR_NM}' /></span>
					<span class="date">
						<c:out value='${fn:substring(reservationInfo.APPO_DT, 0, 4)}.${fn:substring(reservationInfo.APPO_DT, 4, 6)}.${fn:substring(reservationInfo.APPO_DT, 6, 8)}' />
						<em><c:out value='${fn:substring(reservationInfo.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo.APPO_TIME, 2, 4)}' /></em>
					</span>
				</a>
				<div class="btn_in">
					<fmt:parseDate value="${today}" var="today1" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${today1.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
					<fmt:parseDate value="${reservationInfo.APPO_DT}" var="targetDt" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${targetDt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
					<c:if test="${endDate - strDate gt 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnReservationDetail01('${reservationInfo.APPO_NO }')" class="btn bxs bblue">예약수정</a>
					</c:if>
					<c:if test="${endDate - strDate gt 0 && endDate - strDate gt 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs ml5">예약취소</a>
					</c:if>
					<c:if test="${endDate - strDate gt 0 && endDate - strDate le 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs">예약취소</a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>	
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage1"/>
		</div>
	</div>
	</div>
	<!-- //진료예약 e -->
	
	<!-- //검진예약 s -->
	<div id="gubn02page" style="display:none;">
	<div class="tab_box pd0"><div class="box_blue mt40 mar20">
			<ul>
				<li>검진예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>검진예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
			</ul>
		</div>
		
		<ul class="tbox treserv">
			<c:forEach items="${reservationList2}" var="reservationInfo2"	varStatus="status">
			<li>
				<a href="/user/cuc/ccc/infoCCC.do">
					<strong><c:out value='${reservationInfo2.EXMN_PROG_NM}'/></strong>
					<span class="date">
					<c:out value='${fn:substring(reservationInfo2.APPO_DT, 0, 4)}.${fn:substring(reservationInfo2.APPO_DT, 4, 6)}.${fn:substring(reservationInfo2.APPO_DT, 6, 8)}' />
					<em><c:out value='${fn:substring(reservationInfo2.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo2.APPO_TIME, 2, 4)}' /></em>
					</span>
				</a>
				<div class="btn_in">
					<fmt:parseDate value="${today}" var="today2" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${today2.time / (1000*60*60*24)}" integerOnly="true" var="strDate2"></fmt:parseNumber>
					<fmt:parseDate value="${reservationInfo2.APPO_DT}" var="targetDt2" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${targetDt2.time / (1000*60*60*24)}" integerOnly="true" var="endDate2"></fmt:parseNumber>
					<c:if test="${endDate2 - strDate2 gt 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnReservationDetail02('${reservationInfo2.APPO_NO }')" class="btn bxs bblue">예약수정</a>
					</c:if>
					<c:if test="${endDate2 - strDate2 gt 0 && endDate2 - strDate2 gt 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs ml5">예약취소</a>
					</c:if>
					<c:if test="${endDate2 - strDate2 gt 0 && endDate2 - strDate2 le 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs">예약취소</a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>

		
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fnSelectLinkPage2"/>
		</div>
		<!-- //paginate -->
	</div>
	</div>
	<!-- //tab contents2 e -->
</c:if>
<c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">	
	<div id="gubn01page" style="display:none;">
	<div class="tab_box pd0">
		<!-- //tab contents1 s -->
		<div class="box_blue mt40 mar20">
			<ul>
				<li>진료예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>진료예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
			</ul>
		</div>

		<ul class="tbox treserv">
			<c:forEach items="${reservationList}" var="reservationInfo"	varStatus="status">
			<li>
				<a href="/user/hpm/smt/SMTPage.do?code=${reservationInfo.MEDI_SBJ_CD}">
					<strong><c:out value='${reservationInfo.MEDI_SBJ_NM}'/></strong>
					<span class="c_blue"><c:out value='${reservationInfo.DR_NM}' /></span>
					<span class="date">
						<c:out value='${fn:substring(reservationInfo.APPO_DT, 0, 4)}.${fn:substring(reservationInfo.APPO_DT, 4, 6)}.${fn:substring(reservationInfo.APPO_DT, 6, 8)}' />
						<em><c:out value='${fn:substring(reservationInfo.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo.APPO_TIME, 2, 4)}' /></em>
					</span>
				</a>
				<div class="btn_in">
					<fmt:parseDate value="${today}" var="today1" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${today1.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
					<fmt:parseDate value="${reservationInfo.APPO_DT}" var="targetDt" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${targetDt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
					<c:if test="${endDate - strDate gt 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnReservationDetail01('${reservationInfo.APPO_NO }')" class="btn bxs bblue">예약수정</a>
					</c:if>
					<c:if test="${endDate - strDate gt 0 && endDate - strDate gt 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs ml5">예약취소</a>
					</c:if>
					<c:if test="${endDate - strDate gt 0 && endDate - strDate le 4 and reservationInfo.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs">예약취소</a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>	
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage1"/>
		</div>
	</div>
	</div>
	<!-- //진료예약 e -->
	
	<!-- //검진예약 s -->
	<div id="gubn02page" style="display:block;">
	<div class="tab_box pd0">
		<div class="box_blue mt40 mar20">
			<ul>
				<li>검진예약 수정은 진료일 5일 전까지 가능합니다</li>
				<li>검진예약 취소는 진료일 1일 전까지 가능합니다</li>
				<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
			</ul>
		</div>
		
		<ul class="tbox treserv">
			<c:forEach items="${reservationList2}" var="reservationInfo2"	varStatus="status">
			<li>
				<a href="/user/cuc/ccc/infoCCC.do">
					<strong><c:out value='${reservationInfo2.EXMN_PROG_NM}'/></strong>
					<span class="date">
					<c:out value='${fn:substring(reservationInfo2.APPO_DT, 0, 4)}.${fn:substring(reservationInfo2.APPO_DT, 4, 6)}.${fn:substring(reservationInfo2.APPO_DT, 6, 8)}' />
					<em><c:out value='${fn:substring(reservationInfo2.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo2.APPO_TIME, 2, 4)}' /></em>
					</span>
				</a>
				<div class="btn_in">
					<fmt:parseDate value="${today}" var="today2" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${today2.time / (1000*60*60*24)}" integerOnly="true" var="strDate2"></fmt:parseNumber>
					<fmt:parseDate value="${reservationInfo2.APPO_DT}" var="targetDt2" pattern="yyyyMMdd"/>
					<fmt:parseNumber value="${targetDt2.time / (1000*60*60*24)}" integerOnly="true" var="endDate2"></fmt:parseNumber>
					<c:if test="${endDate2 - strDate2 gt 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnReservationDetail02('${reservationInfo2.APPO_NO }')" class="btn bxs bblue">예약수정</a>
					</c:if>
					<c:if test="${endDate2 - strDate2 gt 0 && endDate2 - strDate2 gt 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs ml5">예약취소</a>
					</c:if>
					<c:if test="${endDate2 - strDate2 gt 0 && endDate2 - strDate2 le 4 and reservationInfo2.APPO_STAT_CD eq 01}">
						<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs">예약취소</a>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>

		
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo2}" type="image" jsFunction="fnSelectLinkPage2"/>
		</div>
		<!-- //paginate -->
	</div>
	</div>
	<!-- //tab contents2 e -->
</c:if>
</div>
<!-- //contents e -->

<%-- 상세페이지 이동 폼 --%>
<form name="detailForm01" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="APPO_GUBN_CD" value="01">
	<input type="hidden" name="searchKeyword" value="<c:out value='${appointmentVO1.searchKeyword}'/>">
    <input type="hidden" name="pageIndex" value="<c:out value='${appointmentVO1.pageIndex}'/>">
	<input type="hidden" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
	<input type="hidden" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
</form>
<form name="detailForm02" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="APPO_GUBN_CD" value="02">
	<input type="hidden" name="searchKeyword" value="<c:out value='${appointmentVO2.searchKeyword}'/>">
    <input type="hidden" name="pageIndex" value="<c:out value='${appointmentVO2.pageIndex}'/>">
	<input type="hidden" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
	<input type="hidden" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
</form>
<%-- 예약취소 폼 --%>
<form name="cancelForm" method="post" action="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="searchKeyword" value="">
	<input type="hidden" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
	<input type="hidden" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
</form>