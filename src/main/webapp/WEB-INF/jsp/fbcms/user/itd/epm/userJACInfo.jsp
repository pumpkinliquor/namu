<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>


<script type="text/javascript">
	<c:if test="${errorCode eq '9999'}">
		alert('입사지원정보가 없습니다.');
	</c:if>
	
	/* ********************************************************
	 * 입사지원 처리 함수
	 ******************************************************** */
	function fnJACUpdate() {
	  	document.articleForm.action = "<c:url value='/user/itd/epm/updateJACView.do'/>";
	  	document.articleForm.submit();
	}
</script>

<!-- contents s -->
<div class="contents w1200">
	
	<section class="re_login login02">
		<header>입사지원내역</header>
		<p class="login_top_txt">입사지원자 본인 이름과 설정한 비밀번호를 입력해주세요</p>
		
		<form name="articleForm" method="post" onSubmit="fnJACUpdate(); return false;">
			<div class="re_loginbox mt50">
				<p><label for="reName" class="w80">이름</label>
					<input type="text" id="reName" name="ntcrNm" placeholder="이름을 입력해주세요">
				</p>
				<p><label for="rebd" class="w80">생년월일</label>
					<input type="text" id="rebd" name="customDate1" maxlength="8" placeholder="YYYYMMDD" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '');"/>
				</p>
				<p><label for="repw" class="w80">비밀번호</label>
					<input type="password" id="repw" name="password" placeholder="비밀번호를 입력해주세요">
				</p>
			</div>

			<div class="btn_Lbox"><!-- btn box -->
				<a href="<c:url value='/user/itd/epm/employmentGuide.do'/>" class="btn bgreen w280">메인</a>
				<a href="#none" onclick="javascript:fnJACUpdate()" class="btn bblue w280 pd0">입사지원내역 조회&middot;수정</a>
			</div>
		</form>
	</section>
