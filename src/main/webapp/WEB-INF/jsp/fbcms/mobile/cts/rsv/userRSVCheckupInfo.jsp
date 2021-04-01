<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script src="/js/fbcms/mobile/slick.js"></script>
		<!-- contents s -->
		<div class="contents">
		<h4 class="con_in_tit04 mar20">검진예약하기</h4>
		<p class="con_in_txt mar20">온라인 예약을 이용하시는 경우, <span class="c_gray3 fw_500">저희 상담간호사가 확인전화를 드려 예약확정</span> 및 주의사항 안내를 도와드리겠습니다 </p>

		<p class="step mar20 mt30">
			<span class="fl c_point">검진 정보 입력</span>
			<span class="fr"><strong class=" c_point">STEP 02</strong> / 03</span>
		</p>

		<div class="box_blue mar20">
			<ul>
				<li>검진 예약 및 변경은 5일 전까지 가능합니다</li>
				<li>검진 신청일로부터 5일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
				<li><span>문의전화</span><a href="tel:1577-7502">1577-7502</a></li>
			</ul>
		</div>

			<div class="f_step">
				<p class="sel">검진 프로그램 선택<span></span></p>
					<ul class="f_step01 overflowY">
						<c:forEach items="${exmnList}" var="item" varStatus="status">
						<li onclick="javascript:nextCal('${item.DTIL_CD}', '${item.DTIL_CODE_NM}');">
							<a href="#none">${item.DTIL_CODE_NM}</a>
						</li>
						</c:forEach>
					</ul>	
			</div>

			<div class="f_step"><!-- 날짜 선택 -->
				<p class="sel">날짜 선택<span id="selDate"></span></p>
				<div class="date_sel f_step03">
					<div class="date_year mb10">
						<a href="javascript:prevm();" id="prev">이전 년도로 이동</a>
						<span id="yearmonth"></span>
						<a href="javascript:nextm();" id="next">다음 년도로 이동</a>
					</div>

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
					<p class="date_desc">* 진료 외의 시간에는 수술/검사 등을 진행합니다</p>
				</div>
			</div>	

				<%--
				// 2020.12.18 - 현업요청 시간 삭제
				<div class="f_step">
					<p class="sel">예약시간 선택<span></span></p>
					<ul class="f_step01" title="예약시간 선택">
						<li onclick="javascript:fnTimeSet('0900');"><a href="#none">09:00</a></li>
						<li onclick="javascript:fnTimeSet('1000');"><a href="#none">10:00</a></li>
						<li onclick="javascript:fnTimeSet('1100');"><a href="#none">11:00</a></li>
						<li onclick="javascript:fnTimeSet('1200');"><a href="#none">12:00</a></li>
						<li onclick="javascript:fnTimeSet('1300');"><a href="#none">13:00</a></li>
						<li onclick="javascript:fnTimeSet('1400');"><a href="#none">14:00</a></li>
						<li onclick="javascript:fnTimeSet('1500');"><a href="#none">15:00</a></li>
						<li onclick="javascript:fnTimeSet('1600');"><a href="#none">16:00</a></li>
						<li onclick="javascript:fnTimeSet('1700');"><a href="#none">17:00</a></li>
						<li onclick="javascript:fnTimeSet('1800');"><a href="#none">18:00</a></li>
					</ul>
				</div>	
				 --%>

				<section class="info">	
				<form method="post" action="" id="reservationForm" name="reservationForm">
					<div class="f_step"><!-- 예약정보 확인 -->
						<p class="sel">예약정보 확인<span></span></p>
						<dl class="f_step05">
							<dt>이름</dt>
							<dd name="usrName" id="usrName">${userCheckupVO.usrNm}</dd>
							<dt>검진프로그램</dt>
							<dd id="DTIL_CODE_NM"></dd>
							<dt>예약일시</dt>
							<dd id="PRT_TIME"></dd>
					
							<input type="hidden" name="usrNm" id="usrNm" value="${userCheckupVO.usrNm}">
							<input type="hidden" name="usrBd" id="usrBd" value="${userCheckupVO.usrBd}">
							<input type="hidden" name="USER_ID" id="USER_ID" value="${userInfo.id}">
							<input type="hidden" name="APPO_RLT_CD" id="APPO_RLT_CD" value="${userCheckupVO.APPO_RLT_CD}">
							<input type="hidden" name="DTIL_CD" id="DTIL_CD">
							<input type="hidden" name="DTIL_NM" id="DTIL_NM">
							<input type="hidden" name="RSVDT" id="RSVDT">
							<input type="hidden" name="RSVTM" id="RSVTM" value="0000">
							<input type="hidden" name="rTime" id="rTime">
							<input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="${userCheckupVO.EMAIL_ID}">
							<input type="hidden" name="content" id="content" value="${userCheckupVO.content}">
							<input type="hidden" name="reservation" id="reservation" value="${userCheckupVO.reservation}">
							<input type="hidden" name="gender" id="gender" value="${userCheckupVO.gender}">
							<input type="hidden" name="fCtn" id="fCtn" value="${userCheckupVO.fCtn}">
							<input type="hidden" name="mCtn" id="mCtn" value="${userCheckupVO.mCtn}">
							<input type="hidden" name="lCtn" id="lCtn" value="${userCheckupVO.lCtn}">
							<input type="hidden" name="fTel" id="fTel" value="${userCheckupVO.fTel}">
							<input type="hidden" name="mTel" id="mTel" value="${userCheckupVO.mTel}">
							<input type="hidden" name="lTel" id="lTel" value="${userCheckupVO.lTel}">
							<input type="hidden" name="POST_NO" id="POST_NO" value="${userCheckupVO.POST_NO}">
							<input type="hidden" name="ADDR_TX" id="ADDR_TX" value="${userCheckupVO.ADDR_TX}">
							<input type="hidden" name="ADDR_DTIL_TX" id="ADDR_DTIL_TX" value="${userCheckupVO.ADDR_DTIL_TX}">
										
						</dl>
					</div>	
				</form>
				</section>
				<div class="btn_Lbox">
					<a href="/user/cts/rsv/userRSVCheckup.do" class="btn btn02 bgreen">이전</a>
					<a href="javascript:formSubmit();" class="btn btn02 breservation">예약</a>
				</div>
		</div>
		<!-- //contents e -->

