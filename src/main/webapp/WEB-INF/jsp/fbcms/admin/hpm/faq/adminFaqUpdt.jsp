<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<h3 class="mid_tit mg_t50">자주하는 질문 <spring:message code="title.update"/></title>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqVO" staticJavascript="false"	xhtml="true" cdata="false" />

<script type="text/javascript">
<!--
	var tagNmList = {};
	<c:forEach var="tagNmValue" items="${fn:split(faqVO.tagNmList, ',')}" varStatus="status">
		tagNmList[${status.index}] = '<c:out value="${tagNmValue }"/>';
	</c:forEach>
	
	$(function() {
		/* 게시여부 */
		$('#faqVO').on('change', '#chk02_1, #chk02_2', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#postingYn').val('Y');
			} else {
				$('#postingYn').val('N');
			}
		});
		
		/* 검색 태그 */
		$('#tagInput').on('keypress', function (e) {
			var thisElement = $(this);
			if (e.key === 'Enter' || e.keyCode == 32) { // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
				var tagValue = thisElement.val();
				if (tagValue !== "") { // 값이 없으면 동작 안함
					var result = Object.values(tagNmList).filter(function (word) { // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
						return word === tagValue;
					});
					
					// 태그 중복 검사
					if (result.length == 0) {
						var tagListCnt = $('#tagList li').length*1;
						$('#tagList').append('<li>'+tagValue+'<a href="javascript:void(0);" class="tagDelBtn">x</a></li>');
						tagNmList[tagListCnt] = tagValue;
						thisElement.val('');
						document.formUpdate.tagNmList.value = Object.values(tagNmList).toString();
                   } else {
                       alert('태그값이 중복됩니다.');
                   }
               }
               e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
           }
		});
		$('#faqVO').on('click', '.tagDelBtn', function() {
			$(this).parent().remove();
			tagNmList = {};
			$('#tagList li').each(function(idx) {
				tagNmList[(idx+1)] = $(this).html().split('<')[0]; 
			});
			document.formUpdate.tagNmList.value = Object.values(tagNmList).toString();
		});
	});

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		document.getElementById("faqVO").qestnSj.focus();
	}
	
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	 function deleteFaq(form){
		if(confirm("<spring:message code="common.delete.msg" />")){	
			// Delete하기 위한 키값을 셋팅
			form.submit();	
		}	
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateFaq(form) {
		document.getElementById("faqVO").qestnCn.value = document.getElementById("faqVO").qestnSj.value;
		if (!validateFaqVO(form)) {
			return false;
		} else {
			if (confirm("<spring:message code="common.update.msg" />")) {
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectFaqList(form) {
		form.submit();
	}
-->
</script>

<!-- 상단타이틀 -->
<form:form commandName="faqVO" name="formUpdate" action="/admin/hpm/faq/updateFaq.do" method="post" onSubmit="updateFaq(document.formUpdate); return false;" enctype="multipart/form-data">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r">카테고리</th>
					<td class="ta_l">
						<div class="input_wrap">
							<select class="select" id="categoryCode" name="categoryCode">
								<option<c:if test="${faqVO.categoryCode eq 'FAQ001'}"> selected="selected"</c:if> value="FAQ001">진료문의</option>
								<option<c:if test="${faqVO.categoryCode eq 'FAQ002'}"> selected="selected"</c:if> value="FAQ002">검진문의</option>
								<option<c:if test="${faqVO.categoryCode eq 'FAQ003'}"> selected="selected"</c:if> value="FAQ003">내시경문의</option>
								<option<c:if test="${faqVO.categoryCode eq 'FAQ004'}"> selected="selected"</c:if> value="FAQ004">수술문의</option>
								<option<c:if test="${faqVO.categoryCode eq 'FAQ005'}"> selected="selected"</c:if> value="FAQ005">기타문의</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">질문</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="qestnSj" title="질문" cssClass="inp_txt w_full" maxlength="100" />
							<div><form:errors path="qestnSj" cssClass="error" /></div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">답변</th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:textarea path="answerCn" title="${title} ${inputTxt}" cols="300" rows="20" cssStyle="width:100%;height:300px" />   
							<div><form:errors path="answerCn" cssClass="error" /></div> 
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">검색 Tag</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
							<input type="hidden" name="tagNmList" value="<c:out value='${faqVO.tagNmList }'/>" >
							<ul id="tagList" class="tagbox">
								<c:forEach var="tagNmValue" items="${fn:split(faqVO.tagNmList, ',')}">
									<li><c:out value="${tagNmValue }"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
								</c:forEach>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1"<c:if test="${faqVO.postingYn eq 'Y'}"> checked="checked"</c:if> class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2"<c:if test="${faqVO.postingYn ne 'Y'}"> checked="checked"</c:if> class="ez-hide">
									<label for="chk02_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l">2020.07.30<span class="mg_l20">12:00:00</span></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:deleteFaq(document.formDelete)" class="btn_ty">삭제하기</a>
		<a href="#none" onclick="javascript:updateFaq(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectFaqList(document.formList)" class="btn_ty">취소하기</a>
	</div>

	<input type="hidden" id="postingYn" name="postingYn" value="${faqVO.postingYn}" />
	<input type="hidden" name="qestnCn" value="${faqVO.qestnCn}">
	<input type="hidden" name="faqId" value="${faqVO.faqId}">
</form:form>

<form name="formDelete" action="<c:url value='/admin/hpm/faq/deleteFaq.do'/>" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="faqId" value="${faqVO.faqId}">
</form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/faq/selectFaqList.do'/>" method="post">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="postingYn" value="<c:out value='${searchVO.postingYn}'/>" />
	<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
	<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />