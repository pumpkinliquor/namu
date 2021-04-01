<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- container -->
<div id="container">
	<div class="no_con">
		<header>회원가입</header>

		<p class="step">
			<span class="fl c_point">본인인증</span>
			<span class="fr"><strong class=" c_point">STEP 02</strong> / 04</span>
		</p>

		<p class="login_top_txt">회원가입을 위한 본인인증을 진행해주세요</p>

		<div class="box_gate">
			<a href="javascript:void(0);" class="b_gate06" id="authentication">휴대전화 인증</a>
		</div>

		<div class="btn_Lbox"><!-- btn box -->
			<a href="javascript:void(0);" class="btn bgreen ml0" id="prevPage">이전</a>
		</div>
		
		<form action="/user/cmm/mem/signup.do" id="authenticationform" method="post">
			<input type="hidden" name="step" value="" />
		
			<c:choose>
				<c:when test="${api ne null}">
					<input type="hidden" name="api" value='${api}'>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="api" value="" />
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${apiID ne null}">
					<input type="hidden" name="apiID" value='${apiID}'>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apiID" value="" />
				</c:otherwise>
			</c:choose>
		
			<c:choose>
				<c:when test="${apiName ne null}">
					<input type="hidden" name="USER_NM" value='${apiName}'>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="USER_NM" value="" />
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${apiGender ne null}">
					<input type="hidden" name="GENDER_CD" value='${apiGender}' />
				</c:when>
				<c:otherwise>
					<input type="hidden" name="GENDER_CD" value="" />
				</c:otherwise>
			</c:choose>
		
			<c:choose>
				<c:when test="${apiEmail ne null}">
					<input type="hidden" name="apiEmail" value='${apiEmail}' />
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apiEmail" value="" />
				</c:otherwise>
			</c:choose>
		
			<input type="hidden" name="BIRTH_DT" value="" />
			<input type="hidden" name="MOBILE_PHONE_NO" value="" />
		</form>
		
		
		<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
		
		<script>
		
			// 스크롤
			$(window).on("load",function(){
				$.mCustomScrollbar.defaults.scrollButtons.enable=true;
				$.mCustomScrollbar.defaults.axis="yx";
				$(".s01").mCustomScrollbar({theme:"minimal-dark"});
			});
			
			/**
			 *	2019-09-29
			 *  김명진
			 *  Event bind
			 */
			$("#prevPage").on("click",function(e){
				e.preventDefault();
				window.history.back();
			});
			
			// 휴대전화 인증
			$("#authentication").on("click",function(e){
				var URL = "<c:url value='/danal/Ready.do'/>";
				var popupName = "_blank";
				var popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
				
				window.open(URL, popupName, popupOptions);
			});
		
			// 휴대전화 인증 완료 후 처리
			function fnNextStep(tid, name, iden, phone) {
				var agree01 = "${agree01}";
				var agree02 = "${agree02}";
				var birthDt = iden.substr(0,6);
				var genderCd = iden.substr(6,1);
				var phoneNo = phone.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3");	// "-"입력
				
				if(agree01 && agree02) {		// 약관동의
					if(genderCd == "1" || genderCd == "5") {		// 1900년대 남자(국내,외국인)
						$("input[name=GENDER_CD]").val("M");
						$("input[name=BIRTH_DT]").val("19"+birthDt);
					}
					else if(genderCd == "2" || genderCd == "6") {	// 1900년대 여자(국내,외국인)
						$("input[name=GENDER_CD]").val("F");
						$("input[name=BIRTH_DT]").val("19"+birthDt);
					}
					else if(genderCd == "3" || genderCd == "7") {	// 2000년대 남자(국내,외국인)
						$("input[name=GENDER_CD]").val("M");
						$("input[name=BIRTH_DT]").val("20"+birthDt);
					}
					else if(genderCd == "4" || genderCd == "8") {	// 2000년대 여자(국내,외국인)
						$("input[name=GENDER_CD]").val("F");
						$("input[name=BIRTH_DT]").val("20"+birthDt);
					}
					
					$("input[name=step]").val("03");
					$("input[name=USER_NM]").val(name);
					$("input[name=MOBILE_PHONE_NO]").val(phoneNo);
					
					$("#authenticationform").submit();
				}
			}
			
		</script>