<script type="text/javascript">
var isSend = false;
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
	
	//검진 프로그램 선택
	$('.f_step01 li').click(function(){
		var txt = $(this).children('a').text();
		$(this).parents('ul').prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
		//$(this).parents('ul').slideUp();
	});
	
	//날짜선택
	$('.date_table td a:not(.closed)').off();
	$('.date_table td a:not(.closed)').click(function(){
		var year = $(this).closest('.date_table').prev.prev('.date_year').children('span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
		$('.date_table td a').removeClass('selected');
		$(this).addClass('selected');
		if(str < 10){
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
		}else{
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.' + str);
		}
	
	});
	


	// 스크롤
	$(function() {
	
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		
		
		build();
	});

	function numberPad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}

	var today = new Date('${today}');
	var date = new Date();
	var qryYm = '00000000'; 

	function prevm() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		build();
	}

	function nextm() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		build();
	}

	function build() {
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		var tbcal = document.getElementById("calendarBody");
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
		while (tbcal.rows.length > 0) {
			tbcal.deleteRow(tbcal.rows.length - 1);
		}

		var row = null;
		row = tbcal.insertRow();
		var cnt = 0;

		// 1일 시작칸 찾기
		for (i = 0; i < nMonth.getDay(); i++) {
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
			}
			cnt = cnt + 1;
		}
		
		//쿼리용 달력 날짜 선택
		qryYm = today.getFullYear()+numberPad(today.getMonth()+1, 2);

		// 달력 출력
		for (i = 1; i <= lastDate.getDate(); i++) { // 1일부터 마지막 일까지
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
			if(i == lastDate.getDate()) {
				var endLine = 7 - (cnt % 7);
				if(endLine < 6) {
					for (var j = 0; j < endLine; j++) {
						cell = row.insertCell();
					}
				}
				
			}
		}
		selectCalendar(qryYm);
	}

