<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<script type="text/javascript">

/*********************************************************
 * 초기화
 *********************************************************/
function fnInit() {
	// 년월
	$("select[id=year]").val('${year}').prop('selected',true);
	$("select[id=month]").val('${month}').prop('selected',true);
	
	// 예약일정관리 데이터 셋팅
	var tableList = '${tableList}';
	var LAST_DAY = "";
	//console.log(tableList);

	<c:forEach items="${tableList}" var="tableInfo" varStatus="status">
		var SCHE_DAY = "${tableInfo.SCHE_DAY}";			// 일자
		var POSB_YN = "${tableInfo.POSB_YN}";			// 가능여부
		var SUNDAY_YN = "${tableInfo.SUNDAY_YN}";		// 일요일여부
		LAST_DAY = "${tableInfo.LAST_DAY}";				// 마지막일자

		// 예약 가능여부
		if(POSB_YN == 'Y') {
			$('input:radio[id="chk'+SCHE_DAY+'_1"]').trigger('click');
		} else {
			$('input:radio[id="chk'+SCHE_DAY+'_2"]').trigger('click');
		}

		if(SUNDAY_YN == 'Y') {
			$("#day"+SCHE_DAY).hide();
		}
	</c:forEach>

	if(LAST_DAY == '29') {
		$("#day30").hide();
		$("#day31").hide();
	}
	else if(LAST_DAY == '30') {
		$("#day31").hide();
	}
	
	$("input[name=endDate]").val(LAST_DAY);
}

/*********************************************************
 * 검색하기
 ******************************************************** */
function fnSearch() {
	document.searchForm.action = "<c:url value='/admin/rcm/cpm/tableCPM.do'/>";
	document.searchForm.submit();
}

/*********************************************************
 * 저장
 *********************************************************/
function fnSaveTable() {
	if(confirm("변경사항을 저장하시겠습니까?")) {
		document.insertTable.submit();
	}
}

/*********************************************************
 * 취소
 ******************************************************** */
function fnSaveCancel() {
	if(confirm("변경사항을 취소하시겠습니까?")) {
		window.location.href="/admin/rcm/cpm/tableCPM.do";
	}
}

</script>


<form method="post" action="" name="searchForm">
<!-- 검색 -->
<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width: 12%;">
			<col span="1" style="width: 34%;">
			<col span="1" style="width: 12%;">
			<col span="1" style="">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_l">년도 선택</th>
				<td class="ta_l">
					<div class="select_wrap">
						<select class="select" id="year" name="year">
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
						</select>
					</div>
				</td>
				<th scope="row" class="ta_l">월 선택</th>
				<td class="ta_l">
					<div class="select_wrap">
						<select class="select" id="month" name="month">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnSearch();" class="btn_ty02"> 확인 </a>
</div>
<!-- //검색 -->
</form>

