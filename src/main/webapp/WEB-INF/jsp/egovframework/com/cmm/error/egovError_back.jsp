<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%
	out.clear();
	out = pageContext.pushBody();
	
	String userAgent = request.getHeader("user-agent");
	boolean bMobile1 = (Boolean)userAgent.matches(".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
	boolean bMobile2 = (Boolean)userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
	if (bMobile1 || bMobile2) { // 모바일인 경우
%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>비에비스 나무병원</title>
		<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/slick.css">
	 	<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/slick-theme.css">
	 	<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/swiper.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/common.css">
		<link rel="icon" type="image/png"  href="/images/favicon.png"/>
		
		<script type="text/javascript" src="/js/fbcms/mobile/jquery.js"></script>
		<script type="text/javascript" src="/js/fbcms/mobile/swiper-bundle.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/mobile/common.js"></script>
		<script>
			$(document).ready(function() {
			});
		</script>
	</head>
	<body>
		<!-- 바로가기 -->
		<div id="skipNav">
		    <a href="#gnb">메인메뉴 바로가기</a>
		    <a href="#container">본문으로 바로가기</a>
		</div>
		<!-- wrap -->
		<div id="wrap">
			<!-- header s -->
			<header class="header">
				<h1><a href="/index.do">VIEVIS NAMUH</a></h1>
				<div class="gnb_box">
					<a href="/user/cmm/src/search.do" class="header_search">검색</a>
					<a href="javascript:void(0);" class="header_gnb">메뉴열기</a>
					<nav>
						<c:choose>
							<c:when test="${empty loginVO || loginVO.name eq null}">
								<a href="/user/lgn/sin/userLogin.do" class="btn_my">Login</a>
							</c:when>
							<c:otherwise>
								<a href="/user/cmm/mod/userMBIMypageView.do" class="btn_my">Mypage</a>
							</c:otherwise>
						</c:choose>
						<ul class="quick">
							<li><a href="/user/cts/rsv/drScheduleView.do">진료시간표</a></li>
							<li><a href="/user/cts/rsv/userRSVMain.do">예약&#47;조회</a></li>
							<li><a href="tel:1577-7502">전화문의</a></li>
							<li><a href="/user/cts/location/map.do">찾아오시는 길</a></li>
						</ul>
						
						<!-- gnb -->
						<ul class="gnb" id="gnb">
							<li class="depth01"><a href="javascript:void(0);">병원소개</a>
								<ul class="depth02">
									<li><a href="/user/itd/itd/vievis.do">비에비스 나무병원은</a></li>
									<li><a href="/user/itd/res/result.do">진료실적</a></li>
									<li><a href="/user/itd/flg/floorguide.do">층별안내</a></li>
									<li><a href="/user/itd/eqm/equipment.do">장비소개</a></li>
									<li><a href="/user/itd/prs/selectPRSList.do">언론보도</a></li>
									<li><a href="/user/itd/ptn/partner.do">협력병원</a></li>
									<li><a href="/user/itd/epm/employmentGuide.do">채용안내</a></li>
								</ul>
							</li>
							<li class="depth01"><a href="javascript:void(0);">진료과·의료진</a>
								<ul class="depth02">
									<li><a href="/user/hpm/smt/SMTPage.do?code=GI">소화기내과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=GS">소화기외과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=NE">신장내과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=FM">가정의학과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=BE">유방·갑상선외과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=GY">부인과</a></li>
									<li><a href="/user/hpm/smt/SMTPage.do?code=XR">영상의학과</a></li>
								</ul>
							</li>
							<li class="depth01"><a href="javascript:void(0);">특화센터</a>
								<ul class="depth02">
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001">당일내시경센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC002">용종·암치료내시경센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC003">담석수술센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC004">유방·갑상선센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC005">당뇨센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC006">안티에이징센터</a></li>
									<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC007">비만센터</a></li>
								</ul>
							</li>
							<li class="depth01"><a href="javascript:void(0);">검진센터</a>
								<ul class="depth02">
									<li><a href="/user/cuc/hcu/infoHCU.do">나무병원 건강검진은</a></li>
									<li><a href="/user/cuc/ccc/infoCCC.do">종합검진센터</a></li>
									<li><a href="/user/cuc/icc/infoICC.do">공단검진센터</a></li>
									<li><a href="/user/cuc/pct/precautions.do">검사 전 주의사항</a></li>
								</ul>
							</li>
							<li class="depth01"><a href="javascript:void(0);">건강정보</a>
								<ul class="depth02">
									<li><a href="/user/hti/dsi/selectDSIList.do">질환정보</a></li>
									<li><a href="/user/hti/dct/selectDCTList.do">Dr.민영일의 건강백서</a></li>
									<li><a href="/user/hti/nti/selectNTIList.do">영양정보</a></li>
									<li><a href="/user/hti/mvi/selectMVIList.do">운동정보</a></li>
									<li><a href="/user/hti/htm/selectHTMList.do">건강동영상</a></li>
									<li><a href="/user/hti/mvm/selectMVMList.do">운동동영상</a></li>
								</ul></li>
							<li class="depth01"><a href="javascript:void(0);">고객서비스</a>
								<ul class="depth02">
									<li><a href="/user/cts/rsv/drScheduleView.do">진료시간표</a></li>
									<li><a href="/user/cts/rsv/userRSVMain.do">예약 및 조회</a></li>
									<li><a href="/user/cts/location/map.do">찾아오시는 길</a></li>
									<li><a href="/user/cts/gui/guide.do">입원안내</a></li>
									<li><a href="/user/cts/pro/proof.do">제증명발급</a></li>
									<li><a href="/user/cts/ntc/selectNTCList.do">공지사항</a></li>
									<li><a href="/user/cts/faq/selectFaqList.do">자주하는 질문</a></li>
									<li><a href="/user/cts/cst/medicalConsultation.do">의료상담(Q&amp;A)</a></li>
								</ul>
							</li>
						</ul>
						<!-- //gnb -->
						<div class="leng">
							<span>언어선택</span>
							<ul>
								<li>KOR</li>
								<li><a href="/eng/index.do">ENG</a></li>
								<li><a href="/jpn/index.do">JPN</a></li>
								<li><a href="/chn/index.do">CHN</a></li>
							</ul>
						</div>
						
						<ul class="nav_sns">
							<jsp:include page="/mobile/cmm/gnb/snsMobileList.do" flush="false" />
						</ul>
						
						<div class="nav_site">
							<a href="/user/cmm/footer/sitemap.do">사이트맵</a>
							<c:choose>
								<c:when test="${empty loginVO || loginVO.name eq null}">
									<a href="/user/cmm/mem/signup.do">회원가입</a>
								</c:when>
								<c:otherwise>
									<a href="/user/lgn/sin/actionLogout.do">로그아웃</a>
								</c:otherwise>
							</c:choose>
						</div>
						<img src="/images/fbcms/mobile/nav_logo.png" alt="비에비스 나무병원">
						<a href="#none" class="btn_gnb_close">닫기</a>
					</nav>
				</div>
			</header>
			
			<!-- container -->
			<div id="container">
				<!-- contents s -->
				<div class="contents w1200">
				
					<section class="error">
						<header>페이지를 표시할 수 없습니다.</header>
						<p>일시적인 문제로 인해 요청하신 페이지를 표시할 수 없습니다.  </p>
						<div class="btn_Lbox mt50"><!-- btn box -->
							<a href="/" class="btn breservation">메인페이지로 이동</a>
						</div>
					</section>
				</div>
				<!-- //contents e -->
		
			</div>
			
			<!-- footer -->
			<footer>
				<ul>
					<li><a href="/user/cmm/footer/sitemap.do">사이트맵</a></li>
					<li><a href="/user/cmm/footer/unpaid.do">비급여진료공개</a></li>
					<li><a href="/user/cmm/footer/privacy.do">개인정보 처리방침</a></li>
					<li><a href="/user/cmm/footer/terms.do">이용약관</a></li>
				</ul>
				<p>비에비스 나무병원<span>대표자:홍성수</span>사업자등록번호:211-10-54459</p>
				<address>주소 : 06117 서울시 강남구 논현로 627<br>대표전화 : <a href="tel:1577-7502">1577-7502</a></address>
				<p class="copyright">COPYRIGHT @ 2020 VIEVIS NAMUH ALL RIGHTS RESERVED.</p>
				<div class="sns">
					<jsp:include page="/user/cmm/footer/snsList.do" flush="false" />
				</div>
			</footer>

		</div>
		<!-- //wrap e -->
	</body>
</html>
<%
	} else {
%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>비에비스 나무병원</title>
		<meta name="viewport" content="width=device-width, minimum-scale=0.6, maximum-scale=0.6, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/user/common.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/user/jquery.mCustomScrollbar.css"><!-- 스크롤 -->
		<link rel="icon" type="image/png"  href="/images/favicon.png"/>

		<script type="text/javascript" src="/js/fbcms/user/jquery.js"></script>
		<script type="text/javascript" src="/js/fbcms/user/common.js"></script>
		<script type="text/javascript" src="/js/fbcms/user/jquery.bxslider.js"></script>
		<script>
			$(document).ready(function() {
			});
		</script>
	</head>
	<body>
		<!-- 바로가기 -->
		<div id="skipNav">
		    <a href="#gnb">메인메뉴 바로가기</a>
		    <a href="#contents">본문으로 바로가기</a>
		</div>
		<!-- wrap -->
		<div id="wrap">
			<!-- header s -->
			<header class="header">
				<div class="utill"><!-- utill s -->
					<ul class="w1200">
					<c:choose>
						<c:when test="${empty loginVO || loginVO.name eq null}">
						<li><a href="/user/lgn/sin/userLogin.do">Login</a></li>
						<li><a href="/user/cmm/mem/signup.do">Sign Up</a></li>
						</c:when>
						<c:otherwise>
						<li>${loginVO.name}님</li>
						<li><a href="/user/cmm/mod/userMBIMypageView.do">Mypage</a></li>
						<li><a href="/user/lgn/sin/actionLogout.do">Logout</a></li>
						</c:otherwise>
					</c:choose>
						<li><p>KOR</p>
							<ul>
								<li><a href="javascript:void(0);">KOR</a></li>
								<li><a href="/eng/index.do" target="_blank">ENG</a></li>
								<li><a href="/jpn/index.do" target="_blank">JPN</a></li>
								<li><a href="/chn/index.do" target="_blank">CHN</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- //utill e -->
		
				<div class="head"><!-- head s -->
					<div class="w1200">
						<h1><a href="/index.do">VIEVIS NAMUH</a></h1>
						
						<!-- nav s -->
						<nav class="gnb" id="gnb">
							<ul>
								<li><a href="/user/itd/itd/vievis.do" class="">병원소개</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>병원소개</h2>
										</div>
										<ul>
											<li><a href="/user/itd/itd/vievis.do">비에비스 나무병원은</a></li>
											<li><a href="/user/itd/res/result.do">진료실적</a></li>
											<li><a href="/user/itd/flg/floorguide.do">층별안내</a></li>
											<li><a href="/user/itd/eqm/equipment.do">장비소개</a></li>
											<li><a href="/user/itd/prs/selectPRSList.do">언론보도</a></li>
											<li><a href="/user/itd/ptn/partner.do">협력병원</a></li>
											<li><a href="/user/itd/epm/employmentGuide.do">채용안내</a></li>
										</ul>
									</div>
								</li>
								<li><a href="/user/hpm/smt/SMTPage.do?code=GI" class="">진료과·의료진</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>진료과·의료진</h2>
										</div>
										<ul>
											<li><a href="/user/hpm/smt/SMTPage.do?code=GI">소화기내과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=GS">소화기외과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=NE">신장내과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=FM">가정의학과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=BE">유방·갑상선외과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=GY">부인과</a></li>
											<li><a href="/user/hpm/smt/SMTPage.do?code=XR">영상의학과</a></li>
										</ul>
									</div>
								</li>
								<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001" class="">특화센터</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>특화센터</h2>
										</div>
										<ul>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001">당일내시경센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC002">용종·암 치료내시경센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC003">담석수술센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC004">유방·갑상선센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC005">당뇨센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC006">안티에이징센터</a></li>
											<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC007">비만센터</a></li>
										</ul>
									</div>
								</li>
								<li><a href="/user/cuc/hcu/infoHCU.do" class="">검진센터</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>검진센터</h2>
										</div>
										<ul>
											<li><a href="/user/cuc/hcu/infoHCU.do">나무병원 건강검진은</a></li>
											<li><a href="/user/cuc/ccc/infoCCC.do">종합검진센터</a></li>
											<li><a href="/user/cuc/icc/infoICC.do">공단검진센터</a></li>
											<li><a href="/user/cuc/pct/precautions.do">검사 전 주의사항</a></li>
										</ul>
									</div>
								</li>
								<li><a href="/user/hti/dsi/selectDSIList.do" class="">건강정보</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>건강정보</h2>
										</div>
										<ul>
											<li><a href="/user/hti/dsi/selectDSIList.do">질환정보</a></li>
											<li><a href="/user/hti/dct/selectDCTList.do">Dr.민영일의 건강백서</a></li>
											<li><a href="/user/hti/nti/selectNTIList.do">영양정보</a></li>
											<li><a href="/user/hti/mvi/selectMVIList.do">운동정보</a></li>
											<li><a href="/user/hti/htm/selectHTMList.do">건강동영상</a></li>
											<li><a href="/user/hti/mvm/selectMVMList.do">운동동영상</a></li>
										</ul>
									</div>
								</li>
								<li><a href="/user/cts/rsv/drScheduleView.do" class="">고객서비스</a>
									<div>
										<div>
											<span>VIEVIS NAMUH</span>
											<h2>고객서비스</h2>
										</div>
										<ul>
											<li><a href="/user/cts/rsv/drScheduleView.do">진료시간표</a></li>
											<li><a href="/user/cts/rsv/userRSVMain.do">예약 및 조회</a></li>
											<li><a href="/user/cts/location/map.do">찾아오시는 길</a></li>
											<li><a href="/user/cts/gui/guide.do">입원안내</a></li>
											<li><a href="/user/cts/pro/proof.do">제증명발급</a></li>
											<li><a href="/user/cts/ntc/selectNTCList.do">공지사항</a></li>
											<li><a href="/user/cts/faq/selectFaqList.do">자주하는 질문</a></li>
											<li><a href="/user/cts/cst/medicalConsultation.do">의료상담(Q&amp;A)</a></li>
										</ul>
									</div>
								</li>
							</ul>
							<!-- 퀵메뉴 s -->
							<article>
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
									<li><a href="/user/cts/rsv/userRSVMain.do">예약&#47;조회</a></li>
									<li><a href="/user/cts/cst/medicalConsultation.do">문의 상담</a></li>
									<li><a href="/user/cts/location/map.do">찾아오시는 길</a></li>
									<li><a href="/user/cts/rsv/drScheduleView.do">진료시간표</a></li>
								</ul>
							</article>
							<!-- //퀵메뉴 e -->
						</nav>
						<!-- //nav e -->
		
						<ul class="search">
							<li><a href="/user/cmm/src/search.do" title="검색 페이지로 이동">검색</a></li>
							<li><a href="/user/cts/rsv/userRSVMain.do">예약&middot;조회</a></li>
						</ul>
					</div>
				</div><!-- //head e -->
		
				<div class="gnb_back"></div>
			</header>
			
			<!-- container -->
			<div class="container" id="contents">
				<!-- contents s -->
				<div class="contents w1200">
				
					<section class="error">
						<header>페이지를 표시할 수 없습니다.</header>
						<p>일시적인 문제로 인해 요청하신 페이지를 표시할 수 없습니다.  </p>
						<div class="btn_Lbox mt50"><!-- btn box -->
							<a href="/" class="btn breservation">메인페이지로 이동</a>
						</div>
					</section>
				</div>
				<!-- //contents e -->
		
			</div>
			
			<!-- footer -->
			<footer>
				<div class="f_top w1200">
					<div class="location">
						<header>LOCATION</header>
						<ul>
							<li>
								<address>
									<em>06117</em>서울시 강남구 논현로 627
								</address>
							</li>
							<li><em>언주역</em>2번 출구 <span>도보 200m</span></li>
							<li><em>학동역</em>
								<p>
									4번 출구 <span>도보 480m</span><br>
									5번 출구 <span>241, 3412</span> "논현동고개" 하차<br>
									7번 출구 <span>147, 463, 4211</span> "논현동고개" 하차
								</p>
							</li>
						</ul>
					</div>
		
					<div class="contact">
						<div>
							<header>CONTACT</header>
							<p>1577-7502</p>
						</div>
		
						<div>
							<header>OFFICE HOUR</header>
							<ul>
								<li><em>외래진료</em>평일 08:00 - 17:00<span>토요일 08:00 - 13:00</span></li>
								<li><em>건강검진</em>평일 07:30 - 16:30<span>토요일 07:30 - 13:00</span></li>
								<li><em>점심시간</em>평일 13:00 - 14:00</li>
							</ul>
						</div>
					</div>
				</div>
		
				<div class="foot w1200">
					<ul>
						<li><a href="/user/itd/itd/vievis.do">병원소개</a></li>
						<li><a href="/user/cmm/footer/unpaid.do">비급여진료공개</a></li>
						<li><a href="/user/cts/pro/proof.do">제증명 발급</a></li>
						<li><a href="/user/cmm/footer/privacy.do">개인정보 처리방침</a></li>
						<li><a href="/user/cmm/footer/terms.do">이용약관</a></li>
						<li><a href="/user/cmm/footer/sitemap.do">사이트맵</a></li>
					</ul>
					<p>비에비스 나무병원<span>대표자:홍성수</span>사업자등록번호:211-10-54459</p>
					<p class="copyright">COPYRIGHT @ 2020 VIEVIS NAMUH ALL RIGHTS RESERVED.</p>
					<div class="sns">
						<jsp:include page="/user/cmm/footer/snsList.do" flush="false" />
					</div>
				</div>
			</footer>

		</div>
		<!-- //wrap e -->
	</body>
</html>
<%
	}
%>