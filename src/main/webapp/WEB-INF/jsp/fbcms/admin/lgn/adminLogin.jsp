<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>비에비스 나무병원</title>
		<link rel="stylesheet" type="text/css" href="/css/fbcms/admin/style.css">
		<link rel="stylesheet" type="text/css" href="/css/fbcms/admin/jquery-ui.css">
		<script type="text/javascript" src="/js/fbcms/admin/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/jquery-ui.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/jquery.ezmark.min.js"></script>
		<script type="text/javascript" src="/js/fbcms/admin/common.js"></script>
		<script type="text/javaScript" language="javascript">
			$(function() {
				if (document.location.protocol == 'http:' && document.location.hostname == 'www.namu.com') {
			        document.location.href = document.location.href.replace('http:', 'https:');
			    }
				$('#password').on('keydown', function(key) {
					if(key.keyCode == 13) {
						actionLogin();
					}
				});
			});
			
			function actionLogin() {
				if (document.loginForm.id.value == "") {
			        alert("<spring:message code="comUatUia.validate.idCheck" />"); <%-- 아이디를 입력하세요 --%>
			    } else if (document.loginForm.password.value == "") {
			        alert("<spring:message code="comUatUia.validate.passCheck" />"); <%-- 비밀번호를 입력하세요 --%>
			    } else {
			        document.loginForm.action="<c:url value='/admin/lgn/actionLogin.do'/>";
			        document.loginForm.submit();
			    }
			}
			
			function setCookie (name, value, expires) {
			    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
			}
			
			function getCookie(Name) {
			    var search = Name + "=";
			    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
			        offset = document.cookie.indexOf(search);
			        if (offset != -1) { // 쿠키가 존재하면
			            offset += search.length;
			            // set index of beginning of value
			            end = document.cookie.indexOf(";", offset);
			            // 쿠키 값의 마지막 위치 인덱스 번호 설정
			            if (end == -1) {
			            	end = document.cookie.length;
			            }   
			            return unescape(document.cookie.substring(offset, end));
			        }
			    }
			    return "";
			}
			
			function saveid(form) {
			    var expdate = new Date();
			    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
			    if (form.checkId.checked) {
			    	expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
			    } else {
			        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			    }
			    setCookie("saveid", form.id.value, expdate);
			}
			
			function getid(form) {
			    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
			}
			
			function fnInit() {
			    getid(document.loginForm);
			    
			    <c:if test="${not empty fn:trim(message) && message ne ''}">
			    alert("${message}");    
			    </c:if>
			}
		</script>
	</head>
	<body onLoad="fnInit();">
		<!-- javascript warning tag  -->
		<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>
		
		<!-- wrap -->
		<div id="wrap">
			<!-- #container .login_wrap -->
			<div id="container" class="login_wrap">
				<!-- #login -->
				<div class="login_con">
					<div class="lg_top">
						<h1><img src="/images/fbcms/admin/logo_travel_white.png" alt="travel mate"></h1>
						<h2 class="blind">로그인</h2>
					</div>
					<form name="loginForm" id="loginForm" action="<c:url value='/admin/lgn/actionLogin.do'/>" method="post">
						<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
						<input name="userSe" type="hidden" value="USR"/>
						<input name="j_username" type="hidden"/>
						<div>
							<fieldset>
								<legend>로그인 정보 입력</legend>
								<div class="info_input">
									<input type="text" id="id" name="id" maxlength="10" class="input_t" style="ime-mode:inactive;" title="아이디입력" value="" placeholder="아이디">
									<input type="password" id="password" name="password" maxlength="12" class="input_t pw" title="비밀번호" placeholder="비밀번호">
								</div>
							</fieldset>
							<div class="save_area">
								<input type="checkbox" id="checkId" name="checkId" class="input_chk" onclick="javascript:saveid(document.loginForm);"> <label for="id_save"><i></i>아이디 저장</label>
							</div>
						</div>
					</form>
					<div class="btns"><button class="btn_log" onclick="javascript:actionLogin()">로그인</button></div>
					<p class="log_notice">아이디/비밀번호 분실 시 파트너센터로 연락바랍니다</p>
				</div>
				<!-- #login -->
				
				<!-- footer -->
				<footer>
					<p>계정 발급 및 사용에 문의가 있으신 경우에는 담당자에게 연락 주시기 바랍니다.
					담당자 : 김정하과장 (010-5352-9567)</p>
					<p class="copyright">CopyrightⓒVIEVIS NAMUH Corp All Rights Reserved.</p>
				</footer>
				<!-- //footer -->
			</div>
			<!-- //#container .login_wrap -->
		</div>
	</body>
</html>