function rstEvent() {
	//날짜 선택
	$('.date_table a:not(.closed)').click(function(event) {
		$('.date_table a').removeClass('selected');
		$(this).addClass('selected');
		$('#RSVDT').val(event.target.id);
		$('#RSVTM').val($('#rTime').val());

		$('#selDate').html($('#RSVDT').val().substring(0,4)+'.'+$('#RSVDT').val().substring(4,6)+'.'+$('#RSVDT').val().substring(6,8));
		$('#PRT_TIME').html($('#RSVDT').val().substring(0,4)+'.'+$('#RSVDT').val().substring(4,6)+'.'+$('#RSVDT').val().substring(6,8));
	});
}
function clearOption(selId) {
	$('#'+selId).empty();
	$('#'+selId).append('<option value="">선택하세요</option>');
}
function addOption(selId, optVal, txt) {
	$('#'+selId).append('<option value="'+optVal+'">'+txt+'</option>');
}

function nextCal(DTIL_CD, DTIL_CODE_NM) {	
	if($("#DTIL_NM").val() == ""){
		$("#DTIL_NM").val("&nbsp;")
	}
	$("#DTIL_CD").val(DTIL_CD);
	$("#DTIL_NM").val(DTIL_CODE_NM);
	$("#DTIL_CODE_NM").html("");
	$("#DTIL_CODE_NM").html($("#DTIL_NM").val());
}
function selectCalendar(yearMonth) {
	var object = {
		url : "/user/cts/rsv/selectCheckupCalendar.do",
		data : {
			"RSVDT" : yearMonth
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if(value.posb_YN === 'Y') {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.appo_SCHE_DT).removeClass('closed');
				$('#'+value.appo_SCHE_DT).addClass(fgClass);
				
				$('#'+value.appo_SCHE_DT).prop('onclick', 'changeTime("'+value.appo_SCHE_DT+'")');
				$('#'+value.appo_SCHE_DT).html(fgText);
			});
			rstEvent();
		}
	};
	fnAjax(object);
}

/*전송*/
function formSubmit() {

	/*Valiidation Check*/
	
	/*이름체크*/
	if($('#DTIL_CD').val() == '') {
		alert('검진프로그램을 선택해 주시기 바랍니다.');
		return false;
	}
	if($('#RSVDT').val() == '') {
		alert('검진희망일을 선택해 주시기 바랍니다.');
		return false;
	}
	// 2020.12.18 - 현업요청 시간 밸리데이션 삭제
// 	if($('#RSVTM').val() == '') {
// 		alert('검진희망시간을 선택해 주시기 바랍니다.');
// 		return false;
// 	}
	document.reservationForm.action = "<c:url value='/user/cts/rsv/userRSVCheckupSuccess.do'/>";
	if(!isSend) {
		document.reservationForm.submit();
		isSend = true;
	} else {
		alert('예약 처리중 입니다 잠시만 기다려 주시기 바랍니다');
	}
}

function fnTimeSet(RSVTM) {
	$('#rTime').val(RSVTM);
	$('#RSVTM').val($('#rTime').val());
	$('#PRT_TIME').html($('#RSVDT').val().substring(0,4)+'.'+$('#RSVDT').val().substring(4,6)+'.'+$('#RSVDT').val().substring(6,8)+' '+ ($('#RSVTM').val().substring(0,2)+':'+$('#RSVTM').val().substring(2,4)));
}
</script>