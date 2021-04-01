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

<!-- contents s -->
<div class="contents w1200">

	<ul class="sub_tablist">
		<c:choose>
			<c:when test="${code eq 'GI'}">
				<li class="sub01 active"><a href="javascript:void(0);">소화기내과</a>
			</c:when>
			<c:when test="${code ne 'GI'}">
				<li class="sub01"><a href="javascript:void(0);">소화기내과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="GI" class="hiddencode">
						</form>
						<header> 소화기내과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>

		<c:choose>
			<c:when test="${code eq 'GS'}">
				<li class="sub02 active"><a href="javascript:void(0);">소화기외과</a>
			</c:when>
			<c:when test="${code ne 'GS'}">
				<li class="sub02"><a href="javascript:void(0);">소화기외과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="GS" class="hiddencode">
						</form>
						<header> 소화기외과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
		
		<c:choose>
			<c:when test="${code eq 'NE'}">
				<li class="sub03 active"><a href="javascript:void(0);">신장내과</a>
			</c:when>
			<c:when test="${code ne 'NE'}">
				<li class="sub03"><a href="javascript:void(0);">신장내과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="NE" class="hiddencode">
						</form>
						<header> 신장내과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
		<c:choose>
			<c:when test="${code eq 'FM'}">
				<li class="sub04 active"><a href="javascript:void(0);">가정의학과</a>
			</c:when>
			<c:when test="${code ne 'FM'}">
				<li class="sub04"><a href="javascript:void(0);">가정의학과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="FM" class="hiddencode">
						</form>
						<header> 가정의학과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
		<c:choose>
			<c:when test="${code eq 'BE'}">
				<li class="sub05 active"><a href="javascript:void(0);">유방 &middot; 갑상선외과</a>
			</c:when>
			<c:when test="${code ne 'BE'}">
				<li class="sub05"><a href="javascript:void(0);">유방 &middot; 갑상선외과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="BE" class="hiddencode">
						</form>
						<header> 유방 &middot; 갑상선외과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
		<c:choose>
			<c:when test="${code eq 'GY'}">
				<li class="sub06 active"><a href="javascript:void(0);">부인과</a>
			</c:when>
			<c:when test="${code ne 'GY'}">
				<li class="sub06"><a href="javascript:void(0);">부인과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="GY" class="hiddencode">
						</form>
						<header> 부인과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
		<c:choose>
			<c:when test="${code eq 'XR'}">
				<li class="sub07 active"><a href="javascript:void(0);">영상의학과</a>
			</c:when>
			<c:when test="${code ne 'XR'}">
				<li class="sub07"><a href="javascript:void(0);">영상의학과</a>
			</c:when>
		</c:choose>
					<div>
						<form action="/user/hpm/smt/SMTPage.do" method="post"
							class="hiddenform">
							<input type="hidden" name="code" value="XR" class="hiddencode">
						</form>
						<header> 영상의학과 </header>
						<p></p>
						<span>Scroll Down</span> <a href="#start">선택</a>
					</div>
				</li>
	</ul>

	<h3 class="con_in_tit11" id="start"><c:out value="${spVO.MNG}"/></h3>
		<p class="con_in_txt02" id="simIN"><fbcms:editorTextareaContent value="${spVO.SIMPLE_INTRO_TX}" flag="2"/></p>
		<p class="con_in_txt02" id="IN"><fbcms:editorTextareaContent value="${spVO.INTRO_TX}" flag="2"/></p>


		<!-- 주요질환 s -->
		<div class="subject section16 max1200">
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
		<div class="subject_info">
			<h4>관련센터 소개</h4>
			<c:forEach items="${centerList}" var="center" varStatus="status">
			<c:if test="${fn:length(center.centerCd) gt 0}">
				<div> <!-- SPC001 -->
					<img src="/images/fbcms/user/img_se_center${fn:substring(center.centerCode, 4, 6)}.png" alt="${center.centerCd}">
					<div>
						<h5>${center.centerCd}</h5>
						${center.centerBigoTx}
					</div>
					<p class="btn_go">
						<a href="/user/spc/cti/selectCTIInfo.do?custom1=${center.centerCode}">바로가기</a>
					</p>
				</div>
			</c:if>
			</c:forEach>

		</div>
		<!-- //관련센터 소개 s -->

		<!-- 의료진 s -->
		<div class="subject section17 max1200">
			<h4>의료진</h4>
			<div class="staff_list">
			
			<c:forEach items="${DRList}" var="DR" varStatus="status">
				<div>
					<img src="<c:url value='/getImage/${DR.PC_IMG_ATCH_NO}'/>" alt="">
					<p>
						<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong> <span id="drFie">${DR.FIELD_CT}</span>
						<input type="hidden" id="MEDI_SBJ_CD" value="${DR.MEDI_SBJ_CD}">
					</p>
					<div>
						<a href="javascript:void(0);" class="more">자세히 보기 +
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

	</div>
	<!-- //contents e -->

</div>


