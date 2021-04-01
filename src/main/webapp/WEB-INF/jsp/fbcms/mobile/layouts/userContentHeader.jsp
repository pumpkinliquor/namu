<%--
	Class Name : userContentHeader.jsp
	Description : 사용자 모바일 컨텐트 헤더
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
			<div id="container">
				<header class="tit<c:out value='${fn:substring(depth2Id, 0, 2)}'/>">
					<h3><c:out value="${depth1Name}" escapeXml="false" /></h3>
				</header>
				<nav class="snb">
					<p><c:out value="${depth2Name}" escapeXml="false" /></p>
					<ul>
						<c:forEach var="gnb" items="${gnbList}" varStatus="status">
							<c:if test="${gnb.depth eq 1}">
								<c:set var="gnbDepth01" value="${gnb.id}" />
							</c:if>
							<c:if test="${gnb.depth eq 2}">
								<li class="gnbDepth01_${gnbDepth01}"<c:if test="${gnbDepth01 ne depth1Id}"> style="display:none;"</c:if>>
									<a href="<c:out value='${gnb.url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</nav>
				