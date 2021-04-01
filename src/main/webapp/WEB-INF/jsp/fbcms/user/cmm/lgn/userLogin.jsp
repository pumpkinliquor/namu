<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.service.Globals" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="/js/fbcms/user/ajax_cmm.js"></script>
<!-- 네이버 로그인 관련 js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- 카카오 관련 js -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 구글 관련  js -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript">

/*********************************************************
 * 초기화
 *********************************************************/
window.onload = function(){
	// 오류 메세지 출력
	if($("#message").val() != "") {
		alert($("#message").val());
	}
	
	// 쿠기 저장된 아이디 셋팅
	var userInputId = getCookie("userInputId");
	if(userInputId != "") {
		$("#reId").val(userInputId);
		$("input:checkbox[id='reIdSave']").prop("checked", true);
	}
	
	// 네이버 로그인 생성
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "CNUbhJPe3vWb6X64Jwk4",
		callbackUrl : "https://"+"<%=Globals.DOMAIN%>"+"/user/lgn/api/naverLoginCallBack.do",
		isPopup : true, /* 팝업을 통한 연동처리 여부 */
		loginButton : {
			color : "green",
			type : 1,
			height : 60
		}
		/* 로그인 버튼의 타입을 지정 */
	});

	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	// 네이버
	$(".sns_naver").on("click", function() {
		var naver = window.open(naverLogin.generateAuthorizeUrl(), "", "width=700, height=550, left=600, top=100")
	});
	
	// JAVASCRIPT 키 넣기
	Kakao.init("8393afc2033e046eecc004e64b7c0e68");
	
	// 카카오
	$(".sns_kakao").on("click", function() {
		Kakao.Auth.login({
			success: function(authObj) {
	        
	        // 성공시 엑세스 토큰 값이 나오는데 그 값을 넣는다.
	        Kakao.Auth.setAccessToken(authObj.access_token);
	        
	        Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					var userId = res.id+""; //유저의 카카오톡 고유 id
					var userGender = res.kakao_account.gender; //유저의 성별
					var userEmail = res.kakao_account.email;
					
					// 카카오는 이름을 제공하지 않고 카톡 프로필 닉네임을 제공
					var NickName = res.kakao_account.profile.nickname; 
					
					var userToken = authObj.access_token;
					var obj = {
							url:"/user/lgn/api/apiCheck.do"
							, data: {USER_ID : userId}
							, dataType : "text"
							, fnSuccess: function(data){
								if(data==1) {
									var find = {
										url:"/user/lgn/api/findforAPI.do"
											, data: {USER_ID : userId}
											, dataType : "json"
											, fnSuccess: function(data){
												$("#reId").val(data.mber_ID);
												$("#rePw").val(data.password);
												$("#ITL_YN").val("Y");
												$("#loginForm").submit();
												
											}, fnError : function(error){
											}
									}
									
									fnAjax(find);
								}
								else if(data==0) {
									$("#api").val("KAKAO")
									$("#apiID").val(userId)
									$("#apiName").val(NickName)
									$("#apiGender").val(userGender)
									$("#apiEmail").val(userEmail)
									$("#apiform").submit()
								}
								else {
									alert("error!!")
								}
							}
					}
					
					fnAjax(obj);
				}
			})
	        
	      },
	      fail: function(err) {
	      },
	    })
	});

	// 구글
	$(".sns_google").on("click", function(){
		
		gapi.load('auth2', function() {
		    /* Ready. Make a call to gapi.auth2.init or some other API */
	
		    var gauth = gapi.auth2.init ({client_id:'759756131746-4ac6jkqc8em6rpbf2vmujd3vjhp31cid.apps.googleusercontent.com', scope:'profile'});
		   
			gauth.then(
	        		  function(){console.log('init success');}
	        		, function(){console.error('init fail');}
	        )
	
	        gauth.signIn().then(function(response){
	        	// 구글 연동은 기본적으로 성별을 제공하지 않음. google people api 추가 필요...
	        	var user = gauth.currentUser.get();

				var userId = user.getBasicProfile().getId();
				var apiName = user.getBasicProfile().getName();
				var apiEmail = user.getBasicProfile().getEmail();
	        	
				var obj={
					url:"/user/lgn/api/apiCheck.do"
					, data: {USER_ID : userId}
					, dataType : "text"
					, fnSuccess: function(data){
						if(data==1){
							var find = {
									url:"/user/lgn/api/findforAPI.do"
										, data: {USER_ID : userId}
										, dataType : "json"
										, fnSuccess: function(data){
											$("#reId").val(data.mber_ID);
											$("#rePw").val(data.password);
											$("#ITL_YN").val("Y");
											$("#loginForm").submit();
										}, fnError : function(error){
										}
								}
								fnAjax(find);
						}
						
						else if(data == 0) {
							$("#api").val("GOOGLE");
							$("#apiID").val(userId);
							$("#apiName").val(apiName);
							$("#apiEmail").val(apiEmail);
							$("#apiform").submit();
						}
						else{
							alert("error!!");
						}
					}
				}
			
				fnAjax(obj);
	       	});
		});
		// 구글 GoogleAuth.signOut() or GoogleAuth.disconnect() >> 로그아웃??
		// GoogleUser.disconnect() >> 연동 제거??
	});
}

