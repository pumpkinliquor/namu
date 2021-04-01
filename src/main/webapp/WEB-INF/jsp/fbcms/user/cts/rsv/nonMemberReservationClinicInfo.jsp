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
				<li class="end"><span>완료</span>진료대상자 정보입력</li>
				<li class="selected">진료정보 입력</li>
				<li>예약완료</li>
			</ul>

			<div class="box_blue">
				<ul>
					<li>진료 예약 및 변경은 2일 전까지 가능합니다</li>
					<li>진료 신청일로부터 2일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
					<li><span>문의전화</span>1577-7502</li>
				</ul>
			</div>

			<ul class="tab_list"><!-- tab -->
				<li class="selected" onclick="javascript:fnTapChange(1);"><a href="#none" title="선택된 탭">진료과 선택</a></li>
				<li onclick="javascript:fnTapChange(2);"><a href="#none">의료진 선택</a></li>
			</ul>

			<section class="tab_box" style="display:block"><!-- //tab contents1 s -->
				<div class="re_select">
					<div class="list_sel">
						<section class="dep">
							<header>01. 진료과 선택</header>
							<ul class="s00">
							<c:forEach items="${mediSbjList}" var="list" varStatus="status">
								<li><a href="javascript:getDrList('${list.MEDI_SBJ_CD}')" id="md${list.MEDI_SBJ_CD}">${list.MEDI_SBJ_NM}</a></li>
							</c:forEach>
							</ul>
						</section>
						<section class="staff">
							<header>02. 의료진 선택</header>
							<ul class="s01"></ul>
						</section>
					</div>

					<div class="date_sel">
						<header>03. 날짜 선택</header>
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
							<header>04. 예약시간 선택</header>
							<select id="rTime" title="예약시간 선택">
								<option value="">선택하세요</option>
							</select>
						</section>

						<section class="info">
							<header>예약정보</header>
							<dl>
								<dt>이름</dt>
								<dd id="rsvNm">${patientInfo.usrNm}</dd>
								<dt>진료과</dt>
								<dd id="rsvSbjNm"></dd>
								<dt>의료진</dt>
								<dd id="rsvDrNm"></dd>
								<dt>예약일시</dt>
								<dd id="rsvExDt"></dd>
							</dl>
						</section>
						<div class="btn_re">
							<a href="javascript:formSubmit();" class="btn breservation">예약</a>
							<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationMain.do');" class="btn bgreen">취소</a>
						</div>
					</div>
				</div>

			</section><!-- //tab contents1 e -->

			<section class="tab_box"><!-- tab contents2 s -->
				<div class="re_select">
					<div class="list_sel">
						<section class="staff staff02">
							<header>01. 의료진 선택</header>
							<ul class="s02">
							<c:forEach items="${mediDrList}" var="list" varStatus="status">
								<li>
									<img src="<c:url value='/getImage/${list.MOBILE_IMG_ATCH_NO}'/>" >
									<strong>${list.DR_NM}</strong>
									<span>${list.MEDI_SBJ_NM}</span>
									<%-- <span>${list.FIELD_CT}</span> --%>
									<a href="javascript:getDrCalendarList2('${list.MEDI_SBJ_CD}', '${list.DR_ID}', '${list.DR_NM}', '${list.MEDI_SBJ_NM}')"></a>
								</li>
							</c:forEach>
							</ul>
						</section>
					</div>

					<div class="date_sel">
						<header>02. 날짜 선택</header>
						<div class="date_year">
							<a href="javascript:prevm2();" id="prev">이전 년도로 이동</a>
							<span id="yearmonth2"></span>
							<a href="javascript:nextm2();" id="next">다음 년도로 이동</a>
						</div>
						<p><a href="javascript:void(0);" class="am">오전</a><a href="javascript:void(0);" class="pm">오후</a></p>

						<div class="date_table">
							<table id="calendar2">
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
								<tbody id="calendarBody2">
								</tbody>
							</table>
						</div>

					</div>

					<div class="time_sel">
					
					
					
						<section class="time">
							<header>04. 예약시간 선택</header>
							<select id="rTime2" title="예약시간 선택">
								<option value="">선택하세요</option>
							</select>
						</section>

						<section class="info">
							<header>예약정보</header>
							<dl>
								<dt>이름</dt>
								<dd id="rsvNm2">${patientInfo.usrNm}</dd>
								<dt>진료과</dt>
								<dd id="rsvSbjNm2"></dd>
								<dt>의료진</dt>
								<dd id="rsvDrNm2"></dd>
								<dt>예약일시</dt>
								<dd id="rsvExDt2"></dd>
							</dl>
						</section>
						<div class="btn_re">
							<a href="javascript:formSubmit();" class="btn breservation">예약</a>
							<a href="javascript:fnGetProcess('/user/cts/rsv/nonMemberReservationMain.do');" class="btn bgreen">취소</a>
						</div>
					</div>
				</div>
			</section><!-- //tab contents2 e -->

		</div>
		<!-- //contents e -->
