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
				<img src="/images/fbcms/chn/img_Mcon01_01.png" alt="">
				<a href="#n">
					<strong>治愈疾病，呵护健康<br>
						CURE MEETS CARE</strong>
					<span>让患者和普通人都更加健康！<br>
					VIEVIS NAMUH医院提供综合健康管理服务</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/chn/img_Mcon01_02.png" alt="">
				<a href="#n">
					<strong>让患者和普通人都更加健康！</strong>
					<span>VIEVIS NAMUH医院提供综合健康管理服务</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/chn/img_Mcon01_03.png" alt="">
				<a href="#n">
					<strong>让患者和普通人都更加健康！</strong>
					<span>VIEVIS NAMUH医院提供综合健康管理服务</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/chn/img_Mcon01_04.png" alt="">
				<a href="#n">
					<strong>让患者和普通人都更加健康！</strong>
					<span>VIEVIS NAMUH医院提供综合健康管理服务</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- //contents 01 e -->

	<div class="con02">
		<div class="w1200">
			<div class="con02_box">
				<div>
					<h3>诊疗科室</h3>
					<p>
						治疗消化系统疾病<br>
						护理生活习惯疾病
					</p>
				</div>
				<a href="/chn/hpm/departments.do">了解更多</a>
			</div>
			<div class="con02_box">
				<div>
					<h3>专科中心</h3>
					<p>
						教授级专科医生<br>
						诊疗/检查/手术
					</p>
				</div>
				<a href="/chn/spc/specialized.do">了解更多</a>
			</div>
			<div class="con02_box">
				<div>
					<h3>健康体检</h3>
					<p>
						发现治疗疾病<br>
						促进身体健康
					</p>
				</div>
				<a href="/chn/cuc/health.do">了解更多</a>
			</div>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>
			从健康体检到诊疗、手术！<br>
			作为一流消化系统特色医院， 致力于发展最优质医疗服务。
		</h3>
		<ul>
			<li>
				<img src="/images/fbcms/chn/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					20位大学医院<br>
					教授级专科医生<br>
					负责检查
				</p>
			</li>
			<li>
				<img src="/images/fbcms/chn/img_con03_02.png" alt="">
				<p>
					<strong>02</strong>
					诊疗当天预约<br>
					现场检查手术<br>
					提供一站式服务
				</p>
			</li>
			<li>
				<p>
					<strong>03</strong>
					先进医疗设备<br>
					韩国顶级水平
				</p>
				<img src="/images/fbcms/chn/img_con03_03.png" alt="">
			</li>
			<li>
				<p>
					<strong>04</strong>
					经脐取石<br>
					微创无痕
				</p>
				<img src="/images/fbcms/chn/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<div class="w1200">
			<p>VIEVIS NAMUH医院以人为本，<br>
				致力于实现共同发展。</p>
			<div>
				<a href="/chn/cts/customer.do">诊疗时间</a>
				<a href="/chn/cts/customer.do">来院路线</a>
			</div>
			<a href="/chn/cts/customer.do">了解更多</a>
		</div>
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