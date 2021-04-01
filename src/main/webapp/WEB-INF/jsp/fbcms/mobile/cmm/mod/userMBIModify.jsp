<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="egovframework.com.cmm.service.Globals" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<!-- 다음 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- AJAX -->
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
 ******************************************************** */
$(function() {
	
	
 	/* 생년월일 */
	var BIRTH_DT = "${memberInfo.BIRTH_DT}";
	var BIRTH_FIRST = BIRTH_DT.substr(0,4);
	var BIRTH_MIDDLE = BIRTH_DT.substr(4,2);
	var BIRTH_END = BIRTH_DT.substr(6,2);
	$("#BIRTH_FIRST").val(BIRTH_FIRST);
	
	/* 이메일 주소 */
	var MBER_EMAIL_ADRES = "${memberInfo.MBER_EMAIL_ADRES}"
	MBER_EMAIL_ADRES = MBER_EMAIL_ADRES.split("@");
	$("#mailId").val(MBER_EMAIL_ADRES[0]);
	$("#domain").val(MBER_EMAIL_ADRES[1]);
	
	/* 비밀번호 에러 메시지 */
	/* $(".t_message02").css("display","none"); */
	$("#message01").hide();
	$("#message02").hide();
	
	
	/* 이메일 수신 여부 */
	var EMAIL_RECV_YN = "${memberInfo.EMAIL_RECV_YN}";
	if (EMAIL_RECV_YN === "Y") {
		$(".ez-checkbox").addClass("ez-checked");
		$("input:checkbox[id=EMAIL_RECV_YN]").prop("checked", true);
	}
	$("#EMAIL_RECV_YN").on('click', function() {
		if ($("input:checkbox[id='EMAIL_RECV_YN']").is(":checked") == true) {
			$("input[name=EMAIL_RECV_YN]").val('Y');
		} else {
			$("input[name=EMAIL_RECV_YN]").val('N'); 
			   }
		});
	
	/* 핸드폰 인증 */
	$("#authentication").on("click",function(e){
		var URL = "<c:url value='/danal/Ready.do'/>";
		var popupName = "_blank";
		var popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
		
		window.open(URL, popupName, popupOptions);
	});
	
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});


	
	
	/* SNS 연동 여부 */
	var snsNaver = "${naver.ITL_YN}";
	if(snsNaver === "N") {
		$(".naverbtn").addClass('bxs02');
		$(".naverbtn").html("연동추가");
	} else {
		$(".naverbtn").addClass('bxs');
		$(".naverbtn").html("연동해제");
	}
	
	var snsKakao = "${kakao.ITL_YN}";
	if(snsKakao === "N") {
		$(".kakaobtn").addClass('bxs02');
		$(".kakaobtn").html("연동추가");
	} else {
		$(".kakaobtn").addClass('bxs');
		$(".kakaobtn").html("연동해제");
	}
	
	var snsGoogle = "${google.ITL_YN}";
	if(snsGoogle === "N") {
		$(".googlebtn").addClass('bxs02');
		$(".googlebtn").html("연동추가");
	} else {
		$(".googlebtn").addClass('bxs');
		$(".googlebtn").html("연동해제");
	}
	
	
	/*   LOGIN API   */
	
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
		isPopup : true /* 팝업을 통한 연동처리 여부 */
		/* 로그인 버튼의 타입을 지정 */
	});

	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	// 네이버
	$(".naverbtn").on("click", function() {
		var naver = window.open(naverLogin.generateAuthorizeUrl(), "", "width=700, height=550, left=600, top=100")
		fnNaver();
	});
	
	// JAVASCRIPT 키 넣기
	Kakao.init("8393afc2033e046eecc004e64b7c0e68");
	
	// 카카오
	$(".kakaobtn").on("click", function() {
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
								
								var text =$(".kakaobtn").html();
												
								if(text === "연동해제") {
									$(".kakaobtn").removeClass('bxs');
									$(".kakaobtn").addClass('bxs02');
									$(".kakaobtn").html("연동추가");
									document.userInfoModify.kakao.value = "N";
									document.userInfoModify.kakaoToken.value = "";
									
								} else {
									$(".kakaobtn").removeClass('bxs02');
									$(".kakaobtn").addClass('bxs');
									$(".kakaobtn").html("연동해제");
									document.userInfoModify.kakao.value = "Y";
									document.userInfoModify.kakaoToken.value = userToken;
								}
								
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
									$("#api").val("KAKAO");
									$("#apiID").val(userId);
									$("#apiName").val(NickName);
									$("#apiGender").val(userGender);
									$("#apiEmail").val(userEmail);
									$("#apiform").submit();
								}
								else {
									alert("error!!");
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
	$(".googlebtn").on("click", function(){
		

		
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
						
						
						var text =$(".googlebtn").html();
	
						if(text === "연동해제") {
							$(".googlebtn").removeClass('bxs');
							$(".googlebtn").addClass('bxs02');
							$(".googlebtn").html("연동추가");
							document.userInfoModify.google.value = "N";
							document.userInfoModify.googleToken.value = "";
						} else {
							$(".googlebtn").removeClass('bxs02');
							$(".googlebtn").addClass('bxs');
							$(".googlebtn").html("연동해제");
							document.userInfoModify.google.value = "Y";
							document.userInfoModify.googleToken.value = userId;
						}
						
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
	
	
})

/* 네이버 연동 */
function fnNaver() {
	var text =$(".naverbtn").html();
	if(text === "연동해제") {
		$(".naverbtn").removeClass('bxs');
		$(".naverbtn").addClass('bxs02');
		$(".naverbtn").html("연동추가");
		document.userInfoModify.naver.value = "N";
		
	} else {
		$(".naverbtn").removeClass('bxs02');
		$(".naverbtn").addClass('bxs');
		$(".naverbtn").html("연동해제");
		document.userInfoModify.naver.value = "Y";
	}
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

/*********************************************************
 * 취소하기
 ******************************************************** */
function fnCancel() {
	if(confirm("회원정보를 수정을 취소하시겠습니까?") == true) {
		document.userInfoModify.action = "<c:url value='/user/cmm/mod/userMBIMypageView.do'/>";
		document.userInfoModify.submit();
	} else {
		return false;
	}
}

/*********************************************************
 * 주소
 ******************************************************** */
function fnDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.roadAddress;
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('ZIP').value = data.zonecode;
			document.getElementById("ADRES").value = addr;
			$("#ADRES").html($("#ZIP").val() + "  " + $("#ADRES").val());
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("DETAIL_ADRES").focus();
			}
		}).open();
	};

