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
		$('.exam_popbox .btn').click(function(event) {
			var exam = $('.exam_popbox .btn').length;
			var inum = $(this).index() + 1;
	     	$('.exam_pop img').attr('src','/images/fbcms/user/exam_pop0' + inum + '.jpg');
	     	$('.layer').after('<div class="dim"/>');
			$('.layer').show();
			$('.layer').attr('tabindex', -1).focus();
			$('.layer').css({
				marginLeft: - $('.layer').outerWidth() / 2,
				marginTop: - $('.layer').outerHeight() / 2
			});
		});
		$('.layer_close').click(function(event) {
			$('.dim').remove();
			$('.layer').hide();
			$('.layer').removeAttr('tabindex').blur();
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
			<a href="#n" title="선택된 탭">절차 및 준비</a></li>
		<li>
			<a href="#n">주의사항</a></li>
	</ul>

	<div class="tab_box"><!-- box01 -->
		<h4 class="con_in_tit02 mb80">건강진단 절차</h4>
		<img src="/images/fbcms/user/img_exam04_01.png" alt="">
		<ul class="exam04_01">
			<li>
				<h5 class="con_in_tit01">1. 예약</h5>
				<p class="con_in_txt02">1577-7502<br> 
				(<span>상담가능시간</span>평일 07:30~17:30, 토요일 07:30~13:00)<br>
				<a href="http://www.namu.com" target="_blank" class="c_point">www.namu.com</a></p>
			</li>
			<li>
				<h5 class="con_in_tit01">2. 접수</h5>
				<ul class="dot_list02">
					<li>2층 건강검진센터 접수 창구</li>
					<li>접수 시 검사과정 안내</li>
					<li>접수 후 전문의와 1:1 예진</li>
				</ul>
			</li>
			<li>
				<h5 class="con_in_tit01">3. 검사진행</h5>
				<ul class="dot_list02">
					<li>기초검사, 채혈 및 채뇨검사</li>
					<li>초음파, CT</li>
					<li>내시경 등</li>
				</ul>
			</li>
			<li>
				<h5 class="con_in_tit01">4. 수납 및 검사결과</h5>
				<ul class="dot_list02">
					<li>수납</li>
					<li>검사결과: 7~10일 후 예약 방문 또는 우편 발송</li>
				</ul>
			</li>
		</ul>

		<h4 class="con_in_tit02">건강진단 사전 준비</h4>
		<h5 class="con_in_tit01">1. 채변</h5>
		<p class="con_in_txt">건강진단 하루 전 또는 검진 당일에 채취합니다.<br>
		* 단, 대장내시경 예약고객은 하제 (장검사약)를 복용하기 전에 채취하시기 바랍니다.</p>
		<h5 class="con_in_tit01">2. 금식</h5>
		<p class="con_in_txt">저녁은 6시경 가볍게 드신 후 금식하며, 물은 자정까지만 드십시오.<br>
		대장내시경 검사 고객은 대장내시경용 안내문을 참조하시기 바랍니다.</p>
		<h5 class="con_in_tit01">3. 위&middot;대장내시경, CT검사, 요소호기검사 전 주의사항</h5>
		<p class="con_in_txt">복용을 중단해야 할 약물이 있으므로 반드시 검사 전 <a href="/user/cuc/pct/precautions.do?tab=02"><span class="c_posint_line">주의사항</span></a>을 숙지해주시기 바랍니다.</p>
		<h5 class="con_in_tit01">4. 대장내시경 예약고객</h5>
		<p class="con_in_txt">대장내시경 예약고객은 대장이 충분히 비워져야 정확한 검사가 가능하므로, <a href="/user/cuc/pct/precautions.do?tab=02"><span class="c_posint_line">대장내시경 주의사항</span></a>을 반드시 숙지해주시기 바랍니다.</p>
		<h5 class="con_in_tit01">5. 여성고객</h5>
		<p class="con_in_txt">임산부는 방사선 관련 검사는 받을 수 없습니다.<br>
		가임기 여성은 임신여부를 확인해 주시고, 생리중인 경우 채뇨 및 부인과 검사가 어려우니 생리가 끝나고 5일 이후의 날짜로 예약해 주십시오.<br>
		젤네일(네일 액세서리 포함)을 하신 경우 : 수면내시경시 손가락을 통해 산소포화도를 측정해야 하는데, 젤네일을 하신 경우 산소포화도가 측정되지 않으므로 반드시 젤네일을 지우고 오십시오.</p>
		<h5 class="con_in_tit01">6. 예약일정 변경고객</h5>
		<p class="con_in_txt">예약일을 변경할 경우 예약일이 일정기간 지연될 수 있습니다.<br>
		변경을 원하시면 검진 7일 전까지 ☎1577-7502로 연락 주시기 바랍니다.</p>

	</div>

	<div class="tab_box"><!-- box02 -->
		<ul class="tab_list03"><!-- 내부 탭 -->
			<li class="selected">
				<a href="#n" title="선택된 탭">대장내시경</a>
			</li>
			<li>
				<a href="#n">위내시경</a>
			</li>
			<li>
				<a href="#n">복부초음파</a>
			</li>
			<li>
				<a href="#n">CT검사</a>
			</li>
			<li>
				<a href="#n">요소호기검사</a>
			</li>
		</ul>

		<div class="tab_box03"><!-- 대장내시경 -->
			<h4 class="con_in_tit11">대장내시경 검사 안내<span>(일반&middot;수면)</span></h4>
			<h5 class="con_in_tit02 mt55">약물복용 주의사항</h5>
			<h6 class="con_in_tit01">혈압약</h6>
			<p class="con_in_txt">검사 당일 오전 5시 소량의 물과 함께 복용<br>
			<span class="c_red">검사 당일 고혈압 혹은 저혈압이 심한 경우 검사를 받지 못할 수 있습니다</span></p>
			<h6 class="con_in_tit01">당뇨약</h6>
			<p class="con_in_txt">검사 당일 당뇨약 복용 금지(인슐린 주사 포함)</p>
			<h6 class="con_in_tit01">출혈을 유발할 수 있는 약</h6>
			<p class="con_in_txt">항혈소판제, 항응고제, 혈액순환 개선제 등<br>
			<span class="c_red">반드시 담당의사와 미리 상의하여 중단해 주십시오</span></p>
			<p class="con_in_txt02 c_gray3 fw_500">
				* 항혈소판제<br>
				<img src="/images/fbcms/user/img_exam04_02.png" alt="아스피린, 프레탈정, 아스트릭스, 플라빅스" class="mt10 ml15 mb20">
			</p>
			<p class="con_in_txt02 c_gray3 fw_500">
				* 항응고제<br>
				<img src="/images/fbcms/user/img_exam04_03.png" alt="와파린정, 쿠마딘, 프라닥사, 자렐토, 엘리퀴스" class="mt10 ml15">
			</p>

			<h5 class="con_in_tit02 mb30">운전금지</h5>
			<p class="con_in_txt02 c_red">수면내시경 검사 당일 자가운전은 절대 불가합니다</p>

			<h5 class="con_in_tit02 mt55 mb30">보호자동행</h5>
			<p class="con_in_txt02">* 수면내시경 검사 당일에는 낙상 등의 안전사고 예방을 위하여 보호자의 동행이 필요합니다</p>

			<h5 class="con_in_tit02 mt55 mb30">내시경 검사 전 식사</h5>
			<div class="tdetail05">
				<table>
					<caption>내시경 검사 전 식사 표</caption>
					<col style="width:240px;">
					<col style="width:200px;">
					<col/>
					<tbody>
						<tr>
							<th class="t_left" rowspan="3">검사 3일 전부터<br>피해야 할 음식</th>
							<th class="bggray">해조류</th>
							<td class="t_left">김, 미역, 다시마</td>
						</tr>
						<tr>
							<th class="bggray">잡곡류</th>
							<td class="t_left">검은쌀, 현미, 깨</td>
						</tr>
						<tr>
							<th class="bggray">씨 있는 과일</th>
							<td class="t_left">수박, 참외, 포도, 딸기</td>
						</tr>
						<tr>
							<th class="t_left" colspan="2">검사 전날 피해야 할 음식 </th>
							<td class="t_left">붉은색이나 보라색 음료</td>
						</tr>
						<tr>
							<th class="t_left lastborder" rowspan="2">검사 전날 식사</th>
							<th class="bggray">오전에 검사받는 분</th>
							<td class="t_left">점심, 저녁(오후 6시) 흰죽 또는 미음 섭취. 반찬 없이 소금 간장만 곁들여 식사하세요</td>
						</tr>
						<tr>
							<th class="bggray lastborder">오후에 검사받는 분</th>
							<td class="t_left lastborder">저녁(오후 6시) 흰죽 또는 미음 섭취. 반찬 없이 소금 간장만 곁들여 식사하세요</td>
						</tr>
					</tbody>
				</table>
			</div>

			<h5 class="con_in_tit02 mt55">장세정제 복용법</h5>
			<div class="box_blue exam_popbox"><!-- 1210 -->
				<h5 class="con_in_tit01 t_center mt10">해당되는 복용약을 클릭하면 복용법에 대해 상세히 확인할 수 있습니다. </h5>
				<div class="btn_Lbox mt25"><!-- btn box -->
					<a href="#n" class="btn bline">크리쿨산</a>
					<a href="#n" class="btn bline">쿨프렙산</a>
					<a href="#n" class="btn bline">오라팡정</a>
					<a href="#n" class="btn bline">플렌뷰산</a>
					<a href="#n" class="btn bline">크린뷰올산</a>
				</div>
			</div>

		</div>

		<div class="tab_box03"><!-- 위내시경 -->
			<h4 class="con_in_tit11">위 검사 안내<span>(일반&middot;수면)</span></h4>
			<h5 class="con_in_tit02 mt55">약물복용 주의사항</h5>
			<h6 class="con_in_tit01">혈압약</h6>
			<p class="con_in_txt">검사 당일 오전 5시 소량의 물과 함께 복용<br>
			<span class="c_red">검사 당일 고혈압 혹은 저혈압이 심한 경우 검사를 받지 못할 수 있습니다</span></p>
			<h6 class="con_in_tit01">당뇨약</h6>
			<p class="con_in_txt">검사 당일 당뇨약 복용 금지(인슐린 주사 포함)</p>
			<h6 class="con_in_tit01">출혈을 유발할 수 있는 약</h6>
			<p class="con_in_txt">항혈소판제, 항응고제, 혈액순환 개선제 등<br>
			<span class="c_red">반드시 담당의사와 미리 상의하여 중단해 주십시오</span></p>
			<p class="con_in_txt02 c_gray3 fw_500">
				* 항혈소판제<br>
				<img src="/images/fbcms/user/img_exam04_02.png" alt="아스피린, 프레탈정, 아스트릭스, 플라빅스" class="mt10 ml15 mb20">
			</p>
			<p class="con_in_txt02 c_gray3 fw_500">
				* 항응고제<br>
				<img src="/images/fbcms/user/img_exam04_03.png" alt="와파린정, 쿠마딘, 프라닥사, 자렐토, 엘리퀴스" class="mt10 ml15">
			</p>

			<h5 class="con_in_tit02 mb30">운전금지</h5>
			<p class="con_in_txt02 c_red">수면내시경 검사 당일 자가운전은 절대 불가합니다</p>

			<h5 class="con_in_tit02 mt55 mb30">보호자동행</h5>
			<p class="con_in_txt02">* 수면내시경 검사 당일에는 낙상 등의 안전사고 예방을 위하여 보호자의 동행이 필요합니다</p>

			<h5 class="con_in_tit02 mt55 mb30">내시경 검사 전 식사</h5>
			<div class="tdetail05">
				<table>
					<caption>내시경 검사 전 식사 표</caption>
					<col style="width:240px;">
					<col style="width:200px;">
					<col/>
					<tbody>
						<tr>
							<th class="t_left" rowspan="3">위 수술을 받지 않은 경우</th>
							<th class="bggray">저녁 오후 6시경</th>
							<td class="t_left">죽 등의 가벼운 식사</td>
						</tr>
						<tr>
							<th class="bggray">오후 6시 ~ 12시</th>
							<td class="t_left">물 섭취만 가능</td>
						</tr>
						<tr>
							<th class="bggray">자정 이후</th>
							<td class="t_left">금식(물, 음료수, 껌, 담배 등 포함)</td>
						</tr>
						<tr>
							<th class="t_left lastborder" rowspan="3">위 수술을 받은 경우</th>
							<th class="bggray">점심식사</th>
							<td class="t_left">죽 또는 미음</td>
						</tr>
						<tr>
							<th class="bggray">저녁식사</th>
							<td class="t_left">금식(자정까지 물 섭취만 가능)</td>
						</tr>
						<tr>
							<th class="bggray lastborder">자정 이후</th>
							<td class="t_left lastborder">금식(물, 음료수, 껌, 담배 등 포함)</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		
		<div class="tab_box03"><!-- 복부초음파 -->
			<h4 class="con_in_tit11">복부초음파 검사 안내</h4>
			<div class="exam04_02">
				<div>
					<img src="/images/fbcms/user/img_exam04_04.png" alt="">
					<h5>검사 전 8시간 이상 금식</h5>
					<p>(물, 음료수, 껌, 담배 등 포함)</p>
				</div>
				<div>
					<img src="/images/fbcms/user/img_exam04_05.png" alt="">
					<h5>고혈압 약을 복용하는 분</h5>
					<p>검사 당일 아침 소량의 생수와 함께 약 복용</p>
				</div>
				<div>
					<img src="/images/fbcms/user/img_exam04_06.png" alt="">
					<h5>검사당일 내시경 및 CT(조영제 사용) 검사가 있는 경우</h5>
					<p>복부초음파를 먼저 시행 후 내시경 및 CT검사 시행</p>
				</div>
			</div>
		</div>
		
		<div class="tab_box03"><!-- CT검사 -->
			<h4 class="con_in_tit11">CT 검사 안내<span>(컴퓨터 단층 촬영 - 조영제 사용)</span></h4>
			<div class="exam04_02 mb80">
				<div>
					<img src="/images/fbcms/user/img_exam04_04.png" alt="">
					<h5>검사 전 8시간 이상 금식</h5>
					<p>(물, 음료수, 껌, 담배 등 포함)</p>
				</div>
				<div>
					<img src="/images/fbcms/user/img_exam04_07.png" alt="">
					<h5>과거 조영제 부작용을 경험하신 분</h5>
					<p>검사 전 담당의사와 반드시 상의하고 검사실 직원에게도 알려주세요</p>
				</div>
				<div>
					<img src="/images/fbcms/user/img_exam04_08.png" alt="">
					<h5>임산부, 임신 가능성이 있는 분, 수유중인 분</h5>
					<p>검사 전 담당의사와 반드시 상의하고 검사실 직원에게도 알려주세요</p>
				</div>
			</div>

			<h5 class="con_in_tit01">메포민(Metformin) 성분이 함유된 당뇨약을 복용중인 분</h5>
			<p class="con_in_txt02">검사 당일은 물론 검사 후 48시간 동안 약 복용을 중단하셔야 합니다</p>
			<p class="con_in_txt02 c_gray3 fw_500">
				* 메포민계 당뇨약<br>
				<img src="/images/fbcms/user/img_exam04_09.png" alt="다이아벡스500mg, 다이아벡스100mg 다이아벡스 엑스알500mg, 다이아벡스 엑스알1000mg, 글루파정250mg, 글루파정500mg, 글루파정850mg, 글루파콤비정80/500mg, 가브스메트정50/1000mg 황색, 가브스메트정50/850mg 황색, 가브스메트정50/500mg 황색" class="mt10 ml15 mb20">
			</p>
		</div>

		<div class="tab_box03"><!-- 요소호기검사 -->
			<h4 class="con_in_tit11">요소호기검사</h4>
			<div class="exam04_02 exam04_0202 mb80">
				<div>
					<img src="/images/fbcms/user/img_exam04_04.png" alt="">
					<h5>검사 전 금식</h5>
					<ul class="dot_list02">
						<li>오전 검사 시 : 전날 저녁 6시 경 가볍게 드신 후 금식(물은 자정까지만) </li>
						<li>오후 검사 시 : 검사 당일 오전 8시 이후 금식(물, 음료수, 껌, 담배 등 포함)</li>
					</ul>
				</div>
				<div>
					<img src="/images/fbcms/user/img_exam04_08.png" alt="">
					<h5>임산부 및 임신 가능성이 있는 분</h5>
					<p>검사 금지</p>
				</div>
			</div>
			<h5 class="con_in_tit01">제균치료제를 복용한 경우</h5>
			<p class="con_in_txt02">복용을 중지하고 4주가 지난 후 검사 가능</p>
			<p class="con_in_txt02">제균치료제가 아닌 항생제만 복용시, 복용중지 후 7일이 지난 후 검사 가능</p>
			<div class="clear">
				<p class="con_in_txt02 c_gray3 fw_500 fl">
					* 제균치료를 위해 복용하는 약들<br>
					<img src="/images/fbcms/user/img_exam04_10.png" alt="오메프라졸, 란소프라졸" class="mt10 ml15 mb20">
				</p>
				<p class="con_in_txt02 c_gray3 fw_500 fl ml60">
					* 제균치료를 위해 복용하는 약들<br>
					<img src="/images/fbcms/user/img_exam04_11.png" alt="아목시실린, 테트라사이클린" class="mt10 ml15 mb20">
				</p>
			</div>
		</div>
	</div>

	<!-- 장세정제 복용법 팝업 1210 s -->
	<div class="layer exam_pop">
		<div>
			<img src="/images/fbcms/user/exam_pop01.jpg" alt="">
		</div>
		<a href="#none" class="layer_close">닫기</a>
	</div>

	<!-- //장세정제 복용법 팝업 1210 e -->