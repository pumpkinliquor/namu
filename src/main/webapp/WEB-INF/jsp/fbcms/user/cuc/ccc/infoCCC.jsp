<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		var tabs = $('.tab_list03 li').length;
		$('.tab_list03 li').css('width', 1200 / tabs);

		$('.tab_list03 li').click(function(event) {
			var i = $(this).index();
			$('.tab_list03 li').removeClass('selected');
			$(this).addClass('selected');
			$('.tab_list03 li a').attr('title','');
			$(this).children('a').attr('title','선택된 탭');
			$(".tab_box03").hide();
			$('.tab_box03').eq(i).show();
		});
		//1210
		var tabSelected = '${param.tab}';
		if(tabSelected == '02') {
			$('.tab_list li:eq(1)').click();
		} else {
			$('.tab_list li:eq(0)').click();
		}
	});
</script>

<!-- contents s -->
<div class="contents w1200">

	<ul class="tab_list"><!-- tab -->
		<li class="selected">
			<a href="javascript:void(0);" title="선택된 탭">센터소개</a></li>
		<li>
			<a href="javascript:void(0);">검진프로그램</a></li>
	</ul>

	<div class="tab_box"><!-- box01 -->
		<h4 class="con_in_tit12">나무병원 종합검진센터</h4>
		<img src="/images/fbcms/user/img_exam02_01.png" alt="">

		<div class="exam02_01">
			<div>
				<h4 class="con_in_tit12">우수검진센터 인증</h4>
				<p class="con_in_txt02">비에비스 나무병원은 대한종합건강관리학회에서 실시한 우수기관 인증에서 아래의 기준에 부합하여 <br>
				우수검진센터로 인증받았습니다</p>
				<ul class="dot_list02">
					<li>자동화 건진 의료장비와 전산시스템 보유</li>
					<li>교수역임 전문의 직접 검사</li>
					<li>건진 시설의 독립성</li>
					<li>적절한 검사시간 보장</li>
					<li>대한종합건강관리학회 인증 심사위원회의 추천</li>
				</ul>
			</div>
			<img src="/images/fbcms/user/img_exam02_02.png" alt=" 대한종합건강관리학회 우수검진기관 비에비스나무병원 인증기간 2019년 1월 부터 2022년 1월 까지">
		</div>

		<h4 class="con_in_tit12">기업검진</h4>
		<ul class="dot_list02">
			<li>귀사의 건강검진 예산에 따라 다양한 맞춤형 상품을 구성해드립니다</li>
			<li>의료기사가 아닌 풍부한 경험을 쌓은 대학교수 역임 전문의가 직접 건강검진을 진행합니다</li>
			<li>용종 등의 이상 병변 발견 시 즉시 제거 가능하며 질환의 정도에 따라 수술도 시행 가능합니다</li>
			<li>국민건강보험공단 건강검진도 진행합니다</li>
		</ul>

		<h4 class="con_in_tit12">주요 검진 고객사</h4>
		<img src="/images/fbcms/user/img_cus01.png" alt="" style="width:100%">
		<img src="/images/fbcms/user/img_cus02.png" alt="" style="width:100%">
	</div>

	<div class="tab_box"><!-- box02 -->
		<ul class="tab_list03"><!-- 내부 탭 -->
			<li class="selected">
				<a href="javascript:void(0);" title="선택된 탭">기본 건강검진</a>
			</li>
			<li>
				<a href="javascript:void(0);">블레스 건강검진</a>
			</li>
			<li>
				<a href="javascript:void(0);">스페셜 건강검진</a>
			</li>
			<%-- <li>
				<a href="javascript:void(0);">특화 건강검진</a>
			</li>--%> 
			<li>
				<a href="javascript:void(0);">추가 검진항목</a>
			</li>
		</ul>

		<div class="tab_box03"><!-- 기본 건강검진 프로그램 -->
			<h4 class="con_in_tit11">기본 건강검진 프로그램</h4>
			<p class="con_in_txt02">수검자의 연령별, 성별 특징에 따라 시행하는 개인 맞춤형 검진 프로그램입니다<br>
			전문의들이 최신의료장비로 정확한 검사를 진행합니다</p>
			<table class="tbox tdetail04">
				<caption>건강검진 프로그램 표</caption>
				<col style="width:145px;">
				<col style="width:460px;">
				<col style="width:460px;">
				<col/>
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">기본검진항목</th>
						<th scope="col">추가항목</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">Namuh<br>기초검진</th>
						<td class="t_left">문진, 신체계측(인바디, 청력, 시력, 안압, 안저, 혈압), 일반혈액검사
						(빈혈, 백혈구, 혈소판), 생화학검사(혈당, 고지혈, 간기능, 갑상선 
						기능), 신장기능검사, 췌장질환검사, 전해질검사(나트륨, 칼륨, 염소, 
						인, 칼슘), 간염검사(A,B,C형 간염), 암표지자검사(간암, 대장암, 
						췌장암, 난소암, 전립선암), 성병검사, 비타민 D검사, 관절염검사, 
						소변검사, 대변검사, 심전도검사, 폐기능검사</td>
						<td class="t_left"></td>
						<td>남: 25만원<br>여: 25만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>베이직</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>복부초음파 + 일반 위내시경 + 여성검사<br>
								(유방암진단 X선 촬영(Mammography), 자궁경부암 검사<br>(Pap smear))</li>
							</ul>
						</td>
						<td>남: 40만원<br>여: 45만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>실버</th>
						<td class="t_left">NAMUH 베이직</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>수면대장내시경 + 골밀도 + 갑상선초음파</li>
								<li>유방초음파, 골반초음파</li>
								<li>선택항목(남: 택2 / 여: 택1) - 흉부CT, 뇌CT, 관상동맥 석회화CT</li>
							</ul>
						</td>
						<td>남: 80만원<br>여: 90만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>골드</th>
						<td class="t_left">NAMUH 실버</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>복부골반 CT, 흉부CT</li>
								<li>선택항목(택1): 1) 뇌혈관 CT + 관상동맥석회화CT<br>
									<i style="margin-left:91px">2) 관상동맥혈관CT + 뇌CT</i>
								</li>
								<li>심장초음파, 경동맥초음파, 유방초음파, 골반초음파</li>
								<li>호르몬검사 + 심혈관혈액검사 + 알러지검사 + 철분검사</li>
								<li>영양상담</li>
								<li>여성검사 (질분비검사 + 인유두종바이러스검사)</li>
							</ul>
						</td>
						<td>남: 140만원<br>여: 160만원</td>
					</tr>
				</tbody>
			</table>
			<p class="t_center con_in_tit01 mt60">검진프로그램을 예약하시겠습니까?</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn breservation">검진예약</a>
			</div>
		</div>

		<div class="tab_box03"><!-- 블레스 건강검진 -->
			<h4 class="con_in_tit11">블레스 건강검진 프로그램</h4>
			<p class="con_in_txt02">VIP 전용병실 및 전담간호사, PET CT, 영양수액 등을 특징으로 하는<br>
			최고급 정밀검진 프로그램입니다</p>
			<table class="tbox tdetail04">
				<caption>블레스 건강검진 프로그램 표</caption>
				<col style="width:145px;">
				<col style="width:460px;">
				<col style="width:460px;">
				<col/>
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">기본검진항목</th>
						<th scope="col">추가항목</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">Namuh<br>블레스</th>
						<td class="t_left">NAMUH 골드</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>전용병실, 전담간호사 및 영양수액</li>
								<li>설사약 먹지 않는 당일 위&middot;대장내시경</li>
								<li>내장지방CT</li>
								<li>척추엑스레이 검사(요추,경추)</li>
							</ul>
						</td>
						<td>남: 200만원<br>여: 220만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>블레스 PET CT</th>
						<td class="t_left">NAMUH 블레스</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>PET CT <i class="c_red">*영양수액, CT검사 항목 모두 제외</i>
									<p class="desc02">(PET CT: 암의 조기 발견, 전이여부 및 정확한 위치 판별이 가능한 검사)</p></li>
							</ul>
						</td>
						<td>남: 220만원<br>여: 240만원</td>
					</tr>
					<!-- <tr>
						<th scope="row">Namuh<br>블레스 프리미엄</th>
						<td class="t_left">NAMUH 블레스</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>PET CT, 설사약 먹지 않는 당일 위&middot;대장내시경</li>
								<li>1박 전용병실(특실) + 전담간호사</li>
							</ul>
						</td>
						<td>남: 350만원<br>여: 370만원</td>1102 수정
					</tr> -->
				</tbody>
			</table>
			<p class="date_desc02"><!-- * 특실을 사용하는 ‘블레스 프리미엄’ 프로그램의 경우, 특실 예약 상황에 따라 고객님께서 희망하시는 일정으로 검진 진행이 불가할 수 있으니 미리 예약상담을 하시기 바랍니다(문의 1577-7502) --></p>
			<p class="t_center con_in_tit01 mt60">검진프로그램을 예약하시겠습니까?</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn breservation">검진예약</a>
			</div>
		</div>
		
		<div class="tab_box03"><!-- 스페셜 건강검진 -->
			<h4 class="con_in_tit11">스페셜 건강검진 프로그램</h4>
			<p class="con_in_txt02">NAMUH 기초검진을 기반으로<br>
				특별히 관심있는 부위에 정밀 검사를 더한 검진프로그램입니다</p>
			<table class="tbox tdetail04">
				<caption>스페셜 건강검진 프로그램 표</caption>
				<col style="width:145px;">
				<col style="width:460px;">
				<col style="width:460px;">
				<col/>
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">기본검진항목</th>
						<th scope="col">추가항목</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">Namuh<br>여성 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>여성검사(유방암진단 X선 촬영(Mammography), <br>자궁경부암검사(Pap smear)), 골밀도검사, 철분검사,<br> 여성호르몬검사, 비타민D검사, 갑상선초음파, 유방초음파,<br> 골반초음파, 내장지방 CT</li>
							</ul>
						</td>
						<td>여: 80만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>남성 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>간초음파, 갑상선초음파, 경동맥초음파, 심장초음파, <br>
								심혈관 혈액검사, 남성호르몬, 심박변이도, <br>
								저선량 흉부 CT, 관상동맥 석회화 CT</li>
							</ul>
						</td>
						<td>남: 80만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>소화기 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>복부초음파, 복부/골반CT, 수면 위/대장내시경</li>
							</ul>
						</td>
						<td>남: 70만원<br>여: 70만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>뇌건강 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>경동맥초음파, 뇌혈관 CT, 심혈관혈액검사, 치매관련유전자검사</li>
							</ul>
						</td>
						<td>남: 60만원<br>여: 60만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>심혈관 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>관상동맥혈관 CT, 심장초음파, 심박변이도검사, 심혈관혈액검사</li>
							</ul>
						</td>
						<td>남: 60만원<br>여: 60만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>PET CT 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>PET CT</li>
							</ul>
						</td>
						<td>남: 100만원<br>여: 100만원</td>
					</tr>
				</tbody>
			</table>
			<p class="t_center con_in_tit01 mt60">검진프로그램을 예약하시겠습니까?</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn breservation">검진예약</a>
			</div>
		</div>
		
		<%-- <div class="tab_box03"><!-- 특화 건강검진 -->
			<h4 class="con_in_tit11">특화 건강검진 프로그램</h4>
			<p class="con_in_txt02">설사약 먹지않는 대장내시경 및 PET-CT, 항노화 시술 등<br>
			특별한 프로그램을 포함한 건강검진입니다</p>
			<table class="tbox tdetail04">
				<caption>특화 건강검진 프로그램 표</caption>
				<col style="width:145px;">
				<col style="width:460px;">
				<col style="width:460px;">
				<col/>
				<thead>
					<tr>
						<th scope="col">상품</th>
						<th scope="col">기본검진항목</th>
						<th scope="col">추가항목</th>
						<th scope="col">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">Namuh<br>편안한 내시경<br>전신암 스페셜</th>
						<td class="t_left">NAMUH 기초검진</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>PET CT</li>
								<li>설사약 먹지 않는 당일 위·대장내시경</li>
								<li>여성검사(유방암진단 X선 촬영 (Mammography), 자궁경부암 검사 (Pap smear))</li>
							</ul>
						</td>
						<td>남: 200만원<br>여: 210만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>실버 안팎<br>스페셜 검진</th>
						<td class="t_left">NAMUH 실버</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>피부비만 항노화 프로그램 추가
									<ul class="hy_list">
										<li>피부관리 : 비너스프리즈 1회, 스페셜물광 주사 1회, 아피니트 1회</li>
										<li>비만 : 미쿨 냉각 지방분해패드 1회, HPL주사 + 저준위레이저 1회</li>
										<li>항노화 검사 및 치료 : 항산화주사 (루치온 + 멀티블루 + <br>아미노산주사), 소변유기산검사 등</li>
									</ul>
								</li>
							</ul>
						</td>
						<td>남: 220만원<br>여: 230만원</td>
					</tr>
					<tr>
						<th scope="row">Namuh<br>블레스 안팎<br>스페셜 검진</th>
						<td class="t_left">NAMUH 블레스</td>
						<td class="t_left">
							<ul class="dot_list02">
								<li>피부비만 항노화 프로그램 추가
									<ul class="hy_list">
										<li>피부관리 : 비너스프리즈 1회, 스페셜물광 주사 1회, 아피니트 1회</li>
										<li>비만 : 미쿨 냉각 지방분해패드 1회, HPL주사 + 저준위레이저 1회</li>
										<li>항노화 검사 및 치료 : 항산화주사 (루치온 + 멀티블루 + <br>아미노산주사), 소변유기산검사 등</li>
									</ul>
								</li>
							</ul>
						</td>
						<td>남: 350만원<br>여: 370만원</td>
					</tr>
				</tbody>
			</table>
			<p class="t_center con_in_tit01 mt60">검진프로그램을 예약하시겠습니까?</p>
			<div class="btn_Lbox"><!-- btn box -->
				<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn breservation">검진예약</a>
			</div>
		</div> --%>

		<div class="tab_box03"><!-- 추가 검진항목 -->
			<h4 class="con_in_tit11">추가 검진항목</h4>
			<p class="con_in_txt02">건강검진 프로그램에 원하는 항목만 추가로 선택하여 함께 검사받을 수 있습니다</p>
			<table class="tbox tdetail04">
				<caption>추가 검진항목 표</caption>
				<col style="width:145px;">
				<col style="width:300px;">
				<col/>
				<thead>
					<tr>
						<th scope="col">항목</th>
						<th scope="col" colspan="2">내역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" rowspan="3">내시경(일반)</th>
						<th class="t_left bggray">위내시경</th>
						<td class="t_left">위암, 위궤양의 조기 진단</td>
					</tr>
					<tr>
						<th class="t_left bggray">경비내시경</th>
						<td class="t_left">위암, 위궤양의 조기 진단</td>
					</tr>
					<tr>
						<th class="t_left bggray">대장내시경</th>
						<td class="t_left">대장암, 궤양, 염증의 조기 진단</td>
					</tr>
					<tr>
						<th scope="row" rowspan="8">컴퓨터단층촬영<br>
						128 MDCT</th>
						<th class="t_left bggray">관상동맥 CT</th>
						<td class="t_left">관상동맥의 상태를 확인, 심근경색증이나 협심증 위험성 체크</td>
					</tr>
					<tr>
						<th class="t_left bggray">관상동맥 CT (CECT)</th>
						<td class="t_left">조영제 투입, 혈관 3차원 분석</td>
					</tr>
					<tr>
						<th class="t_left bggray">복부/골반CT</th>
						<td class="t_left">간,담낭,신장,비장,췌장의 구조적변화/ 자궁근종,난소종양,전립선 비대증 등</td>
					</tr>
					<tr>
						<th class="t_left bggray">흉부 CT</th>
						<td class="t_left">초기폐암,결핵,폐심장질환의 구조적변화</td>
					</tr>
					<tr>
						<th class="t_left bggray">흉부 CT (CECT)</th>
						<td class="t_left">조영제 투입, 종양의 감별</td>
					</tr>
					<tr>
						<th class="t_left bggray">뇌 CT</th>
						<td class="t_left">뇌종양 유무 등 뇌병변 조기발견</td>
					</tr>
					<tr>
						<th class="t_left bggray">뇌 CT (CECT)</th>
						<td class="t_left">조영제 투입, 종양의 감별</td>
					</tr>
					<tr>
						<th class="t_left bggray">뇌 CT (Angio)</th>
						<td class="t_left">조영제 투입, 혈관 3차원 분석(뇌동맥류)</td>
					</tr>
					<tr>
						<th scope="row" rowspan="6">초음파</th>
						<th class="t_left bggray">복부</th>
						<td class="t_left">간,담낭,신장,비장,췌장 검사</td>
					</tr>
					<tr>
						<th class="t_left bggray">심장</th>
						<td class="t_left">심근경색, 협심증, 위험성 체크</td>
					</tr>
					<tr>
						<th class="t_left bggray">유방</th>
						<td class="t_left">유방종양, 석회화 등</td>
					</tr>
					<tr>
						<th class="t_left bggray">자궁/골반</th>
						<td class="t_left">자궁, 난소의 종양, 자궁내막증 등</td>
					</tr>
					<tr>
						<th class="t_left bggray">경동맥</th>
						<td class="t_left">경동맥내 혈액의 흐름과 혈관의 상태를 평가</td>
					</tr>
					<tr>
						<th class="t_left bggray">갑상선</th>
						<td class="t_left">갑상선 종양, 갑상선 비대증 등</td>
					</tr>
					<tr>
						<th scope="row">알러지 검사</th>
						<th class="t_left bggray">알러지검사 (호흡기· 식품) 93종</th>
						<td class="t_left">집먼지, 진드기, 곰팡이 등 호흡기 알러지 유발물질 및 콩, 우유, 치즈, 밀가루 등 식품 알러지 유발물질 93종 검사</td>
					</tr>
					<tr>
						<th scope="row" rowspan="9">기타</th>
						<th class="t_left bggray">심전도검사</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">골밀도(BMD-LS&HIP)</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">유방촬영(유방4매 촬영)</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">요추촬영</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">경추촬영</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">액상자궁세포진검사</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">인유두종 바이러스검사(HPV)</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">종양표지자검사 4종</th>
						<td class="t_left">-</td>
					</tr>
					<tr>
						<th class="t_left bggray">풍진항체검사</th>
						<td class="t_left">-</td>
					</tr>
				</tbody>
			</table>
		</div>