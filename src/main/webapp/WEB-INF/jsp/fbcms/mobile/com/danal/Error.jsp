<%@ page contentType="text/html; charset=UTF-8" %>
<%
	/*
	 * Get BgColor
	 */
	 BgColor = GetBgColor( BgColor );
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>다날 본인인증</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/danal/style.css" type="text/css" rel="stylesheet"  media="screen" />
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script language="JavaScript" src="/js/danal/Common.js" type="text/javascript"></script>
</head>
<body onload="changeFontSize();">
	
<div class="Wrap">
    <!--HEADER START-->
	<div class="header01">
		<ul>
			<li><h1>다날 본인확인 서비스</h1></li>
			<li class="ci_danal">다날로고</li>
		</ul>
	</div>
    <div class="step bg_<%=BgColor%>">
        <ul>
		<li><b>인증서비스에러</b></li>
        </ul>
    </div>
    <div class="header02">
        <div class="wrap_txtsize">
            <button class="btn_minus"  onClick="return false;">-</button>
            <p class="txtsize">글씨크기</p>
            <button class="btn_plus"  onClick="return false;">+</button>
        </div>
    </div>
    <!--//HEADER END-->
    <!--CONTENT START-->
    <div class="content">
        <div class="wrap_content"> <!--레이어팝업이 있을 경우 style="display: none;"-->
            <div class="box_style03">
				<p><strong>에러 내용(<%=RETURNCODE%>)</strong></p>
				<p><%=RETURNMSG%></p>
            </div>
            <ul class="notice">
                <li class="bullet">다날 고객센터 : 1566-3355 (평일 9시 ~ 18시 통화가능 / 토,일,공휴일 휴무)</li>
            </ul>
        </div>
        <div class="btnfucntion">
            <label for="okay" ><input id="okay" class="bg_<%=BgColor%>" type="button" value="확인" /></label>
        </div>
        <ul class="certification">
            <li class="wau">웹접근성 인증마크</li>
        </ul>
    </div>
    <!--//CONTENT END-->
    <!--BOARD START-->
    <div class="board">
	<ul>
		<li class="field">공지사항</li>
		<li class="value">다날 본인인증을 이용해주셔서 감사합니다. (문의 1566-3355)</li>
	</ul>
    </div>
    <!--//BOARD END-->
</div>

</body>
</html>