<input type="hidden" id="tabIdx" name="tabIdx" value="0">
<form method="post" action="" id="reservationForm" name="reservationForm">
	<input type="hidden" id="APPO_PRSN_NM" name="APPO_PRSN_NM" value="${appointmentVO.APPO_PRSN_NM}">
	<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO" value="${appointmentVO.MOBILE_PHONE_NO}">
	<input type="hidden" id="BIRTH_DT" name="BIRTH_DT" value="${appointmentVO.BIRTH_DT}">
	<input type="hidden" id="GENDER_CD" name="GENDER_CD" value="${appointmentVO.GENDER_CD}">
	<input type="hidden" id="DPT_CD" name="DPT_CD" value="${formData.DPT_CD}">
	<input type="hidden" id="DR_ID" name="DR_ID" value="${formData.DR_ID}">
	<input type="hidden" id="DR_NM" name="DR_NM" value="${formData.DR_NM}">
	<input type="hidden" id="RSV_DT" name="RSV_DT" value="${formData.RSV_DT}">
	<input type="hidden" id="RSV_TM" name="RSV_TM" value="${formData.RSV_TM}">
	<input type="hidden" id="MEDI_SBJ_CD" name="MEDI_SBJ_CD" value="${formData.MEDI_SBJ_CD}">
	<input type="hidden" id="MEDI_SBJ_NM" name="MEDI_SBJ_NM" value="${formData.MEDI_SBJ_NM}">
	<input type="hidden" id="PID" name="PID" value="${patientInfo.PID}">
	<input type="hidden" id="usrNm" name="usrNm" value="${patientInfo.usrNm}">
	<input type="hidden" id="usrBd" name="usrBd" value="${patientInfo.usrBd}">
	<input type="hidden" id="fCtn" name="fCtn" value="${patientInfo.fCtn}">
	<input type="hidden" id="mCtn" name="mCtn" value="${patientInfo.mCtn}">
	<input type="hidden" id="lCtn" name="lCtn" value="${patientInfo.lCtn}">
	<input type="hidden" id="fTel" name="fTel" value="${patientInfo.fTel}">
	<input type="hidden" id="mTel" name="mTel" value="${patientInfo.mTel}">
	<input type="hidden" id="lTel" name="lTel" value="${patientInfo.lTel}">
	<input type="hidden" id="gender" name="gender" value="${patientInfo.gender}">
	<input type="hidden" name="APPO_RLT_CD" id="APPO_RLT_CD" value="${patientInfo.APPO_RLT_CD}">
