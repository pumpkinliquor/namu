<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		$('.floor_list li').click(function(event) {
			var floor = $('.floor_list li').length;
			var inum = floor - 2 - $(this).index();
			$('.floor_list li').removeClass('active');
			$(this).addClass('active');
	     	$('.floor_list img').attr('src', '/images/fbcms/user/img_floor' + inum + 'f.png');
		});
	});
</script>

<!-- contents s -->
<div class="contents w1200">
	<h4 class="con_in_tit02">층별안내</h4>
	<div class="floor_list">
		<ul>
			<li>
				<strong>11층</strong>
				<a href="javascript:void(0);">중앙수술센터 / 보호자대기실</a>
			</li>
			<li>
				<strong>10층</strong>
				<a href="javascript:void(0);">식당</a>
			</li>
			<li>
				<strong>9층</strong>
				<a href="javascript:void(0);">병동(901 ~ 906) / 특실 / 약제과</a>
			</li>
			<li>
				<strong>8층</strong>
				<a href="javascript:void(0);">병동(801 ~ 804)</a>
			</li>
			<li>
				<strong>7층</strong>
				<a href="javascript:void(0);">병동(701 ~ 709) / 주사실</a>
			</li>
			<li>
				<strong>6층</strong>
				<a href="javascript:void(0);">외과 외래 / 안티에이징 &middot; 비만센터 / 영양상담실</a>
			</li>
			<li>
				<strong>5층</strong>
				<a href="javascript:void(0);">PET-CT, CT, 초음파</a>
			</li>
			<li>
				<strong>4층</strong>
				<a href="javascript:void(0);">외래 채혈, X-ray, 골밀도, 심전도 / 부인과</a>
			</li>
			<li>
				<strong>3층</strong>
				<a href="javascript:void(0);">검진 채혈, 기초계측, 유방촬영</a>
			</li>
			<li>
				<strong>2층</strong>
				<a href="javascript:void(0);">검진 접수&middot;수납</a>
			</li>
			<li class="active">
				<strong>1층</strong>
				<a href="javascript:void(0);">내외과 접수&middot;수납 / 내과 외래 / 로비</a>
			</li>
			<li>
				<strong>P층</strong>
				<a href="javascript:void(0);">주차장</a>
			</li>
			<li>
				<strong>지하1층</strong>
				<a href="javascript:void(0);">내시경센터</a>
			</li>
		</ul>
		<img src="/images/fbcms/user/img_floor1f.png" alt="">