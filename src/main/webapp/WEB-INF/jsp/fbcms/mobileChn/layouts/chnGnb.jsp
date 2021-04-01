<%--
	Class Name : chnGnb.jsp
	Description : 중국어 gnb
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
				<h1><a href="/chn/index.do">VIEVIS NAMUH</a></h1>
				<div class="gnb_box">
					<a href="#n" class="header_gnb">open a menu</a>
					<nav>
						<!-- gnb -->
						<ul class="gnb">
							<c:set var="preGnbId"/>
							<c:set var="preGnbDepth"/>
							<c:forEach var="gnb" items="${gnbList}" varStatus="status">
								<c:if test="${gnb.depth eq 1}">
									<c:set var="url" value="#none" />
									<c:if test="${not empty gnb.url}">
										<c:set var="url" value="${gnb.url }" />
									</c:if>
									
									<c:choose>
										<c:when test="${gnb.depth eq 1}">
											<li>
												<a href="<c:out value='${url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a>
											</li>
										</c:when>
									</c:choose>
									
									<c:set var="preGnbId" value="${gnb.id}" />
									<c:set var="preGnbDepth" value="${gnb.depth}" />
								</c:if>
							</c:forEach>
						</ul>
						<!-- //gnb -->
						<ul class="leng">
							<li>CHN</a></li>
							<li><a href="/index.do">KOR</a></li>
							<li><a href="/eng/index.do">ENG</a></li>
							<li><a href="/jpn/index.do">JPN</a></li>
						</ul>
						
						<img src="/images/fbcms/mobileChn/nav_logo.png" alt="비에비스 나무병원" class="nav_logo">
						<a href="#n" class="btn_gnb_close">닫기</a>
					</nav>
				</div>
			</header>