</form>
		
		
<script type="text/javascript">
var firstLoad = true;
// 스크롤
	$(function() {
		if('${alertMsg}'.length > 1) {
			alert('${alertMsg} 처음 화면으로 이동합니다');
			location.replace("/user/cts/rsv/nonMemberReservationClinic.do");
		}
		
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s00").mCustomScrollbar({theme:"minimal-dark"});
		$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		$(".s02").mCustomScrollbar({theme:"minimal-dark"});
		
		build();
		build2();
		rstEvt();
	
		if($('#DPT_CD').val() != '') {
			//md+아이디
			$('#md${formData.DPT_CD}').trigger('click');
			getDrList('${formData.DPT_CD}');
		}
	});

	function rstEvt() {
		// 진료과 선택
		$('.dep ul li a').off();
		$('.dep ul li a').click(function(event) {
			
			$('.dep ul li a').removeClass('active');
			$(this).addClass('active');
			
			$('#DPT_CD').val('');
			$('#DR_ID').val('');
			$('#RSV_DT').val('');
			$('#rsvDrNm').text('');
			$('#rsvExDt').text('');
			$('#rsvDrNm2').text('');
			$('#rsvExDt2').text('');
			$('#rsvSbjNm').text($(this).text());
			$('#rsvSbjNm2').text($(this).text());
			$('#MEDI_SBJ_NM').val($(this).text());
			clearOption('rTime');
			clearOption('rTime2');
			build();
			build2();
			$(".s01").mCustomScrollbar({theme:"minimal-dark"});
			
		});
		//의료진 선택
		$('.s01 li a').off();
		$('.s01 li a').click(function(event) {
			$('.staff ul li a').removeClass('active');
			$(this).addClass('active');
			clearOption('rTime');
			build();
		});
		$('.staff02 ul li a').off();
		$('.staff02 ul li a').click(function(event) {
			$('.staff02 ul li a').removeClass('active');
			$(this).addClass('active');
			clearOption('rTime2');
			build2();
		});
		//날짜 선택
		$('.date_table a:not(.closed)').off();
		$('.date_table a:not(.closed)').click(function(event) {
			$('.date_table a').removeClass('active');
			$(this).addClass('active');
			let DPT_CD = $('#DPT_CD').val();
			let DR_ID = $('#DR_ID').val();
			let RSV_DT = event.currentTarget.id;
			if(RSV_DT.length == 10) {
				RSV_DT = RSV_DT.replace('_2', '');
				getSchedule2(DPT_CD, DR_ID, RSV_DT);
			} else {
				getSchedule(DPT_CD, DR_ID, RSV_DT);
			}
		});
		//시간 선택
		$('#rTime').off();
		$('#rTime').change(function(event) {
			$('#rsvExDt').text('');
			$('#rsvExDt').html($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+'<br>'+ $('#rTime :selected').text());
			$('#RSV_TM').val($('#rTime :selected').val());
		});
		//시간 선택
		$('#rTime2').off();
		$('#rTime2').change(function(event) {
			$('#rsvExDt2').text('');
			$('#rsvExDt2').html($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+'<br>'+ $('#rTime2 :selected').text());
			$('#RSV_TM').val($('#rTime2 :selected').val());
		});
	}

	function numberPad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	var today = new Date('${today}');
	var date = new Date();

	function prevm() {
		clearOption('rTime');
		$('#RSV_DT').val('');
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		build();
		if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#rsvDrNm').text() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#rsvDrNm').text() != undefined) {
			getCalendar($('#DPT_CD').val(), $('#DR_ID').val(), $('#rsvDrNm').text());
		}
	}

	function nextm() {
		clearOption('rTime');
		$('#RSV_DT').val('');
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		build();
		if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#rsvDrNm').text() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#rsvDrNm').text() != undefined) {
			getCalendar($('#DPT_CD').val(), $('#DR_ID').val(), $('#rsvDrNm').text());
		}
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
	}
	
	var today2 = new Date('${today}');
	var date2 = new Date();
	function prevm2() {
		clearOption('rTime2');
		today2 = new Date(today2.getFullYear(), today2.getMonth() - 1, today2.getDate());
		build2();
		if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#DR_NM').val() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#DR_NM').val() != undefined) {
			getDrCalendarList2($('#DPT_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
		}
	}

	function nextm2() {
		clearOption('rTime2');
		$('#RSV_DT').val('');
		today2 = new Date(today2.getFullYear(), today2.getMonth() + 1, today2.getDate());
		build2();
		if($('#DPT_CD').val() != '' && $('#DR_ID').val() != '' && $('#DR_NM').val() != '' && $('#DPT_CD').val() != undefined && $('#DR_ID').val() != undefined && $('#DR_NM').val() != undefined) {
			getDrCalendarList2($('#DPT_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
		}
	}

	function build2() {
		var nMonth = new Date(today2.getFullYear(), today2.getMonth(), 1);
		var lastdate2 = new Date(today2.getFullYear(), today2.getMonth() + 1, 0);
		var tbca2 = document.getElementById("calendarBody2");
		var yearmonth2 = document.getElementById("yearmonth2");
		yearmonth2.innerHTML = today2.getFullYear() + "." + numberPad(today2.getMonth() + 1, 2);

		if (today2.getMonth() + 1 == 12) { //  눌렀을 때 월이 넘어가는 곳
			prev.innerHTML = (today2.getMonth()) + "월";
			next.innerHTML = "1월";
		} else if (today2.getMonth() + 1 == 1) { //  1월 일 때
			prev.innerHTML = "12월";
			next.innerHTML = (today2.getMonth() + 2) + "월";
		} else { //   12월 일 때
			prev.innerHTML = (today2.getMonth()) + "월";
			next.innerHTML = (today2.getMonth() + 2) + "월";
		}

		// 남은 테이블 줄 삭제
		while (tbca2.rows.length > 0) {
			tbca2.deleteRow(tbca2.rows.length - 1);
		}

		var row = null;
		row = tbca2.insertRow();
		var cnt = 0;

		// 1일 시작칸 찾기
		for (i = 0; i < nMonth.getDay(); i++) {
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
			}
			cnt = cnt + 1;
		}

		// 달력 출력
		for (i = 1; i <= lastdate2.getDate(); i++) { // 1일부터 마지막 일까지
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
				cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today2.getFullYear()+numberPad(today2.getMonth()+1, 2)+numberPad(i, 2)+'_2"></a>';
				cnt = cnt + 1;
				if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
					row = calendar2.insertRow();// 줄 추가
				}
				if (today2.getFullYear() == today2.getFullYear() && today2.getMonth() == today2.getMonth() && i == today2.getDate()) {
					cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today2.getFullYear()+numberPad(today2.getMonth()+1, 2)+numberPad(i, 2)+'_2"></a>';
				}
			} else {
				cnt = cnt + 1;
			}
			if(i == lastdate2.getDate()) {
				var endLine = 7 - (cnt % 7);
				if(endLine < 6) {
					for (var j = 0; j < endLine; j++) {
						cell = row.insertCell();
					}
				}
				
			}
		}
	}
	
	
	

