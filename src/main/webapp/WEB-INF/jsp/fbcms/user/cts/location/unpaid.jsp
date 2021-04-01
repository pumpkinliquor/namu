<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		var tabS = $('.vievis_list li').length;
		$('.vievis_list li').css('width', 1200 / tabS);


		$('.vievis_list li').click(function(event) {
			 var i = $(this).index();
			$('.vievis_list li').removeClass('selected');
			$(this).addClass('selected');
			$('.vievis_list li a').attr('title','');
			$(this).children('a').attr('title','선택된 탭');
			$(".vievis_box").css({
				opacity:0,
				left:'-999999999px',
				top:'-9999999px',
				position:'absolute'
			});
			$('.vievis_box').eq(i).css({
				opacity:1,
				position:'static'
			});
		});

		$('.history_box').append('<div class="dim" />');
		var hisH = $('.history_box').outerHeight();
		var topH = $('.history h5').outerHeight() + $('.history_box div:nth-of-type(1)').outerHeight() + $('.history_box div:nth-of-type(2)').outerHeight() + 110;
		$('.history_box, .history_box .dim').css('height',topH);

		$('.history .btn').click(function(event) {
			$('.history_box .dim').remove();
			$('.history_box').animate({height:hisH},800, 'swing');
			$('.history .btn').remove();
		});
	});
	
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
</script>

