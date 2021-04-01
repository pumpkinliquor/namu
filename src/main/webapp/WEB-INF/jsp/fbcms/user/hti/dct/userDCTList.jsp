<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javaScript" language="javascript">
<!--
	$(function() {
	});
	
	/* ********************************************************
	 * 바로보기 PDF뷰어
	 ******************************************************** */
	function fnPdfView(fileNm) {
		window.open("/com/cmm/ajax/getPdfViewer.do?fileNm="+encodeURI(fileNm));
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
-->
</script>

<!-- contents s -->
<div class="contents w1200">
	<ul class="dr_list">
		<%-- <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<c:if test="${status.count lt 5}">
				<fmt:formatNumber var="classNo" minIntegerDigits="2" value="${status.count}" type="number"/>
				<li class="dr<c:out value='${classNo}'/>">
					<div></div>
					<c:if test="${not empty resultInfo.listFile and not empty resultInfo.listFile[1]}">
						<img src="<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value='${resultInfo.listFile[1].atchFileId}'/>&fileSn=1" alt="<c:out value='${resultInfo.listFile[1].orignlFileNm}'/>">
					</c:if>
					<div class="dr_txt">
						<p><c:out value='${resultInfo.nttSj}'/></p>
						<a href="#none" onclick="javascript:fnPdfView('${resultInfo.atchFileId}', '0')" class="brview">바로보기</a>
						<a href="#none" onclick="javascript:fnAtchDownFile('${resultInfo.atchFileId}', '0')" class="brdown">다운로드</a>
					</div>
				</li>
			</c:if>
		</c:forEach> --%>
		<li class="dr01">
			<div></div>
			<img src="/images/fbcms/user/etc/bg_dr00_1.jpg" alt="위식도편"/>
			<div class="dr_txt">
				<p>위식도편</p>
				<a href="#none" onclick="javascript:fnPdfView('위식도편.pdf')" class="brview">바로보기</a>
				<a href="#none" onclick="javascript:resourceFileDown('위식도편.pdf')" class="brdown">다운로드</a>
			</div>
		</li>
		<li class="dr02">
			<div></div>
			<img src="/images/fbcms/user/etc/bg_dr00_2.jpg" alt="대장항문편"/>
			<div class="dr_txt">
				<p>대장항문편</p>
				<a href="#none" onclick="javascript:fnPdfView('대장항문편.pdf')" class="brview">바로보기</a>
				<a href="#none" onclick="javascript:resourceFileDown('대장항문편.pdf')" class="brdown">다운로드</a>
			</div>
		</li>
		<li class="dr03">
			<div></div>
			<img src="/images/fbcms/user/etc/bg_dr00_3.jpg" alt="간담낭편"/>
			<div class="dr_txt">
				<p>간담낭편</p>
				<a href="#none" onclick="javascript:fnPdfView('간담낭편.pdf')" class="brview">바로보기</a>
				<a href="#none" onclick="javascript:resourceFileDown('간담낭편.pdf')" class="brdown">다운로드</a>
			</div>
		</li>
		<li class="dr04">
			<div></div>
			<img src="/images/fbcms/user/etc/bg_dr00_4.png" alt="무엇이든 물어보세요"/>
			<div class="dr_txt">
				<p>무엇이든 물어보세요</p>
				<a href="#none" onclick="javascript:fnPdfView('무엇이든 물어보세요.pdf')" class="brview">바로보기</a>
				<a href="#none" onclick="javascript:resourceFileDown('무엇이든 물어보세요.pdf')" class="brdown">다운로드</a>
			</div>
		</li>
	</ul>
	<p class="date_desc02 c_point">* 크롬에서는 다운로드/뷰어보기가 가능하며, 익스프롤러 등에서는 다운로드만 가능합니다</p><!-- 1229 -->
