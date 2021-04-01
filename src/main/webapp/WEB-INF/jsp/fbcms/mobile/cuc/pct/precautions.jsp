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
		$('.exam_listbox li').click(function(event) {
			var exam = $('.exam_listbox li').length;
			var inum = $(this).index() + 1;
			console.log(inum);
	     	$('.layer').after('<div class="dim"/>');
			$('.layer').show();
			$('.layer').attr('tabindex', -1).focus();
			$('.layer').css({
				marginTop: - $('.layer').outerHeight() / 2
			});
	     	$('.exam_pop img').attr('src','/images/fbcms/mobile/exam_pop0' + inum + '.jpg');
		});
		$('.layer_close').click(function(event) {
			$('.dim').remove();
			$('.layer').hide();
			$('.layer').removeAttr('tabindex').blur();
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
			<a href="#n" title="선택된 탭">절차 및 준비</a></li>
		<li>
			<a href="#n">주의사항</a></li>
	</ul>

	<div class="tab_box pd0"><!-- box01 -->
		<h4 class="con_in_tit04 mar20">건강진단 절차</h4>
		<ol class="exam_step_list">
			<li>예약</li>
			<li>접수</li>
			<li>검사진행</li>
			<li>수납 및 검사결과</li>
		</ol>

		<div class="mar20">
			<h5 class="con_in_tit08">1. 예약</h5>
			<p class="con_in_txt"><a href="tel:1577-7502">1577-7502</a><br>
				(상담가능시간  |  평일 07:30~17:30, 토요일 07:30~13:00)<br>
				<a href="http://www.namu.com" target="_blank" class="c_point">www.namu.com</a></p>

			<h5 class="con_in_tit08 mt30">2. 접수</h5>
			<ul class="dot_list03 mar0">
				<li>2층 건강검진센터 접수 창구</li>
				<li>접수 시 검사과정 안내</li>
				<li>접수 후 전문의와 1:1 예진</li>
			</ul>

			<h5 class="con_in_tit08 mt30">3. 검사진행</h5>
			<ul class="dot_list03 mar0">
				<li>기초검사, 채혈 및 채뇨검사</li>
				<li>초음파, CT</li>
				<li>내시경 등</li>
			</ul>

			<h5 class="con_in_tit08 mt30">4. 수납 및 검사결과</h5>
			<ul class="dot_list03 mar0">
				<li>수납</li>
				<li>검사결과: 7~10일 후 예약방문 또는 우편발송</li>
			</ul>
		</div>
		<div class="greetbox mt40">
			<div class="mar20">
				<h4 class="con_in_tit04">건강진단 사전준비</h4>
				<h5 class="con_in_tit08 mt30">1. 채변</h5>
				<p class="con_in_txt">건강진단 하루 전 또는 검진 당일에 채취합니다.<br>
				* 단, 대장내시경 예약고객은 하제 (장검사약)를 복용하기 전에 채취하시기 바랍니다.</p>

				<h5 class="con_in_tit08 mt30">2. 금식</h5>
				<p class="con_in_txt">저녁은 6시경 가볍게 드신 후 금식하며, 물은 자정까지만 드십시오. 대장내시경 검사 고객은 대장내시경용 안내문을 참조하시기 바랍니다.</p>

				<h5 class="con_in_tit08 mt30">3. 위&middot;대장내시경, CT검사, 요소호기 검사 전 주의사항</h5>
				<p class="con_in_txt">복용을 중단해야 할 약물이 있으므로 반드시 검사 전 <a href="/user/cuc/pct/precautions.do?tab=02"><span class="c_point t_unline">주의사항</span></a>을 숙지해주시기 바랍니다.</p>

				<h5 class="con_in_tit08 mt30">4. 대장내시경 예약고객</h5>
				<p class="con_in_txt">대장내시경 예약고객은 대장이 충분히 비워져야 정확한 검사가
				가능하므로, <a href="/user/cuc/pct/precautions.do?tab=02"><span class="c_point t_unline">대장내시경 주의사항</span></a>을 반드시 숙지해주시기 바랍니다</p>

				<h5 class="con_in_tit08 mt30">5. 여성고객</h5>
				<p class="con_in_txt">임산부는 방사선 관련 검사는 받을 수 없습니다.<br>
				가임기 여성은 임신여부를 확인해 주시고, 생리중인 경우 채뇨 및 부인과 검사가 어려우니 생리가 끝나고 5일 이후의 날짜로 예약해 주십시오.<br>
				젤네일(네일 액세서리 포함)을 하신 경우 : 수면내시경시 손가락을 통해 산소포화도를 측정해야 하는데, 젤네일을 하신 경우 산소포화도가 측정되지 않으므로 반드시 젤네일을 지우고 오십시오.</p>

				<h5 class="con_in_tit08 mt30">6. 예약일정 변경고객</h5>
				<p class="con_in_txt">예약일을 변경할 경우 예약일이 일정기간 지연될 수 있습니다.<br>
				변경을 원하시면 검진 7일전까지 ☎<a href="tel:1577-7502">1577-7502</a>로 연락 주시기 바랍니다.</p>
			</div>
		</div>

	</div>
	
	<div class="tab_box pd0"><!-- box02 -->
		<ul class="disease_box mar20"><!-- 내부 탭 -->
			<li class="active">
				<a href="#n" title="선택된 탭">대장내시경</a>
			</li>
			<li>
				<a href="#n">위내시경</a>
			</li>
			<li>
				<a href="#n">복부초음파</a>
			</li>
			<li class="bott">
				<a href="#n">CT 검사</a>
			</li>
			<li class="bott right">
				<a href="#n">요소호기검사</a>
			</li>
		</ul>

		<div class="tab_box03"><!-- 대장내시경 -->
			<div class="mar20">
				<h4 class="con_in_tit04">대장내시경(일반/수면)검사 안내</h4>
				<p class="con_in_txt02">검사 전 준비 및 주의사항을 알려드립니다</p>

				<h5 class="con_in_tit08 mt30">혈압약</h5>
				<p class="con_in_txt">검사당일 오전 5시 소량의 물과 함께 복용<br>
				<span class="desc03">* 검사당일 고혈압 또는 저혈압이 심한 경우 검사를 받지 못할 수 있습니다 </span></p>

				<h5 class="con_in_tit08 mt30">당뇨약</h5>
				<p class="con_in_txt">검사당일 당뇨약 복용 금지(인슐린 주사 포함)</p>

				<h5 class="con_in_tit08 mt30">출혈을 유발할 수 있는 약</h5>
				<p class="con_in_txt">항혈소판제, 항응고제, 혈액순환 개선제 등은 <span class="c_red">반드시 담당의사와 미리 상의하여 중단해 주십시오</span></p>

				<div class="tdetail tdetail04 bortop">
					<table>
						<caption>출혈을 유발할 수 있는 약 리스트</caption>
						<col style="width:26%">
						<col style="width:37%">
						<col>
						<tbody>
							<tr>
								<th scope="row" rowspan="2">항혈소판제</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam01.png" class="exam_sam" alt=""> 아스피린</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam02.png" class="exam_sam" alt=""> 프레탈정</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam03.png" class="exam_sam" alt=""> 아스트릭스</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam04.png" class="exam_sam" alt=""> 플라빅스</td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">항응고제</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam05.png" class="exam_sam" alt=""> 와파린정</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam06.png" class="exam_sam" alt=""> 쿠마딘</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam07.png" class="exam_sam" alt=""> 프라닥사</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam08.png" class="exam_sam" alt=""> 자렐토</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam09.png" class="exam_sam" alt=""> 엘리퀴스</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4 class="con_in_tit04">운전금지</h4>
				<p class="con_in_txt02 c_red">수면내시경 검사 당일 자가운전은 절대 불가합니다</p>

				<h4 class="con_in_tit04">보호자 동행</h4>
				<p class="con_in_txt02">수면내시경 검사 당일에는 낙상 등의 안전사고 예방을 위하여 보호자의 동행이 필요합니다  </p>
			</div>
			<div class="greetbox mt40">
				<div class="mar20">
					<h4 class="con_in_tit04">내시경 검사 전 식사</h4>
					<h5 class="con_in_tit08 mt30">검사 3일 전부터 피해야 할 음식</h5>
					<div class="tdetail tdetail04 bortop">
						<table>
							<caption>검사 3일 전부터 피해야 할 음식 리스트</caption>
							<col style="width:26%">
							<col>
							<tbody>
								<tr>
									<th scope="row">해조류</th>
									<td>김, 미역, 다시마</td>
								</tr>
								<tr>
									<th scope="row">잡곡류</th>
									<td>검은쌀, 현미, 깨</td>
								</tr>
								<tr>
									<th scope="row">씨 있는 과일</th>
									<td>수박, 참외, 포도, 딸기</td>
								</tr>
							</tbody>
						</table>
					</div>

					<h5 class="con_in_tit08 mt30">검사 전날 피해야 할 음식</h5>
					<div class="tdetail tdetail04 bortop">
						<table>
							<caption>검사 전날 피해야 할 음식 리스트</caption>
							<col style="width:26%">
							<col>
							<tbody>
								<tr>
									<th scope="row">음료</th>
									<td>붉은색이나 보라색 음료</td>
								</tr>
							</tbody>
						</table>
					</div>

					<h5 class="con_in_tit08 mt30">검사 전날 식사</h5>
					<div class="tdetail tdetail04 bortop">
						<table>
							<caption>검사 전날 식사 리스트</caption>
							<col style="width:26%">
							<col>
							<tbody>
								<tr>
									<th scope="row">오전 검사</th>
									<td>점심, 저녁(오후6시)흰죽 또는 미음 섭취, 반찬 없이 소금 간장만 곁들여 식사하세요</td>
								</tr>
								<tr>
									<th scope="row">오후 검사</th>
									<td>저녁(오후6시) 흰죽 또는 미음 섭취, 반찬 없이 소금 간장만 곁들여 식사하세요</td>
								</tr>
							</tbody>
						</table>
					</div>							
				</div>

				<div class="greetbox mt40">
					<div class="mar20">
						<h4 class="con_in_tit04">장세정제 복용법</h4>
						<p class="con_in_txt02">해당되는 복용약을 클릭하면 복용법에 대해 상세히 확인할 수 있습니다</p>

						<ul class="exam_listbox"><!-- 1210 s -->
							<li><a href="#n">크리쿨산</a></li>
							<li><a href="#n">쿨프렙산</a></li>
							<li><a href="#n">오라팡정</a></li>
							<li><a href="#n">플렌뷰산</a></li>
							<li><a href="#n">크린뷰올산</a></li>
						</ul><!-- //1210 e -->
					</div>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- 위내시경 -->
			<div class="mar20">
				<h4 class="con_in_tit04">위 검사 안내(일반/수면)검사 안내</h4>
				<p class="con_in_txt02">검사 전 준비 및 주의사항을 알려드립니다</p>

				<h5 class="con_in_tit08 mt30">혈압약</h5>
				<p class="con_in_txt">검사당일 오전 5시 소량의 물과 함께 복용<br>
				<span class="desc03">* 검사당일 고혈압 또는 저혈압이 심한 경우 검사를 받지 못할 수 있습니다 </span></p>

				<h5 class="con_in_tit08 mt30">당뇨약</h5>
				<p class="con_in_txt">검사당일 당뇨약 복용 금지(인슐린 주사 포함)</p>

				<h5 class="con_in_tit08 mt30">출혈을 유발할 수 있는 약</h5>
				<p class="con_in_txt">항혈소판제, 항응고제, 혈액순환 개선제 등은 <span class="c_red">반드시 담당의사와 미리 상의하여 중단해 주십시오</span></p>

				<div class="tdetail tdetail04 bortop">
					<table>
						<caption>출혈을 유발할 수 있는 약 리스트</caption>
						<col style="width:26%">
						<col style="width:37%">
						<col>
						<tbody>
							<tr>
								<th scope="row" rowspan="2">항혈소판제</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam01.png" class="exam_sam" alt=""> 아스피린</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam02.png" class="exam_sam" alt=""> 프레탈정</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam03.png" class="exam_sam" alt=""> 아스트릭스</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam04.png" class="exam_sam" alt=""> 플라빅스</td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">항응고제</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam05.png" class="exam_sam" alt=""> 와파린정</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam06.png" class="exam_sam" alt=""> 쿠마딘</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam07.png" class="exam_sam" alt=""> 프라닥사</td>
								<td><img src="/images/fbcms/mobile/img_exam_sam08.png" class="exam_sam" alt=""> 자렐토</td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam09.png" class="exam_sam" alt=""> 엘리퀴스</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4 class="con_in_tit04">운전금지</h4>
				<p class="con_in_txt02 c_red">수면내시경 검사 당일 자가운전은 절대 불가합니다</p>

				<h4 class="con_in_tit04">보호자 동행</h4>
				<p class="con_in_txt02">수면내시경 검사 당일에는 낙상 등의 안전사고 예방을 위하여 보호자의 동행이 필요합니다</p>
			</div>
			<div class="greetbox mt40">
				<div class="mar20">
					<h4 class="con_in_tit04">내시경 검사 전 식사</h4>
					<h5 class="con_in_tit08 mt30">* 위 수술을 받지 않은 경우</h5>
					<div class="tdetail tdetail04 bortop">
						<table>
							<caption>* 위 수술을 받지 않은 경우</caption>
							<col style="width:26%">
							<col>
							<tbody>
								<tr>
									<th scope="row">저녁 오후 6시경</th>
									<td>죽 등의 가벼운 식사</td>
								</tr>
								<tr>
									<th scope="row">오후 6시 ~ 12시</th>
									<td>물 섭취만 가능</td>
								</tr>
								<tr>
									<th scope="row">자정 이후 </th>
									<td>금식(물, 음료수, 껌, 담배 등 포함)</td>
								</tr>
							</tbody>
						</table>
					</div>

					<h5 class="con_in_tit08 mt30">* 위 수술을 받은 경우</h5>
					<div class="tdetail tdetail04 bortop">
						<table>
							<caption>* 위 수술을 받은 경우</caption>
							<col style="width:26%">
							<col>
							<tbody>
								<tr>
									<th scope="row">점심식사</th>
									<td>죽 또는 미음</td>
								</tr>
								<tr>
									<th scope="row">저녁식사</th>
									<td>금식(자정까지 물 섭취만가능)</td>
								</tr>
								<tr>
									<th scope="row">자정 이후</th>
									<td>금식(물, 음료수, 껌, 담배 등 포함)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- 복부초음파 -->
			<div class="mar20">
				<h4 class="con_in_tit04">복부초음파 검사 안내</h4>
				<p class="con_in_txt02">검사 전 준비 및 주의사항을 알려드립니다</p>
				<div class="exam04_02">
					<div>
						<img src="/images/fbcms/mobile/img_exam04_04.png" alt="">
						<div>
							<h5>검사 전 8시간 이상 금식</h5>
							<p>(물, 음료수, 껌, 담배 등 포함)</p>
						</div>
					</div>
					<div>
						<img src="/images/fbcms/mobile/img_exam04_05.png" alt="">
						<div>
							<h5>고혈압 약을 복용하는 분</h5>
							<p>검사 당일 아침 소량의 생수와 함께 약 복용</p>
						</div>
					</div>
					<div>
						<img src="/images/fbcms/mobile/img_exam04_06.png" alt="">
						<div>
							<h5>검사당일 내시경 및 CT(조영제 사용) 검사가 있는 경우</h5>
							<p>복부초음파를 먼저 시행 후 내시경 및 CT검사 시행</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- CT 검사 -->
			<div class="mar20">
				<h4 class="con_in_tit04">CT (컴퓨터 단층 촬영 – 조영제 사용) 검사 안내</h4>
				<p class="con_in_txt02">검사 전 준비 및 주의사항을 알려드립니다</p>
				<div class="exam04_02">
					<div>
						<img src="/images/fbcms/mobile/img_exam04_04.png" alt="">
						<div>
							<h5>검사 전 8시간 이상 금식</h5>
							<p>(물, 음료수, 껌, 담배 등 포함)</p>
						</div>
					</div>
					<div>
						<img src="/images/fbcms/mobile/img_exam04_07.png" alt="">
						<div>
							<h5>과거 조영제 부작용을 경험하신 분</h5>
							<p>검사 전 담당의사와 반드시 상의하고 검사실 직원에게도 알려주세요</p>
						</div>
					</div>
					<div>
						<img src="/images/fbcms/mobile/img_exam04_08.png" alt="">
						<div>
							<h5>임산부, 임신 가능성이 있는 분, 수유중인 분</h5>
							<p>검사 전 담당의사와 반드시 상의하고 검사실 직원에게도 알려주세요</p>
						</div>
					</div>
				</div>

				<h5 class="con_in_tit08 mt30">메포민계 당뇨약</h5>
				<p class="con_in_txt">검사 당일은 물론 검사 후 48시간 동안 약 복용을 중단하셔야 합니다</p>

				<div class="tdetail tdetail04 bortop">
					<table>
						<caption>메포민계 당뇨약 리스트</caption>
						<col style="width:26%">
						<col style="width:37%">
						<col>
						<tbody>
							<tr>
								<th scope="row" rowspan="9">메포민계<br>당뇨약</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam0101.png" class="exam_sam" alt=""> <span>다이아벡스<br>(500mg)</span></td>
								<td><img src="/images/fbcms/mobile/img_exam_sam0202.png" class="exam_sam" alt=""> <span>다이아벡스<br>(1000mg)</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam0303.png" class="exam_sam" alt=""> <span>다이아벡스 엑스알(500mg)</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam0404.png" class="exam_sam" alt=""> <span>다이아벡스 엑스알(1000mg)</span></td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam0505.png" class="exam_sam" alt=""> <span>글루파정<br>(1000mg)</span></td>
								<td><img src="/images/fbcms/mobile/img_exam_sam0606.png" class="exam_sam" alt=""> <span>글루파정<br>(850mg)</span></td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam0707.png" class="exam_sam" alt=""> <span>글루파정<br>(500mg)</span></td>
								<td><img src="/images/fbcms/mobile/img_exam_sam0808.png" class="exam_sam" alt=""> <span>글루파정<br>(250mg)</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam0909.png" class="exam_sam" alt=""> <span>글루파콤비정(80/500mg)</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam1010.png" class="exam_sam" alt=""> <span>가브스메트정(50/1000mg)황색</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam1111.png" class="exam_sam" alt=""> <span>가브스메트정(50/850mg)황색</span></td>
							</tr>
							<tr>
								<td colspan="2"><img src="/images/fbcms/mobile/img_exam_sam1212.png" class="exam_sam" alt=""> <span>가브스메트정(50/500mg)황색</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="tab_box03"><!-- 요소호기검사 -->
			<div class="mar20">
				<h4 class="con_in_tit04">요소호기검사 안내</h4>
				<p class="con_in_txt02">검사 전 준비 및 주의사항을 알려드립니다</p>
				<div class="exam04_02">
					<div>
						<img src="/images/fbcms/mobile/img_exam04_04.png" alt="">
						<div>
							<h5>오전 검사 시</h5>
							<p>자정부터 금식</p>
							<h5 class="mt10">오후 검사 시</h5>
							<p>검사 당일 오전8시 이후 금식(물, 음료수,껌, 담배 등포함)</p>
						</div>
					</div>
					<div>
						<img src="/images/fbcms/mobile/img_exam04_08.png" alt="">
						<div>
							<h5>임산부, 임신 가능성이 있는 분</h5>
							<p>검사 금지</p>
						</div>
					</div>
				</div>

				<h5 class="con_in_tit08 mt30">제균치료제를 복용한 경우</h5>
				<p class="con_in_txt">복용을 중지하고 4주가 지난 후 검사 가능</p>
				<p class="con_in_txt">제균치료제가 아닌 항생제만 복용시, 복용중지 후 7일이 지난 후 검사 가능</p>

				<div class="tdetail tdetail04 bortop">
					<table>
						<caption>위궤양 치료제와 항생제 및 제균치료제 약 리스트</caption>
						<col style="width:26%">
						<col>
						<tbody>
							<tr>
								<th scope="row" rowspan="2">제균치료를 위해<br>복용하는 약들</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam1313.png" class="exam_sam" alt=""> <span>오메 플라졸</span></td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam1414.png" class="exam_sam" alt=""> <span>란소 플라졸</span></td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">제균치료를 위해<br>복용하는 약들</th>
								<td><img src="/images/fbcms/mobile/img_exam_sam1515.png" class="exam_sam" alt=""> <span>아목시실린</span></td>
							</tr>
							<tr>
								<td><img src="/images/fbcms/mobile/img_exam_sam1616.png" class="exam_sam" alt=""> <span>테트라사이클린</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

			
	</div>
	
	<!-- 장세정제 복용법 팝업 1210 s -->
	<div class="layer exam_pop">
		<div>
			<img src="/images/fbcms/mobile/exam_pop01.jpg" alt="">
		</div>
		<a href="#none" class="layer_close">닫기</a>
	</div>
	<!-- //장세정제 복용법 팝업 1210 e -->