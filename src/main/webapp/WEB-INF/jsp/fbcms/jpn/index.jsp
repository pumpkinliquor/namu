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
				<img src="/images/fbcms/jpn/img_Mcon01_01.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>患者の皆様をはじめ健康な方々までさらに健康に！ <br>
					ヴィエヴィス ナム病院が総合的な健康管理サービスを提供します。</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/jpn/img_Mcon01_02.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>患者の皆様をはじめ健康な方々までさらに健康に！ <br>
					ヴィエヴィス ナム病院が総合的な健康管理サービスを提供します。</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/jpn/img_Mcon01_03.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>患者の皆様をはじめ健康な方々までさらに健康に！ <br>
					ヴィエヴィス ナム病院が総合的な健康管理サービスを提供します。</span>
				</a>
			</li>
			<li class="vlist01">
				<img src="/images/fbcms/jpn/img_Mcon01_04.png" alt="">
				<a href="#n">
					<strong>CURE MEETS CARE</strong>
					<span>患者の皆様をはじめ健康な方々までさらに健康に！ <br>
					ヴィエヴィス ナム病院が総合的な健康管理サービスを提供します。</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- //contents 01 e -->

	<div class="con02">
		<div class="w1200">
			<div class="con02_box">
				<div>
					<h3>診療科</h3>
					<p>胃&middot;腸&middot;肝臓&middot;消化器疾患から<br>
					生活習慣病ケアまで
					</p>
				</div>
				<a href="/jpn/hpm/departments.do">さらに詳しく</a>
			</div>
			<div class="con02_box">
				<div>
					<h3>特化センター</h3>
					<p>
						教授歴任の専門医が<br>
						診療 / 検査 / 手術
					</p>
				</div>
				<a href="/jpn/spc/specialized.do">さらに詳しく</a>
			</div>
			<div class="con02_box">
				<div>
					<h3>健康診断</h3>
					<p>
						病気の発見と治療から<br>
						健康増進まで 
					</p>
				</div>
				<a href="/jpn/cuc/health.do">さらに詳しく</a>
			</div>
		</div>
	</div>

	<div class="con03 w1200">
		<h3>
			健康診断から診療、手術まで！ 消化器疾患に特化した病院として、<br>
			最高の医療サービスを発展させ続けていきます。
		</h3>
		<ul>
			<li>
				<img src="/images/fbcms/jpn/img_con03_01.png" alt="">
				<p>
					<strong>01</strong>
					大学教授歴任の<br>
					専門医20名が<br>
					検査を実施
				</p>
			</li>
			<li>
				<img src="/images/fbcms/jpn/img_con03_02.png" alt="">
				<p>
					<strong>02</strong>
					診療当日の検査や<br>
					手術予約OK<br>
					ワンストップ サービス
				</p>
			</li>
			<li>
				<p>
					<strong>03</strong>
					国内最高水準の<br>
					最先端医療設備
				</p>
				<img src="/images/fbcms/jpn/img_con03_03.png" alt="">
			</li>
			<li>
				<p>
					<strong>04</strong>
					おへそからの手術により<br>
					傷跡が残らない<br>
					胆石手術
				</p>
				<img src="/images/fbcms/jpn/img_con03_04.png" alt="">
			</li>
		</ul>
	</div>

	<div class="con04">
		<div class="w1200">
			<p>人間としての価値を最優先し、<br>
			共に成長しようとするヴィエヴィスナム病院</p>
			<div>
				<a href="/jpn/cts/customer.do">診療時間</a>
				<a href="/jpn/cts/customer.do">アクセス</a>
			</div>
			<a href="/jpn/cts/customer.do">さらに詳しく</a>
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