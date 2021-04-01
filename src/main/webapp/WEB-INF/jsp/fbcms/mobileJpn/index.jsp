<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div id="container">
	<div class="con01">
		<div>
			<img src="/images/fbcms/mobileJpn/img_visual01.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileJpn/img_visual02.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileJpn/img_visual03.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileJpn/img_visual04.png" alt="">
		</div>
	</div>

	<div class="con02">
		<div class="con02_box">
			<div>
				<h3>診療科</h3>
			</div>
			<a href="/jpn/hpm/departments.do">さらに詳しく</a>
		</div>
		<div class="con02_box">
			<div>
				<h3>特化センター</h3>
			</div>
			<a href="/jpn/spc/specialized.do">さらに詳しく</a>
		</div>
		<div class="con02_box">
			<div>
				<h3>健康診断</h3>
			</div>
			<a href="/jpn/cuc/health.do">さらに詳しく</a>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>健康診断から診療、手術まで！<br>
			消化器疾患に特化した病院として、<br>
			最高の医療サービス<br>
			を発展させ続けていきます。</h3>
		<ul>
			<li>
				<img src="/images/fbcms/mobileJpn/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					大学教授歴任の<br>
					専門医20名が<br>
					検査を実施
				</p>
			</li>
			<li>
				<p>
					<strong>02</strong>
					診療当日の検査や<br>
					手術予約OK<br>
					ワンストップサービス
				</p>
				<img src="/images/fbcms/mobileJpn/img_con03_02.png" alt="">
			</li>
			<li>
				<img src="/images/fbcms/mobileJpn/img_con03_03.png" alt="">
				<p>
					<strong>03</strong>
					国内最高水準の<br>
					最先端医療設備
				</p>
			</li>
			<li>
				<p>
					<strong>04</strong>
					おへそからの手術<br>
					により傷跡が残らない<br>
					胆石手術
				</p>
				<img src="/images/fbcms/mobileJpn/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<p>V人間としての価値を最優先し、<br>
			共に成長しようとするヴ<br>
			ィエヴィスナム病院</p>
		<div>
			<a href="/jpn/cts/customer.do">诊疗时间</a>
			<a href="/jpn/cts/customer.do">来院路线</a>
		</div>
	</div>
	<a href="#wrap" class="btn_top" title="화면 상단으로 이동">TOP</a>

<script>
	$(document).ready(function() {
		$(window).load(function() {
			$('.con01').slick({
				dots: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 4000,
			});
		});
	});
</script>