<form method="post" action="/admin/rcm/cpm/insertTableCPM.do" name="insertTable">
<div class="board_ty ds02 mg_t50">
	<table>
		<colgroup>
			<col style="width: 15%">
			<col style="width: 35%">
			<col style="width: 15%">
			<col style="width: *">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일</th>
				<th scope="col">예약일정관리</th>
				<th scope="col">일</th>
				<th scope="col">예약일정관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td class="ta_l">
					<div class="input_wrap" id="day01">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display01" id="chk01_1" value="Y" checked="checked" class="ez-hide">
									<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk01_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display01" id="chk01_2" value="N" class="ez-hide"> 
								<label for="chk01_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">17</th>
				<td class="ta_l">
					<div class="input_wrap" id="day17">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display17" id="chk17_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk17_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display17" id="chk17_2" value="N" class="ez-hide"> 
								<label for="chk17_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td class="ta_l">
					<div class="input_wrap" id="day02">
						<span class="ds_raido"> 
						<span> 
							<input type="radio"	name="display02" id="chk02_1" value="Y" checked="checked" class="ez-hide">
							<!-- id 변경시 label for 값 같이 변경 --> 
							<label for="chk02_1">가능</label>
						</span> 
						<span class="mg_l20"> 
							<input type="radio" name="display02" id="chk02_2" value="N" class="ez-hide"> 
							<label for="chk02_2">마감</label>
						</span>
						</span>
					</div>
				</td>
				<th scope="row">18</th>
				<td class="ta_l">
					<div class="input_wrap" id="day18">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display18" id="chk18_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk18_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display18" id="chk18_2" value="N" class="ez-hide"> 
								<label for="chk18_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td class="ta_l">
					<div class="input_wrap" id="day03">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display03" id="chk03_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> <label for="chk03_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display03" id="chk03_2" value="N" class="ez-hide"> 
								<label for="chk03_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">19</th>
				<td class="ta_l">
					<div class="input_wrap" id="day19">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display19" id="chk19_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk19_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display19" id="chk19_2" value="N" class="ez-hide"> 
								<label for="chk19_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td class="ta_l">
					<div class="input_wrap" id="day04">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display04" id="chk04_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk04_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display04" id="chk04_2" value="N" class="ez-hide"> 
								<label for="chk04_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">20</th>
				<td class="ta_l">
					<div class="input_wrap" id="day20">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display20" id="chk20_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk20_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display20" id="chk20_2" value="N" class="ez-hide"> 
								<label for="chk20_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td class="ta_l">
					<div class="input_wrap" id="day05">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display05" id="chk05_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk05_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display05" id="chk05_2" value="N" class="ez-hide"> 
								<label for="chk05_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">21</th>
				<td class="ta_l">
					<div class="input_wrap" id="day21">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display21" id="chk21_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk21_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display21" id="chk21_2" value="N" class="ez-hide"> 
								<label for="chk21_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td class="ta_l">
					<div class="input_wrap" id="day06">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display06" id="chk06_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk06_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display06" id="chk06_2" value="N" class="ez-hide"> 
								<label for="chk06_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">22</th>
				<td class="ta_l">
					<div class="input_wrap" id="day22">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display22" id="chk22_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk22_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display22" id="chk22_2" value="N" class="ez-hide"> 
								<label for="chk22_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td class="ta_l">
					<div class="input_wrap" id="day07">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display07" id="chk07_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk07_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display07" id="chk07_2" value="N" class="ez-hide"> 
								<label for="chk07_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">23</th>
				<td class="ta_l">
					<div class="input_wrap" id="day23">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display23" id="chk23_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk23_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display23" id="chk23_2" value="N" class="ez-hide">
								<label for="chk23_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">8</th>
				<td class="ta_l">
					<div class="input_wrap" id="day08">
						<span class="ds_raido"> 
							<span> 
							<input type="radio" name="display08" id="chk08_1" value="Y" checked="checked" class="ez-hide">
							<!-- id 변경시 label for 값 같이 변경 --> 
							<label for="chk08_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display08" id="chk08_2" value="N" class="ez-hide"> 
								<label for="chk08_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">24</th>
				<td class="ta_l">
					<div class="input_wrap" id="day24">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display24" id="chk24_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk24_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display24" id="chk24_2" value="N" class="ez-hide"> 
								<label for="chk24_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">9</th>
				<td class="ta_l">
					<div class="input_wrap" id="day09">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display09" id="chk09_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk9_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display09" id="chk09_2" value="N" class="ez-hide"> 
								<label for="chk9_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">25</th>
				<td class="ta_l">
					<div class="input_wrap" id="day25">
						<span class="ds_raido">
							<span> 
								<input type="radio" name="display25" id="chk25_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk25_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display25" id="chk25_2" value="N" class="ez-hide"> 
								<label for="chk25_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">10</th>
				<td class="ta_l">
					<div class="input_wrap" id="day10">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display10" id="chk10_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk10_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display10" id="chk10_2" value="N" class="ez-hide"> 
								<label for="chk10_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">26</th>
				<td class="ta_l">
					<div class="input_wrap" id="day26">
						<span class="ds_raido"> 
							<span> 
								<input type="radio"	name="display26" id="chk26_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk26_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display26" id="chk26_2" value="N" class="ez-hide"> 
								<label for="chk26_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">11</th>
				<td class="ta_l">
					<div class="input_wrap" id="day11">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display11" id="chk11_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> <label for="chk11_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display11" id="chk11_2" value="N" class="ez-hide"> 
								<label for="chk11_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">27</th>
				<td class="ta_l">
					<div class="input_wrap" id="day27">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display27" id="chk27_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk27_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display27" id="chk27_2" value="N" class="ez-hide"> 
								<label for="chk27_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">12</th>
				<td class="ta_l">
					<div class="input_wrap" id="day12">
						<span class="ds_raido"> 
						<span> 
						<input type="radio"	name="display12" id="chk12_1" value="Y" checked="checked" class="ez-hide">
							<!-- id 변경시 label for 값 같이 변경 --> 
							<label for="chk12_1">가능</label>
						</span> 
						<span class="mg_l20"> 
							<input type="radio" name="display12" id="chk12_2" value="N" class="ez-hide"> 
							<label for="chk12_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">28</th>
				<td class="ta_l">
					<div class="input_wrap" id="day28">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display28" id="chk28_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk28_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display28" id="chk28_2" value="N" class="ez-hide"> 
								<label for="chk28_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">13</th>
				<td class="ta_l">
					<div class="input_wrap" id="day13">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display13" id="chk13_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk13_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display13" id="chk13_2" value="N" class="ez-hide">
								<label for="chk13_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">29</th>
				<td class="ta_l">
					<div class="input_wrap" id="day29">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display29" id="chk29_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk29_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display29" id="chk29_2" value="N" class="ez-hide"> 
								<label for="chk29_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">14</th>
				<td class="ta_l">
					<div class="input_wrap" id="day14">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display14" id="chk14_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk14_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display14" id="chk14_2" value="N" class="ez-hide"> 
								<label for="chk14_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">30</th>
				<td class="ta_l">
					<div class="input_wrap" id="day30">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display30" id="chk30_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk30_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display30" id="chk30_2" value="N" class="ez-hide"> 
								<label for="chk30_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">15</th>
				<td class="ta_l">
					<div class="input_wrap" id="day15">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display15" id="chk15_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk15_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display15" id="chk15_2" value="N" class="ez-hide"> 
								<label for="chk15_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row">31</th>
				<td class="ta_l">
					<div class="input_wrap" id="day31">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display31" id="chk31_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk31_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display31" id="chk31_2" value="N" class="ez-hide"> 
								<label for="chk31_2">마감</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">16</th>
				<td class="ta_l">
					<div class="input_wrap" id="day16">
						<span class="ds_raido"> 
							<span> 
								<input type="radio" name="display16" id="chk16_1" value="Y" checked="checked" class="ez-hide">
								<!-- id 변경시 label for 값 같이 변경 --> 
								<label for="chk16_1">가능</label>
							</span> 
							<span class="mg_l20"> 
								<input type="radio" name="display16" id="chk16_2" value="N" class="ez-hide">
								<label for="chk16_2">마감</label>
							</span>
						</span>
					</div>
				</td>
				<th scope="row"></th>
				<td class="ta_l"></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnSaveTable();" class="btn_ty02">저장하기</a>
	<a href="javascript:fnSaveCancel();" class="btn_ty">취소하기</a>
</div>

<input type="hidden" name="year" value="${year}"/>
<input type="hidden" name="month" value="${month}"/>
<input type="hidden" name="endDate"/>

</form>