/*********************************************************
* 수정하기
******************************************************** */
function fnModify() {
	
	var pw = document.userInfoModify.PASSWORD.value;
	var passwordChk = document.userInfoModify.PASSWORDChk.value;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 
	 	/* 비밀번호 체크 */
	 	 if(pw !== passwordChk) {
	 		$("#message02").show();
	 		$("#PASSWORD").focus();
			return false;
		 }  else if(pw.length < 8 || pw.length > 16){
			$("#PASSWORD").focus();
		 	$("#message01").show();
		 	alert("8자리 ~ 16자리 이내로 입력해주세요.");
		  	return false;
		 } else if(pw.search(/\s/) != -1){
			$("#message01").show();
			$("#PASSWORD").focus();
			alert("비밀번호는 공백 없이 입력해주세요.");
		  	return false;
		 } else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			 $("#message01").show();
			 alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  	return false;
		 }  else {
			if(document.userInfoModify.mailId.value == "") {
				alert("메일 앞자리를 입력해주세요.");
				return;
			} else if(document.userInfoModify.domain.value == "") {
				alert("메일 뒷자리를 입력해주세요.");
				return;
			} else if(document.userInfoModify.ADRES.value == "") {
				alert("주소를 입력해주세요.");
				return;
			} else if(document.userInfoModify.DETAIL_ADRES.value == ""){
				alert("상세 주소를 입력해주세요");
				return;
			} else {
				document.userInfoModify.action = "<c:url value='/user/cmm/mod/modifyMBI.do'/>";
				
				document.userInfoModify.MBER_EMAIL_ADRES.value = document.getElementById('mailId').value
				 + "@" + document.getElementById('domain').value;
				
				document.userInfoModify.submit();
			}
		 }

}

function fnDrop() {
	document.userInfoModify.action = "<c:url value='/user/cmm/mod/dropMBIView.do'/>";
	document.userInfoModify.submit();
}


