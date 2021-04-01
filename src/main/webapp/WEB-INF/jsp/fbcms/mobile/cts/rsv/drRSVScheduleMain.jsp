<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 캘린더 -->
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/js/fbcms/user/ajax_cmm.js"></script>

<!-- contents s -->
<div class="contents">

	<h4 class="con_in_tit05 mar20">진료시간 안내</h4>
	<div class="tdetail tdetail04">
		<table>
			<caption>요일, 구분, 외래, 검진으로 구성된 표</caption>
			<col style="width:20%">
			<col style="width:20%">
			<col style="width:30%">
			<col>
			<thead>
				<tr>
					<th scope="col">요일</th>
					<th scope="col">구분</th>
					<th scope="col">외래</th>
					<th scope="col">검진</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row" rowspan="2">평일</th>
					<td>진료시간</td>
					<td>08:00 ~ 17:00</td>
					<td>07:30 ~ 16:30</td>
				</tr>
				<tr>
					<td>점심시간</td>
					<td>13:00 ~ 14:00</td>
					<td>-</td>
				</tr>
				<tr>
					<th scope="row">토요일</th>
					<td>진료시간</td>
					<td>08:00 ~ 13:00</td>
					<td>07:30 ~ 13:00</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="box_blue mt30 mar20">
		<h6 class="con_in_tit10">※ 진료 절차 안내</h6>
		<p>진료신청서작성<span class="sche_arr"></span>
			접수<span class="sche_arr"></span>
			외래 진료과 진료<span class="sche_arr"></span>
			수납&middot;예약<span class="sche_arr"></span>
			검사&middot;처방전 귀가</p>
		<h6 class="con_in_tit10">※ 외래진료 당일 접수마감</h6>
		<ul class="hy_list">
			<li>평일 : 오전 12:00 까지, 오후 16:30 까지</li>
			<li>토요일 : 오후 12:30 까지</li>
		</ul>
		<h6 class="con_in_tit10">※ 예약 상담: 1577-7502, 팩스: 02-519-8855</h6>
		<h6 class="con_in_tit10">※ 의료급여 환자가 본 원에서 2단계 진료를 받기 위해서는 1단계 의료급여 기관의 의사로부터 발급받은 “요양급여 의뢰서”를 발급일로부터 7일 이내(공휴일 제외)에	원무팀에 제출하셔야 합니다</h6>
	</div>
	
	<div>
		<div class="f_step"><!-- 진료과 선택 -->
			<p class="sel">진료과 선택<span></span></p>
			
			<ul class="f_step01">
				<li id="liGI" onclick="javascript:fnSelectMEDI_SBJ_CD('GI')" class="selected"><a href="#none" title="선택된 탭">소화기내과</a></li>
				<li id="liGS" onclick="javascript:fnSelectMEDI_SBJ_CD('GS')"><a href="#none">소화기외과</a></li>
				<li id="liNE" onclick="javascript:fnSelectMEDI_SBJ_CD('NE')"><a href="#none">신장내과</a></li>
				<li id="liFM" onclick="javascript:fnSelectMEDI_SBJ_CD('FM')"><a href="#none">가정의학과</a></li>
				<li id="liBE" onclick="javascript:fnSelectMEDI_SBJ_CD('BE')"><a href="#none">유방&middot;갑상선외과</a></li>
				<li id="liGY" onclick="javascript:fnSelectMEDI_SBJ_CD('GY')"><a href="#none">부인과</a></li>
				<li id="liAO" onclick="javascript:fnSelectMEDI_SBJ_CD('AO')"><a href="#none">안티에이징&middot;비만센터</a></li>
			</ul>
		</div>
	</div>
	
	<div class="f_step"><!-- 의료진 선택 -->
		<p class="sel">의료진 선택<span></span></p>
		<div class="f_step02">
			<ul id="mCSB_1_container">
				<c:forEach items="${DrList}" var="drlist">
				<li>
					<img src="<c:url value='/getImage/${drlist.PC_IMG_ATCH_NO}'/>" alt="${drlist.DR_NM}">
					<strong id="drname">${drlist.DR_NM}<span id="drfield">${drlist.POSITION_CT}</span></strong>
					<span id="drfield">${drlist.FIELD_CT}</span>
					<a href="#none"></a>
				</li>
				</c:forEach>
			</ul>
			<a href="#n" class="btn_more">자세히 보기</a>
		</div>
	</div>
	
	
	<div class="f_step"><!-- 날짜 선택 -->
		<p class="sel">날짜 선택<span></span></p>
		<div class="date_sel f_step03">
			<div class="date_year">
				<a href="javascript:prevm();" id="prev">이전 년도로 이동</a>
				<span id="yearmonth"></span>
				<a href="javascript:nextm();" id="next">다음 년도로 이동</a>
			</div>
			<p><a href="#n" class="am">오전</a><a href="#n" class="pm">오후</a></p>
	
			<div class="date_table">
				<table id="calendar">
					<caption>달력</caption>
					<thead>
						<tr>
							<th scope="col">월</th>
							<th scope="col">화</th>
							<th scope="col">수</th>
							<th scope="col">목</th>
							<th scope="col">금</th>
							<th scope="col">토</th>
						</tr>
					</thead>
					<tbody id="calendarBody">
					</tbody>
				</table>
			</div>
			<p class="date_desc" id="drComment"></p>
			</div>
		</div>
		<div class="btn_Lbox">
			<a href="javascript:moveToReservation();" class="btn breservation">예약</a>
		</div>
	
