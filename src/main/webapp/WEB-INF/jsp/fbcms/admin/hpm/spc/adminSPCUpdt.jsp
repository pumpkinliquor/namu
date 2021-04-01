<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<h3 class="mid_tit mg_t50"><c:out value="${articleVO.nttSj}"/> <spring:message code="title.update"/></h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
<!-- 
	var tagNmList = {};
	<c:forEach var="tagNmValue" items="${fn:split(articleVO.tagNmList, ',')}" varStatus="status">
		tagNmList[${status.index}] = '<c:out value="${tagNmValue }"/>';
	</c:forEach>

	$(function() {
		/* 첨부파일 하나만 삭제버튼 */
		$('#articleVO').on('click', '.remOneFile', function() {
			$(this).parent().remove();
		});
		
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
						document.formUpdate.tagNmList.value = Object.values(tagNmList).toString();
                   } else {
                       alert('태그값이 중복됩니다.');
                   }
               }
               e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
           }
		});
		$('#articleVO').on('click', '.tagDelBtn', function() {
			$(this).parent().remove();
			tagNmList = {};
			$('#tagList li').each(function(idx) {
				tagNmList[(idx+1)] = $(this).html().split('<')[0]; 
			});
			document.formUpdate.tagNmList.value = Object.values(tagNmList).toString();
		});
		
		/* 사용여부 */
		$('#articleVO').on('change', 'input[type=radio]', function() {
			var changeValue = $(this).val();
			$(this).closest('.ds_raido').parent().find('input[type=hidden]').each(function(){
				$(this).val(changeValue);
			});
		});
		
		/* 파일체크 */
		for(var i = 1; i <= 33; i++) {
			if(i == 18 || i == 32) {
				$('#file_'+i).on('change', function() {
					// 확장자 체크
					var ext = $(this).val().split('.').pop().toLowerCase();
					if($.inArray(ext, ['mp4']) == -1) {
						document.getElementById('b_file_txt'+i).innerText = '';
						alert('파일첨부가 허용된 파일이 아닙니다.');
						fileInit($(this));
						return;
					}
					
					// 파일 용량 체크
					var fileSize = this.files[0].size;
					var maxSize = 1024 * 1024 * 100;
					if(fileSize > maxSize) {
						document.getElementById('b_file_txt'+i).innerText = '';
						alert('파일용량 100MB를 초과했습니다.');
						fileInit($(this));
						return;
					}
				});
				
			} else {
				$('#file_'+i).on('change', function() {
					// 확장자 체크
					var ext = $(this).val().split('.').pop().toLowerCase();
					if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
						document.getElementById('b_file_txt'+i).innerText = '';
						alert('파일첨부가 허용된 파일이 아닙니다.');
						fileInit($(this));
						return;
					}
					
					// 파일 용량 체크
					var fileSize = this.files[0].size;
					var maxSize = 1024 * 1024 * 10;
					if(fileSize > maxSize) {
						document.getElementById('b_file_txt'+i).innerText = '';
						alert('파일용량 10MB를 초과했습니다.');
						fileInit($(this));
						return;
					}
				});
			}
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
				return false;
			}
		});
		$('#tagDissList').on('click', '.tagDissDelBtn', function() {
			$(this).parent().remove();
			tagDissNmList = {};
			$('#tagDissList li').each(function(idx) {
				tagDissNmList[(idx+1)] = $(this).html().split('<')[0]; 
			});
			$('#custom4').val() == Object.values(tagDissNmList).toString();
		});
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
	}

	/*********************************************************
	 * 주요질환 팝업 열기
	 *********************************************************/
	function fnPopUpOpen(divId) {
		pop_open('#'+divId);
	}
	
	/*********************************************************
	 * 주요질환 팝업 취소
	 *********************************************************/
	function fnPopUpCancel(divId) {
	   	if(confirm("선택을 취소하시겠습니까?")) {
			pop_close('#'+divId);
		}
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
		$('input[name="custom4"]').val($('#tmpDissList').val());
		var items = '';
		$('a[id^=selectedCode]').each(function(i) {
				items += $(this).text() + ',';
		});
		$('.dissListNm').text(items.substring(0, items.length-1));
		if(items == '') {
			$('input[name=custom3]').val('N');
		} else {
			$('input[name=custom3]').val('Y');
		}
		pop_close('#lypop05');
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function updateSPC(form) {
		if($('input[name=display01]:checked').val() == 'Y'
			&& $('#fileList1 a').size() < 1 && document.getElementById('b_file_txt1').innerText == '') {
			alert('1의 첨부파일을 넣어주세요');
			$('#file_1').focus();
			return false;
		}
		if($('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList2 a').size() < 1 && document.getElementById('b_file_txt2').innerText == '') {
			alert('2-1의 첨부파일을 넣어주세요');
			$('#file_2').focus();
			return false;
		}
		if($('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList3 a').size() < 1 && document.getElementById('b_file_txt3').innerText == '') {
			alert('2-2의 첨부파일을 넣어주세요');
			$('#file_3').focus();
			return false;
		}
		if($('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList4 a').size() < 1 && document.getElementById('b_file_txt4').innerText == '') {
			alert('2-3의 첨부파일을 넣어주세요');
			$('#file_4').focus();
			return false;
		}
		if($('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList5 a').size() < 1 && document.getElementById('b_file_txt5').innerText == '') {
			alert('2-4의 첨부파일을 넣어주세요');
			$('#file_5').focus();
			return false;
		}
		if($('input[name=display02_1]:checked').val() == '6'
			&& $('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList6 a').size() < 1 && document.getElementById('b_file_txt6').innerText == '') {
			alert('2-5의 첨부파일을 넣어주세요');
			$('#file_6').focus();
			return false;
		}
		if($('input[name=display02_1]:checked').val() == '6'
			&& $('input[name=display02]:checked').val() == 'Y'
			&& $('#fileList7 a').size() < 1 && document.getElementById('b_file_txt7').innerText == '') {
			alert('2-6의 첨부파일을 넣어주세요');
			$('#file_7').focus();
			return false;
		}
		if($('input[name=display08]:checked').val() == 'Y'
			&& $('#fileList8 a').size() < 1 && document.getElementById('b_file_txt8').innerText == '') {
			alert('3-1의 첨부파일을 넣어주세요');
			$('#file_8').focus();
			return false;
		}
		if($('input[name=display08]:checked').val() == 'Y'
			&& $('#fileList8 a').size() < 1 && document.getElementById('b_file_txt9').innerText == '') {
			alert('3-2의 첨부파일을 넣어주세요');
			$('#file_9').focus();
			return false;
		}
		if($('input[name=display10]:checked').val() == 'Y'
			&& $('#fileList10 a').size() < 1 && document.getElementById('b_file_txt10').innerText == '') {
			alert('4-1의 첨부파일을 넣어주세요');
			$('#file_10').focus();
			return false;
		}
		if($('input[name=display10]:checked').val() == 'Y'
			&& $('#fileList11 a').size() < 1 && document.getElementById('b_file_txt11').innerText == '') {
			alert('4-2의 첨부파일을 넣어주세요');
			$('#file_11').focus();
			return false;
		}
		if($('input[name=display12]:checked').val() == 'Y'
			&& $('#fileList12 a').size() < 1 && document.getElementById('b_file_txt12').innerText == '') {
			alert('5의 첨부파일을 넣어주세요');
			$('#file_12').focus();
			return false;
		}
		if($('input[name=display13]:checked').val() == 'Y'
			&& $('#fileList13 a').size() < 1 && document.getElementById('b_file_txt13').innerText == '') {
			alert('6-1의 첨부파일을 넣어주세요');
			$('#file_13').focus();
			return false;
		}
		if($('input[name=display13]:checked').val() == 'Y'
			&& $('#fileList14 a').size() < 1 && document.getElementById('b_file_txt14').innerText == '') {
			alert('6-2의 첨부파일을 넣어주세요');
			$('#file_14').focus();
			return false;
		}
		if($('input[name=display15]:checked').val() == 'Y'
			&& $('#fileList15 a').size() < 1 && document.getElementById('b_file_txt15').innerText == '') {
			alert('7-1의 첨부파일을 넣어주세요');
			$('#file_15').focus();
			return false;
		}
		if($('input[name=display15]:checked').val() == 'Y'
			&& $('#fileList16 a').size() < 1 && document.getElementById('b_file_txt16').innerText == '') {
			alert('7-2의 첨부파일을 넣어주세요');
			$('#file_16').focus();
			return false;
		}
		if($('input[name=display15]:checked').val() == 'Y'
			&& $('#fileList17 a').size() < 1 && document.getElementById('b_file_txt17').innerText == '') {
			alert('7-3의 첨부파일을 넣어주세요');
			$('#file_17').focus();
			return false;
		}
		if($('input[name=display18]:checked').val() == 'Y'
			&& $('#fileList18 a').size() < 1 && document.getElementById('b_file_txt18').innerText == '') {
			alert('8의 첨부파일을 넣어주세요');
			$('#file_18').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList19 a').size() < 1 && document.getElementById('b_file_txt19').innerText == '') {
			alert('9-1의 첨부파일을 넣어주세요');
			$('#file_19').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList20 a').size() < 1 && document.getElementById('b_file_txt20').innerText == '') {
			alert('9-2의 첨부파일을 넣어주세요');
			$('#file_20').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList21 a').size() < 1 && document.getElementById('b_file_txt21').innerText == '') {
			alert('9-3의 첨부파일을 넣어주세요');
			$('#file_21').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList22 a').size() < 1 && document.getElementById('b_file_txt22').innerText == '') {
			alert('9-4의 첨부파일을 넣어주세요');
			$('#file_22').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList23 a').size() < 1 && document.getElementById('b_file_txt23').innerText == '') {
			alert('9-5의 첨부파일을 넣어주세요');
			$('#file_23').focus();
			return false;
		}
		if($('input[name=display19]:checked').val() == 'Y'
			&& $('#fileList24 a').size() < 1 && document.getElementById('b_file_txt24').innerText == '') {
			alert('9-6의 첨부파일을 넣어주세요');
			$('#file_24').focus();
			return false;
		}
		if($('input[name=display25]:checked').val() == 'Y'
			&& $('#fileList25 a').size() < 1 && document.getElementById('b_file_txt25').innerText == '') {
			alert('10-1의 첨부파일을 넣어주세요');
			$('#file_25').focus();
			return false;
		}
		if($('input[name=display25]:checked').val() == 'Y'
			&& $('#fileList26 a').size() < 1 && document.getElementById('b_file_txt26').innerText == '') {
			alert('10-2의 첨부파일을 넣어주세요');
			$('#file_26').focus();
			return false;
		}
		if($('input[name=display27]:checked').val() == 'Y'
			&& $('#fileList27 a').size() < 1 && document.getElementById('b_file_txt27').innerText == '') {
			alert('11-1의 첨부파일을 넣어주세요');
			$('#file_27').focus();
			return false;
		}
		if($('input[name=display27]:checked').val() == 'Y'
			&& $('#fileList28 a').size() < 1 && document.getElementById('b_file_txt28').innerText == '') {
			alert('11-2의 첨부파일을 넣어주세요');
			$('#file_28').focus();
			return false;
		}
		if($('input[name=display27]:checked').val() == 'Y'
			&& $('#fileList29 a').size() < 1 && document.getElementById('b_file_txt29').innerText == '') {
			alert('11-3의 첨부파일을 넣어주세요');
			$('#file_29').focus();
			return false;
		}
		if($('input[name=display27]:checked').val() == 'Y'
			&& $('#fileList30 a').size() < 1 && document.getElementById('b_file_txt30').innerText == '') {
			alert('11-4의 첨부파일을 넣어주세요');
			$('#file_30').focus();
			return false;
		}
		if($('input[name=display31]:checked').val() == 'Y'
			&& $('#fileList31 a').size() < 1 && document.getElementById('b_file_txt31').innerText == '') {
			alert('12의 첨부파일을 넣어주세요');
			$('#file_31').focus();
			return false;
		}
		if($('input[name=display32]:checked').val() == 'Y'
			&& $('#fileList32 a').size() < 1 && document.getElementById('b_file_txt32').innerText == '') {
			alert('13의 첨부파일을 넣어주세요');
			$('#file_32').focus();
			return false;
		}
		if($('input[name=display33]:checked').val() == 'Y'
				&& $('#fileList33 a').size() < 1 && document.getElementById('b_file_txt33').innerText == '') {
			alert('14의 첨부파일을 넣어주세요');
			$('#file_33').focus();
			return false;
		}
		
		if (confirm("<spring:message code="common.update.msg" />")) {
			form.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectSPCList(form) {
		form.submit();
	}
	
	/* ********************************************************
	 * 첨부파일 다운로드
	 ******************************************************** */
	function fnAtchDownFile(atchFileId, fileSn) {
		window.open("/cmm/fms/fileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn+"");
	}
	
	/*********************************************************
	 * 파일이름
	 *********************************************************/
	function getUploadFileName(fileValue, innerTextValue) {
		var file = fileValue.split("\\");
		var fileName = file[file.length - 1];
		return fileName; 
	}
-->
</script>

<!-- 상단타이틀 -->
<form:form commandName="articleVO" name="formUpdate" action="/admin/hpm/spc/updateSPC.do" method="post" onSubmit="updateSPC(document.formUpdate); return false;" enctype="multipart/form-data">
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
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj1" value="<c:out value='${result1.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" name="nttCn1" maxlength="200"><c:out value="${result1.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList1">
								<c:if test="${not empty fileList1 and not empty fileList1[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result1.atchFileId}', '${fileList1[0].fileSn }');">${fileList1[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_1">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt1"></span>
								<span class="dc">*이미지 사이즈 : 1200*560 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display01" id="chk01_1"<c:if test="${result1.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk01_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display01" id="chk01_2"<c:if test="${result1.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk01_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt1" value="<c:out value='${result1.useAt }'/>" >
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
					<th scope="row" rowspan="21" class="bo_r">2</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj2" value="<c:out value='${result2.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_2" value="<c:out value='${result2.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn2"><c:out value="${result2.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList2">
								<c:if test="${not empty fileList2 and not empty fileList2[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result2.atchFileId}', '${fileList2[0].fileSn }');">${fileList2[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_2">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt2"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_3" value="<c:out value='${result3.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn3"><c:out value="${result3.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList3">
								<c:if test="${not empty fileList3 and not empty fileList3[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result3.atchFileId}', '${fileList3[0].fileSn }');">${fileList3[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_3">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_3" class="realFile_btn input_none" name="file_3" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt3').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt3"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_4" value="<c:out value='${result4.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn4"><c:out value="${result4.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList4">
								<c:if test="${not empty fileList4 and not empty fileList4[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result4.atchFileId}', '${fileList4[0].fileSn }');">${fileList4[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_4">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_4" class="realFile_btn input_none" name="file_4" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt4').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt4"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_5" value="<c:out value='${result5.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn5"><c:out value="${result5.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList5">
								<c:if test="${not empty fileList5 and not empty fileList5[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result5.atchFileId}', '${fileList5[0].fileSn }');">${fileList5[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_5">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_5" class="realFile_btn input_none" name="file_5" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt5').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt5"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">5</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_6" value="<c:out value='${result6.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn6"><c:out value="${result6.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList6">
								<c:if test="${not empty fileList6 and not empty fileList6[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result6.atchFileId}', '${fileList6[0].fileSn }');">${fileList6[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_6">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_6" class="realFile_btn input_none" name="file_6" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt6').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt6"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">6</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_7" value="<c:out value='${result7.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn7"><c:out value="${result7.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList7">
								<c:if test="${not empty fileList7 and not empty fileList7[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result7.atchFileId}', '${fileList7[0].fileSn }');">${fileList7[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_7">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_7" class="realFile_btn input_none" name="file_7" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt7').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt7"></span>
								<span class="dc">*이미지 사이즈 : 290*162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display02_1" id="chk02_1"<c:if test="${result2.custom2 eq '4'}"> checked="checked"</c:if> class="ez-hide" value="4"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">4</label>
								</span>
								<span>
									<input type="radio" name="display02_1" id="chk02_2"<c:if test="${result2.custom2 ne '4'}"> checked="checked"</c:if> class="ez-hide" value="6">
									<label for="chk02_2">6</label>
								</span>
							</span>
							<input type="hidden" name="custom2_2" value="<c:out value='${result2.custom2 }'/>" >
							<input type="hidden" name="custom2_3" value="<c:out value='${result3.custom2 }'/>" >
							<input type="hidden" name="custom2_4" value="<c:out value='${result4.custom2 }'/>" >
							<input type="hidden" name="custom2_5" value="<c:out value='${result5.custom2 }'/>" >
							<input type="hidden" name="custom2_6" value="<c:out value='${result6.custom2 }'/>" >
							<input type="hidden" name="custom2_7" value="<c:out value='${result7.custom2 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_3"<c:if test="${result2.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_3">Y</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_4"<c:if test="${result2.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk02_4">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt2" value="<c:out value='${result2.useAt }'/>" >
							<input type="hidden" name="useAt3" value="<c:out value='${result3.useAt }'/>" >
							<input type="hidden" name="useAt4" value="<c:out value='${result4.useAt }'/>" >
							<input type="hidden" name="useAt5" value="<c:out value='${result5.useAt }'/>" >
							<input type="hidden" name="useAt6" value="<c:out value='${result6.useAt }'/>" >
							<input type="hidden" name="useAt7" value="<c:out value='${result7.useAt }'/>" >
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
					<th scope="row" rowspan="9" class="bo_r">3</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40"  class="inp_txt w_full" name="nttSj8" value="<c:out value='${result8.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_8" value="<c:out value='${result8.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn8"><c:out value="${result8.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList8">
								<c:if test="${not empty fileList8 and not empty fileList8[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result8.atchFileId}', '${fileList8[0].fileSn }');">${fileList8[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_8">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_8" class="realFile_btn input_none" name="file_8" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt8').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt8"></span>
								<span class="dc">*이미지 사이즈 : 580*386 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_9" value="<c:out value='${result9.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn9"><c:out value="${result9.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList9">
								<c:if test="${not empty fileList9 and not empty fileList9[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result9.atchFileId}', '${fileList9[0].fileSn }');">${fileList9[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_9">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_9" class="realFile_btn input_none" name="file_9" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt9').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt9"></span>
								<span class="dc">*이미지 사이즈 : 580*386 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display08_1" id="chk08_1"<c:if test="${result8.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk08_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display08_1" id="chk08_2"<c:if test="${result8.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk08_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom3_8" value="<c:out value='${result8.custom3 }'/>" >
							<input type="hidden" name="custom3_9" value="<c:out value='${result9.custom3 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display08" id="chk08_3"<c:if test="${result8.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk08_3">Y</label>
								</span>
								<span>
									<input type="radio" name="display08" id="chk08_4"<c:if test="${result8.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk08_4">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt8" value="<c:out value='${result8.useAt }'/>" >
							<input type="hidden" name="useAt9" value="<c:out value='${result9.useAt }'/>" >
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
					<th scope="row" rowspan="9" class="bo_r">4</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj10" value="<c:out value='${result10.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_10" value="<c:out value='${result10.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn10"><c:out value="${result10.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList10">
								<c:if test="${not empty fileList10 and not empty fileList10[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result10.atchFileId}', '${fileList10[0].fileSn }');">${fileList10[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_10">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_10" class="realFile_btn input_none" name="file_10" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt10').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt10"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_11" value="<c:out value='${result11.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn11"><c:out value="${result11.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList11">
								<c:if test="${not empty fileList11 and not empty fileList11[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result11.atchFileId}', '${fileList11[0].fileSn }');">${fileList11[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_11">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_11" class="realFile_btn input_none" name="file_11" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt11').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt11"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display10_1" id="chk10_1"<c:if test="${result10.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk10_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display10_1" id="chk10_2"<c:if test="${result10.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk10_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom3_10" value="<c:out value='${result10.custom3 }'/>" >
							<input type="hidden" name="custom3_11" value="<c:out value='${result11.custom3 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display10" id="chk10_3"<c:if test="${result10.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk10_3">Y</label>
								</span>
								<span>
									<input type="radio" name="display10" id="chk10_4"<c:if test="${result10.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk10_4">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt10" value="<c:out value='${result10.useAt }'/>" >
							<input type="hidden" name="useAt11" value="<c:out value='${result11.useAt }'/>" >
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
					<th scope="row" rowspan="4" class="bo_r">5</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj12" value="<c:out value='${result12.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn12"><c:out value="${result12.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList12">
								<c:if test="${not empty fileList12 and not empty fileList12[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result12.atchFileId}', '${fileList12[0].fileSn }');">${fileList12[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_12">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_12" class="realFile_btn input_none" name="file_12" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt12').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt12"></span>
								<span class="dc">*이미지 사이즈 : 1200*400 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display12" id="chk12_1"<c:if test="${result12.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk12_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display12" id="chk12_2"<c:if test="${result12.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk12_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt12" value="<c:out value='${result12.useAt }'/>" >
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
					<th scope="row" rowspan="9" class="bo_r">6</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj13" value="<c:out value='${result13.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_13" value="<c:out value='${result13.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn13"><c:out value="${result13.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList13">
								<c:if test="${not empty fileList13 and not empty fileList13[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result13.atchFileId}', '${fileList13[0].fileSn }');">${fileList13[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_13">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_13" class="realFile_btn input_none" name="file_13" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt13').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt13"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_14" value="<c:out value='${result14.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn14"><c:out value="${result14.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList14">
								<c:if test="${not empty fileList14 and not empty fileList14[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result14.atchFileId}', '${fileList14[0].fileSn }');">${fileList14[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_14">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_14" class="realFile_btn input_none" name="file_14" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt14').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt14"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display13_1" id="chk13_1"<c:if test="${result13.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk13_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display13_1" id="chk13_2"<c:if test="${result13.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk13_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom3_13" value="<c:out value='${result13.custom3 }'/>" >
							<input type="hidden" name="custom3_14" value="<c:out value='${result14.custom3 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display13" id="chk13_3"<c:if test="${result13.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk13_3">Y</label>
								</span>
								<span>
									<input type="radio" name="display13" id="chk13_4"<c:if test="${result13.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk13_4">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt13" value="<c:out value='${result13.useAt }'/>" >
							<input type="hidden" name="useAt14" value="<c:out value='${result14.useAt }'/>" >
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
					<th scope="row" rowspan="11" class="bo_r">7</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj15" value="<c:out value='${result15.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_15" value="<c:out value='${result15.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom4_15" value="<c:out value='${result15.custom4 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList15">
								<c:if test="${not empty fileList15 and not empty fileList15[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result15.atchFileId}', '${fileList15[0].fileSn }');">${fileList15[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_15">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_15" class="realFile_btn input_none" name="file_15" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt15').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt15"></span>
								<span class="dc">*이미지 사이즈 : 220*290 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_16" value="<c:out value='${result16.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom4_16" value="<c:out value='${result16.custom4 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList16">
								<c:if test="${not empty fileList16 and not empty fileList16[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result16.atchFileId}', '${fileList16[0].fileSn }');">${fileList16[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_16">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_16" class="realFile_btn input_none" name="file_16" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt16').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt16"></span>
								<span class="dc">*이미지 사이즈 : 220*290 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_17" value="<c:out value='${result17.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>수치</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom4_17" value="<c:out value='${result17.custom4 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList17">
								<c:if test="${not empty fileList17 and not empty fileList17[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result17.atchFileId}', '${fileList17[0].fileSn }');">${fileList17[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_17">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_17" class="realFile_btn input_none" name="file_17" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt17').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt17"></span>
								<span class="dc">*이미지 사이즈 : 220*290 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display15" id="chk15_1"<c:if test="${result15.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk15_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display15" id="chk15_2"<c:if test="${result15.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk15_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt15" value="<c:out value='${result15.useAt }'/>" >
							<input type="hidden" name="useAt16" value="<c:out value='${result16.useAt }'/>" >
							<input type="hidden" name="useAt17" value="<c:out value='${result17.useAt }'/>" >
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
					<th scope="row" rowspan="4" class="bo_r">8</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj18" value="<c:out value='${result18.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn18"><c:out value="${result18.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>동영상</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList18">
								<c:if test="${not empty fileList18 and not empty fileList18[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result18.atchFileId}', '${fileList18[0].fileSn }');">${fileList18[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_18">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_18" class="realFile_btn input_none" name="file_18" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt18').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt18"></span>
								<span class="dc">*동영상 사이즈 : 1200*675 | 용량: 100mb  이하 |  mp4</span>
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
									<input type="radio" name="display18" id="chk18_1"<c:if test="${result18.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk18_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display18" id="chk18_2"<c:if test="${result18.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk18_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt18" value="<c:out value='${result18.useAt }'/>" >
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
					<th scope="row" rowspan="20" class="bo_r">9</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="nttSj19" value="<c:out value='${result19.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_19" value="<c:out value='${result19.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn19"><c:out value="${result19.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList19">
								<c:if test="${not empty fileList19 and not empty fileList19[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result19.atchFileId}', '${fileList19[0].fileSn }');">${fileList19[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_19">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_19" class="realFile_btn input_none" name="file_19" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt19').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt19"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_20" value="<c:out value='${result20.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn20"><c:out value="${result20.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList20">
								<c:if test="${not empty fileList20 and not empty fileList20[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result20.atchFileId}', '${fileList20[0].fileSn }');">${fileList20[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_20">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_20" class="realFile_btn input_none" name="file_20" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt20').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt20"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_21" value="<c:out value='${result21.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn21"><c:out value="${result21.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList21">
								<c:if test="${not empty fileList21 and not empty fileList21[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result21.atchFileId}', '${fileList21[0].fileSn }');">${fileList21[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_21">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_21" class="realFile_btn input_none" name="file_21" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt21').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt21"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_22" value="<c:out value='${result22.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn22"><c:out value="${result22.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList22">
								<c:if test="${not empty fileList22 and not empty fileList22[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result22.atchFileId}', '${fileList22[0].fileSn }');">${fileList22[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_22">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_22" class="realFile_btn input_none" name="file_22" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt22').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt22"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">5</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_23" value="<c:out value='${result23.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" name="nttCn23"><c:out value="${result23.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList23">
								<c:if test="${not empty fileList23 and not empty fileList23[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result23.atchFileId}', '${fileList23[0].fileSn }');">${fileList23[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_23">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_23" class="realFile_btn input_none" name="file_23" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt23').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt23"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">6</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_24" value="<c:out value='${result24.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn24"><c:out value="${result24.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList24">
								<c:if test="${not empty fileList24 and not empty fileList24[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result24.atchFileId}', '${fileList24[0].fileSn }');">${fileList24[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_24">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_24" class="realFile_btn input_none" name="file_24" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt24').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt24"></span>
								<span class="dc">*이미지 사이즈 : 374*374 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display19" id="chk19_1"<c:if test="${result19.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk19_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display19" id="chk19_2"<c:if test="${result19.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk19_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt19" value="<c:out value='${result19.useAt }'/>" >
							<input type="hidden" name="useAt20" value="<c:out value='${result20.useAt }'/>" >
							<input type="hidden" name="useAt21" value="<c:out value='${result21.useAt }'/>" >
							<input type="hidden" name="useAt22" value="<c:out value='${result22.useAt }'/>" >
							<input type="hidden" name="useAt23" value="<c:out value='${result23.useAt }'/>" >
							<input type="hidden" name="useAt24" value="<c:out value='${result24.useAt }'/>" >
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
					<th scope="row" rowspan="9" class="bo_r">10</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj25" value="<c:out value='${result25.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_25" value="<c:out value='${result25.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn25"><c:out value="${result25.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList25">
								<c:if test="${not empty fileList25 and not empty fileList25[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result25.atchFileId}', '${fileList25[0].fileSn }');">${fileList25[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_25">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_25" class="realFile_btn input_none" name="file_25" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt25').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt25"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_26" value="<c:out value='${result26.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn26"><c:out value="${result26.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList26">
								<c:if test="${not empty fileList26 and not empty fileList26[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result26.atchFileId}', '${fileList26[0].fileSn }');">${fileList26[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_26">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_26" class="realFile_btn input_none" name="file_26" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt26').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt26"></span>
								<span class="dc">*이미지 사이즈 : 580*337 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display25_1" id="chk25_1"<c:if test="${result25.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk25_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display25_1" id="chk25_2"<c:if test="${result25.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk25_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom3_25" value="<c:out value='${result25.custom3 }'/>" >
							<input type="hidden" name="custom3_26" value="<c:out value='${result26.custom3 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r" colspan="2"><em class="ootc">*</em>사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display25" id="chk25_3"<c:if test="${result25.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk25_3">Y</label>
								</span>
								<span>
									<input type="radio" name="display25" id="chk25_4"<c:if test="${result25.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk25_4">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt25" value="<c:out value='${result25.useAt }'/>" >
							<input type="hidden" name="useAt26" value="<c:out value='${result26.useAt }'/>" >
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
					<th scope="row" rowspan="14" class="bo_r">11</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="nttSj27" value="<c:out value='${result27.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_27" value="<c:out value='${result27.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn27"><c:out value="${result27.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList27">
								<c:if test="${not empty fileList27 and not empty fileList27[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result27.atchFileId}', '${fileList27[0].fileSn }');">${fileList27[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_27">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_27" class="realFile_btn input_none" name="file_27" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt27').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt27"></span>
								<span class="dc">*이미지 사이즈 : 285*285 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">2</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" name="custom1_28" value="<c:out value='${result28.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" name="nttCn28"><c:out value="${result28.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList28">
								<c:if test="${not empty fileList28 and not empty fileList28[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result28.atchFileId}', '${fileList28[0].fileSn }');">${fileList28[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_28">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_28" class="realFile_btn input_none" name="file_28" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt28').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt28"></span>
								<span class="dc">*이미지 사이즈 : 285*285 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">3</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_29" value="<c:out value='${result29.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn29"><c:out value="${result29.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList29">
								<c:if test="${not empty fileList29 and not empty fileList29[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result29.atchFileId}', '${fileList29[0].fileSn }');">${fileList29[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_29">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_29" class="realFile_btn input_none" name="file_29" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt29').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt29"></span>
								<span class="dc">*이미지 사이즈 : 285*285 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">4</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_30" value="<c:out value='${result30.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn30"><c:out value="${result30.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList30">
								<c:if test="${not empty fileList30 and not empty fileList30[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result30.atchFileId}', '${fileList30[0].fileSn }');">${fileList30[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_30">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_30" class="realFile_btn input_none" name="file_30" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt30').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt30"></span>
								<span class="dc">*이미지 사이즈 : 285*285 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display27" id="chk27_1"<c:if test="${result27.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk27_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display27" id="chk27_2"<c:if test="${result27.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk27_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt27" value="<c:out value='${result27.useAt }'/>" >
							<input type="hidden" name="useAt28" value="<c:out value='${result28.useAt }'/>" >
							<input type="hidden" name="useAt29" value="<c:out value='${result29.useAt }'/>" >
							<input type="hidden" name="useAt30" value="<c:out value='${result30.useAt }'/>" >
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
					<th scope="row" rowspan="5" class="bo_r">12</th>
					<th scope="row" colspan="2" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="nttSj31" value="<c:out value='${result31.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="bo_r" rowspan="3">1</th>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" maxlength="40" class="inp_txt w_full" name="custom1_31" value="<c:out value='${result31.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn31"><c:out value="${result31.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList31">
								<c:if test="${not empty fileList31 and not empty fileList31[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result31.atchFileId}', '${fileList31[0].fileSn }');">${fileList31[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_31">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_31" class="realFile_btn input_none" name="file_31" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt31').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt31"></span>
								<span class="dc">*이미지 사이즈 : 400*400 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display31" id="chk31_1"<c:if test="${result31.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk31_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display31" id="chk31_2"<c:if test="${result31.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk31_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt31" value="<c:out value='${result31.useAt }'/>" >
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
					<th scope="row" rowspan="5" class="bo_r">13</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="nttSj32" value="<c:out value='${result32.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="custom1_32" value="<c:out value='${result32.custom1 }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn32"><c:out value="${result32.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>동영상</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList32">
								<c:if test="${not empty fileList32 and not empty fileList32[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result32.atchFileId}', '${fileList32[0].fileSn }');">${fileList32[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_32">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_32" class="realFile_btn input_none" name="file_32" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt32').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt32"></span>
								<span class="dc">*동영상 사이즈 : 1200*675 | 용량: 100mb  이하 |  mp4</span>
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
									<input type="radio" name="display32" id="chk32_1"<c:if test="${result32.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk32_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display32" id="chk32_2"<c:if test="${result32.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk32_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt32" value="<c:out value='${result32.useAt }'/>" >
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
					<th scope="row" rowspan="4" class="bo_r">14</th>
					<th scope="row" class="ta_r">영역타이틀</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" class="inp_txt w_full" maxlength="40" name="nttSj33" value="<c:out value='${result33.nttSj }'/>" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>텍스트<br>최대200자</th>
					<td class="ta_l">
						<div class="input_wrap">
							<textarea style="width:100%;height:100px" maxlength="200" name="nttCn33"><c:out value="${result33.nttCn }" /></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>이미지</th>
					<td class="ta_l">
						<div class="add_file_wrap">
							<div id="fileList33">
								<c:if test="${not empty fileList33 and not empty fileList33[0]}">
									<a class="file_name" href="#none" onclick="javascript:fnAtchDownFile('${result33.atchFileId}', '${fileList33[0].fileSn }');">${fileList33[0].orignlFileNm }</a>
									<a href="javascript:void(0);" class="btn_shape_x remOneFile">삭제</a>
								</c:if>
							</div>
							<div class="input_wrap b_file_area">
								<label for="file_33">
									<span class="btn_xs">파일 찾기</span>
								</label>
								<input type="file" id="file_33" class="realFile_btn input_none" name="file_33" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt33').innerText = getUploadFileName(this.value)">
								<span id="b_file_txt33"></span>
								<span class="dc">*이미지 사이즈 : 1200*400 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
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
									<input type="radio" name="display33" id="chk33_1"<c:if test="${result33.useAt eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk33_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display33" id="chk33_2"<c:if test="${result33.useAt ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk33_2">N</label>
								</span>
							</span>
							<input type="hidden" name="useAt33" value="<c:out value='${result33.useAt }'/>" >
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
									<input type="radio" name="display34" id="chk34_1"<c:if test="${articleVO.custom2 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk34_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display34" id="chk34_2"<c:if test="${articleVO.custom2 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk34_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom2" value="<c:out value='${articleVO.custom2 }'/>" >
						</div>
					</td>
				</tr>
				<%-- <tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 사용</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display35" id="chk35_1"<c:if test="${articleVO.custom3 eq 'Y'}"> checked="checked"</c:if> class="ez-hide" value="Y"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk35_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display35" id="chk35_2"<c:if test="${articleVO.custom3 ne 'Y'}"> checked="checked"</c:if> class="ez-hide" value="N">
									<label for="chk35_2">N</label>
								</span>
							</span>
							<input type="hidden" name="custom3" value="<c:out value='${articleVO.custom3 }'/>" >
						</div>
					</td>
				</tr> --%>
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>주요 질환 선택</th>
					<td class="ta_l">
						<a href="javascript:fnPopUpOpen('lypop05');"  class="btn sm">선택하기</a>
						<span class="dissListNm"><c:forEach items="${subjectInfo.DISS_CDS_LIST}" var="diss">${diss},</c:forEach></span>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">검색</th>
					<td class="ta_l">
						<div class="input_wrap">
							<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
							<input type="hidden" name="tagNmList" value="<c:out value='${articleVO.tagNmList }'/>" >
							<ul id="tagList" class="tagbox">
								<c:forEach var="tagNmValue" items="${fn:split(articleVO.tagNmList, ',')}">
									<li><c:out value="${tagNmValue }"/><a href="javascript:void(0);" class="tagDelBtn">x</a></li>
								</c:forEach>
							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:updateSPC(document.formUpdate)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectSPCList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
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
					<c:set var="selectDissList" value="${fn:split(articleVO.custom4, ',') }"/>
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
	
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="tmplatId" value="<c:out value='${boardMasterVO.tmplatId}'/>" />
	<input type="hidden" name="nttId" value="<c:out value='${articleVO.nttId}'/>">
	<input type="hidden" name="bbsId" value="<c:out value='${boardMasterVO.bbsId}'/>">
	<input type="hidden" name="custom1" value="<c:out value='${articleVO.custom1}'/>">
	<input type="hidden" name="nttSj" value="<c:out value='${articleVO.nttSj}'/>">
	<input type="hidden" name="nttCn" value="<c:out value='${articleVO.nttCn}'/>">
	<input type="hidden" name="parntsCustom1" value="SPC">
	<input type="hidden" name="custom3" value="<c:out value='${articleVO.custom3}'/>" >
	<input type="hidden" name="custom4" value="<c:out value='${articleVO.custom4}'/>" >

	<input type="hidden" name="nttId1" value="<c:out value='${result1.nttId }'/>" >
	<input type="hidden" name="nttId2" value="<c:out value='${result2.nttId }'/>" >
	<input type="hidden" name="nttId3" value="<c:out value='${result3.nttId }'/>" >
	<input type="hidden" name="nttId4" value="<c:out value='${result4.nttId }'/>" >
	<input type="hidden" name="nttId5" value="<c:out value='${result5.nttId }'/>" >
	<input type="hidden" name="nttId6" value="<c:out value='${result6.nttId }'/>" >
	<input type="hidden" name="nttId7" value="<c:out value='${result7.nttId }'/>" >
	<input type="hidden" name="nttId8" value="<c:out value='${result8.nttId }'/>" >
	<input type="hidden" name="nttId9" value="<c:out value='${result9.nttId }'/>" >
	<input type="hidden" name="nttId10" value="<c:out value='${result10.nttId }'/>" >
	<input type="hidden" name="nttId11" value="<c:out value='${result11.nttId }'/>" >
	<input type="hidden" name="nttId12" value="<c:out value='${result12.nttId }'/>" >
	<input type="hidden" name="nttId13" value="<c:out value='${result13.nttId }'/>" >
	<input type="hidden" name="nttId14" value="<c:out value='${result14.nttId }'/>" >
	<input type="hidden" name="nttId15" value="<c:out value='${result15.nttId }'/>" >
	<input type="hidden" name="nttId16" value="<c:out value='${result16.nttId }'/>" >
	<input type="hidden" name="nttId17" value="<c:out value='${result17.nttId }'/>" >
	<input type="hidden" name="nttId18" value="<c:out value='${result18.nttId }'/>" >
	<input type="hidden" name="nttId19" value="<c:out value='${result19.nttId }'/>" >
	<input type="hidden" name="nttId20" value="<c:out value='${result20.nttId }'/>" >
	<input type="hidden" name="nttId21" value="<c:out value='${result21.nttId }'/>" >
	<input type="hidden" name="nttId22" value="<c:out value='${result22.nttId }'/>" >
	<input type="hidden" name="nttId23" value="<c:out value='${result23.nttId }'/>" >
	<input type="hidden" name="nttId24" value="<c:out value='${result24.nttId }'/>" >
	<input type="hidden" name="nttId25" value="<c:out value='${result25.nttId }'/>" >
	<input type="hidden" name="nttId26" value="<c:out value='${result26.nttId }'/>" >
	<input type="hidden" name="nttId27" value="<c:out value='${result27.nttId }'/>" >
	<input type="hidden" name="nttId28" value="<c:out value='${result28.nttId }'/>" >
	<input type="hidden" name="nttId29" value="<c:out value='${result29.nttId }'/>" >
	<input type="hidden" name="nttId30" value="<c:out value='${result30.nttId }'/>" >
	<input type="hidden" name="nttId31" value="<c:out value='${result31.nttId }'/>" >
	<input type="hidden" name="nttId32" value="<c:out value='${result32.nttId }'/>" >
	<input type="hidden" name="nttId33" value="<c:out value='${result33.nttId }'/>" >
	<input type="hidden" name="atchFileId_1" value="<c:out value='${result1.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_2" value="<c:out value='${result2.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_3" value="<c:out value='${result3.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_4" value="<c:out value='${result4.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_5" value="<c:out value='${result5.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_6" value="<c:out value='${result6.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_7" value="<c:out value='${result7.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_8" value="<c:out value='${result8.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_9" value="<c:out value='${result9.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_10" value="<c:out value='${result10.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_11" value="<c:out value='${result11.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_12" value="<c:out value='${result12.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_13" value="<c:out value='${result13.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_14" value="<c:out value='${result14.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_15" value="<c:out value='${result15.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_16" value="<c:out value='${result16.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_17" value="<c:out value='${result17.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_18" value="<c:out value='${result18.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_19" value="<c:out value='${result19.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_20" value="<c:out value='${result20.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_21" value="<c:out value='${result21.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_22" value="<c:out value='${result22.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_23" value="<c:out value='${result23.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_24" value="<c:out value='${result24.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_25" value="<c:out value='${result25.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_26" value="<c:out value='${result26.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_27" value="<c:out value='${result27.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_28" value="<c:out value='${result28.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_29" value="<c:out value='${result29.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_30" value="<c:out value='${result30.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_31" value="<c:out value='${result31.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_32" value="<c:out value='${result32.atchFileId }'/>" >
	<input type="hidden" name="atchFileId_33" value="<c:out value='${result33.atchFileId }'/>" >	
</form:form>

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/spc/selectSPCList.do'/>" method="post">
</form>
