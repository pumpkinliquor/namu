<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
	});
</script>

<!-- contents s -->
<div class="contents w1200">
	<h4 class="con_in_tit01 mb45">상급종합병원</h4>
	<ul class="partner_list">
		<li>
			<img src="/images/fbcms/user/img_partner01.png" alt="강북삼성병원">
			<p><a href="http://www.kbsmc.co.kr" target="_blank" title="강북삼성병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner02.png" alt="건국대학교병원">
			<p><a href="https://www.kuh.ac.kr" target="_blank" title="건국대학교병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<!-- <img src="/images/fbcms/user/img_partner03.png" alt="대림성모병원">
			<p><a href="http://www.drh.co.kr" target="_blank" title="대림성모병원 새창 바로가기">바로가기</a></p> -->
			<img src="/images/fbcms/user/img_partner23.png" alt="서울아산병원">
			<p><a href="http://www.amc.seoul.kr/asan/main.do" target="_blank" title="서울아산병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner04.png" alt="분당서울대학교병원">
			<p><a href="http://www.snubh.org" target="_blank" title="분당서울대학교병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner05.png" alt="삼성서울병원">
			<p><a href="http://www.samsunghospital.com" target="_blank" title="삼성서울병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner06.png" alt="서울대학교병원">
			<p><a href="http://www.snuh.org" target="_blank" title="서울대학교병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner07.png" alt="순천향대학교 부천병원">
			<p><a href="http://www.schmc.ac.kr/bucheon/index.do" target="_blank" title="순천향대학교 부천병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner08.png" alt="강남세브란스병원">
			<p><a href="http://gs.iseverance.com" target="_blank" title="강남세브란스병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner09.png" alt="중앙대학교병원">
			<p><a href="http://ch.caumc.or.kr" target="_blank" title="중앙대학교병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner10.png" alt="고려대학교안암병원">
			<p><a href="http://anam.kumc.or.kr" target="_blank" title="고려대학교안암병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner11.png" alt="가톨릭대학교 서울성모병원">
			<p><a href="http://www.cmcseoul.or.kr" target="_blank" title="가톨릭대학교 서울성모병원 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner12.png" alt="세브란스병원">
			<p><a href="https://sev.iseverance.com/" target="_blank" title="세브란스병원 새창 바로가기">바로가기</a></p>
		</li>
	</ul>
	
	<h4 class="con_in_tit01 mb45 mt100">병원</h4>
	<ul class="partner_list">
		<li><span>척추&middot;관절</span>
			<img src="/images/fbcms/user/img_partner13.png" alt="나누리병원">
			<p><a href="http://www.nanoori.co.kr" target="_blank" title="나누리병원 새창 바로가기">바로가기</a></p>
		</li>
		<li><span class="blue">비뇨기과</span>
			<img src="/images/fbcms/user/img_partner14.png" alt="골드만비뇨의학과">
			<p><a href="https://www.gold-man.com/" target="_blank" title="골드만비뇨의학과 새창 바로가기">바로가기</a></p>
		</li>
		<li><span>산부인과</span>
			<img src="/images/fbcms/user/img_partner15.png" alt="미즈메디병원">
			<p><a href="http://www.mizmedi.com/" target="_blank" title="미즈메디병원 새창 바로가기">바로가기</a></p>
		</li>
		<li><span>이비인후과</span>
			<img src="/images/fbcms/user/img_partner16.png" alt="하나이비인후과병원">
			<p><a href="http://www.hanaent.co.kr" target="_blank" title="하나이비인후과병원 새창 바로가기">바로가기</a></p>
		</li>
		<li><span class="blue">재활요양</span>
			<img src="/images/fbcms/user/img_partner17.png" alt="트리니티 재활 요양병원">
			<p><a href="http://www.trinityhospital.co.kr" target="_blank" title="트리니티 재활 요양병원 새창 바로가기">바로가기</a></p>
		</li>
		<li><span>뇌신경</span>
			<img src="/images/fbcms/user/img_partner18.png" alt="이태규 뇌리신경과">
			<p><a href="http://www.friendclinic.com" target="_blank" title="이태규 뇌리신경과 새창 바로가기">바로가기</a></p>
		</li>
		<li><span>안과</span>
			<img src="/images/fbcms/user/img_partner19.png" alt="압구정성모안과">
			<p><a href="http://www.smecdoc.co.kr" target="_blank" title="압구정성모안과 새창 바로가기">바로가기</a></p>
		</li>
		<li><span class="blue">심혈관</span>
			<img src="/images/fbcms/user/img_partner20.png" alt="가슴편한내과">
			<p><a href="http://www.iheartwell.com" target="_blank" title="가슴편한내과 새창 바로가기">바로가기</a></p>
		</li>
	</ul>
	
	<h4 class="con_in_tit01 mb45 mt100">검진센터</h4>
	<ul class="partner_list">
		<li>
			<img src="/images/fbcms/user/img_partner21.png" alt="intercare">
			<p><a href="https://www.intercarehpc.com" target="_blank" title="intercare 새창 바로가기">바로가기</a></p>
		</li>
		<li>
			<img src="/images/fbcms/user/img_partner22.png" alt="gc녹십자아이메드">
			<p><a href="http://www.gcimed.com" target="_blank" title="gc녹십자아이메드 새창 바로가기">바로가기</a></p>
		</li>
	</ul>