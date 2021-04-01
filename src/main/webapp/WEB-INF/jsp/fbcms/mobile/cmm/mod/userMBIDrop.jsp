<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">

/* 초기화 */
$(function() {
	/* layer */
	$('.popup').click(function(event) {
		$('.layer').after('<div class="dim"></div>');
		$('.layer').show();
		$('.layer').attr('tabindex', -1).focus();
		$('.layer').css({
			marginLeft: - $('.layer').outerWidth() / 2,
			marginTop: - $('.layer').outerHeight() / 2
		});
	});
	$('.layer_close,.layer .close').click(function(event) {
		
		document.userDrop.action = "<c:url value='/user/cmm/mod/dropMBI.do'/>";
		
		if (document.getElementById('choose01').checked) {
			document.userDrop.DROP_RESN_CD.value = "01";
		} else if(document.getElementById('choose02').checked) {
			document.userDrop.DROP_RESN_CD.value = "02";
		} else if(document.getElementById('choose03').checked) {
			document.userDrop.DROP_RESN_CD.value = "03";
		} else if(document.getElementById('choose04').checked) {
			document.userDrop.DROP_RESN_CD.value = "04";
		} else if(document.getElementById('choose05').checked) {
			document.userDrop.DROP_RESN_CD.value = "05";
		} else if(document.getElementById('choose06').checked) {
			document.userDrop.DROP_RESN_CD.value = "06";
		}
		
		document.userDrop.submit();
		
	});
})

</script>

<!-- container -->
<div id="container">
	<div class="no_con">
		<header>회원 탈퇴</header>
		<form name="userDrop" action="" method="post">
			<p class="login_top_txt">탈퇴 후 개인정보 및 예약한 내역이 모두 삭제됩니다<br>
			회원탈퇴를 원하시는 경우 <br>아래의 탈퇴사유를 선택해주세요</p>
			<div class="mem_choose">
				<p><input type="radio" id="choose01" name="choose" checked><label for="choose01">병원 서비스를 더 이상 이용하지 않아서</label></p>
				<p><input type="radio" id="choose02" name="choose"><label for="choose02">잦은 서비스 오류 및 장애</label></p>
				<p><input type="radio" id="choose03" name="choose"><label for="choose03">예약 시스템이 불편해서</label></p>
				<p><input type="radio" id="choose04" name="choose"><label for="choose04">개인정보 유출이 우려되어서</label></p>
				<p><input type="radio" id="choose05" name="choose"><label for="choose05">재가입하기 위해서</label></p>
				<p><input type="radio" id="choose06" name="choose"><label for="choose06">기타</label></p>
			</div>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn btn02 bgreen popup">회원탈퇴</a>
				<a href="javascript:void(0);" class="btn btn02 bblue">취소</a>
			</div>
			<input type="hidden" name="USER_ID" value=""/>
			<input type="hidden" name="DROP_RESN_CD" value=""/>
			<input type="hidden" name="DROP_DT" value=""/>
		</form>
		
		<!-- layer: 탈퇴 완료 s -->
		<div class="layer">
			<h5 class="layer_tit">회원 탈퇴 완료</h5>
			<p class="layer_txt">그동안 나무병원 홈페이지를<br>이용해 주셔서 감사합니다</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn bblue close">확인</a>
			</div>
			<a href="javascript:void(0);" class="layer_close">닫기</a>
		</div>
		<!-- //layer: 탈퇴 완료 e -->
