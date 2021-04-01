<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%
	pageContext.setAttribute("crlf", "\r\n");
%>
<script type="text/javascript">
	/*********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}
	/*********************************************************
	 * 의료진 등록
	 ******************************************************** */
	function fnDoctorPopup(){
		if(confirm("선택을 완료하시겠습니까?")){
			var status = $("input[name=status]:checked").val();
			var element = $("td[name=seq" + status+"]");
			var DR_ID = element.eq(0).html();
			var DR_NM = element.eq(1).html();
			var MEDI_SBJ_NM = element.eq(2).html();
			var MEDI_SBJ_CD = element.eq(3).html();
			pop_close('#lypop01');
			$("#DR_NM").html(DR_NM);
			$("#MEDI_SBJ_NM").html(MEDI_SBJ_NM);
			$("input[name=DR_ID]").val(DR_ID);
			$("input[name=DR_NM]").val(DR_NM);
			$("input[name=MEDI_SBJ_NM]").val(MEDI_SBJ_NM);
			$("input[name=MEDI_SBJ_CD]").val(MEDI_SBJ_CD);
		}
	}
	/*********************************************************
	 * 의료진 팝업취소
	 ******************************************************** */
	function fnDoctorPopCancel(){
		if(confirm("선택을 취소하시겠습니까?")){
			$("input[name=status]").each(function(e){
				$(this).prop("checked", false);
				$(this).parent().removeClass("ez-selected");
			});
			pop_close('#lypop01');
		}
	}
	/*********************************************************
	 * 센터팝업 등록
	 ******************************************************** */
	function fnCenterPopup(){
		if(confirm("선택을 완료하시겠습니까?")){
			$("#centerCT").html("");
			$("#MNG_CENTER_CD").val("");
			var status = [];
			var MNG_CENTER_CDS = [];
			var MNG_CENTER_NMS = [];
			pop_close('#lypop02');
			$("input[name=statusCT]:checked").each(function() {
				status.push($(this).val());
			});
			for(var i=0; i < status.length;i++){
				var element = $("td[name=ctSeq" + status[i]+"]");
				MNG_CENTER_CDS.push(element.eq(1).html());
				MNG_CENTER_NMS.push(element.eq(0).html());
				$("#centerCT").html($("#centerCT").html()+MNG_CENTER_NMS[i]+"</br>");
				$("#MNG_CENTER_CD").val($("#MNG_CENTER_CD").val()+MNG_CENTER_CDS[i]+",");
				
			}
			
			var lastComma = $("#MNG_CENTER_CD").val();
			if(typeof(lastComma)==="string"){
				if(lastComma.charAt(lastComma.length-1) === "," ){
					$("#MNG_CENTER_CD").val(lastComma.slice(0,-1));
				}
			}
		}
	}
	/*********************************************************
	 * 센터팝업 취소
	 ******************************************************** */
	function fnCenterPopCancel(){
		if(confirm("선택을 취소하시겠습니까?")){
			$('input[name="statusCT"]').prop("checked",false);
			$('input[name="statusCT"]').each(function() {
				$(this).parent().removeClass("ez-checked");
			});
			var MNG_CENTER_CDS = $("#MNG_CENTER_CD").val().split(",");
			for(var i=0; i<$("tr[name=ct]").length;i++){
				for(var j=0; j<MNG_CENTER_CDS.length;j++){
					if( MNG_CENTER_CDS[j] === $("td[name=ctSeq"+i+"]").eq(1).html()){
						$("#ctSeq"+i).prop("checked",true);
						$("#ctSeq"+i).parent().addClass("ez-checked");
					}
				}
			}
			pop_close('#lypop02');
		}
	}
	/*********************************************************
	 * 파일찾기
	 ******************************************************** */
	function fnFileSelect(a_id, fileValue) {
		$("#" + a_id).val(fileValue);
		var file = fileValue.split("\\");
		var fileName = file[file.length - 1];

		$("#" + a_id).html(fileName);

	}
	/*********************************************************
	 * 파일초기화
	 ******************************************************** */
	function fnFileInit(fileId, aId) {
		var agent = navigator.userAgent.toLowerCase();
		if ((navigator.appName == 'Netscape' && navigator.userAgent
				.search('Trident') != -1)
				|| (agent.indexOf("msie") != -1)) {
			// ie 일때 input[type=file] init.
			$("#" + fileId).replaceWith($("#" + fileId).clone(true));
			$("#" + aId).val("");
			$("#" + aId).html("");
		} else {
			//other browser 일때 input[type=file] init.
			$("#" + fileId).val("");
			$("#" + aId).val("");
			$("#" + aId).html("");
		}
	}
	/*********************************************************
	 * 등록
	 ******************************************************** */
	function fnInsertDRM() {
		document.insertForm.action = "<c:url value='/admin/hpm/drm/insertDRM.do'/>";
		if($("input[name=DR_NM]").val() === ''){
			alert("의료진명을 입력해주세요.");
			return ;
		}
		if($("input[name=FIELD_CT]").val() === ''){
			alert("분야를 입력해주세요.");
			return ;
		}
		
		if($("#a_file_txt").html() === ''){
			alert("PC 이미지를 첨부해주세요.");
			return ;
		}
		if($("#b_file_txt").html() === ''){
			alert("Mobile 이미지를 첨부해주세요.");
			return ;
		}
		
		if(confirm("등록하시겠습니까?"))
			document.insertForm.submit();
	}
	/*********************************************************
	 * 등록 취소
	 ******************************************************** */
	function fnInsertCancel() {
		if(confirm("등록을 취소하시겠습니까?")){
			window.location.href="/admin/hpm/drm/selectDRMList.do";
		}
	}
