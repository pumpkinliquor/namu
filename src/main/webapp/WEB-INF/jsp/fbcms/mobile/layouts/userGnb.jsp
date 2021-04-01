<%--
	Class Name : userGnb.jsp
	Description : 사용자 모바일 gnb
	Modification Information

	수정일                    수정자                 수정내용
	-------     --------    ---------------------------
	2020.09.01    KHC        최초 생성

	author   : KHC
	since    : 2020.09.01
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		
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
							<c:set var="preGnbId"/>
							<c:set var="preGnbDepth"/>
							<c:forEach var="gnb" items="${gnbList}" varStatus="status">
								<c:if test="${gnb.depth ne 3}">
									<c:set var="url" value="#none" />
									<c:if test="${not empty gnb.url}">
										<c:set var="url" value="${gnb.url }" />
									</c:if>
									
									<c:if test="${preGnbDepth eq 2 and gnb.depth eq 1}">
										</ul></li>
									</c:if>
									
									<c:if test="${preGnbDepth eq 1 and gnb.depth eq 1}">
										</li>
									</c:if>
									
									<c:choose>
										<c:when test="${gnb.depth eq 1}">
											<li class="depth01">
												<a href="javascript:void(0);"><c:out value="${gnb.name}" escapeXml="false" /></a>
										</c:when>
										<c:when test="${gnb.depth eq 2}">
											<c:if test="${preGnbDepth eq 1}">
												<ul class="depth02">
											</c:if>
											<li><a href="<c:out value='${url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a></li>
										</c:when>
									</c:choose>
									
									<c:set var="preGnbId" value="${gnb.id}" />
									<c:set var="preGnbDepth" value="${gnb.depth}" />
								</c:if>
							</c:forEach>
							
							<%-- 마지막이 2depth일 경우 태그 닫음 --%>
							<c:if test="${preGnbDepth eq 2}"></ul></li></c:if>
							<%-- 마지막이 1depth일 경우 태그 닫음 --%>
							<c:if test="${preGnbDepth eq 3}"></li></c:if>
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