/* 휴대폰 인증 다음단계 */
function fnNextStep(tid, name, iden, phone) {
	phoneNum = phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	$("#mbt").text(phoneNum);
	document.userInfoModify.MBTLNUM.value = phoneNum;
	window.close();
}

</script>

<!-- container -->
	<div id="container">
		<div class="no_con">
			<form name="userInfoModify" action="" method="post">
				<header>회원정보 수정</header>
	
				<p class="n_txt"><em class="ootc">*</em>필수입력 항목</p>
	
				<div class="tdetail tdetail03 mar0">
					<table>
						<caption>리스트 상세 등록 페이지</caption>
						<tbody>
							<tr>
								<th scope="row"><em class="ootc">*</em>이름</th>
								<td><c:out value="${memberInfo.MBER_NM }"/></td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>아이디</th>
								<td><c:out value="${memberInfo.MBER_ID }"/></td>
	
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>비밀번호</th>
								<td>
									<input type="password" class="in_full" title="비밀번호" maxlength="16" id="PASSWORD" name="PASSWORD" placeholder="비밀번호를 입력해주세요">
									<p class="t_message02"> 비밀번호는 영문 대/소문자, 숫자, 특수문자 중  3가지 이상 8자 최대 16자 까지 입력 가능합니다.</p>
									<p class="t_message" id="message01">※ 영문 대/소문자, 숫자, 특수문자 중 3가지 이상 8자, 최대 16자까지 가능</p>
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>비밀번호 확인</th>
								<td>
									<input type="password" class="in_full" title="비밀번호 확인" maxlength="16" id="PASSWORDChk" name="PASSWORDChk" placeholder="비밀번호를 입력해주세요">
									<p class="t_message02" id="message02"> 비밀번호가 일치하지 않습니다.</p>
								</td>
							</tr>
							<tr>
								<th scope="row">계정연동</th>
								<td>
									<p class="peristalsis"><span class="sns_naver">네이버</span><a href="javascript:void(0);" class="btn bxs02 naverbtn"></a></p>
									<p class="peristalsis"><span class="sns_kakao">카카오</span><a href="javascript:void(0);" class="btn bxs02 kakaobtn"></a></p>
									<p class="peristalsis"><span class="sns_google">구글</span><a href="javascript:void(0);" class="btn bxs02 googlebtn"></a></p>
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>휴대폰</th>
								<td><div>
										<input type="text" class="in_full disabled" title="휴대폰" disabled style="width:calc(100% - 108px)" value="${memberInfo.MBTLNUM }"/>
										<a href="javascript:void(0);" class="btn bs ml5" id="authentication">번호변경</a>
									</div></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td class="phone">
									<select name="AREA_NO" title="전화번호 앞자리" class="w120">
										<option value="02"<c:if test="${memberInfo.AREA_NO eq '02'}"> selected="selected"</c:if>>02</option>
										<option value="031"<c:if test="${memberInfo.AREA_NO eq '031'}"> selected="selected"</c:if>>031</option>
										<option value="032"<c:if test="${memberInfo.AREA_NO eq '032'}"> selected="selected"</c:if>>032</option>
										<option value="033"<c:if test="${memberInfo.AREA_NO eq '033'}"> selected="selected"</c:if>>033</option>
										<option value="041"<c:if test="${memberInfo.AREA_NO eq '041'}"> selected="selected"</c:if>>041</option>
										<option value="042"<c:if test="${memberInfo.AREA_NO eq '042'}"> selected="selected"</c:if>>042</option>
										<option value="043"<c:if test="${memberInfo.AREA_NO eq '043'}"> selected="selected"</c:if>>043</option>
										<option value="044"<c:if test="${memberInfo.AREA_NO eq '044'}"> selected="selected"</c:if>>044</option>
										<option value="051"<c:if test="${memberInfo.AREA_NO eq '051'}"> selected="selected"</c:if>>051</option>
										<option value="052"<c:if test="${memberInfo.AREA_NO eq '052'}"> selected="selected"</c:if>>052</option>
										<option value="053"<c:if test="${memberInfo.AREA_NO eq '053'}"> selected="selected"</c:if>>053</option>
										<option value="054"<c:if test="${memberInfo.AREA_NO eq '054'}"> selected="selected"</c:if>>054</option>
										<option value="055"<c:if test="${memberInfo.AREA_NO eq '055'}"> selected="selected"</c:if>>055</option>
										<option value="061"<c:if test="${memberInfo.AREA_NO eq '061'}"> selected="selected"</c:if>>061</option>
										<option value="062"<c:if test="${memberInfo.AREA_NO eq '062'}"> selected="selected"</c:if>>062</option>
										<option value="063"<c:if test="${memberInfo.AREA_NO eq '063'}"> selected="selected"</c:if>>063</option>
										<option value="064"<c:if test="${memberInfo.AREA_NO eq '064'}"> selected="selected"</c:if>>064</option>
										<option value="070"<c:if test="${memberInfo.AREA_NO eq '070'}"> selected="selected"</c:if>>070</option>
									</select>
									<span>-</span>
									<input type="text" numberOnly maxlength="4" class="w120" title="전화번호 가운데 자리" name="MIDDLE_TELNO" value="<c:out value='${memberInfo.MIDDLE_TELNO }'/>">
									<span>-</span>
									<input type="text" numberOnly maxlength="4" class="w120" title="전화번호 뒷 자리" name="END_TELNO" value="<c:out value='${memberInfo.END_TELNO }'/>">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>성별</th>
								<td>
									<%!
										String gender;
									%>
									<% if("${memberInfo.SEXDSTN_CODE}" == "F") { 
										gender="여자";}
										else {
										gender="남자";
										}
									%>
									<span><%= gender %></span>
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>생년월일</th>
								<td><span>${memberInfo.BIRTH_DT}</span></td>
	
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td class="phone">
									<input type="text"  title="이메일 입력" id="mailId">
									<span>@</span>
									<input type="text"  style="width:calc((100% - -8px) / 3)" title="이메일 입력" id="domain">		
									<select title="메일선택" class="ml5 fsize">
										<option>직접입력</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td>
									<div>
										<input type="text" class="in_full disabled" title="주소입력" disabled style="width:calc(100% - 108px)" value="<c:out value='${memberInfo.ADRES }'/>">
										<a href="javascript:fnDaumPostcode()" class="btn bs ml5">주소등록</a>
									</div>
									<div>
										<input type="text" id="DETAIL_ADRES" value="<c:out value='${memberInfo.DETAIL_ADRES }'/>" class="in_full mt10" title="상세 주소입력" placeholder="상세주소를 입력해주세요.">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row" colspan="2">이메일 수신여부</th>
								<td>
									<input type="checkbox" id="EMAIL_RECV_YN" class="ml20">
									<label for="EMAIL_RECV_YN" style="vertical-align:baseline;">수신</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="hidden" name="ZIP" id="ZIP" value="${memberInfo.ZIP }"/>
				<input type="hidden" name="google" id="google" value="${google.ITL_YN }"/>
				<input type="hidden" name="naver" id="naver" value="${naver.ITL_YN }"/>
				<input type="hidden" name="kakao" id="kakao" value="${kakao.ITL_YN }"/>
				<input type="hidden" name="googleToken" id="googleToken" value="${kakao.TOKEN_SN }"/>
				<input type="hidden" name="naverToken" id="naverToken" value="${kakao.TOKEN_SN }"/>
				<input type="hidden" name="kakaoToken" id="kakaoToken" value="${kakao.TOKEN_SN }"/>
				<input type="hidden" name="MBTLNUM" id="MBTLNUM" value="${memberInfo.MBTLNUM }"/>
				<input type="hidden" name="AREA_NO" value="${memberInfo.AREA_NO }"/>
				<input type="hidden" name="MIDDLE_TELNO" value="${memberInfo.MIDDLE_TELNO }"/>
				<input type="hidden" name="END_TELNO" value="${memberInfo.END_TELNO }"/>
				<input type="hidden" name="MBER_EMAIL_ADRES" value="${memberInfo.MBER_EMAIL_ADRES }"/>
				<input type="hidden" name="ADRES" id="ADRES" value="${memberInfo.ADRES }"/>				
			
				<div class="btn_Lbox"><!-- btn box -->
					<a href="javascript:fnModify()" class="btn in_full bblue">수정</a>
					<a href="javascript:fnCancel('${memberInfo.MBER_ID }')" class="btn btn02 bgreen">취소</a>
					<a href="javascript:fnDrop()" class="btn btn02 bgray">회원탈퇴</a>
				</div>
			</form>
