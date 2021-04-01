<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
			<!-- container -->
			<div id="container">
				<!-- left_menu -->
				<div class="left_menu"> 
					<ul class="lnb">
						<c:set var="preLnbDepth" value="0"/>
						<c:set var="oneDepthLocation" />
						<c:set var="twoDepthLocation" />
						<c:set var="threeDepthLocation" />
						<c:forEach var="menuLnb" items="${listMenuLnb }" varStatus="status">
							<%-- 1depth 처리 --%>
							<c:if test="${menuLnb.depth eq 1 and preLnbDepth eq 0}">
						<li<c:if test="${menuLnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
							<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<c:if test="${menuLnb.depth eq 1 and preLnbDepth eq 1}">
						</li>
						<li<c:if test="${menuLnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
							<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<c:if test="${menuLnb.depth eq 1 and preLnbDepth eq 2}">
								</li>
							</ul>
						</li>
						<li<c:if test="${menuLnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
							<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<c:if test="${menuLnb.depth eq 1 and preLnbDepth eq 3}">
									</ul>
								</li>
							</ul>
						</li>
						<li<c:if test="${menuLnb.menuNo eq oneDepthNo }"> class="on"</c:if>>
							<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<%-- 1depth 처리 --%>
							
							<%-- 2depth 처리 --%>
							<c:if test="${menuLnb.depth eq 2 and preLnbDepth eq 1}">
							<ul class="sm_lnb"<c:if test="${menuLnb.upperMenuNo eq oneDepthNo }"> style="display:block"</c:if>>
								<li<c:if test="${menuLnb.menuNo eq twoDepthNo }"> class="on"</c:if>>
									<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<c:if test="${menuLnb.depth eq 2 and preLnbDepth eq 2}">
								</li>
								<li<c:if test="${menuLnb.menuNo eq twoDepthNo }"> class="on"</c:if>>
									<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<c:if test="${menuLnb.depth eq 2 and preLnbDepth eq 3}">
									</ul>
								</li>
								<li<c:if test="${menuLnb.menuNo eq twoDepthNo }"> class="on"</c:if>>
									<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>
							</c:if>
							<%-- 2depth 처리 --%>
							
							<%-- 3depth 처리 --%>
							<c:if test="${menuLnb.depth eq 3 and preLnbDepth eq 2}">
									<ul class="sm_sm_lnb">
										<li<c:if test="${menuLnb.menuNo eq threeDepthNo }"> class="on"</c:if>>
											<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a></li>
							</c:if>
							<c:if test="${menuLnb.depth eq 3 and preLnbDepth eq 3}">
										<li<c:if test="${menuLnb.menuNo eq threeDepthNo }"> class="on"</c:if>>
											<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a></li>
							</c:if>
							<%-- 3depth 처리 --%>
								
							<%-- last 처리 --%>
							<c:if test="${status.last and menuLnb.depth eq 2}">
										</li>
									</ul>
								</li>
							</c:if>
							<c:if test="${status.last and menuLnb.depth eq 3}">
											</ul>
										<li>
									</ul>
								</li>
							</c:if>
							<%-- last 처리 --%>
							
							<c:set var="preLnbDepth">${menuLnb.depth }</c:set>
							<c:if test="${menuLnb.menuNo eq oneDepthNo }">
								<c:set var="oneDepthLocation">&nbsp;&gt;&nbsp;<a href="<c:out value='${menuLnb.chkURL }'/>"><c:out value="${menuLnb.menuNm }"/></a>&nbsp;&gt;</c:set>
							</c:if>
							<c:if test="${menuLnb.menuNo eq twoDepthNo }">
								<c:set var="twoDepthLocation">&nbsp;<strong><c:out value="${menuLnb.menuNm }"/></strong></c:set>
								<c:set var="threeDepthLocation"><c:out value="${menuLnb.menuNm }"/></c:set>
							</c:if>
							<c:if test="${menuLnb.menuNo eq threeDepthNo }">
								<c:set var="threeDepthLocation"><c:out value="${menuLnb.menuNm }"/></c:set>
							</c:if>
						</c:forEach>
					</ul>
					<a href="javascript:void(0);" class="btn_left_menu"></a>  <!-- //left_menu 토글 버튼-->
				</div>
				<!-- //left_menu -->
	
				<!-- right_conts -->
				<div class="right_conts">
	
					<div class="top_location">
						<p><a href="/admin/lgn/actionMain.do">HOME</a><c:out value="${oneDepthLocation }" escapeXml="false"/><c:out value="${twoDepthLocation }" escapeXml="false"/></p>
					</div>
	
					<h2 class="big_tit"><c:out value="${threeDepthLocation }"/></h2>