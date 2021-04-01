<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<% pageContext.setAttribute("crlf", "\r\n"); %>

<h2 class="mid_tit">클리닉 관리 수정</h2>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<div class="board_ty">
	<table>
		<colgroup>
			<col span="1" style="width:20%">
			<col span="1" style="width:30%">
			<col span="1" style="width:20%">
			<col span="1" style="width:*">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="ta_r"><em class="ootc">*</em>클리닉명</th>
				<td class="ta_l">
					<div class="input_wrap">
						<input type="text" class="inp_txt w_full" id="clinicNm" name="clinicNm" value="${clinicInfo.CLINIC_NM}">
					</div>
				</td>
				<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
				<td class="ta_l">
					<div class="input_wrap">
						<span class="ds_raido">
							<span>
								<input type="radio" id="chk01_1"<c:if test="${clinicInfo.POST_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
								<label for="chk01_1">Y</label>
							</span>
							<span>
								<input type="radio" id="chk01_2"<c:if test="${clinicInfo.POST_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N"><!-- id 변경시 label for 값 같이 변경 -->
								<label for="chk01_2">N</label>
							</span>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" class="ta_r">템플릿 선택</th>
				<td class="ta_l" colspan="3">
					<div class="select_wrap">
						<select class="select" name="TEMPL_CD" disabled="disabled">
							<option value="A"<c:if test="${clinicInfo.TEMPL_CD eq 'A'}"> selected="selected"</c:if>>A</option>
							<option value="B"<c:if test="${clinicInfo.TEMPL_CD eq 'B'}"> selected="selected"</c:if>>B</option>
							<option value="C"<c:if test="${clinicInfo.TEMPL_CD eq 'C'}"> selected="selected"</c:if>>C</option>
						</select>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<c:choose>
	<c:when test="${clinicInfo.TEMPL_CD eq 'B'}">
		<form id="formInsertB" name="formInsertB" action="/admin/hpm/cln/updateCLN.do" method="post" onSubmit="updateCLN(document.formInsertB); return false;" enctype="multipart/form-data">
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[0].SEQ" value="1"/>
							<input type="hidden" name="TMP_LIST[0].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[0].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[0].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk201_1"<c:if test="${TMP_LIST[0].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk201_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk201_2"<c:if test="${TMP_LIST[0].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk201_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[1].SEQ" value="2"/>
							<th scope="row" rowspan="8" class="bo_r">2</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[1].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[1].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[1].DTIL_LIST[0].TITLE_CT" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tb0100_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_b1','tb0100_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_b1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_b1" class="realFile_btn input_none" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0100_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[1].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" rowspan="3" class="bo_r">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[1].DTIL_LIST[1].TITLE_CT" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[1].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[1].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[1].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[1].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tb0101_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[1].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[1].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[1].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_1_1','tb0101_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_1_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_1_1" class="realFile_btn input_none" name="TMP_LIST[1].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0101_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk203_1"<c:if test="${TMP_LIST[1].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk203_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk203_2"<c:if test="${TMP_LIST[1].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk203_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[2].SEQ" value="3"/>
							<th scope="row" rowspan="9" class="bo_r">3</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[2].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[2].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[2].DTIL_LIST[0].TITLE_CT" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tb0200_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_b2','tb0200_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_b2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_b2" class="realFile_btn input_none" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0200_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[2].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" rowspan="3" class="bo_r">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[2].DTIL_LIST[1].TITLE_CT" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[1].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[2].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[2].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[2].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tb0201_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[2].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[2].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[2].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_2_1','tb0201_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_2_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_2_1" class="realFile_btn input_none" name="TMP_LIST[2].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0201_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[2].VS_MARK_USE_YN" id="chk204_1"<c:if test="${TMP_LIST[2].VS_MARK_USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk204_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[2].VS_MARK_USE_YN" id="chk204_2"<c:if test="${TMP_LIST[2].VS_MARK_USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk204_2">N</label>
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
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk205_1"<c:if test="${TMP_LIST[2].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk205_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk205_2"<c:if test="${TMP_LIST[2].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk205_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[3].SEQ" value="4"/>
							<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">4</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[3].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[3].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tb0300_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_b3','tb0300_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_b3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_b3" class="realFile_btn input_none" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0300_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk206_1"<c:if test="${TMP_LIST[3].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk206_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk206_2"<c:if test="${TMP_LIST[3].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk206_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[4].SEQ" value="5"/>
							<th scope="row" rowspan="4" class="bo_r">5</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[4].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[4].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						
						<tr>
							<input type="hidden" name="TMP_LIST[4].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트1<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[4].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트2<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[4].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[4].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk207_1"<c:if test="${TMP_LIST[4].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk207_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk207_2"<c:if test="${TMP_LIST[4].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk207_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
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
							<input type="hidden" name="TMP_LIST[5].SEQ" value="6"/>
							<th scope="row" rowspan="9" class="bo_r">6</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[5].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[5].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tb0500_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_5_0','tb0500_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_5_0">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_5_0" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0500_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" rowspan="3" class="bo_r">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tb0501_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_5_1','tb0501_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_5_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_5_1" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0501_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[5].VS_MARK_USE_YN" id="chk204_1"<c:if test="${TMP_LIST[5].VS_MARK_USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk204_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[5].VS_MARK_USE_YN" id="chk204_2"<c:if test="${TMP_LIST[5].VS_MARK_USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk204_2">N</label>
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
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk209_1"<c:if test="${TMP_LIST[5].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk205_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk209_2"<c:if test="${TMP_LIST[5].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk205_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[6].SEQ" value="7"/>
							<th scope="row" rowspan="4" class="bo_r">7</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[6].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[6].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tb0600_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_b6','tb0600_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_b6">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_b6" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tb0600_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk210_1"<c:if test="${TMP_LIST[6].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk210_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk210_2"<c:if test="${TMP_LIST[6].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk210_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_1"<c:if test="${clinicInfo.POST_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk112_1">Y</label>
										</span>
										<span>
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_2"<c:if test="${clinicInfo.POST_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk112_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop01');"  class="btn sm">선택하기</a>
								<span class="dissListNm"><c:forEach var="dslist" items="${clinicInfo.DISS_CDS_LIST}">${dslist}, </c:forEach></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>의료진 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop02');" class="btn sm">선택하기</a>
								<span class="drListNm"><c:forEach var="drlist" items="${clinicInfo.DR_LIST2}">${drlist}, </c:forEach></span>
							</td>
						</tr>
						 <tr>
							 <th scope="row" class="ta_r">검색 Tag</th>
							 <td class="ta_l">
								 <div class="input_wrap">
									 <input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									 <input type="hidden" name="SEARCH_TAGS" value="<c:out value='${clinicInfo.SEARCH_TAGS}'/>" >
									 <ul id="tagList" class="tagbox">
										 <c:forEach var="tagNmValue" items="${fn:split(clinicInfo.SEARCH_TAGS, ',')}">
										 	<li><c:out value="${tagNmValue}"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
										 </c:forEach>
									 </ul>
								 </div>
							 </td>
						 </tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns">
				<a href="javascript:updateCLN(document.formInsertB);" class="btn_ty02"> 저장하기 </a>
				<a href="/admin/hpm/cln/selectCLNList.do" class="btn_ty"> 취소하기 </a>
			</div>
			
			<input type="hidden" name="MNG_CD" value="${clinicInfo.MNG_CD}"/>
			<input type="hidden" name="MNG_SEQ" value="${clinicInfo.MNG_SEQ}"/>
			<input type="hidden" name="CLINIC_NM" value="${clinicInfo.CLINIC_NM}">
			<input type="hidden" name="POST_YN" value="${clinicInfo.POST_YN}"/>
			<input type="hidden" name="TEMPL_CD" value="${clinicInfo.TEMPL_CD}"/>
			<input type="hidden" name="MAJOR_DISS_CDS" value="${clinicInfo.MAJOR_DISS_CDS}">
			<input type="hidden" name="DR_IDS" value="${clinicInfo.DR_IDS}">
		</form>
	</c:when>
	<c:when test="${clinicInfo.TEMPL_CD eq 'C'}">
		<form id="formInsertC" name="formInsertC" action="/admin/hpm/cln/updateCLN.do" method="post" onSubmit="updateCLN(document.formInsertC); return false;" enctype="multipart/form-data">
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[0].SEQ" value="1"/>
							<input type="hidden" name="TMP_LIST[0].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[0].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[0].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk301_1"<c:if test="${TMP_LIST[0].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk301_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk301_2"<c:if test="${TMP_LIST[0].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk301_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[1].SEQ" value="2"/>
							<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">2</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[1].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[1].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0100_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_1','tc0100_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_1" class="realFile_btn input_none" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0100_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk302_1"<c:if test="${TMP_LIST[1].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk302_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk302_2"<c:if test="${TMP_LIST[1].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk302_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[2].SEQ" value="3"/>
							<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">3</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[2].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[2].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0200_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_2','tc0200_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_2" class="realFile_btn input_none" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0200_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk303_1"<c:if test="${TMP_LIST[2].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk303_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk303_2"<c:if test="${TMP_LIST[2].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk303_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[3].SEQ" value="4"/>
							<th scope="row" rowspan="9" class="bo_r">4</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[3].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[3].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[3].DTIL_LIST[0].TITLE_CT" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0300_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_3','tc0300_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_3" class="realFile_btn input_none" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0300_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[3].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" rowspan="3" class="bo_r">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[3].DTIL_LIST[1].TITLE_CT" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[1].TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[3].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[3].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[3].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tc0301_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[3].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[3].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[3].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_3_1','tc0301_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_3_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_3_1" class="realFile_btn input_none" name="TMP_LIST[3].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0301_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk305_1"<c:if test="${TMP_LIST[3].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk305_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk305_2"<c:if test="${TMP_LIST[3].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk305_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[4].SEQ" value="5"/>
							<input type="hidden" name="TMP_LIST[4].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">5</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[4].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[4].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0400_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_4','tc0400_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_4">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_4" class="realFile_btn input_none" name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0400_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk306_1"<c:if test="${TMP_LIST[4].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk306_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk306_2"<c:if test="${TMP_LIST[4].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk306_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[5].SEQ" value="6"/>
							<th scope="row" rowspan="6" class="bo_r">6</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[5].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[5].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200"name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0500_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_5','tc0500_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_5">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_5" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0500_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지2</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tc0501_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_5_1','tc0501_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_5_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_5_1" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0501_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지3</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[2].IMG_ATCH_NO}">
										<a class="file_name" id="tc0502_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[2].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_5_2','tc0502_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_5_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_5_2" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0502_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk307_1"<c:if test="${TMP_LIST[5].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk307_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk307_2"<c:if test="${TMP_LIST[5].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk307_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[6].SEQ" value="7"/>
							<th scope="row" rowspan="14" class="bo_r">7</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[6].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[6].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="bo_r" rowspan="3">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[0].TITLE_CT">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0600_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_6','tc0600_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_6">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_6" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0600_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="bo_r" rowspan="3">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[1].TITLE_CT">${clinicInfo.TMP_LIST[6].DTIL_LIST[1].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tc0601_file_txt" href="#none" name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-inputC_6_1','tc0601_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-inputC_6_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-inputC_6_1" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0601_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="bo_r" rowspan="3">3</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[2].TITLE_CT">${clinicInfo.TMP_LIST[6].DTIL_LIST[2].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[2].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[2].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO}">
										<a class="file_name" id="tc0602_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_6_2','tc0602_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_6_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_6_2" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0602_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[3].DTIL_SEQ" value="4"/>
							<th scope="row" class="bo_r" rowspan="3">4</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[3].TITLE_CT">${clinicInfo.TMP_LIST[6].DTIL_LIST[3].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[6].DTIL_LIST[3].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[3].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[3].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[3].IMG_ATCH_NO}">
										<a class="file_name" id="tc0603_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[3].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[3].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[3].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_6_3','tc0603_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_6_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_6_3" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0603_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk608_1"<c:if test="${TMP_LIST[6].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk308_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk608_2"<c:if test="${TMP_LIST[6].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk308_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[7].SEQ" value="8"/>
							<th scope="row" rowspan="14" class="bo_r">8</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[7].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[7].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[7].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="bo_r" rowspan="3">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[0].TITLE_CT">${clinicInfo.TMP_LIST[7].DTIL_LIST[0].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[7].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0700_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_7','tc0700_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_7">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_7" class="realFile_btn input_none" name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0700_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[7].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="bo_r" rowspan="3">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[1].TITLE_CT">${clinicInfo.TMP_LIST[7].DTIL_LIST[1].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[7].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[7].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[7].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tc0701_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[7].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[7].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[7].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_7_1','tc0701_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_7_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_7_1" class="realFile_btn input_none" name="TMP_LIST[7].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0701_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[7].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="bo_r" rowspan="3">3</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[2].TITLE_CT">${clinicInfo.TMP_LIST[7].DTIL_LIST[2].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[2].TEXT_TX">${clinicInfo.TMP_LIST[7].DTIL_LIST[2].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[7].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[7].DTIL_LIST[2].IMG_ATCH_NO}">
										<a class="file_name" id="tc0702_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[7].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[7].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[7].DTIL_LIST[2].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_7_2','tc0702_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_7_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_7_2" class="realFile_btn input_none" name="TMP_LIST[7].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0702_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[7].DTIL_LIST[3].DTIL_SEQ" value="4"/>
							<th scope="row" class="bo_r" rowspan="3">4</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[3].TITLE_CT">${clinicInfo.TMP_LIST[7].DTIL_LIST[3].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[7].DTIL_LIST[3].TEXT_TX">${clinicInfo.TMP_LIST[7].DTIL_LIST[3].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[7].DTIL_LIST[3].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[7].DTIL_LIST[3].IMG_ATCH_NO}">
										<a class="file_name" id="tc0703_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[7].DTIL_LIST[3].IMG_ATCH_NO}','0')" name="TMP_LIST[7].DTIL_LIST[3].IMG_FILE_NM">${clinicInfo.TMP_LIST[7].DTIL_LIST[3].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_7_3','tc0703_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_7_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_7_3" class="realFile_btn input_none" name="TMP_LIST[7].DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0703_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[7].USE_YN" id="chk708_1"<c:if test="${TMP_LIST[7].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk708_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[7].USE_YN" id="chk708_2"<c:if test="${TMP_LIST[7].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk708_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[8].SEQ" value="9"/>
							<th scope="row" rowspan="17" class="bo_r">9</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[8].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[8].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="bo_r" rowspan="3">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[8].DTIL_LIST[0].TITLE_CT">${clinicInfo.TMP_LIST[8].DTIL_LIST[0].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0800_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_8','tc0800_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_8">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_8" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0800_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="bo_r" rowspan="3">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[8].DTIL_LIST[1].TITLE_CT">${clinicInfo.TMP_LIST[8].DTIL_LIST[1].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[1].IMG_ATCH_NO}">
										<a class="file_name" id="tc0801_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_8_1','tc0801_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_8_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_8_1" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0801_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="bo_r" rowspan="3">3</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[8].DTIL_LIST[2].TITLE_CT">${clinicInfo.TMP_LIST[8].DTIL_LIST[2].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[2].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[2].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[2].IMG_ATCH_NO}">
										<a class="file_name" id="tc0802_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[2].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_8_2','tc0802_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_8_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_8_2" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0802_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[3].DTIL_SEQ" value="4"/>
							<th scope="row" class="bo_r" rowspan="3">4</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[8].DTIL_LIST[3].TITLE_CT">${clinicInfo.TMP_LIST[8].DTIL_LIST[3].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[3].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[3].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[3].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[3].IMG_ATCH_NO}">
										<a class="file_name" id="tc0803_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[3].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[3].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[3].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_8_3','tc0803_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_8_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_8_3" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0803_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[4].DTIL_SEQ" value="5"/>
							<th scope="row" class="bo_r" rowspan="3">5</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[8].DTIL_LIST[4].TITLE_CT">${clinicInfo.TMP_LIST[8].DTIL_LIST[4].TITLE_CT}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[4].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[4].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[4].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[4].IMG_ATCH_NO}">
										<a class="file_name" id="tc0804_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[4].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[4].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[4].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_8_4','tc0804_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_8_4">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_8_4" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[4].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0804_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[8].USE_YN" id="chk310_1"<c:if test="${TMP_LIST[8].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk310_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[8].USE_YN" id="chk310_2"<c:if test="${TMP_LIST[8].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk310_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[9].SEQ" value="10"/>
							<input type="hidden" name="TMP_LIST[9].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">10</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[9].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[9].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[9].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO}">
										<a class="file_name" id="tc0900_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_9','tc0900_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_9">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_9" class="realFile_btn input_none" name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc0900_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[9].USE_YN" id="chk311_1"<c:if test="${TMP_LIST[9].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk311_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[9].USE_YN" id="chk311_2"<c:if test="${TMP_LIST[9].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk311_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[10].SEQ" value="11"/>
							<th scope="row" rowspan="10" class="bo_r">11</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[10].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[10].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="tc1000_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_10','tc1000_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_10">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_10" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc1000_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지2</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO }">
										<a class="file_name" id="tc1001_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_10_1','tc1001_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_10_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_10_1" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc1001_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[2].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지3</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO }">
										<a class="file_name" id="tc1002_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_10_2','tc1002_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_10_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_10_2" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc1002_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[3].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[3].DTIL_SEQ" value="4"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지4</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO }">
										<a class="file_name" id="tc1003_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input_10_3','tc1003_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input_10_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input_10_3" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('tc1003_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[10].USE_YN" id="chk312_1"<c:if test="${TMP_LIST[10].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk312_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[10].USE_YN" id="chk312_2"<c:if test="${TMP_LIST[10].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk312_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_1"<c:if test="${clinicInfo.RLT_MEDI_USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk112_1">Y</label>
										</span>
										<span>
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_2"<c:if test="${clinicInfo.RLT_MEDI_USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk112_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop01');"  class="btn sm">선택하기</a>
								<span class="dissListNm"><c:forEach var="dslist" items="${clinicInfo.DISS_CDS_LIST}">${dslist}, </c:forEach></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>의료진 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop02');" class="btn sm">선택하기</a>
								<span class="drListNm"><c:forEach var="drlist" items="${clinicInfo.DR_LIST2}">${drlist}, </c:forEach></span>
							</td>
						</tr>
						 <tr>
							 <th scope="row" class="ta_r">검색 Tag</th>
							 <td class="ta_l">
								 <div class="input_wrap">
									 <input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									 <input type="hidden" name="SEARCH_TAGS" value="<c:out value='${clinicInfo.SEARCH_TAGS}'/>" >
									 <ul id="tagList" class="tagbox">
										 <c:forEach var="tagNmValue" items="${fn:split(clinicInfo.SEARCH_TAGS, ',')}">
										 	<li><c:out value="${tagNmValue}"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
										 </c:forEach>
									 </ul>
								 </div>
							 </td>
						 </tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns">
				<a href="javascript:updateCLN(document.formInsertC);" class="btn_ty02"> 저장하기 </a>
				<a href="/admin/hpm/cln/selectCLNList.do" class="btn_ty"> 취소하기 </a>
			</div>
			
			<input type="hidden" name="MNG_CD" value="${clinicInfo.MNG_CD}"/>
			<input type="hidden" name="MNG_SEQ" value="${clinicInfo.MNG_SEQ}"/>
			<input type="hidden" name="CLINIC_NM" value="${clinicInfo.CLINIC_NM}">
			<input type="hidden" name="POST_YN" value="${clinicInfo.POST_YN}"/>
			<input type="hidden" name="TEMPL_CD" value="${clinicInfo.TEMPL_CD}"/>
			<input type="hidden" name="MAJOR_DISS_CDS" value="${clinicInfo.MAJOR_DISS_CDS}">
			<input type="hidden" name="DR_IDS" value="${clinicInfo.DR_IDS}">
		</form>
	</c:when>
	<c:otherwise>
		<form id="formInsertA" name="formInsertA" action="/admin/hpm/cln/updateCLN.do" method="post" onSubmit="updateCLN(document.formInsertA); return false;" enctype="multipart/form-data">
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[0].SEQ" value="1"/>
							<input type="hidden" name="TMP_LIST[0].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="3" class="bo_r">1</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[0].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[0].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>사용</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk101_1"<c:if test="${TMP_LIST[0].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk101_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[0].USE_YN" id="chk101_2"<c:if test="${TMP_LIST[0].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk101_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[1].SEQ" value="2"/>
							<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">2</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[1].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[1].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta1_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input','ta1_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input" class="realFile_btn input_none" name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta1_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk102_1"<c:if test="${TMP_LIST[1].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk102_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[1].USE_YN" id="chk102_2"<c:if test="${TMP_LIST[1].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk102_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[2].SEQ" value="3"/>
							<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">3</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[2].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[2].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta2_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input2','ta2_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input2" class="realFile_btn input_none" name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta2_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk103_1"<c:if test="${TMP_LIST[2].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk103_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[2].USE_YN" id="chk103_2"<c:if test="${TMP_LIST[2].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk103_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[3].SEQ" value="4"/>
							<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">4</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[3].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[3].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta3_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input3','ta3_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input3" class="realFile_btn input_none" name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta3_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk104_1"<c:if test="${TMP_LIST[3].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk104_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[3].USE_YN" id="chk104_2"<c:if test="${TMP_LIST[3].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk104_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[4].SEQ" value="5"/>
							<input type="hidden" name="TMP_LIST[4].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">5</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[4].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[4].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta4_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input4','ta4_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input4">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input4" class="realFile_btn input_none" name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta4_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk105_1"<c:if test="${TMP_LIST[4].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk105_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[4].USE_YN" id="chk105_2"<c:if test="${TMP_LIST[4].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk105_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[5].SEQ" value="6"/>
							<th scope="row" rowspan="8" class="bo_r">6</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[5].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[5].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="bo_r" rowspan="3">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TITLE_CT }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TEXT_TX }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta5_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input5','ta5_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input5">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input5" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta5_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="bo_r" rowspan="3">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TITLE_CT }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대150자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="150" name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TEXT_TX }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO }">
										<a class="file_name" id="ta5_1_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input5_1','ta5_1_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input5_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input5_1" class="realFile_btn input_none" name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta5_1_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk106_1"<c:if test="${TMP_LIST[5].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk106_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[5].USE_YN" id="chk106_2"<c:if test="${TMP_LIST[5].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk106_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[6].SEQ" value="7"/>
							<th scope="row" rowspan="6" class="bo_r">7</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[6].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[6].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TEXT_TX }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta6_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input6','ta6_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input6">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input6" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta6_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지2</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO }">
										<a class="file_name" id="ta6_1_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input6_1','ta6_1_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input6_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input6_1" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta6_1_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[6].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지3</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO }">
										<a class="file_name" id="ta6_2_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input6_2','ta6_2_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input6_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input6_2" class="realFile_btn input_none" name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta6_2_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk107_1"<c:if test="${TMP_LIST[6].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk107_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[6].USE_YN" id="chk107_2"<c:if test="${TMP_LIST[6].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk107_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[7].SEQ" value="8"/>
							<input type="hidden" name="TMP_LIST[7].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">8</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[7].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[7].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[7].DTIL_LIST[0].TEXT_TX }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta7_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM}</a><a href="javascript:fnFileInit('file-input7','ta7_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input7">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input7" class="realFile_btn input_none" name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta7_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[7].USE_YN" id="chk108_1"<c:if test="${TMP_LIST[7].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk108_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[7].USE_YN" id="chk108_2"<c:if test="${TMP_LIST[7].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk108_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[8].SEQ" value="9"/>
							<input type="hidden" name="TMP_LIST[8].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" rowspan="4" class="bo_r">9</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[8].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[8].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="200" name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[8].DTIL_LIST[0].TEXT_TX }</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta8_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input8','ta8_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input8">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input8" class="realFile_btn input_none" name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta8_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[8].USE_YN" id="chk109_1"<c:if test="${TMP_LIST[8].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk109_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[8].USE_YN" id="chk109_2"<c:if test="${TMP_LIST[8].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk109_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
							<input type="hidden" name="TMP_LIST[9].SEQ" value="10"/>
							<th scope="row" rowspan="11" class="bo_r">10</th>
							<th scope="row" class="ta_r" colspan="2">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[9].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[9].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[9].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="bo_r" rowspan="3">1</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대5자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" maxlength="5" name="TMP_LIST[9].DTIL_LIST[0].TITLE_CT" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[0].TITLE_CT }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[0].TEXT_TX }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta9_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input9','ta9_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input9">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input9" class="realFile_btn input_none" name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta9_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[9].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="bo_r" rowspan="3">2</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대5자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" maxlength="5" name="TMP_LIST[9].DTIL_LIST[1].TITLE_CT" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[1].TITLE_CT }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[9].DTIL_LIST[1].TEXT_TX" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[1].TEXT_TX }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[9].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[1].IMG_ATCH_NO }">
										<a class="file_name" id="ta9_1_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[9].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[9].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[9].DTIL_LIST[1].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input9_1','ta9_1_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input9_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input9_1" class="realFile_btn input_none" name="TMP_LIST[9].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta9_1_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[9].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="bo_r" rowspan="3">3</th>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대5자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" maxlength="5" name="TMP_LIST[9].DTIL_LIST[2].TITLE_CT" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[2].TITLE_CT }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[9].DTIL_LIST[2].TEXT_TX" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[2].TEXT_TX }">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[9].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[9].DTIL_LIST[2].IMG_ATCH_NO }">
										<a class="file_name" id="ta9_2_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[9].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[9].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[9].DTIL_LIST[2].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input9_2','ta9_2_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input9_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input9_2" class="realFile_btn input_none" name="TMP_LIST[9].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta9_2_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[9].USE_YN" id="chk110_1"<c:if test="${TMP_LIST[9].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk110_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[9].USE_YN" id="chk110_2"<c:if test="${TMP_LIST[9].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk110_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="board_ty mg_t30">
				<table>
					<colgroup>
						<col span="1" style="width:5%">
						<col span="1" style="width:15%">
						<col span="1" style="width:*">
					</colgroup>
					<tbody>
						<tr>
							<input type="hidden" name="TMP_LIST[10].SEQ" value="11"/>
							<th scope="row" rowspan="14" class="bo_r">11</th>
							<th scope="row" class="ta_r">영역타이틀</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" class="inp_txt w_full" name="TMP_LIST[10].AREA_TITLE_CT" value="${clinicInfo.TMP_LIST[10].AREA_TITLE_CT}">
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[0].DTIL_SEQ" value="1"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[0].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지1</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10','ta10_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[1].DTIL_SEQ" value="2"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[1].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지2</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_1_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10_1','ta10_1_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10_1" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_1_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[2].DTIL_SEQ" value="3"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[2].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지3</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_2_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10_2','ta10_2_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10_2" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_2_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[3].DTIL_SEQ" value="4"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[3].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지4</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_3_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10_3','ta10_3_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10_3" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_3_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[4].DTIL_SEQ" value="5"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[4].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[4].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지5</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[4].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[4].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_4_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[4].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[4].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[4].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10_4','ta10_4_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10_4">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10_4" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[4].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_4_file_txt',this.value)">
										<span class="dc">*이미지 사이즈 : 1200*567 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<input type="hidden" name="TMP_LIST[10].DTIL_LIST[5].DTIL_SEQ" value="6"/>
							<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대50자</th>
							<td class="ta_l">
								<div class="input_wrap">
									<textarea style="width:100%;height:100px" maxlength="50" name="TMP_LIST[10].DTIL_LIST[5].TEXT_TX">${clinicInfo.TMP_LIST[10].DTIL_LIST[5].TEXT_TX}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>이미지6</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div>
										<input type="hidden" name="TMP_LIST[10].DTIL_LIST[5].IMG_ATCH_NO" value="${clinicInfo.TMP_LIST[10].DTIL_LIST[5].IMG_ATCH_NO }">
										<a class="file_name" id="ta10_5_file_txt" href="javascript:fnFileDownload('${clinicInfo.TMP_LIST[10].DTIL_LIST[5].IMG_ATCH_NO}','0')" name="TMP_LIST[10].DTIL_LIST[5].IMG_FILE_NM">${clinicInfo.TMP_LIST[10].DTIL_LIST[5].IMG_FILE_NM}</a>
										<a href="javascript:fnFileInit('file-input10_5','ta10_5_file_txt')" class="btn_shape_x">삭제</a>
									</div>
									<div class="input_wrap b_file_area">
										<label for="file-input10_5">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file-input10_5" class="realFile_btn input_none" name="TMP_LIST[10].DTIL_LIST[5].IMG_FILE" title="첨부파일이미지 찾아보기" onchange="javascript:fnFileSelect('ta10_5_file_txt',this.value)">
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
											<input type="radio" name="TMP_LIST[10].USE_YN" id="chk111_1"<c:if test="${TMP_LIST[10].USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk111_1">Y</label>
										</span>
										<span>
											<input type="radio" name="TMP_LIST[10].USE_YN" id="chk111_2"<c:if test="${TMP_LIST[10].USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk111_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
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
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_1"<c:if test="${clinicInfo.RLT_MEDI_USE_YN ne 'N'}"> checked="checked"</c:if> class="ez-hide" value="Y">
											<label for="chk112_1">Y</label>
										</span>
										<span>
											<input type="radio" name="RLT_MEDI_USE_YN" id="chk112_2"<c:if test="${clinicInfo.RLT_MEDI_USE_YN eq 'N'}"> checked="checked"</c:if> class="ez-hide" value="N">
											<label for="chk112_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop01');"  class="btn sm">선택하기</a>
								<span class="dissListNm"><c:forEach var="dslist" items="${clinicInfo.DISS_CDS_LIST}">${dslist}, </c:forEach></span>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>의료진 선택</th>
							<td class="ta_l">
								<a href="javascript:pop_open('#lypop02');" class="btn sm">선택하기</a>
								<span class="drListNm"><c:forEach var="drlist" items="${clinicInfo.DR_LIST2}">${drlist}, </c:forEach></span>
							</td>
						</tr>
						 <tr>
							 <th scope="row" class="ta_r">검색 Tag</th>
							 <td class="ta_l">
								 <div class="input_wrap">
									 <input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									 <input type="hidden" name="SEARCH_TAGS" value="<c:out value='${clinicInfo.SEARCH_TAGS}'/>" >
									 <ul id="tagList" class="tagbox">
										 <c:forEach var="tagNmValue" items="${fn:split(clinicInfo.SEARCH_TAGS, ',')}">
										 	<li><c:out value="${tagNmValue}"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
										 </c:forEach>
									 </ul>
								 </div>
							 </td>
						 </tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns">
				<a href="javascript:updateCLN(document.formInsertA);" class="btn_ty02"> 저장하기 </a>
				<a href="/admin/hpm/cln/selectCLNList.do" class="btn_ty"> 취소하기 </a>
			</div>
			
			<input type="hidden" name="MNG_CD" value="${clinicInfo.MNG_CD}"/>
			<input type="hidden" name="MNG_SEQ" value="${clinicInfo.MNG_SEQ}"/>
			<input type="hidden" name="CLINIC_NM" value="${clinicInfo.CLINIC_NM}">
			<input type="hidden" name="POST_YN" value="${clinicInfo.POST_YN}"/>
			<input type="hidden" name="TEMPL_CD" value="${clinicInfo.TEMPL_CD}"/>
			<input type="hidden" name="MAJOR_DISS_CDS" value="${clinicInfo.MAJOR_DISS_CDS}">
			<input type="hidden" name="DR_IDS" value="${clinicInfo.DR_IDS}">
		</form>
	</c:otherwise>
</c:choose>

<!-- 주요 질환 선택 레이어팝업 -->
<div class="lypop_wrap" id="lypop01">
	<div class="sm_con" style="top:300px">
		<div class="pop_top">
			<h2>주요 질환 선택</h2>
			<a href="javascript:void(0);" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit"><strong>질환</strong></h3>
			<div class="sear">
				<input type="text" class="inp_txt w_full searchDiss" style="width:100%">
				<input type="submit" onclick="javascript:searchDiss();" value="검색">
			</div>

			<h3 class="pop_mid_tit"><strong>선택된 질환</strong></h3>
			<div class="sear selectDiss">
				<c:set var="selectDissList" value="${fn:split(clinicInfo.MAJOR_DISS_CDS, ',') }"/>
				<c:forEach var="dissCds" items="${clinicInfo.DISS_CDS_LIST}" varStatus="status">
					<a href="javascript:void(0);" id="selectedCode_${selectDissList[status.index] }" class="file_name">${dissCds}</a><a href="javascript:void(0);" class="btn_shape_x">삭제</a>
				</c:forEach>
			</div>

			<div class="board_ty ds02">
				<table>
					<colgroup>
						<col style="width:460px"><!-- 1119 -->
						<col style="width:*"><!-- 1119 -->
					</colgroup>
					<thead>
						<tr>
							<th>질환명</th>
							<th>추가</th>
						</tr>
					</thead>
				</table><!-- 1119 s -->
			</div>
			<div class="board_ty ds02 scy_box02">
				<table>
					<colgroup>
						<col style="width:460px">
						<col style="width:*">
					</colgroup>
					<tbody>
						<c:forEach var="dissInfo" items="${dissList}" varStatus="status">
							<tr id="dissCode_${dissInfo.CODE_ID}">
								<td title="${dissInfo.CODE_NM}" ><c:out value="${dissInfo.CODE}"/></td>
								<td>
									<c:set var="bSelectedCnt" value="0"/>
									<c:forEach var="selectDissInfo" items="${selectDissList}">
										<c:if test="${selectDissInfo eq dissInfo.CODE_ID }"><c:set var="bSelectedCnt" value="${bSelectedCnt+1}" /></c:if>
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
				<a href="#none" onclick="javascript:pop_close('#lypop01');" class="btn_ty p_cancle">취소하기</a>
			</div>
			<input type="hidden" id="tmpDissList" name="tmpDissList" value="" >
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>

<!--의료진 레이어팝업 -->
<div class="lypop_wrap" id="lypop02">
	<div class="sm_con" style="top: 300px">
		<div class="pop_top">
			<h2>의료진 선택</h2>
			<a href="javascript:void(0);" class="pop_close"></a>
		</div>
		<!-- pop_cont -->
		<div class="pop_cont">
			<h3 class="pop_mid_tit"><strong>의료진</strong></h3>
			<div class="sear">
				<input type="text" class="inp_txt w_full searchDr" style="width:100%">
				<input type="submit" onclick="javascript:searchDr();" value="검색">
			</div>

			<h3 class="pop_mid_tit"><strong>선택된 의료진</strong></h3>
			<div class="sear selectDr">
				<c:set var="selectDrList" value="${fn:split(clinicInfo.DR_IDS, ',') }"/>
				<c:forEach var="dr" items="${clinicInfo.DR_LIST2}" varStatus="status">
					<a href="javascript:void(0);" id="selectedDrId_${selectDrList[status.index] }" class="file_name">${dr}</a><a href="javascript:void(0);" class="btn_shape_x">삭제</a>
				</c:forEach>
			</div>

			<div class="board_ty ds02">
				<table>
					<colgroup>
						<col style="width:460px"><!-- 1119 -->
						<col style="width:*"><!-- 1119 -->
					</colgroup>
					<thead>
						<tr>
							<th>의료진</th>
							<th>추가</th>
						</tr>
					</thead>
				</table><!-- 1119 s -->
			</div>
			<div class="board_ty ds02 scy_box02">
				<table>
					<colgroup>
						<col style="width:460px">
						<col style="width:*">
					</colgroup>
					<tbody>
						<c:forEach var="drInfo" items="${drList}" varStatus="status">
							<tr id="drId_${drInfo.drId }">
								<td class="ta_l"><c:out value="${drInfo.drNm}"/></td>
								<td>
									<c:set var="bSelectedCnt" value="0"/>
									<c:forEach var="selectDrInfo" items="${selectDrList}">
										<c:if test="${selectDrInfo eq drInfo.drId }"><c:set var="bSelectedCnt">${bSelectedCnt+1 }</c:set></c:if>
									</c:forEach>
									<c:if test="${bSelectedCnt eq '0' }"><a href="javascript:void(0);" class="btn sm addDr">추가</a></c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btns">
				<a href="#none" onclick="javascript:saveDrList();" class="btn_ty02">저장하기</a>
				<a href="#none" onclick="javascript:pop_close('#lypop02');" class="btn_ty p_cancle">취소하기</a>
			</div>
			<input type="hidden" id="tmpDrList" name="tmpDrList" value="" >
		</div>
		<!-- //pop_cont -->
	</div>
	<div class="dim"></div>
</div>


<script type="text/javascript">
<!--
	
	var tagNmList = {};
	<c:forEach items="${fn:split(clinicInfo.SEARCH_TAGS, ',')}" var="tagNmValue" varStatus="status">
		tagNmList[${status.index}] = '<c:out value="${tagNmValue}"/>';
	</c:forEach>
	
	/*********************************************************
	 * 초기화
	 *********************************************************/
	function fnInit() {
		
		// 템플릿 셋팅
		$("#TEMPL_CD").attr("disabled", "true");
		
		// 라디오버튼 셋팅
		<c:forEach items="${clinicInfo.TMP_LIST}" var="tmpInfo" varStatus="status">
			var USE_YN = "${tmpInfo.USE_YN}"; // 사용여부
			if(USE_YN == "Y") {
				$("input:radio[name='TMP_LIST[${status.index}].USE_YN']:input[value='Y']").trigger('click');
			} else {
				$("input:radio[name='TMP_LIST[${status.index}].USE_YN']:input[value='N']").trigger('click');
			}
			var VS_MARK_USE_YN = "${tmpInfo.VS_MARK_USE_YN}";
			if(VS_MARK_USE_YN == "Y") {
				$("input:radio[name='TMP_LIST[${status.index}].VS_MARK_USE_YN']:input[value='Y']").trigger('click');
			} else {
				$("input:radio[name='TMP_LIST[${status.index}].VS_MARK_USE_YN']:input[value='N']").trigger('click');
			}
			
		</c:forEach>
		
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
			document.formInsert.tagNmList.value = Object.values(tagNmList).toString();
		});
		
		// 주요질환 선택 팝업 추가
		$('#lypop01').on('click', '.addDiss', function() {
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
		
		// 주요질환 선택 팝업 삭제
		$('#lypop01').on('click', '.btn_shape_x', function() {
			$('#dissCode_'+$(this).prev().attr('id').replace('selectedCode_', '')+' > td:eq(1)').html('<a href="javascript:void(0);" class="btn sm addDiss">추가</a>');
			$(this).prev().remove();
			$(this).remove();
			var tmpDissList = '';
			$('.selectDiss > a.file_name').each(function() {
				tmpDissList += $(this).attr('id').replace('selectedCode_', '') + ','; 
			});
			$('#tmpDissList').val(tmpDissList.substr(0, tmpDissList.length - 1));
		});
		
		// 의료진 선택 팝업 추가
		$('#lypop02').on('click', '.addDr', function() {
			var drId = $(this).closest('tr').attr('id').replace('drId_', '');
			var drNm = $(this).closest('tr').find(' > td:eq(0)').text();
			$('.selectDr').append('<a href="javascript:void(0);" id="selectedDrId_'+drId+'" class="file_name" >'+drNm+'</a><a href="javascript:void(0);" class="btn_shape_x">삭제</a>');
			var tmpDrList = '';
			$('.selectDr > a.file_name').each(function() {
				tmpDrList += $(this).attr('id').replace('selectedDrId_', '') + ','; 
			});
			$('#tmpDrList').val(tmpDrList.substr(0, tmpDrList.length - 1));
			$(this).remove();
		});
		
		// 의료진 선택 팝업 삭제
		$('#lypop02').on('click', '.btn_shape_x', function() {
			$('#drId_'+$(this).prev().attr('id').replace('selectedDrId_', '')+' > td:eq(1)').html('<a href="javascript:void(0);" class="btn sm addDr">추가</a>');
			$(this).prev().remove();
			$(this).remove();
			var tmpDrList = '';
			$('.selectDr > a.file_name').each(function() {
				tmpDrList += $(this).attr('id').replace('selectedDrId_', '') + ','; 
			});
			$('#tmpDrList').val(tmpDrList.substr(0, tmpDrList.length - 1));
		});
		
		// 의료진 선택 팝업 삭제
		$('#lypop02').on('click', '.btn_shape_x', function() {
			$('#drId_'+$(this).prev().attr('id').replace('selectedDrId_', '')+' > td:eq(1)').html('<a href="javascript:void(0);" class="btn sm addDr">추가</a>');
			$(this).prev().remove();
			$(this).remove();
			var tmpDrList = '';
			$('.selectDr > a.file_name').each(function() {
				tmpDrList += $(this).attr('id').replace('selectedDrId_', '') + ','; 
			});
			$('#tmpDrList').val(tmpDrList.substr(0, tmpDrList.length - 1));
		});
		
		// 주요질환 선택 팝업 검색
		$('#lypop01').on('keydown', 'input.searchDiss', function(key) {
			if (key.keyCode == 13) {
				searchDiss();
			}
		});
		
		// 의료진 선택 팝업 검색
		$('#lypop02').on('keydown', 'input.searchDr', function(key) {
			if (key.keyCode == 13) {
				searchDr();
			}
		});
	}
	
	/*********************************************************
	 * 주요질환 선택 팝업 검색
	 *********************************************************/
	function searchDiss() {
		var searchText = $('input.searchDiss').val();
		$('#lypop01 .board_ty.ds02.scy_box02 tbody tr').each(function() {
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
		var tmpDissListNm = '';
		$('.selectDiss > a.file_name').each(function() {
			tmpDissListNm += $(this).text() + ','; 
		});
		$('.dissListNm').text(tmpDissListNm.substr(0, tmpDissListNm.length - 1));
		pop_close('#lypop01');
	}
	
	/*********************************************************
	 * 의료진 선택 팝업 검색
	 *********************************************************/
	function searchDr() {
		var searchText = $('input.searchDr').val();
		$('#lypop02 .board_ty.ds02.scy_box02 tbody tr').each(function() {
			if($(this).find('> td:eq(0)').text().indexOf(searchText) >= 0) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}
	
	/*********************************************************
	 * 의료진 선택 팝업 저장
	 *********************************************************/
	function saveDrList() {
		$('input[name="DR_IDS"]').val($('#tmpDrList').val());
		var tmpDrListNm = '';
		$('.selectDr > a.file_name').each(function() {
			tmpDrListNm += $(this).text() + ','; 
		});
		$('.drListNm').text(tmpDrListNm.substr(0, tmpDrListNm.length - 1));
		pop_close('#lypop02');
	}
	
	/*********************************************************
	 * 저장
	 *********************************************************/
	function updateCLN(form) {
		if($('#chk01_1:checked').length > 0) {
			$('input[name=POST_YN]').val('Y');
		} else {
			$('input[name=POST_YN]').val('N');
		}

		$('input[name=CLINIC_NM]').val($('#clinicNm').val());
		$('input[name=TEMPL_CD]').val($("select[name=TEMPL_CD]").val());
		
		/* 텍스트 입력 필수값 체크 */
		if($('input[name=clinicNm]').val() === '') {
			alert('클리닉명을 입력해 주시기 바랍니다.');
			$('input[name=clinicNm]').focus();
			return false;
		}
		
		let isValid = false;
		/* 템플릿 A 밸리데이션 체크 */
		if($('select[name="TEMPL_CD"]').val() === 'A') {
			// seq 1
			if(!isValid && $('input:radio[name="TMP_LIST[0].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				}
			}
			// seq 2
			if(!isValid && $('input:radio[name="TMP_LIST[1].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 3
			if(!isValid && $('input:radio[name="TMP_LIST[2].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 4
			if(!isValid && $('input:radio[name="TMP_LIST[3].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 4
			if(!isValid && $('input:radio[name="TMP_LIST[4].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('5번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('5번째 파일이 없습니다.');
					$('a[name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			//seq 6
			if(!isValid && $('input:radio[name="TMP_LIST[5].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('6-1번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('6-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('6-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('6-2번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('6-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('6-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 7
			if(!isValid && $('input:radio[name="TMP_LIST[6].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('7-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('7-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('7-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('7-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 8
			if(!isValid && $('input:radio[name="TMP_LIST[7].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('8번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('8번째 파일이 없습니다.');
					$('a[name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 9
			if(!isValid && $('input:radio[name="TMP_LIST[8].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('9번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('9번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}

			//seq 10
			if(!isValid && $('input:radio[name="TMP_LIST[9].USE_YN"]:checked').val() === 'Y') {
				if($('input[name="TMP_LIST[9].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('10-1번째 텍스트가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('input[name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('10-1번째 수치가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('10-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[9].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('10-2번째 텍스트가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('input[name="TMP_LIST[9].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('10-2번째 수치가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[9].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('10-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[9].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[9].DTIL_LIST[2].TITLE_CT"]').val().length < 1) {
					alert('10-3번째 텍스트가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[2].TITLE_CT"]').focus();
					return;
				} else if($('input[name="TMP_LIST[9].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('10-3번째 수치가 미입력 되었습니다.');
					$('input[name="TMP_LIST[9].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[9].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('10-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[9].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			// seq 11
			if(!isValid && $('input:radio[name="TMP_LIST[10].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('11-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('11-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('11-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('11-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('11-3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('11-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').val().length < 1) {
					alert('11-4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM"]').text().length < 1) {
					alert('11-4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[4].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[4].TEXT_TX"]').val().length < 1) {
					alert('11-5번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[4].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[4].IMG_FILE_NM"]').text().length < 1) {
					alert('11-5번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[4].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[5].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[5].TEXT_TX"]').val().length < 1) {
					alert('11-6번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[5].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[5].IMG_FILE_NM"]').text().length < 1) {
					alert('11-6번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[5].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
		} // A 끝

		/* 템플릿 B 밸리데이션 체크 */
		if($('select[name="TEMPL_CD"]').val() === 'B') {
			// seq 1
			if(!isValid && $('input:radio[name="TMP_LIST[0].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				}
			}
			// seq 2
			if(!isValid && $('input:radio[name="TMP_LIST[1].USE_YN"]:checked').val() === 'Y') {
				if($('input[name="TMP_LIST[1].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('2-1번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[1].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('2-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('2-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[1].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('2-2번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[1].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[1].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[1].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('2-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[1].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[1].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('2-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[1].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}
			}
			//seq 3
			if(!isValid && $('input:radio[name="TMP_LIST[2].USE_YN"]:checked').val() === 'Y') {
				if($('input[name="TMP_LIST[2].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('3-1번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[2].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('3-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('3-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[2].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('3-2번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[2].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[2].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[2].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('3-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[2].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[2].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('3-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[2].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 4
			if(!isValid && $('input:radio[name="TMP_LIST[3].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('4-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('4-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 5
			if(!isValid && $('input:radio[name="TMP_LIST[4].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('5-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				}
				if($('textarea[name="TMP_LIST[4].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[4].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('5-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[4].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				}
			}
			//seq 6
			if(!isValid && $('input:radio[name="TMP_LIST[5].USE_YN"]:checked').val() === 'Y') {
				if($('input[name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('6-1번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[5].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('6-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('6-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('6-2번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[5].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('6-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('6-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 7
			if(!isValid && $('input:radio[name="TMP_LIST[6].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('7-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('7-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			
		} // B 끝
		
		/* 템플릿 C 밸리데이션 체크 */
		if($('select[name="TEMPL_CD"]').val() === 'C') {
			// seq 1
			if(!isValid && $('input:radio[name="TMP_LIST[0].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[0].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				}
			}
			// seq 2
			if(!isValid && $('input:radio[name="TMP_LIST[1].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[1].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[1].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 3
			if(!isValid && $('input:radio[name="TMP_LIST[2].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[2].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[2].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 4
			if(!isValid && $('input:radio[name="TMP_LIST[3].USE_YN"]:checked').val() === 'Y') {
				if($('input[name="TMP_LIST[3].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('4-1번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[3].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('4-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[3].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('4-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[3].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('input[name="TMP_LIST[3].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('4-2번째 타이틀이 미입력 되었습니다.');
					$('input[name="TMP_LIST[3].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[3].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[3].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('4-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[3].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[3].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('4-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[3].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 5
			if(!isValid && $('input:radio[name="TMP_LIST[4].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('5번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[4].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('5번째 파일이 없습니다.');
					$('a[name="TMP_LIST[4].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			// seq 6
			if(!isValid && $('input:radio[name="TMP_LIST[5].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('6번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[5].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('6-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('6-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('a[name="TMP_LIST[5].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('6-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[5].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			//seq 7
			if(!isValid && $('input:radio[name="TMP_LIST[6].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[6].DTIL_LIST[0].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('7-1번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('7-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('7-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[1].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('7-2번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('7-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('7-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[2].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[2].TITLE_CT"]').val().length < 1) {
					alert('7-3번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[2].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[2].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('7-3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('7-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[3].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[3].TITLE_CT"]').val().length < 1) {
					alert('7-4번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[3].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[6].DTIL_LIST[3].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[6].DTIL_LIST[3].TEXT_TX"]').val().length < 1) {
					alert('7-4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[6].DTIL_LIST[3].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[6].DTIL_LIST[3].IMG_FILE_NM"]').text().length < 1) {
					alert('7-4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[6].DTIL_LIST[3].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			//seq 8
			if(!isValid && $('input:radio[name="TMP_LIST[7].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[7].DTIL_LIST[0].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('8-1번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('8-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('8-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[7].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[1].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('8-2번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('8-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[7].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('8-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[7].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[2].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[2].TITLE_CT"]').val().length < 1) {
					alert('8-3번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[2].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[2].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('8-3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[7].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('8-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[7].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[3].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[3].TITLE_CT"]').val().length < 1) {
					alert('8-4번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[3].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[7].DTIL_LIST[3].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[7].DTIL_LIST[3].TEXT_TX"]').val().length < 1) {
					alert('8-4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[7].DTIL_LIST[3].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[7].DTIL_LIST[3].IMG_FILE_NM"]').text().length < 1) {
					alert('8-4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[7].DTIL_LIST[3].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			//seq 9
			if(!isValid && $('input:radio[name="TMP_LIST[8].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[8].DTIL_LIST[0].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[0].TITLE_CT"]').val().length < 1) {
					alert('9-1번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[0].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('9-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('9-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[1].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[1].TITLE_CT"]').val().length < 1) {
					alert('9-2번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[1].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('9-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('9-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[2].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[2].TITLE_CT"]').val().length < 1) {
					alert('9-3번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[2].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[2].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('9-3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('9-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[3].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[3].TITLE_CT"]').val().length < 1) {
					alert('9-4번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[3].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[3].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[3].TEXT_TX"]').val().length < 1) {
					alert('9-4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[3].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[3].IMG_FILE_NM"]').text().length < 1) {
					alert('9-4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[3].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[4].TITLE_CT"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[4].TITLE_CT"]').val().length < 1) {
					alert('9-5번째 타이틀이 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[4].TITLE_CT"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[8].DTIL_LIST[4].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[8].DTIL_LIST[4].TEXT_TX"]').val().length < 1) {
					alert('9-5번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[8].DTIL_LIST[4].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[8].DTIL_LIST[4].IMG_FILE_NM"]').text().length < 1) {
					alert('9-5번째 파일이 없습니다.');
					$('a[name="TMP_LIST[8].DTIL_LIST[4].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			// seq 10
			if(!isValid && $('input:radio[name="TMP_LIST[9].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('10번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[9].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('10번째 파일이 없습니다.');
					$('a[name="TMP_LIST[9].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				}
			}
			
			// seq 11
			if(!isValid && $('input:radio[name="TMP_LIST[10].USE_YN"]:checked').val() === 'Y') {
				if($('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').val().length < 1) {
					alert('11-1번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[0].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM"]').text().length < 1) {
					alert('11-1번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[0].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').val().length < 1) {
					alert('11-2번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[1].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM"]').text().length < 1) {
					alert('11-2번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[1].IMG_FILE_NM"]').focus();
					return;
				}else if($('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').val().length < 1) {
					alert('11-3번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[2].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM"]').text().length < 1) {
					alert('11-3번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[2].IMG_FILE_NM"]').focus();
					return;
				} else if($('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').text().length < 1 && $('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').val().length < 1) {
					alert('11-4번째 텍스트가 미입력 되었습니다.');
					$('textarea[name="TMP_LIST[10].DTIL_LIST[3].TEXT_TX"]').focus();
					return;
				} else if($('a[name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM"]').text().length < 1) {
					alert('11-4번째 파일이 없습니다.');
					$('a[name="TMP_LIST[10].DTIL_LIST[3].IMG_FILE_NM"]').focus();
					return;
				}
			}
		} // C 끝
		
		if(!isValid && $('input[name="MAJOR_DISS_CDS"]').val().length < 1) {
			alert('주요 질환을 선택해 주시기 바랍니다.');
			$('.dissListNm').focus();
			return;
		}
		if(!isValid && $('input[name="DR_IDS"]').val().length < 1) {
			alert('의료진을 선택해 주시기 바랍니다.');
			$('.drListNm').focus();
			return;
		}
		form.SEARCH_TAGS.value = Object.values(tagNmList).toString();
		form.submit();
	}
	
	/*********************************************************
	 * 파일찾기
	 *********************************************************/
	function fnFileSelect(a_id, fileValue) {
		$("#" + a_id).val(fileValue);
		var file = fileValue.split("\\");
		var fileName = file[file.length - 1];
		
		$("#" + a_id).html(fileName);
	}
	
	/*********************************************************
	 * 파일초기화
	 *********************************************************/
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
	 * 파일 다운로드
	 *********************************************************/
	function fnFileDownload(atchFileId, fileSn) {
		window.open("<c:url value='/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"'/>");
	}
	
-->
</script>