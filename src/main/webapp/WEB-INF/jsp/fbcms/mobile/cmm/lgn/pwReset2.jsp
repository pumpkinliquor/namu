<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

	<!-- container -->
<div id="container">
	<div class="no_con login02">
		<header>비밀번호 재설정</header>
			<p class="login_top_txt">변경할 비밀번호를 입력해주세요</p>
			<div class="re_loginbox">
				<div class="box_gate">
					<a href="javascript:void(0);" class="b_gate06" id="authentication">휴대전화 인증</a>
				</div>
				<p><label for="rePw">새 비밀번호</label>
					<input type="password" id="rePw" maxlength="16" placeholder="비밀번호를 입력해주세요">
				</p>
				<p class="t_message" id="passwordinfo">※ 영문 대/소문자, 숫자, 특수문자 중 3가지 이상 8자, 최대 16자까지 가능</p>
				<p class="t_message02 hide" id="passwordinfo02">* 비밀번호는 영문 대/소문자, 숫자, 특수문자 중  3가지 이상 8자 최대 16자 까지 입력 가능합니다.</p>
				<p><label for="rePw02">비밀번호 확인</label>
					<input type="password" id="rePw02" maxlength="16" placeholder="비밀번호를 다시 한번 입력해주세요">
				</p>
				<p class="t_message02 hide" id="passwordconfirminfo">* 비밀번호가 일치하지 않습니다.</p>
			</div>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn bblue" id="submit">확인</a>
			</div>
		</section>

	</div>
		<!-- //contents e -->
</div>
	
	<form action="/user/lgn/sin/userLogin.do" method="post" id="finish">
	
	</form>
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>
	var USER_ID = '${USER_ID}';
	var userName = '';
	var birthDt = '';
	var gender = '';
	// 패스워드 패턴 확인
	function checkPassWordPattern(str){
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[`=\,./;~!@#$%^&*()_+|<>?:{}]/;
		if(pattern1.test(str) && pattern2.test(str) && pattern3.test(str) && str.length>=8){
			return true;
		}
		else if(pattern1.test(str) && pattern2.test(str) && str.length>=10){
			return true;
		}
		else if(pattern1.test(str) && pattern3.test(str) && str.length>=10){
			return true;
				
		}
		// 2가지를 사용 , 10글자 이상일 경우  true
		else if(pattern2.test(str) && pattern3.test(str) && str.length>=10){
			return true;
		}
		// 이 밖에 모두  false
		else{
			return false;
		}
	}
	$("#rePw").keyup(function(e) {
		e.preventDefault();
		if (!checkPassWordPattern($("#rePw").val())) {
			$("#passwordinfo").addClass("hide");
			$("#passwordinfo02").removeClass("hide");
		} else {
			$("#passwordinfo02").addClass("hide");
			$("#passwordinfo").removeClass("hide");
		}
	});

	$("#rePw02").keyup(function(e) {
		if ($("#rePw02").val() !== $("#rePw").val()) {
			$("#passwordconfirminfo").removeClass("hide");
		} else {
			$("#passwordconfirminfo").addClass("hide");
		}
	});
	$("#submit").on("click", function() {
		if ($("#rePw02").val() === '' || $("#rePw").val() === '') {
			alert("비밀번호를 입력해 주세요")
		} else if ($("#rePw02").val() !== $("#rePw").val()) {
			alert("비밀번호 확인을 다시 해주세요")
		} else if (gender === '' || userName === '' || birthDt === '') {
			alert('본인인증 후 진행하여 주시기 바랍니다.');
		} else {
			var PW = $("#rePw").val();
			var obj = {
				url : "/user/lgn/sin/pwchange.do",
				data : {
					  USER_ID : USER_ID
					, PW : PW
					, SEXDSTN_CODE : gender
					, name : userName
					, birthDt : birthDt
					, ctn : ctn
					, flag : 'Y'
					},
				dataType : "json",
				fnSuccess : function(data) {
					if(data==1){
						alert("정보 변경이 완료되었습니다")
						$("#finish").submit();
					}
					else{
						alert("일치하는 정보가 없습니다")
						$("#finish").submit();
					}
				}
			}
			fnAjax(obj);
		}

	})
	
	$("#authentication").on("click",function(e){
		var URL = "<c:url value='/danal/Ready.do'/>";
		var popupName = "_blank";
		var popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
		
		window.open(URL, popupName, popupOptions);
	});
	
	function fnNextStep(tid, name, iden, phone) {
		var genderCd = iden.substr(6,1);
		var phoneNo = phone.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3");	// "-"입력
		var birthDt6 = iden.substr(0,6);
		userName = name;
		ctn = phoneNo;
		
		if(genderCd == "1" || genderCd == "5") {
			gender = "M";
			birthDt = "19"+birthDt6;
		}
		else if(genderCd == "2" || genderCd == "6") {
			gender = "F";
			birthDt = "19"+birthDt6;
		}
		else if(genderCd == "3" || genderCd == "7") {
			gender = "M";
			birthDt = "20"+birthDt6;
		}
		else if(genderCd == "4" || genderCd == "8") {
			gender = "F";
			birthDt = "20"+birthDt6;
		}
	}
</script>