<!-- 의료진 popup s -->
<div class="sub_pop">
	<div>
		<dl class="profile">
			<dt></dt>
			<dd class="drtag">
				<div class="tag_list">
					<c:forEach items="${drDetail.SEARCH_TAG_CT}" var="tag" varStatus="sts">
						<a href="javascript:void(0);">${tag }</a>
					</c:forEach>
					
				</div>
			</dd>
			<dd class="sub_btn">
				<c:if test="${fn:contains(drDetail.ADD_OPEN_SET_CD, '01')}">
				<a href="/user/cts/rsv/drScheduleView.do?MEDI_SBJ_CD=${drDetail.MEDI_SBJ_CD}&DR_ID=${drDetail.DR_ID}" id="open_cd_01" class="btn bgreen" id="sub_sch">진료시간표</a>
				</c:if>
				<c:if test="${fn:contains(drDetail.ADD_OPEN_SET_CD, '02')}">
				<a href="/user/cts/rsv/userRSVMain.do" id="open_cd_02" class="btn breservation" id="sub_res">예약</a>
				</c:if>
			</dd>
			<dd class="expertise">
				<p>전문분야</p>
				<ul id="drSpc">${drDetail.SPCL_FIELD_TX}</ul>
			</dd>
			<dd class="pro_img">
				<img src="<c:url value='/getImage/${drDetail.PC_IMG_ATCH_NO}'/>" alt="" id="DRpicture">
				<c:choose>
					<c:when test="${drDetail.BLOG_USE_YN eq 'Y'}">
						<a href="${drDetail.BLOG_ADD_TX}" target="_blank" id="blog">블로그 바로가기</a>
					</c:when>
				</c:choose>
			</dd>
		</dl>


		<div class="his">
			<p>주요경력 및 약력</p>
			<ul id="drHis"></ul>
			<ul id="drHis2"></ul>
		</div>
	</div>
	<a href="javascript:void(0);" class="sub_close">닫기</a>
	<a href="javascript:fnPrev()" class="sub_prev">prev</a>
	<a href="javascript:fnNext()" class="sub_next">next</a>
</div>
<!-- 의료진 popup s -->

<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>

