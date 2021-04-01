<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div class="container maincon" id="contents">
	<div class="con_find">
		<a href="javascript:void(0);" class="find01 active">첫번째 컨텐츠로 이동</a>
		<a href="javascript:void(0);" class="find02">두번째 컨텐츠로 이동</a>
		<a href="javascript:void(0);" class="find03">세번째 컨텐츠로 이동</a>
		<a href="javascript:void(0);" class="find04">네번째 컨텐츠로 이동</a>
	</div>
	<!-- contents 01 s -->
	<section class="con01">
		<ul>
			<%-- <c:forEach var="mainVisualInfo" items="${mainMainVisualList}" begin="0" end="4">
				<li class="vlist01" style="background:#fff">
					<c:choose>
						<c:when test="${mainVisualInfo.custom1 eq '1' }">
							<video src="/cmm/fms/videoFileInfo.do?atchFileId=${mainVisualInfo.atchFileId}&fileSn=0" width="100%" height="850" autoplay muted></video>
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${mainVisualInfo.atchFileId}'/>&fileSn=0" height="850" alt="<c:out value='${mainVisualInfo.nttSj}' />">
						</c:otherwise>
					</c:choose>
					<a href="<c:out value='${mainVisualInfo.custom2 }'/>" <c:if test="${mainVisualInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>
						<strong><c:out value="${mainVisualInfo.custom4 }" escapeXml="true"/></strong>
						<span><c:out value="${fn:replace(mainVisualInfo.nttCn, crlf , '<br>') }" escapeXml="false"/>
						</span>
					</a>
				</li>
			</c:forEach> --%>
			<li class="vlist01" style="background:#fff;">
				<iframe width="100%" height="850" src="//www.youtube.com/embed/306zvabEkeI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></li>
				<a href="/user/itd/itd/vievis.do">
					<strong></strong>
					<span></span>
				</a>
			</li>
		</ul>
	</section>
	<!-- //contents 01 e -->

	<!-- contents 02 s -->
	<section class="con02">
		<div class="w1200">
			<header>
				<h3>나무병원 센터</h3>
				<p>질환명을 검색하여 질환정보, 진료과<span>&middot;</span>센터를 확인하세요</p>
			</header>
			<div>
				<form action="/user/cmm/src/search.do" method="post" name="searchForm">
					<input type="hidden" name="lastTabIndex" value="All">
					<input type="hidden" name="pageIndex" value="1">
					<input type="hidden" name="searchCondition" value="1">
					<input type="text" name="searchKeyword" title="검색어 입력">
					<input type="submit" value="검색 상세페이지로 이동">
				</form>
			</div>
			<ul>
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001">당일내시경센터</a></li>
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC002">용종&middot;암 치료내시경센터</a></li>
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC008">간센터</a></li><!-- 0308 -->
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC005">당뇨센터</a></li>
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC006">안티에이징센터</a></li>
				<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC007">비만센터</a></li>
			</ul>
			<div class="clear">
				<section class="centbox01">
					<header>수술센터</header>
					<ul>
						<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC003">담석&middot;단일통로<br>복강경 수술센터</a></li>
						<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC004">유방&middot;갑상선 센터</a></li>
					</ul>
				</section>
				<section class="centbox02">
					<header>검진센터</header>
					<ul>
						<li><a href="/user/cuc/ccc/infoCCC.do">종합검진센터</a></li>
						<li><a href="/user/cuc/icc/infoICC.do">공단검진센터</a></li>
					</ul>
				</section>
			</div>
		</div>
	</section>
	<!-- //contents 02 e -->

	<!-- contents 03 s -->
	<section class="con03">
		<div class="w1200">
			<c:forEach var="majorServiceInfo" items="${mainMajorServiceList}" begin="0" end="2">
				<a href="<c:out value='${majorServiceInfo.custom2}' />"<c:if test="${majorServiceInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>
					<img src="/getImage/${majorServiceInfo.listFile[0].streFileNm }" alt="<c:out value='${majorServiceInfo.nttSj}' />">
					<h3><c:out value="${fn:replace(majorServiceInfo.nttSj, crlf , '<br>') }" escapeXml="false"/></h3>
				</a>
			</c:forEach>
			<div>
				<section>
					<header>
						<h3>진료안내</h3>
						<p>비에비스 나무병원을 <br>이용해주셔서 감사합니다</p>
					</header>
					<p>대표전화<strong>1577-7502</strong></p>
				</section>
				<ul>
					<li><a href="/user/cts/rsv/drScheduleView.do">진료 시간표</a></li>
					<li><a href="/user/cts/location/map.do">오시는 길</a></li>
				</ul>
			</div>
		</div>
		<ul class="w1200">
			<c:forEach var="promotionInfo" items="${mainPromotionList}" begin="0" end="4">
				<li>
					<a href="<c:out value='${promotionInfo.custom2}' />"<c:if test="${promotionInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>
						<img src="/getImage/${promotionInfo.listFile[0].streFileNm }" alt="<c:out value='${majorServiceInfo.nttSj}' />">
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>
	<!-- //contents 03 e -->

	<!-- contents 04 s -->
	<section class="con04">
		<header class="w1200">
			<h3>나무병원 의료진</h3>
			<p>전문의가 직접 진료, 검사, 수술을 진행합니다</p>
		</header>
		<nav class="w1200">
			<ul>
				<li><a href="javascript:void(0);" class="active" title="현재 선택된 항목">소화기내과</a></li><!-- 선택된 메뉴:  class="active" title="현재 선택된 항목" -->
				<li><a href="javascript:void(0);">소화기외과</a></li>
				<li><a href="javascript:void(0);">신장내과</a></li>
				<li><a href="javascript:void(0);">가정의학과</a></li>
				<li><a href="javascript:void(0);">유방&middot;갑상선외과</a></li>
				<li><a href="javascript:void(0);">부인과</a></li>
				<li><a href="javascript:void(0);">영상의학과</a></li>
			</ul>
		</nav>

		<c:set var="preDrGroupCode" value=""/>
		<c:set var="headerCnt" value="0"/>
		<c:forEach var="doctorInfo" items="${mainDoctorFileList }" varStatus="status">
			<%-- 진료과목이 다른 경우   --%>
			<c:if test="${preDrGroupCode ne doctorInfo.drGroupUnionCode }">
				<c:set var="headerCnt">${headerCnt+1 }</c:set>
				<%-- 처음이 아니면 --%>
				<c:if test="${!status.first }">
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			
				<div class="con04_list"<c:if test="${!status.first }"> style="display:none"</c:if>>
					<div class="w1200">
						<header>
							<img src="/images/fbcms/user/bg_Mcon04_header0${headerCnt }.png" alt="<c:out value='${doctorInfo.drGroupName}' />">
							<c:choose>
								<c:when test="${doctorInfo.drGroupUnionCode eq 'UNION' }"><h4>유방·갑상선외과</h4></c:when>
								<c:otherwise><h4><c:out value="${doctorInfo.drGroupName}" /></h4></c:otherwise>
							</c:choose>
							<p><fbcms:editorTextareaContent value="${doctorInfo.simpleIntro }" flag="2"/></p>
						</header>
		
						<div class="con04_slide">
							<div class="pic">
								<c:choose>
									<c:when test="${doctorInfo.listFile ne null and doctorInfo.listFile[0] ne null  }">
										<p><img src="/getImage/${doctorInfo.listFile[0].streFileNm }" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
									</c:when>
									<c:otherwise>
										<p><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${doctorInfo.atchFileId}'/>&fileSn=0" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
									</c:otherwise>
								</c:choose>
								<dl>
									<dt>
										<em><c:out value="${doctorInfo.positionCt}" /></em><c:out value="${doctorInfo.drNm}" />
									</dt>
									<dd><c:out value="${doctorInfo.fieldCt}" /></dd>
									<dd><a href="javascript:void(0);" class="sub_pop_layer" id="${doctorInfo.drId}">의료진 자세히보기</a></dd>
								</dl>
							</div>
	
							<div class="sum">
								<div class="sum_list">
			</c:if>
			
									<div>
										<c:choose>
											<c:when test="${doctorInfo.listFile ne null and doctorInfo.listFile[0] ne null  }">
												<p><img src="/getImage/${doctorInfo.listFile[0].streFileNm }" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
											</c:when>
											<c:otherwise>
												<p><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${doctorInfo.atchFileId}'/>&fileSn=0" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
											</c:otherwise>
										</c:choose>
										<dl>
											<dt>
												<em><c:out value="${doctorInfo.positionCt}" /></em><c:out value="${doctorInfo.drNm}" />
											</dt>
											<dd><c:out value="${doctorInfo.fieldCt}" /></dd>
											<dd><a href="javascript:void(0);" class="sub_pop_layer" id="${doctorInfo.drId}">의료진 자세히보기</a></dd>
										</dl>
									</div>
			
			<%-- 마지막이면 --%>
			<c:if test="${status.last }">
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:set var="preDrGroupCode" value="${doctorInfo.drGroupUnionCode }"/>
		</c:forEach>


	</section>
	<!-- //contents 04 e -->

	<!-- contents 05 e -->
	<div class="con05">
		<div class="w1200">
			<section class="fl"><!-- 언론보도 s -->
				<header>언론보도</header>
				<ul>
					<c:forEach var="resultInfo" items="${mainPRSList}" begin="0" end="2" varStatus="status">
						<li>
							<%-- <em><c:out value="${fn:substring(resultInfo.custom1, 0, 4)}"/></em> --%>
							<c:choose>
								<c:when test="${resultInfo.custom2 eq 'N'}">
									<c:choose>
										<c:when test="${fn:indexOf(resultInfo.custom3, 'http:') eq 0
											or fn:indexOf(resultInfo.custom3, 'https:') eq 0}">
											<a href="<c:out value='${resultInfo.custom3 }' />" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
										</c:when>
										<c:otherwise>
											<a href="http://<c:out value='${resultInfo.custom3 }' />" target="_blank"><c:out value='${resultInfo.nttSj}'/></a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a href="#none" onclick="javascript:fnPRSDetail('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')"><c:out value='${resultInfo.nttSj}'/></a>
								</c:otherwise>
							</c:choose>
							<span><c:out value="${resultInfo.frstRegisterPnttm}" /></span>
						</li>
					</c:forEach>
				</ul>
				<a href="/user/itd/prs/selectPRSList.do">더보기</a>
			</section><!-- // 언론보도 e -->

			<section class="fr"><!-- 병원소식 s -->
				<header>병원소식</header>
				<ul>
					<c:forEach var="resultInfo" items="${mainNTCList}" begin="0" end="2" varStatus="status">
						<li>
							<a href="#none" onclick="javascript:fnNTCDetail('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')"><c:out value='${resultInfo.nttSj}'/></a>
							<span><c:out value="${resultInfo.frstRegisterPnttm}" /></span>
						</li>
					</c:forEach>
				</ul>
				<a href="/user/cts/ntc/selectNTCList.do">더보기</a>
			</section><!-- // 병원소식 e -->
		</div>
	</div>
	<!-- //contents 05 e -->
	<a href="javascript:void(0);" class="btn_top" title="화면 상단으로 이동">TOP</a>
