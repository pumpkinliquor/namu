<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/egovframework/com/button.css"/>" rel="stylesheet" type="text/css">
<script type="text/javaScript" src="<c:url value='/js/egovframework/com/sts/sst/treemenu.js' />"></script>
<script type="text/javaScript">
<!--
	var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
	var chk_Object = true;
	var chk_browse = "";
	if (eval(document.menuCreatManageForm.authorCode)=="[object]") chk_browse = "IE";
	if (eval(document.menuCreatManageForm.authorCode)=="[object NodeList]") chk_browse = "Fox";
	if (eval(document.menuCreatManageForm.authorCode)=="[object Collection]") chk_browse = "safai";
	
	var Tree = new Array;
	if(chk_browse=="IE"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object]") {
	   alert("<spring:message code="comSymMnuMpm.MenuCreat.validate.menuNmVal.none1" />"); //메뉴 목록 데이타가 존재하지 않습니다.
	   chk_Object = false;
	}
	if(chk_browse=="Fox"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object NodeList]") {
	   alert("<spring:message code="comSymMnuMpm.MenuCreat.validate.menuNmVal.none1" />"); //메뉴 목록 데이타가 존재하지 않습니다.
	   chk_Object = false;
	}
	if(chk_browse=="safai"&&eval(document.menuCreatManageForm.tmp_menuNmVal)!="[object Collection]") {
		   alert("<spring:message code="comSymMnuMpm.MenuCreat.validate.menuNmVal.none1" />"); //메뉴 목록 데이타가 존재하지 않습니다.
		   chk_Object = false;
	}
	if( chk_Object ) {
		for (var j = 0; j < document.menuCreatManageForm.tmp_menuNmVal.length; j++) {
			Tree[j] = document.menuCreatManageForm.tmp_menuNmVal[j].value;
	    }
	    createTree(Tree);
	} else {
	    alert("<spring:message code="comSymMnuMpm.MenuCreat.validate.menuNmVal.none2" />"); //메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요.
	    window.close();
	}
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 조회 함수
	 ******************************************************** */
	function selectMenuCreatTmp() {
	    document.menuCreatManageForm.action = "<c:url value='/admin/sym/mcm/selectMenuCreateList.do'/>";
	    document.menuCreatManageForm.submit();
	}
	
	/* ********************************************************
	 * 멀티입력 처리 함수
	 ******************************************************** */
	function fInsertMenuCreat() {
	    var checkField = document.menuCreatManageForm.checkField;
	    var checkMenuNos = "";
	    var checkedCount = 0;
	    if(checkField) {
	    	if(checkField.length > 1) {
	            for(var i=0; i < checkField.length; i++) {
	                if(checkField[i].checked) {
	                    checkMenuNos += ((checkedCount==0? "" : ",") + checkField[i].value);
	                    checkedCount++;
	                    console.log("checkMenuNos = "+checkMenuNos);
	                    console.log("checkedCount = "+checkedCount);
	                }
	            }
	        } else {
	            if(checkField.checked) {
	                checkMenuNos = checkField.value;
	            }
	        }
	    }
	    if(checkedCount == 0) {
	        alert("선택된 메뉴가 없습니다.");
	        return false;
	    }
	    document.menuCreatManageForm.checkedMenuNoForInsert.value=checkMenuNos;
	    document.menuCreatManageForm.checkedAuthorForInsert.value=document.menuCreatManageForm.authorCode.value;
	    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatInsert.do'/>";
	    document.menuCreatManageForm.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<style type="text/css">
.tree {margin-bottom:30px; padding:10px; border-top:2px solid #1a90d8; border-bottom:2px solid #1a90d8; background:#f7f7f7; }
.tree input[type=checkbox] {margin-right:2px; vertical-align:-2px; }
.tree img {vertical-align:-4px; }
</style>

<form name="menuCreatManageForm" action ="<c:url value='/sym/mnu/mcm/EgovMenuCreatSiteMapSelect.do' />" method="post">
	<input name="checkedMenuNoForInsert" type="hidden" >
	<input name="checkedAuthorForInsert"  type="hidden" >
	
	<div class="board">
		<h1><spring:message code="comSymMnuMpm.MenuCreat.pageTop.title" /></h1><!-- 메뉴생성 -->
		
		<c:forEach var="result1" items="${list_menulist}" varStatus="status" >
			<input type="hidden" name="tmp_menuNmVal" value="${result1.menuNo}|${result1.upperMenuNo}|${result1.menuNm}|${result1.progrmFileNm}|${result1.chkYeoBu}|">
		</c:forEach>
			
		<div class="tree">
		</div>
	</div>
	
	<input type="hidden" name="req_menuNo">
	<input type="hidden" name="detailStatsKind" value=""/>
</form>
