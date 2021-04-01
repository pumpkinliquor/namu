<%--
	Class Name : userContentHeader.jsp
	Description : 사용자 컨텐트 헤더
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
	
			<!-- container -->
			<div class="container" id="contents">
				<header class="tit<c:out value='${fn:substring(depth1Id, 0, 2)}'/>">
					<h3><c:out value="${depth1Name}" escapeXml="false" /></h3>
				</header>
				<!-- sub nav s -->
				<nav class="snb">
					<ul class="w1200">
						<li><a href="javascript:void(0);">Home</a></li>
						<li class="depth01">
							<a href="javascript:void(0);"><c:out value="${depth1Name}" escapeXml="false" /></a>
							<ul>
								<c:forEach var="gnb" items="${gnbList}" varStatus="status">
									<c:if test="${gnb.depth eq 1}">
										<li class="gnbDepth01_${gnb.id}"><a href="<c:out value='${gnb.url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</nav>
				<!-- //sub nav e -->