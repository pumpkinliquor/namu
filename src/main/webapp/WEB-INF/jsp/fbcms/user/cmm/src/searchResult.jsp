<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<script type="text/javascript" src="/js/fbcms/user/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>

		<div class="s_default">
			<p>질환명을 검색하여 질병정보, 진료과<span>&middot;</span>센터를 확인하세요</p>
			<div>
				<form action="/user/cmm/src/search.do" method="post" name="searchForm">
					<input type="hidden" name="lastTabIndex" value="<c:out value='${searchVO.lastTabIndex}'/>">
					<input type="hidden" name="searchCondition" value="1">
					<input type="text" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력해주세요 (예:담석)" value="${searchVO.searchKeyword}">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<input type="submit" value="검색버튼">
				</form>
			</div>
		</div>

		<!-- contents s -->
		<div class="contents w1200">
			<h3 class="search_tit">검색결과</h3>
			<ul class="search_tab tab_list"><!-- tab -->
				<li id="liTapAll"><a href="javascript:fnTapAll();" id="fnTapAll">전체<span id="cntAll">(0)</span></a></li>
				<li id="liTap1"><a href="javascript:fnTap1();" id="fnTap1">진료과<span>(${fn:length(resData.sbmList)})</span></a></li>
				<li id="liTap2"><a href="javascript:fnTap2();" id="fnTap2">특화센터<span id="cntTap2">(${listCnt})</span></a></li>
				<li id="liTap3"><a href="javascript:fnTap3();" id="fnTap3">의료진<span>(${fn:length(resData.doctorList)})</span></a></li>
				<li id="liTap4"><a href="javascript:fnTap4();" id="fnTap4">건강정보<span>(${bssListTotCnt})</span></a></li>
				<li id="liTap5"><a href="javascript:fnTap5();" id="fnTap5">자주하는 질문<span>(${fn:length(resData.faqList)})</span></a></li>
			</ul>
			<div class="all_wrap">
				<h4 class="con_in_tit12">진료과</h4><!-- 진료과 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.sbmList) ne 0}">
					<ul class="namuh_box search_namuh">
						<c:forEach items="${resData.sbmList}" var="sbm" varStatus="status">
							<c:if test="${status.count lt 5}">
								<li class="${sbm.bgClass}">
									<h6>${sbm.mngNm}</h6>
									<p><a href="/user/hpm/smt/SMTPage.do?code=${sbm.mngCd}">더보기 +</a></p>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					</c:if>
					<c:if test="${fn:length(resData.sbmList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="javascript:fnTap1()" class="search_more">더보기</a>
				</div>
	
				<h4 class="con_in_tit12">특화센터</h4><!-- 특화센터 -->
				<div class="se_box">
					<c:set var="listCnt" value="0" />
					<c:if test="${fn:length(resData.centerList) ne 0}">
						<c:set var="dplcKey" value="${spc.mngCd}" />
						<c:forEach items="${resData.centerList}" var="spc" varStatus="status">
							<c:if test="${listCnt lt 2}">
								<c:if test="${dplcKey ne spc.mngCd}">
									<div class="search_center">
										<div>
											<p>
												<img src="/images/fbcms/user/img_se_center${fn:substring(spc.mngCd, 4, 6)}.png" alt="${spc.mngNm}">
											</p>
											<div>
												<h5>${spc.mngNm}</h5>
												<a href="/user/spc/cti/selectCTIInfo.do?custom1=${spc.mngCd}" class="center_go">바로가기</a>
											</div>
										</div>
										<c:set var="dplcKey" value="${spc.mngCd}" />
										<div class="tag_list">
											<c:forEach items="${resData.centerList}" var="spc2">
												<c:if test="${dplcKey eq spc2.mngCd and spc2.delYn ne 'Y' and not empty spc2.mngSeq}">
													<a href="/user/spc/cti/selectClinicInfo.do?MNG_SEQ=${spc2.mngSeq}&MNG_CD=${spc2.mngCd}">${spc2.clinicNm}</a>
												</c:if>
											</c:forEach>
										</div>
										<c:set var="listCnt" value="${listCnt + 1}" />
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
					
					<c:if test="${fn:length(resData.centerList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="javascript:fnTap2();" class="search_more">더보기</a>
				</div>
	
				<h4 class="con_in_tit12">의료진</h4><!-- 의료진 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.doctorList) ne 0}">
					<div class="staff_list">
						<c:forEach items="${resData.doctorList}" var="DR" varStatus="status">
						<c:if test="${status.count lt 5}">
							<div>
								<img id="drImg" src="<c:url value='/getImage/${DR.mobileImgAtchNo}'/>" alt="${DR.drNm}">
								<p>
									<strong id="drName">${DR.drNm}<span id="drPo">${DR.positionCt}</span></strong> <span id="drFie">${DR.fieldCt}</span>
									<input type="hidden" id="MEDI_SBJ_CD" value="${DR.mediSbjCd}">
								</p>
								<div>
									<a href="javascript:fnDrDetail('${DR.drId}');" class="more">자세히 보기 +
										<form method="post" action="/user/hpm/smt/SMTPage.do">
										<input type="hidden" name="index" value="<c:out value="${status.index}" />">
										</form>
									</a>
									<c:if test="${fn:contains(DR.addOpenSetCd, '02') and DR.mediSbjCd ne 'AO'}">
									<c:url value="/user/cts/rsv/userRSVClinic.do" var="rsvUrl">
									  <c:param name="DPT_CD" value="${DR.mediSbjCd}" />
									  <c:param name="DR_ID" value="${DR.drId}" />
									  <c:param name="DR_NM" value="${DR.drNm}" />
									</c:url>
									<a href="${rsvUrl}" class="reserved">예약하기</a>
									</c:if>
									<c:choose>
										<c:when test="${favoritesDRList ne null}">
										
											<c:forEach items="${favoritesDRList}" var="faDR"
												varStatus="sts">
											
												<c:choose>
													<c:when test="${faDR.DR_ID eq DR.DR_ID and faDR.LIKE_YN eq 'Y' }">
														<a href="javascript:void(0);" class="save check">
															<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
															<input type="hidden" value="Y" class="check">
														</a>
													</c:when>						
													<c:otherwise>
														<a href="javascript:void(0);" class="save">
															<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
															<input type="hidden" value="N" class="check">
														</a>
													</c:otherwise> 
												</c:choose>
											</c:forEach>
				
										</c:when>
										
										<c:otherwise>
										<a href="javascript:void(0);" class="save">
											<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
											<input type="hidden" value="N" class="check">
										</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:if>
						</c:forEach>
					</div>
					</c:if>
					<c:if test="${fn:length(resData.doctorList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="javascript:fnTap3();" class="search_more">더보기</a>
				</div>
	
				<h4 class="con_in_tit12">건강정보</h4><!-- 건강정보 -->
				<div class="se_box">
					<div class="tbox tdetail tsearch">
						<table>
							<caption>리스트 페이지</caption>
							<col style="width:20%">
							<col>
							<tbody>
							<c:forEach items="${resData.boardList}" var="resultInfo" varStatus="status">
							<c:if test="${status.count lt 5}">
								<tr>
									<th scope="row">${resultInfo.bbsNm}</th>
									<td><a href="#none" onclick="javascript:selectDSIDetail('<c:out value="${resultInfo.nttId}"/>', '<c:out value="${resultInfo.bbsId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
								</tr>
							</c:if>
							</c:forEach>
							</tbody>
						</table>
					</div>
	
					<c:if test="${fn:length(resData.boardList) eq 0}">
					<div class="box_none02">
						<p>검색결과가 없습니다</p>
					</div>
					</c:if>
					<a href="javascript:fnTap4();" class="search_more">더보기</a>
				</div>
	
				<h4 class="con_in_tit12">자주하는 질문</h4><!-- 자주하는 질문 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.faqList) ne 0}">
					<dl class="faq_list">
						<c:forEach items="${resData.faqList}" var="resultInfo" varStatus="status">
						<c:if test="${status.count lt 5}">
							<dt><span>Q</span>
								<c:out value='${fn:substring(resultInfo.qestnSj, 0, 100)}'/>
							</dt>
							<dd><span>A</span>
								<p><c:out value="${fn:replace(resultInfo.answerCn , crlf , '<br/>')}" escapeXml="false" /></p>
							</dd>
						</c:if>
						</c:forEach>
					</dl>
					</c:if>
					<a href="javascript:fnTap5();" class="search_more">더보기</a>
					<c:if test="${fn:length(resData.faqList) eq 0}">
					<div class="box_none02">
						<p>검색결과가 없습니다</p>
					</div>
					</c:if>
				</div>
			</div>

			<div class="clinic_wrap">
				<h4 class="con_in_tit12">진료과</h4><!-- 진료과 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.sbmList) ne 0}">
					<ul class="namuh_box search_namuh">
						<c:forEach items="${resData.sbmList}" var="sbm" varStatus="status">
								<li class="${sbm.bgClass}">
									<h6>${sbm.mngNm}</h6>
									<p><a href="/user/hpm/smt/SMTPage.do?code=${sbm.mngCd}">더보기 +</a></p>
								</li>
						</c:forEach>
					</ul>
					</c:if>
					<c:if test="${fn:length(resData.sbmList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="/user/hpm/smt/SMTPage.do" class="search_more">더보기</a>
				</div>
			</div>
			
			<div class="tek_wrap">
				<h4 class="con_in_tit12">특화센터</h4><!-- 특화센터 -->
				<div class="se_box">
					<c:set var="listCnt" value="0" />
					<c:if test="${fn:length(resData.centerList) ne 0}">
						<c:set var="dplcKey" value="${spc.mngCd}" />
						<c:forEach items="${resData.centerList}" var="spc" varStatus="status">
								<c:if test="${dplcKey ne spc.mngCd}">
									<div class="search_center">
										<div>
											<p>
												<img src="/images/fbcms/user/img_se_center${fn:substring(spc.mngCd, 4, 6)}.png" alt="${spc.mngNm}">
											</p>
											<div>
												<h5>${spc.mngNm}</h5>
												<a href="/user/spc/cti/selectCTIInfo.do?custom1=${spc.mngCd}" class="center_go">바로가기</a>
											</div>
										</div>
										<c:set var="dplcKey" value="${spc.mngCd}" />
										<div class="tag_list">
											<c:forEach items="${resData.centerList}" var="spc2">
												<c:if test="${dplcKey eq spc2.mngCd and spc2.delYn ne 'Y' and not empty spc2.mngSeq}">
													<a href="/user/spc/cti/selectClinicInfo.do?MNG_SEQ=${spc2.mngSeq}&MNG_CD=${spc2.mngCd}">${spc2.clinicNm}</a>
												</c:if>
											</c:forEach>
										</div>
										<c:set var="listCnt" value="${listCnt + 1}" />
									</div>
								</c:if>
						</c:forEach>
					</c:if>
					
					<c:if test="${fn:length(resData.centerList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001" class="search_more">더보기</a>
				</div>
			</div>

			<div class="dr_wrap">
				<h4 class="con_in_tit12">의료진</h4><!-- 의료진 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.doctorList) ne 0}">
					<div class="staff_list">
						<c:forEach items="${resData.doctorList}" var="DR" varStatus="status">
							<div>
								<img id="drImg" src="<c:url value='/getImage/${DR.mobileImgAtchNo}'/>" alt="${DR.drNm}">
								<p>
									<strong id="drName">${DR.drNm}<span id="drPo">${DR.positionCt}</span></strong> <span id="drFie">${DR.fieldCt}</span>
									<input type="hidden" id="MEDI_SBJ_CD" value="${DR.mediSbjCd}">
								</p>
								<div>
									<a href="javascript:fnDrDetail('${DR.drId}');" class="more">자세히 보기 +
										<form method="post" action="/user/hpm/smt/SMTPage.do">
										<input type="hidden" name="index" value="<c:out value="${status.index}" />">
										</form>
									</a>
									<c:if test="${fn:contains(DR.addOpenSetCd, '02') and DR.mediSbjCd ne 'AO'}">
									<c:url value="/user/cts/rsv/userRSVClinic.do" var="rsvUrl">
									  <c:param name="DPT_CD" value="${DR.mediSbjCd}" />
									  <c:param name="DR_ID" value="${DR.drId}" />
									  <c:param name="DR_NM" value="${DR.drNm}" />
									</c:url>
									<a href="${rsvUrl}" class="reserved">예약하기</a>
									</c:if>
									<c:choose>
										<c:when test="${favoritesDRList ne null}">
										
											<c:forEach items="${favoritesDRList}" var="faDR"
												varStatus="sts">
											
												<c:choose>
													<c:when test="${faDR.DR_ID eq DR.DR_ID and faDR.LIKE_YN eq 'Y' }">
														<a href="javascript:void(0);" class="save check">
															<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
															<input type="hidden" value="Y" class="check">
														</a>
													</c:when>						
													<c:otherwise>
														<a href="javascript:void(0);" class="save">
															<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
															<input type="hidden" value="N" class="check">
														</a>
													</c:otherwise> 
												</c:choose>
											</c:forEach>
				
										</c:when>
										
										<c:otherwise>
										<a href="javascript:void(0);" class="save">
											<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
											<input type="hidden" value="N" class="check">
										</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
					</c:if>
					<c:if test="${fn:length(resData.doctorList) eq 0}">
						<div class="box_none02">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<a href="/user/hpm/smt/SMTPage.do?code=GI" class="search_more">더보기</a>
				</div>
			</div>


			<div class="health_wrap">
				<h4 class="con_in_tit12">건강정보</h4><!-- 건강정보 -->
				<div class="se_box">
					<div class="tbox tdetail tsearch">
						<table>
							<caption>리스트 페이지</caption>
							<col style="width:20%">
							<col>
							<tbody>
							<c:forEach items="${resData.boardList}" var="resultInfo" varStatus="status">
								<tr>
									<th scope="row">${resultInfo.bbsNm}</th>
									<td><a href="#none" onclick="javascript:selectDSIDetail('<c:out value="${resultInfo.nttId}"/>', '<c:out value="${resultInfo.bbsId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
	
					<c:if test="${fn:length(resData.boardList) eq 0}">
					<div class="box_none02">
						<p>검색결과가 없습니다</p>
					</div>
					</c:if>
					<a href="/user/hti/dsi/selectDSIList.do" class="search_more">더보기</a>
				</div>
				<!-- paginate -->
				<c:if test="${fn:length(resData.boardList) ne 0}">
				<div class="paginate">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
				</div>
				</c:if>
			</div>

			<div class="question_wrap">
				<h4 class="con_in_tit12">자주하는 질문</h4><!-- 자주하는 질문 -->
				<div class="se_box">
					<c:if test="${fn:length(resData.faqList) ne 0}">
					<dl class="faq_list">
						<c:forEach items="${resData.faqList}" var="resultInfo" varStatus="status">
							<dt><span>Q</span>
								<c:out value='${fn:substring(resultInfo.qestnSj, 0, 100)}'/>
							</dt>
							<dd><span>A</span>
								<p><c:out value="${fn:replace(resultInfo.answerCn , crlf , '<br/>')}" escapeXml="false" /></p>
							</dd>
						</c:forEach>
					</dl>
					</c:if>
					<a href="/user/cts/faq/selectFaqList.do" class="search_more">더보기</a>
					<c:if test="${fn:length(resData.faqList) eq 0}">
					<div class="box_none02">
						<p>검색결과가 없습니다</p>
					</div>
					</c:if>
				</div>
			</div>

		</div>

		<!-- 의료진 popup s-->
		<jsp:include page="/WEB-INF/jsp/fbcms/user/spc/cti/drdetail.jsp" />
		<!-- 의료진 popup e-->

<form name="listForm" method="POST" action="<c:url value='/user/hti/dsi/selectDSIList.do'/>"><!-- 검색 -->
	<input type="hidden" name="nttId" value="0">
	<input type="hidden" name="pageIndex" value="1" />
	<input type="hidden" name="searchCnd" value="0" />
	<input type="hidden" name="custom1" value=""/>
	<input type="hidden" name="lastTabIndex" value="<c:out value='${searchVO.lastTabIndex}'/>">
	<input type="hidden" name="bbsId" value="">
</form>
<form name="healthForm" method="post" action="">
	<input type="hidden" name="lastTabIndex" value="<c:out value='${searchVO.lastTabIndex}'/>">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
</form>
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기설정
 ******************************************************** */
$(document).ready(function() {
	$(".all_wrap").hide();
	$(".clinic_wrap").hide();
	$(".tek_wrap").hide();
	$(".dr_wrap").hide();
	$(".health_wrap").hide();
	$(".question_wrap").hide();
});
$(function() {

		
	/* faq */
	$('.faq_list').on('click', 'dt', function(event) {
		if($(this).next().is(':hidden')) {
			$('.faq_list dt').removeClass('active');
			$(this).addClass('active');
			$('.faq_list dt').next().slideUp();
			$(this).next().slideDown();
		} else {
			$('.faq_list dt').removeClass('active');
			$('.faq_list dt').next().slideUp();
		}
	});
	
	/* 더보기 */
	$('.btn_faq_more').click(function(e) {
		e.preventDefault();
		fnSelectLinkPage(pageIndex++);
	});

});

$(".save").on("click",function(){
	var s = $(this);
	var check = (s.children(".check")).val();
	if('${LoginVO.name}'==null||'${LoginVO.name}'==""){
		alert("로그인 해주세요!");
		window.location.href = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/user/lgn/sin/userLogin.do";
	}else{
		var USER_ID = '${LoginVO.id}';
		var DR_ID = $(this).children("input[type=hidden]").val();
		var obj={
			url:"/user/hpm/smt/likecheck.do"
			, data:{USER_ID:USER_ID,DR_ID:DR_ID,check:check}
			, dataType:"text"
			, fnSuccess: function(data){
				if(data=='Y'){
					s.addClass("check");
					s.children(".check").val('Y');
				} else if(data=='N') {
					s.removeClass("check");
					s.children(".check").val('N');
				} else {
				}
			},
			fnError:function(error){
			}
		}
		fnAjax(obj);
	}
});
$(".save").on("click",function(){
	var s = $(this);
	var check = (s.children(".check")).val();
	if('${LoginVO.name}'==null||'${LoginVO.name}'==""){
		alert("로그인 해주세요!");
		window.location.href = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/user/lgn/sin/userLogin.do";
	}else{
		var USER_ID = '${LoginVO.id}';
		var DR_ID = $(this).children("input[type=hidden]").val();
		var obj={
			url:"/user/hpm/smt/likecheck.do"
			, data:{USER_ID:USER_ID,DR_ID:DR_ID,check:check}
			, dataType:"text"
			, fnSuccess: function(data){
				if(data=='Y'){
					s.addClass("check");
					s.children(".check").val('Y');
				} else if(data=='N') {
					s.removeClass("check");
					s.children(".check").val('N');
				} else {
				}
			},
			fnError:function(error){
			}
		}
		fnAjax(obj);
	}
});
$(".reserved").on("click",function(){
	if('${LoginVO.name}'==null||'${LoginVO.name}'==""){
		alert("로그인 해주세요!");
		window.location.href = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/user/lgn/sin/userLogin.do";
	}else{
	}
});

$('.sub_tablist li').on('click',function(){
	$('.sub_tablist li').removeClass('active');
	$(this).addClass('active');
		
	var form = $(this).children("div").children(".hiddenform");
	var code = form.children(".hiddencode").val();
	
	form.submit(function(){
		setTimeout(function() {
			fnMove();
		}, 1000);
		
	});
	form.submit();
});

function fnMove(){
	$(window).animate( { scrollTop : $("#start").offset().top }, 5000 );
}
	
/* ********************************************************
 * 건강정보 상세 처리 함수
 ******************************************************** */
function selectDSIDetail(nttId, bbsId) {
	document.listForm.nttId.value = nttId;
	document.listForm.bbsId.value = bbsId;
	let goUrl = '';
	switch (bbsId) {
	case 'BBSMSTR_000000000003': // 질병정보
		goUrl = '/user/hti/dsi/selectDSIDetail.do';
		break;
	case 'BBSMSTR_000000000004': // Dr.민영일의 건강백서
		goUrl = '/user/hti/dct/selectDCTDetail.do';
		break;
	case 'BBSMSTR_000000000005': // 영양정보
		goUrl = '/user/hti/nti/selectNTIDetail.do';
		break;
	case 'BBSMSTR_000000000006': // 운동정보
		goUrl = '/user/hti/mvi/selectMVIDetail.do';
		break;
	case 'BBSMSTR_000000000007': // 건강동영상
		goUrl = '/user/hti/htm/selectHTMDetail.do';
		break;
	case 'BBSMSTR_000000000008': // 운동동영상
		goUrl = '/user/hti/mvm/selectMVMDetail.do';
		break;

	default:
		alert('오류가 발생하였습니다\n페이지를 새로고침(F5)하여 주시기 바랍니다');
		return;
	}
  	document.listForm.action = "<c:url value='"+goUrl+"'/>";
  	document.listForm.submit();
}
/* ********************************************************
 * faq 상세 처리 함수
 ******************************************************** */


/*********************************************************
 * 자주하는질문
 ******************************************************** */
function fnSelectLinkPage(pageNo) {
	$.ajax({
		url :"<c:url value='/com/cmm/ajax/selectFaqAjaxList.do'/>"
        , type: "POST"
        , data : {"pageIndex": pageIndex}
        , success : function(html) {
        	$('.faq_list').append(html);
			$('.faq_list dt').slice(pageIndex*10, $('.faq_list dt').length).show();
			var offset = $('.btn_faq_more').offset();
			$('html, body').animate({scrollTop : offset.top - '900'}, 400, 'easeInBack');
			if($('.faq_list dt').length < pageIndex*10) {
				$('.btn_faq_more').hide();
			}
		}
	    ,error: function(error) {
	    }
	});
}
/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
var pageIndex = 1;
function fnSelectLinkPage(pageNo) {
	document.healthForm.pageIndex.value = pageNo;
	document.healthForm.action = "<c:url value='/user/cmm/src/search.do'/>";
   	document.healthForm.submit();
}
function fnTapAll() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('All');
	});
	$('#liTapAll').trigger('click');
	$(".all_wrap").show();
	$(".clinic_wrap").hide();
	$(".tek_wrap").hide();
	$(".dr_wrap").hide();
	$(".health_wrap").hide();
	$(".question_wrap").hide();
}
function fnTap1() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('1');
	});
	$('#liTap1').trigger('click');
	$(".all_wrap").hide();
	$(".clinic_wrap").show();
	$(".tek_wrap").hide();
	$(".dr_wrap").hide();
	$(".health_wrap").hide();
	$(".question_wrap").hide();
}

