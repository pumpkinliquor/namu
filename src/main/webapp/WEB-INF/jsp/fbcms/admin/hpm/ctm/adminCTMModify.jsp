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
		var agent = navigator.userAgent.toLowerCase();
		
		$(".btn_shape_x").on("click",function(e) {
			e.preventDefault();
			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
				$(this).prev().html('');
				var file_input = $(this).parent().next().find("input[type=file]");
				file_input.replaceWith(file_input.clone(true));
			}
			var file_input = $(this).parent().next().find("input[type=file]");
			$(this).prev().html('');
			file_input.val("");
			file_input.html("");
		});
		
		$("input[type=file]").on("change",function(e){
			e.preventDefault();
			var a = $('input[name="'+$(this).prop("name")+'"]');
			var filevalue = $(this).val();
			var fileNameArray = filevalue.split('\\');
			var fileName = fileNameArray[fileNameArray.length -1];
			$('a[name="'+$(this).prop("name")+'_NM"]').html(fileName);
			
		});
	}
	/*********************************************************
	 * 저장하기
	/******************************************************** */
	function fnUpdateForm() {
		if(confirm("등록하시겠습니까?")){
			document.updateForm.action="<c:url value='/admin/hpm/ctm/updateCTM.do'/>";
			document.updateForm.submit();	
		}
	}
	/*********************************************************
	 * 저장하기
	/******************************************************** */
	function fnCancel() {
		if(confirm("등록을 취소하시겠습니까?")){
			window.location.href="/admin/hpm/ctm/selectCTMList.do";
		}
	}
