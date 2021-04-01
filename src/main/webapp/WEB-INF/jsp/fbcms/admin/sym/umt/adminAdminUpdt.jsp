<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h3 class="mid_tit mg_t50">관리자 정보 수정</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="adminAdminManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	$(function() {
		/* 관리자 유형 선택 */
		$('#adminAdminManageVO').on('change', '#chk01_1, #chk01_2', function() {
			if($('#chk01_1:checked').length > 0) {
				$('#orgnztId').val('ORGNZT_9999999999998');
			} else {
				$('#orgnztId').val('ORGNZT_9999999999999');
			}
		});
		
		/* 전체선택 */
		$('#adminAdminManageVO').on('change', '.allCheck', function() {
			var bChecked = false;
			if($(this).is(':checked')) {
				bChecked = true;
			}
			var oneDepthMenuNo = $(this).attr('id'); 
			$('.oneDepthMenuNo_'+oneDepthMenuNo+ ' input[type=checkbox]').each(function() {
				$(this).prop('checked', bChecked);
				if(bChecked) {
					$(this).parent().addClass('ez-checked');
				} else {
					$(this).parent().removeClass('ez-checked');
				}
				var twoDepthMenuNo = $(this).attr('id');
				$('.upperMenu_'+twoDepthMenuNo+ ' input[type=checkbox]').each(function() {
					$(this).prop('checked', bChecked);
					if(bChecked) {
						$(this).parent().addClass('ez-checked');
					} else {
						$(this).parent().removeClass('ez-checked');
					}
				});
			});
		});
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deleteAdmin(form) {
		if(confirm("<spring:message code="common.delete.msg" />")) {	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateAdmin(form) {
		if(!validateAdminAdminManageVO(form)) {
			return;
		}
		
		var checkList = '';
		$('.ez-checked').each(function() {
			if(!$(this).find(' > input[type=checkbox]').hasClass('allCheck')) {
				var oneDepthMenuno = $(this).closest('tr').attr('class');
				oneDepthMenuno = oneDepthMenuno.replace('oneDepthMenuNo_', '');
				var menuNo = $(this).find(' > input[type=checkbox]').attr('id');
				checkList = checkList + ',' + oneDepthMenuno + ',' + menuNo;
			}
		});
		
		if(checkList.length > 0) {
			var arrayCheckedMenuNo = checkList.substring(1).split(',');
			var checkListCopy = arrayCheckedMenuNo.slice().sort(function(a, b) { // 정렬하기 전에 복사본을 만든다.
				return a - b;
			}).reduce(function(a, b) {
				if(a.slice(-1)[0] !== b) {
					a.push(b); // slice(-1)[0] 을 통해 마지막 아이템을 가져온다.
				}
				return a;
			}, []); //a가 시작될 때를 위한 비어있는 배열
			
			form.checkedMenuNoList.value = checkListCopy.toString();
		}
	    
		if(confirm("<spring:message code="common.save.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectAdminList(form) {
		form.action = "<c:url value='/admin/sym/umt/selectAdminList.do'/>";
		form.submit();
	}
	<c:if test="${not empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>

<form:form commandName="adminAdminManageVO" name="formUpdate" action="/admin/sym/umt/updateAdmin.do" method="post" onSubmit="updateAdmin(document.formUpdate); return false;">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%;">
				<col span="1" style="width:15%;">
				<col span="1" style="width:10%;">
				<col span="1" style="auto">
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${loginVO.orgnztId eq 'ORGNZT_9999999999999' }">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>관리자</th>
							<td class="ta_l" colspan="3">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="display01" id="chk01_1"<c:if test="${adminAdminManageVO.orgnztId ne 'ORGNZT_9999999999999'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
											<label for="chk01_1">일반관리자</label>
										</span>
										<span>
											<input type="radio" name="display01" id="chk01_2"<c:if test="${adminAdminManageVO.orgnztId eq 'ORGNZT_9999999999999'}"> checked="checked"</c:if> class="ez-hide">
											<label for="chk01_2">슈퍼관리자</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
				<tr>
					<th scope="row" class="ta_r"> 부서</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:input path="ofcpsNm" title="부서" cssClass="inp_txt w_m" maxlength="50" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이름</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:input path="emplyrNm" title="이름" cssClass="inp_txt w_m" maxlength="60" />
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>아이디</th>
					<td class="ta_l" colspan="3">
						<form:hidden path="emplyrId" title="아이디" cssClass="inp_txt w_m" maxlength="60" />
						<c:out value="${adminAdminManageVO.emplyrId}" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>비밀번호</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:password path="password" title="비밀번호" cssClass="inp_txt w_m" maxlength="20" />
							<span class="dc">4~20자 이상의 영문, 숫자(특수문자 입력가능) </span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>비밀번호 확인</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="password" class="inp_txt w_m" name="password2" maxlength="20" >
							<span class="dc">비밀번호를 한번 더 입력하세요</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">이메일</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<form:input path="emailAdres" title="이메일" cssClass="inp_txt w_m" maxlength="50" />
							<span class="dc">예) abc@namu.com</span>
						</div>
					</td>
				</tr>
				<c:if test="${loginVO.orgnztId eq 'ORGNZT_9999999999999' }">
					<c:set var="totRowspan" value=""/>
					<c:forEach var="menuInfo" items="${listMenulist }" varStatus="status">
						<c:if test="${menuInfo.depth eq 1}">
							<c:set var="totRowspan">${totRowspan + menuInfo.rowsCnt + 1 }</c:set>
						</c:if>
					</c:forEach>
					<tr class="">
						<th scope="row" class="ta_r bo_r" rowspan="<c:out value='${totRowspan }'/>"> 관리자권한</th>
						
						<c:set var="preMenuDepth" value="0"/>
						<c:forEach var="menuInfo" items="${listMenulist }" varStatus="status">
						
							<%-- 1depth 처리 --%>
							<c:if test="${menuInfo.depth eq 1}">
								<c:if test="${preMenuDepth eq 1}">
								<tr>
								</c:if>
								<c:if test="${preMenuDepth eq 2 or preMenuDepth eq 3}">
										</ul>
									</td>
								</tr>
								<tr>
								</c:if>
									<th rowspan="<c:out value='${menuInfo.rowsCnt + 1 }'/>">
										<c:out value="${menuInfo.menuNm }"/>
									</th>
									<td class="ta_l" colspan="2">
										<div class="chk_warp">
											<input type="checkbox" class="chk_ty allCheck" id="<c:out value='${menuInfo.menuNo }'/>">
											<label for="<c:out value='${menuInfo.menuNo }'/>">전체선택</label>
										</div>
									</td>
								</tr>
							</c:if>
							<%-- 1depth 처리 --%>
							
							<%-- 2depth 처리 --%>
							<c:if test="${menuInfo.depth eq 2 and (preMenuDepth eq 1 or preMenuDepth eq 2 or preMenuDepth eq 3)}">
								<c:if test="${menuInfo.depth eq 2 and preMenuDepth eq 2}">
								</tr>
								</c:if>
								<c:if test="${menuInfo.depth eq 2 and preMenuDepth eq 3}">
										</ul>
									</td>
								</tr>
								</c:if>
								<tr class="oneDepthMenuNo_${menuInfo.upperMenuNo }">
									<td class="ta_l<c:if test="${menuInfo.rowsCnt gt 0}"> bo_r</c:if> txt_222 fontW7"<c:if test="${menuInfo.rowsCnt le 0}"> colspan="2"</c:if>>
										<input type="checkbox" class="chk_ty" id="<c:out value='${menuInfo.menuNo }'/>"<c:if test="${menuInfo.authorMenuNo gt 0 }"> checked="checked"</c:if>>
										<label for="<c:out value='${menuInfo.menuNo }'/>"><c:out value="${menuInfo.menuNm }"/></label>
									</td>
									<c:if test="${menuInfo.rowsCnt gt 0}">
										<td class="ta_l">
											<ul class="list_dep dep4 chk_warp">
									</c:if>
							</c:if>
							<%-- 2depth 처리 --%>
							
							<%-- 3depth 처리 --%>
							<c:if test="${menuInfo.depth eq 3 and preMenuDepth eq 2}">
								<li class="upperMenu_${menuInfo.upperMenuNo }">
									<input type="checkbox" class="chk_ty" id="<c:out value='${menuInfo.menuNo }'/>"<c:if test="${menuInfo.authorMenuNo gt 0 }"> checked="checked"</c:if>>
									<label for="<c:out value='${menuInfo.menuNo }'/>"><c:out value="${menuInfo.menuNm }"/></label>
								</li>
							</c:if>
							<c:if test="${menuInfo.depth eq 3 and preMenuDepth eq 3}">
								<li class="upperMenu_${menuInfo.upperMenuNo }">
									<input type="checkbox" class="chk_ty" id="<c:out value='${menuInfo.menuNo }'/>"<c:if test="${menuInfo.authorMenuNo gt 0 }"> checked="checked"</c:if>>
									<label for="<c:out value='${menuInfo.menuNo }'/>"><c:out value="${menuInfo.menuNm }"/></label>
								</li>
							</c:if>
							<%-- 3depth 처리 --%>
							
							<%-- last 처리 --%>
							<c:if test="${status.last and menuInfo.depth eq 2}">
								</tr>
							</c:if>
							
							<c:if test="${status.last and menuInfo.depth eq 3}">
										</ul>
									</td>
								</tr>
							</c:if>
							<%-- last 처리 --%>
							
							<c:set var="preMenuDepth">${menuInfo.depth }</c:set>
						</c:forEach>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div class="btns">
		<a href="#none" onclick="javascript:deleteAdmin(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateAdmin(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectAdminList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" name="emplyrSttusCode" value="P"/><!-- 회원상태 -->
	<input type="hidden" id="orgnztId" name="orgnztId" value="${adminAdminManageVO.orgnztId }"/><!-- 기본값(일반관리자) -->
	<input type="hidden" id="uniqId" name="uniqId" value="${adminAdminManageVO.uniqId }"/><!-- uniqId -->
	<input type="hidden" id="checkedMenuNoList" name="checkedMenuNoList" value=""/><!-- 메뉴체크 -->
</form:form>

<form name="formDelete" action="<c:url value='/admin/sym/umt/deleteAdmin.do'/>" method="post">
	<input type="hidden" name="checkedIdForDel" value="${adminAdminManageVO.uniqId}:USR03" >
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/sym/umt/selectAdminList.do'/>" method="post">
	<input type="hidden" name="searchKeyword" value="<c:out value='${adminAdminManageVO.searchKeyword}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${adminAdminManageVO.pageIndex}'/>"/>
</form>