</div>

	
	
<!-- 의료진 popup s -->
<div class="sub_pop">
	<div>
		<dl class="profile">
			<dt></dt>
			<dd class="drtag">
				<div class="tag_list">
					<c:forEach items="${drDetail.SEARCH_TAG_CT}" var="tag" varStatus="sts">
						<a href="javascript:void(0);">${tag }</a>
					</c:forEach>
					
				</div>
			</dd>
			<dd class="sub_btn">
			<c:if test="${fn:contains(drDetail.ADD_OPEN_SET_CD, '01')}">
				<a href="/user/cts/rsv/drScheduleView.do" class="btn bgreen">진료시간표</a>
				</c:if>
				<c:if test="${fn:contains(drDetail.ADD_OPEN_SET_CD, '02')}">
				<a href="/user/cts/rsv/userRSVMain.do" class="btn breservation">예약</a>
				</c:if>
			</dd>
			<dd class="expertise">
				<p>전문분야</p>
				<ul id="drSpc">${drDetail.SPCL_FIELD_TX}</ul>
			</dd>
			<dd class="pro_img">
				<img src="<c:url value='/getImage/${drDetail.MOBILE_IMG_ATCH_NO}'/>" alt="" id="DRpicture">
				<c:choose>
					<c:when test="${drDetail.BLOG_USE_YN eq 'Y'}">
						<a href="${drDetail.BLOG_ADD_TX}" target="_blank" id="blog">블로그 바로가기</a>
					</c:when>
				</c:choose>
			</dd>
		</dl>


		<div class="his">
			<p>주요경력 및 약력</p>
			<ul id="drHis"></ul>
			<ul id="drHis2"></ul>
		</div>
	</div>
	<a href="javascript:void(0);" class="sub_close">닫기</a>
</div>
<!-- 의료진 popup e -->

	<form name="hidden" action="" method="post">
		<input type="hidden" name="DID" id="DID" value="">
	</form>
</div>
<!-- //contents e -->
<form id="reservationForm" name="reservationForm" action="/user/cts/rsv/userRSVClinic.do" method="post">
	<input type="hidden" id="DPT_CD" name="DPT_CD">
	<input type="hidden" id="DR_ID" name="DR_ID">
	<input type="hidden" id="DR_NM" name="DR_NM">
	<input type="hidden" id="RSV_DT" name="RSV_DT">
	<input type="hidden" id="MEDI_SBJ_CD" name="MEDI_SBJ_CD">
	<input type="hidden" id="MEDI_SBJ_NM" name="MEDI_SBJ_NM">
</form>
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>

var firstLoad = true;
var ID = "${drId}";