</script>
<h3 class="mid_tit mg_t50">${centerVO.MNG_NM } 관리</h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>
<form method="post" action="" name="updateForm" enctype="multipart/form-data">
<input type="hidden" name="MNG_CD" value="${centerVO.MNG_CD }" id=""/>
<c:if test="${index eq '1' }">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="bo_r" rowspan="4">1</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT }">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX }</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" name="DTIL_LIST[0].IMG_FILE_NM" href="#">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM }</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y' }">
										<input type="radio" name="USE_YN" id="chk01_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y' }">
										<input type="radio" name="USE_YN" id="chk01_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk01_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N' }">
										<input type="radio" name="USE_YN" id="chk01_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N' }">
										<input type="radio" name="USE_YN" id="chk01_2" class="ez-hide" value="N">
									</c:if>
									<label for="chk01_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '2' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="21" class="bo_r">2</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT }">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX" >${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM }</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[2].DTIL_SEQ" value="3" id=""/>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[2].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[2].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[2].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[2].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[2].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[2].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input3">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input3" class="realFile_btn input_none" name="DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[3].DTIL_SEQ" value="4" id=""/>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[3].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[3].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[3].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[3].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[3].IMG_FILE_NM">DTIL_LIST[3].TEXT_TX.DTIL_LIST[3].IMG_FILE_NM</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input4">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input4" class="realFile_btn input_none" name="DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[4].DTIL_SEQ" value="5" id=""/>
					<th scope="row" class="bo_r" rowspan="3">5</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[4].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[4].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[4].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[4].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name5" href="#" name="DTIL_LIST[4].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[4].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input5">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input5" class="realFile_btn input_none" name="DTIL_LIST[4].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[5].DTIL_SEQ" value="6" id=""/>
					<th scope="row" class="bo_r" rowspan="3">6</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[5].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[5].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[5].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[5].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[5].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[5].IMG_FILE_NM} </a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input6">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input6" class="realFile_btn input_none" name="DTIL_LIST[5].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>노출개수</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].SHOW_CNT_CD == '4'}">
										<input type="radio" name="SHOW_CNT_CD" id="chk02_1" checked="checked" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].SHOW_CNT_CD != '4'}">
										<input type="radio" name="SHOW_CNT_CD" id="chk02_1" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk02_1">4</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].SHOW_CNT_CD == '6'}">
										<input type="radio" name="SHOW_CNT_CD" id="chk02_2" checked="checked" class="ez-hide" value="6">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].SHOW_CNT_CD != '6'}">
										<input type="radio" name="SHOW_CNT_CD" id="chk02_2" class="ez-hide" value="6">
									</c:if>
									
									<label for="chk02_2">6</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
								
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y' }">
										<input type="radio" name="USE_YN" id="chk03_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk03_1"  class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk03_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk03_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk03_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk03_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '3' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="9" class="bo_r">3</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>VS 표기 사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk04_1" checked="checked" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk04_1"  class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk04_1">4</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk04_2" checked="checked" class="ez-hide" value="6">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk04_2" class="ez-hide" value="6">
									</c:if>
									
									<label for="chk04_2">6</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk05_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk05_1"  class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk03_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk05_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk05_2" class="ez-hide" value="N">
									</c:if>
									<label for="chk05_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '4' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="9" class="bo_r">4</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
				
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>VS 표기 사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk06_1" checked="checked" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk06_1" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk06_1">4</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk06_2" checked="checked" class="ez-hide" value="6">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk06_2" class="ez-hide" value="6">
									</c:if>
									
									<label for="chk06_2">6</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk07_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk07_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk07_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk07_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk07_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk07_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '5' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="4" class="bo_r">5</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk08_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk08_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk08_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk08_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk08_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk08_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '6' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="9" class="bo_r">6</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>VS 표기 사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk09_1" checked="checked" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '4'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk09_1" class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk09_1">4</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk09_2" checked="checked" class="ez-hide" value="6">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != '6'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk09_2" class="ez-hide" value="6">
									</c:if>
									
									<label for="chk09_2">6</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk10_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk10_1"  class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk10_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk10_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk10_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk10_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '7' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="11" class="bo_r">7</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TEXT_TX" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TEXT_TX" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[2].DTIL_SEQ" value="3" id=""/>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[2].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[2].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[2].TEXT_TX" value="${centerVO.TMP_LIST[0].DTIL_LIST[2].TEXT_TX}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[2].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[2].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input3">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input3" class="realFile_btn input_none" name="DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk11_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk11_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk11_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk11_2" checked="checked" class="ez-hide" value="N">	
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk11_2" class="ez-hide" value="N">	
									</c:if>
									
									<label for="chk11_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '8' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="5" class="bo_r">8</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>동영상</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM"></a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
									<input type="radio" name="USE_YN" id="chk11_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
									<input type="radio" name="USE_YN" id="chk11_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk11_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk11_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk11_2" class="ez-hide" value="N">
									</c:if>
									<label for="chk11_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '9' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="19" class="bo_r">9</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[2].DTIL_SEQ" value="3" id=""/>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[2].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[2].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[2].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[2].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[2].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[2].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input3">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input3" class="realFile_btn input_none" name="DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[3].DTIL_SEQ" value="4" id=""/>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[3].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[3].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[3].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[3].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[3].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[3].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input4">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input4" class="realFile_btn input_none" name="DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[4].DTIL_SEQ" value="5" id=""/>
					<th scope="row" class="bo_r" rowspan="3">5</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[4].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[4].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[4].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[4].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[4].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[4].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input5">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input5" class="realFile_btn input_none" name="DTIL_LIST[4].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[5].DTIL_SEQ" value="6" id=""/>
					<th scope="row" class="bo_r" rowspan="3">6</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[5].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[5].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[5].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[5].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[5].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[5].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input6">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input6" class="realFile_btn input_none" name="DTIL_LIST[5].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '10' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="9" class="bo_r">10</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>VS 표기 사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == 'Y'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk12_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != 'Y'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk12_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk11_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN == 'N'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk12_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].VS_MARK_USE_YN != 'N'}">
										<input type="radio" name="VS_MARK_USE_YN" id="chk12_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk12_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>	
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk13_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk13_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk13_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk13_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk13_2" class="ez-hide" value="N">
									</c:if>
									
									<label for="chk13_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '11' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="14" class="bo_r">11</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[1].DTIL_SEQ" value="2" id=""/>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[1].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[1].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[1].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[1].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[1].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[1].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input2" class="realFile_btn input_none" name="DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[2].DTIL_SEQ" value="3 id=""/>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[2].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[2].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[2].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[2].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[2].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[2].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input3">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input3" class="realFile_btn input_none" name="DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[3].DTIL_SEQ" value="4" id=""/>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[3].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[3].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[3].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[3].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[3].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[3].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input4">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input4" class="realFile_btn input_none" name="DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk14_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk14_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk14_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk14_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk14_2" class="ez-hide" value="N">
									</c:if>
									<label for="chk14_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '12' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:5%">
				<col span="1" style="width:10%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="5" class="bo_r">12</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk15_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk15_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk15_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk15_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk15_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<label for="chk15_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '13' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="5" class="bo_r">13</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="DTIL_LIST[0].TITLE_CT" value="${centerVO.TMP_LIST[0].DTIL_LIST[0].TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk16_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk16_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<label for="chk16_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk16_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk16_2" class="ez-hide" value="N">
									</c:if>
									<label for="chk16_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${index eq '14' }">
	<div class="board_ty mg_t30">
		<table>
			<colgroup>
				<col span="1" style="width:5%">
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" rowspan="4" class="bo_r">14</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="AREA_TITLE_CT" value="${centerVO.TMP_LIST[0].AREA_TITLE_CT}">
						</div>
					</td>
				</tr>
				<tr>
					<input type="hidden" name="DTIL_LIST[0].DTIL_SEQ" value="1" id=""/>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="DTIL_LIST[0].TEXT_TX">${centerVO.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div>
								<a class="file_name" href="#" name="DTIL_LIST[0].IMG_FILE_NM">${centerVO.TMP_LIST[0].DTIL_LIST[0].IMG_FILE_NM}</a><a href="#" class="btn_shape_x">삭제</a>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file-input1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file-input1" class="realFile_btn input_none" name="DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="">
								<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'Y'}">
										<input type="radio" name="USE_YN" id="chk17_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'Y'}">
										<input type="radio" name="USE_YN" id="chk17_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									</c:if>
									
									<label for="chk17_1">Y</label>
								</span>
								<span>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN == 'N'}">
										<input type="radio" name="USE_YN" id="chk17_2" checked="checked" class="ez-hide" value="N">
									</c:if>
									<c:if test="${centerVO.TMP_LIST[0].USE_YN != 'N'}">
										<input type="radio" name="USE_YN" id="chk17_2" class="ez-hide" value="N">	
									</c:if>
									
									<label for="chk17_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
