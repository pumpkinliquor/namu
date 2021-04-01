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
	
</script>

<!-- container -->
<div id="container">
	<div class="no_con">
		<header>회원정보 수정</header>
		<form name="infoChkForm" action="" method="post">
			<p class="login_top_txt">본인확인을 위해 비밀번호를 입력해주세요</p>
			<div class="re_loginbox">
				<p><label><em class="ootc">*</em>아이디</label>
					<input type="text" title="아이디" class="disabled" disabled value="${membersVO.MBER_ID }">
				</p>
				<p><label for="rePw"><em class="ootc">*</em>비밀번호</label>
					<input type="password" id="rePw" maxlength="16" name="PASSWORD">
				</p>
			</div>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn btn02 bgreen">취소</a>
				<a href="javascript:fnUserModify()" class="btn btn02 bblue">회원정보 수정</a>
			</div>
		</form>
		