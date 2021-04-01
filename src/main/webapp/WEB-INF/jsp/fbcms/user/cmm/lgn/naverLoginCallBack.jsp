<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="egovframework.com.cmm.service.Globals" %>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>

	<!-- ajax를 위한 스크립트 -->
	<script src="https://code.jquery.com/jquery.js"> </script>
	<script src="/js/fbcms/user/ajax_cmm.js"></script>

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
	var ref = '${ref}';
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{OEvusSfkS0cBfqvCmRLf}",
				callbackUrl: "/user/lgn/api/naverLoginCallBack.do",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var naverID = naverLogin.user.getId();
					var name = naverLogin.user.getName()
					if( name == undefined || name == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						//(5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 				
						
						window.location.replace("https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=OEvusSfkS0cBfqvCmRLf&state=a084403e-ce9a-42a5-a92f-0bb564f00412&redirect_uri=https%3A%2F%2F"+"<%=Globals.DOMAIN%>"+"%2Fuser%2Flgn%2Fapi%2FnaverLoginCallBack.do&version=js-2.0.0&auth_type=reprompt")
						return;
					}
					
					
					var gender = naverLogin.user.getGender()
					if( gender == undefined || gender == null) {
						alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
						//(5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 	
						window.location.replace("https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=OEvusSfkS0cBfqvCmRLf&state=a084403e-ce9a-42a5-a92f-0bb564f00412&redirect_uri=https%3A%2F%2F"+"<%=Globals.DOMAIN%>"+"%2Fuser%2Flgn%2Fapi%2FnaverLoginCallBack.do&version=js-2.0.0&auth_type=reprompt")
						return;
					}
					
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						//(5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 
						window.location.replace("https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=OEvusSfkS0cBfqvCmRLf&state=a084403e-ce9a-42a5-a92f-0bb564f00412&redirect_uri=https%3A%2F%2F"+"<%=Globals.DOMAIN%>"+"%2Fuser%2Flgn%2Fapi%2FnaverLoginCallBack.do&version=js-2.0.0&auth_type=reprompt")
						
						return;
					}
					
					var obj = {
							url:"/user/lgn/api/apiCheck.do"
							, data: {USER_ID : naverID}
							, dataType : "text"
							, fnSuccess: function(data) {
								if(data==1) {
									naverID = naverID;
									var find = {
										url:"/user/lgn/api/findforAPI.do"
										, data: {USER_ID : naverID}
										, dataType : "json"
										, fnSuccess: function(data) {
											$("#reId",opener.document).val(data.mber_ID);
											$("#rePw",opener.document).val(data.password);
											$("#ITL_YN",opener.document).val("Y");
											$("#loginForm",opener.document).submit();
											window.close()
										}, fnError : function(error) {
										}
									}
									
									fnAjax(find);
									
								} else if(data==0) {
									$("#api",opener.document).val("NAVER");
									$("#apiID",opener.document).val(naverID);
									$("#naverToken",opener.document).val(naverID);
									$("#apiName",opener.document).val(name);
									$("#apiGender",opener.document).val(gender);
									$("#apiEmail",opener.document).val(email);
									$("#apiform",opener.document).submit();
									window.close()
								}
								
							}
						}
					fnAjax(obj);
				} else {
				}
			});
		});
	</script>
</body>

</html>