/*********************************************************
 * 로그인
 *********************************************************/
function fnLogin() {
	var id = $("#reId").val();
	var pw = $("#rePw").val();
	
	// id,pw 체크
	if(id == "") {
		alert("아이디를 입력해주세요.");
		return;
	}
	else if(pw == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	// 로그인 시 쿠키 저장
    if($("#reIdSave").is(":checked")){		// ID 저장하기 체크 시
        setCookie("userInputId", id, 7);	// 7일 동안 쿠키 보관
    } else { 								// ID 저장하기 체크해제 시
        deleteCookie("userInputId");
    }
	
	document.loginForm.submit();
}

/*********************************************************
 * 쿠키 설정
 *********************************************************/
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

/*********************************************************
 * 쿠키 삭제
 *********************************************************/
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

/*********************************************************
 * 쿠키 가져오기
 *********************************************************/
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
	    start += cookieName.length;
	    var end = cookieData.indexOf(';', start);
	    if(end == -1)end = cookieData.length;
	    cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

// 엔터 이벤트
function enter(type) {
	if (window.event.keyCode == 13) {
		if(type === 'ID') {
			$('#rePw').focus();
		} else {
			fnLogin();
		}
	}
}

</script>

<!-- container -->
<div class="container" id="contents">
	<!-- contents s -->
	<div class="contents w1200">
		<p class="login_tit">
			<span class="c_blue">비에비스 나무병원</span>에 오신 것을 환영합니다
		</p>
		<section class="re_login">
			<header>로그인</header>
			
			<form action="/user/lgn/sin/actionLogin.do" method="post" name="loginForm" id="loginForm">
				<div class="re_loginbox">
					<p>
						<label for="reId">아이디</label>
						<input type="text" id="reId" name="id" maxlength="40" placeholder="아이디를 입력해주세요"  onkeypress="enter('ID');">
					</p>
					<p>
						<label for="rePw">비밀번호</label>
						<input type="password" id="rePw" name="password" maxlength="16" placeholder="비밀번호를 입력해주세요"  onkeypress="enter('PW');">
					</p>
					<input type="button" onclick="javascript:fnLogin();" value="로그인">
					<div>
						<p>
							<input type="checkbox" id="reIdSave">
							<label for="reIdSave">아이디 저장</label>
						</p>
						<p>
							<span><a href="/user/cmm/mem/signup.do">회원가입</a></span>
							<a href="userIdPasswordSearch.do">아이디&middot;비밀번호 찾기</a>
						</p>
					</div>
				</div>
				
				<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
				<input name="userSe" type="hidden" value="GNR">
				<input name="j_username" type="hidden">
				<input type="hidden" id="ITL_YN" name="ITL_YN">
			</form>
			
			<div class="re_sns">
				<section>
					<header>SNS 계정으로 로그인</header>
					<div>
						<a href="javascript:void(0);" class="sns_naver">네이버</a>
						<a href="javascript:void(0);" class="sns_kakao">카카오톡</a> 
						<a href="javascript:void(0);" class="sns_google">구글</a>
					</div>
				</section>
				<section>
					<header>비회원 예약&middot;조회</header>
					<a href="/user/cts/rsv/nonMemberReservation.do" class="btn bl bgreen">비회원 예약&middot;조회</a>
				</section>
			</div>
		</section>
	</div>
	<!-- //contents e -->
	
	<div id="naverIdLogin" style="display: none"></div>	
	
	<form action="/user/cmm/mem/signup.do" method="post" id="apiform">
		<input type="hidden" id="api" name="api" value="api"> 
		<input type="hidden" id="apiID" name="apiID"> 
		<input type="hidden" id="apiName" name="apiName"> 
		<input type="hidden" id="apiGender" name="apiGender"> 
		<input type="hidden" id="apiEmail" name="apiEmail"> 
	</form>
</div>
