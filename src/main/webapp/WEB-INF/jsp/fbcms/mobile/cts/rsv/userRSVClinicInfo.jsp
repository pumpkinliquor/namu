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
		<div class="contents">
			<h4 class="con_in_tit04 mar20">진료예약하기</h4>
			<p class="con_in_txt mar20">온라인 예약을 이용하시는 경우, <span class="c_gray3 fw_500">저희 상담간호사가 확인전화를 드려 예약확정</span> 및 주의사항 안내를 도와드리겠습니다 </p>

			<p class="step mar20 mt30">
				<span class="fl c_point">진료 정보 입력</span>
				<span class="fr"><strong class=" c_point">STEP 02</strong> / 03</span>
			</p>

			<div class="box_blue mar20">
				<ul>
					<li>진료 예약 및 변경은 2일 전까지 가능합니다</li>
					<li>진료 신청일로부터 2일 이내의 예약은 전화 문의 또는 내원하시어 예약 바랍니다</li>
					<li><span>문의전화</span>1577-7502</li>
				</ul>
			</div>

			<ul class="tab_list02"><!-- tab -->
				<li class="selected" onclick="javascript:fnTapChange(1);"><a href="#none" title="선택된 탭">진료과 선택</a></li>
				<li onclick="javascript:fnTapChange(2);"><a href="#none">의료진 선택</a></li>
			</ul>

			<!-- 진료과 선택 탭 박스 s -->
			<div class="tab_box pd0">
				<div class="f_step"><!-- 진료과 선택 -->
					<p class="sel">진료과 선택<span></span></p>
						<ul class="f_step01">
						<c:forEach items="${mediSbjList}" var="list" varStatus="status">
							<li onclick="javascript:getDrList('${list.MEDI_SBJ_CD}', '${list.MEDI_SBJ_NM}')" id="mdli${list.MEDI_SBJ_CD}"><a href="#none" id="mda${list.MEDI_SBJ_CD}">${list.MEDI_SBJ_NM}</a></li>
						</c:forEach>
						</ul>
				</div>
				
				<div class="f_step"><!-- 의료진 선택 -->
					<p class="sel">의료진 선택<span></span></p>
					<div class="f_step02 doct01">
						<ul class="s02">
						<c:forEach items="${clinicInfo.DR_LIST}" var="DR" varStatus="status">
							<li style="display: list-item;">
								<img src="<c:url value='/getImage/${DR.PC_IMG_ATCH_NO}'/>" alt="${DR.DR_NM}">
								<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong>
								<span id="drFie">${DR.FIELD_CT}</span>
								<a href="javascript:getDrCalendarList2('${list.MEDI_SBJ_CD}', '${list.DR_ID}', '${list.DR_NM}', '${list.FIELD_CT}')"></a>
							</li>
						</c:forEach>
						</ul>
						<a href="#none" class="btn_more">자세히 보기</a>	
					</div>

					<div class="f_step">
						<p class="sel">날짜 선택<span></span></p>
						<div class="date_sel f_step03">
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
						<p class="date_desc">* 진료 외의 시간에는 수술/검사 등을 진행합니다</p>
						</div>
					</div>

					<div class="f_step">
						<p class="sel">예약시간 선택<span></span></p>
							<ul class="f_step01" name="rTime" id="rTime" title="예약시간 선택">
							</ul>
					</div>		

						<div class="f_step"><!-- 예약정보 확인 -->
							<p class="sel">예약정보 확인<span></span></p>
							<dl class="f_step05">
								<dt>이름</dt>
								<dd id="rsvNm">${patientInfo.usrNm}</dd>
								<dt>진료과</dt>
								<dd id="rsvSbjNm"></dd>
								<dt>의료진</dt>
								<dd id="rsvDrNm"></dd>
								<dt>예약일시</dt>
								<dd id="rsvExDt"></dd>
							</dl>
						</div>
					
				</div>
			</div>
			<!-- //진료과 선택 탭 박스 e -->

			<!-- 의료진 선택 탭 박스 s -->
			<div class="tab_box pd0">
				<div class="f_step"><!-- 의료진 선택 -->
					<p class="sel">의료진 선택<span></span></p>
					<div class="f_step02 doct02">
							<ul>
							<c:forEach items="${mediDrList}" var="list" varStatus="status">
								<li>
									<img src="<c:url value='/getImage/${list.MOBILE_IMG_ATCH_NO}'/>" >
									<strong>${list.DR_NM}</strong>
									<span>${list.FIELD_CT}</span>
									<a href="javascript:getDrCalendarList2('${list.MEDI_SBJ_CD}', '${list.DR_ID}', '${list.DR_NM}', '${list.FIELD_CT}')"></a>
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
							<a href="javascript:prevm2();" id="prev">이전 년도로 이동</a>
							<span id="yearmonth2"></span>
							<a href="javascript:nextm2();" id="next">다음 년도로 이동</a>
						</div>
						<p><a href="#n" class="am">오전</a><a href="#n" class="pm">오후</a></p>

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
						<p class="date_desc">* 진료 외의 시간에는 수술/검사 등을 진행합니다</p>
					</div>
				</div>
								
					
				<div class="f_step"><!-- 예약시간 선택 -->
					<p class="sel">예약시간 선택<span></span></p>
					<ul class="f_step01" name="rTime2" id="rTime2" title="예약시간 선택">
					</ul>
				</div>

				<div class="f_step"><!-- 예약정보 확인 -->
					<p class="sel">예약정보 확인<span></span></p>
					<dl class="f_step05">
						<dt>이름</dt>
						<dd id="rsvNm2">${patientInfo.usrNm}</dd>
						<dt>진료과</dt>
						<dd id="rsvSbjNm2"></dd>
						<dt>의료진</dt>
						<dd id="rsvDrNm2"></dd>
						<dt>예약일시</dt>
						<dd id="rsvExDt2"></dd>
					</dl>
				</div>
			</div>
			<!-- //의료진 선택 탭 박스 e -->			
						
			<div class="btn_Lbox">
				<a href="/user/cts/rsv/userRSVClinic.do" class="btn btn02 bgreen">이전</a>
				<a href="javascript:formSubmit();" class="btn btn02 breservation">예약</a>
			</div>
					
		</div>
		
	<!-- //contents e -->