$(document).ready(function() {
	build();
	$('.f_step .sel').click(function(e){
		if($(this).next('[class*="f_step"]').is(':hidden')){
			$(this).next('[class*="f_step"]').slideDown();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat right',
				backgroundSize:'35px'
			});
		}else{
			$(this).next('[class*="f_step"]').slideUp();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat  right',
				backgroundSize:'35px'
			});
		}
	});

	//진료과
	$('.f_step01 li').click(function(){
		var txt = $(this).children('a').text();
		$(this).parents('ul').prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
		//$(this).parents('ul').slideUp();
	});

	//의료진
	$('.f_step02 li').click(function(){
		var txt = $(this).children('strong').text();
		$(this).parents('ul').parents().prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
	});
	var step02More = $('.f_step02 .btn_more');
	$('.f_step02 li').slice(0, 10).show();
	if($('.f_step02 li').length < 11){
		step02More.hide();
	}
	step02More.click(function(e){
		e.preventDefault();
		$('.f_step02 li:hidden').slice(0, 10).show();
		if($('.f_step02 li:hidden').length == 0){
			step02More.hide();
		}
	});

	//날짜선택
	$('.date_table td a:not(.closed)').off();
	$('.date_table td a:not(.closed)').click(function(){
		var year = $('.date_year span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
		$('.date_table td a').removeClass('selected');
		$(this).addClass('selected');
		if(str < 10){
			$('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
		}else{
			$('.date_sel').prev('.sel').children('span').text(year + '.' + str);
		}

	});
	
	$('#li${dptCd}').trigger('click');
	fnSelectMEDI_SBJ_CD('${dptCd}');
});

/* 진료시간table ajax */
function fnSelectMEDI_SBJ_CD(MEDI_SBJ_CD) {
	$("#mCSB_1_container").html('');
	var object = {
		url : "/user/cts/rsv/drScheduleSelectList.do",
		data : {
			"MEDI_SBJ_CD" : MEDI_SBJ_CD
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				var fNum = 0;
				var drlgth = data.drVo.length;
				var drinf = '';
				/* 의료진 리스트 재구성 */
				$("#mCSB_1_container *").remove();
				
				for(var i=0; i<drlgth; i++) {
					drinf += '<li>';
					drinf += '<img src="/getImage/';
					drinf += data.drVo[i].PC_IMG_ATCH_NO;
					drinf += '" alt="'+ data.drVo[i].DR_NM +'">';
					drinf += '<strong>';
					drinf += data.drVo[i].DR_NM;
					drinf += '</strong> <span>';
					drinf += data.drVo[i].FIELD_CT;
					drinf += '</span> <a href=';
					drinf += '"javascript:getDrCalendarList';
					drinf += "(";
					drinf += "'" + MEDI_SBJ_CD + "', ";
					drinf += "'" + data.drVo[i].DR_ID + "', ";
					drinf += "'" + data.drVo[i].DR_NM + "', ";
					drinf += "'" + data.drVo[i].FIELD_CT + "', ";
					drinf += "'" + data.drVo[i].POSITION_CT + "', ";
					drinf += "'" + data.drVo[i].CLINIC_APPO_WORD_CT + "'";
					drinf += ");";
					drinf += '"id="';
					drinf += data.drVo[i].DR_ID;
					drinf += '"></a>';
					drinf += '</li>';
					if(data.drVo[i].DR_ID == ID) {
						fNum = i;
					}
				}
				$("#mCSB_1_container").html(drinf);
				var step02More = $('.f_step02 .btn_more');
				$('.f_step02 li').slice(0, 10).show();
				if($('.f_step02 li').length < 11){
					step02More.hide();
				}
				step02More.click(function(e){
					e.preventDefault();
					$('.f_step02 li:hidden').slice(0, 10).show();
					if($('.f_step02 li:hidden').length == 0){
						step02More.hide();
					}
				});
				//진료과
				$('.f_step01 li').click(function(){
					var txt = $(this).children('a').text();
					$(this).parents('ul').prev('.sel').children('span').text(txt);
					$(this).addClass('selected').siblings('li').removeClass('selected');
					//$(this).parents('ul').slideUp();
				});

				//의료진
				$('.f_step02 li').click(function(){
					var txt = $(this).children('strong').text();
					$(this).parents('ul').parents().prev('.sel').children('span').text(txt);
					$(this).addClass('selected').siblings('li').removeClass('selected');
				});
				build();
				
				if(firstLoad){
					$('#'+data.drVo[fNum].DR_ID).trigger('click');
					getDrCalendarList(MEDI_SBJ_CD, data.drVo[fNum].DR_ID, data.drVo[fNum].DR_NM, data.drVo[fNum].FIELD_CT);
				}
			});
		}
	}
	fnAjax(object);
}
var DR_ID;
var DPT_CD;
var DR_NM;

