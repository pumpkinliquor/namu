<%--
	Class Name : userGnb.jsp
	Description : 사용자 gnb
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
								<c:set var="preGnbId"/>
								<c:set var="preGnbDepth"/>
								<c:forEach var="gnb" items="${gnbList}" varStatus="status">
									<c:if test="${gnb.depth ne 3}">
										<c:set var="url" value="#none" />
										<c:if test="${not empty gnb.url}">
											<c:set var="url" value="${gnb.url }" />
										</c:if>
										
										<c:if test="${preGnbDepth eq 2 and gnb.depth eq 1}">
											</ul></div></li>
										</c:if>
										
										<c:if test="${preGnbDepth eq 1 and gnb.depth eq 1}">
											</li>
										</c:if>
										
										<c:choose>
											<c:when test="${gnb.depth eq 1}">
												<li>
													<a href="<c:out value='${url}' />"><c:out value="${gnb.name}" escapeXml="false" /></a>
													<div>
														<div>
															<span>VIEVIS NAMUH</span>
															<h2><c:out value="${gnb.name}" escapeXml="false" /></h2>
														</div>
											</c:when>
											<c:when test="${gnb.depth eq 2}">
												<c:if test="${preGnbDepth eq 1}">
													<ul>
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
