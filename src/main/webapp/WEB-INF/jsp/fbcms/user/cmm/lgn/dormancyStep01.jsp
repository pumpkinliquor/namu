<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div class="container" id="contents">

	<!-- contents s -->
	<div class="contents w1200">

		<section class="re_login login02">
			<header>휴면계정 해제 안내</header>
			<p class="login_top_txt">
				고객님의 계정은 현재 휴면 상태입니다<br> <span class="c_point">원활한 서비스를
					위하여 휴면 해제하세요!</span>
			</p>

			<p class="box_login_gray">
				정보통신망 이용촉진 및 정보보호 등에 관한 법률 제29조 및 동법시행령 제16조에 의거,<br> 고객님의 정보를
				안전하게 보호하기 위하여 이용 내역이 없는 경우 휴면 상태로 전환하여 분리보관하고 있습니다<br> 휴면회원은
				서비스 이용이 제한될 수 있으며, 본인인증 후 휴면 해제가 가능합니다
			</p>
			<div class="re_loginbox">
				<p>
					<label for="reId">아이디</label> <input type="text" id="reId"
						placeholder="아이디를 입력해주세요">
				</p>
				<p>
					<label for="reName">이름</label> <input type="text" id="reName"
						placeholder="이름을 입력해주세요">
				</p>
				<p>
					<label for="rephfirst">휴대폰</label> <select title="휴대폰 앞자리" id="rephfirst">
						<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
					</select> <span>-</span> <input type="text" title="휴대폰 중간자리" id="rephmid" maxlength="4" onkeypress="onlyNumber()"> <span>-</span>
					<input type="text" title="휴대폰 뒷자리" id="rephlast" maxlength="4" onkeypress="onlyNumber()">
				</p>
			</div>
			<div class="btn_Lbox">
				<!-- btn box -->
				<a href="/user/lgn/sin/userLogin.do" class="btn bgreen" id="prevPage">취소</a> <a href="javascript:void(0);"
					class="btn bblue" id="authentication">휴면 해제</a>
			</div>
		</section>

	</div>
	<!-- //contents e -->

	<form action="dormancy.do" id="authenticationform" method="post">
		<input type="hidden" name="step" value="" id="step"/>
	</form>

</div>
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>

	function onlyNumber(){
	
		if((event.keyCode<48)||(event.keyCode>57))
	
			event.returnValue=false;
	
	}

	/* //스크롤
	$(window).on("load", function() {
		$.mCustomScrollbar.defaults.scrollButtons.enable = true;
		$.mCustomScrollbar.defaults.axis = "yx";
		$(".s01").mCustomScrollbar({
			theme : "minimal-dark"
		});
	}); */


	$("#authentication").on("click", function(e) {
		e.preventDefault();

		
		var USER_ID = $("#reId").val();
		
		var name = $("#reName").val();
			
		var phone =$("#rephfirst").val()+"-"+$("#rephmid").val()+"-"+$("#rephlast").val();
		

		var obj = {
				
			url : "/user/lgn/sin/okdormancy.do",
			data : {USER_ID : USER_ID,name:name,phone:phone},
			dataType : "text",
			fnSuccess : function(data) {
				if(data==1){
					$("#step").val('02');
					$("#authenticationform").submit();
				}
				
			}
			
		}
		fnAjax(obj);

	});
</script>



