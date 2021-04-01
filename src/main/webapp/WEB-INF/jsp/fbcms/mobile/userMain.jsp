<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div class="maincon" id="container">
	<!-- contents 01 s -->
	<section class="con01">
		<ul>
			<%-- <c:forEach var="mainVisualInfo" items="${mainMainVisualList}" begin="0" end="4">
				<li>
					<c:choose>
						<c:when test="${mainVisualInfo.custom1 eq '1' }">
							<video src="/cmm/fms/videoFileInfo.do?atchFileId=${mainVisualInfo.atchFileId}&fileSn=1" width="100%" controls poster="/images/fbcms/mobile/img_renewal.jpg"></video>
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${mainVisualInfo.atchFileId}'/>&fileSn=1" alt="<c:out value='${mainVisualInfo.nttSj}' />">
							<a href="<c:out value='${mainVisualInfo.custom2 }'/>" <c:if test="${mainVisualInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>
								<strong><c:out value="${mainVisualInfo.custom4 }" escapeXml="true"/></strong>
								<span><c:out value="${fn:replace(mainVisualInfo.nttCn, crlf , '<br>') }" escapeXml="false"/></span>
							</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach> --%>
			<li><iframe width="100%" height="380" src="//www.youtube.com/embed/306zvabEkeI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></li>
		</ul>
		<a href="tel:1577-7502" class="con01_re">예약<span>1577-7502</span></a>
	</section>
	<!-- //contents 01 e -->

	<!-- contents 02 s -->
	<section class="con02">
		<header>
			<h3>나무병원 센터</h3>
			<p>질환명을 검색하여 질환정보, 진료과<span>&middot;</span>센터를 확인하세요</p>
		</header>
		<div>
			<form action="/user/cmm/src/search.do" method="post" name="searchForm">
				<input type="hidden" name="lastTabIndex" value="All">
				<input type="hidden" name="pageIndex" value="1">
				<input type="hidden" name="searchCondition" value="1">
				<input type="text" name="searchKeyword" title="검색어 입력"><input type="submit" value="검색 상세페이지로 이동">
			</form>
		</div>
		<ul>
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001">당일내시경센터</a></li>
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC002">용종&middot;암<br>치료내시경센터</a></li>
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC008">간센터</a></li><!-- 0308 -->
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC005">당뇨센터</a></li>
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC006">안티에이징센터</a></li>
			<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC007">비만센터</a></li>
		</ul>
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
	</section>
	<!-- //contents 02 e -->

	<!-- contents 03 s -->
	<section class="con03">
		<ul class="mtime">
			<li><a href="/user/cts/rsv/drScheduleView.do"><span></span>진료 시간표</a></li>
			<li><a href="/user/cts/location/map.do"><span></span>오시는 길</a></li>
		</ul>
		<div class="mgo">
			<c:forEach var="majorServiceInfo" items="${mainMajorServiceList}" begin="0" end="2">
				<div>
					<img src="/getImage/${majorServiceInfo.listFile[1].streFileNm }" alt="<c:out value='${promotionInfo.nttSj}' />">
					<h3><c:out value="${fn:replace(majorServiceInfo.nttSj, crlf , '<br>') }" escapeXml="false"/></h3>
					<a href="<c:out value='${majorServiceInfo.custom2}' />"<c:if test="${promotionInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>바로가기</a>
				</div>
			</c:forEach>
		</div>
		<ul class="mp">
			<c:forEach var="promotionInfo" items="${mainPromotionList}" begin="0" end="4">
				<li>
					<a href="<c:out value='${promotionInfo.custom2}' />"<c:if test="${promotionInfo.custom3 eq 'Y'}"> target="_blank"</c:if>>
						<img src="/getImage/${promotionInfo.listFile[1].streFileNm }" alt="<c:out value='${promotionInfo.nttSj}' />">
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>
	<!-- //contents 03 e -->

	<!-- contents 04 s -->
	<section class="con04">
		<header>
			<h3>진료과&middot;의료진</h3>
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
		<c:forEach var="doctorInfo" items="${mainDoctorList }" varStatus="status">
			<%-- 진료과목이 다른 경우   --%>
			<c:if test="${preDrGroupCode ne doctorInfo.drGroupUnionCode }">
				<c:set var="headerCnt">${headerCnt+1 }</c:set>
				<%-- 처음이 아니면 --%>
				<c:if test="${!status.first }">
					</div>
				</c:if>
			
				<div class="con04_slide"<c:if test="${!status.first }"> style="display:none"</c:if>>
			</c:if>

					<div>
						<a href="javascript:void(0);" class="sub_pop_layer" id="${doctorInfo.drId}">
							<c:choose>
								<c:when test="${doctorInfo.listFile ne null and doctorInfo.listFile[0] ne null  }">
									<p><img src="/getImage/${doctorInfo.listFile[0].streFileNm }" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
								</c:when>
								<c:otherwise>
									<p><img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${doctorInfo.atchFileIdMobile}'/>&fileSn=0" alt="<c:out value='${doctorInfo.drNm}' /> 사진"></p>
								</c:otherwise>
							</c:choose>
							<span><c:out value="${doctorInfo.positionCt}" /></span>
							<strong><em><c:out value="${doctorInfo.drNm}" /></em><span><c:out value="${doctorInfo.fieldCt}" /></span></strong>
						</a>
					</div>
					
			<%-- 마지막이면 --%>
			<c:if test="${status.last }">
				</div>
			</c:if>
			
			<c:set var="preDrGroupCode" value="${doctorInfo.drGroupUnionCode }"/>
		</c:forEach>

	</section>
	<!-- //contents 04 e -->

	<!-- contents 05 e -->
	<div class="con05">
		<ul class="board_tab">
			<li class="active">언론보도</li>
			<li>병원소식</li>
		</ul>
		<section><!-- 언론보도 s -->
			<ul>
				<c:forEach var="resultInfo" items="${mainPRSList}" begin="0" end="2" varStatus="status">
					<li>
						<%-- <c:choose>
							<c:when test="${fn:length(resultInfo.custom1) lt 1 }"><em>&nbsp;</em></c:when>
							<c:otherwise><em><c:out value="${fn:substring(resultInfo.custom1, 0, 4)}"/></em></c:otherwise>
						</c:choose> --%>
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
						<%-- <span><c:out value="${resultInfo.frstRegisterPnttm}" /></span> --%>
					</li>
				</c:forEach>
			</ul>
			<a href="/user/itd/prs/selectPRSList.do">더보기</a>
		</section><!-- // 언론보도 e -->

		<section><!-- 병원소식 s -->
			<ul>
				<c:forEach var="resultInfo" items="${mainNTCList}" begin="0" end="2" varStatus="status">
					<li>
						<a href="#none" onclick="javascript:fnNTCDetail('<c:out value="${resultInfo.bbsId}"/>', '<c:out value="${resultInfo.nttId}"/>')"><c:out value='${resultInfo.nttSj}'/></a>
						<%-- <span><c:out value="${resultInfo.frstRegisterPnttm}" /></span> --%>
					</li>
				</c:forEach>
			</ul>
			<a href="/user/cts/ntc/selectNTCList.do">더보기</a>
		</section><!-- // 병원소식 e -->
		</div>
	</div>
	<!-- //contents 05 e -->
	<a href="#wrap" class="btn_top" title="화면 상단으로 이동" style="display:none;">TOP</a>
