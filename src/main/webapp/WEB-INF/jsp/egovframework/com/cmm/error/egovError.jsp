<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%
	try {
		out.clear();
		out = pageContext.pushBody();
	} catch(Exception e) {
		System.out.println("egovError : " + e.getMessage());
	}
%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>비에비스 나무병원</title>
		<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/slick.css">
	 	<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/slick-theme.css">
	 	<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/swiper.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/mobile/common.css">
		<link rel="icon" type="image/png"  href="/images/favicon.png"/>
		
		<script type="text/javascript" src="/js/fbcms/mobile/jquery.js"></script>
		<script type="text/javascript" src="/js/fbcms/mobile/swiper-bundle.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/mobile/common.js"></script>
		<script>
			$(document).ready(function() {
				document.location.href = '/user/cmm/err/error.do';
			});
		</script>
	</head>
	<body>
		<!-- 바로가기 -->
		<div id="skipNav">
		    <a href="#gnb">메인메뉴 바로가기</a>
		    <a href="#container">본문으로 바로가기</a>
		</div>
		<!-- wrap -->
		<div id="wrap">
		</div>
		<!-- //wrap e -->
	</body>
</html>
