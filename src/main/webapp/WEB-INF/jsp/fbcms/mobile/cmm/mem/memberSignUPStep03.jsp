<%@page import="egovframework.com.utl.sim.service.EgovFileScrty"%>
<%@page import="javax.annotation.Resource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
})
</script>

<fmt:parseDate var="birth" value="${memberinfo.BIRTH_DT}" pattern="yyyyMMdd" />
<fmt:formatDate var="birthday" value="${birth}" pattern="yyyy.MM.dd"/>

<!-- container -->
<div id="container">
	<div class="no_con">
		<form action="javascript:void(0);" method="post" id="signupform">
			<header>회원가입</header>
	
			<p class="step">
				<span class="fl c_point">정보입력</span>
				<span class="fr"><strong class=" c_point">STEP 03</strong> / 04</span>
			</p>
	
			<p class="n_txt"><em class="ootc">*</em>필수입력 항목</p>
	
			<div class="tdetail tdetail03 mar0">
				<table>
					<caption>리스트 상세 등록 페이지</caption>
					<tbody>
						<tr>
							<th scope="row"><em class="ootc">*</em>이름</th>
							<td>${memberinfo.USER_NM }</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>아이디</th>
							<td>
								<input type="text" style="width:calc(100% - 105px)" title="아이디" maxlength="40" id="userId" name="USER_ID" placeholder="아이디를 입력해주세요">
								<a href="javascript:void(0);" class="btn bs ml5" id="checkById">중복확인</a>
								<p class="t_message hide" id="t_message01"> 사용 가능한 아이디입니다.</p>
								<p class="t_message02 hide" id="t_message02"> 이미 사용중인 아이디입니다.</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>비밀번호</th>
							<td>
								<input type="password" class="in_full" title="비밀번호" maxlength="16" id="password" name="PW_NM" placeholder="비밀번호를 입력해주세요">
								<p class="t_message02" id="passwordinfo"> 비밀번호는 영문 대/소문자, 숫자, 특수문자 중  3가지 이상 8자 최대 16자 까지 입력 가능합니다.</p>
								<p class="t_message hide" id="passwordinfo2 ">※ 영문 대/소문자, 숫자, 특수문자 중 3가지 이상 8자, 최대 16자까지 가능</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>비밀번호 확인</th>
							<td>
								<input type="password" class="in_full" title="비밀번호 확인" maxlength="16" id="passwordconfirm" placeholder="비밀번호를 입력해주세요">
								<p class="t_message02 hide" id="passwordconfirminfo"> 비밀번호가 일치하지 않습니다.</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>휴대폰</th>
							<td>${memberinfo.MOBILE_PHONE_NO }</td>
							<input type="hidden" name="MOBILE_PHONE_NO" value="${memberinfo.MOBILE_PHONE_NO }"/>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td class="phone">
								<select title="전화번호 앞자리" name="PHONE_NO" class="w120" id="phfirst">
									<option>02</option>
									<option>031</option>
									<option>032</option>
									<option>033</option>
									<option>041</option>
									<option>042</option>
									<option>043</option>
									<option>044</option>
									<option>051</option>
									<option>052</option>
									<option>053</option>
									<option>054</option>
									<option>055</option>
									<option>061</option>
									<option>062</option>
									<option>063</option>
									<option>064</option>
								</select>
								<span>-</span>
								<input type="text" numberOnly class="w120" maxlength="4" name="middleTelno" id="phmid" title="전화번호 가운데 자리" onkeypress="onlyNumber()">						<span>-</span>
								<input type="text" numberOnly class="w120" maxlength="4" name="endTelno" id="phlast" title="전화번호 뒷 자리" onkeypress="onlyNumber()">
							</td>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>성별</th>
							<c:choose>
								<c:when test="${memberinfo.GENDER_CD eq 'M'}">
									<td>남</td>
								</c:when>
								<c:when test="${memberinfo.GENDER_CD eq 'F'}">
									<td>여</td>
								</c:when>
							</c:choose>
							<input type="hidden" name="GENDER_CD" value="${memberinfo.GENDER_CD }"/>
						</tr>
						<tr>
							<th scope="row"><em class="ootc">*</em>생년월일</th>
							<td>${birthday}</td>
							<input type="hidden" name="BIRTH_DT" value="${memberinfo.BIRTH_DT }"/>
	
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td class="phone">
								<input type="text" title="이메일 입력" id="emailDetail">
								<span>@</span>
								<input type="text" style="width:calc((100% - -8px) / 3)" title="이메일 입력" id="emailDomain">
								<select title="메일선택" class="w120 ml5" id="emailSelect">
									<option>직접입력</option>
									<option value="gmail.com">구글</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="kakao.com">카카오</option>
									<option value="nate.com">네이트</option>
								</select>
								<input type="hidden" name="EMAIL_ID" value=""/>
							</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>
								<div>
									<input type="text" class="in_full disabled" id="address" title="주소입력" disabled style="width:calc(100% - 108px)">
									<input type="hidden" name="address" id="_address"/>
									<input type="hidden" name="POST_NO" id="postCode" value=""/>
									<a href="#" id="searchAddress" class="btn bs ml5">주소등록</a>
								</div>
								<div>
									<input type="text" name="detailAddress" id="addressDetail" class="in_full disabled mt10" title="상세 주소입력" placeholder="상세주소를 입력해주세요">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" colspan="2">이메일 수신여부</th>
							<td>
								<input type="checkbox" id="reception" class="ml20" name="EMAIL_RECV_YN" value="N">
								<label for="reception" style="vertical-align:baseline;">수신</label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn btn02 bgreen" id="prevPage">이전</a>
				<a href="javascript:void(0);" class="btn btn02 bblue" id="nextPage">다음</a>
			</div>
		</form>
		
		<form action="signup.do" id="authenticationform" method="post">
			<input type="hidden" name="step" id="step" value=""/>
			<input type="hidden" name="name" id="name" value=""/>
		</form>
		
	<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
	<script src="/js/fbcms/user/ajax_cmm.js"></script>

	<script>
		
		if('${apiEmail}' != null && '${apiEmail}' != ""){
			
			var email = "${apiEmail}"
				
			email = email.split("@");
		
			$("#emailDetail").val(email[0])
			$("#emailDetail").attr("readonly",true);
			$("#emailDomain").val(email[1])
			$("#emailDomain").attr("readonly",true);	
			$("#emailSelect").attr("disabled",true);
		}
	
		//패스워드 패턴 확인
		function checkPassWordPattern(str){
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[`=\,./;~!@#$%^&*()_+|<>?:{}]/;
			
			// 3가지를 모두 사용 , 8글자 이상일 경우  true
			if(pattern1.test(str) && pattern2.test(str) && pattern3.test(str) && str.length>=8){		
				return true;
			// 이 밖에 모두  false
			}else{
				return false;
			}
		}
		
		// 전화번호에 숫자만 넣었는지 확인
		function onlyNumber(){
			if((event.keyCode<48)||(event.keyCode>57))
				event.returnValue=false;
		}
		
		// 스크롤
		$(window).on("load",function(){
			$.mCustomScrollbar.defaults.scrollButtons.enable=true;
			$.mCustomScrollbar.defaults.axis="yx";
			$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		});
	    
	    // 중복확인
	    $("#checkById").on("click", function(e){
	        e.preventDefault();
	        var USER_ID = $("#userId").val();
	        var obj = {
	            url : "/user/lgn/api/joinCheck.do",
	            dataType : "text",
	            data : {USER_ID:USER_ID},
	            fnSuccess :   function(data){
	                        if(data==1){
	                        	$("#t_message02").removeClass("hide");
	                        	$("#t_message01").addClass("hide")
	                        }
	                        else if(data==0){
	                        	$("#t_message01").removeClass("hide")
	                        	$("#t_message02").addClass("hide")
	                        }
	                        else{
	                        }
	                        
	                        },
	            fnError:      function(request, status, err){
	                            alert(request.responseText);
	                        }
	        };
	        fnAjax(obj);
	    });
	    
	    // 주소등록
	    $("#searchAddress").on("click",function(e){
	    	e.preventDefault();
	    	execDaumPostcode();
	    });
	    
	    // 이전
	    $("#prevPage").on("click",function(e){
			e.preventDefault();
			
			var res = confirm("회원가입을 취소하시겠습니까?")
			if(res==1) {
				window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/index.do");
			}
		 });
	    
	    // 다음
	    $("#nextPage").on("click",function(e){
	    	e.preventDefault();
	
			var user_Id = $("#userId").val();
	    	var name = '${memberinfo.USER_NM}';
	    	var pass = $("#password").val();
	    	
	    	// 아이디 확인
	   		if($("#userId").val() == ""){
	       		alert("아이디를 확인해주세요");
	       		return false;
	       	}
	   		else if($("#t_message01").attr("class") != "t_message"){
	       		alert("중복확인을 해주세요");
	       		return false;
	    	}
	    	
	    	// 패스워드 확인
	   		if($("#password").val() == "" || $("#passwordconfirm").val() == ""){
	       		alert("비밀번호를 입력해주세요");
	       		return false;
	       	}
	   		else if($("#passwordconfirm").val() != $("#password").val()){
	       		alert("비밀번호를 확인해 주세요");
	       		return false;
	       	}
	    	else if(!checkPassWordPattern($("#password").val())) {
	       		alert("비밀번호를 확인해 주세요");
	       		return false;
	    	}
	   		
	   		var phone = '${memberinfo.MOBILE_PHONE_NO }';
	   		var phfirst = $("#phfirst").val();
			var phmid = $("#phmid").val();
	  		var phlast = $("#phlast").val();
	
	   		var call = phfirst+"-"+phmid+"-"+phlast;
	   		var gender = '${memberinfo.GENDER_CD }';
	   		var birth = "${memberinfo.BIRTH_DT }";
			
	   		// 이메일 확인
	   		if($("#emailDetail").val() == "") {
	   			alert("이메일을 입력해주세요");
	   			return false;
	   		}
	   		
	   		if($("#emailDomain").val() == "") {
	   			alert("이메일을 입력해주세요");
	   			return false;
	   		}
	
			var emailDetail = $("#emailDetail").val();
			var emailDomain = $("#emailDomain").val();
	   		var email = emailDetail+"@"+emailDomain;
	   		
	   		// 주소 확인
	   		if($("#address").val() == "") {
	   			alert("주소를 입력해주세요");
	   			return false;
	   		}
	   		else if($("#addressDetail").val() == "") {
	   			alert("주소를 입력해주세요");
	   			return false;
	   		}
	
	   		var zip = $("#postCode").val();
	   		var addr = $("#_address").val();
			var addr_det = $("#addressDetail").val();
			
	   		var mailre = "N";
	   		if($("#reception").is(":checked") == true) {
	   			mailre = "Y";
	   		}
	   		
			var api = '${api}'
			var apiID = '${apiID}'
	   		var apiSign = {
	   				
	   			url : "/user/lgn/api/apisign.do"
	 			, dataType : "text"
	 	        , data : {user_Id:user_Id,api:api,apiID:apiID}
	   			, fnSuccess : function(data){
	   	 	          if(data==1){
	   	 	          }
	 		        }
	   	   			,fnError: function(error){
	 		        }
	   		}
			
	   		if(api != null && api != "" && api !=" "){
	   			fnAjax(apiSign)   			
	   		}
	   		   		
	    	var sign = {
	 			url : "/user/cmm/mem/sign.do"
	 			, dataType : "text"
	 	        , data : {name:name,user_Id:user_Id,pass:pass,phone:phone,phfirst:phfirst,phmid:phmid,phlast:phlast
	 	        	   ,gender:gender,birth:birth,email:email,zip:zip,addr:addr,addr_det:addr_det,mailre:mailre}
	   			, fnSuccess : function(data){
					if(data == 1) {
		 	        	var sign2 = {
	 	        			url : "/user/cmm/mem/sign2.do"
	 	        			, dataType : "text"
	 	        			, data : {user_Id:user_Id}
	 	           			, fnSuccess : function(data){
	 	        	          if(data==1){
	 	        	 	    	$("#step").val('04');
	 	        	 	    	$("#name").val(name);
	 	        	 	    	$("#authenticationform").submit();
	 	        	          }
	 	        	        }
		 	        	}
	 	           		fnAjax(sign2)
	 	        	}
		        }
	        }
	   		
	   		fnAjax(sign)	
	    });
	    
	    /**
	     *  password keyup 정규식
	     */
	    $("#password").keyup(function(e){
	    	
	    	e.preventDefault();
	    	if(!checkPassWordPattern($("#password").val())) {
	    		$("#passwordinfo").addClass("hide");
	    		$("#passwordinfo02").removeClass("hide");
	    		
	    	} else {
		    	$("#passwordinfo02").addClass("hide");
				$("#passwordinfo").removeClass("hide");
			}
	    });
	    
	    $("#passwordconfirm").keyup(function(e){
	    	if($("#passwordconfirm").val() !== $("#password").val()) {
	    		$("#passwordconfirminfo").removeClass("hide");
	    		
	    	} else {	
	    		$("#passwordconfirminfo").addClass("hide");
	    	}
	    });
	    
	    // 이메일 도메인 선택
	    $("#emailSelect").on("change", function(){
	    	$("#emailDomain").val($(this).val());
	    });
	    
	    // 다음 우편번호API
	    function execDaumPostcode(){
	    	new daum.Postcode({
	    		oncomplete: function(data) {
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
	                document.getElementById('postCode').value = data.zonecode;
	                document.getElementById("_address").value = addr;
	                $("#address").val($("#postCode").val()+"  "+$("#_address").val());
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addressDetail").focus();
	            }
	    	}).open();
	    };
	    
	</script>
