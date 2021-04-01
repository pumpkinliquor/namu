<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!-- container -->
<div id="contents">

	<!-- contents 01 s -->
	<section class="con01">
		<ul>
			<li class="vlist01">
				<img src="/images/fbcms/eng/img_Mcon01_01.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>Wellness for patients and healthy people alike Vievis Namuh Hospital offers integrated health management services.</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/eng/img_Mcon01_02.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>Wellness for patients and healthy people alike Vievis Namuh Hospital offers integrated health management services.</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/eng/img_Mcon01_03.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>Wellness for patients and healthy people alike Vievis Namuh Hospital offers integrated health management services.</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/eng/img_Mcon01_04.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>Wellness for patients and healthy people alike Vievis Namuh Hospital offers integrated health management services.</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- //contents 01 e -->

	<div class="con02">
		<div class="w1200">
			<div class="con02_box">
				<div>
					<h3>Departments</h3>
					<p>
						From gastrointestinal <br>
						to intestinal,liver, digestive <br>
						diseases and lifestyle diseases
					</p>
				</div>
				<a href="/eng/hpm/departments.do">MORE VIEW </a>
			</div>
			<div class="con02_box">
				<div>
					<h3>Specialized centers</h3>
					<p>
						Specialists with experience <br>
						as medical professors<br>
						provide treatment, exams, <br>
						and surgeries
					</p>
				</div>
				<a href="/eng/spc/specialized.do">MORE VIEW </a>
			</div>
			<div class="con02_box">
				<div>
					<h3>Health screening</h3><!-- 1208 -->
					<p>
						From diagnosis and <br>
						treatment of diseases<br>
						to promoting health 
					</p>
				</div>
				<a href="/eng/cuc/health.do">MORE VIEW </a>
			</div>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>
			From health screening to treatment and surgery!<br> 
			As the top specialist in gastroenterology, <br>
			we will develop the best medical services.
		</h3>
		<ul>
			<li>
				<img src="/images/fbcms/eng/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					Direct examination by<br>
					20 specialists with <br>
					experience as medical <br>
					professors
				</p>
			</li>
			<li>
				<img src="/images/fbcms/eng/img_con03_02.png" alt="">
				<p>
					<strong>02</strong>
					One-stop service: exams <br>
					and surgery appointments <br>
					available on the day <br>
					of treatment
				</p>
			</li>
			<li>
				<p>
					<strong>03</strong>
					Highest level of<br>
					cutting-edge medical<br>
					equipment in Korea
				</p>
				<img src="/images/fbcms/eng/img_con03_03.png" alt="">
			</li>
			<li>
				<p>
					<strong>04</strong>
					Scar-free gallstones<br>
					surgery through<br>
					laparoscopy
				</p>
				<img src="/images/fbcms/eng/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<div class="w1200">
			<p>Vievis Namuh Hospital prioritizes human life<br>
			and aims to flourish in harmony</p>
			<div>
				<a href="/eng/cts/customer.do">Hours</a>
				<a href="/eng/cts/customer.do">Directions</a>
			</div>
			<a href="/eng/cts/customer.do">MORE VIEW</a>
		</div>

<script>
	$(document).ready(function() {
		$(window).load(function() {
			$('.con01 ul').slick({
				dots: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 4000,
			});
		});
	});
</script>