function clearOption(selId) {
	$('#'+selId).empty();
	$('#'+selId).append('<option value="">선택하세요</option>');
}
function addOption(selId, optVal, txt) {
	$('#'+selId).append('<option value="'+optVal+'">'+txt+'</option>');
}

/* 의료진 리스트 ajax */
function getDrList(MEDI_SBJ_CD) {
	$('#DPT_CD').val(MEDI_SBJ_CD);
	$('#MEDI_SBJ_CD').val(MEDI_SBJ_CD);
	var object = {
		url : "/user/cts/rsv/getDrList.do",
		data : {
			"MEDI_SBJ_CD" : MEDI_SBJ_CD
		},
		fnSuccess : function(data) {
			
			$('.s01 li').remove();
			var li = '';
			$.each(data, function(index, value) {
					li += '<li>';
					li += "<img src=<c:url value='/getImage/"+value.mobile_IMG_ATCH_NO+"'/> class='mCS_img_loaded' >";
					li += '<strong>'+value.dr_NM+'</strong>';
					li += '<span>'+value.field_CT+'</span>';
					li += '<a href="javascript:getCalendar(\''+MEDI_SBJ_CD+'\',\''+value.dr_ID+'\',\''+value.dr_NM+'\')" id="dr'+value.dr_ID+'"></a>';
					li += '</li>';
			});
			$('.s01 .mCSB_container').append(li);
			rstEvt();
			if(firstLoad) {
				firstLoad = false;
				$('#dr${formData.DR_ID}').trigger('click');
				getCalendar('${formData.DPT_CD}', '${formData.DR_ID}', '${formData.DR_NM}');
				
			}
		}
	};
	fnAjax(object);
}
function getCalendar(DPT_CD, DR_ID, DR_NM) {
	$('#DR_ID').val(DR_ID);
	$('#DR_NM').val(DR_NM);
	$('#DPT_CD').val(DPT_CD);
	$('#rsvDrNm').text(DR_NM);
	$('#rsvExDt').text('');
	var RSV_DT = today.getFullYear() + numberPad(today.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendar.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A' && value.r1_AVL > 0) {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A' && value.r2_AVL > 0) {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A' && value.r1_AVL > 0 && value.r2_AVL > 0) {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT).removeClass('closed');
				$('#'+value.rsv_DT).addClass(fgClass);
				
				$('#'+value.rsv_DT).prop('onclick', 'getSchedule("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT+'")');
				$('#'+value.rsv_DT).html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}
function getCalendar2(DPT_CD, DR_ID, DR_NM) {
	$('#DR_ID').val(DR_ID);
	$('#DR_NM').val(DR_NM);
	$('#DPT_CD').val(DPT_CD);
	$('#rsvDrNm').text(DR_NM);
	$('#rsvExDt').text('');
	var RSV_DT = today2.getFullYear() + numberPad(today2.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendar.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A' && value.r1_AVL > 0) {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A' && value.r2_AVL > 0) {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A' && value.r1_AVL > 0 && value.r2_AVL > 0) {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT+'_2').removeClass('closed');
				$('#'+value.rsv_DT+'_2').addClass(fgClass);
				$('#'+value.rsv_DT+'_2').prop('onclick', 'getDrCalendarList2("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT+'", "'+$('#MEDI_SBJ_NM').val()+'")');
				$('#'+value.rsv_DT+'_2').html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}
function getDrCalendarList2(DPT_CD, DR_ID, DR_NM, FIELD_CT) {
	$('#DR_ID').val(DR_ID);
	$('#MEDI_SBJ_CD').val(DPT_CD);
	$('#DR_NM').val(DR_NM);
	$('#DPT_CD').val(DPT_CD);
	$('#rsvDrNm2').text(DR_NM);
	$('#rsvSbjNm2').text(FIELD_CT);
	$('#MEDI_SBJ_NM').val(FIELD_CT);
	$('#rsvExDt2').text('');
	var RSV_DT = today2.getFullYear() + numberPad(today2.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendar.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A' && value.r1_AVL > 0) {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A' && value.r2_AVL > 0) {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A' && value.r1_AVL > 0 && value.r2_AVL > 0) {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT+"_2").removeClass('closed');
				$('#'+value.rsv_DT+"_2").addClass(fgClass);
				
				$('#'+value.rsv_DT+"_2").prop('onclick', 'getSchedule2("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT.replace('_2', '')+'")');
				$('#'+value.rsv_DT+"_2").html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}
function getSchedule(DPT_CD, DR_ID, RSV_DT) {
	$('#DR_ID').val(DR_ID);
	$('#DPT_CD').val(DPT_CD);
	$('#RSV_DT').val(RSV_DT);
	var object = {
		url : "/user/cts/rsv/getSchedule.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			clearOption('rTime')
			var tmp = "";
			if(data != null && data.length > 0){
				$.each(data, function(index, value) {
					tmp += '<option value="'+ value.rsv_HR+value.rsv_MN+'">'+value.rsv_HR+':'+value.rsv_MN+'</option>';
				});
				$('#rTime option:eq(0)').after(tmp);
			}
			rstEvt();
		}
	};
	fnAjax(object);
}
function getSchedule2(DPT_CD, DR_ID, RSV_DT) { 
	$('#DR_ID').val(DR_ID);
	$('#DPT_CD').val(DPT_CD);
	RSV_DT = RSV_DT.replace('/_2/gi', '');
	$('#RSV_DT').val(RSV_DT); 
	var object = {
		url : "/user/cts/rsv/getSchedule.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {  
			clearOption('rTime2')
			var tmp = "";
			if(data != null && data.length > 0){
				$.each(data, function(index, value) {
					tmp += '<option value="'+ value.rsv_HR+value.rsv_MN+'">'+value.rsv_HR+':'+value.rsv_MN+'</option>';
				});
				$('#rTime2 option:eq(0)').after(tmp);
			}
			rstEvt();
		}
	}; 
	fnAjax(object);
}
function fnTapChange(tabIdx) {
	$('#tabIdx').val(tabIdx);
	$('*').removeClass('active');
	$('#DPT_CD').val('');
	$('#MEDI_SBJ_CD').val('');
	$('#MEDI_SBJ_NM').val('');
	$('#DR_ID').val('');
	$('#DR_NM').val('');
	$('#RSV_DT').val('');
	$('#RSV_TM').val('');
	$('#rsvDrNm').text('');
	$('#rsvSbjNm').text('');
	$('#rsvExDt').text('');
	$('#rsvDrNm2').text('');
	$('#rsvSbjNm2').text('');
	$('#rsvExDt2').text('');
}
/*전송*/
function formSubmit() {

	/*Valiidation Check*/
	if($('#tabIdx').val() == 1 && ($('#DPT_CD').val() === '' || $('#MEDI_SBJ_CD').val() === '')) {
		alert('진료과를 선택해 주시기 바랍니다.');
		$('#MEDI_SBJ_CD').focus();
		return;
	}
	if($('#DR_ID').val() === '') {
		alert('의료진을 선택하여 주시기 바랍니다.');
		$('#DR_ID').focus();
		return;
	}
	if($('#RSV_DT').val() === '') {
		alert('진료날짜를 선택하여 주시기 바랍니다.');
		return;
	}
	if($('#RSV_TM').val() === ''){
		alert('진료시간을 선택하여 주시기 바랍니다.');
		$('#RSV_TM').focus();
		return;
	}
	if($('#PID').val() === '' || $('#usrNm').val() === '' || $('#fCtn').val() === '' || $('#mCtn').val() === '' || $('#lCtn').val() === '' || $('#gender').val() === '') {
		alert('로그인정보가 유효하지 않습니다.');
		location.replace("/user/cts/rsv/nonMemberReservationClinic.do");
		return;
	}
	$('#RSV_DT').val($('#RSV_DT').val().replace('/_2/gi', ''));
	document.reservationForm.action = "/user/cts/rsv/nonMemberReservationClinicSuccess.do";
	document.reservationForm.submit();
}

function fnGetProcess(usrId){
	document.reservationForm.action = usrId;
	document.reservationForm.submit();
}
</script>