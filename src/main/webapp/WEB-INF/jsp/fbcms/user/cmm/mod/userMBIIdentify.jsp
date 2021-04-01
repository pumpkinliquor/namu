<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script type="text/javascript">

	function fnUserModify() {
				
		var PASSWORD = document.infoChkForm.PASSWORD.value;
		
		
		var object = {
				url:"/user/cmm/mod/passwordChk.do"
			  , data: {"PASSWORD" : PASSWORD}
			  , fnSuccess: function(data) {
				  if(data.result === 1) {
					 location.href="/user/cmm/mod/modifyMBIView.do";
					 /* location.href="user/cmm/mod/userMBIModify"; */
				  }
				  else {
					  alert("비밀번호를 확인해주세요 ");
				  }
			  }
		}
		fnAjax(object);
	}
	
	function enter() {
		if (window.event.keyCode == 13) {
			fnUserModify()
		}
	}
	
</script>

	<!-- container -->
	<div class="container" id="contents">

		<!-- contents s -->
		<div class="contents w1200">
			<form name="infoChkForm" action="" method="post">
			<section class="re_login login02">
				<header>회원정보 수정</header>
				<p class="login_top_txt">본인확인을 위해 비밀번호를 입력해주세요</p>
				<div class="re_loginbox re_loginbox03 mt55">
					<p><label><em class="ootc">*</em>아이디</label>
						<input type="text" title="아이디" class="inptxt" disabled value="${membersVO.MBER_ID }">
					</p>
					<p><label for="rePw"><em class="ootc">*</em>비밀번호</label>
						<input type="password" id="rePw" maxlength="16" name="PASSWORD"  onkeypress="enter();">
					</p>
				</div>
				<div class="btn_Lbox"><!-- btn box -->
					<a href="/user/cmm/mod/userMBIMypageView.do" class="btn bgreen">취소</a>
					<a href="javascript:fnUserModify()" class="btn bblue">회원정보 수정</a>
				</div>
			</section>
			</form>
		</div>
		<!-- //contents e -->

	</div>