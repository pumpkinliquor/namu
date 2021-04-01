<%--
	Class Name : adminContentHeader.jsp
	Description : 관리자 컨텐트 헤더
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

<c:choose>
	<c:when test="${requestScope['javax.servlet.forward.servlet_path'] eq '/admin/hpm/bbs/selectArticleDetail.do'
		or requestScope['javax.servlet.forward.servlet_path'] eq '/admin/hpm/bbs/insertArticleView.do'
		or requestScope['javax.servlet.forward.servlet_path'] eq '/admin/hpm/bbs/updateArticleView.do'
		or requestScope['javax.servlet.forward.servlet_path'] eq '/admin/hpm/bbs/selectArticleList.do' }">
		<c:set var="queryStringParam" value="bbsId=${boardMasterVO.bbsId}"/>
	</c:when>
	<c:when test="${fn:indexOf(requestScope['javax.servlet.forward.query_string'], 'bbsId') le 0 }">
		<c:set var="queryStringParam" value=""/>
	</c:when>
	<c:otherwise>
		<c:set var="queryStringParam" value="${requestScope['javax.servlet.forward.query_string']}"/>
	</c:otherwise>
</c:choose>

<c:import url="/admin/cmm/mnu/selectMenuLnb.do" >
	<c:param name="referer" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
	<c:param name="queryString" value="${queryStringParam }"></c:param>
</c:import>