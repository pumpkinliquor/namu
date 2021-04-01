<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 캘린더 -->
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script type="text/javascript">

	var firstLoad = true;
	var ID = "${drId}";

	$(document).ready(function() {
		build();
		fnSelectMEDI_SBJ_CD('${dptCd}');
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s02").mCustomScrollbar({theme:"minimal-dark"});
		
	});

	/* 진료시간table ajax */
	function fnSelectMEDI_SBJ_CD(MEDI_SBJ_CD) {
		$('#DPT_CD').val('');
		$('#DR_ID').val('');
		$('#DR_NM').val();
		$('#MEDI_SBJ_NM').val();
		$('#drname').html('　');
		$('#drfield').html('');
		var object = {
			url : "/user/cts/rsv/drScheduleSelectList.do",
			data : {
				"MEDI_SBJ_CD" : MEDI_SBJ_CD
			},
			fnSuccess : function(data) {
				$("#AMSchedule *").remove();
				$("#PMSchedule *").remove();
				$("#mCSB_1_container *").remove();
				$('#amComment').text(data.comment.rmkCt);
				$('#pmComment').text(data.comment.rmk2Ct);

				var AmHtml = '';
				var PmHtml = '';
				var schVo = data.vo;
				// 진료시간표 셋팅
				for (var i = 0; i < schVo.length; i++) {
					// am s
					AmHtml += '<tr><th scope="row">'+ schVo[i].DR_NM +'</th><td>';
					/* 월요일 오전 */
					if(schVo[i].AM_MON === 'Y' && schVo[i].AM_MON_BIGO !== "") 
						AmHtml += schVo[i].AM_MON_BIGO;		
					else if(schVo[i].AM_MON === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
					
					 AmHtml += '</td><td>';
					 
					 /* 화요일 오전 */
					if(schVo[i].AM_TUE === 'Y' && schVo[i].AM_TUE_BIGO !== "") 
						AmHtml += schVo[i].AM_TUE_BIGO;	
					else if(schVo[i].AM_TUE === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
					
					AmHtml += "</td><td>";
					
					/* 수요일 오전 */
					if(schVo[i].AM_WED === 'Y' && schVo[i].AM_WED_BIGO !== "") 
						AmHtml += schVo[i].AM_WED_BIGO; 							
					else if(schVo[i].AM_WED === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
					
					AmHtml += "</td><td>";
					
					/* 목요일 오전 */
					if(schVo[i].AM_THU === 'Y' && schVo[i].AM_THU_BIGO !== "") 
						AmHtml += schVo[i].AM_THU_BIGO;
					else if(schVo[i].AM_THU === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
					
					AmHtml +=	'</td><td>';
					
					/* 금요일 오전 */
					if(schVo[i].AM_FRI === 'Y' && schVo[i].AM_FRI_BIGO !== "") 
						AmHtml += schVo[i].AM_FRI_BIGO;
					else if(schVo[i].AM_FRI === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
				
					AmHtml +=	'</td><td>';
					
					/* 토요일 오전 */
					if(schVo[i].AM_SAT === 'Y' && schVo[i].AM_SAT_BIGO !== "") 
						AmHtml += schVo[i].AM_SAT_BIGO; 							
					else if(schVo[i].AM_SAT === 'Y') 
						AmHtml += '<img src="/images/fbcms/user/ico_tam.png" alt="오전">';
					else 
						AmHtml += '';
					AmHtml +=	'</td></tr>';
					// am e
					
					// pm s
					PmHtml += '<tr><th scope="row">'+ schVo[i].DR_NM +'</th><td>'
					
					/* 월요일 오후 */
					if(schVo[i].PM_MON === 'Y' && schVo[i].PM_MON_BIGO !== "") 
						PmHtml += schVo[i].PM_MON_BIGO;
					else if(schVo[i].PM_MON === 'Y')
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
					
					PmHtml += '</td><td>';
					
					/* 화요일 오후 */
					if(schVo[i].PM_TUE === 'Y' && schVo[i].PM_TUE_BIGO !== "") 
						PmHtml += schVo[i].PM_TUE_BIGO;	
					else if(schVo[i].PM_TUE === 'Y') 
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
					
					PmHtml += '</td><td>';
					
					/* 수요일 오후 */
					if(schVo[i].PM_WED === 'Y' && schVo[i].PM_WED_BIGO !== "") 
						PmHtml += schVo[i].PM_WED_BIGO; 							
					else if(schVo[i].PM_WED === 'Y') 
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
					
					PmHtml +='</td><td>';
					
					/* 목요일 오후 */
					if(schVo[i].PM_THU === 'Y' && schVo[i].PM_THU_BIGO !== "")
						PmHtml += schVo[i].PM_THU_BIGO;
					else if(schVo[i].PM_THU === 'Y')
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
					
					PmHtml +='</td><td>';
					
					/* 금요일 오후 */
					if(schVo[i].PM_FRI === 'Y' && schVo[i].PM_FRI_BIGO !== "") 
						PmHtml += schVo[i].PM_FRI_BIGO;
					else if(schVo[i].PM_FRI === 'Y') 
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
				
					PmHtml += '</td><td>';
					
					/* 토요일 오후 */
					if(schVo[i].PM_SAT === 'Y' && schVo[i].PM_SAT_BIGO !== "") 
						PmHtml += schVo[i].PM_SAT_BIGO; 							
					else if(schVo[i].PM_SAT === 'Y') 
						PmHtml += '<img src="/images/fbcms/user/ico_tpm.png" alt="오후">';
					else 
						PmHtml += '';
					
					PmHtml += '</td></tr>';	
					// pm e
					
				}
				
				// 의료진리스트 셋팅
				
				var fNum = 0;
				var drVo = data.drVo;
				var drinf = '';
				for (var i = 0; i < drVo.length; i++) {
					drinf += '<li id="drlistinform">';
					drinf += '<img src="/getImage/';
					drinf += drVo[i].PC_IMG_ATCH_NO;
					drinf += '" alt="' + drVo[i].DR_NM + '">';
					drinf += '<strong>';
					drinf += drVo[i].DR_NM;
					drinf += '</strong> <span>';
					drinf += drVo[i].FIELD_CT;
					drinf += '</span> <a href=';
					drinf += '"javascript:getDrCalendarList';
					drinf += "(";
					drinf += "'" + MEDI_SBJ_CD + "', ";
					drinf += "'" + drVo[i].DR_ID + "', ";
					drinf += "'" + drVo[i].DR_NM + "', ";
					drinf += "'" + drVo[i].FIELD_CT + "', ";
					drinf += "'" + drVo[i].POSITION_CT + "', ";
					drinf += "'" + drVo[i].CLINIC_APPO_WORD_CT + "'";
					drinf += ");";
					drinf += '"id="';
					drinf += drVo[i].DR_ID;
					drinf += '"></a>';
					drinf += '</li>';
					if(drVo[i].DR_ID == ID) {
						fNum = i;
					}
				}
				
				//한번에 변경
				$("#AMSchedule").html(AmHtml);
				$("#PMSchedule").html(PmHtml);
				$("#mCSB_1_container").html(drinf);
				build();
				
				if(firstLoad){
					$('#'+data.drVo[fNum].DR_ID).addClass('active');
					getDrCalendarList(MEDI_SBJ_CD, data.drVo[fNum].DR_ID, data.drVo[fNum].DR_NM, data.drVo[fNum].FIELD_CT, data.drVo[fNum].POSITION_CT);
				} else {
					$('#'+data.drVo[0].DR_ID).addClass('active');
					getDrCalendarList(MEDI_SBJ_CD, data.drVo[0].DR_ID, data.drVo[0].DR_NM, data.drVo[0].FIELD_CT, data.drVo[0].POSITION_CT);
				}
				
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
	$('#drfield').text(POSITION_CT);
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

	$.mCustomScrollbar.defaults.scrollButtons.enable=true;
	$.mCustomScrollbar.defaults.axis="yx";
	$(".s02").mCustomScrollbar({theme:"minimal-dark"});
	
	$('.s02 li a').off('click');
	$('.s02 li a').click(function(event) {
		$('#drlistinform a').removeClass('active');
		$(this).addClass('active');
		build();
	});

}
</script>
<!-- contents s -->
<div class="contents w1200">
	<h4 class="con_in_tit02">진료시간 안내</h4>
	<div class="tbox tdetail03">
		<table>
			<caption>요일, 구분, 외래, 검진으로 구성된 표</caption>
			<col style="width: 25%">
			<col style="width: 25%">
			<col style="width: 25%">
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

	<div class="box_blue mt30">
		<h6 class="con_in_tit10">* 진료 절차 안내</h6>
		<p>
			진료신청서작성<span class="sche_arr"></span> 접수<span class="sche_arr"></span>
			외래 진료과 진료<span class="sche_arr"></span> 수납&middot;예약<span
				class="sche_arr"></span> 검사&middot;처방전 귀가
		</p>
		<h6 class="con_in_tit10">* 외래진료 당일 접수마감</h6>
		<ul class="hy_list">
			<li>평일 : 오전 12:00 까지, 오후 16:30 까지</li>
			<li>토요일 : 오후 12:30 까지</li>
		</ul>
		<h6 class="con_in_tit10">* 예약 상담: 1577-7502, 팩스: 02-519-8855</h6>
		<h6 class="con_in_tit10">
			* 의료급여 환자가 본 원에서 2단계 진료를 받기 위해서는 1단계 의료급여 기관의 의사로부터 발급받은 “요양급여 의뢰서”를
			발급일로부터 7일 이내(공휴일 제외)에<br>
			<span class="ml8"></span> 원무팀에 제출하셔야 합니다
		</h6>
	</div>

	<h4 class="con_in_tit02 mt80">진료과별 진료시간</h4>
	<ul class="tab_list02">
		<!-- tab -->
		<li value="GI"<c:if test="${dptCd eq 'GI'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('GI')" title="선택된 탭">소화기내과</a></li>
		<li value="GS"<c:if test="${dptCd eq 'GS'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('GS')">소화기외과</a></li>
		<li value="NE"<c:if test="${dptCd eq 'NE'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('NE')">신장내과</a></li>
		<li value="FM"<c:if test="${dptCd eq 'FM'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('FM')">가정의학과</a></li>
		<li value="BE"<c:if test="${dptCd eq 'BE'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('BE')">유방&middot;갑상선외과</a></li>
		<li value="GY"<c:if test="${dptCd eq 'GY'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('GY')">부인과</a></li>
		<li value="AO"<c:if test="${dptCd eq 'AO'}"> class="selected"</c:if>><a href="javascript:fnSelectMEDI_SBJ_CD('AO')">안티에이징&middot;비만센터</a></li>
	</ul>

	<!-- 진료과별 진료시간표 s -->
	<div class="t_schedule">
		<!-- 오전 -->
		<h5 class="amtit">
			오전<%-- <span>08:00 ~ 13:00</span> --%>
		</h5>
		<div class="tbox tdetail03">
			<table>
				<caption>요일별 의료진 진료시간표</caption>
				<col>
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<thead>
					<tr>
						<th scope="col">의료진</th>
						<th scope="col">월</th>
						<th scope="col">화</th>
						<th scope="col">수</th>
						<th scope="col">목</th>
						<th scope="col">금</th>
						<th scope="col">토</th>
					</tr>
				</thead>
				<tbody id="AMSchedule">
					<c:forEach items="${ScheduleList }" var="scheduleInfo">
						<tr>
							<th scope="row">${scheduleInfo.DR_NM}</th>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_MON eq 'Y' and not empty scheduleInfo.AM_MON_BIGO}">
										${scheduleInfo.AM_MON_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_MON eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>

								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_TUE eq 'Y' and not empty scheduleInfo.AM_TUE_BIGO}">
										${scheduleInfo.AM_TUE_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_TUE eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_WED eq 'Y' and not empty scheduleInfo.AM_WED_BIGO}">
										${scheduleInfo.AM_WED_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_WED eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_THU eq 'Y' and not empty scheduleInfo.AM_THU_BIGO}">
										${scheduleInfo.AM_THU_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_THU eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_FRI eq 'Y' and not empty scheduleInfo.AM_FRI_BIGO}">
										${scheduleInfo.AM_FRI_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_FRI eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_SAT eq 'Y' and not empty scheduleInfo.AM_SAT_BIGO}">
										${scheduleInfo.AM_SAT_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_SAT eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<p class="date_desc02" id="amComment">${ScheduleComment.rmkCt}</p>
	</div>

	<div class="t_schedule">
		<!-- 오후 -->
		<h5 class="pmtit">
			오후<%-- <span>14:00 ~ 17:00</span> --%>
		</h5>
		<div class="tbox tdetail03">
			<table>
				<caption>요일별 의료진 진료시간표</caption>
				<col>
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<col style="width: 12%">
				<thead>
					<tr>
						<th scope="col">의료진</th>
						<th scope="col">월</th>
						<th scope="col">화</th>
						<th scope="col">수</th>
						<th scope="col">목</th>
						<th scope="col">금</th>
						<th scope="col">토</th>
					</tr>
				</thead>
				<tbody id="PMSchedule">
					<c:forEach items="${ScheduleList }" var="scheduleInfo">
						<tr>
							<th scope="row">${scheduleInfo.DR_NM}</th>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_MON eq 'Y' and  not empty scheduleInfo.PM_MON_BIGO}">
										${scheduleInfo.PM_MON_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_MON eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>

								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_TUE eq 'Y' and not empty scheduleInfo.PM_TUE_BIGO}">
										${scheduleInfo.PM_TUE_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_TUE eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_WED eq 'Y' and not empty scheduleInfo.PM_WED_BIGO}">
										${scheduleInfo.PM_WED_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_WED eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_THU eq 'Y' and not empty scheduleInfo.PM_THU_BIGO}">
										${scheduleInfo.PM_THU_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_THU eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_FRI eq 'Y' and not empty scheduleInfo.PM_FRI_BIGO}">
										${scheduleInfo.PM_FRI_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_FRI eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.PM_SAT eq 'Y' and not empty scheduleInfo.PM_SAT_BIGO}">
										${scheduleInfo.PM_SAT_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.PM_SAT eq 'Y' }">
										<img src="/images/fbcms/user/ico_tpm.png" alt="오후">
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<p class="date_desc02" id="pmComment">${ScheduleComment.rmk2Ct}</p>
		</div>
	</div>
	<!-- 진료과별 진료시간표 e -->

	<h4 class="con_in_tit02 mt80">의료진별 진료일정</h4>
	<div class="re_select">
		<div class="list_sel">
			<section class="staff staff02">
				<!-- 의료진 -->
				<header>의료진</header>
				<ul class="s02">
					<c:forEach items="${DrList}" var="drlist">
						<li id="drlistinform">
							<img src="<c:url value='/getImage/${drlist.PC_IMG_ATCH_NO}'/>" alt="${drlist.DR_NM}">
							<strong>${drlist.DR_NM}</strong> <span>${drlist.FIELD_CT}</span>
							<a href="javascript:getDrCalendarList('${drlist.MEDI_SBJ_CD}', '${drlist.DR_ID}', '${drlist.DR_NM}', '${drlist.MEDI_SBJ_NM}', '${drlist.POSITION_CT}')"></a>
						</li>						
					</c:forEach>
				</ul>
			</section>
		</div>

		<div class="date_sel schedule_sel">
			<!-- 의료진 -->
			<header>
				<c:forEach items="${DrList}" var="drlist" begin="0" end="0">
					<strong id="drname">${drlist.DR_NM}</strong>&nbsp;&nbsp;<span id="drfield">${drlist.POSITION_CT}</span>
				</c:forEach>
			</header>
			<div class="date_year">
				<a href="javascript:prevm();" id="prev">이전 년도로 이동</a>
				<span id="yearmonth"></span>
				<a href="javascript:nextm();" id="next">다음 년도로 이동</a>
			</div>
			<p>
				<a href="javascript:void(0);" class="am">오전</a><a href="javascript:void(0);" class="pm">오후</a>
			</p>

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
			<a href="#none" onclick="fnPop()" class="btn_detail">자세히 보기</a>
		</div>

	</div>
	<div class="btn_Lbox">
		<a href="javascript:moveToReservation();" class="btn breservation">예약</a>
	</div>
	
	<!-- 의료진 popup s-->
	<jsp:include page="/WEB-INF/jsp/fbcms/user/spc/cti/drdetail.jsp" />
	<!-- 의료진 popup e-->

	<form name="hidden" action="" method="post">
		<input type="hidden" name="DID" id="DID" value="${drId}">
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
<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>


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