<script>	

	$(function () {
		// 스크롤
		$(window).on("load",function(){
			$.mCustomScrollbar.defaults.scrollButtons.enable=true;
			$.mCustomScrollbar.defaults.axis="yx";
			$(".sub_pop > div").mCustomScrollbar({theme:"minimal-dark"});
		});
	})

	var idx = 0;
	
	
	$(".more").on("click",function(){
		var a = $(this);
		var form = a.children("form");
		idx = form.children("input[type=hidden]").val();
		idx = Number(idx);
		
		var code = $("#MEDI_SBJ_CD").val();
		var code2 = '';
		if($("#MEDI_SBJ_CD").val() == 'FM') {
			code2 = 'AO';
		}
		var obj={
			url:"/user/hpm/smt/drdetail.do"
			, data:{idx:idx,code:code,code2:code2}
			, dataType:"json"
			, fnSuccess: function(data) {
				$(".profile > dt").html("<span>"+data.field_CT+"</span><strong>"+data.dr_NM+"</strong>"+data.position_CT);
				
				var tag = (data.mng_CENTER_CD).split(",");
				var tagNm = (data.mng_CENTER_NM).split(",");
				var tl = $("dd").children("div.tag_list");
				tl.remove();
				
				var tt = $("<div>");
				tt.prop("class","tag_list");
				tt.appendTo($("dd.drtag"));
				
				for(var i=0; i<tag.length; i++){
					var t = $("<a href='/user/spc/cti/selectCTIInfo.do?custom1="+tag[i]+"'>"+tagNm[i]+"</a>");
					if(tag.length > 10) {
						t = $("<a href='/user/spc/cti/selectCTIInfo.do?custom1="+tag[i]+"' style='display:none;'>"+tagNm[i]+"</a>");
					}
					t.appendTo(tt);
				}
				
				$("#drSpc").html("<li>"+data.spcl_FIELD_TX+"</li>");
				$("#DRpicture").attr("src","<c:url value='/getImage/"+data.pc_IMG_ATCH_NO+"'/>");
				
				var b = $("#blog");
				b.remove();

				let subBtnHtml = '';
				if(data.add_OPEN_SET_CD.indexOf('01') != -1) {
					subBtnHtml += '<a href="/user/cts/rsv/drScheduleView.do?MEDI_SBJ_CD='+encodeURI(data.medi_SBJ_CD)+'&DR_ID='+encodeURI(data.dr_ID)+'" id="open_cd_01" class="btn bgreen" id="sub_sch">진료시간표</a>'; 
				}
				if(data.add_OPEN_SET_CD.indexOf('02') != -1) {
					subBtnHtml += '<a href="/user/cts/rsv/userRSVClinic.do?DPT_CD='+encodeURI(data.medi_SBJ_CD)+'&DR_ID='+encodeURI(data.dr_ID)+'&DR_NM='+encodeURI(data.dr_NM)+'" id="open_cd_02" class="btn breservation" id="sub_res">예약</a>';
				}
				$('.sub_btn').html(subBtnHtml);
				if(data.blog_USE_YN == 'Y'){
					var blog = $("<a href='"+data.blog_ADD_TX+"' target='_blank' id='blog' >블로그 바로가기</a>");
					blog.insertAfter($("#DRpicture"));
				} else {
					var blog = $("");
					blog.insertAfter($("#DRpicture"));
				}
	
				$("#drHis").html("<li>"+data.history_TX+"</li>");
				$("#drHis2").html("<li>"+data.history_TX2+"</li>");
				
			}, fnError: function(error) {
			}
		}
		fnAjax(obj);
		
		$('.sub_pop').after('<div class="dim"/>');
		$('.sub_pop').show();
	});
	
	$('.sub_pop .sub_close').click(function(event) {
		$('.dim').remove();
		$('.sub_pop').hide();
		// window.close();
	});
	
	function fnPrev(){
		idx=Number(idx)-1;
		var code = $("#MEDI_SBJ_CD").val();
		var code2 = '';
		if($("#MEDI_SBJ_CD").val() == 'FM') {
			code2 = 'AO';
		}
		var obj={
			url:"/user/hpm/smt/drdetail.do"
				, data:{idx:idx,code:code,code2:code2}
			, dataType:"json"
			, fnSuccess: function(data) {
				$(".profile > dt").html("<span>"+data.field_CT+"</span><strong>"+data.dr_NM+"</strong>"+data.position_CT);
				
				var tag = (data.mng_CENTER_CD).split(",");
				var tagNm = (data.mng_CENTER_NM).split(",");
				var tl = $("dd").children("div.tag_list");
				tl.remove();
				
				var tt = $("<div>");
				tt.prop("class","tag_list");
				tt.appendTo($("dd.drtag"));
				
				for(var i=0; i<tag.length; i++){
					var t = $("<a href='"+tag[i]+"'>"+tagNm[i]+"</a>");
					if(tag.length > 10) {
						t = $("<a href='"+tag[i]+"' style='display:none;'>"+tagNm[i]+"</a>");
					}
					t.appendTo(tt);
				}
				
				$("#drspc").html("<li>"+data.spcl_FIELD_TX+"</li>");
				$("#DRpicture").attr("src","<c:url value='/getImage/"+data.pc_IMG_ATCH_NO+"'/>");
				
				var b = $("#blog");
				b.remove();
				
				if(data.blog_USE_YN == 'Y'){
					var blog = $("<a href='"+data.blog_ADD_TX+"' target='_blank' id='blog' >블로그 바로가기</a>");
					blog.insertAfter($("#DRpicture"));
				} else {
					var blog = $("");
					blog.insertAfter($("#DRpicture"));
				}

				$("#drHis").html(data.history_TX+"</li>");
				$("#drHis2").html(data.history_TX2+"</li>");
			}
			, fnError: function(error) {
			}
		}
		fnAjax(obj);
		
	}
		
	
	function fnNext(){
		idx=Number(idx)+1;
		var code = $("#MEDI_SBJ_CD").val();
		var code2 = '';
		if($("#MEDI_SBJ_CD").val() == 'FM') {
			code2 = 'AO';
		}
		var obj={
			url:"/user/hpm/smt/drdetail.do"
			, data:{idx:idx,code:code,code2:code2}
			, dataType:"json"
			, fnSuccess: function(data) {
				$(".profile > dt").html("<span>"+data.field_CT+"</span><strong>"+data.dr_NM+"</strong>"+data.position_CT);
				
				var tag = (data.mng_CENTER_CD).split(",");
				var tagNm = (data.mng_CENTER_NM).split(",");
				var tl = $("dd").children("div.tag_list");
				tl.remove();
				
				var tt = $("<div>");
				tt.prop("class","tag_list");
				tt.appendTo($("dd.drtag"));
				
				for(var i=0; i<tag.length; i++){
					var t = $("<a href='"+tag[i]+"'>"+tagNm[i]+"</a>");
					if(tag.length > 10) {
						t = $("<a href='"+tag[i]+"' style='display:none;'>"+tagNm[i]+"</a>");
					}
					t.appendTo(tt);
				}
				
				$("#drSpc").html("<li>"+data.spcl_FIELD_TX+"</li>");
				$("#DRpicture").attr("src","<c:url value='/getImage/"+data.pc_IMG_ATCH_NO+"'/>");
				
				var b = $("#blog")
				b.remove();
				
				if(data.blog_USE_YN == 'Y'){
					var blog = $("<a href='"+data.blog_ADD_TX+"' target='_blank' id='blog' >블로그 바로가기</a>");
					blog.insertAfter($("#DRpicture"));
				} else {
					var blog = $("");
					blog.insertAfter($("#DRpicture"));
				}

				$("#drHis").html("<li>"+data.history_TX+"</li>");
				$("#drHis2").html("<li>"+data.history_TX2+"</li>");
			}
			, fnError: function(error) {
			}
		}
		
		fnAjax(obj);
	}
	
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

