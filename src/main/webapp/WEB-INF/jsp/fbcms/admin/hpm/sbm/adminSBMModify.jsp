<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>
<script type="text/javascript">

var tagNmList = {};
var tagDissNmList = {};
var dissArray = {};
/*********************************************************
 * 초기화
 *********************************************************/
function fnInit() {
	// 팝업데이터 순서변경 처리
	$('table[id$="popupTable"]').tableDnD({
		onDrop: function(table, row){
			var mngCd = $(table).find('#mngCd').val();
			var trCnt = $('#trCountIn'+mngCd).val();
			
			var rows = table.tBodies[0].rows; 
			var debugStr = row.id;
			{
				// form 초기화
				$('form[name=orderForm]').remove();
				
				var form = $("<form>");
				form.prop("name", "orderForm");
				form.prop("method", "post");
				form.prop("action", "");
				
				for(var i = 0; i < trCnt; i++) {
					$("#"+rows[i].id).find("td").eq(0).html((i+1));
					$("#"+rows[i].id).find("td").eq(1).children().eq(0).val($("#"+rows[i].id).find("td").eq(0).html());
					var input1 = $("<input>");
					input1.prop("type", "hidden");
					input1.val($("#"+rows[i].id).find("td").eq(0).html());
					input1.prop("name", "seq"+(i+1)+"Order");
					
					var input2 = $("<input>");
					input2.prop('type', 'hidden');
					input2.val($("#"+rows[i].id).find("input").val());
					input2.prop('name', "seq"+(i+1)+"MngSeq");
					
					form.append(input1);
					form.append(input2);
				}
				
				var input3 = $("<input>");
				input3.prop('type', 'hidden');
				input3.val(trCnt);
				input3.prop('name', 'trCount');
				form.append(input3);
				
				var input4 = $("<input>");
				input4.prop('type', 'hidden');
				input4.val(mngCd);
				input4.prop('name', 'mngCd');
				form.append(input4);
				
				$('body').append(form);
			}
		}
	});
	
	// 등록일
	var REG_DT = '${subjectInfo.REG_DT}'.split('/');
	if(REG_DT.length == 2){
		$("#REG_DT").html(REG_DT[0]);
		$("#REG_TIME").html(REG_DT[1]);
	}
	/* Diss */
	// 주요질환 선택 팝업 삭제
	$('#lypop05').on('click', '.btn_shape_x', function() {
		$('#dissCode_'+$(this).prev().attr('id').replace('selectedCode_', '')+' > td:eq(1)').html('<a href="javascript:void(0);" class="btn sm addDiss">추가</a>');
		$(this).prev().remove();
		$(this).remove();
		var tmpDissList = '';
		$('.selectDiss > a.file_name').each(function() {
			tmpDissList += $(this).attr('id').replace('selectedCode_', '') + ','; 
		});
		$('#tmpDissList').val(tmpDissList.substr(0, tmpDissList.length - 1));
	});
	// 주요질환 선택 팝업 추가
	$('#lypop05').on('click', '.addDiss', function() {
		var dissCode = $(this).closest('tr').attr('id').replace('dissCode_', '');
		var dissCodeNm = $(this).closest('tr').find(' > td:eq(0)').text();
		$('.selectDiss').append('<a href="javascript:void(0);" id="selectedCode_'+dissCode+'" class="file_name" >'+dissCodeNm+'</a><a href="javascript:void(0);" class="btn_shape_x">삭제</a>');
		var tmpDissList = '';
		$('.selectDiss > a.file_name').each(function() {
			tmpDissList += $(this).attr('id').replace('selectedCode_', '') + ','; 
		});
		$('#tmpDissList').val(tmpDissList.substr(0, tmpDissList.length - 1));
		$(this).remove();
	});
	$('#lypop05').on('keydown', 'input.searchDiss', function(key) {
		if (key.keyCode == 13) {
			searchDiss();
		}
	});
	$('#tagDissList').on('click', '.tagDissDelBtn', function() {
		$(this).parent().remove();
		tagDissNmList = {};
		$('#tagDissList li').each(function(idx) {
			tagDissNmList[(idx+1)] = $(this).html().split('<')[0]; 
		});
		$('#MAJOR_DISS_CDS').val() == Object.values(tagDissNmList).toString();
	});
	
	// 관련센터
	$('#lypop01').find("a[name=popupOK]").eq(0).prop("href","javascript:fnPopUpConfirm('lypop01','centerCT1','MNG_CENTER_CD1')");
	$('#lypop01').find("a[name=popupCancel]").eq(0).prop("href","javascript:fnPopUpCancel('lypop01')");
	$('#lypop02').find("a[name=popupOK]").eq(0).prop("href","javascript:fnPopUpConfirm('lypop02','centerCT2','MNG_CENTER_CD2')");
	$('#lypop02').find("a[name=popupCancel]").eq(0).prop("href","javascript:fnPopUpCancel('lypop02')");
	$('#lypop03').find("a[name=popupOK]").eq(0).prop("href","javascript:fnPopUpConfirm('lypop03','centerCT3','MNG_CENTER_CD3')");
	$('#lypop03').find("a[name=popupCancel]").eq(0).prop("href","javascript:fnPopUpCancel('lypop03')");
	
	/* TAG */
	  <c:forEach items="${fn:split(subjectInfo.SEARCH_TAGS, ',')}" var="tagNmValue" varStatus="status">
	 	tagNmList[${status.index}] = '<c:out value="${tagNmValue}"/>';
	 </c:forEach>
	$("#tagOri").val(tagNmList);
	 
	/* 검색 태그 */

	$('#tagInput').on('keypress', function (e) {
		var thisElement = $(this);
		if (e.key === 'Enter' || e.keyCode == 32) { // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
			var tagValue = thisElement.val();
			if (tagValue !== "") { // 값이 없으면 동작 안함
				var result = Object.values(tagNmList).filter(function (word) { // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
					return word === tagValue;
				});
			
				// 태그 중복 검사
				if (result.length == 0) {
					var tagListCnt = $('#tagList li').length*1;
					$('#tagList').append('<li>'+tagValue+'<a href="javascript:void(0);" class="tagDelBtn">x</a></li>');
					tagNmList[tagListCnt] = tagValue;
					thisElement.val('');
					$('input#tagNmList').val() == Object.values(tagNmList).toString();
				} else {
					alert('태그값이 중복됩니다.');
				}
			}
			e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
		}
	});
		
	$('#tagList').on('click', '.tagDelBtn', function() {
		$(this).parent().remove();
		tagNmList = {};
		$('#tagList li').each(function(idx) {
			tagNmList[(idx+1)] = $(this).html().split('<')[0]; 
		});
		$('input#tagNmList').val() == Object.values(tagNmList).toString();
	});
}