<input type="hidden" id="tabIdx" name="tabIdx" value="0">
<form method="post" action="" id="reservationForm" name="reservationForm">
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
			location.replace("/user/cts/rsv/userRSVClinic.do");
		}
		
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".f_step01").mCustomScrollbar({theme:"minimal-dark"});
		$(".f_step02").mCustomScrollbar({theme:"minimal-dark"});
		
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
		});

		//날짜선택
		$('.date_table td a:not(.closed)').off();
		$('.date_table td a:not(.closed)').click(function(){
			var year = $(this).closest('.date_table').prev().prev('.date_year').children('span').text(),
				txt = $(this).parents('td').text(),
				str = txt.replace(/[^0-9]/g,'');
			$('.date_table td a').removeClass('selected');
			$(this).addClass('selected');
			if(str < 10){
				$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
				$('#RSVDT').val(year + '' + str)
			}else{
				$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.' + str);
				$('#RSVDT').val(year + '.' + str)
			}
		
		});
		
		build();
		build2();
		rstEvt();
		
		if($('#DPT_CD').val() != '') {
			$('#mdli${formData.DPT_CD}').trigger('click');
			$('#mda${formData.DPT_CD}').trigger('click');
		}
	});

	function rstEvt() {
		$('.f_step01 li').click(function(){
			var txt = $(this).children('a').text();
			$(this).parents('ul').prev('.sel').children('span').text(txt);
			$(this).addClass('selected').siblings('li').removeClass('selected');
			
		});
		
		//의료진
		$('.f_step02 ul li').off();
		$('.f_step02 ul li').click(function(){
			var txt = $(this).children('strong').text();
			$(this).parents('ul').parents().prev('.sel').children('span').text(txt);
			$(this).addClass('selected').siblings('li').removeClass('selected');
			DptChange('rTime');
			clearOption('rTime');
			build();
			build2()
		});
		var step01More = $('.doct01 .btn_more');
		$('.doct01 li').slice(0, 10).show();
		if($('.doct01 li').length < 11){
			step01More.hide();
		}
		step01More.click(function(e){
			e.preventDefault();
			$('.doct01 li:hidden').slice(0, 10).show();
			if($('.doct01 li:hidden').length == 0){
				step02More.hide();
			}
		});
		var step02More = $('.doct02 .btn_more');
		$('.doct02 li').slice(0, 10).show();
		if($('.doct02 li').length < 11){
			step01More.hide();
		}
		step02More.click(function(e){
			e.preventDefault();
			$('.doct02 li:hidden').slice(0, 10).show();
			if($('.doct02 li:hidden').length == 0){
				step02More.hide();
			}
		});
		
		//날짜 선택
		$('.date_table td a:not(.closed)').off();
		$('.date_table td a:not(.closed)').click(function(){
			var year = $(this).closest('.date_table').prev().prev('.date_year').children('span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
			$('.date_table td a').removeClass('selected');
			$(this).addClass('selected');
			let DPT_CD = $('#MEDI_SBJ_CD').val();
			let DR_ID = $('#DR_ID').val();
			let RSV_DT = event.currentTarget.id;
			if(RSV_DT.length == 10) {
				RSV_DT = RSV_DT.replace('_2', '');
				getSchedule2(DPT_CD, DR_ID, RSV_DT);
			} else {
				getSchedule(DPT_CD, DR_ID, RSV_DT);
			}
		})
		
		var timeSet = $('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+'  '+ ($('#RSV_TM').val().substring(0,2)+':'+$('#RSV_TM').val().substring(2,4));

		$('#rsvDrNm').html($('#DR_NM').val());
		$('#rsvSbjNm').html($('#MEDI_SBJ_NM').val());
		$('#rsvExDt').html('');
		$('#rsvExDt').html($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+'</br>선택없음');
		$('#rsvDrNm2').html($('#DR_NM').val());
		$('#rsvSbjNm2').html($('#MEDI_SBJ_NM').val());
		$('#rsvExDt2').html($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+'</br>선택없음');
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
	
	function clearOption(selId) {
		$('#'+selId).empty();
	}
	function addOption(selId, optVal, txt) {
		$('#'+selId).append('<li onclick="javascript:fnTimeSet(\''+optVal+'\');"><a href="#none">'+txt+'</a></li>');
	}
	function fnTimeSet(RSVTM) {
		$('#RSV_TM').val(RSVTM);
		$('#rsvExDt').text($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+' '+ ($('#RSV_TM').val().substring(0,2)+':'+$('#RSV_TM').val().substring(2,4)));
		$('#rsvExDt2').text($('#RSV_DT').val().substring(0,4)+'.'+$('#RSV_DT').val().substring(4,6)+'.'+$('#RSV_DT').val().substring(6,8)+' '+ ($('#RSV_TM').val().substring(0,2)+':'+$('#RSV_TM').val().substring(2,4)));
	}
	/* 의료진 리스트 ajax */
	function getDrList(MEDI_SBJ_CD, MEDI_SBJ_NM) {
		$('#MEDI_SBJ_NM').val(MEDI_SBJ_NM);
		$('#MEDI_SBJ_CD').val(MEDI_SBJ_CD);
		$('#DPT_CD').val(MEDI_SBJ_CD);
		var object = {
			url : "/user/cts/rsv/getDrList.do",
			data : {
				"MEDI_SBJ_CD" : MEDI_SBJ_CD
			},
			fnSuccess : function(data) {
				
				$('.s02 li').remove();
				var li = '';
				$.each(data, function(index, value) {
						li += '<li>';
						li += "<img src=<c:url value='/getImage/"+value.mobile_IMG_ATCH_NO+"'/> class='mCS_img_loaded' >";
						li += '<strong>'+value.dr_NM+'</strong>';
						li += '<span>'+value.field_CT+'</span>';
						li += '<a href="javascript:getCalendar(\''+MEDI_SBJ_CD+'\',\''+value.dr_ID+'\',\''+value.dr_NM+'\')" id="dra'+value.dr_ID+'"></a>';
						li += '</li>';
				});
				$('.s02').html(li);
				rstEvt();
				// 진료시간표 - 예약버튼 클릭으로 들어왔을 때 의료진 지정
				if(firstLoad) {
					firstLoad = false;
					// 처음 실행 시 데이터 가져옴
					$('#dra${formData.DR_ID}').trigger('click');
					getCalendar('${formData.DPT_CD}', '${formData.DR_ID}', '${formData.DR_NM}');
				}
			}
		};
		fnAjax(object);
	}
	function getCalendar(DPT_CD, DR_ID, DR_NM) {
		$('#DR_ID').val(DR_ID);
		$('#DR_NM').val(DR_NM);
		$('#MEDI_SBJ_CD').val(DPT_CD);
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
					
					$('#'+value.rsv_DT).prop('onclick', 'getDrCalendarList2("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT+'", "'+$('#MEDI_SBJ_NM').val()+'")');
					$('#'+value.rsv_DT).html(fgText);
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
				clearOption('rTime');
				if(data != null && data.length > 0){
					$.each(data, function(index, value) {
						addOption('rTime', value.rsv_HR+value.rsv_MN, value.rsv_HR+':'+value.rsv_MN);
					});
				}
				rstEvt();
			}
		};
		fnAjax(object);
	}

	/*******************의료진 선택********************/
	
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

function getCalendar2(DPT_CD, DR_ID, DR_NM, RSV_DT) {
	$('#DR_ID').val(DR_ID);
	$('#DR_NM').val(DR_NM);
	$('#MEDI_SBJ_CD').val(DPT_CD);
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
function getDrCalendarList2(DPT_CD, DR_ID, DR_NM, FIELD_CT, RSV_DT) {
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
			clearOption('rTime2');
			if(data != null && data.length > 0){
				$.each(data, function(index, value) {
					addOption('rTime2', value.rsv_HR+value.rsv_MN, value.rsv_HR+':'+value.rsv_MN);
				});
			}
			rstEvt();
		}
	};
	fnAjax(object);
}

function fnTapChange(tabIdx) {
	$('#tabIdx').val(tabIdx);
	$('*').removeClass('selected');
	$('#DPT_CD').val('');
	$('#MEDI_SBJ_CD').val('');
	$('#MEDI_SBJ_NM').val('');
	$('#DR_ID').val('');
	$('#DR_NM').val('');
	$('#RSV_DT').val('');
	$('#RSV_TM').val('');
	$('#rsvDrNm').html('');
	$('#rsvSbjNm').html('');
	$('#rsvExDt').html('');
	$('#rsvDrNm2').html('');
	$('#rsvSbjNm2').html('');
	$('#rsvExDt2').html('');
	$('.f_step .sel span').each(function() {
		$(this).text('');
	});
}

function DptChange(tabIdx) {
	$('#DR_ID').val('');
	$('#DR_NM').val('');
	$('#RSV_DT').val('');
	$('#RSV_TM').val('');
	$('#rsvDrNm').html('');
	$('#rsvSbjNm').html('');
	$('#rsvExDt').html('');
	$('#rsvDrNm2').html('');
	$('#rsvSbjNm2').html('');
	$('#rsvExDt2').html('');
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
		location.replace("/user/cts/rsv/userRSVClinic.do");
		return;
	}
	$('#RSV_DT').val($('#RSV_DT').val().replace('/_2/gi', ''));
	document.reservationForm.action = "/user/cts/rsv/userRSVClinicSuccess.do";
	document.reservationForm.submit();
}
</script>