function numberPad(n, width) {
	n = n + '';
	return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

var today = new Date();
var date = new Date();
function prevm() {
	today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	build();
	if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#DR_NM').val() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#DR_NM').val() != undefined) {
		getDrCalendarList($('#DPT_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
	}
}

function nextm() {
	$('#RSV_DT').val('');
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	build();
	if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#DR_NM').val() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#DR_NM').val() != undefined) {
		getDrCalendarList($('#DPT_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
	}
}

function build() {
	var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastdate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	var tbca = document.getElementById("calendarBody");
	var yearmonth = document.getElementById("yearmonth");
	yearmonth.innerHTML = today.getFullYear() + "." + numberPad(today.getMonth() + 1, 2);
	
	if (today.getMonth() + 1 == 12) { //  눌렀을 때 월이 넘어가는 곳
		prev.innerHTML = (today.getMonth()) + "월";
		next.innerHTML = "1월";
	} else if (today.getMonth() + 1 == 1) { //  1월 일 때
		prev.innerHTML = "12월";
		next.innerHTML = (today.getMonth() + 2) + "월";
	} else { //   12월 일 때
		prev.innerHTML = (today.getMonth()) + "월";
		next.innerHTML = (today.getMonth() + 2) + "월";
	}
	
	// 남은 테이블 줄 삭제
	while (tbca.rows.length > 0) {
		tbca.deleteRow(tbca.rows.length - 1);
	}
	
	var row = null;
	row = tbca.insertRow();
	var cnt = 0;
	
	// 1일 시작칸 찾기
	for (i = 0; i < nMonth.getDay(); i++) {
		if ((cnt + 1) % 7 != 1) {
			cell = row.insertCell();
		}
		cnt = cnt + 1;
	}
	
	// 달력 출력
	for (i = 1; i <= lastdate.getDate(); i++) { // 1일부터 마지막 일까지
		if ((cnt + 1) % 7 != 1) {
			cell = row.insertCell();
			cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today.getFullYear()+numberPad(today.getMonth()+1, 2)+numberPad(i, 2)+'"></a>';
			cnt = cnt + 1;
			if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
				row = calendar.insertRow();// 줄 추가
			}
			if (today.getFullYear() == today.getFullYear() && today.getMonth() == today.getMonth() && i == today.getDate()) {
				cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today.getFullYear()+numberPad(today.getMonth()+1, 2)+numberPad(i, 2)+'"></a>';
			}
		} else {
			cnt = cnt + 1;
		}
		if(i == lastdate.getDate()) {
			var endLine = 7 - (cnt % 7);
			if(endLine < 6) {
				for (var j = 0; j < endLine; j++) {
					cell = row.insertCell();
				}
			}
			
		}
	}
}

function getDrCalendarList(DPT_CD, DR_ID, DR_NM, FIELD_CT, POSITION_CT, CLINIC_APPO_WORD_CT) {
	$('#DR_ID').val(DR_ID);
	$('#DR_NM').val(DR_NM);
	$('#drname').text(DR_NM);
	$('#DPT_CD').val(DPT_CD);
	$('#MEDI_SBJ_NM').val(FIELD_CT);
	$('input#DID').val(DR_ID);
	$("#drComment").text(CLINIC_APPO_WORD_CT);
	var RSV_DT = today.getFullYear() + numberPad(today.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendarMonth.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A') {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A') {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A') {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT).removeClass('closed');
				$('#'+value.rsv_DT).addClass(fgClass);
				
				
				$('#'+value.rsv_DT).html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}

function rstEvt() {
	$('.date_table td a:not(.closed)').off();
	$('.date_table td a:not(.closed)').click(function(){
		var year = $('.date_year span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
		$('.date_table td a').removeClass('selected');
		$(this).addClass('selected');
		if(str < 10){
			$('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
		}else{
			$('.date_sel').prev('.sel').children('span').text(year + '.' + str);
		}

	});
	
	$('.f_step02 ul li a').off('click');
	$('.f_step02 ul li a').click(function(event) {
		$('.staff02 ul li a').removeClass('active');
		$(this).addClass('active');
		build();
	});
}

function fnPop(){
	var ID = $( 'input#DID' ).val();
	if(ID === "") {
		ID = 'AA00011';
	} 
	fnDrDetail(ID);
}

function moveToReservation() {
	if(document.getElementById('DPT_CD').value == 'AO') {
		alert('안티에이징·비만센터는 전화예약만 가능합니다 (1577-7502)');
		return;
	} else if(document.getElementById('DPT_CD').value == 'GY') {
		alert('부인과 진료는 전화예약만 가능합니다 (1577-7502)');
	} else {
		document.reservationForm.submit();
	}
}
</script>