<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="/js/fbcms/mobile/slick.js"></script>
<script type="text/javascript">
<!--
	$(function() {
		$('.result_list').slick({
		  arrows: false,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 2.5,
		  slidesToScroll:1,
		});
		
		//1210 숫자 카운트
		$('.result_list .slick-slide').each(function(index){
			  var resultn = $(this).index();
			  var memberCountConTxt = $('.result_list .slick-slide').eq(resultn).find('span').text();
			  memberCountConTxt = memberCountConTxt.replace(/[^0-9]/g,'');
		  		
			  $({ val : 0 }).animate({ val : memberCountConTxt }, {
			   duration: 2000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.result_list .slick-slide').eq(resultn).find('span').text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.result_list .slick-slide').eq(resultn).find('span').text(num);
			  }
			});
		});
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});
-->
</script>

<!-- contents s -->
<div class="contents">
	<div class="result">
		<header>비에비스 나무병원에서는 작년 한 해 동안 <span class="c_blue">외래진료 6만여 건,</span>
			<span class="c_blue">건강검진 2만여 건, 내시경 3만여 건, 내시경시술 4천여 건</span>을 진행했습니다.</header>
		<ul class="result_list">
			<c:forEach var="resultInfo" items="${resultList }" varStatus="status">
				<li>
					<span><c:out value='${resultInfo.custom1 }'/></span>
					<c:out value='${resultInfo.nttSj }'/>
				</li>
			</c:forEach>
		</ul>
		<P>* 2008년 개원 이후 누적</P>
	</div>
	<p class="result_txt">나무병원은 진료 수준과 시스템을 더욱 발전시켜 국내 최초/최고의 소화기 특화병원으로서 소화기 건강증진에 앞장서겠습니다.</p>