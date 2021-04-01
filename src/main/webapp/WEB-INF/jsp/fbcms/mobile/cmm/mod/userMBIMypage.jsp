<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.com.cmm.service.Globals" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script src="/js/fbcms/mobile/slick.js"></script>
<script>

$(function() {
	//의료진
	$('.staff_list').slick({
		arrows: false,
		infinite: false,
		speed: 300,
		slidesToShow: 1.8,
		slidesToScroll: 1,
	});
})

function funcFcanecl(ID) {
	var object = {
			url : "/user/cmm/mod/DeleteDrLike.do",
			data : {"ID":ID},
			fnSuccess : function(data) {
				alert("관심의료진 설정이 해제되었습니다.");
				$("#"+ID).remove();
				
			}
		}
		fnAjax(object);
}
/* ********************************************************
 * 상세 처리 함수
 ******************************************************** */
function selectCSTDetail(nttId) {
	document.listForm.nttId.value = nttId;
	document.listForm.action = "<c:url value='/user/cts/cst/selectCSTDetail.do'/>";
  	document.listForm.submit();
}
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
 * 취소 처리 함수
 ******************************************************** */
function fnCancel(searchKeyword) {
	if(confirm("예약을 취소하시겠습니까?\n예약이 취소되면 예약내역에서도 삭제됩니다")){
		var object = {
				url : "/user/cmm/mod/updateReservationCancel.do",
				data : {"searchKeyword":searchKeyword},
				fnSuccess : function(data) {
					$("#"+searchKeyword).remove();
					location.href= "/user/cmm/mod/userMBIMypageView.do";
				}
			}
			fnAjax(object);
		}
}
/*********************************************************
 * 검진예약 이동 함수
 ******************************************************** */
 function fnMove() {
	document.moveForm.action = "/user/cts/rsv/userRSVList.do";
	document.moveForm.submit();
}
</script>