/*********************************************************
 * 수정
 *********************************************************/
function fnUpdate(){
	// 필수입력 확인
	if($("textarea[name=SIMPLE_INTRO_TX]").val() == "") {
		alert("간단 소개를 입력해주세요.");
		return;
	}
	else if($("textarea[name=INTRO_TX]").val() == "") {
		alert("소개를 입력해주세요.");
		return;
	}
	
	if(confirm("수정하시겠습니까?")) {
		document.updateForm.action = '<c:url value="/admin/hpm/sbm/updateSBM.do"/>';
		document.updateForm.SEARCH_TAGS.value = Object.values(tagNmList).toString();
		document.updateForm.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnUpdateCancel() {
	if(confirm("수정을 취소하시겠습니까?")) {
		window.location.href="/admin/hpm/sbm/selectSBMList.do";
	}
}

/*********************************************************
 * 센터 팝업 열기
 *********************************************************/
function fnPopUpOpen(divId) {
	pop_open('#'+divId);
}

/*********************************************************
 * 센터 팝업 리셋
 *********************************************************/
function fnResetCenter(pId, inputId) {
	$("#"+pId).html('');
	$("#"+inputId).val('');
}


/*********************************************************
 * 센터 팝업 확인
 *********************************************************/
function fnPopUpConfirm(divId, pId, inputId) {
	if(confirm("선택을 완료하시겠습니까?")) {
		$("#"+pId).html("");
		$("#"+inputId).val("");
		pop_close('#'+divId);
		
		$('#'+divId).find("input[name=statusCT]:checked").each(function() {
			var MNG_CENTER_NM = $('#'+divId).find("td[name=ctSeq" + $(this).val()+"]").eq(0).html();
			var MNG_CENTER_CD = $('#'+divId).find("td[name=ctSeq" + $(this).val()+"]").eq(1).html();
			const aTag = '<a href=javascript:fnResetCenter("'+pId+'","'+inputId+'"); class="btn_shape_x">x</a>';
			$("#"+pId).html(MNG_CENTER_NM+aTag);
			$("#"+inputId).val(MNG_CENTER_CD);
		});
	}
}


/*********************************************************
 * 센터 팝업 취소
 *********************************************************/
function fnPopUpCancel(divId) {
   	if(confirm("선택을 취소하시겠습니까?")) {
		pop_close('#'+divId);
	}
}

function fnOrderPopCancel(divId) {
	pop_close('#'+divId);
}

function fnOrderChange(divId) {
	var html = '';
	
	var length = $('.index').length;
	
	for(var i=0; i<length; i++) {
		$('.index').eq(i).addClass((i+1) + 'SEQ');
		
		dissArray[i] = $('.index').eq(i).children('.ta_l').text();
		html += $('.index').eq(i).children('.ta_l').text();
		if(i+1 < length) {
			html += ', ';
		}
	}
	$("#dissA").text(html);
	$("#MAJOR_DISS_CDS").val(html);
	pop_close('#'+divId);
	
}

/*********************************************************
 * 주요질환 선택 팝업 검색
 *********************************************************/
function searchDiss() {
	var searchText = $('input.searchDiss').val();
	$('#lypop05 .board_ty.ds02.scy_box02 tbody tr').each(function() {
		if($(this).find('> td:eq(0)').text().indexOf(searchText) >= 0) {
			$(this).show();
		} else {
			$(this).hide();
		}
	});
}

/*********************************************************
 * 주요질환 선택 팝업 저장
 *********************************************************/
function saveDissList() {
	$('input[name="MAJOR_DISS_CDS"]').val($('#tmpDissList').val());
	var items = '';
	$('a[id^=selectedCode]').each(function(i) {
			items += $(this).text() + ',';
	});
	$('.dissListNm').text(items.substring(0, items.length-1));
	pop_close('#lypop05');
}
</script>

<h3 class="mid_tit mg_t50">${subjectInfo.MNG_NM} 관리</h3>
<p class="te_ri_txt">
	<em class="ootc">*</em>필수입력 항목 입니다.
</p>

<form method="post" action="" name="updateForm">
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 15%">
			<col span="1" style="width: *">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r">
					<em class="ootc">*</em>간단 소개<br>최대	200자
				</th>
				<td class="ta_l">
					<div class="input_wrap">
						<textarea style="width: 100%; height: 100px" maxlength="200" name="SIMPLE_INTRO_TX">${subjectInfo.SIMPLE_INTRO_TX}</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">
					<em class="ootc">*</em>소개<br>최대 200자</th>
				<td class="ta_l">
					<div class="input_wrap">
						<textarea style="width: 100%; height: 100px" maxlength="200" name="INTRO_TX">${subjectInfo.INTRO_TX}</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 선택</th>
				<td class="ta_l">
					<input type="hidden" name="MAJOR_DISS_CDS" id="MAJOR_DISS_CDS" value="${subjectInfo.MAJOR_DISS_CDS}"/>
					<a href="javascript:fnPopUpOpen('lypop05');"  class="btn sm">선택하기</a>
					<span class="dissListNm"><c:forEach items="${subjectInfo.DISS_CDS_LIST}" var="diss">${diss},</c:forEach></span>
				</td>			
				<%--
				<th scope="row" class="ta_r">주요질환</th>
				2020.12.15 주요질환 제거
				 <td class="ta_l">
					<a href="javascript:fnPopUpOpen('lypop04')" class="btn sm">순서변경</a>
					<p class="dis_inl" id="dissA">
						<c:forEach var="code" items="${DL}">
						<span>[${code.nttSj}]</span>
						</c:forEach>
					</p>
				</td>
				 --%>
			 <%-- 주요질환 이전버전으로 변경  = 12.07
				<th scope="row" class="ta_r">주요질환</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" id="tagDissInput" maxlength="20" title="주요질환" class="inp_txt w_full" />
						<ul id="tagDissList" class="tagbox">
							<c:forEach var="code" items="${fn:split(subjectInfo.MAJOR_DISS_CDS, ',')}">
								<li><c:out value="${code}"/><a href="javascript:void(0);" class="tagDissDelBtn">x</a></li>
							</c:forEach>
						</ul>
					</div>
				</td>
			 --%>
			</tr>
			<tr>
				<th scope="row" class="ta_r" rowspan="2">관련센터 1</th>
				<td class="ta_l">
					<a href="javascript:fnPopUpOpen('lypop01')" class="btn sm">검색하기</a>
					<p class="dis_inl" id="centerCT1">${subjectInfo.MNG_CENTER_NM1}
					<a href="javascript:fnResetCenter('centerCT1','MNG_CENTER_CD1')" class="btn_shape_x">x</a></p>
					<input type="hidden" id="MNG_CENTER_CD1" maxlength="100" name="MNG_CENTER_CD1" value="${subjectInfo.MNG_CENTER_CD1}">
				</td>
			</tr>
			<tr>
				<td>
					<div class="input_wrap">
						<input type="text" class="inp_txt w_full" maxlength="100"  name="MNG_CENTER_CD1_BIGO" value="${subjectInfo.MNG_CENTER_CD1_BIGO}">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r" rowspan="2">관련센터 2</th>
				<td class="ta_l">
					<a href="javascript:fnPopUpOpen('lypop02');" class="btn sm">검색하기</a>
					<p class="dis_inl" id="centerCT2">${subjectInfo.MNG_CENTER_NM2}
					<a href="javascript:fnResetCenter('centerCT2','MNG_CENTER_CD2')" class="btn_shape_x">x</a></p>
					<input type="hidden" id="MNG_CENTER_CD2" name="MNG_CENTER_CD2" value="${subjectInfo.MNG_CENTER_CD2}">
				</td>
			</tr>
			<tr>
				<td>
					<div class="input_wrap">
						<input type="text" class="inp_txt w_full" maxlength="100" name="MNG_CENTER_CD2_BIGO" value="${subjectInfo.MNG_CENTER_CD2_BIGO}">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r" rowspan="2">관련센터 3</th>
				<td class="ta_l">
					<a href="javascript:fnPopUpOpen('lypop03');" class="btn sm">검색하기</a>
					<p class="dis_inl" id="centerCT3">${subjectInfo.MNG_CENTER_NM3}
					<a href="javascript:fnResetCenter('centerCT3','MNG_CENTER_CD3')" class="btn_shape_x">x</a></p>
					<input type="hidden" id="MNG_CENTER_CD3" name="MNG_CENTER_CD3" value="${subjectInfo.MNG_CENTER_CD3}">
				</td>
			</tr>
			<tr>
				<td>
					<div class="input_wrap">
						<input type="text" class="inp_txt w_full" maxlength="100" name="MNG_CENTER_CD3_BIGO" value="${subjectInfo.MNG_CENTER_CD3_BIGO}">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">의료진</th>
				<td class="ta_l">
					<p class="dis_inl">${subjectInfo.DR_IDS}</p>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">검색 Tag</th>
				<td class="ta_l">
					 <div class="input_wrap">
						 <input type="text" id="tagInput"  maxlength="20"  title="검색 Tag" class="inp_txt w_full" />
						 <input type="hidden" name="SEARCH_TAGS" id="tagNmList" value="<c:out value='${subjectInfo.SEARCH_TAGS}'/>" >
						 <ul id="tagList" class="tagbox">
							 <c:forEach var="tagNmValue" items="${fn:split(subjectInfo.SEARCH_TAGS, ',')}">
							 	<li><c:out value="${tagNmValue}"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
							 </c:forEach>
						 </ul>
					 </div>
				 </td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">등록일</th>
				<td class="ta_l"><span id="REG_DT"></span><span class="mg_l20" id="REG_TIME"></span></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnUpdate();" class="btn_ty02"> 저장하기 </a> 
	<a href="javascript:fnUpdateCancel();" class="btn_ty"> 취소하기 </a>
</div>

<input type="hidden" name="MNG_GUBN_CD" value="01"/>
<input type="hidden" name="MNG_CD" value="${subjectInfo.MNG_CD}"/>
<input type="hidden" name="MNG_NM" value="${subjectInfo.MNG_NM}"/>
<input type="hidden" id="tagOri" value=""/>
</form>



<!-- 관련 센터 1 -->
<div class="lypop_wrap" id="lypop01">
<jsp:include page="../drm/adminCenterPopup.jsp"/>
</div>

<!-- 관련 센터 2 -->
<div class="lypop_wrap" id="lypop02">
<jsp:include page="../drm/adminCenterPopup.jsp"/>
</div>

<!-- 관련 센터 3 -->
<div class="lypop_wrap" id="lypop03">
<jsp:include page="../drm/adminCenterPopup.jsp"/>
</div>

<!-- 순서변경 레이어팝업 -->
	<div class="lypop_wrap" id="lypop04">
		<input type="hidden" value="<%-- ${fn:length(requestScope[clinic])} --%>" id="trListcount">
		<div class="sm_con" style="top: 300px">
			<div class="pop_top">
				<h2>순서변경</h2>
				<a href="javascript:void(0);" class="pop_close"></a>
			</div>
			<!-- pop_cont -->
			<div class="pop_cont">
				<h3 class="pop_mid_tit">
					<strong>${subjectInfo.MNG_NM}</strong>
				</h3>
	
				<div class="board_ty ds02">
					<table id="popupTable">
						<input type="hidden" value="${subjectInfo.MNG_CD}" id="mngCd">
						<input type="hidden" value="${fn:length(requestScope[clinic])}" id="trCountIn${centerInfo.MNG_CD}">
						<colgroup>
							<col style="width: 15%">
							<col style="width: *">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>클리닉</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="diss" items="${DL}" varStatus="status">
								<tr class="index">
									<td><c:out value="${status.count}"/></td>
									<td class="ta_l"><c:out value="${diss}"/></td>
									<input type="hidden" id="${status.index}MngSeq" value="${status.index}"/>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
	
				<div class="btns">
					<a href="javascript:fnOrderChange('lypop04');" class="btn_ty02">저장하기</a>
					<a href="javascript:fnOrderPopCancel('lypop04');" class="btn_ty p_cancle">취소하기</a>
				</div>
			</div>
			<!-- //pop_cont -->
		</div>
		<div class="dim"></div>
	</div>
<!-- //순서변경 레이어팝업 -->
<!-- 주요 질환 선택 레이어팝업 -->
<div class="lypop_wrap" id="lypop05">
	<div class="sm_con" style="top:300px">
		<div class="pop_top">
			<h2>주요 질환 선택</h2>
			<a href="javascript:void(0);" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit"><strong>질환</strong></h3>
			<div class="sear">
				<input type="text" maxlength="40" class="inp_txt w_full searchDiss" style="width:100%">
				<input type="submit" onclick="javascript:searchDiss();" value="검색">
			</div>

			<h3 class="pop_mid_tit"><strong>선택된 질환</strong></h3>
			<div class="sear selectDiss">
				<c:set var="selectDissList" value="${fn:split(subjectInfo.MAJOR_DISS_CDS, ',') }"/>
				<c:forEach var="dissCds" items="${subjectInfo.DISS_CDS_LIST}" varStatus="status">
					<a href="javascript:void(0);" id="selectedCode_${selectDissList[status.index] }" class="file_name">${dissCds}</a><a href="javascript:void(0);" class="btn_shape_x">삭제</a>
				</c:forEach>
			</div>
		
			<div class="board_ty ds02 scy_box02">
				<table id="popupTable">
					<colgroup>
						<col style="width: *">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr>
							<th>질환명</th>
							<th>추가</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dissInfo" items="${dissList}" varStatus="status">
							<tr id="dissCode_${dissInfo.nttId}">
								<td title="${dissInfo.nttSj}" ><c:out value="${dissInfo.nttSj}"/></td>
								<td>
									<c:set var="bSelectedCnt" value="0"/>
									<c:forEach var="selectDissInfo" items="${selectDissList}">
										<c:if test="${selectDissInfo eq dissInfo.nttId }"><c:set var="bSelectedCnt" value="${bSelectedCnt+1}" /></c:if>
									</c:forEach>
									<c:if test="${bSelectedCnt eq '0' }"><a href="javascript:void(0);" class="btn sm addDiss">추가</a></c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="#none" onclick="javascript:saveDissList();" class="btn_ty02">저장하기</a>
				<a href="#none" onclick="javascript:fnPopUpCancel('lypop05');" class="btn_ty p_cancle">취소하기</a>
			</div>
			<input type="hidden" id="tmpDissList" name="tmpDissList" value="" >
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>