function fnTap2() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('2');
	});
	$('#liTap2').trigger('click');
	$(".all_wrap").hide();
	$(".clinic_wrap").hide();
	$(".tek_wrap").show();
	$(".dr_wrap").hide();
	$(".health_wrap").hide();
	$(".question_wrap").hide();
}

function fnTap3() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('3');
	});
	$('#liTap3').trigger('click');
	$(".all_wrap").hide();
	$(".clinic_wrap").hide();
	$(".tek_wrap").hide();
	$(".dr_wrap").show();
	$(".health_wrap").hide();
	$(".question_wrap").hide();
}

function fnTap4() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('4');
	});
	$('#liTap4').trigger('click');
	$(".all_wrap").hide();
	$(".clinic_wrap").hide();
	$(".tek_wrap").hide();
	$(".dr_wrap").hide();
	$(".health_wrap").show();
	$(".question_wrap").hide();
}

function fnTap5() {
	$('input[name="lastTabIndex"]').each(function(index, item) {
		$(item).val('5');
	});
	$('#liTap5').trigger('click');
	$(".all_wrap").hide();
	$(".clinic_wrap").hide();
	$(".tek_wrap").hide();
	$(".dr_wrap").hide();
	$(".health_wrap").hide();
	$(".question_wrap").show();
}
/* ********************************************************
 * 검색내역
 ******************************************************** */
$(function() {
	$('#cntTap2').text('(${listCnt})');
	$('#cntAll').text('(${fn:length(resData.sbmList)+listCnt+fn:length(resData.doctorList)+bssListTotCnt+fn:length(resData.faqList)})');
	<c:out value="fnTap${searchVO.lastTabIndex}();" />
	$('#fnTap${searchVO.lastTabIndex}').trigger('click');
})
</script>