</script>
<h3 class="mid_tit mg_t50">의료진관리 등록</h3>
<p class="te_ri_txt">
	<em class="ootc">*</em>필수입력 항목 입니다.
</p>
<form method="post" name="insertForm" action=""
	enctype="multipart/form-data">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width: 15%">
				<col span="1" style="width: 35%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: *">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>의료진명</th>
					<td class="ta_l">
						<span id="DR_NM"></span> 
							<input type="hidden" name="DR_NM" value="" /> 
							<input type="hidden" name="DR_ID" value="" /> 
							<a href="javascript:pop_open('#lypop01');" class="btn sm">검색하기</a></td>
					<th scope="row" class="ta_r">진료과목</th>
					<td class="ta_l"><span class="pd_l10" id="MEDI_SBJ_NM"></span>
						<input type="hidden" name="MEDI_SBJ_NM" value="" /> <input
						type="hidden" name="MEDI_SBJ_CD" value="" /></td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>분야</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="FIELD_CT"
								id="FIELD_CT">
						</div>
					</td>
					<th scope="row" class="ta_r">포지션</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="POSITION_CT"
								id="POSITION_CT">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>PC 이미지</th>
					<td class="ta_l" colspan="3">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" id="a_file_txt"></a> 
								<a href="javascript:fnFileInit('file-input','a_file_txt')"
									class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input"> <span class="btn_xs">파일
										찾기</span>
								</label> <input type="file" id="file-input"
									class="realFile_btn input_none" name="file_up1"
									title="첨부파일이미지 찾아보기"
									onchange="javascript:fnFileSelect('a_file_txt',this.value)">
								<span class="dc"> *이미지 사이즈 : 1000*1000 | 용량: 10mb 이하 |
									jpg, gif, png, jpeg </span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>Mobile 이미지
					</th>
					<td class="ta_l" colspan="3">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" id="b_file_txt"></a> <a
									href="javascript:fnFileInit('file-input1','b_file_txt')"
									class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1"> <span class="btn_xs">파일
										찾기</span>
								</label> <input type="file" id="file-input1"
									class="realFile_btn input_none" name="file_up2"
									title="첨부파일이미지 찾아보기"
									onchange="javascript:fnFileSelect('b_file_txt',this.value) ">
								<span class="dc"> *이미지 사이즈 : 500*500 | 용량: 10mb 이하 |
									jpg, gif, png, jpeg </span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">담당 센터</th>
					<td class="ta_l" colspan="3"><a
						href="javascript:pop_open('#lypop02');" class="btn sm">선택하기</a> 
						<input type="hidden" name="MNG_CENTER_CD" id="MNG_CENTER_CD" />
						<p id="centerCT">
						</p>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">전문분야</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<textarea style="width: 100%; height: 100px" name="SPCL_FIELD_TX"
								id="SPCL_FIELD_TX"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">방송출연</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<textarea style="width: 100%; height: 100px"
								name="BROAD_APPEAR_TX" id="BROAD_APPEAR_TX"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">좌측 약력</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<textarea style="width: 100%; height: 100px" name="HISTORY_TX"
								id="HISTORY_TX"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">우측 약력</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<textarea style="width: 100%; height: 100px" name="HISTORY_TX2"
								id="HISTORY_TX2"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">블로그 링크</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="BLOG_ADD_TX"
								id="BLOG_ADD_TX">
						</div>
						<div class="input_wrap">
							<span class="ez-checkbox"> <span> 
								<input type="checkbox" id="BLOG_USE" value="Y" name="BLOG_USE" class="chk_ty ez-hide"> <!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">사용</label>
							</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">추가노출 설정</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap dis_inl">
							<span class="ez-checkbox">
								<input type="checkbox" id="chk02_1" name="ADD_OPEN_SET_CD" value="02" class="chk_ty ez-hide" ><!-- id 변경시 label for 값 같이 변경 -->
								<label for="chk02_1">예약</label>
								<input type="checkbox" id="chk02_2" name="ADD_OPEN_SET_CD" value="01" class="chk_ty ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
								<label for="chk02_2">진료시간표</label>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">검색 </th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="200" id="SEARCH_TAG_CT"
								name="SEARCH_TAG_CT">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">진료예약 문구</th>
					<td class="ta_l" colspan="3">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="200" name="CLINIC_APPO_WORD_CT">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l" colspan="3"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="javascript:fnInsertDRM()" class="btn_ty02"> 저장하기 </a> <a
			href="javascript:fnInsertCancel()" class="btn_ty">취소하기</a>
	</div>
