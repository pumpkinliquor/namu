<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">관리자메뉴관리 등록</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(document).ready(function () {
		// 파일검색 화면 호출 함수
	    $('#popupProgrmFileNm').click(function (e) {
	    	e.preventDefault();
	        //var page = $(this).attr("href");
	        var pagetitle = $(this).attr("title");
	        var page = "<c:url value='/admin/sym/prm/selectProgrmListSearchNew.do'/>";
	        var $dialog = $('<div></div>')
	        .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
	        .dialog({
	        	autoOpen: false,
	            modal: true,
	            width: 550,
	            height: 650,
	            title: pagetitle
	    	});
	    	$dialog.dialog('open');
		});
	    // 메뉴이동 화면 호출 함수
	    $('#popupUpperMenuNo').click(function (e) {
	    	e.preventDefault();
	        //var page = $(this).attr("href");
	        var pagetitle = $(this).attr("title");
	        var page = "<c:url value='/admin/sym/mpm/selectMenuListSelectMvmnNew.do'/>";
	        var $dialog = $('<div style="overflow:hidden;padding: 0px 0px 0px 0px;"></div>')
	        .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
	        .dialog({
	        	autoOpen: false,
	            modal: true,
	            width: 610,
	            height: 550,
	            title: pagetitle
	    	});
	    	$dialog.dialog('open');
		});
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	* 필드값 Number 체크 함수
	******************************************************** */
	function checkNumber(str) {
	   var flag=true;
	   if (str.length > 0) {
	       for (i = 0; i < str.length; i++) {
	           if (str.charAt(i) < '0' || str.charAt(i) > '9') {
	               flag=false;
	           }
	       }
	   }
	   return flag;
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function insertMenuManage(form) {
		if(form.menuNo.value == "") {
			alert("메뉴번호는 필수 항목입니다.");
			return false;
		}
		if(!checkNumber(form.menuNo.value)) {
			alert("메뉴번호는 숫자만 입력 가능합니다.");
			return false;
		}
	
		if(form.menuOrdr.value == "") {
			alert("메뉴순서는 필수 항목입니다.");
			return false;
		} 
		if(!checkNumber(form.menuOrdr.value)) {
			alert("메뉴순서는 숫자만 입력 가능합니다.");
			return false;
		}
	
		if(form.upperMenuNo.value == "") {
			alert("상위메뉴번호는 필수 항목입니다.");
			return false;
		}
		if(!checkNumber(form.upperMenuNo.value)) {
			alert("상위메뉴번호는 숫자만 입력 가능합니다.");
			return false;
		}
	
		if(form.progrmFileNm.value == "") {
			alert("프로그램파일명은 필수 항목입니다.");
			return false;
		}
		if(form.menuNm.value == "") {
			alert("메뉴명은 필수 항목입니다.");
			return false;
		}
		
		if (confirm("<spring:message code="common.save.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectMenuManageList(form) {
		form.submit();
	}

	/* ********************************************************
	 * 파일명 엔터key 목록조회  함수
	 ******************************************************** */
	function press() {
	    if (event.keyCode == 13) {
	    	searchFileNm();    // 원래 검색 function 호출
	    }
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form:form commandName="menuManageVO" name="formInsert" action="/admin/sym/mpm/insertMenuManage.do" method="post" onSubmit="insertMenuManage(document.formInsert); return false;">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:35%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>메뉴No</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="menuNo" title="메뉴No" cssClass="inp_txt w_full" maxlength="10" />
					</td>
					<th scope="row" class="ta_r"><em class="ootc">*</em>메뉴순서</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="menuOrdr" title="메뉴순서" cssClass="inp_txt w_full" maxlength="10" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>메뉴명</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="menuNm" title="메뉴명" cssClass="inp_txt w_full" maxlength="30" />
						</div>
					</td>
					<th scope="row" class="ta_r"><em class="ootc">*</em>상위메뉴No</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="upperMenuNo" title="상위메뉴No" cssClass="inp_txt w_full" maxlength="10" cssStyle="width:100px"/>
							<a id="popupUpperMenuNo" href="<c:url value='/admin/sym/mpm/selectMenuListSelectMvmn.do' />" target="_blank" title="새창으로">
								<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt='검색' style="width:15px;height:15px;" />(메뉴선택 검색)
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>파일명</th>
					<td colspan="3" class="ta_l">
						<div class="input_wrap">
							<form:input path="progrmFileNm" title="파일명" cssClass="inp_txt w_full" maxlength="60" cssStyle="width:400px"/>
							<a id="popupProgrmFileNm" href="<c:url value='/admin/sym/prm/selectProgrmListSearch.do' />" target="_blank" title="새창으로">
								<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt='검색' style="width:15px;height:15px;" />(프로그램파일명 검색)
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>메뉴설명</th>
					<td colspan="3" class="ta_l">
						<div class="input_wrap">
							<form:textarea path="menuDc" rows="14" cols="75" title="메뉴설명" cssStyle="height:200px"/>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:insertMenuManage(formInsert)" class="btn_ty02">등록하기</a>
		<a href="#none" onclick="javascript:selectMenuManageList(formList)" class="btn_ty">취소하기</a>
	</div>
	
	<form:hidden path="relateImageNm" value="/" />
	<form:hidden path="relateImagePath" value="/" />
</form:form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/sym/mpm/selectMenuManageList.do'/>" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>">
</form>