<div class="board_ty mg_t30">
	<table>
		<colgroup>
			<col span="1" style="width:20%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>관련 진료과 사용</th>
				<td class="ta_l">
					<div class="input_wrap">
						<span class="ds_raido">
							<span>
								<c:if test="${centerVO.RLT_MEDI_USE_YN == 'Y'}">
									<input type="radio" name="RLT_MEDI_USE_YN" id="chk18_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
								</c:if>
								<c:if test="${centerVO.RLT_MEDI_USE_YN != 'Y'}">
									<input type="radio" name="RLT_MEDI_USE_YN" id="chk18_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
								</c:if>
								
								<label for="chk18_1">Y</label>
							</span>
							<span>
								<c:if test="${centerVO.RLT_MEDI_USE_YN == 'N'}">
									<input type="radio" name="RLT_MEDI_USE_YN" checked="checked" id="chk18_2" class="ez-hide" value="N">
								</c:if>
								<c:if test="${centerVO.RLT_MEDI_USE_YN != 'N'}">
									<input type="radio" name="RLT_MEDI_USE_YN" id="chk18_2" class="ez-hide" value="N">
								</c:if>
								<label for="chk18_2">N</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 사용</th>
				<td class="ta_l">
					<div class="input_wrap">
						<span class="ds_raido">
							<span>
								<c:if test="${centerVO.IMP_DISS_USE_YN == 'Y'}">
								<input type="radio" name="IMP_DISS_USE_YN" id="chk19_1" checked="checked" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
								</c:if>
								<c:if test="${centerVO.IMP_DISS_USE_YN != 'Y'}">
								<input type="radio" name="IMP_DISS_USE_YN" id="chk19_1" class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
								</c:if>
								
								<label for="chk19_1">Y</label>
							</span>
							<span>
								<c:if test="${centerVO.IMP_DISS_USE_YN == 'N'}">
									<input type="radio" name="IMP_DISS_USE_YN" id="chk19_2" checked="checked" class="ez-hide" value="N">
								</c:if>
								<c:if test="${centerVO.IMP_DISS_USE_YN != 'N'}">
									<input type="radio" name="IMP_DISS_USE_YN" id="chk19_2" class="ez-hide" value="N">
								</c:if>
								
								<label for="chk19_2">N</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">검색</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" class="inp_txt w_full" name="SEARCH_TAGS" value="${centerVO.SEARCH_TAGS }">
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btns">
	<a href="javascript:fnUpdateForm();" class="btn_ty02"> 저장하기 </a>
	<a href="javascript:fnCancel();" class="btn_ty"> 취소하기</a>
</div>
</form>
