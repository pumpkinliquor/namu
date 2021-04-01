<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>


	<!-- container -->
	<div class="container" id="contents">

		<!-- contents s -->
		<div class="contents w1200">

			<section class="re_login joinbox">
				<header>회원가입</header>

				<ul class="step join_step"><!-- 진행 스텝 -->
					<li class="end"><span>완료</span>약관동의</li>
					<li class="end"><span>완료</span>본인인증</li>
					<li class="end"><span>완료</span>정보입력</li>
					<li class="selected">가입완료</li>
				</ul>

				<h5 class="con_in_tit07 t_center">회원가입을 감사드립니다!</h5>
				<p class="join_txt"><strong>${name} 고객님</strong>
					비에비스 나무병원 회원이 되신 것을 진심으로 감사드립니다</p>

				<div class="btn_Lbox"><!-- btn box -->
					<a href="/index.do" class="btn bgreen">메인</a>
					<a href="/user/lgn/sin/userLogin.do" class="btn bblue">로그인</a>
				</div>
			</section>

		</div>
		<!-- //contents e -->

	</div>

