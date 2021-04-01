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
			<img src="/images/fbcms/mobileChn/img_visual01.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileChn/img_visual02.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileChn/img_visual03.png" alt="">
		</div>
		<div>
			<img src="/images/fbcms/mobileChn/img_visual04.png" alt="">
		</div>
	</div>

	<div class="con02">
		<div class="con02_box">
			<div>
				<h3>诊疗科室</h3>
			</div>
			<a href="/chn/hpm/departments.do">了解更多</a>
		</div>
		<div class="con02_box">
			<div>
				<h3>专科中心</h3>
			</div>
			<a href="/chn/spc/specialized.do">了解更多</a>
		</div>
		<div class="con02_box">
			<div>
				<h3>健康体检</h3>
			</div>
			<a href="/chn/cuc/health.do">了解更多</a>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>
			从健康体检到诊疗、手术！<br>
			作为一流消化系统特色医院， <br>
			致力于发展最优质医疗服务。
		</h3>
		<ul>
			<li>
				<img src="/images/fbcms/mobileChn/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					20位大学医院<br>
					教授级专科医生<br>
					负责检查
				</p>
			</li>
			<li>
				<p>
					<strong>02</strong>
					诊疗当天预约<br>
					现场检查手术<br>
					提供一站式服务
				</p>
				<img src="/images/fbcms/mobileChn/img_con03_02.png" alt="">
			</li>
			<li>
				<img src="/images/fbcms/mobileChn/img_con03_03.png" alt="">
				<p>
					<strong>03</strong>
					先进医疗设备<br>
					韩国顶级水平
				</p>
			</li>
			<li>
				<p>
					<strong>04</strong>
					经脐取石<br>
					微创无痕
				</p>
				<img src="/images/fbcms/mobileChn/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<p>VIEVIS NAMUH医院以人为本，<br>
		致力于实现共同发展。</p>
		<div>
			<a href="/chn/cts/customer.do">诊疗时间</a>
			<a href="/chn/cts/customer.do">诊疗时间</a>
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