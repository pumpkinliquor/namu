<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		/* tab */
		$('.thumb_tab li').click(function(event) {
			 var i = $(this).index();
			$('.thumb_tab li').removeClass('active');
			$(this).addClass('active');
			$('.thumb_tab li').attr('title','');
			$(this).attr('title','선택된 항목');
			$(".thumb_slider").removeClass('active');
			$('.thumb_slider').eq(i).addClass('active');
		});

		$('.thumbnail img').click(function(event){
			var imgPic = $(this).attr('src');
			$(this).parent().parent().parent().prev('.thumb_pic').find('img').attr('src',imgPic);
			$(this).parent().parent().find('a').removeClass('active');
			$(this).parent().addClass('active');
		});
	});
</script>

<!-- contents s -->
<div class="contents w1200">
	<ul class="tab_list"><!-- tab -->
		<li class="selected"><a href="javascript:void(0);" title="선택된 탭">PET-CT</a></li>
		<li><a href="javascript:void(0);">128 slice CT</a></li>
		<li><a href="javascript:void(0);">내시경</a></li>
		<li><a href="javascript:void(0);">초음파</a></li>
		<li><a href="javascript:void(0);">MAMMOTOME</a></li>
		<li><a href="javascript:void(0);">복강경 수술장비</a></li>
	</ul>

	<section class="tab_box equip01" style="display:block"><!-- //tab contents1 s -->
		<h4 class="con_in_tit04">양전자 방출 단층 촬영(PET-CT) 검사란?</h4>
		<p class="con_in_txt">양전자 방출 단층 촬영(PET-CT)이란 핵의학 영상 기법을 이용하여 신체에서 일어나는 기능을 3차원적인<br>
		영상으로 만드는 방법입니다<br>
		양전자를 방출하는 동위원소가 붙은 의약품을 환자에게 정맥주사한 후 검사를 시행하고 환자의 CT영상과<br>
		PET영상을 동시에 얻어 병소의 형태학적 변화와 생화학적 변화를 함께 볼 수 있기 때문에 질병의 진단이<br>
		보다 정확해졌습니다</p>

		<h4 class="con_in_tit04">PET CT의 용도와 장점</h4>
		<h5 class="con_in_tit05">1) 암의 조기 발견, 전이 여부 및 정확한 위치의 판별</h5>
		<p class="con_in_txt">기존 PET에서 가능한 암의 조기 발견, 전이 여부의 판별이 가능할 뿐만 아니라, PET에서 할 수 없었던<br>
		암세포의 위치까지 정확하게 판단할 수 있습니다<br>
		이는 CT를 PET과 같이 촬영하여 PET 이미지와 일치하게 이미지 퓨전을 함으로써 얻어 낼 수 있습니다<br>
		암세포의 정확한 위치의 판별은 암 치료에 있어서 어떠한 방법으로 암을 치료하는 것이 효율적인지를<br>
		결정할 수 있어, 임상적인 가치가 매우 높습니다</p>

		<h5 class="con_in_tit05">2) 검사 시간의 감소</h5>
		<p class="con_in_txt">PET 검사 시 시행하던 Transmission scan을 CT scan으로 교체하여 기존의 PET에서 10분 이상 소요되었던 Transmission scan 시간을 30초의 CT scan으로 대체하여<br>
		검사 시간을 최대 40% 절약할 수 있습니다</p>

		<h5 class="con_in_tit05">3) 검사 프로세스 간소화</h5>
		<p class="con_in_txt">현행 암검사의 방법은 Chest X-ray부터, Chest CT, PET 또는 감마카메라, 조직 검사, 다시 CT 등 복잡한 검사과정을 가지고 있어<br>
환자가 암세포가 있더라도 이를 검사하는 데  많은 시간이 소요됩니다<br>
그러나 PET-CT로는 한번의 검사로 암세포의 진단과 병기결정이 가능하며 PET-CT의 결과를 바로 치료에 사용할 수 있어 검사의 프로세스를 간소화시킬 수 있습니다</p>
	</section><!-- //tab contents1 e -->

	<section class="tab_box equip02"><!-- //tab contents2 s -->
		<h4 class="con_in_tit04">128 slice CT(CT VCT GIC 6. ZETA)란?</h4>
		<p class="con_in_txt">적은 방사선 피폭량, 빠른 촬영, 고화질의 영상을 얻을 수 있는 최신 CT장비입니다</p>

		<h4 class="con_in_tit04">피폭량을 줄인 저선량 CT 검사</h4>
		<p class="con_in_txt">CT 검사를 받는 분들이 가장 우려하는 것이 바로 방사선 피폭량입니다. ASIR 기법 등 최신 버전의<br>
