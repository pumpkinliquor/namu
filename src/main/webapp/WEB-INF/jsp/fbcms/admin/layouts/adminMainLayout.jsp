<%--
	Class Name : adminMainLayout.jsp
	Description : 관리자 메인 레이아웃
	Modification Information

	수정일                    수정자                 수정내용
	-------     --------    ---------------------------
	2020.09.01    KHC        최초 생성

	author   : KHC
	since    : 2020.09.01
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<div id="skipNav" class="invisible">
    <dl>
        <dt>콘텐츠 바로가기</dt>
        <dd><a href="#middle_content">컨텐츠 바로가기</a></dd>
        <dd><a href="#topmenu_nav">메인메뉴 바로가기</a></dd>
        <dd><a href="#leftmenu_div">좌메뉴 바로가기</a></dd>
    </dl>
</div>
<div class="login_area_loc">
	<div class="loginbg01"></div>
	<div class="loginbg02">
        <%
           LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
           if(loginVO == null){
        %>
        <ul>
           <li>|</li>

           <li><a href="<c:url value='/admin/lgn/adminLogin.do'/>">로그인</a></li>
        </ul>
        <% }else{ %>
        <c:set var="loginName" value="<%= loginVO.getName()%>"/>
        <ul>
            <li><a href="#LINK" onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out value="${loginName}"/> 님</a></li>
            <li>|</li>
            <li><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
        </ul>
        <% } %>
    </div>
		<div class="loginbg03"></div>
</div>
<h1><a href="<c:url value='/'/>cmm/main/mainPage.do">템플릿 로고</a>
    <a href="<c:url value='/EgovPageLink.do?link=main/sample_menu/Intro'/>" target="_blank"><img width="20" height="20" src="<c:url value='/images/question.jpg'/>" alt="메뉴구성 설명" title="메뉴구성 설명"></a>
</h1>
<div id="SubTopSearch">
<form action="#LINK" name="SubTopSearchForm" id="SubTopSearchForm" method="post">
	<select id="subsearch" name="subsearch">
    	<option value="">통합검색</option>
    	<option value="">게시물검색</option>
	</select>
	<input type="text" class="inputText" name="search" id="search">&nbsp;<button class="btnSearch" title="검색" type="submit">&nbsp;</button>
</form>
</div>
<!-- topmenu start -->
<script type="text/javascript">
    function getLastLink(menuNo){
        var tNode = new Array;
        for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
            tNode[i] = document.menuListForm.tmp_menuNm[i].value;
            var nValue = tNode[i].split("|");
            //선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
            if (nValue[1]==menuNo) {
                if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                    //링크정보가 있으면 링크정보를 리턴한다.
                    return nValue[5];
                }else{
                    //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                    return getLastLink(nValue[0]);
                }
            }
        }
    }
    function goMenuPage(menuNo){
        document.getElementById("menuNo").value=menuNo;
        document.getElementById("link").value="forward:"+getLastLink(menuNo);
        document.menuListForm.action = "<c:url value='/EgovPageLink.do'/>";
        document.menuListForm.submit();
    }
    function actionLogout()
    {
        document.selectOne.action = "<c:url value='/admin/lgn/actionLogout.do'/>";
        document.selectOne.submit();
    }
</script>
<div id="topmenu_nav">
<ul>
	<c:forEach var="result" items="${list_headmenu}" varStatus="status">
    <li><a href="#LINK" onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out value="${result.menuNm}"/></a></li>
    </c:forEach>
</ul>
</div>
    <form name="menuListForm" action ="" method="post">
        <input type="hidden" id="menuNo" name="menuNo" value="<%=session.getAttribute("menuNo")%>" />
        <input type="hidden" id="link" name="link" value="" />
        <div style="width:0px; height:0px;">
        <c:forEach var="result" items="${list_menulist}" varStatus="status" >
            <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuNo}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
        </c:forEach>
        </div>
    </form>