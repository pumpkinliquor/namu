<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<div class="sub_pop">
</div>
<form method="post" action="/user/cts/rsv/userRSVClinic.do" id="reservationPopForm" name="reservationPopForm">
	<input type="hidden" id="DPT_CD" name="DPT_CD">
	<input type="hidden" id="DR_ID" name="DR_ID">
	<input type="hidden" id="DR_NM" name="DR_NM">
</form>

<script>
function fnclose() {
	$('.dim').remove();
	$(".sub_pop").html('');
	$('.sub_pop').hide();
}

function fnDrDetail(DR_ID) {
	$(".sub_pop").html('');
	var obj = {
			url:"/user/spc/cti/drdetail.do"
			, data:{"DR_ID":DR_ID}
			, dataType:"json"
			, fnSuccess: function(data) {
				var html = '';
				var tag = (data.drListVO.mng_CENTER_CD).split(",");
				var tagNm = (data.drListVO.mng_CENTER_NM).split(",");
				$(".sub_pop *").remove();
				html += '<div><dl class="profile"><dt><span id="Drpos">';
				html += data.drListVO.field_CT;
				html += '</span><strong id="Drname">';
				html +=  data.drListVO.dr_NM;
				html += '</strong><zz id="Drfi">';
				html += data.drListVO.position_CT;
				html += '</zz></dt><dd class="drtag"><div class="tag_list">';
				for(var i=0; i<tag.length; i++){
					html += "<a href='/user/spc/cti/selectCTIInfo.do?custom1=";
					html += tag[i];
					html += "'>";
					html += tagNm[i];
					html += '</a>';
				}
				html += '</div></dd><dd class="sub_btn">';
				if(data.drListVO.add_OPEN_SET_CD.indexOf('01') != -1) {
					html += '<a href="/user/cts/rsv/drScheduleView.do?MEDI_SBJ_CD='+data.drListVO.medi_SBJ_CD+'&DR_ID='+DR_ID+'" id="open_cd_01" class="btn bgreen">진료시간표</a>';
				}
				if(data.drListVO.add_OPEN_SET_CD.indexOf('02') != -1 && data.drListVO.medi_SBJ_CD != 'AO') {
					html += '<a href="javascript:popMoveToReservation();" id="open_cd_02" class="btn breservation">예약</a>';
				}
				html += '</dd><dd class="expertise"><p>전문분야</p><ul id="drspc">';
				var fieldTX = data.drListVO.spcl_FIELD_TX.split('\n');
				for(var field in fieldTX) {
					html += '<li>'+fieldTX[field]+'</li>';
				}
				html += '</ul></dd><dd class="pro_img">';
				html += '<img src="/getImage/';
				html += data.drListVO.pc_IMG_ATCH_NO;
				html += '" alt="">';
				if(data.drListVO.blog_USE_YN == 'Y') {
					html += '<a href="';
					html += data.drListVO.blog_ADD_TX;
					html += '" target="_blank" id="blog">블로그 바로가기</a>';
				}
				html += '</dd></dl><div class="his"><p>주요경력 및 약력</p>';
				html += '<ul id="drHis">'
				const historyTX = data.drListVO.history_TX.split('\n');
				for (var his1 in historyTX) {
					html += '<li>'+historyTX[his1]+'</li>';
				}
				html += '</ul>';
				html += '<ul id="drHis2">'
				const historyTX2 = data.drListVO.history_TX2.split('\n');
				for (var his2 in historyTX2) {
					html += '<li>'+historyTX2[his2]+'</li>';
				}
				html += '</ul>';
				html += '</div></div>';
				html += '<a href="javascript:fnclose()" class="sub_close">닫기</a>';
				
				$(".sub_pop").html(html);
				$.mCustomScrollbar.defaults.scrollButtons.enable=true;
				$.mCustomScrollbar.defaults.axis="yx";
				$(".sub_pop > div").mCustomScrollbar({theme:"minimal-dark"});
				
				$('#DPT_CD').val(data.drListVO.medi_SBJ_CD);
				$('#DR_ID').val(data.drListVO.dr_ID);
				$('#DR_NM').val(data.drListVO.dr_NM);
				
			}
		}
	
	fnAjax(obj)
		$('.sub_pop').after('<div class="dim"/>');
		$('.sub_pop').show();
		$('.sub_pop .sub_close').click(function(event) {
			$('.dim').remove();
			$('.sub_pop').hide();
			 //window.close();
		});
	// 스크롤
	$(window).on("load",function(){
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".sub_pop > div").mCustomScrollbar({theme:"minimal-dark"});
	});
}

function popMoveToReservation() {
	document.reservationPopForm.submit();
}
</script>