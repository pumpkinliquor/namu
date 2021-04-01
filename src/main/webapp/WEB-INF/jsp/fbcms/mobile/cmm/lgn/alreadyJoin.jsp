<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div id="container">
	<div class="no_con">
		<header>회원가입</header>
		<p class="login_top_txt">비에비스 나무병원에 가입한 정보가 있습니다</p>

		<p class="login_top_txt02">
			중복 가입이 불가능 합니다<br>
			확인 후 로그인 해주세요
		</p>
		<div class="btn_Lbox"><!-- btn box -->
			<a href="javascript:void(0);" class="btn in_full bblue ml0">아이디&middot;비밀번호 찾기</a>
		</div>

	