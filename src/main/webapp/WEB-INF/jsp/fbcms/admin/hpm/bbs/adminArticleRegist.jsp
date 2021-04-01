<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<h3 class="mid_tit mg_t50"><c:out value="${boardMasterVO.bbsNm}"/> <spring:message code="title.create" /></h3>
<p class="te_ri_txt"><em class="ootc">*</em>필수입력 항목 입니다.</p>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>"></script>
<script type="text/javascript" src="<c:url value='/html/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="articleVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">
<!--
	var oEditors = [];
	var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
	var tagNmList = {};
	
	$(function() {
		/* 커스텀 데이트 셋팅 */
		$("#customDate1, #customDate2, #customDate3, #customDate4, #customDate5").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		/* 게시시작일, 게시종료일 셋팅 */
		$("#ntceBgnDe").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		
		$("#ntceEndde").datepicker({
			dateFormat:'yy.mm.dd' 
		});
		$('#ntceBgnDe').datepicker("option", "maxDate", $("#ntceEndde").val());
		$('#ntceBgnDe').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceEndde").datepicker( "option", "minDate", selectedDate );
		});
		$('#ntceEndde').datepicker("option", "minDate", $("#ntceBgnDe").val());
		$('#ntceEndde').datepicker("option", "onClose", function (selectedDate) {
			$("#ntceBgnDe").datepicker( "option", "maxDate", selectedDate );
		});
		
		/* 상단공지여부 */
		$('#articleVO').on('change', '#chk01_1, #chk01_2', function() {
			if($('#chk01_1:checked').length > 0) {
				$('#noticeAt').val('Y');
			} else {
				$('#noticeAt').val('N');
			}
		});
		
		/* 게시여부 */
		$('#articleVO').on('change', '#chk02_1, #chk02_2', function() {
			if($('#chk02_1:checked').length > 0) {
				$('#postingYn').val('Y');
			} else {
				$('#postingYn').val('N');
			}
		});
		
		/* 본문사용여부 */
		$('#articleVO').on('change', '#custom2_1, #custom2_2', function() {
			if($('#custom2_1:checked').length > 0) {
				$('#custom2').val('Y');
				$('#nttCnTr').show();
			} else {
				$('#custom2').val('N');
				$('#nttCnTr').hide();
			}
		});
		
		/* 파일첨부 있을경우 */
		<c:choose>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
		$('#file_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg', 'hwp', 'doc', 'docx', 'xls', 'xlsx']) == -1) {
				document.getElementById('b_file_txt').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		</c:when>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
		$('#file_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['pdf']) == -1) {
				document.getElementById('b_file_txt').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_2').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_3').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		</c:when>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}">
		$('#file_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['mp4']) == -1) {
				document.getElementById('b_file_txt1').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt1').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_2').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_3').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		</c:when>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
		$('#file_1').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['mp4']) == -1) {
				document.getElementById('b_file_txt1').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt1').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_2').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt2').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		$('#file_3').on('change', function() {
			// 확장자 체크
			var ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일첨부가 허용된 파일이 아닙니다.');
				fileInit($(this));
				return;
			}
			
			// 파일 용량 체크
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024 * 10;
			/* if(fileSize > maxSize) {
				document.getElementById('b_file_txt3').innerText = '';
				alert('파일용량 10MB를 초과했습니다.');
				fileInit($(this));
				return;
			} */
		});
		</c:when>
		</c:choose>
		
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
						document.formInsert.tagNmList.value = Object.values(tagNmList).toString();
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
			document.formInsert.tagNmList.value = Object.values(tagNmList).toString();
		});
		
		/* 링크일 경우 */
		$('.linkUrl').on('change', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		});
		$('.linkUrl').on('keyup', function() {
			if($('.linkUrl').val().length < 1) {
				$('.linkUrl').val('http://');
			}
		});
	});
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		<c:if test="${boardMasterVO.bbsId ne 'BBSMSTR_000000000004'}">
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "nttCn",
				sSkinURI : "/html/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
					//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
					fOnBeforeUnload : function() {
						//alert("완료!");
					},
					I18N_LOCALE : sLang
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator: "createSEditor2"
			});
		</c:if>
		// 첫 입력란에 포커스
		document.getElementById("articleVO").nttSj.focus();
	}
	
	/* ********************************************************
	 * 저장 처리
	 ******************************************************** */
	function insertArticle(form) {
		<c:if test="${boardMasterVO.bbsId ne 'BBSMSTR_000000000004'}">
			oEditors.getById["nttCn"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		</c:if>
		
		//input item Client-Side validate
		if (!validateArticleVO(form)) {
			return false;
		} else {
			var validateForm = document.getElementById("articleVO");
			
			//게시기간 
			if($("#ntceBgnde").length > 0) {
				var ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
				var ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);
				
				if(ntceBgnde == '' && ntceEndde != '') {
					validateForm.ntceBgnde.value = '1900-01-01';
				}
				if(ntceBgnde != '' && ntceEndde == '') {
					validateForm.ntceEndde.value = '9999-12-31';
				}
				if(ntceBgnde == '' && ntceEndde == '') {
					validateForm.ntceBgnde.value = '1900-01-01';
					validateForm.ntceEndde.value = '9999-12-31';
				}
				
				ntceBgnde = getRemoveFormat(validateForm.ntceBgnde.value);
				ntceEndde = getRemoveFormat(validateForm.ntceEndde.value);
				
				if(ntceBgnde > ntceEndde) {
					alert("<spring:message code="comCopBbs.articleVO.ntceDeError" />");
					return;
				}
			}
			
			<c:choose>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
			if($('#custom1').val() == '') {
				alert('카테고리를 선택해주세요');
				return;
			}
			</c:when>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
			if($('#fileList2').size() < 1 && document.getElementById('b_file_txt2').innerText == '') {
				alert('Pc 이미지는 필수입니다.');
				return;
			}
			if($('#fileList3').size() < 1 && document.getElementById('b_file_txt3').innerText == '') {
				alert('Mobile 이미지는 필수입니다.');
				return;
			}
			</c:when>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
			if($('#custom1').val() == '') {
				alert('카테고리를 선택해주세요');
				return;
			}
			</c:when>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
			if($('#custom1').val() == '') {
				alert('카테고리를 선택해주세요');
				return;
			}
			</c:when>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}">
			if($('#fileList1').size() < 1 && document.getElementById('b_file_txt1').innerText == '') {
				alert('동영상 첨부는 필수입니다.');
				return;
			}
			if($('#fileList2').size() < 1 && document.getElementById('b_file_txt2').innerText == '') {
				alert('Pc 이미지는 필수입니다.');
				return;
			}
			if($('#fileList3').size() < 1 && document.getElementById('b_file_txt3').innerText == '') {
				alert('Mobile 이미지는 필수입니다.');
				return;
			}
			</c:when>
			<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
			if($('#custom1').val() == '') {
				alert('카테고리를 선택해주세요');
				return;
			}
			if($('#fileList1').size() < 1 && document.getElementById('b_file_txt1').innerText == '') {
				alert('동영상 첨부는 필수입니다.');
				return;
			}
			if($('#fileList2').size() < 1 && document.getElementById('b_file_txt2').innerText == '') {
				alert('Pc 이미지는 필수입니다.');
				return;
			}
			if($('#fileList3').size() < 1 && document.getElementById('b_file_txt3').innerText == '') {
				alert('Mobile 이미지는 필수입니다.');
				return;
			}
			</c:when>
			</c:choose>
			
			var validateNttCn = true;
			<c:choose>
				<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
					if($('#custom2').val() == 'N') { // 언론보도일 경우 본문 사용안함으로 체크시 내용 필수 해제
						var validateNttCn = false;
					}
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			if($('#nttCn').val() == '<p>&nbsp;</p>') {
				$('#nttCn').val('');
			}
				
			if($('#nttCn').val() == '' && validateNttCn) {
				alert("내용은(는) 필수 입력값입니다.");
				document.getElementById("articleVO").nttCn.focus();
				return false;
			} else {
				if (confirm("<spring:message code="common.regist.msg" />")) {
					form.submit();
				}
			}
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function selectArticleList(form) {
		form.submit();
	}
-->
</script>

<!-- 상단타이틀 -->
<form:form commandName="articleVO" name="formInsert" action="/admin/hpm/bbs/insertArticle.do" method="post" onSubmit="insertArticle(document.formInsert); return false;" enctype="multipart/form-data">
	<div class="board_ty">
		<table>
			<colgroup>
				<col span="1" style="width:15%">
				<col span="1" style="width:*">
			</colgroup>
			<tbody>
				<c:set var="subject">제목</c:set>
				<%-- 커스텀 추가 --%>
				<c:choose>
					<%-- 질환정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
						<c:set var="subject">질환명</c:set>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>카테고리</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select class="select" id="custom1" name="custom1">
										<option value="">선택하세요</option>
										<c:forEach var="cmmCodeInfo" items="${listDSIComCode }">
											<option value="${cmmCodeInfo.code }"><c:out value="${cmmCodeInfo.codeNm }" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r">연관 진료과</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select class="select" id="custom2" name="custom2">
										<option value="">선택하세요</option>
										<c:forEach var="SBMInfo" items="${listOcsSBM }">
											<option value="${SBMInfo.MNG_CD }"><c:out value="${SBMInfo.MNG_NM }" /></option>
										</c:forEach>
										<c:forEach var="SBMInfo" items="${listSBM }">
											<option value="${SBMInfo.MNG_CD }"><c:out value="${SBMInfo.MNG_NM }" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 영양정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>카테고리</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select class="select" id="custom1" name="custom1">
										<option value="">선택하세요</option>
										<c:forEach var="cmmCodeInfo" items="${listNTIComCode }">
											<option value="${cmmCodeInfo.code }"><c:out value="${cmmCodeInfo.codeNm }" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 운동정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>카테고리</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select class="select" id="custom1" name="custom1">
										<option value="">선택하세요</option>
										<c:forEach var="cmmCodeInfo" items="${listMVIComCode }">
											<option value="${cmmCodeInfo.code }"><c:out value="${cmmCodeInfo.codeNm }" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 운동동영상일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>카테고리</th>
							<td class="ta_l">
								<div class="select_wrap">
									<select class="select" id="custom1" name="custom1">
										<option value="">선택하세요</option>
										<c:forEach var="cmmCodeInfo" items="${listMVMComCode }">
											<option value="${cmmCodeInfo.code }"><c:out value="${cmmCodeInfo.codeNm }" /></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
				
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em><c:out value="${subject }"/></th>
					<td class="ta_l">
						<div class="input_wrap">
							<form:input path="nttSj" title="${subject }" cssClass="inp_txt w_full" maxlength="100" />
	   						<div><form:errors path="nttSj" cssClass="error" /></div>
						</div>
					</td>
				</tr>
				
				<%-- 커스텀 추가 --%>
				<c:choose>
					<%-- 언론보도일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
						<tr>
							<th scope="row" class="ta_r">날짜</th>
							<td class="ta_l">
								<div class="tab_date_wrap">
									<div class="input_wrap">
										<input type="text" id="customDate1" name="customDate1" value="${articleVO.customDate1 }" class="inp_txt wd110 date_pick" title="" placeholder="">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r">언론사</th>
							<td class="ta_l">
								<form:input path="custom1" title="언론사" cssClass="inp_txt w_full" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>본문 사용 여부</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="displayCustom2" id="custom2_1" checked="checked" class="ez-hide">
											<label for="custom2_1">Y</label>
										</span>
										<span>
											<input type="radio" name="displayCustom2" id="custom2_2" class="ez-hide">
											<label for="custom2_2">N</label>
										</span>
									</span>
									<input type="hidden" id="custom2" name="custom2" value="<c:out value='${articleVO.custom2}'/>" />
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
				
				<!-- 글 내용  -->
				<c:choose>
					<%-- Dr.민영일의 건강백서일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
						<input type="hidden" id="nttCn" name="nttCn" value="내용이 없는 게시판입니다.">
					</c:when>
					<c:otherwise>
						<tr<c:if test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002' }"> id="nttCnTr"</c:if>>
							<th scope="row" class="ta_r"><em class="ootc">*</em>내용</th>
							<td class="ta_l">
								<div class="input_wrap">
									<form:textarea path="nttCn" title="내용"/>
									<div><form:errors path="nttCn" cssClass="error" /></div>
								</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				<%-- 커스텀 추가 --%>
				<c:choose>
					<%-- 공지사항일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000001'}">
						<tr>
							<th scope="row" class="ta_r">파일첨부</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt').innerText = this.value">
										<span id="b_file_txt"></span>
										<span class="dc">* 용량: 10mb  이하 |  jpg, gif, png, jpeg, hwp, doc, docx, xls, xlsx</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>상단고정여부</th>
							<td class="ta_l">
								<div class="input_wrap">
									<span class="ds_raido">
										<span>
											<input type="radio" name="display01" id="chk01_1" class="ez-hide">
											<label for="chk01_1">Y</label>
										</span>
										<span>
											<input type="radio" name="display01" id="chk01_2" checked="checked" class="ez-hide">
											<label for="chk01_2">N</label>
										</span>
									</span>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 언론보도일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
						<tr>
							<th scope="row" class="ta_r">링크</th>
							<td class="ta_l">
								<form:input path="custom3" title="링크" cssClass="inp_txt w_full linkUrl" maxlength="200" value="http://" />
							</td>
						</tr>
					</c:when>
					<%-- 질환정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
						<tr>
							<th scope="row" class="ta_r">검색 Tag</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									<input type="hidden" name="tagNmList" >
									<ul id="tagList" class="tagbox"></ul>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- Dr.민영일의 건강백서일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000004'}">
						<tr>
							<th scope="row" class="ta_r">파일첨부</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="첨부파일이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = this.value">
										<span id="b_file_txt1"></span>
										<span class="dc">*파일 사이즈 : 720*1162 | 용량: 10mb  이하 |  pdf</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Pc 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일 Pc 이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
										<span id="b_file_txt2"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Mobile 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_3" class="realFile_btn input_none" name="file_3" title="첨부파일 Mobile 이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt3').innerText = this.value">
										<span id="b_file_txt3"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 영양정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
						<tr>
							<th scope="row" class="ta_r">검색 Tag</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									<input type="hidden" name="tagNmList" >
									<ul id="tagList" class="tagbox"></ul>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 운동정보일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
						<tr>
							<th scope="row" class="ta_r">검색 Tag</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									<input type="hidden" name="tagNmList" >
									<ul id="tagList" class="tagbox"></ul>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 건강동영상일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000007'}">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>동영상 첨부</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="동영상 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = this.value">
										<span id="b_file_txt1"></span>
										<span class="dc">*동영상 사이즈 : 720*1162 | 용량: 10mb  이하 | mp4</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Pc 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일 Pc이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
										<span id="b_file_txt2"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Mobile 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_3" class="realFile_btn input_none" name="file_3" title="첨부파일 Mobile 이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt3').innerText = this.value">
										<span id="b_file_txt3"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
					</c:when>
					<%-- 운동동영상일 경우 --%>
					<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>동영상 첨부</th></th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_1">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_1" class="realFile_btn input_none" name="file_1" title="동영상 찾아보기" onchange="javascript:document.getElementById('b_file_txt1').innerText = this.value">
										<span id="b_file_txt1"></span>
										<span class="dc">*동영상 사이즈 : 720*1162 | 용량: 10mb  이하 | mp4</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Pc 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_2">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_2" class="realFile_btn input_none" name="file_2" title="첨부파일 Pc이미지 찾아보기" onchange="javascript:document.getElementById('b_file_txt2').innerText = this.value">
										<span id="b_file_txt2"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r"><em class="ootc">*</em>Mobile 이미지</th>
							<td class="ta_l">
								<div class="add_file_wrap">
									<div class="input_wrap b_file_area">
										<label for="file_3">
											<span class="btn_xs">파일 찾기</span>
										</label>
										<input type="file" id="file_3" class="realFile_btn input_none" name="file_3" title="첨부파일 Mobile 찾아보기" onchange="javascript:document.getElementById('b_file_txt3').innerText = this.value">
										<span id="b_file_txt3"></span>
										<span class="dc">*이미지 사이즈 : 720*1162 | 용량: 10mb  이하 |  jpg, gif, png, jpeg</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="ta_r">검색 Tag</th>
							<td class="ta_l">
								<div class="input_wrap">
									<input type="text" id="tagInput" title="검색 Tag" class="inp_txt w_full" />
									<input type="hidden" name="tagNmList" >
									<ul id="tagList" class="tagbox"></ul>
								</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
				
				<tr>
					<th scope="row" class="ta_r"><em class="ootc">*</em>게시여부</th>
					<td class="ta_l">
						<div class="input_wrap">
							<span class="ds_raido">
								<span>
									<input type="radio" name="display02" id="chk02_1" checked="checked" class="ez-hide"><!-- id 변경시 label for 값 같이 변경 -->
									<label for="chk02_1">Y</label>
								</span>
								<span>
									<input type="radio" name="display02" id="chk02_2" class="ez-hide">
									<label for="chk02_2">N</label>
								</span>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="ta_r">등록일</th>
					<td class="ta_l"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /> <span class="pd_l10"><fmt:formatDate value="${now}" pattern="HH:mm:ss" /></span></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btns">
		<a href="#none" onclick="javascript:insertArticle(document.formInsert)" class="btn_ty02">저장하기</a>
		<a href="#none" onclick="javascript:selectArticleList(document.formList)" class="btn_ty">취소하기</a>
	</div>
	
	<input type="hidden" id="noticeAt" name="noticeAt" value="N" />
	<input type="hidden" id="postingYn" name="postingYn" value="Y" />
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="bbsTyCode" value="<c:out value='${boardMasterVO.bbsTyCode}'/>" />
	<input type="hidden" name="replyPosblAt" value="<c:out value='${boardMasterVO.replyPosblAt}'/>" />
	<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${boardMasterVO.fileAtchPosblAt}'/>" />
	<input type="hidden" id="atchPosblFileNumber" name="atchPosblFileNumber" value="<c:out value='${boardMasterVO.atchPosblFileNumber}'/>" />
	<input type="hidden" name="atchPosblFileSize" value="<c:out value='${boardMasterVO.atchPosblFileSize}'/>" />
	<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
</form:form>

<!-- 첨부파일 업로드 가능화일 설정 Start..-->  
<script type="text/javascript">
	var maxFileNum = document.getElementById('atchPosblFileNumber').value;
	if(maxFileNum==null || maxFileNum=="") {
		maxFileNum = 3;
	}
	//var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
	//multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
<!-- 첨부파일 업로드 가능화일 설정 End.-->

<!-- 검색조건 유지 -->
<form name="formList" action="<c:url value='/admin/hpm/bbs/selectArticleList.do'/>" method="post">
	<input type="hidden" name="bbsId" value="${boardMasterVO.bbsId}">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
	<input type="hidden" name="searchCnd" value="0">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<input type="hidden" name="postingYn" value="<c:out value='${searchVO.postingYn}'/>" />
	<c:choose>
		<%-- 언론보도일 경우 --%>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000002'}">
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
		</c:when>
		<%-- 질환정보일 경우 --%>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000003'}">
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.custom1}'/>" />
		</c:when>
		<%-- 영양정보일 경우 --%>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000005'}">
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.custom1}'/>" />
		</c:when>
		<%-- 운동정보일 경우 --%>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000006'}">
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.custom1}'/>" />
		</c:when>
		<%-- 운동동영상일 경우 --%>
		<c:when test="${boardMasterVO.bbsId eq 'BBSMSTR_000000000008'}">
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.custom1}'/>" />
		</c:when>
		<c:otherwise>
			<input type="hidden" name="searchBgnDe" value="<c:out value='${searchVO.searchBgnDe}'/>" />
			<input type="hidden" name="searchEndDe" value="<c:out value='${searchVO.searchEndDe}'/>" />
		</c:otherwise>
	</c:choose>
</form>