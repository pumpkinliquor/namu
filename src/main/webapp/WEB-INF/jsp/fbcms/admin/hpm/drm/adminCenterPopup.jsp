<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<div class="sm_con scy" style="top:300px">
<div class="pop_top">
	<h2>센터 검색 </h2>
	<a href="javascript:void(0);" class="pop_close"></a>
</div>

<!-- pop_cont -->
<div class="pop_cont">
	<h3 class="pop_mid_tit"><strong>센터</strong></h3>

	<div class="board_ty ds02">
		<table>
			<colgroup>
				<col style="width:440px">
				<col style="width:*">
			</colgroup>
			<thead>
				<tr>
					<th>센터명</th>
					<th>선택</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="board_ty ds02 scy_box">
		<table>
			<colgroup>
				<col style="width:440px">
				<col style="width:*">
			</colgroup>
			<tbody>
				<c:forEach items="${centerList}" var="certerInfo" varStatus="status">
					<tr name="ct" >
						<td name="ctSeq${status.index}" class="ta_l">${certerInfo.codeIdNm }</td>
						<td name="ctSeq${status.index}" style="display: none;">${certerInfo.codeId}</td>
						<td>
							<div class="input_wrap">
								<span class="ds_raido"> 
									<span id="${certerInfo.codeId}"> 
										<input type="${centerPopupType}" id="ctSeq${status.index}" name="statusCT" class="chk_ty ez-hide" value="${status.index}">
										<!-- id 변경시 label for 값 같이 변경 -->
									</span>
								</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" name="popupOK" class="btn_ty02">확인하기</a>
		<a href="#none" name="popupCancel" class="btn_ty p_cancle">취소하기</a>
	</div>
</div>
<!-- //pop_cont -->
</div>

<div class="dim"></div>
