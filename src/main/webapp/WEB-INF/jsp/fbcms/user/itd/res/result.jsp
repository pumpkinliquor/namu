<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
<!--
	$(document).ready(function() {
		$('.floor_list li').click(function(event) {
			var floor = $('.floor_list li').length;
			var inum = floor - $(this).index();
			$('.floor_list li').removeClass('active');
			$(this).addClass('active');
		 	$('.floor_list img').attr('src','/images/fbcms/user/img_floor' + inum + 'f.png');
		});
		
		//1210 숫자 카운트
		$('.result_list li').each(function(index){
			  var resultn = $(this).index();
			  var memberCountConTxt = $('.result_list li').eq(resultn).find('span').text();
			  memberCountConTxt = memberCountConTxt.replace(/[^0-9]/g,'');
		  		
			  $({ val : 0 }).animate({ val : memberCountConTxt }, {
			   duration: 2000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.result_list li').eq(resultn).find('span').text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.result_list li').eq(resultn).find('span').text(num);
			  }
			});
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
-->
</script>

<!-- contents s -->
<div class="contents">
	<div class="result">
		<header>비에비스 나무병원에서는 작년 한 해 동안 <span class="c_blue">외래진료 6만여 건,</span><br>
			<span class="c_blue">건강검진 2만여 건, 내시경 3만여 건, 내시경시술 4천여 건</span>을 진행했습니다.</header>
		<ul class="result_list w1200">
			<c:forEach var="resultInfo" items="${resultList }" varStatus="status">
				<li>
					<span><c:out value='${resultInfo.custom1 }'/></span>
					<c:out value='${resultInfo.nttSj }'/>
				</li>
			</c:forEach>
		</ul>
		<P><c:out value='${articleVO.nttSj }'/></P>
	</div>
	<p class="result_txt">나무병원은 진료 수준과 시스템을 더욱 발전시켜 국내 최초/최고의 소화기 특화병원으로서<br>
	소화기 건강증진에 앞장서겠습니다.</p>