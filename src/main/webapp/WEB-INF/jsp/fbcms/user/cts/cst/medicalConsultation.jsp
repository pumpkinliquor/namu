<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- contents s -->
<div class="contents w1200">

	<div class="box_tit">
		<strong>고객님의 질문에 성심성의껏 답변을 드리겠습니다</strong>
		<p><span>일부 '증상'에 대해 문의하시는 경우, 명확한 답변을 드리지 못할 수도 있음을 양해 바랍니다</span>
		증상 외에도 촉진, 시진, 검사 등이 동반되어야 정확한 진단을 하 수 있으므로 내원 후 전문의 진료를 받으실 것을 권장합니다</p>
	</div>

	<div class="box_gate">
		<a href="/user/cts/cst/insertCSTView.do" class="b_gate01">의료상담</a>
		<a href="/user/cts/cst/selectCSTList.do" class="b_gate02">상담내역</a>
	</div>

	<div class="box_gray">
		<p>자주 질문하시는 내용을 모아놓은 FAQ 게시판을 이용하시면 더욱 빠르게 궁금증을 해소하실 수 있습니다</p>
		<div class="btn_Lbox"><!-- btn box -->
			<a href="/user/cts/faq/selectFaqList.do" class="btn bblue">자주하는 질문</a>
		</div>
	</div>

