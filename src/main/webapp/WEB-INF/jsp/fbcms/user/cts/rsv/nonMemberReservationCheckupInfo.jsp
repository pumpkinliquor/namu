<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>
		<!-- contents s -->
		<div class="contents w1200">

			<ul class="step reser_step"><!-- 진행 스텝 -->
				<li class="end"><span>완료</span>검진대상자 정보입력</li>
				<li class="selected">검진정보 입력</li>
				<li>예약완료</li>
			</ul>

			<div class="box_blue">
				<ul>
					<li>검진 예약 및 변경은 5일 전까지 가능합니다</li>
					<li>검진 신청일로부터 5일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
					<li><span>문의전화</span>1577-7502</li>
				</ul>
			</div>

			<div class="re_select">
				<div class="list_sel">
					<section class="dep">
						<header>01. 검진 프로그램 선택</header>
						<ul class="s01">
							<c:forEach items="${exmnList}" var="item" varStatus="status">
							<li>
								<a href="javascript:nextCal('${item.DTIL_CD}', '${item.DTIL_CODE_NM}');">${item.DTIL_CODE_NM}</a>
							</li>
							</c:forEach>
						</ul>
					</section>
				</div>

				<div class="date_sel">
					<header>02. 날짜 선택</header>
					<div class="date_year">
						<a href="javascript:prevm();" id="prev">이전 년도로 이동</a>
						<span id="yearmonth"></span>
						<a href="javascript:nextm();" id="next">다음 년도로 이동</a>
					</div>
					<p><a href="javascript:void(0);" class="am">오전</a><a href="javascript:void(0);" class="pm">오후</a></p>

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
					
				</div>

				<div class="time_sel">
					<section class="time">
						<header>03. 예약시간 선택</header>
						<select name="rTime" id="rTime" title="예약시간 선택" disabled="disabled">
								<option value="0000" selected="selected">00:00</option>
								<%--
								2020.12.18 현업 요청으로 00:00으로만 남겨둠
								
								<option value="0900">09:00</option>
								<option value="1000">10:00</option>
								<option value="1100">11:00</option>
								<option value="1200">12:00</option>
								<option value="1300">13:00</option>
								<option value="1400">14:00</option>
								<option value="1500">15:00</option>
								<option value="1600">16:00</option>
								<option value="1700">17:00</option>
								<option value="1800">18:00</option>
								 --%>
						</select>
					</section>

					<section class="info">
						<form method="post" action="" id="reservationForm" name="reservationForm">
							<header>예약정보</header>
							<dl>
								<dt>이름</dt>
								<dd name="usrName" id="usrName">${userCheckupVO.usrNm}</dd>
								<dt>검진프로그램</dt>
								<dd id="DTIL_CODE_NM"></dd>
								<dt>예약일시</dt>
								<dd id="PRT_TIME"></dd>
								<input type="hidden" id="APPO_PRSN_NM" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
								<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
								<input type="hidden" id="BIRTH_DT" name="BIRTH_DT" value="${appointmentVO.BIRTH_DT}">
								<input type="hidden" id="GENDER_CD" name="GENDER_CD" value="${appointmentVO.GENDER_CD}">
								<input type="hidden" name="usrNm" id="usrNm" value="${userCheckupVO.usrNm}">
								<input type="hidden" name="usrBd" id="usrBd" value="${userCheckupVO.usrBd}">
								<input type="hidden" name="USER_ID" id="USER_ID" value="${userCheckupVO.USER_ID}">
								<input type="hidden" name="APPO_RLT_CD" id="APPO_RLT_CD" value="${userCheckupVO.APPO_RLT_CD}">
								<input type="hidden" name="DTIL_CD" id="DTIL_CD">
								<input type="hidden" name="DTIL_NM" id="DTIL_NM">
								<input type="hidden" name="RSVDT" id="RSVDT">
								<input type="hidden" name="RSVTM" id="RSVTM" value="0000">
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
						</form>
					</section>
					<div class="btn_re">
						<a href="javascript:formSubmit();" class="btn breservation">예약</a>
						<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationCheckup.do');" class="btn bgreen">취소</a>
					</div>
				</div>
			</div>

		</div>
		<!-- //contents e -->

<script type="text/javascript">
var isSend = false;
	// 스크롤
	$(function() {
	
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		
		// 진료과 선택
		$('.dep ul li a').click(function(event) {
			$('.dep ul li a').removeClass('active');
			$(this).addClass('active');
		});
		
		$('#rTime').change(function() {
			$('#PRT_TIME').html($('#RSVDT').val().substring(0,4)+'.'+$('#RSVDT').val().substring(4,6)+'.'+$('#RSVDT').val().substring(6,8)+'<br>'+ $('#rTime :selected').text());
			$('#RSVTM').val($('#rTime').val());
		});
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
					//cell.classList.add('active'); //오늘날짜배경색
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
		$('.date_table a').removeClass('active');
		$(this).addClass('active');
		$('#RSVDT').val(event.target.id);
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
	$("#DTIL_CODE_NM").text("");
	$("#DTIL_CODE_NM").text(DTIL_CODE_NM);
	$("#DTIL_CD").val(DTIL_CD);
	$("#DTIL_NM").val(DTIL_CODE_NM);
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
	document.reservationForm.action = "<c:url value='/user/cts/rsv/nonMemberReservationCheckupSuccess.do'/>";
	if(!isSend) {
		document.reservationForm.submit();
		isSend = true;
	} else {
		alert('예약 처리중 입니다 잠시만 기다려 주시기 바랍니다');
	}
}

function fnGetProcess(usrId){
	document.reservationForm.action = usrId;
	document.reservationForm.submit();
}
</script>