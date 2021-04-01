<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<c:set var="subject">${resultInfo.qestnSj }</c:set>
	<c:if test="${not empty resultInfo.categoryNm }">
		<c:set var="subject"><${resultInfo.categoryNm}> ${resultInfo.qestnSj }</c:set>
	</c:if>
	<dt><span>Q</span>
		<c:out value='${fn:substring(subject, 0, 100)}'/>
	</dt>
	<dd><span>A</span>
		<p><c:out value="${fn:replace(resultInfo.answerCn , crlf , '<br/>')}" escapeXml="false" /></p>
	</dd>
</c:forEach>