</div>

<!-- 의료진 popup s -->
<c:forEach var="doctorInfo" items="${mainDoctorList }" varStatus="status">
	<div class="sub_pop ${doctorInfo.drId }" style="display:none;">
		<div>
			<dl class="profile">
				<dt>
					<span><c:out value="${doctorInfo.fieldCt}" /></span>
					<strong><c:out value="${doctorInfo.drNm}" /></strong><c:out value="${doctorInfo.positionCt}" />
				</dt>
				<dd>
					<div class="tag_list">
						<c:set var="centerListNm" value="${fn:split(doctorInfo.mngCenterNm, ',') }"/>
						<c:forEach var="centerNm" items="${centerListNm }">
							<a href="javascript:void(0);"><c:out value="${centerNm }" /></a>
						</c:forEach>
					</div>
				</dd>
				<dd class="sub_btn">
					<a href="javascript:void(0);" class="btn bgreen">진료시간표</a>
					<a href="javascript:void(0);" class="btn breservation">예약</a>
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
							<img src="/getImage/${doctorInfo.listFile[0].streFileNm }" alt="<c:out value='${doctorInfo.drNm}' /> 사진">
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${doctorInfo.atchFileIdMobile}'/>&fileSn=0" alt="<c:out value='${doctorInfo.drNm}' /> 사진">
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