기술로 방사선 피폭량을 최대 82%까지 줄여 방사선에 대한 고민을 덜어드립니다</p>

		<h4 class="con_in_tit04">최신, 최첨단 기술 탑재</h4>
		<p class="con_in_txt">128 slice CT는 GE의 기술이 집약된 최신, 최첨단 CT입니다</p>

		<h4 class="con_in_tit04">초고화질의 영상</h4>
		<p class="con_in_txt">1번 회전에 128 슬라이스의 이미지를 촬영할 수 있으며, 빠른 촬영이 가능한 물론 노이즈가 없는 0.35mm의<br>
초고해상도 이미지를 구현해 아주 작은 크기의 병변도 구분해 낼 수 있습니다</p>

		<h4 class="con_in_tit04">128 slice CT의 임상적 적용</h4>
		<div class="thumb_box">
			<ul class="thumb_tab">
				<li class="active" title="선택된 항목">
					<strong>복부골반질환</strong>
					복부골반장기의 암 및 염증성 질환, 혈관계통질환 검사
				</li>
				<li>
					<strong>대장질환</strong>
					CT 대장경을 이용하여 대장암, 대장용종 검사
				</li>
				<li>
					<strong>흉부질환</strong>
					폐암, 폐렴, 폐결핵, 폐확장증 등 각종 폐기관지질환, 종격동 및 흉벽질환
				</li>
				<li>
					<strong>심혈관질환</strong>
					심장 관상동맥질환, 대동맥질환
				</li>
				<li>
					<strong>전신혈관질환(뇌혈관포함)</strong>
				</li>
			</ul>
			<div class="thumb_slider active"><!-- slider 1 s -->
				<div class="thumb_pic">
					<img src="/images/fbcms/user/img_equip01.png" alt="">
				</div>
				<div class="thumbnail">
					<div>
					  <a href="#n" class="active"><img src="/images/fbcms/user/img_equip01.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip02.png" alt=""></a>
					</div>
				</div>
			</div><!-- //slider 1 e -->

			<div class="thumb_slider"><!-- slider 2 s -->
				<div class="thumb_pic">
					<img src="/images/fbcms/user/img_equip03.png" alt="">
				</div>
				<div class="thumbnail">
					<div>
					  <a href="#n" class="active"><img src="/images/fbcms/user/img_equip03.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip04.png" alt=""></a>
					</div>
				</div>
			</div><!-- //slider 2 e -->

			<div class="thumb_slider"><!-- slider 3 s -->
				<div class="thumb_pic">
					<img src="/images/fbcms/user/img_equip05.png" alt="">
				</div>
				<div class="thumbnail">
					<div>
					  <a href="#n" class="active"><img src="/images/fbcms/user/img_equip05.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip06.png" alt=""></a>
					</div>
				</div>
			</div><!-- //slider 3 e -->

			<div class="thumb_slider"><!-- slider 4 s -->
				<div class="thumb_pic">
					<img src="/images/fbcms/user/img_equip07.png" alt="">
				</div>
				<div class="thumbnail">
					<div>
					  <a href="#n" class="active"><img src="/images/fbcms/user/img_equip07.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip08.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip09.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip10.png" alt=""></a>
					</div>
				</div>
			</div><!-- //slider 4 e -->

			<div class="thumb_slider"><!-- slider 5 s -->
				<div class="thumb_pic">
					<img src="/images/fbcms/user/img_equip11.png" alt="">
				</div>
				<div class="thumbnail">
					<div>
					  <a href="#n" class="active"><img src="/images/fbcms/user/img_equip11.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip12.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip13.png" alt=""></a>
					  <a href="#n"><img src="/images/fbcms/user/img_equip14.png" alt=""></a>
					</div>
				</div>
			</div><!-- //slider 5 e -->
		</div>
	</section><!-- //tab contents2 e -->


	<section class="tab_box equip03"><!-- //tab contents3 s -->
		<h4 class="con_in_tit04">내시경이란?</h4>
		<p class="con_in_txt">내시경이란 과거에는 수술을 통하여야만 관찰이 가능했던 신체내부의 소화기관을 구강이나 항문과 같은 곳을 이용하여<br>
		식도, 위, 십이지장, 대장과 같은 신체내부기관을 관찰하고 필요한 경우 치료도 할 수 있게 하는 기구입니다
		</p>

		<h4 class="con_in_tit04">내시경의 용도</h4>
		<ul class="dot_list02">
			<li>소화기 내부 육안 검사와 병변 조직 표본 채취</li>
			<li>소화기관 내 이물질 제거</li>
			<li>개복수술 없이 내시경 장비를 이용해 수술</li>
		</ul>

		<h4 class="con_in_tit04">내시경 수술의 장점</h4>
		<ul class="dot_list02">
			<li>빠른 회복기간</li>
			<li>통증감소</li>
			<li>복부 절개가 없기 때문에 흉터가 없습니다</li>
		</ul>

		<h4 class="con_in_tit04">비에비스 나무병원의 내시경</h4>
		<p class="desc01">※ 홈페이지에 게재된 환부사진들은 환자분들의 이해를 돕기 위한 목적으로 사용된 것입니다</p>

		<h5 class="con_in_tit05 mt30">1) Full HD-TV Image</h5>
		<p class="con_in_txt">기존 제품에 비해 화질을 2배 이상 개선한 HD-TV 영상을 채택하여 기존 제품으로 확인이 어려웠던 미세한 혈관과 점막, 색상 변화까지 관찰이 가능합니다</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_02.png" alt=""><span class="nomal">일반 내시경</span>
		</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_03.png" alt=""><span>HD-TV</span>
		</p>
		<h5 class="con_in_tit05">2) NBI (Narrow Band Image) </h5>
		<p class="con_in_txt">모세혈관의 미세한 변화까지 손금보듯 관찰할 수 있는 고해상도 내시경 검사 장비입니다<br>
		정상과 다른 병변 부위의 표면은 미세 혈관상에 뚜렷한 대조를 보이기 때문에 식도, 위, 십이지장, 대장의 조기암 등 발견이 어려운 미세하고 불명확한 병변을<br>
		신속하게 조직학적으로 진단할 수 있습니다</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_04.png" alt=""><span class="nomal">일반 내시경</span>
		</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_05.png" alt=""><span>NBI</span>
		</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_06.png" alt=""><span>NBI ZOOM</span>
		</p>
		<h5 class="con_in_tit05">3) AFI (Auto Fluorescence Imaging)</h5>
		<p class="con_in_txt">AFI는 정상세포와 병변의 미세한 형광 차이를 특수 필터와 CCD를 이용하여 영상화 시키는 기능입니다</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_07.png" alt=""><span class="nomal">일반 내시경</span>
		</p>
		<p class="equip_img">
			<img src="/images/fbcms/user/img_equipment03_08.png" alt=""><span>AFI</span>
		</p>
		<div class="equip_flimg">
			<img src="/images/fbcms/user/img_equipment03_09.png" alt="" class="equip_flimg">
			<h5 class="con_in_tit05">4) 경비내시경</h5>
			<p class="con_in_txt">경비내시경(코내시경)이란 가늘고 부드러운 내시경 장비를 코로 삽입해 시행하는 내시경 장비입니다<br>
			내시경의 굵기 면에서 기존의 내시경이 9.8mm인 데 비해 경비내시경은 4.9mm로 거의 절반 수준입니다<br>
			경비내시경은 기존 입으로 삽입하는 위내시경 검사에 비해 구역질과 인후통, 질식감 등 불쾌감과 고통을 대폭 감소시켜 환자가 편안한 가운데 내시경 <br>
			검사를 받을 수 있는 장점이 있으며, 검사 후 목의 통증이 적습니다<br>
			또한 심리적 안정감이 유지되고, 검사 도중 시술자와 대화를 나눌 수 있는 등 충분한 시간을 가지고 검사를 할 수 있어 질환의 발견이 용이합니다
			</p>
		</div>
		<div class="equip_flimg">
			<img src="/images/fbcms/user/img_equipment03_10.png" alt="">
			<h5 class="con_in_tit05 mt30">5) 초음파내시경</h5>
			<p class="con_in_txt">초음파내시경은 간단히 말해 내시경 검사와 초음파 검사를 동시에 실시할 수 있는 진단 기기입니다<br>
			초음파내시경은 내시경 끝에 초음파 장치가 붙어 있어, 위와 장관에서 직접 몸속에 초음파를 투영해 종전 초음파 검사와 CT가 발견하지 못하는 <br>
			취약 지역까지 자세히 관찰할 수 있습니다<br>
			또한 초음파내시경 안으로 조직 검사용 침을 넣으면 그 병변에서 조직을 얻는 검사법까지 가능하다는 장점이 있습니다</p>
		</div>

		<h4 class="con_in_tit04">내시경 검사를 통해 진단이 가능한 질병</h4>
		<div class="equip_hbox">
			<img src="/images/fbcms/user/img_equipment03_11.png" alt="">
			<h5 class="con_in_tit05">식도&middot;위질환</h5>
			<p class="con_in_txt">역류성 식도염, 식도 종양, 식도정맥류, 위염, <br>
			위궤양, 위용종, 위암 등</p>
		</div>
		<div class="equip_hbox">
			<img src="/images/fbcms/user/img_equipment03_12.png" alt="">
			<h5 class="con_in_tit05">대장질환</h5>
			<p class="con_in_txt">대장용종, 점막하종양, 대장암, 게실염, 염증성 장질환<br>
			(궤양성대장염, 크론병)등의 대장질환</p>
		</div>

	</section><!-- //tab contents3 e -->

	<section class="tab_box equip04"><!-- //tab contents4 s -->
		<h4 class="con_in_tit04">초음파 검사란?</h4>
		<p class="con_in_txt">예약 전 아래의 주의사항을 읽어보시고 착오가 없으시기 바랍니다<br>
		인체에 무해한 고주파수를 이용하여 신체 장기에서 반사된 음파를 영상으로 전환하여 실시간으로 진단할 수 있습니다</p>

		<h4 class="con_in_tit04">초음파 검사의 종류</h4>
		<ul class="dot_list02">
			<li><span>복부초음파</span>: 간, 담낭, 담도, 췌장, 신장 등을 검사</li>
			<li><span>갑상선 초음파</span>: 갑상선에 결절 및 갑상선 암검사</li>
			<li><span>경동맥초음파</span>: 뇌졸중 등을 예방하는 검사</li>
			<li><span>심장초음파</span>: 심장근육, 판막 이상유무의 검사</li>
			<!-- <li><span>전립선초음파</span>: 전립선 비대증과 전립선암을 감별하는 검사</li> -->
			<li><span>골반, 자궁초음파</span>: 자궁암 및 난소암을 검사하는 초음파</li>
		</ul>

		<ul class="ultra_box">
			<li><h5 class="con_in_tit05">1) 간 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_02.png" alt="">
			</li>
			<li><h5 class="con_in_tit05">2) 담석증 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_03.png" alt="">
			</li>
			<li><h5 class="con_in_tit05">3) 갑상선 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_04.png" alt="">
			</li>
			<li><h5 class="con_in_tit05">4) 유방 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_05.png" alt="">
			</li>
			<li><h5 class="con_in_tit05">5) 심장 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_06.png" alt="">
			</li>
			<li><h5 class="con_in_tit05">6) 경동맥 초음파</h5>
				<img src="/images/fbcms/user/img_equipment04_07.png" alt="">
			</li>
		</ul>

	</section><!-- //tab contents4 e -->

	<section class="tab_box equip05"><!-- //tab contents5 s -->
		<h4 class="con_in_tit04">맘모톰이란?</h4>
		<p class="con_in_txt">맘모톰(Mammotome)은 유방암진단에 결정적으로 필요한 적정량의 유방병변조직을 칼을 대는 외과적<br>
		수술이나 통증 없이 부분마취로 완벽하게 얻을 수 있을 뿐만 아니라 혹, 멍울 등 한국여성에게 흔한 <br>
		양성 유방병변도 수술하지 않고 간단히 완전 제거할 수 있는 검사기기입니다<br>
		세계적인 의료업체인 Johnson&Johnson (U.S.A)에서 생산하여 미국 FDA 승인을 받은 안전한 장비입니다</p>

		<h4 class="con_in_tit04">맘모톰과 절개법 비교</h4>
		<p class="con_in_txt">맘모톰을 사용할 경우 절개에 비해 수술 후 통증이 적고, 시술에 따른 합병증도 거의 없습니다</p>
		<table class="mam_t">
			<caption>맘모톰, 절개법 비교 표</caption>
			<col>
			<col style="width:255px;">
			<col style="width:255px;">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">맘모톰</th>
					<th scope="col">절개법</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">상처 크기</th>
					<td>3mm 이하</td>
					<td>20mm ~ 60mm</td>
				</tr>
				<tr>
					<th scope="row">마취 정도</th>
					<td>국소 마취</td>
					<td>전신마취 또는 국소마취</td>
				</tr>
				<tr>
					<th scope="row">상처부위 처치</th>
					<td>1개의 반창고 부착</td>
					<td>봉합사를이용한 봉합</td>
				</tr>
				<tr>
					<th scope="row">소요 시간</th>
					<td>10~30분(주로 외래시술)</td>
					<td>1~2시간(수술실 시술) </td>
				</tr>
				<tr>
					<th scope="row">입원 여부</th>
					<td>입원 불필요</td>
					<td>안정, 때로는 입원 필요</td>
				</tr>
				<tr>
					<th scope="row">흉터</th>
					<td>거의 보이지 않음</td>
					<td>봉합부분 흉터</td>
				</tr>
			</tbody>
		</table>

		<h4 class="con_in_tit04">맘모톰 시술이 가능한 질환</h4>
		<ul class="dot_list02">
			<li>유방암 등 유방 멍울 조직 검사</li>
			<li>섬유선종 등 양성 종양 제거</li>
			<li>지방종 등 기타 피하조직 양성종양 제거</li>
		</ul>

		<h4 class="con_in_tit04">시술 방법</h4>
		<p class="con_in_txt">맘모톰 바늘을 병소에 넣고 진공 흡입기를 작동하여 바늘안으로 조직을 끌어들인 후 칼이 작동되어 병변을 잘라서 나오는 방법입니다</p>
		<h5 class="con_in_tit06">&lt; 유방의 종괴부위를 흡입하여 채취하는 모습 &gt;</h5>
		<img src="/images/fbcms/user/img_equipment05_02.png" alt="흡입하는과정 :종괴에 위치 후 진공 후 커팅 후 제거">
		<h5 class="con_in_tit06 mt40">&lt; 초음파를 이용한 맘모톰 조직검사모습 &gt;</h5>
		<img src="/images/fbcms/user/img_equipment05_03.png" alt="초음파를 통해 혹 확인 후 맘모톰 수술 시행, 이후 초음파에 혹이 보이지 않게 됨">

	</section><!-- //tab contents5 e -->

	<section class="tab_box equip06"><!-- //tab contents6 s -->
		<h4 class="con_in_tit04">복강경 수술이란?</h4>
		<p class="con_in_txt">복강경 수술은 기존의 개복 수술과 달리 복부에 3~4개의 5~10mm 미만의 작은 구멍을 내어<br>
		들여다보는 Full HD급 카메라가 부착된 복강경과 비디오 모니터 등을 이용하여 정확한 진단<br>
		및 시술하는 미세수술(Minimally Invasive Surgery) 방법의 하나입니다</p>

		<h4 class="con_in_tit04">복강경 수술의 장점</h4>
		<ul class="dot_list02">
			<li>복부에 피부절개부위가 매우 작아 미용적 효과가 매우 좋습니다</li>
			<li>회복기간이 짧아서 입원기간이 단순개복술에 비해 줄어듭니다</li>
			<li>장운동이 빨리 회복되어 음식 섭취를 조기에 할 수 있습니다</li><!-- 1204 수정 -->
			<li>무기력, 폐렴 등의 폐합병증이 줄어듭니다</li>
			<li>장유착이 수술 후에 적게 일어나 장폐쇄 합병증 가능성이 감소합니다</li>
		</ul>

		<h4 class="con_in_tit04">나무병원의 단일통로 복강경 수술</h4>
		<div class="laparoscopy mt10">
			<img src="/images/fbcms/user/img_equipment06_02.png" alt="일반적인 복강경 수술 이미지와 단일통로 복강경 수술 이미지">
			<p class="con_in_txt">일반 복강경 수술은 복부에 3~4개의 작은 구멍 (5~10mm)을 내지만, 나무병원에서는 ‘단일통로 복강경 수술’을 시행합니다<br>
			이는 배꼽 한 곳에만 작은 구멍(10mm)을 내고, 그곳으로 카메라 및 수술장비들을 모두 삽입하여 병변을 제거하는 방식입니다<br>
			배꼽은 태생적인 흉터이기 때문에, 수술로 인한 별도의 상처가 남지 않게 됩니다
			</p><!-- 1204 수정 -->
			<p class="con_in_txt">미용적으로 우수할뿐만 아니라, 절개창의 수가 적기 때문에 합병증 위험이 낮고 회복기간이 매우 빠릅니다<br>
			단일통로 복강경 수술로 담석을 제거한 경우, 대개 수술 다음날 퇴원이 가능합니다</p>
		</div>
	</section><!-- //tab contents6 e -->