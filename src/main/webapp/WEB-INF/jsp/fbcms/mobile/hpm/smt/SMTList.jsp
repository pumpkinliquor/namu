<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>

<script src="/js/fbcms/mobile/slick.js"></script>

<!-- contents s -->
<div class="contents">
	<h4 class="con_in_tit04 mar20 mt40"><c:out value="${spVO.MNG}"/></h4>
	<p class="con_in_txt mar20" id="simIN"><fbcms:editorTextareaContent value="${spVO.SIMPLE_INTRO_TX}" flag="2"/></p>
	<p class="con_in_txt mar20" id="IN"><fbcms:editorTextareaContent value="${spVO.INTRO_TX}" flag="2"/></p>

	<!-- 주요질환 s -->
	<div class="section16 max1200">
		<h4>주요질환</h4>
		<div class="tag_list">
			<c:forEach items="${DL}" var="dissList">
				<a href="/user/hti/dsi/selectDSIDetail.do?nttId=${dissList.nttId}">${dissList.nttSj}</a>
			</c:forEach>
			<%-- 12.07 삭제 // 정책 게시판연결로 변경
				<c:forEach items="${fn:split(spVO.MAJOR_DISS_CDS, ',')}" var="adInfo">
					<span><c:out value="${adInfo}"/></span>
				</c:forEach>
			 --%>
		</div>
	</div>
	<!-- //주요질환 e -->
	
	<!-- 관련센터 소개 s -->
	<div class="section18">
		<h4>관련센터 소개</h4>
		<div class="center_list">
			<c:forEach items="${centerList}" var="center" varStatus="status">
			<c:if test="${fn:length(center.centerCd) gt 0}">
				<div class="center_s">
					<div>
						<img src="/images/fbcms/user/img_se_center${fn:substring(center.centerCode, 4, 6)}.png" alt="${center.centerCd}">
					</div>
					<p>
						<strong>${center.centerCd}</strong>
						${center.centerBigoTx}
						<a href="/user/spc/cti/selectCTIInfo.do?custom1=${center.centerCode}">바로가기</a>
					</p>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- //관련센터 소개 e -->
	
	<!-- 의료진 s -->
	<div class="section17 max1200">
		<h4>의료진</h4>
		<div class="staff_list">
			<c:forEach items="${DRList}" var="DR" varStatus="status">
				<div>
					<img id="drImg" src="<c:url value='/getImage/${DR.MOBILE_IMG_ATCH_NO}'/>" alt="">
					<p>
						<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong>
						<span id="drFie">${DR.FIELD_CT}</span>
						<input type="hidden" id="MEDI_SBJ_CD" value="${DR.MEDI_SBJ_CD}">
					</p>
					<div>
						<a href="javascript:fnDrDetail('${DR.DR_ID}');" class="more">자세히 보기 +
							<form method="post" action="/user/hpm/smt/SMTPage.do">
							<input type="hidden" name="index" value="<c:out value="${status.index}" />">
							</form>
						</a>
						<c:if test="${fn:contains(DR.ADD_OPEN_SET_CD, '02')}">
						<c:url value="/user/cts/rsv/userRSVClinic.do" var="rsvUrl">
						  <c:param name="DPT_CD" value="${DR.MEDI_SBJ_CD}" />
						  <c:param name="DR_ID" value="${DR.DR_ID}" />
						  <c:param name="DR_NM" value="${DR.DR_NM}" />
						</c:url>
						<a href="${rsvUrl}" class="reserved">예약하기</a>
						</c:if>
						<c:if test="${not empty favoritesDRList}">
							<c:set var="isLikeYn" value="N" />
							<c:forEach items="${favoritesDRList}" var="faDR" varStatus="sts">
							<c:if test="${favoritesDRList ne null and faDR.DR_ID eq DR.DR_ID and faDR.LIKE_YN eq 'Y'}">
								<c:set var="isLikeYn" value="Y" />
							</c:if>
							</c:forEach>
							<a href="javascript:void(0);" class="save<c:if test="${isLikeYn eq 'Y'}"> check</c:if>">
								<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
								<input type="hidden" value="${isLikeYn}" class="check">
							</a>
						</c:if>
						<c:if test="${empty favoritesDRList}">
							<a href="javascript:void(0);" class="save">
								<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
								<input type="hidden" value="N" class="check">
							</a>
						</c:if>
					</div>
				</div>
				
			</c:forEach>
		</div>
	</div>
	<!-- //의료진 e -->

	<!-- 의료진 popup s-->
	<jsp:include page="/WEB-INF/jsp/fbcms/mobile/spc/cti/drdetail.jsp" />
	<!-- 의료진 popup e-->

<script src="/js/fbcms/user/ajax_cmm.js"></script>

<script>
	//의료진
	$('.center_list, .staff_list').not('.slick-initialized').slick({
	  arrows: false,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 1.8,
	  slidesToScroll: 1,
	});
	var idx = 0;

	
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
</script>

