<%--
	Class Name : userLayout.jsp
	Description : 사용자 레이아웃
	Modification Information

	수정일                    수정자                 수정내용
	-------     --------    ---------------------------
	2020.09.01    KHC        최초 생성

	author   : KHC
	since    : 2020.09.01
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertAttribute name="header"></tiles:insertAttribute>
<tiles:insertAttribute name="gnb"></tiles:insertAttribute>
<tiles:insertAttribute name="contentBody"></tiles:insertAttribute>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>