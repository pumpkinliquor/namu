<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		$('.disease_box li').click(function(event) {
			 var i = $(this).index();
			$('.disease_box li').removeClass('active');
			$(this).addClass('active');
			$('.disease_box li a').attr('title','');
			$(this).children('a').attr('title','선택된 탭');
			$(".tab_box03").hide();
			$('.tab_box03').eq(i).show();
		});
		
		//1210
		var tabSelected = '${param.tab}';
		if(tabSelected == '02') {
			$('.tab_list02 li:eq(1)').click();
		} else {
			$('.tab_list02 li:eq(0)').click();
		}
	});
</script>

<!-- contents s -->
<div class="contents">
	<ul class="tab_list02"><!-- tab -->
		<li class="selected">
			<a href="#n" title="선택된 탭">센터소개</a></li>
		<li>
			<a href="#n">검진프로그램</a></li>
	</ul>

	<div class="tab_box"><!-- box01 -->
		<h4 class="con_in_tit04">나무병원 종합검진센터</h4>
		<img src="/images/fbcms/mobile/img_exam02_01.png" alt="">

		<div class="exam02_01">
			<h4 class="con_in_tit04">우수검진센터 인증</h4>
			<p class="con_in_txt02">비에비스 나무병원은 대한종합건강관리학회에서 실시한 우수기관 인증에서 아래의 기준에 부합하여 우수검진센터로 인증받았습니다</p>
			<div>
				<img src="/images/fbcms/mobile/img_exam02_02.png" alt=" 대한종합건강관리학회 우수검진기관 비에비스나무병원 인증기간 2019년 1월 부터 2022년 1월 까지">
				<ul class="dot_list03">
					<li>자동화 건진 의료장비와 전산시스템 보유</li>
					<li>교수역임 전문의 직접 검사</li>
					<li>건진 시설의 독립성</li>
					<li>적절한 검사시간 보장</li>
					<li>대한종합건강관리학회 인증 심사위원회의 추천</li>
				</ul>
			</div>
		</div>

		<h4 class="con_in_tit04">기업검진</h4>
		<ul class="dot_list03 mar0">
			<li>귀사의 건강검진 예산에 따라 다양한 맞춤형 상품을 구성해드립니다</li>
			<li>의료기사가 아닌 풍부한 경험을 쌓은 대학교수 역임 전문의가 직접 건강검진을 진행합니다</li>
			<li>용종 등의 이상 병변 발견 시 즉시 제거 가능하며 질환의 정도에 따라 수술도 시행 가능합니다</li>
			<li>국민건강보험공단 건강검진도 진행합니다</li>
		</ul>

		<h4 class="con_in_tit04">주요 검진 고객사</h4>
		<img src="/images/fbcms/mobile/img_cus01.png" alt="" style="width:100%">
		<img src="/images/fbcms/mobile/img_cus02.png" alt="" style="width:100%">
		<img src="/images/fbcms/mobile/img_cus03.png" alt="" style="width:100%">
	</div>
	
	<div class="tab_box pd0"><!-- box02 -->
		<ul class="disease_box mar20"><!-- 내부 탭 -->
			<li class="active">
				<a href="#n" title="선택된 탭">기본 건강검진</a>
			</li>
			<li>
				<a href="#n">블레스 건강검진</a>
			</li>
			<li>
				<a href="#n">스페셜 건강검진</a>
			</li>
			<%-- <li class="bott">
				<a href="#n">특화 건강검진</a>
			</li> --%>
			<li class="bott right">
				<a href="#n">추가 검진항목</a>
			</li>
		</ul>

		<div class="tab_box03"><!-- 기본 건강검진 프로그램 -->
			<h4 class="con_in_tit04 mar20">기본 건강검진 프로그램</h4>
			<p class="con_in_txt02 mar20">수검자의 연령별, 성별 특징에 따라 시행하는 개인 맞춤형 검진 프로그램입니다<br>
			전문의들이 최신의료장비로 정확한 검사를 진행합니다</p>

			<div class="greetbox mt40">
				<h5 class="con_in_tit05 mar20 mt0">Namuh 기초검진</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row" rowspan="2">기본<br>검진항목</th>
								<td class="t_left">문진, 신체계측<span class="c_point">(*1)</span>, 일반혈액검사<span class="c_point">(*2)</span>,<br>
									생화학검사<span class="c_point">(*3)</span>, 신장기능검사, 췌장질환검사<br>
									전해질검사<span class="c_point">(*4)</span>, 간염검사(A,B,C형)<br>
									암표지자검사<span class="c_point">(*5)</span>, 성병검사, 비타민D검사
									관절염검사, 소변검사, 대변검사, 심전도검사, 폐기능검사</td>
							</tr>
							<tr>
								<td class="t_left"><span class="c_point">*1</span> : 인바디, 청력, 시력, 안압, 안저, 혈압<br>
									<span class="c_point">*2</span> : 빈혈, 백혈구, 혈소판<br>
									<span class="c_point">*3</span> : 혈당, 고지혈, 간기능, 갑상선 기능<br>
									<span class="c_point">*4</span> : 나트륨, 칼륨, 염소, 인, 칼슘<br>
									<span class="c_point">*5</span> :간암, 대장암, 췌장암, 난소암, 전립선암
								</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">-</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 25만원 / 여: 25만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 베이직</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">Namuh 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">복부초음파 + 일반위내시경 + 여성검사(유방암진단 X선촬영(Mammography), 자궁경부암 검사(Pap smear)</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 40만원 / 여: 45만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 실버</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">Namuh 베이직</td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">추가항목</th>
								<td class="t_left">수면대장내시경 + 골밀도 + 갑상선초음파</td>
							</tr>
							<tr>
								<td class="t_left">유방초음파 + 골반초음파</td>
							</tr>
							<tr>
								<td class="t_left"><span class="c_gray3">선택항목(남:택2, 여:택1)</span><br>
									흉부 CT, 뇌 CT, 관상동맥 석회화 CT</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 80만원 / 여: 90만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 골드</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">Namuh 실버</td>
							</tr>
							<tr>
								<th scope="row" rowspan="5">추가항목</th>
								<td class="t_left">복부골반 CT, 흉부 CT</td>
							</tr>
							<tr>
								<td class="t_left"><span class="c_gray3">선택항목(남:택2, 여:택1)</span>
									<ul class="dot_list03 mar0">
										<li>뇌혈관 CT, 관상동맥 석회화 CT</li>
										<li>관상동맥혈관 CT, 뇌 CT</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="t_left">
									심장초음파, 경동맥초음파, 유방초음파, 골반초음파</td>
							</tr>
							<tr>
								<td class="t_left">
									호르몬검사 + 심혈관혈액검사 + 알러지검사 + 철분검사</td>
							</tr>
							<tr>
								<td class="t_left">
									여성검사(질분비물 검사 + 인유두종바이러스 검사)</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 140만원 / 여: 160만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p class="t_center con_in_txt02 mt25 fw_500">검진프로그램을 예약하시겠습니까?</p>
				<div class="btn_Lbox mt10"><!-- btn box -->
					<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn in_full breservation">검진예약</a>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- 블레스 건강검진 프로그램 -->
			<h4 class="con_in_tit04 mar20">블레스 건강검진 프로그램</h4>
			<p class="con_in_txt02 mar20">VIP 전용 병실 및 전담 간호사, PET CT, 영양수액 등을 특징으로 하는 최고급 정밀 검진 프로그램입니다<br>
				전문의들이 최신의료장비로 정확한 검사를 진행합니다</p>

			<div class="greetbox mt40">
				<h5 class="con_in_tit05 mar20 mt0">Namuh 베이직</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 골드</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>전용병실, 전담간호사 및 영양수액</li>
										<li>설사약 먹지 않는 당일 위·대장내시경</li>
										<li>내장지방CT</li>
										<li>척추엑스레이 검사(요추,경추)</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 200만원 / 여: 220만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 블레스 PET CT	</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 블레스</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>PET CT <br><i class="c_point">*영양수액, CT검사 항목 모두 제외</i>
										<p class="desc02">(PET CT: 암의 조기 발견, 전이여부 및 정확한 위치 판별이 가능한 검사)</p></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 220만원 / 여: 240만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<%-- <h5 class="con_in_tit05 mar20 mt40">Namuh 블레스 프리미엄</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 블레스</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>PET CT, 설사약 먹지 않는 당일 위&middot;대장내시경</li>
										<li>1박 전용병실(특실) + 전담간호사</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 350만원 / 여: 370만원</td>
							</tr>
						</tbody>
					</table>
				</div> --%>
				<p class="desc02 mar20 mt10">※  특실을 사용하는 ‘블레스 프리미엄’ 프로그램의 경우, 특실 예약 상황에 따라 고객님께서 희망하시는 일정으로 검진 진행이 불가할 수 있으니 미리 예약상담을 하시기 바랍니다(문의 <a href="tel:1577-7502">1577-7502</a>)</p>
			
				<p class="t_center con_in_txt02 mt25 fw_500">검진프로그램을 예약하시겠습니까?</p>
				<div class="btn_Lbox mt10"><!-- btn box -->
					<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn in_full breservation">검진예약</a>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- 스페셜 건강검진 프로그램 -->
			<h4 class="con_in_tit04 mar20">스페셜 건강검진 프로그램</h4>
			<p class="con_in_txt02 mar20">나무 기초검진을 기반으로, 특별히 관심있는 부위에 정밀 검사를 더한 검진 프로그램입니다<br>
			전문의들이 최신의료장비로 정확한 검사를 진행합니다</p>

			<div class="greetbox mt40">
				<h5 class="con_in_tit05 mar20 mt0">Namuh 여성 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>여성검사(유방암진단 X선 촬영(Mammography), 자궁경부암검사(Pap smear)), 골밀도검사, 철분검사, 여성호르몬검사, 비타민D검사, 갑상선초음파, 유방초음파, 골반초음파, 내장지방 CT</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">여: 80만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 남성 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>간초음파, 갑상선초음파, 경동맥초음파, 심장초음파, 심혈관 혈액검사, 남성호르몬, 심박변이도, 저선량 흉부 CT, 관상동맥 석회화 CT</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 80만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 소화기 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>복부초음파, 복부/골반CT, 수면 위/대장내시경</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 70만원 / 여: 70만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 뇌건강 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>경동맥초음파, 뇌혈관 CT, 심혈관혈액검사, 치매관련유전자검사</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 60만원 / 여: 60만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 심혈관 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>관상동맥혈관 CT, 심장초음파, 심박변이도검사, 심혈관혈액검사</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 60만원 / 여: 60만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh PET CT 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>PET CT</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 100만원 / 여: 100만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p class="t_center con_in_txt02 mt25 fw_500">검진프로그램을 예약하시겠습니까?</p>
				<div class="btn_Lbox mt10"><!-- btn box -->
					<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn in_full breservation">검진예약</a>
				</div>
			</div>
		</div>

		<%-- <div class="tab_box03"><!-- 특화 건강검진 프로그램 -->
			<h4 class="con_in_tit04 mar20">특화 건강검진 프로그램</h4>
			<p class="con_in_txt02 mar20">설사약 먹지않는 대장내시경 및 PET-CT, 항노화 시술 등 특별한 프로그램을 포함한 건강검진입니다</p>

			<div class="greetbox mt40">
				<h5 class="con_in_tit05 mar20 mt0">Namuh 편안한 내시경 전신암 스페셜</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 기초검진</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>PET CT</li>
										<li>설사약 먹지 않는 당일 위·대장내시경</li>
										<li>여성검사(유방암진단 X선 촬영 (Mammography), 자궁경부암 검사 (Pap smear))</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 200만원 / 여: 210만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 실버 안팎 스페셜 검진</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 실버</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>피부비만 항노화 프로그램 추가
											<ul class="hy_list">
												<li>피부관리 : 비너스프리즈 1회, 스페셜물광 주사 1회, 아피니트 1회</li>
												<li>비만 : 미쿨 냉각 지방분해패드 1회, HPL주사 + 저준위레이저 1회</li>
												<li>항노화 검사 및 치료 : 항산화주사 (루치온 + 멀티블루 +
												아미노산주사), 소변유기산검사 등</li>
											</ul>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 220만원 / 여: 230만원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h5 class="con_in_tit05 mar20 mt40">Namuh 소블레스 안팎 스페셜 검진</h5>
				<div class="tdetail tdetail04">
					<table>
						<caption>건강검진 프로그램 표</caption>
						<col style="width:70px;">
						<col/>
						<tbody>
							<tr>
								<th scope="row">기본<br>검진항목</th>
								<td class="t_left">NAMUH 블레스</td>
							</tr>
							<tr>
								<th scope="row">추가항목</th>
								<td class="t_left">
									<ul class="dot_list03">
										<li>피부비만 항노화 프로그램 추가
											<ul class="hy_list">
												<li>피부관리 : 비너스프리즈 1회, 스페셜물광 주사 1회, 아피니트 1회</li>
												<li>비만 : 미쿨 냉각 지방분해패드 1회, HPL주사 + 저준위레이저 1회</li>
												<li>항노화 검사 및 치료 : 항산화주사 (루치온 + 멀티블루 +
												아미노산주사), 소변유기산검사 등</li>
											</ul>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">가격</th>
								<td class="t_left">남: 350만원 / 여: 370만원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="t_center con_in_txt02 mt25 fw_500">검진프로그램을 예약하시겠습니까?</p>
				<div class="btn_Lbox mt10"><!-- btn box -->
					<a href="/user/cts/rsv/userRSVCheckupStepInfo.do" class="btn in_full breservation">검진예약</a>
				</div>
			</div>
		</div> --%>

		<div class="tab_box03"><!-- 추가 검진항목 -->
			<h4 class="con_in_tit04 mar20">추가 검진항목</h4>
			<p class="con_in_txt02 mar20">건강검진 프로그램에 원하는 항목만 추가로 선택하여 함께 검사받을 수 있습니다</p>

			<div class="tdetail tdetail04 mt40">
				<table>
					<caption>건강검진 프로그램 표</caption>
					<col style="width:100px;">
					<col/>
					<thead>
						<tr>
							<th scope="col" colspan="2">내역</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">위내시경</th>
							<td class="t_left">위암, 위궤양의 조기 진단</td>
						</tr>
						<tr>
							<th scope="row">경비내시경</th>
							<td class="t_left">위암, 위궤양의 조기 진단</td>
						</tr>
						<tr>
							<th scope="row">대장내시경</th>
							<td class="t_left">대장암, 궤양, 염증의 조기 진단</td>
						</tr>
						<tr>
							<th scope="row">관상동맥 CT</th>
							<td class="t_left">관상동맥의 상태를 확인, 심근경색증이나 협심증 위험성 체크</td>
						</tr>
						<tr>
							<th scope="row">관상동맥 CT (CECT)</th>
							<td class="t_left">조영제 투입, 혈관 3차원 분석</td>
						</tr>
						<tr>
							<th scope="row">복부/골반CT</th>
							<td class="t_left">간,담낭,신장,비장,췌장의 구조적변화/ 자궁근종,난소종양,전립선 비대증 등</td>
						</tr>
						<tr>
							<th>흉부 CT</th>
							<td class="t_left">초기폐암,결핵,폐심장질환의 구조적변화</td>
						</tr>
						<tr>
							<th scope="row">흉부 CT (CECT)</th>
							<td class="t_left">조영제 투입, 종양의 감별</td>
						</tr>
						<tr>
							<th scope="row">뇌 CT</th>
							<td class="t_left">뇌종양 유무 등 뇌병변 조기발견</td>
						</tr>
						<tr>
							<th scope="row">뇌 CT (CECT)</th>
							<td class="t_left">조영제 투입, 종양의 감별</td>
						</tr>
						<tr>
							<th scope="row">뇌 CT (Angio)</th>
							<td class="t_left">조영제 투입, 혈관 3차원 분석(뇌동맥류)</td>
						</tr>
						<tr>
							<th scope="row">복부</th>
							<td class="t_left">간,담낭,신장,비장,췌장 검사</td>
						</tr>
						<tr>
							<th scope="row">심장</th>
							<td class="t_left">심근경색, 협심증, 위험성 체크</td>
						</tr>
						<tr>
							<th scope="row">유방</th>
							<td class="t_left">유방종양, 석회화 등</td>
						</tr>
						<tr>
							<th scope="row">자궁/골반</th>
							<td class="t_left">자궁, 난소의 종양, 자궁내막증 등</td>
						</tr>
						<tr>
							<th scope="row">경동맥</th>
							<td class="t_left">경동맥내 혈액의 흐름과 혈관의 상태를 평가</td>
						</tr>
						<tr>
							<th scope="row">갑상선</th>
							<td class="t_left">갑상선 종양, 갑상선 비대증 등</td>
						</tr>
						<tr>
							<th scope="row">알러지검사 (호흡기· 식품) 93종</th>
							<td class="t_left">집먼지, 진드기, 곰팡이 등 호흡기 알러지 유발물질 및 콩, 우유, 치즈, 밀가루 등 식품 알러지 유발물질 93종 검사</td>
						</tr>
						<tr>
							<th scope="row">심전도검사</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">골밀도(BMD-LS&HIP)</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">유방촬영(유방4매 촬영)</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">요추촬영</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">경추촬영</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">액상자궁<br>세포진검사</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">인유두종 바이러스검사(HPV)</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">종양표지자검사 4종</th>
							<td class="t_left">-</td>
						</tr>
						<tr>
							<th scope="row">풍진항체검사</th>
							<td class="t_left">-</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!--p class="t_center con_in_txt02 mt25 fw_500">검진프로그램을 예약하시겠습니까?</p>
			<div class="btn_Lbox mt10">
				<a href="#n" class="btn in_full breservation">검진예약</a>
			</div -->
		</div>

	</div>