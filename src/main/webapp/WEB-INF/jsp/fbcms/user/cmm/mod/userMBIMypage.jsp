<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.com.cmm.service.Globals" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>
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



		<!-- contents s -->
		<div class="contents w1200">
			<h3 class="my_tit">MY PAGE</h3>
			<p class="myp">
				<span><strong>${Name}</strong>님</span>
				<a href="/user/cmm/mod/identifyMBI.do">회원정보 수정</a>
			</p>

			<!-- 진료 -->
			<div class="se_box mt60">
				<h4 class="con_in_tit02">진료 예약현황</h4>
				<div class="box_blue mb30">
					<ul>
						<li>진료예약 수정은 진료일 5일 전까지 가능합니다</li>
						<li>진료예약 취소는 진료일 1일 전까지 가능합니다</li>
						<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, 1577-7502로 전화 후 예약변경이 가능합니다.</li>
					</ul>
				</div>

				<div class="tbox tbox03">
					<table>
						<caption>진료과 의료진 예약일시 수정,취소로 이루어진 리스트</caption>
						<colgroup>
						<col style="width:15%">
						<col>
						<col style="width:15%">
						<col style="width:20%">
						<col style="width:20%">
						</colgroup><thead>
							<tr>
								<th scope="col">신청일</th>
								<th scope="col">진료과</th>
								<th scope="col">의료진</th>
								<th scope="col">예약일시</th>
								<th scope="col">수정/취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservationList}" var="reservationInfo"	varStatus="status">
								<tr class="t_reservation" id="${reservationInfo.APPO_NO}">
									<td><fmt:formatDate value="${reservationInfo.FIRST_ADD_DT}" pattern="yyyy.MM.dd"/></td>
									<td class="t_left"><a href="javascript:void(0);"><c:out value='${reservationInfo.MEDI_SBJ_NM}'/> </a></td>
									<td><c:out value='${reservationInfo.DR_NM}' /></td>
									<td class="t_date">
										<c:out value='${fn:substring(reservationInfo.APPO_DT, 0, 4)}.${fn:substring(reservationInfo.APPO_DT, 4, 6)}.${fn:substring(reservationInfo.APPO_DT, 6, 8)}' />
										<em><c:out value='${fn:substring(reservationInfo.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo.APPO_TIME, 2, 4)}' /></em>
									</td>
									<td>
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
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<a href="/user/cts/rsv/userRSVList.do" class="search_more02">더보기</a>
			</div>

			<!-- 검진 -->
			<div class="se_box mt80">
				<h4 class="con_in_tit02">검진 예약현황</h4>
				<div class="box_blue mb30">
					<ul>
						<li>검진예약 수정은 진료일 5일 전까지 가능합니다</li>
						<li>검진예약 취소는 진료일 1일 전까지 가능합니다</li>
						<li>상담간호사가 전화를 드려 예약을 확정한 건에 대해서는 홈페이지에서 예약수정이 불가하며, 1577-7502로 전화 후 예약변경이 가능합니다.</li>
					</ul>
				</div>

				<div class="tbox tbox03">
					<table>
						<caption>검진 예약일시 수정,취소로 이루어진 리스트</caption>
						<colgroup>
						<col style="width:15%">
						<col>
						<col style="width:20%">
						<col style="width:20%">
						</colgroup><thead>
							<tr>
								<th scope="col">신청일</th>
								<th scope="col">검진프로그램</th>
								<th scope="col">예약일시</th>
								<th scope="col">수정/취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservationList2}" var="reservationInfo2"	varStatus="status">
								<tr class="t_reservation" id="${reservationInfo2.APPO_NO}">
									<td>
										<%-- <fmt:parseDate value="${reservationInfo2.FIRST_ADD_DT}" var="today2" pattern="EEE MMM dd HH:mm:ss z yyyy"/> --%>
										<fmt:formatDate value="${reservationInfo2.FIRST_ADD_DT}" pattern="yyyy.MM.dd"/>
									</td>
									<td class="t_left"><a href="/user/cuc/ccc/infoCCC.do"><c:out value='${reservationInfo2.EXMN_PROG_NM}'/> </a></td>
									<td class="t_date">
										<c:out value='${fn:substring(reservationInfo2.APPO_DT, 0, 4)}.${fn:substring(reservationInfo2.APPO_DT, 4, 6)}.${fn:substring(reservationInfo2.APPO_DT, 6, 8)}' />
										<em><c:out value='${fn:substring(reservationInfo2.APPO_TIME, 0, 2)}:${fn:substring(reservationInfo2.APPO_TIME, 2, 4)}' /></em>
									</td>
									<td>
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
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<a href="javascript:fnMove()" class="search_more02">더보기</a>
			</div>

			<!-- 의료상담 -->
			<div class="se_box mt80">
				<h4 class="con_in_tit02">의료상담 현황</h4>
				<div class="tbox">
					<table>
						<caption>번호 제목 상태 등록일자로 이루어진 리스트</caption>
						<colgroup><col style="width:15%">
						<col>
						<col style="width:15%">
						<col style="width:15%">
						</colgroup><thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">등록일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bList}" var="boardList"	varStatus="status">
								<c:if test="${status.count lt 4}">
								<tr>
									<td>${fn:length(bList) - status.count + 1}</td>
									<td class="t_hidden">
										<a href="#none" onclick="javascript:selectCSTDetail('<c:out value="${boardList.nttId}"/>')"><c:out value='${fn:substring(boardList.nttSj, 0, 100)}'/></a>
									</td>
									<td>
										<c:choose>
											<c:when test="${boardList.replyAt eq 'Y'}">
												<span class="c_blue">답변완료</span>
											</c:when>
											<c:otherwise>
												대기
											</c:otherwise>
										</c:choose>
									</td>
									<td class="t_date">${boardList.frstRegisterPnttm}</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<a href="/user/cts/cst/selectCSTList.do" class="search_more02">더보기</a>
			</div>

			<!-- 관심 의료진 -->
			<div class="se_box mt80">
				<h4 class="con_in_tit02">관심 의료진</h4>

				<div class="staff_list">
					<c:forEach items="${dList}" var="DR" varStatus="status">
						<div id="${DR.DR_ID}">
							<img src="<c:url value='/getImage/${DR.PC_IMG_ATCH_NO}'/>" alt="">
							<p>
								<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong> <span id="drFie">${DR.FIELD_CT}</span>
								<input type="hidden" id="MEDI_SBJ_CD" value="${DR.MEDI_SBJ_CD}">
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
					<div class="go">
						<a href="/user/hpm/smt/SMTPage.do">의료진 소개 <br>바로가기</a>
					</div>
				</div>
			</div>

		</div>
		<!-- //contents e -->
		
		<!-- 의료진 popup s-->
		<jsp:include page="/WEB-INF/jsp/fbcms/user/spc/cti/drdetail.jsp" />
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

