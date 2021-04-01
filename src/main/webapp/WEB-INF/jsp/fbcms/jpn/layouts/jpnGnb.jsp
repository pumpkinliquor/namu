<%--
	Class Name : jpnGnb.jsp
	Description : 일본어 gnb
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
				<div class="head w1200"><!-- head s -->
					<h1><a href="/jpn/index.do">VIEVIS NAMUH</a></h1>
					
					<!-- nav s -->
					<nav class="gnb" id="gnb">
						<ul>
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
											<li<c:if test="${gnb.id eq depth1Id }"> class="active"</c:if>>
												<a href="<c:out value='${url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a>
											</li>
										</c:when>
									</c:choose>
									
									<c:set var="preGnbId" value="${gnb.id}" />
									<c:set var="preGnbDepth" value="${gnb.depth}" />
								</c:if>
							</c:forEach>
						</ul>
						<div class="utill"><!-- utill s -->
							<p>JPN</p>
							<ul>
								<li><a href="/index.do" target="_blank">KOR</a></li>
								<li><a href="/eng/index.do" target="_blank">ENG</a></li>
								<li><a href="javascript:void(0);">JPN</a></li>
								<li><a href="/chn/index.do" target="_blank">CHN</a></li>
							</ul>
						</div><!-- //utill e -->
					</nav>
					<!-- //nav e -->
				</div><!-- //head e -->
			</header>
