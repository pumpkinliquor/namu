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
<div class="contents pd0">
	<ul class="tab_list02"><!-- tab -->
		<li class="selected">
			<a href="#n" title="선택된 탭">센터소개</a></li>
		<li>
			<a href="#n">대상자&middot;추가검진패키지</a></li>
	</ul>

	<div class="tab_box pd0"><!-- box01 -->
		<div class="mar20">
			<h4 class="con_in_tit04">나무병원 공단검진센터</h4>
			<img src="/images/fbcms/mobile/img_exam03_01.png" alt="" class="mb30">
			<video id="myVideo" src="/getImage/resource/%EA%B3%B5%EB%8B%A8%EA%B2%80%EC%A7%84.mp4" width="100%" controls></video>
		</div>

		<div class="greetbox mt40">
			<h4 class="con_in_tit04 mar20">보건복지부 공단검진 우수등급 획득</h4>
			<p class="con_in_txt02 mar20">비에비스 나무병원은 보건복지부 공단검진(국민건강검진) 기관평가에서 공단검진 일반검진분야는 물론 위암검진, 대장암검진, 진단의학분야 등에서 우수등급을 획득했습니다</p>
			<img src="/images/fbcms/mobile/img_exam03_02.png" alt="" class="img_center pad20">
		</div>
		<div class="greetbox mt40">
			<h4 class="con_in_tit04 mar20">일반검진은 물론 국가암검진도 시행하며, 추가검사도 가능합니다</h4>
			<div class="exam03_01">
				<div>
					<img src="/images/fbcms/mobile/img_exam03_03.png" alt="">
					<p>공단검진 일반검진</p>
				</div>
				<div>
					<img src="/images/fbcms/mobile/img_exam03_04.png" alt="">
					<p>공단검진 암검진</p>
				</div>
			</div>
		</div>

		<!-- <div class="exam_p">
			<h4 class="con_in_tit04">NAMUH 추가검사 패키지</h4>
			<div class="exam_pbox">
				<p>
					주요혈액 맞춤검사<br>
					<strong>70,000</strong>원
				</p>
				<ul>
					<li>이상지질혈증(고지혈증)</li>
					<li>혈당</li>
					<li>간염 (A형,B형,C형)</li>
					<li>갑상선기능</li>
					<li>췌장기능 검사</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					혈액 암표지자 검사<br>
					<strong>70,000</strong>원
				</p>
				<ul>
					<li>대장암</li>
					<li>간암</li>
					<li>담낭 및 췌장암</li>
					<li>난소암</li>
					<li>전립선암</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					심혈관 정밀검사<br>
					<strong>150,000</strong>원
				</p>
				<ul>
					<li>관상동맥 석회화 CT</li>
					<li>경동맥 초음파</li>
					<li>심전도</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					여성 정밀검사<br>
					<strong>250,000</strong>원
				</p>
				<ul>
					<li>유방초음파</li>
					<li>갑상선초음파</li>
					<li>골반초음파</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					남성 정밀검사<br>
					<strong>250,000</strong>원
				</p>
				<ul>
					<li>복부초음파</li>
					<li>경동맥초음파</li>
					<li>저선량 흉부 CT</li>
				</ul>
			</div>
		</div> -->

		
	</div>
	
	<div class="tab_box pd0"><!-- box02 -->
		<div class="mar20">
			<h4 class="con_in_tit04">공단검진 대상자</h4>
			<h5 class="con_in_tit08">1. 일반공단검진</h5>
			<div class="tdetail tdetail04 mar0">
				<table>
					<caption>일반공단검진 표</caption>
					<col style="width:50%;">
					<col/>
					<thead>
						<tr>
							<th scope="col">지역가입자</th>
							<th scope="col">직장가입자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<ul class="dot_list03 mar0">
									<li>세대주 및 만 20세 이상 세대원(2년에 1회)</li>
								</ul>
							</td>
							<td>
								<ul class="dot_list03 mar0">
									<li>비사무직 가입자(연1회)</li>
									<li>사무직 가입자(2년에 1회)</li>
									<li>세대원 중 만 20세 이상인 자(2년에 1회)</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<h5 class="con_in_tit02 mt70">암검진</h5>
			<ul class="cancer">
				<li>
					<img src="/images/fbcms/mobile/img_exam03_05.png" alt="">
					<strong>위암</strong>
					<span>만 40세 이상</span>
				</li>
				<li>
					<img src="/images/fbcms/mobile/img_exam03_06.png" alt="">
					<strong>대장암</strong>
					<span>만 50세 이상</span>
				</li>
				<li>
					<img src="/images/fbcms/mobile/img_exam03_07.png" alt="">
					<strong>간암</strong>
					<span>고위험군으로 지정된 분</span>
				</li>
				<li>
					<img src="/images/fbcms/mobile/img_exam03_08.png" alt="">
					<strong>유방암</strong>
					<span>만 40세 이상</span>
				</li>
				<li>
					<img src="/images/fbcms/mobile/img_exam03_09.png" alt="">
					<strong>자궁경부암</strong>
					<span>만 20세 이상</span>
				</li>
			</ul>
			<div class="box_blue">
				<h5 class="important">간암 고위험군으로 지정된 분</h5>
				<ul>
					<li>해당년도 이전 2개년도 보험급여 내역 중 간암 발생 고위험군<br>
					(간 경변증, B형 간염 바이러스 항원 양성, C형 간염 바이러스 항체 양성, B형 또는 C형 간엽 바이러스에 의한 만성 간질환 환자)</li>
					<li>과거년도 일반건강검진 결과 B형 간염 바이러스 표면항원 양성자 또는 C형 간염 바이러스 항체 양성자</li>
				</ul>
			</div>

			<h4 class="con_in_tit04">공단검진 항목</h4>
			<h5 class="con_in_tit08">일반공단검진</h5>
			<h6 class="con_in_tit11 mt45">공통 검사 항목</h6>
			<p class="con_in_txt">신장, 체중, 허리둘레, 체질량지수, 청력, 시력, 혈압, 빈혈, 간기능, 당뇨, 신장기능, 흉부촬영, 소변검사</p>
			<h6 class="con_in_tit01 mt40">성&middot;연령별 검사 항목</h6>
			<div class="tdetail tdetail04 mar0">
				<table>
					<caption>연령별 검사 항목 표</caption>
					<col style="width:50%;">
					<col/>
					<thead>
						<tr>
							<th scope="col">검진항목</th>
							<th scope="col">실시시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="t_left c_gray3">이상지지혈증<br>
								<span class="c_gray6">(총콜레스테롤, HDL콜레스테롤, LDL콜레스테롤, 트리글리세라이드)</span></td>
							<td class="t_left">* 남자 만 24세 이상, 여자 만 40세 이상: 4년마다</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">B형 간염검사</td>
							<td class="t_left">만 40세: 보균자 및 면역자는 제외</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">치면세균막검사</td>
							<td class="t_left">만 40세</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">골다공증</td>
							<td class="t_left">만 54, 66세 여성</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">정신건강검사, 우울증</td>
							<td class="t_left">만 20, 30, 40, 50, 60, 70세</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">생활습관평가</td>
							<td class="t_left">만 40, 50, 60, 70세</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">노인신체기능검사</td>
							<td class="t_left">만 66, 70, 80세</td>
						</tr>
						<tr>
							<td class="t_left c_gray3">인지기능장애검사</td>
							<td class="t_left">만 66세 이상: 2년에 1회</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="box_blue mt20">
				<h5 class="important">2018년 부터 고지혈증(이상지질혈증) 항목이 4년에 1회 검사로 변경되었습니다</h5>
				<p>유병률 47.8%에 이르는 고지혈증이 걱정되시는 경우 나무병원 공단검진 추가패키지 중 “주요혈액 맞춤검사”를 선택 시 고지혈증 수치체크가 가능합니다</p>
			</div>
			<h5 class="con_in_tit02 mt70">암검진</h5>
			<div class="tdetail tdetail04 mar0">
				<table>
					<caption>암검진 표</caption>
					<col style="width:30%;">
					<col style="width:30%;">
					<col/>
					<thead>
						<tr>
							<th scope="col">검진유형</th>
							<th scope="col">검진항목</th>
							<th scope="col">실시시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="c_gray3">위암검진</td>
							<td>위내시경</td>
							<td class="t_left">만 40세 이상 남녀 : 2년마다</td>
						</tr>
						<tr>
							<td class="c_gray3" rowspan="2">대장암검진</td>
							<td>분변잠혈검사(FOBT)</td>
							<td class="t_left">만 50세 이상 남녀 : 1년마다</td>
						</tr>
						<tr>
							<td>대장내시경검사</td>
							<td class="t_left">분변잠혈검사(FOBT) 양성판정자</td>
						</tr>
						<tr>
							<td class="c_gray3">간암검진</td>
							<td>간 초음파 검사<br>
								혈액검사(혈청알태아단백검사) </td>
							<td class="t_left">간 초음파 검사<br>
								혈액검사(혈청알태아단백검사) </td>
						</tr>
						<tr>
							<td class="c_gray3">유방암검진</td>
							<td>유방촬영검사</td>
							<td class="t_left">만 40세 이상 남녀 : 2년마다</td>
						</tr>
						<tr>
							<td class="c_gray3">자궁경부암검진</td>
							<td>자궁경부세포검사</td>
							<td class="t_left">만 40세 이상 남녀 : 2년마다</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="exam_p">
			<h4 class="con_in_tit04">NAMUH 추가검사 패키지</h4>
			<img src="/images/fbcms/user/img_infoICC_01.jpg" alt="추가검사 패키지">
			<!-- <div class="exam_pbox">
				<p>
					주요혈액 맞춤검사<br>
					<strong>70,000</strong>원
				</p>
				<ul>
					<li>이상지질혈증(고지혈증)</li>
					<li>혈당</li>
					<li>간염 (A형,B형,C형)</li>
					<li>갑상선기능</li>
					<li>췌장기능 검사</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					혈액 암표지자 검사<br>
					<strong>70,000</strong>원
				</p>
				<ul>
					<li>대장암</li>
					<li>간암</li>
					<li>담낭 및 췌장암</li>
					<li>난소암</li>
					<li>전립선암</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					심혈관 정밀검사<br>
					<strong>150,000</strong>원
				</p>
				<ul>
					<li>관상동맥 석회화 CT</li>
					<li>경동맥 초음파</li>
					<li>심전도</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					여성 정밀검사<br>
					<strong>250,000</strong>원
				</p>
				<ul>
					<li>유방초음파</li>
					<li>갑상선초음파</li>
					<li>골반초음파</li>
				</ul>
			</div>
			<div class="exam_pbox">
				<p>
					남성 정밀검사<br>
					<strong>250,000</strong>원
				</p>
				<ul>
					<li>복부초음파</li>
					<li>경동맥초음파</li>
					<li>저선량 흉부 CT</li>
				</ul>
			</div> -->
		</div>
	</div>