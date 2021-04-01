<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

	<div class="container" id="contents">
		<div class="s_default">
			<p>질환명을 검색하여 질병정보, 진료과<span>&middot;</span>센터를 확인하세요</p>
			<div>
				<form action="/user/cmm/src/search.do" method="post" name="searchForm">
					<input type="hidden" name="lastTabIndex" value="<c:out value='${searchVO.lastTabIndex}'/>">
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<input type="hidden" name="searchCondition" value="1">
					<input type="text" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력해주세요 (예:담석)">
					<input type="submit" value="검색버튼">
				</form>
			</div>
		</div>

		<!-- contents s -->
		<div class="contents w1200">
			<h3 class="search_tit">검색결과</h3>
			<ul class="search_tab tab_list"><!-- tab -->
				<li class="selected"><a href="javascript:chgTab('All');" title="선택된 탭" id="fnTapAll">전체<span id="cntAll">(0)</span></a></li>
				<li><a href="javascript:chgTab('1');" id="fnTap1">진료과<span>(0)</span></a></li>
				<li><a href="javascript:chgTab('2');" id="fnTap2">특화센터<span>(0)</span></a></li>
				<li><a href="javascript:chgTab('3');" id="fnTap3">의료진<span>(0)</span></a></li>
				<li><a href="javascript:chgTab('4');" id="fnTap4">건강정보<span>(0)</span></a></li>
				<li><a href="javascript:chgTab('5');" id="fnTap5">자주하는 질문<span>(0)</span></a></li>
			</ul>
			<div class="box_none">
				<p>검색어를 입력해주세요</p>
			</div>
		</div>
		<!-- //contents e -->

	</div>
<script type="text/javascript">
window.onload = function() {
	$('#fnTap${searchVO.lastTabIndex}').trigger('click');
}
function chgTab(idx) {
	$('input[name="lastTabIndex"]').val(idx);
}
</script>