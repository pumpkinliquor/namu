<%--
	Class Name : userHeader.jsp
	Description : 사용자 헤더
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
		<meta name="description" content="진료당일 위·대장내시경, 소화기질환, 단일통로 복강경 수술센터, 유방·갑상선센터, 건강검진센터">
		<c:choose>
			<c:when test="${not empty depth3Name }"><c:set var="titleHeader">비에비스 나무병원 | ${depth3Name }</c:set></c:when>
			<c:when test="${not empty depth2Name }"><c:set var="titleHeader">비에비스 나무병원 | ${depth2Name }</c:set></c:when>
			<c:otherwise><c:set var="titleHeader">비에비스 나무병원 | ${depth1Name }</c:set></c:otherwise>
		</c:choose>
		<title><c:out value="${titleHeader}"/></title>
		<meta property="og:title" content="${titleHeader}">
		<meta property="og:description" content="진료당일 위·대장내시경, 소화기질환, 단일통로 복강경 수술센터, 유방·갑상선센터, 건강검진센터">
		<meta name="viewport" content="width=device-width, minimum-scale=0.6, maximum-scale=0.6, user-scalable=no">
		<meta name="naver-site-verification" content="e8f8a5808f889744789747e061f9b2d74340b73a" />
		<link rel="stylesheet" type="text/css" href="/css/fbcms/user/common.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/user/jquery.mCustomScrollbar.css"><!-- 스크롤 -->
		<link rel="icon" type="image/png"  href="/images/favicon.png"/>

		<script type="text/javascript" src="/js/fbcms/user/jquery.js"></script>
		<script type="text/javascript" src="/js/fbcms/user/common.js"></script>
		<script type="text/javascript" src="/js/fbcms/user/jquery.bxslider.js"></script>
		<script>
			if (document.location.protocol == 'http:' && document.location.hostname == 'www.namu.com') {
		        document.location.href = document.location.href.replace('http:', 'https:');
		    }
			$(document).ready(function() {
			});
			
			<%-- 사용자 네비게이션 클릭 --%>
			function navDepthClick(oneDepthNo) {
				$('.depth02 > ul > li').hide();
				$('.depth02 > ul > li.gnbDepth01_'+oneDepthNo).show();
			}
			
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
			
			/* ********************************************************
			 * 왼쪽 채우기
			 ******************************************************** */
			function lpad(data, length, rep) {
				data = String(data);
				while(data.length < length) {
					data = rep +""+ data;
				}

				return data;
			}

			/* ********************************************************
			 * 날짜 유효성 체크
			 ******************************************************** */
			function isValidDate(inYmd) {
			    var year = inYmd.substring(0,4);
			    var month = inYmd.substring(4,6);
			    var day = inYmd.substring(6,8);

			    var d = new Date(year, month-1, day);

			    if (d.getFullYear() == year && lpad((d.getMonth()+1),2,'0') == month && lpad(d.getDate(),2,'0') == day) {
			        return true;
			    }

			    return false;
			}
			
			/* ********************************************************
			 * 리소스파일 다운로드
			 ******************************************************** */
			function resourceFileDown(fileNm) {
				window.open("/cmm/fms/resourceFileDown.do?resourceFileName="+encodeURI(fileNm));
			}
		</script>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-5417905-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-5417905-1');
		</script>
	</head>
	<body>
		<!-- 바로가기 -->
		<div id="skipNav">
		    <a href="#gnb">메인메뉴 바로가기</a>
		    <a href="#contents">본문으로 바로가기</a>
		</div>