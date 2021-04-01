<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript" src="/js/fbcms/user/jquery.easing.min.js"></script>
<script type="text/javaScript" language="javascript">
<!--
	var pageIndex = 1;
	$(function() {
		/* faq */
		$('.faq_list').on('click', 'dt', function(event) {
			if($(this).next().is(':hidden')) {
				$('.faq_list dt').removeClass('active');
				$(this).addClass('active');
				$('.faq_list dt').next().slideUp();
				$(this).next().slideDown();
			} else {
				$('.faq_list dt').removeClass('active');
				$('.faq_list dt').next().slideUp();
			}
		});
		var faqlen = $('.faq_list dt').length;
		$('.faq_list dt').slice(0, 10).show();
		
		/* 더보기 */
		$('.btn_faq_more').click(function(e) {
			e.preventDefault();
			fnSelectLinkPage(pageIndex++);
		});
	});
	
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnSelectLinkPage(pageNo) {
		$.ajax({
			url :"<c:url value='/com/cmm/ajax/selectFaqAjaxMobileList.do'/>"
	        , type: "POST"
	        , data : {"pageIndex": pageIndex}
	        , success : function(html) {
	        	$('.faq_list').append(html);
				$('.faq_list dt').slice(pageIndex*10, $('.faq_list dt').length).show();
				var offset = $('.btn_faq_more').offset();
				$('html, body').animate({scrollTop : offset.top - '900'}, 400, 'easeInBack');
				if($('.faq_list dt').length < pageIndex*10) {
					$('.btn_faq_more').hide();
				};
				$('.faq_list dt').slice(pageIndex*10-10, pageIndex*10).show();
			}
		    ,error: function(error) {
		    	console.log(error);
		    }
		});
	}
-->
</script>

<!-- contents s -->
<div class="contents">

	<dl class="faq_list">
		<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<c:set var="subject">${resultInfo.qestnSj }</c:set>
			<c:if test="${not empty resultInfo.categoryNm }">
				<c:set var="subject"><${resultInfo.categoryNm}>${resultInfo.qestnSj }</c:set>
			</c:if>
			<dt>
				<c:out value='${fn:substring(subject, 0, 100)}'/>
			</dt>
			<dd>
				<p><c:out value="${fn:replace(resultInfo.answerCn , crlf , '<br/>')}" escapeXml="false" /></p>
			</dd>
		</c:forEach>
	</dl>

	<c:if test="${resultListTotCnt gt 10 }">
		<p class="btn_faq_more"><a href="javascript:void(0);">더보기</a></p>
	</c:if>
