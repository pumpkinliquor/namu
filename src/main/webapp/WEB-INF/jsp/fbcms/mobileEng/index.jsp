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
			<img src="/images/fbcms/mobileEng/img_visual01.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileEng/img_visual02.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileEng/img_visual03.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileEng/img_visual04.png" alt="">
		</div>
	</div>

	<div class="con02">
		<div class="con02_box">
			<div>
				<h3>Departments</h3>
			</div>
			<a href="/eng/hpm/departments.do">MORE VIEW </a>
		</div>
		<div class="con02_box">
			<div>
				<h3>Specialized<br>centers</h3>
			</div>
			<a href="/eng/spc/specialized.do">MORE VIEW </a>
		</div>
		<div class="con02_box">
			<div>
				<h3>Health screening</h3><!-- 1208 -->
			</div>
			<a href="/eng/cuc/health.do">MORE VIEW </a>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>
			From health screening to treatment<br>and surgery!
			As the top specialist<br> in gastroenterology, <br>
			we will develop the best<br> medical services.
		</h3>
		<ul>
			<li>
				<img src="/images/fbcms/mobileEng/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					Direct examination by<br>
					20 specialists with <br>
					experience as medical <br>
					professors
				</p>
			</li>
			<li>
				<p>
					<strong>02</strong>
					One-stop service: exams <br>
					and surgery appointments <br>
					available on the day <br>
					of treatment
				</p>
				<img src="/images/fbcms/mobileEng/img_con03_02.png" alt="">
			</li>
			<li>
				<img src="/images/fbcms/mobileEng/img_con03_03.png" alt="">
				<p>
					<strong>03</strong>
					Highest level of<br>
					cutting-edge medical<br>
					equipment in Korea
				</p>
			</li>
			<li>
				<p>
					<strong>04</strong>
					Scar-free gallstones<br>
					surgery through<br>
					laparoscopy
				</p>
				<img src="/images/fbcms/mobileEng/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<p>Vievis Namuh Hospital<br> prioritizes human life<br>
		and aims to flourish in harmony</p>
		<div>
			<a href="/eng/cts/customer.do">Hours</a>
			<a href="/eng/cts/customer.do">Directions</a>
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