</form>
<!-- 의료진 검색 레이어팝업 -->
<div class="lypop_wrap" id="lypop01">
	<div class="sm_con scy" style="top: 300px">
		<div class="pop_top">
			<h2>의료진 검색</h2>
			<a href="javascript:fnDoctorPopCancel();" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit">
				<strong>의료진</strong>
			</h3>

			<div class="board_ty ds02">
				<table>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 240px">
						<col style="width: *">
					</colgroup>
					<thead>
						<tr>
							<th>의료진코드</th>
							<th>의료진명</th>
							<th>진료과목</th>
							<th>선택</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="board_ty ds02 scy_box">
				<table>
					<colgroup>
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 240px">
						<col style="width: *">
					</colgroup>
					<tbody>
						<c:forEach items="${doctorList }" var="doctorInfo"
							varStatus="status">
							<tr class="doctor">
								<td name="seq${status.index }">${doctorInfo.DR_ID }</td>
								<td name="seq${status.index }">${doctorInfo.DR_NM }</td>
								<td name="seq${status.index }">${doctorInfo.DPTNM }</td>
								<td name="seq${status.index }" style="display: none;">${doctorInfo.DPTCD }</td>
								<td>
									<div class="input_wrap">
										<span class="ds_raido"> <span> <c:if
													test="${doctorInfo.is == 'Y' }">
													<input type="radio" name="status" disabled="disabled"
														value="${status.index }">
												</c:if> <c:if test="${doctorInfo.is != 'Y' }">
													<input type="radio" name="status" value="${status.index }">
												</c:if> <!-- id 변경시 label for 값 같이 변경 -->
										</span>
										</span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="javascript:fnDoctorPopup();" class="btn_ty02" id="selectDR">확인하기</a> <a
					href="javascript:fnDoctorPopCancel();" class="btn_ty p_cancle">취소하기</a>
			</div>
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>
<!-- //의료진 검색  레이어팝업 -->


<!-- 센터선택 레이어팝업 -->
<div class="lypop_wrap" id="lypop02">
	<div class="sm_con" style="top: 300px">
		<div class="pop_top">
			<h2>센터 선택</h2>
			<a href="javascript:fnCenterPopCancel();" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit">
				<strong>센터</strong>
			</h3>

			<div class="board_ty ds02">
				<table>
					<colgroup>
						<col style="width: 440px">
						<col style="width: *">
					</colgroup>
					<thead>
						<tr>
							<th>센터명</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${centerList }" var="certerInfo" varStatus="status">
							<tr name="ct" >
								<td name="ctSeq${status.index }" class="ta_l"><c:out value="${certerInfo.nttSj}"/></td>
								<td name="ctSeq${status.index }" style="display: none;"><c:out value="${certerInfo.custom1}"/></td>
								<td>
									<div class="input_wrap">
										<span class="ds_raido"> 
											<span> 
												<input type="checkbox" id="ctSeq${status.index }" name="statusCT" class="chk_ty ez-hide" value="${status.index }">
												<!-- id 변경시 label for 값 같이 변경 -->
											</span>
										</span>
									</div>
								</td>
							</tr>
						</c:forEach>					

					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="javascript:fnCenterPopup();" class="btn_ty02" id="selectCT">확인하기</a>
				<a href="javascript:fnCenterPopCancel();" class="btn_ty p_cancle">취소하기</a>
			</div>
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>
<!-- //센터선택 레이어팝업 -->