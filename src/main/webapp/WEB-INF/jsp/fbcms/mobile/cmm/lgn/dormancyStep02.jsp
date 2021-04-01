<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- container -->
<div id="container">
	<div class="no_con">
		<header>휴면계정 해제 완료</header>
		<p class="login_top_txt">휴면 계정 해제 요청이 정상적으로 처리 되었습니다</p>

		<p class="login_top_txt02">휴면 해제 완료 후 로그인이 필요합니다<br>
		다시 한번 로그인을 시도해주세요</p>
		<div class="btn_Lbox"><!-- btn box -->
			<a href="/index.do" class="btn btn02 bgreen">메인</a>
			<a href="#/user/lgn/sin/userLogin.do" class="btn btn02 bblue">로그인</a>
		</div>
