<%--
	Class Name : jpnHeader.jsp
	Description : 일본어 헤더
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
<html lang="zh-Hans">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VIEVIS NAMUH</title>
		<meta name="viewport" content="width=device-width, minimum-scale=0.6, maximum-scale=0.6, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/jpn/slick.css"><!-- slider -->
		<link rel="stylesheet" type="text/css" href="/css/fbcms/jpn/common.css">
		<link rel="icon" type="image/png"  href="/images/favicon.png"/>
		<script type="text/javascript" src="/js/fbcms/jpn/jquery.js"></script>
		<script type="text/javascript" src="/js/fbcms/jpn/slick.js"></script><!-- slider -->
		<script type="text/javascript" src="/js/fbcms/jpn/common.js"></script>
		<script>
			$(document).ready(function() {
			});
			
			<%-- 쿠기 정보 가져오기 --%>
			function fnGetCookie(cookieName) {
				var searchCookie = cookieName + '=';
				if(document.cookie.length > 0) {
					var offsetCookie = document.cookie.indexOf(searchCookie);
					if(offsetCookie != -1) { // 쿠키가 존재하면
						offsetCookie += searchCookie.length;
						var endCookie = document.cookie.indexOf(';', offsetCookie);
						if(endCookie == -1) {
							endCookie = document.cookie.length;
						}
						return unescape(document.cookie.substring(offsetCookie, endCookie));
					}
				}
				return '';
			}
			
			<%-- 쿠키 정보 셋팅하기 --%>
			function fnSetCookie(cookieName, cookieValue, cookieExpires) {
				var dateCookie = new Date();
				dateCookie.setTime(dateCookie.getTime() + (cookieExpires * 24*60*60*1000));
				document.cookie = cookieName + '=' + (cookieValue) + '; path=/; expires=' + dateCookie.toGMTString();
			}
		</script>
	</head>
	<body>
		<!-- 바로가기 -->
		<div id="skipNav">
		    <a href="#gnb">메인메뉴 바로가기</a>
		    <a href="#contents">본문으로 바로가기</a>
		</div>