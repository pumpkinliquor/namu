<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h3 class="mid_tit mg_t50">팝업관리 <spring:message code="title.list" /></h3>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#ntceBgnde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#ntceEndde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#ntceBgnde').datepicker("option", "maxDate", $("#ntceEndde").val());
		$('#ntceBgnde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceEndde").datepicker( "option", "minDate", selectedDate );
		});
		$('#ntceEndde').datepicker("option", "minDate", $("#ntceBgnde").val());
		$('#ntceEndde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceBgnde").datepicker( "option", "maxDate", selectedDate );
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		document.listForm.searchCondition.focus();
	}
	
	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************* */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectPopupList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertPopupView() {
		document.listForm.action = "<c:url value='/admin/hpm/umm/insertPopupView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세화면 처리 함수
	 ******************************************************** */
	function updatePopupView(popupId) {
		document.listForm.popupId.value = popupId;
		document.listForm.action = "<c:url value='/admin/hpm/umm/updatePopupView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	* 체크 박스 선택 함수
	******************************************************** */
	function fnCheckAllPopup() {
	
		var FLength = document.getElementsByName("checkList").length;
		var checkAllValue = document.getElementById('checkAll').checked;
	
		//undefined
		if( FLength == 1) {
			document.getElementById("checkList").checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("checkList")[i].checked = checkAllValue;
				}
			}
	
	}
	
	/* ********************************************************
	* 팝업창 미리보기
	******************************************************** */
	function fnViewPopup() {
	
	
		var FLength = document.getElementsByName("checkList").length;
		var check = 0;
		
		if( FLength == 1) {
			if(document.getElementById("checkList").checked == true) {
				fn_egov_ajaxPopupInfo_PopupManage( document.getElementById("checkList").value );
				check ++;
			}
		}else{
			for(var i=0; i < FLength; i++)
			{
				if(document.getElementsByName("checkList")[i].checked == true) {
					check ++;
					fn_egov_ajaxPopupInfo_PopupManage( document.getElementsByName("checkList")[i].value );
					}
			}
			}
		
		if(check == 0) {
			alert("<spring:message code="ussIonPwm.popupList.checkAlert"/>");/* 체크박스를 하나 이상 선택해 주세요. */
				}
		
		return;
	
	}
	/* ********************************************************
	* 팝업창 정보 Ajax통신으로 정보 획득
	******************************************************** */
	function fnAjaxPopupInfo(popupIds) {
		var url = "<c:url value='/admin/hpm/umm/ajaxPopupManageInfo.do' />";
	
		var param = {
				popupId: popupIds
		};
	
		new Ajax.Request(url,
	   {
		 asynchronous:true,
		 method:"post",
		 parameters: param ,
		 evalJSON:	 false,
		 evalJS:	   false,
		onLoading  : function() {/*로딩중*/ },
		onSuccess  : function(returnValue)
		{
			var returnValueArr = returnValue.responseText.split("||");
	
			//if(fnGetCookie(popupIds) == null ) {
			   	fn_egov_popupOpen_PopupManage(popupIds,
						returnValueArr[0],
						returnValueArr[1],
						returnValueArr[2],
						returnValueArr[3],
						returnValueArr[4],
						returnValueArr[5]);
			//}
	
		},
		onFailure: function() {/*불러오기 실패*/},
		onComplete : function() {/*모든 것을 완료*/}
	   });
	}
	
	/* ********************************************************
	* 팝업창  오픈
	******************************************************** */
	function fnPopupOpenPopup(popupId,fileUrl,width,height,top,left,stopVewAt) {
	
		var url = "<c:url value='/admin/hpm/umm/openPopupManage.do' />?";
		url = url + "fileUrl=" + fileUrl;
		url = url + "&stopVewAt=" + stopVewAt;
		url = url + "&popupId=" + popupId;
		var name = popupId;
		var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");
	
		if (window.focus) {openWindows.focus()}
	}
	
	/* ********************************************************
	* 팝업창  오픈 쿠키 정보 OPEN
	******************************************************** */
	function fnGetCookie(name) {
		  var prefix = name + "=";
	
		  var cookieStartIndex = document.cookie.indexOf(prefix);
		  if (cookieStartIndex == -1) return null;
		  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
		  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;
	
	
		  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
	}
-->
</script>

<form name="listForm" action="<c:url value='/admin/hpm/umm/selectPopupList.do'/>" method="post" onSubmit="selectPopupList(); return false;">
	<!-- 검색 -->
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:12%;">
				<col span="1" style="width:34%;">
				<col span="1" style="width:12%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_l">제목</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="hidden" name="searchCondition" value="POPUP_SJ_NM" />
							<input type="text" name="searchKeyword" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchKeyword}"/>'  maxlength="155" style="ime-mode: active;"/>
						</div>
					</td>
					<th scope="row" class="ta_l">게시여부</th>
					<td class="ta_l">
						<div class="select_wrap">
							<select name="ntceAt" class="select">
								<option value="">선택하세요</option>
								<option value="Y"<c:if test="${searchVO.ntceAt eq 'Y'}"> selected</c:if>>Y</option>
								<option value="N"<c:if test="${searchVO.ntceAt eq 'N'}"> selected</c:if>>N</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_l">등록일</th>
					<td class="ta_l" colspan="3">
						<div class="tab_date_wrap">
							<div class="input_wrap">
								<input type="text" id="ntceBgnde" name="ntceBgnde" value="<c:out value='${searchVO.ntceBgnde}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
								<span> - </span>
								<input type="text" id="ntceEndde" name="ntceEndde" value="<c:out value='${searchVO.ntceEndde}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:selectPopupList()" class="btn_ty02">검색하기</a>
	</div>
	<!-- //검색 -->
	<input name="popupId" type="hidden" value="">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width:7%">
			<col style="">
			<col style="width:30%">
			<col style="width:20%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>기간</th>
				<th>등록일</th>
				<th>게시여부</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<td class="ta_l"><a href="#none" onclick="javascript:updatePopupView('<c:out value="${resultInfo.popupId}"/>')"><c:out value='${fn:substring(resultInfo.popupTitleNm, 0, 100)}'/></a></td>
					<td>
						<c:out value="${resultInfo.ntceBgnde}"/>
						~
						<c:out value="${resultInfo.ntceEndde}"/>	
					</td>
					<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
					<td><c:out value='${resultInfo.ntceAt}'/></td>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="5"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>	

<!-- paginate -->
<div class="paginate">
	<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
</div>
<!-- //paginate -->

<div class="btns ta_r mt_m">
	<a href="#none" onclick="javascript:insertPopupView()" class="btn_ty03">등록하기</a>
</div>
