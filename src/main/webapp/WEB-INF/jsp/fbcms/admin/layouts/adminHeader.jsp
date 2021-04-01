<%--
	Class Name : adminHeader.jsp
	Description : 관리자 헤더
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

<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>비에비스 나무병원 관리자</title>
		<link rel="stylesheet" type="text/css" href="/css/fbcms/admin/style.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/admin/jquery-ui.css">
		<script type="text/javascript" src="/js/fbcms/admin/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/jquery-ui.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/jquery.ezmark.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/common.js"></script>
	</head>
	<body onLoad="fnInit();">