</div>

<!-- 의료진 popup s -->
<c:forEach var="doctorInfo" items="${mainDoctorFileList }" varStatus="status">
	<div class="sub_pop ${doctorInfo.drId }">
		<div>
			<dl class="profile">
				<dt>
					<span><c:out value="${doctorInfo.fieldCt}" /></span>
					<strong><c:out value="${doctorInfo.drNm}" /></strong><c:out value="${doctorInfo.positionCt}" />
				</dt>
				<dd>
					<div class="tag_list">
						<c:set var="centerListCode" value="${fn:split(doctorInfo.mngCenterCd, ',') }"/>
						<c:set var="centerListNm" value="${fn:split(doctorInfo.mngCenterNm, ',') }"/>
						<c:forEach var="centerNm" items="${centerListNm }" varStatus="status">
							<a href="/user/spc/cti/selectCTIInfo.do?custom1=${centerListCode[status.index] }"><c:out value="${centerNm }" /></a>
						</c:forEach>
					</div>
				</dd>
				<dd class="sub_btn">
					<c:if test="${fn:contains(doctorInfo.addOpenSetCd, '01')}">
					<c:url value="/user/cts/rsv/drScheduleView.do" var="scheduleUrl">
					  <c:param name="MEDI_SBJ_CD" value="${doctorInfo.drGroupCode}" />
					  <c:param name="DR_ID" value="${doctorInfo.drId}" />
					</c:url>
						<a href="${scheduleUrl}" id="open_cd_01" class="btn bgreen">진료시간표</a>
					</c:if>
					<c:if test="${fn:contains(doctorInfo.addOpenSetCd, '02')}">
					<c:url value="/user/cts/rsv/userRSVClinic.do" var="rsvUrl">
					  <c:param name="DPT_CD" value="${doctorInfo.drGroupCode}" />
					  <c:param name="DR_ID" value="${doctorInfo.drId}" />
					  <c:param name="DR_NM" value="${doctorInfo.drNm}" />
					</c:url>
						<a href="${rsvUrl}" id="open_cd_02" class="btn breservation">예약</a>
					</c:if>
				</dd>
				<dd class="expertise">
					<p>전문분야</p>
					<ul>
						<li><fbcms:editorTextareaContent value="${doctorInfo.spclFieldTx }" flag="3"/></li>
					</ul>
				</dd>
				<dd class="pro_img">
					<c:choose>
						<c:when test="${doctorInfo.listFile ne null and doctorInfo.listFile[0] ne null  }">
							<p><img src="/getImage/${doctorInfo.listFile[0].streFileNm }" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
						</c:when>
						<c:otherwise>
							<p><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${doctorInfo.atchFileId}'/>&fileSn=0" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty doctorInfo.blogAddTx }">
						<a href="${doctorInfo.blogAddTx }" target="_blank">블로그 바로가기</a>
					</c:if>
				</dd>
			</dl>
	
			<div class="his">
				<p>주요경력 및 약력</p>
				<ul>
					<li><fbcms:editorTextareaContent value="${doctorInfo.historyTx }" flag="3"/></li>
				</ul>
				<ul>
					<li><fbcms:editorTextareaContent value="${doctorInfo.historyTx2 }" flag="3"/></li>
				</ul>
			</div>
		</div>
		<a href="javascript:void(0);" class="sub_close">닫기</a>
	</div>