<!-- contents s -->
<div class="contents">
	<ul class="vievis_list w1200"><!-- tab -->
		<li class="selected"><a href="javascript:void(0);" title="선택된 탭">비에비스 나무병원은</a></li>
		<li><a href="javascript:void(0);">병원장 인사말</a></li>
		<li><a href="javascript:void(0);">미션, 비전과 CI</a></li>
		<li><a href="javascript:void(0);">나무의 역사(연혁)</a></li>
	</ul>
	
	<section class="vievis_box namuh"><!-- tab contents1 s -->
		<header>
			비에비스 나무병원은
			<p>대학병원의 전문성과 개인병원의 편리성만을 담은<br>
				국내 최초, 최고의 소화기질환 특화병원입니다</p>
		</header>
		<ul class="w1200 namuh_list">
			<li>
				<img src="/images/fbcms/user/img_namuh01.png" alt="">
				<p>
					<strong><span>01</span>
						소화기 특화병원</strong>
					위, 장, 간 등 유기적으로 연결된 소화기관에<br>
					발생하는 각종 질환에 대한 통합솔루션을 제공합니다
				</p>
			</li>
			<li>
				<img src="/images/fbcms/user/img_namuh02.png" alt="">
				<p><strong><span>02</span>교수역임 전문의 20인</strong>
				C교수역임 전문의들이 진료는 물론, 내시경&middot;초음파 등의<br>
				검사를 직접 시행하여 정확한 진단을 약속합니다</p>
			</li>
			<li>
				<img src="/images/fbcms/user/img_namuh03.png" alt="">
				<p><strong><span>03</span>검진부터 진료, 수술까지</strong>
				소화기 질환의 진단과 내과적 치료는 물론<br>
				수술적 치료까지, 개인에 맞는 최적의 치료법을<br>
				찾아드립니다</p>
			</li>
			<li>
				<img src="/images/fbcms/user/img_namuh04.png" alt="">
				<p><strong><span>04</span>진료당일 검사&middot;결과 상담 OK</strong>
				진료 당일 검사(내시경&middot;CT초음파 등)가 가능한 것은 물론,<br>
				검사결과 상담까지 모든 것이 하루만에 이루어집니다</p>
			</li>
			<li>
				<img src="/images/fbcms/user/img_namuh05.png" alt="">
				<p><strong><span>05</span>대학병원급 최신 의료장비</strong>
				전신 암을 한 번에 검사하는 PET-CT부터 현존<br>
				최고화질의 내시경 장비까지 최첨단 의료장비를<br>
				갖추고 있습니다</p>
			</li>
			<li>
				<img src="/images/fbcms/user/img_namuh06.png" alt="">
				<p><strong><span>06</span>개원이래 의료사고 0%</strong>
				비에비스 나무병원은 2008년 개원이래 의료사고 0%의<br>
				기록을 유지하고 있습니다<br>
				안전을 서약합니다</p>
			</li>
		</ul>
		<div class="namuh_md">
			<h5>진료과</h5>
			<ul class="namuh_box w1200">
				<li>
					<h6>소화기내과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>소화기외과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>신장내과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>가정의학과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>유방&middot;갑상선외과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>부인과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>영상의학과</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
			</ul>
		</div>
	
		<div class="namuh_sc w1200">
			<h5>특화센터</h5>
			<ul class="namuh_box">
				<li>
					<h6>당일내시경센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>용종&middot;암 치료내시경센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>담석&middot;단일통로<br>복강경 수술센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>유방&middot;갑상선 센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>당뇨센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>안티에이징센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
				<li>
					<h6>비만센터</h6>
					<p><a href="javascript:void(0);">더보기 +</a></p>
				</li>
			</ul>
		</div>
	</section><!-- //tab contents1 e -->
	
	<section class="vievis_box"><!-- tab contents2 s -->
		<section class="greetings01">
			<div class="w1200">
				<header>건강한 사람들도 더욱 건강하게 만들어주는<br> 나무병원이 되겠습니다</header>
				<p>비에비스 나무병원은 국내 최초이자 최고의 소화기질환 특화병원으로서 건강검진 및 외래진료는<br>
				물론 수술까지, 개인의 상황과 특성에 맞는 최적의 솔루션을 제공하기 위해 노력하고 있습니다</p>
			</div>
		</section>
	
		<section class="greetings02 w1200">
			<h4 class="con_in_tit02">병원장 인사말</h4>
			<p>저는 40여 년 동안 대학에서 소화기내과 전문의로 근무하면서 환자는 물론 건강한 사람들도 더욱 건강하게 만들어 주는 병원을 가지고 싶은 꿈이 있었습니다. 단지 질병을 발견하는 데에 그치지 않고 나아가서 고객이 건강해지는 데 필요한 모든 케어를 직접 해 줄 수 있는 병원이 되고자 2008년 비에비스 나무병원을 개원했습니다.</p>
			<p>비에비스 나무병원은 국내 최초이자 최고의 소화기질환 특화병원으로서 건강검진 및 외래진료는 물론 수술까지, 개인의 상황과 특성에 맞는 최적의 솔루션을 제공하기 위해 노력하고 있습니다.</p>
			<p>대학병원과 비교하여 전혀 손색이 없는 최첨단 진단 장비를 갖춘 것은 물론, 전문의 전원 대학병원 교수역임 전문의들로 구성하였습니다. 특히 소화기 내과의 경우 전문의 전원 소화기내시경 세부전문의 자격을 갖추는 등 의료서비스의 질을 향상시켰습니다.</p>
			<p>진료의 질을 높이는 것과 동시에, 진료당일 검사는 물론 결과상담이 모두 가능한 원스톱 시스템을 통해 편리성을 향상시켰으며, 설사약 먹지않는 대장내시경 프로세스를 개발하는 등 고객 편의를 위한 프로그램을 만들어 나가는 데에도 앞장서고 있습니다.</p>
			<p>국민 소화기 건강증진을 위해 비에비스 나무병원은 언제나 최선을 다할 것입니다.</p>
			<div>비에비스 나무병원 대표원장<span>민영일</span></div>
		</section>
	
		<section class="greetings03">
			<div class="w1200">
				<div>
					<h4 class="con_in_tit02">주요 약력</h4>
					<ul>
						<li>국내 내시경 관련 5개 학회 회장 모두 역임</li>
						<li>2006년 의사들이 뽑은 위장질환관련 '베스트 닥터 선정'</li>
						<li>'신동아'지 - 명의 700명이 추천한 '국내 최고의 명의 선정'</li>
					</ul>
				</div>
				<ul class="dot_list">
					<li>서울대학교 내과학 석사/박사</li>
					<li>서울대학교 병원인턴/레지던트</li>
					<li>前 서울아산병원 소화기센터장</li>
					<li>前 서울아산병원 검진센터 소장</li>
					<li>前 동국대학교 소화기센터장</li>
					<li>前 건국대학교 소화기센터장</li>
				</ul>
				<ul class="dot_list">
					<li>대한 헬리코박터 연구회 회장</li>
					<li>대한 소화기 내시경학회 회장</li>
					<li>대한 췌담도 연구회 회장</li>
					<li>대한 소화기 병학회 회장</li>
					<li>대한 소화기 운동학회 회장</li>
					<li>대한 건강증진학회 회장</li>
				</ul>
			</div>
		</section>
	
		<section class="greetings04 w1200">
			<h4 class="con_in_tit02">주요저서</h4>
			<ul>
				<li><img src="/images/fbcms/user/img_greet0401.png" alt="위장병 홈케어"></li>
				<li><img src="/images/fbcms/user/img_greet0402.png" alt="알기쉬운 위장병 예방과 치료법"></li>
				<li><img src="/images/fbcms/user/img_greet0403.png" alt="경비내시경"></li>
				<li><img src="/images/fbcms/user/img_greet0404.png" alt="복통의 진단학"></li>
				<li><img src="/images/fbcms/user/img_greet0405.png" alt="소화관 치료내시경 술기 아틀라스"></li>
				<li><img src="/images/fbcms/user/img_greet0406.png" alt="복통 따라잡기"></li>
				<li><img src="/images/fbcms/user/img_greet0407.png" alt="복부 영상 판독법"></li>
				<li><img src="/images/fbcms/user/img_greet0408.png" alt="소화관 내시경 영상 판독법"></li>
			</ul>
		</section>
	
	</section><!-- //tab contents2 e -->
	
	<section class="vievis_box mission"><!-- tab contents3 s -->
		<section class="greetings01 w1200">
			<header>나무의 비전과 미션</header>
			<p>NAMUH(나무)는 HUMAN(사람)을 거꾸로 읽은 것입니다 <br>
				사람(HUMAN)을 최우선 가치로 두고 함께 성장하고자 하는 비에비스 나무병원의 의지가 담겨 있습니다</p>
		</section>
	
		<section class="mission_box w1200">
			<div>
				<h5>MISSION</h5>
				<p>최상의 진료와 검진을 통한 질환의 치료,<br>
					예방과 증진으로 건강생명 연장의 꿈을 실현</p>
			</div>
			<div>
				<h5>VISION</h5>
				<ul>
					<li class="t_center">
						<img src="/images/fbcms/user/img_mission_box01.png" alt="">
						최적의 시스템과 전문성을 갖춘<br>차별화된 소화기 병원
					</li>
					<li class="t_center">
						<img src="/images/fbcms/user/img_mission_box02.png" alt="">
						정확한 건강진단을 통한<br>
						예방의료 활성화
					</li>
					<li class="t_center">
						<img src="/images/fbcms/user/img_mission_box03.png" alt="">
						지속적인 맞춤형 프로그램을 통한<br>
						미래형 건강관리 선도분야
					</li>
				</ul>
			</div>
			<div>
				<h5>SLOGAN</h5>
				<p>Cure meets care</p>
			</div>
			<div>
				<h5>CORE VALUES</h5>
				<ul>
					<li>
						<strong>인간중심</strong>
						비에비스 나무병원은 언제나 성실한<br>
						고객중심의 자세로 늘 가까이 할 수 있는<br>
						친근한 서비스를 제공합니다
					</li>
					<li>
						<strong>신뢰지향</strong>
						전문적인 통합 의료서비스를 실행함으로써<br>
						신뢰받는 의료기관의 임무를 수행하고<br>
						의료발전에 이바지합니다
					</li>
					<li>
						<strong>혁신 추구</strong>
						전문적인 통합 의료서비스를 실행함으로써<br>
						신뢰받는 의료기관의 임무를 수행하고<br>
						의료발전에 이바지합니다
					</li>
					<li>
						<strong>사회공헌</strong>
						환자치료와 안전에 새로운 지평을 마련하고,<br>
						실행하고 있는 전문분야 서비스의 기준과<br>
						모델이 되어 사회에 기여합니다
					</li>
					<li>
						<strong>인재존중</strong>
						직원들에게 보람을 제공하는 환경으로,<br>
						보람과 긍지로 최고가 되기 위해 노력합니다
					</li>
				</ul>
			</div>
		</section>
	
		<section class="greetings01 greet02 w1200">
			<header>나무병원 CI</header>
			<p>비에비스는 프랑스어로 ‘생명, 생활’을 뜻하는 vie와 ‘마주보기’를 뜻하는<br> vis-a-vis를 조합한 단어로서 ‘당신의 건강한 생활을 위해 개별 맞춤<br>
			건강서비스를 제공하겠다’는 의지가 담겨있습니다</p>
			<p>나무(NAMUH)에는 사람(HUMAN)을 최우선 가치로 두고 함께 성장하고자<br>
			하는 비에비스 나무병원의 의지를 표현하고 있습니다</p>
		</section>
	
		<section class="mission_box w1200">
			<div class="mt0">
				<h5>Color</h5>
				<p><img src="/images/fbcms/user/img_ci01.png" alt="VN Blue : R0,G104,B146">
					<img src="/images/fbcms/user/img_ci02.png" alt="VN Gray : R72,G148,B159">
					<img src="/images/fbcms/user/img_ci03.png" alt="VN Sky Blue : R128,G203,B211"></p>
			</div>
			<div>
				<h5>나무의 의미</h5>
				<p>NAMUH(나무)는 HUMAN(사람)을 거꾸로 읽은 것입니다<br>
				사람(HUMAN)을 최우선 가치로 두고 함께 성장하고자 하는 비에비스 나무병원의 의지가 담겨 있습니다<br>
				또한 풍성한 잎과 열매를 맺는 푸르고 건강한 나무처럼 모든 환자가 비에비스 나무병원에서 건강하게 회복하기를 바라는 마음이 담겨 있습니다</p>
			</div>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="javascript:void(0);" class="btn breservation">Download</a>
			</div>
		</section>
	
	</section><!-- //tab contents3 e -->
	
	<section class="vievis_box history w1200"><!-- tab contents4 s -->
		<h4 class="con_in_tit08">나무의 역사(연혁)</h4>
		<div class="history_box">
			<div>
				<h5>2020</h5>
				<ul>
					<li>
						<span>04.22</span>
						<p><strong>제 3회 안전선포식 실시</strong>
						- 안전서약 및 뱃지 패용식 실시 / 저소득층 무료 건강검진 지원(10명)</p>
					</li>
					<li>
						<span>04.06</span>
						<p><strong>2019 대한비만학회 제50회 춘계학술대회, 국내최초 ‘엔드볼 효과 및 안정성’ 연구결과 발표</strong>
						- 홍성수 병원장 및 홍형주 전문의. 소공동 롯데호텔</p>
					</li>
					<li>
						<span>02</span>
						<p><strong>서울아산병원 외과 전임의, 본원 단일통로 복강경 담낭절제술 술기교육 이수</strong>
						- 윤우영, 이승재, 박귀숙, 황승현 전문의 외 다수</p>
					</li>
					<li>
						<span>01</span>
						<p><strong>대한종합건강관리학회 우수종합건강진단센터 재인증(2019.01~2022.01)</strong></p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2019</h5>
				<ul>
					<li>
						<span>12</span>
						<p><strong>유산균발효유 전문기업 한국야쿠르트와 공동 임상시험</strong>
						- 주제: 간기능 개선에 미치는 복합물의 유효성 및 안전성 평가</p>
					</li>
					<li>
						<span>11</span>
						<p><strong>민영일 대표원장, 서울아산병원 소화기내과 명예교수 위촉</strong></p>
					</li>
					<li>
						<span>11</span>
						<p><strong>비에비스 나무병원 신장내과 신설 - 신장내과 정시정 전문의 영입</strong></p>
					</li>
					<li>
						<span>10.05</span>
						<p><strong>맘모톰의 올바른 사용증진을 위한 병원 인증</strong></p>
					</li>
					<li>
						<span>09.17</span>
						<p><strong>비에비스 나무병원 개원 10주년 기념식 실시</strong>
						- 근속직원 포상 및 10주년 기념 고객대상 응모권 프로모션 시행, 10주년 기념 조형물 제작</p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2018</h5>
				<ul>
					<li>
						<span>07</span>
						<p><strong>건강한 여름나기 캠페인 실시 (2018.07.18~20)</strong>
						- 병원 인근지역에서 건강정보 리플렛 및 방수밴드 배포 </p>
					</li>
					<li>
						<span>04.16</span>
						<p><strong>제 2회 안전선포식 실시</strong>
						- 안전서약 및 핸드프린팅 행사 / 고객대상 안전수첩 배포 / 저소득층 무료 건강검진 지원(10명)</p>
					</li>
					<li>
						<span>04</span>
						<p><strong>송대근 외과전문의, 질병관리본부 대한심폐소생협회 KALS provider 과정 이수 완료</strong></p>
					</li>
					<li>
						<span>04</span>
						<p><strong>안티에이징/비만센터 리뉴얼 오픈(가정의학과 주현정 전문의 영입)</strong></p>
					</li>
					<li>
						<span>03.04</span>
						<p><strong>2018 대한위대장내시경학회 제 31회 춘계학술대회에서 비만치료내시경 강연실시</strong>
						- 홍성수 병원장, 소공동 롯데호텔</p>
					</li>
					<li>
						<span>01.17</span>
						<p><strong>인도네시아 외과 의료진, 본원 단일통로 복강경 당남절제술 술기교육 이수(Dr. Errawan R.Wiradisuria 외 다수)</strong></p>
					</li>
					<li>
						<span>01.14</span>
						<p><strong>2018 대한외과술기연구회 ‘외과전문의 대상 초음파 술기 연수강좌’ 교육교수 초빙</strong>
						- 유방/갑상선외과 이은경 전문의, 충북 오송 메드트로닉 이노베이션 센터</p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2017</h5>
				<ul>
					<li>
						<span>09.25</span>
	                             <p><strong>건강한 명절 캠페인 실시 (2017.9.25~26)</strong>
	                             - 병원 인근지역에서 건강정보 리플렛 및 미니구급함 배포</p>
					</li>
					<li>
						<span>09.24</span>
						<p><strong>GE 128 slice CT 도입 (방사선 피폭량 최대 82% 축소)</strong></p>
					</li>
					<li>
						<span>09.20</span>
						<p><strong>인도네시아 외과 의료진, 본원 단일통로 복강경 담낭절제술 술기교육 이수 (Dr. Eko Priatno, SpB-BD 외 다수)</strong></p>
					</li>
					<li>
						<span>05.27</span>
						<p><strong>2017 대한외과학회 '외과전공의 대상 초음파 술기 연수강좌' 교육교수 초빙 (유방/갑상선외과 이은경 전문의)</strong></p>
	                         </li>
	                         <li>
						<span>04.01</span>
						<p><strong>비에비스 나무병원 치료내시경클리닉 개소</strong></p>
	                         </li>
	                         <li>
						<span>02.26</span>
						<p><strong>대한외과학회 전공의 술기교육 교수로 위촉 (유방/갑상선외과 이은경 전문의)</strong></p>
	                         </li>
	                         <li>
						<span>01.06</span>
						<p><strong>인도네시아 외과 의료진, 본원 단일통로 복강경 담낭절제술 술기교육 이수 (Dr. Tony Sukentro, SpB 외 다수)</strong></p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2016</h5>
				<ul>
					<li>
						<span>12</span>
	                             <p><strong>유산균발효유 전문기업 한국야쿠르트와 공동 임상시험</strong>
	                             - 주제 : 유산균이 헬리코박터 균에 미치는 영향</p>
					</li>
					<li>
						<span>11.26</span>
	                             <p><strong>2016 소화기내시경학회 우수연제상 수상 (홍은동 그랜드힐튼호텔)</strong>
	                             - 홍성수 병원장 등 내과전문의 6인, '설사약 먹지않는 대장내시경의 안전성 및 효과성' 연구</p>
					</li>
					<li>
						<span>11.14</span>
						<p><strong>대한소화기내시경연구재단 '우수내시경실 인증제' 인증획득 (2016.11~2019.10)</strong></p>
					</li>
					<li>
						<span>10.17</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
	                         </li>
	                         <li>
						<span>02.15</span>
	                             <p><strong>제 1회 안전선포식 실시</strong>
	                             - 안전서약 및 지문찍기 세레모니 / 고객참여 지문찍기 행사 / 저소득층 무료 건강검진 지원(10명)</p>
	                         </li>
	                         <li>
						<span>02</span>
						<p><strong>비만치료내시경 '엔드볼' 공식 임상수련병원 위촉</strong></p>
	                         </li>
	                         <li>
						<span>01</span>
						<p><strong>2015 건강보험심사평가원 '수술의 예방적 항생제 사용평가' 1등급 획득</strong></p>
	                         </li>
	                         <li>
						<span>01</span>
						<p><strong>2015 국민건강보험공단 '검진기관평가' 우수등급 획득</strong></p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2015</h5>
				<ul>
					<li>
						<span>11.01</span>
						<p><strong>대한종합건강관리학회 우수종합건강진단센터 인증 (2015.11~2018.10)</strong></p>
					</li>
					<li>
						<span>10.12</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
					</li>
					<li>
						<span>03.04</span>
						<p><strong>우수사원 해외연수 실시 (중국 북경 / 2015.3.4~3.7)</strong></p>
					</li>
					<li>
						<span>03.03</span>
						<p><strong>의료관광산업 발전 기여 공로패 수상 (강남구청)</strong></p>
	                         </li>
	                         <li>
						<span>01</span>
						<p><strong>2014 건강보험심사평가원 '수술의 예방적 항생제 사용평가' 1등급 획득</strong></p>
					</li>
				</ul>
			</div>
	
			<div>
				<h5>2014</h5>
				<ul>
					<li>
						<span>12.09</span>
	                             <p><strong>2014 한국의료관광 우수서비스 최우수상 수상</strong>
	                             - 설사약 먹지 않는 당일 대장내시경, 위내 보톡스 주사를 통한 비만치료 내시경</p>
					</li>
					<li>
						<span>10.07</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
					</li>
					<li>
						<span>07.16</span>
						<p><strong>갱년기/노화방지 센터 개소</strong></p>
					</li>
					<li>
						<span>04.19</span>
	                             <p><strong>2014 대한비만학회 춘계학술대회 우수연구상 수상</strong>
	                             - 홍성수 병원장, 위장 내 보톡스 주사를 통한 체중 감량 효과에 관한 연구</p>
	                         </li>
	                         <li>
						<span>04.08</span>
						<p><strong>안티에이징 비만센터 개소 (안티에이징 클리닉, 비만클리닉, 피부 클리닉 신설)</strong></p>
	                         </li>
	                         <li>
						<span>03.03</span>
						<p><strong>비에비스 나무병원 확장이전 (서울 강남구 논현동 84-22번지 → 논현동 175-10번지)</strong></p>
	                         </li>
	                         <li>
						<span>01.15</span>
						<p><strong>위장 내 보톡스 주사를 통한 비만치료 임상시험 시행</strong></p>
	                         </li>
	                         <li>
						<span>01</span>
						<p><strong>민영일 대표원장 블로그, 네이버 2013 파워블로그 선정</strong></p>
					</li>
				</ul>
	                 </div>
	
	                 <div>
				<h5>2013</h5>
				<ul>
					<li>
						<span>10.14</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
					</li>
					<li>
						<span>06.30</span>
						<p><strong>서울시 '건강체중 100일 333 프로젝트' 참여</strong></p>
					</li>
					<li>
						<span>03.21</span>
						<p><strong>SBS 드라마 '그겨울 바람이 분다' 촬영 (8층 VIP 병실)</strong></p>
					</li>
					<li>
						<span>03.11</span>
						<p><strong>개그맨 이경규, 비에비스 나무병원 명예 홍보대사 위촉</strong></p>
	                         </li>
	                         <li>
						<span>01</span>
						<p><strong>민영일 대표원장 블로그, 네이버 2012 파워블로그 선정</strong></p>
					</li>
				</ul>
			</div>
	
	                 <div>
				<h5>2012</h5>
				<ul>
					<li>
						<span>12.01</span>
						<p><strong>민영일 대표원장 공저, 도서 '닥터의 승부' 출간</strong></p>
					</li>
					<li>
						<span>11.01</span>
						<p><strong>대한종합건강관리학회 우수종합건강진단센터 인증 (2012.11~2015.10)</strong></p>
					</li>
					<li>
						<span>10.15</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
					</li>
					<li>
						<span>05.22</span>
						<p><strong>비에비스 나무병원 암센터 개소</strong></p>
	                         </li>
	                         <li>
						<span>05</span>
						<p><strong>한국의료질향상학회 회원 기관 인증</strong></p>
	                         </li>
	                         <li>
						<span>03.02</span>
						<p><strong>비에비스 나무병원 지방간 클리닉 개소</strong></p>
					</li>
				</ul>
	                 </div>
	
	                 <div>
				<h5>2011</h5>
				<ul>
					<li>
						<span>12</span>
						<p><strong>민영일 대표원장, JTBC 닥터의 승부 고정패널 출연 (2011.12~2015.08)</strong></p>
					</li>
					<li>
						<span>12.02</span>
						<p><strong>소화기내과 이주호 전문의 논문, 제 9회 아시아태평양 간학회 발표논문 우수발표작 선정</strong></p>
					</li>
					<li>
						<span>10.06</span>
						<p><strong>한국간재단과 함께하는 간질환 공개강좌 실시</strong></p>
					</li>
					<li>
						<span>08.15</span>
						<p><strong>비에비스 나무병원 모바일 홈페이지 제작 (http://www.namu.com/mobile)</strong></p>
	                         </li>
	                         <li>
						<span>05.04</span>
						<p><strong>민영일 대표원장, 강남구의료관광협회 검진부문 이사 위촉</strong></p>
	                         </li>
	                         <li>
						<span>03</span>
						<p><strong>비에비스 나무병원 간센터 개소</strong></p>
					</li>
				</ul>
	                 </div>
	
	                 <div>
				<h5>2010</h5>
				<ul>
					<li>
						<span>12</span>
						<p><strong>국내최초, '설사약 먹지않는 당일 대장내시경' 프로그램 개시</strong></p>
					</li>
					<li>
						<span>11.11</span>
						<p><strong>핑크리본캠페인 일환, 유방암 대국민 건강강좌 실시</strong></p>
					</li>
					<li>
						<span>10</span>
						<p><strong>헬스조선 2010 베스트 클리닉 선정</strong></p>
					</li>
					<li>
						<span>09.14</span>
						<p><strong>2010 메디컬 코리아 대상 소화기 부문 대상 수상</strong></p>
	                         </li>
	                         <li>
						<span>07.20</span>
						<p><strong>보건복지가족부 외국인환자 유치 의료기관 등록</strong></p>
	                         </li>
	                         <li>
						<span>02.01</span>
						<p><strong>소화기외과 박인자 전문의 대장암 수술 연구논문 2편 SCI 학술지 동시 게재</strong></p>
					</li>
				</ul>
	                 </div>
	
	                 <div>
				<h5>2009</h5>
				<ul>
					<li>
						<span>11.01</span>
						<p><strong>대한종합건강관리학회 우수종합건강진단센터 인증 (2009.11~2012.10)</strong></p>
					</li>
					<li>
						<span>08</span>
						<p><strong>헬스조선 2009 베스트 클리닉 선정</strong></p>
					</li>
					<li>
						<span>06.26</span>
						<p><strong>민영일 대표원장, '의료진과 일반인을 위한 복통 따라잡기' 출간</strong></p>
					</li>
					<li>
						<span>06.01</span>
						<p><strong>강남구 메디컬투어 의료관광 협력의료기관 체결</strong></p>
	                         </li>
	                         <li>
						<span>03.01</span>
						<p><strong>비에비스 나무병원 부인과 클리닉 개소</strong></p>
	                         </li>
	                         <li>
						<span>02.17</span>
						<p><strong>SBS 드라마 『카인과 아벨』 탤런트 한지민씨와 함께하는 새터민 무료 건강검진 실시 (25명)</strong></p>
					</li>
				</ul>
			</div>
	
			<div class="last">
				<h5>2008</h5>
				<ul>
					<li>
						<span>11.05</span>
						<p><strong>비에비스 나무병원 개원식 개최</strong></p>
					</li>
					<li>
						<span>09.16</span>
						<p><strong>비에비스 나무병원 개원 (서울 강남구 논현동 94-22번지)</strong></p>
					</li>
				</ul>
			</div>
		</div>
	
		<div class="btn_Lbox"><!-- btn box -->
			<a href="javascript:void(0);" class="btn bblue">더보기 +</a>
		</div>
	</section><!-- //tab contents4 e -->