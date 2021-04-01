<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<!-- wrap -->
		<div id="wrap">
			<!-- header -->
			<header>
				<div class="header_wrap">
					<h1 class="logo"><a href="/admin/lgn/actionMain.do"><img src="/images/fbcms/admin/logo_travel.gif" alt="travel mate" ></a></h1>
					<!-- 메인메뉴 -->
					<nav class="gnb">
						<ul class="nav">
							<c:set var="preGnbDepth" value="0"/>
							<c:forEach var="menuGnb" items="${listMenuGnb }" varStatus="status">
								<%-- 1depth 처리 --%>
								<c:if test="${status.first}">
									<li<c:if test="${menuGnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
										<a href="<c:out value='${menuGnb.chkURL }'/>"><c:out value="${menuGnb.menuNm }"/></a>
								</c:if>
								<c:if test="${menuGnb.depth eq 1 and preGnbDepth eq 1}">
									</li>
									<li<c:if test="${menuGnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
										<a href="<c:out value='${menuGnb.chkURL }'/>"><c:out value="${menuGnb.menuNm }"/></a>
								</c:if>
								<c:if test="${menuGnb.depth eq 1 and preGnbDepth eq 2}">
											</ul>
										</div>
									</li>
									<li<c:if test="${menuGnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
									<a href="<c:out value='${menuGnb.chkURL }'/>"><c:out value="${menuGnb.menuNm }"/></a>
								</c:if>
								<%-- 1depth 처리 --%>
								
								<%-- 2depth 처리 --%>
								<c:if test="${menuGnb.depth eq 2 and preGnbDepth eq 1}">
									<div class="two_depth_wrap">
										<ul class="two_depth">
											<li><a href="<c:out value='${menuGnb.chkURL }'/>"><c:out value="${menuGnb.menuNm }"/></a></li>
								</c:if>
								<c:if test="${menuGnb.depth eq 2 and preGnbDepth eq 2}">
									<li><a href="<c:out value='${menuGnb.chkURL }'/>"><c:out value="${menuGnb.menuNm }"/></a></li>
								</c:if>
								<%-- 2depth 처리 --%>
								
								<%-- last 처리 --%>
								<c:if test="${status.last }">
											</ul>
										</div>
									</li>
								</c:if>
								<%-- last 처리 --%>
								
								<c:set var="preGnbDepth">${menuGnb.depth }</c:set>
							</c:forEach>
						</ul>
					</nav>
					<!-- //메인메뉴 -->
				</div>
				<!-- 상단 유틸메뉴 -->
				<ul class="util_list">
					<li><a href="/admin/sym/umt/updateAdminView.do?selectedId=${loginVO.uniqId }"><span class="ico01 ico_not"></span>정보수정</a></li>
					<li class="on log_info" ><a href="/admin/lgn/actionLogout.do">로그아웃</a></li>
				</ul>
				<!-- //상단 유틸메뉴 -->
			</header>
			<!-- //header -->
			