</c:forEach>
<!-- 의료진 popup s -->

<div class="layer loading"><!-- 로딩 이미지 -->
	<div class="layer_con">
		<div class="ml01">
			<img src="/images/fbcms/user/loading.gif" alt="로딩바">
		</div>
	</div>
</div>

<%-- 상세페이지 이동 폼 --%>
<form name="detailForm" method="post" action="">
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="nttId" value="">
    <input type="hidden" name="bbsId" value="">
</form>

<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->

<script>
	$(document).ready(function() {
		$(window).load(function() {
			/* $('.layer.loading').after('<div class="dim02"/>');
			$('.layer.loading').show();
			
			/* main con01 */
			/*var con01 = $('.con01 > ul').bxSlider({
				auto: true,
				moveSlides: 1,
				slideMargin:0,
				infiniteLoop: true,
				speed:1000,
				pause:4000,
				touchEnabled: false,
				onSlideBefore: function() {
					con01.stopAuto();
					con01.startAuto({pause:4000});
				},
				onSliderLoad: function() {
					console.log('완료');
					$('.dim02').remove();
					$('.layer.loading').hide();
				}
			}); */
		});
		
		/* var conPager01 = - $('.con01 .bx-pager').outerWidth() / 2;
		$('.con01 .bx-pager').css('margin-left', conPager01 ); */

		/* main con03 */
		var con03 = $('.con03 > ul').bxSlider({
			auto: true,
			moveSlides: 1,
			slideMargin:0,
			infiniteLoop: true,
			speed:1000,
			pause:4000,
			touchEnabled: false,
			onSlideBefore: function() {
				con03.stopAuto();
				con03.startAuto({pause:4000});
			}
		});

		var conPager03 = - $('.con03 .bx-pager').outerWidth() / 2;
		$('.con03 .bx-pager').css('margin-left', conPager03 );

		/* main con04 */
		$('.con04_slide').each(function(idx) {
			var thisElement = $(this);
			if($(thisElement).find('.sum_list > div').length > 1) {
				$(thisElement).find('.sum_list').bxSlider({
					auto: false,
					moveSlides:3,
					slideMargin:20,
					infiniteLoop: false,/* 1204 */
					speed:500,
					touchEnabled: false
				});
		
				$(thisElement).find('.sum .bx-controls-direction a').click(function(event){
					if($(thisElement).find('.sum div [aria-hidden="false"]').length > 0){
						var sel = $(thisElement).find('.sum div [aria-hidden="false"]');
						var divS = $(sel).html();
						$(thisElement).find('.pic').html('');
						$(thisElement).find('.pic').append(divS)
						$(thisElement).find('.pic').children().hide().fadeIn(1300);
					}
				});
			}
		});
		
		$(window).load(function() {
			var bxleng01 = $('.con01 .bx-wrapper li').length;
			if(bxleng01 > 1){
				$('.con01 .bx-controls-direction').show();
			}
			var bxleng03 = $('.con03 .bx-wrapper li').length;
			if(bxleng03 > 1){
				$('.con03 .bx-controls-direction').show();
			}
		});

		//tab
		$('.con04 nav ul li').click(function(event) {
			 var i = $(this).index();
			$('.con04 nav ul li a').removeClass('active');
			$(this).children('a').addClass('active');
			$('.con04 nav ul li a').attr('title','');
			$(this).children('a').attr('title','현재 선택된 항목');
			$(".con04_list").hide();
			$('.con04_list').eq(i).show();
		});
		
		/* layer */
		$('.con04').on('click', '.sub_pop_layer', function(event) {
			var id = $(this).attr('id');
			$('.sub_pop.'+id).after('<div class="dim"/>');
			$('.sub_pop.'+id).show();
			$('.sub_pop.'+id+' .expertise ul li').each(function(idx) {
				if(idx > 11) {
					$(this).hide();
				}
			});
		});
		$('.sub_pop .sub_close').click(function(event) {
			$('.dim').remove();
			$('.sub_pop').hide();
		});
		
		// 스크롤
		$(window).on("load",function(){
			$.mCustomScrollbar.defaults.scrollButtons.enable=true;
			$.mCustomScrollbar.defaults.axis="yx";
			$(".sub_pop > div").mCustomScrollbar({theme:"minimal-dark"});
		});
	});
	
	/* ********************************************************
	 * 언론보도 상세회면 처리 함수
	 ******************************************************** */
	function fnPRSDetail(bbsId, nttId) {
		document.detailForm.bbsId.value = bbsId;
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/itd/prs/selectPRSDetail.do'/>";
	  	document.detailForm.submit();
	}
	
	/* ********************************************************
	 * 공지사항 상세회면 처리 함수
	 ******************************************************** */
	function fnNTCDetail(bbsId, nttId) {
		document.detailForm.bbsId.value = bbsId;
		document.detailForm.nttId.value = nttId;
	  	document.detailForm.action = "<c:url value='/user/cts/ntc/selectNTCDetail.do'/>";
	  	document.detailForm.submit();
	}
</script>