<%-- 상세페이지 이동 폼 --%>
<form name="detailForm" method="post" action="">
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="nttId" value="">
    <input type="hidden" name="bbsId" value="">
</form>

<script src="js/fbcms/mobile/slick.js"></script>
<script>
	$(document).ready(function() {
		// con01
		/* $('.con01 ul').slick({
			slidesToShow: 1,
	  		slidesToScroll: 1,
	  		autoplay: true,
			autoplaySpeed: 3000,
		}); */

		// con02
		$('.con02 > ul').slick({
		  infinite: false,
		  speed: 300,
		  slidesToShow: 3.8,
		  slidesToScroll: 3,
		  arrows: false,
		  responsive: [
		    {
		      breakpoint: 374,
		      settings: {
		        slidesToShow: 3.3
		      }
		    }
		  ]
		});

		// con03
		$('.con03 .mgo').slick({
		  arrows: false,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 2.2,
		  slidesToScroll: 1,
		});

		// con03
		$('.con03 .mp').slick({
			slidesToShow: 1,
	  		slidesToScroll: 1,
	  		autoplay: true,
			autoplaySpeed: 3000,
		});
			
		// con04
		if($(window).width()< 600){	
			$('.con04 nav ul').slick({
			  arrows: false,
			  infinite: false,
			  speed: 300,
			  slidesToShow: 6,
			  slidesToScroll:1,
			  variableWidth: true,
			  responsive: [
			    {
			      breakpoint: 550,
			      settings: {
			        slidesToShow:5.5,
			        slidesToScroll:3,
			      }
			    }
			  ]
			});
		}

		//tab
		$('.con04 nav ul li').click(function(event) {
			var clickElement = $(this);
			var i = 0;
			$('.con04 nav ul li').each(function(idx) {
				if($(this)[0] == $(clickElement)[0]) {
					i = idx;
				}
			})
			$('.con04 nav ul li a').removeClass('active');
			$(this).children('a').addClass('active');
			$('.con04 nav ul li a').attr('title','');
			$(this).children('a').attr('title','현재 선택된 항목');
			$(".con04_slide").hide();
			$('.con04_slide').eq(i).show();
			if($('.con04_slide').eq(i).length > 0 && $('.con04_slide').eq(i).find('.sub_pop_layer').length > 0) {
				$('.con04_slide').eq(i).not('.slick-initialized').slick({
					arrows: false,
				  	centerMode: true,
				  	centerPadding: '60px',
				  	slidesToShow: 1
				});
			}
		});

		// con05
		$('.board_tab li').click(function(event) {
			 var i = $(this).index();
			$('.board_tab li').removeClass('active');
			$(this).addClass('active');
			$('.con05 section').hide();
			$('.con05 section').eq(i).show();
		});

		//con04
		$('.con04 nav ul li:eq(0)').click();
		
		// TOP버튼
		$(window).scroll(function() {
			var scrollPosition = window.scrollY || document.documentElement.scrollTop;
			if(scrollPosition > 0) {
				$('.btn_top').show();
			} else {
				$('.btn_top').hide();
			}
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