<!-- container -->
<div id="container">
	<div class="no_con02">
		<h3 class="my_tit mar20">MY PAGE</h3>
		<p class="myp mar20">
			<span><strong>${loginVO.name}</strong>님</span>
			<a href="/user/cmm/mod/identifyMBI.do">회원정보 수정</a>
		</p>
		
		<!-- 진료 -->
		<div class="se_box mar20 mt40">
			<h4 class="con_in_tit02 mb20">진료 예약현황</h4>
			<div class="box_blue mb30">
				<ul>
					<li>진료예약 수정은 진료일 2일 전까지 가능합니다</li>
					<li>진료예약 취소는 진료일 1일 전까지 가능합니다</li>
					<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
				</ul>
			</div>
			
			<ul class="tbox treserv">
				<c:forEach items="${reservationList}" var="reservationInfo"	varStatus="status">
					<li class="t_reservation" id="${reservationInfo.APPO_NO}">
						<a href="javascript:void(0);">
							<strong><c:out value='${reservationInfo.MEDI_SBJ_NM}'/></strong>
							<span class="c_blue"><c:out value='${reservationInfo.DR_NM}' /></span>
							<span class="date"><c:out value='${fn:substring(reservationInfo.APPO_DT, 0, 4)}.${fn:substring(reservationInfo.APPO_DT, 4, 6)}.${fn:substring(reservationInfo.APPO_DT, 6, 8)}' /> <c:out value='${fn:substring(reservationInfo.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo.APPO_TIME, 2, 4)}' /></span>
						</a>
						<div class="btn_in">
							<fmt:parseDate value="${today}" var="today1" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${today1.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${reservationInfo.APPO_DT}" var="targetDt" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${targetDt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							<c:if test="${endDate - strDate gt 4}">
								<a href="javascript:fnReservationDetail01('${reservationInfo.APPO_NO }')" class="btn bxs bblue">예약수정</a>
							</c:if>
							<c:if test="${endDate - strDate gt 0}">
								<a href="javascript:fnCancel('${reservationInfo.APPO_NO}');" class="btn bxs ml5">예약취소</a>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
			<a href="/user/cts/rsv/userRSVList.do" class="search_more02">더보기</a>
		</div>

		<!-- 검진 -->
		<div class="se_box mt40 mar20">
			<h4 class="con_in_tit02 mb20">검진 예약현황</h4>
			<div class="box_blue mb30">
				<ul>
					<li>검진예약 수정은 진료일 5일 전까지 가능합니다</li>
					<li>검진예약 취소는 진료일 1일 전까지 가능합니다</li>
					<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, <a href="tel:1577-7502">1577-7502</a>로 전화 후 예약변경이 가능합니다.</li>
				</ul>
			</div>

			<ul class="tbox treserv">
				<c:forEach items="${reservationList2}" var="reservationInfo2"	varStatus="status">
					<li class="t_reservation" id="${reservationInfo2.APPO_NO}">
						<a href="/user/cuc/ccc/infoCCC.do">
							<strong><c:out value='${reservationInfo2.EXMN_PROG_NM}'/></strong>
							<span class="date"><c:out value='${fn:substring(reservationInfo2.APPO_DT, 0, 4)}.${fn:substring(reservationInfo2.APPO_DT, 4, 6)}.${fn:substring(reservationInfo2.APPO_DT, 6, 8)}' /> <c:out value='${fn:substring(reservationInfo2.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo2.APPO_TIME, 2, 4)}' /></span>
						</a>
						<div class="btn_in">
							<fmt:parseDate value="${today}" var="today1" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${today1.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${reservationInfo2.APPO_DT}" var="targetDt" pattern="yyyyMMdd"/>
							<fmt:parseNumber value="${targetDt.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
							<c:if test="${endDate - strDate gt 4}">
								<a href="javascript:fnReservationDetail02('${reservationInfo2.APPO_NO }')" class="btn bxs bblue">예약수정</a>
							</c:if>
							<c:if test="${endDate - strDate gt 0}">
								<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs ml5">예약취소</a>
							</c:if>
						</div>
						
						<div class="btn_in">
							<a href="javascript:fnReservationDetail02('${reservationInfo2.APPO_NO }')" class="btn bxs bblue">예약수정</a>
							<a href="javascript:fnCancel('${reservationInfo2.APPO_NO}');" class="btn bxs ml5">예약취소</a>
						</div>
					</li>
				</c:forEach>
			</ul>

			<a href="javascript:fnMove()" class="search_more02">더보기</a>
		</div>
		
		<!-- 의료상담 -->
		<div class="se_box mt40 mar20">
			<h4 class="con_in_tit02 mb20">의료상담 현황</h4>
			<ul class="tbox tboxlist mar0">
				<c:forEach items="${bList}" var="boardList"	varStatus="status">
					<li class="fw_500">
						<a href="#none" onclick="javascript:selectCSTDetail('<c:out value="${boardList.nttId}"/>')">
							<strong><c:out value='${fn:substring(boardList.nttSj, 0, 100)}'/></strong>
							<span class="date">${boardList.frstRegisterPnttm}</span>
							<span class="state">
								<c:choose>
									<c:when test="${boardList.replyAt = 'Y'}">
										<span class="c_blue">답변완료</span>
									</c:when>
									<c:otherwise>
										대기
									</c:otherwise>
								</c:choose>
							</span>
						</a>
					</li>
				</c:forEach>
			</ul>

			<a href="/user/cts/cst/selectCSTList.do" class="search_more02">더보기</a>
		</div>

		<!-- 관심 의료진 -->
		<div class="se_box mt40">
			<h4 class="con_in_tit02 mb20 mar20">관심 의료진</h4>
			<div class="staff_list">
				<c:forEach items="${dList}" var="DR" varStatus="status">
					<div id="${DR.DR_ID}">
						<img src="<c:url value='/getImage/${DR.PC_IMG_ATCH_NO}'/>" alt="">
						<p>
							<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong>
							<span id="drFie">${DR.FIELD_CT}</span>
						</p>
						<div>
							<a href="javascript:fnDrDetail('${DR.DR_ID}')" class="more">자세히 보기 +
								<form method="post" action="">
									<input type="hidden" name="index" value="<c:out value="${status.index}" />">
								</form>
							</a>
							<c:if test="${fn:contains(DR.ADD_OPEN_SET_CD, '02') and DR.MEDI_SBJ_CD ne 'AO'}">
								<a href="/user/cts/rsv/userRSVClinic.do" class="reserved">예약하기</a>
							</c:if>
							<a href="javascript:funcFcanecl('${DR.DR_ID }')" class="save check"></a>
						</div>
					</div>
				</c:forEach>
			</div>
			<a href="/user/hpm/smt/SMTPage.do" class="search_more03">의료진 소개 바로가기</a>
		</div>
		
		<!-- 의료진 popup s-->
		<jsp:include page="/WEB-INF/jsp/fbcms/mobile/spc/cti/drdetail.jsp" />
		<!-- 의료진 popup e-->
		
		<form name="listForm" action="" method="post">
			<input type="hidden" name="nttId" value="0">
		</form>
		
		<%-- 상세페이지 이동 폼 --%>
		<form name="detailForm01" method="post" action="">
			<input type="hidden" name="APPO_GUBN_CD" value="01">
			<input type="hidden" name="searchKeyword" value="<c:out value=''/>">
		</form>
		<form name="detailForm02" method="post" action="">
			<input type="hidden" name="APPO_GUBN_CD" value="02">
			<input type="hidden" name="searchKeyword" value="<c:out value=''/>">
		</form>
		<%-- 예약취소 폼 --%>
		<form name="cancelForm" method="post" action="">
			<input type="hidden" name="searchKeyword" value="">
		</form>
		<%-- 검진 이동 롬 --%>
		<form name="moveForm" method="post" action="">
			<input type="hidden" name="APPO_GUBN_CD" value="02">
		</form>

