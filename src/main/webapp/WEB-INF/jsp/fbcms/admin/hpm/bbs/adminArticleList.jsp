<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:choose>
	<%-- 언론보도일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000004'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000005'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000006'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000007'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
<style>
.bbs_tabs { width: 100%; }
.bbs_tabs ul { font-size:0; }
.bbs_tabs ul li { display: inline-block; width:33.33%; text-align: center;}
.bbs_tabs ul li:last-child { width:33.34%; }
.bbs_tabs ul a { display: block; height: 33px; line-height: 33px; font-size: 12px; font-weight: bold; padding: 0 33px; background: #f4f4f4; border: 1px solid #e6e6e6; }
.bbs_tabs ul a:hover { background-color: #e6e6e6; }
.bbs_tabs ul a.on { background: #0c4ca4; color: #fff; border: 1px solid #0c4ca4; }
</style>
<div class="bbs_tabs">
	<ul>
		<li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000003"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}"> class="on"</c:if>>질환정보</a></li>
		<%-- <li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000004"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}"> class="on"</c:if>>Dr.민영일의 건강백서</a></li> --%>
		<li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000005"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}"> class="on"</c:if>>영양정보</a></li>
		<li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000006"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}"> class="on"</c:if>>운동정보</a></li>
		<li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000007"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}"> class="on"</c:if>>건강동영상</a></li>
		<li><a href="/admin/hpm/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000008"<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}"> class="on"</c:if>>운동동영상</a></li>
	</ul>
</div>
	</c:when>
</c:choose>

<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<h3 class="mid_tit mg_t50"><c:out value="${boardMasterVO.bbsNm}"/> <spring:message code="title.list" /></h3>
<c:set var="subject">제목</c:set>

<c:choose>
	<%-- 공지사항일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
		<c:set var="colspanSum" value="5"/> <%-- colspan 합을 게시판별로 구분 --%>
		<c:set var="listAddClass" value="mg_t50" /> <%-- 엑셀다운로드 없는 경우 간격조정 필요 --%>
	</c:when>
	<%-- 언론보도일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
		<c:set var="colspanSum" value="7"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:when>
	<%-- 질환정보일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
		<c:set var="colspanSum" value="5"/> <%-- colspan 합을 게시판별로 구분 --%>
		<c:set var="subject">질환명</c:set>
	</c:when>
	<%-- Dr.민영일의 건강백서일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
		<c:set var="colspanSum" value="4"/> <%-- colspan 합을 게시판별로 구분 --%>
		<c:set var="listAddClass" value="mg_t50" /> <%-- 엑셀다운로드 없는 경우 간격조정 필요 --%>
	</c:when>
	<%-- 영양정보일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
		<c:set var="colspanSum" value="5"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:when>
	<%-- 운동정보일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
		<c:set var="colspanSum" value="5"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:when>
	<%-- 건강동영상일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}">
		<c:set var="colspanSum" value="4"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:when>
	<%-- 운동동영상일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
		<c:set var="colspanSum" value="5"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:when>
	<c:otherwise>
		<c:set var="colspanSum" value="4"/> <%-- colspan 합을 게시판별로 구분 --%>
	</c:otherwise>
</c:choose>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
		$("#searchBgnDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#searchEndDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#searchBgnDe').datepicker("option", "maxDate", $("#searchEndDe").val());
		$('#searchBgnDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchEndDe").datepicker( "option", "minDate", selectedDate );
		});
		$('#searchEndDe').datepicker("option", "minDate", $("#searchBgnDe").val());
		$('#searchEndDe').datepicker("option", "onClose", function (selectedDate) {
			$("#searchBgnDe").datepicker( "option", "maxDate", selectedDate );
		});
		
		// 검색어 엔터 
		$('input[name=searchWrd]').on('keydown', function(key) {
			if (key.keyCode == 13) {
				selectArticleList();
			}
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		// 첫 입력란에 포커스..
		<c:if test="${boardMasterVO.bbsId ne 'BBSMSTR_000000000004'}">
			document.listForm.searchCnd.focus();
		</c:if>
	}
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
	   	document.listForm.submit();
	}
	
	/*********************************************************
	 * 조회 처리 함수
	 ******************************************************** */
	function selectArticleList() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function insertArticleView() {
		document.listForm.action = "<c:url value='/admin/hpm/bbs/insertArticleView.do' />";
		document.listForm.submit();
	}
	
	/* ********************************************************
	 * 상세 처리 함수
	 ******************************************************** */
	function selectArticleDetail(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/hpm/bbs/selectArticleDetail.do'/>";
	  	document.listForm.submit();
	}
	
	/* ********************************************************
	 * 수정 처리 함수
	 ******************************************************** */
	function updateArticleView(nttId) {
		document.listForm.nttId.value = nttId;
	  	document.listForm.action = "<c:url value='/admin/hpm/bbs/updateArticleView.do'/>";
	  	document.listForm.submit();
	}
	
	/*********************************************************
	 * 엑셀다운
	 ******************************************************** */
	function selectListExcel() {
		document.listForm.action = "<c:url value='/admin/hpm/bbs/selectArticleListExcel.do'/>";
		document.listForm.submit();
		document.listForm.action = "<c:url value='/admin/hpm/bbs/selectArticleList.do'/>";
	}

	<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>

<c:choose>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
		<form name="listForm" action="<c:url value='/admin/hpm/bbs/selectArticleList.do'/>" method="post" onSubmit="selectArticleList(); return false;">
			<input name="nttId" type="hidden" value="0">
			<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
		</form>
	</c:when>
	<c:otherwise>
		<form name="listForm" action="<c:url value='/admin/hpm/bbs/selectArticleList.do'/>" method="post" onSubmit="selectArticleList(); return false;">
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
									<input type="hidden" name="searchCnd" value="0" />
									<input type="text" name="searchWrd" class="w_full" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" style="ime-mode: active;"/>
								</div>
							</td>
							<th scope="row" class="ta_l">게시여부</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select name="postingYn" class="select">
										<option value="">선택하세요</option>
										<option value="Y"<c:if test="${searchVO.postingYn eq 'Y'}"> selected</c:if>>Y</option>
										<option value="N"<c:if test="${searchVO.postingYn eq 'N'}"> selected</c:if>>N</option>
									</select>
								</div>
							</td>
						</tr>
						<c:choose>
							<%-- 언론보도일 경우 --%>
							<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
								<tr>
									<th scope="row" class="ta_l">날짜</th>
									<td class="ta_l" colspan="3">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
								</tr>
							</c:when>
							<%-- 질환정보일 경우 --%>
							<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
								<tr>
									<th scope="row" class="ta_l">등록일</th>
									<td class="ta_l">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
									<th scope="row" class="ta_l">카테고리</th>
									<td class="ta_l">
										<div class="select_wrap">
											<select class="select" id="custom1" name="custom1">
												<option value="">선택하세요</option>
												<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
													<option value="${cmmCodeInfo.code }"<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> selected="selected"</c:if>><c:out value="${cmmCodeInfo.codeNm }" /></option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
							</c:when>
							<%-- 영양정보일 경우 --%>
							<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
								<tr>
									<th scope="row" class="ta_l">등록일</th>
									<td class="ta_l">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
									<th scope="row" class="ta_l">카테고리</th>
									<td class="ta_l">
										<div class="select_wrap">
											<select class="select" id="custom1" name="custom1">
												<option value="">선택하세요</option>
												<c:forEach var="cmmCodeInfo" items="${listNTIComCode }">
													<option value="${cmmCodeInfo.code }"<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> selected="selected"</c:if>><c:out value="${cmmCodeInfo.codeNm }" /></option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
							</c:when>
							<%-- 운동정보일 경우 --%>
							<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
								<tr>
									<th scope="row" class="ta_l">등록일</th>
									<td class="ta_l">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
									<th scope="row" class="ta_l">카테고리</th>
									<td class="ta_l">
										<div class="select_wrap">
											<select class="select" id="custom1" name="custom1">
												<option value="">선택하세요</option>
												<c:forEach var="cmmCodeInfo" items="${listMVIComCode }">
													<option value="${cmmCodeInfo.code }"<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> selected="selected"</c:if>><c:out value="${cmmCodeInfo.codeNm }" /></option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
							</c:when>
							<%-- 운동동영상일 경우 --%>
							<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
								<tr>
									<th scope="row" class="ta_l">등록일</th>
									<td class="ta_l">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
									<th scope="row" class="ta_l">카테고리</th>
									<td class="ta_l">
										<div class="select_wrap">
											<select class="select" id="custom1" name="custom1">
												<option value="">선택하세요</option>
												<c:forEach var="cmmCodeInfo" items="${listMVMComCode }">
													<option value="${cmmCodeInfo.code }"<c:if test="${searchVO.custom1 eq cmmCodeInfo.code}"> selected="selected"</c:if>><c:out value="${cmmCodeInfo.codeNm }" /></option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th scope="row" class="ta_l">등록일</th>
									<td class="ta_l" colspan="3">
										<div class="tab_date_wrap">
											<div class="input_wrap">
												<input type="text" id="searchBgnDe" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" class="inp_txt wd110 date_pick" title="시작일" placeholder="">
												<span> - </span>
												<input type="text" id="searchEndDe" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" class="inp_txt wd110 date_pick" title="종료일" placeholder="">
											</div>
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		
			<div class="btns">
				<a href="#none" onclick="javascript:selectArticleList()" class="btn_ty02">검색하기</a>
			</div>
			<!-- //검색 -->
			<input name="nttId" type="hidden" value="0">
			<input name="bbsId" type="hidden" value="${boardMasterVO.bbsId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		</form>
	</c:otherwise>
</c:choose>

<c:choose>
	<%-- 언론보도일 경우 --%>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000003'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000005'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000006'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000007'
		or boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
		<div class="border_box option_bx">
			<div class="btns ta_l">
				<ul>
					<li>
						<a href="#none" onclick="javascript:selectListExcel();" class="sm btn_down">엑셀 다운로드</a>
					</li>
				</ul>
			</div>
		</div>
	</c:when>
</c:choose>

<div class="board_ty ds02 ${listAddClass }">
	<table>
		<caption>${pageTitle} <spring:message code="title.list" /></caption>
		<colgroup>
			<col style="width:7%">
			<c:choose>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
					<col style="">
					<col style="width:20%">
					<col style="width:10%">
				</c:when>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
					<col style="">
					<col style="width:10%">
					<col style="width:15%">
					<col style="width:15%">
					<col style="width:10%">
				</c:when>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
					<col style="width:20%">
					<col style="">
					<col style="width:20%">
				</c:when>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'
					or boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}">
					<col style="">
					<col style="width:20%">
				</c:when>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'
					or boardMasterVO.bbsId eq 'BBSMSTR_000000000006'
					or boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
					<col style="width:20%">
					<col style="">
					<col style="width:20%">
				</c:when>
			</c:choose>
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<c:choose>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
						<th>카테고리</th>
					</c:when>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
						<th>카테고리</th>
					</c:when>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
						<th>카테고리</th>
					</c:when>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
						<th>카테고리</th>
					</c:when>
				</c:choose>
				<th><c:out value="${subject }"/></th>
				<c:choose>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
						<th>언론사</th>
						<th>날짜</th>
					</c:when>
				</c:choose>
				<th>등록일</th>
				<c:choose>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
						<th>상단고정</th>
					</c:when>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
						<th>본문사용</th>
					</c:when>
				</c:choose>
				<th>게시여부</th>
			</tr>
		</thead>
		<tbody>
			<!-- 공지사항 본문 -->
			<%-- <c:forEach items="${noticeList}" var="noticeInfo" varStatus="status">
				<tr>
					<td><img src="<c:url value='/images/egovframework/com/cop/bbs/icon_notice.png'/>" alt="notice"></td>
					<td class="bold ta_l"><a href="#none" onclick="javascript:selectArticleDetail('<c:out value="${noticeInfo.nttId}"/>')"><c:out value='${fn:substring(noticeInfo.nttSj, 0, 40)}'/></a></td>
					<td><c:out value='${noticeInfo.frstRegisterPnttm}'/></td>
					<td><c:out value='${noticeInfo.noticeAt}'/></td>
					<td><c:out value='${noticeInfo.useAt}'/></td>		
				</tr>
			</c:forEach> --%>
			
			<!-- 게시글 본문 -->
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
					<td><c:out value="${resultListTotCnt - ((searchVO.pageIndex-1) * searchVO.pageSize + status.index)}"/></td>
					<c:choose>
						<%-- 질환정보일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
							<td>
								<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
									<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
								</c:forEach>
							</td>
						</c:when>
						<%-- 영양정보일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
							<td>
								<c:forEach var="cmmCodeInfo" items="${listNTIComCode }">
									<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
								</c:forEach>
							</td>
						</c:when>
						<%-- 운동정보일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
							<td>
								<c:forEach var="cmmCodeInfo" items="${listMVIComCode }">
									<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
								</c:forEach>
							</td>
						</c:when>
						<%-- 운동동영상일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
							<td>
								<c:forEach var="cmmCodeInfo" items="${listMVMComCode }">
									<c:if test="${resultInfo.custom1 eq cmmCodeInfo.code}"><c:out value="${cmmCodeInfo.codeNm }" /></c:if>
								</c:forEach>
							</td>
						</c:when>
					</c:choose>
					<td class="ta_l"><a href="#none" onclick="javascript:updateArticleView('<c:out value="${resultInfo.nttId}"/>')"><c:out value='${fn:substring(resultInfo.nttSj, 0, 100)}'/></a></td>
					<c:choose>
						<%-- 공지사항일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
							<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
							<td><c:out value='${resultInfo.noticeAt}'/></td>
							<td><c:out value='${resultInfo.postingYn}'/></td>
						</c:when>
						<%-- 언론보도일 경우 --%>
						<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
							<td><c:out value='${resultInfo.custom1}'/></td>
							<td><c:out value='${resultInfo.customDate1}'/></td>
							<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
							<td><c:out value='${resultInfo.custom2}'/></td>
							<td><c:out value='${resultInfo.postingYn}'/></td>
						</c:when>
						<c:otherwise>
							<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
							<td><c:out value='${resultInfo.postingYn}'/></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		
			<c:if test="${fn:length(resultList) == 0}">
				<!-- 글이 없는 경우 -->
				<tr>
					<td colspan="<c:out value="${colspanSum}"/>"><spring:message code="common.nodata.msg" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<c:choose>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004' and fn:length(resultList) lt 4}">
		<!-- paginate -->
		<div class="paginate">
		</div>
		
		<div class="btns ta_r mt_m">
			<a href="#none" onclick="javascript:insertArticleView()" class="btn_ty03">등록하기</a>
		</div>
	</c:when>
	<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}"></c:when>
	<c:otherwise>
		<!-- paginate -->
		<div class="paginate">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnSelectLinkPage"/>
		</div>
		<!-- //paginate -->
		
		<div class="btns ta_r mt_m">
			<a href="#none" onclick="javascript:insertArticleView()" class="btn_ty03">등록하기</a>
		</div>
	</c:otherwise>
</c:choose>
