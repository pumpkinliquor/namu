<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<script src="/js/fbcms/mobile/slick.js"></script>
		<!-- contents s -->
		<div class="contents">
			<div class="tab swiper-container">
				<ul class="tab_list swiper-wrapper"><!-- tab -->
					<li class="swiper-slide"><a href="#none" onclick="funcOri()" title="선택된 탭">센터소개</a></li>
					<c:forEach var="clinicInfo" items="${listClinic }">
						<li class="swiper-slide SEQ${clinicInfo.mngSeq}"><a href="#none" onclick="funcMenu(${clinicInfo.mngSeq})"><c:out value="${clinicInfo.clinicNm }" /></a></li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- title s -->
			<div class="clinic_a max1200">
				<header>${clinicInfo.CLINIC_NM}</header>
			</div>
			<!-- //title e -->

			<!-- 01 s -->
			<c:if test="${clinicInfo.TMP_LIST[0].USE_YN eq 'Y' }">
				<div class="section01 max1200">
					<h4>${clinicInfo.TMP_LIST[0].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
				</div>
			</c:if>
			<!-- //01 e -->

			<!-- 02 s -->
			<c:if test="${clinicInfo.TMP_LIST[1].USE_YN eq 'Y' }">
				<div class="section01 max1200">
					<h4>${clinicInfo.TMP_LIST[1].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
					<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}'/>">
				</div>
			</c:if>
			<!-- //02 e -->

			<!-- 03 s -->
			<c:if test="${clinicInfo.TMP_LIST[2].USE_YN eq 'Y' }">
				<div class="clinic_c03 section12 max1200">
					<div>
						<h4>${clinicInfo.TMP_LIST[2].AREA_TITLE_CT}</h4>
						<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
					</div>
					<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}'/>">
				</div>
			</c:if>
			<!-- //03 e -->

			<!-- 04 s -->
			<c:if test="${clinicInfo.TMP_LIST[3].USE_YN eq 'Y' }">
				<div class="clinic_c04 clinic_b02">
					<div class="max1200">
						<h4>${clinicInfo.TMP_LIST[3].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[3].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[3].DTIL_LIST[1].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[3].DTIL_LIST[1].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //04 e -->

			<!-- 05 s -->
			<c:if test="${clinicInfo.TMP_LIST[4].USE_YN eq 'Y' }">
				<div class="clinic_c05">
					<div class="section01 max1200">
						<h4>${clinicInfo.TMP_LIST[4].AREA_TITLE_CT}</h4>
						<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[4].DTIL_LIST[0].IMG_ATCH_NO}'/>">
					</div>
				</div>
			</c:if>
			<!-- //05 e -->

			<!-- 06 S -->
			<c:if test="${clinicInfo.TMP_LIST[5].USE_YN eq 'Y' }">
				<div class="clinic_c06 max1200">
					<h4>${clinicInfo.TMP_LIST[5].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}'/>">
					</div>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}'/>">
					</div>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[5].DTIL_LIST[2].IMG_ATCH_NO}'/>">
					</div>
				</div>
			</c:if>
			<!-- //06 e -->

			<!-- 07 s -->
			<c:if test="${clinicInfo.TMP_LIST[6].USE_YN eq 'Y' }">
				<div class="clinic_c07 clinic_a06">
					<div class="section03 max1200">
						<h4>${clinicInfo.TMP_LIST[6].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[6].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[1].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[1].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[6].DTIL_LIST[2].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[2].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[2].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[6].DTIL_LIST[3].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[3].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[3].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //07 e -->

			<!-- 08 s -->
			<c:if test="${clinicInfo.TMP_LIST[7].USE_YN eq 'Y' }">
				<div class="clinic_c08 max1200">
					<h4>${clinicInfo.TMP_LIST[7].AREA_TITLE_CT}</h4>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[7].DTIL_LIST[0].IMG_ATCH_NO}'/>">
						<div>
							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[0].TITLE_CT}" flag="2"/></h5>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
						</div>
					</div>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[7].DTIL_LIST[1].IMG_ATCH_NO}'/>">
						<div>
							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[1].TITLE_CT}" flag="2"/></h5>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[1].TEXT_TX}" flag="2"/></p>
						</div>
					</div>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[7].DTIL_LIST[2].IMG_ATCH_NO}'/>">
						<div>
							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[2].TITLE_CT}" flag="2"/></h5>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[2].TEXT_TX}" flag="2"/></p>
						</div>
					</div>
					<div>
						<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[7].DTIL_LIST[3].IMG_ATCH_NO}'/>">
						<div>
							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[3].TITLE_CT}" flag="2"/></h5>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[7].DTIL_LIST[3].TEXT_TX}" flag="2"/></p>
						</div>
					</div>
				</div>	
			</c:if>
			<!-- //08 e -->

			<!-- 09 s -->
			<c:if test="${clinicInfo.TMP_LIST[8].USE_YN eq 'Y' }">
				<div class="clinic_c09">
					<div class="max1200">
						<h4>${clinicInfo.TMP_LIST[8].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[8].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[0].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[8].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[1].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[1].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[8].DTIL_LIST[2].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[2].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[2].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[8].DTIL_LIST[3].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[3].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[3].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[8].DTIL_LIST[4].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[4].TITLE_CT}" flag="2"/></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[8].DTIL_LIST[4].TEXT_TX}" flag="2"/></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //09 e -->
			
			<!-- 10 s -->
			<c:if test="${clinicInfo.TMP_LIST[9].USE_YN eq 'Y' }">
				<div class="section01 max1200">
					<h4>${clinicInfo.TMP_LIST[9].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[9].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
					<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[9].DTIL_LIST[0].IMG_ATCH_NO}'/>">
				</div>
			</c:if>
			<!-- //10 e -->

			<!-- 11 s -->
			<c:if test="${clinicInfo.TMP_LIST[10].USE_YN eq 'Y' }">
				<div class="clinic_c11">
					<div class="max1200">
						<h4>${clinicInfo.TMP_LIST[10].AREA_TITLE_CT}</h4>
						<p>${clinicInfo.TMP_LIST[10].DTIL_LIST[0].TITLE_CT}</p>
						<ul>
							<li>
								<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[10].DTIL_LIST[0].IMG_ATCH_NO}'/>">
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[10].DTIL_LIST[0].TEXT_TX}" flag="2"/></p>
							</li>
							<li>
								<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[10].DTIL_LIST[1].IMG_ATCH_NO}'/>">
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[10].DTIL_LIST[1].TEXT_TX}" flag="2"/></p>
							</li>
							<li>
								<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[10].DTIL_LIST[2].IMG_ATCH_NO}'/>">
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[10].DTIL_LIST[2].TEXT_TX}" flag="2"/></p>
							</li>
							<li>
								<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[10].DTIL_LIST[3].IMG_ATCH_NO}'/>">
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[10].DTIL_LIST[3].TEXT_TX}" flag="2"/></p>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
			<!-- //11 e -->

			<!-- 주요질환 s -->
			<div class="section16 max1200">
				<h4>주요질환</h4>
				<div class="tag_list">
				<c:forEach var="dissInfo" items="${clinicInfo.DISS_CDS_LIST}">
					${dissInfo}
				</c:forEach>
				</div>
			</div>
			<!-- //주요질환 e -->

		<!-- 의료진 s -->
		<div class="section17 max1200">
			<h4>의료진</h4>
			<div class="staff_list">
			
			<c:forEach items="${clinicInfo.DR_LIST}" var="DR"
					varStatus="status">
			
				<div>
					<img id="drImg" src="<c:url value='/getImage/${DR.PC_IMG_ATCH_NO}'/>" alt="">
					<p>
						<strong id="drName">${DR.DR_NM}<span id="drPo">${DR.POSITION_CT}</span></strong> <span id="drFie">${DR.FIELD_CT}</span>
						<input type="hidden" id="MEDI_SBJ_CD" value="${DR.MEDI_SBJ_CD}">
					</p>
					<div>
						<a href="javascript:fnDrDetail('${DR.DR_ID}');" class="more">자세히 보기 +
							<form method="post" action="">
							<input type="hidden" name="index" value="<c:out value="${status.index}" />">
							</form>
						</a>
						<c:if test="${fn:contains(DR.ADD_OPEN_SET_CD, '02')}">
						<c:url value="/user/cts/rsv/userRSVClinic.do" var="rsvUrl">
						  <c:param name="DPT_CD" value="${DR.MEDI_SBJ_CD}" />
						  <c:param name="DR_ID" value="${DR.DR_ID}" />
						  <c:param name="DR_NM" value="${DR.DR_NM}" />
						</c:url>
						<a href="${rsvUrl}" class="reserved">예약하기</a>
						</c:if>
						
						<c:choose>
							<c:when test="${favoritesDRList ne null}">
							
								<c:forEach items="${favoritesDRList}" var="faDR"
									varStatus="sts">
								
									<c:choose>
										<c:when test="${faDR.DR_ID eq DR.DR_ID and faDR.LIKE_YN eq 'Y' }">
											<a href="javascript:void(0);" class="save check">
												<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
												<input type="hidden" value="Y" class="check">
											</a>
										</c:when>						
										<c:otherwise>
											<a href="javascript:void(0);" class="save">
												<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
												<input type="hidden" value="N" class="check">
											</a>
										</c:otherwise> 
									</c:choose>
								</c:forEach>
	
							</c:when>
							
							<c:otherwise>
							<a href="javascript:void(0);" class="save">
								<input type="hidden" value="<c:out value="${DR.DR_ID}" />">
								<input type="hidden" value="N" class="check">
							</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
			</c:forEach>
				
			</div>
		</div>
		<!-- //의료진 e -->
		
		<!-- 의료진 popup s -->
		<jsp:include page="/WEB-INF/jsp/fbcms/mobile/spc/cti/drdetail.jsp" />
		<!-- 의료진 popup e -->

<form name="CTIseq" action="" method="post">
	<input type="hidden" name="MNG_SEQ" id="MNG_SEQ" value=""/>
	<input type="hidden" name="MNG_CD" id="MNG_CD" value=""/>
</form>

<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>
$(function() {
	$(".SEQ" + ${mseq}).addClass("selected");
	
	//03 이미지 순서 변경
	$('.clinic_b03 > div > div').eq(0).children('img').insertAfter($('.clinic_b03 > div > div').eq(0).children('div'));

	//03 vs top
	$('.clinic_b03 > div > p').css('top',$('.clinic_b03 h4').height() + $('.clinic_b03 > div > div').eq(0).height() + 25);

	$('.section03 > p').css('top',$('.section03 h4').outerHeight() + $('.section03 > div').eq(0).outerHeight() + 55 - 30);
	
	//06
	$('.clinic_c06 > div').wrapAll('<div class="clinic_c06_box"/>)');
	$('.clinic_c06_box').slick({
	  arrows: false,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 1.8,
	  slidesToScroll: 1,
	});

	//08
	$('.clinic_c08 > div img').height($('.clinic_c08 > div img').width() * 0.515);

	//11
	$('.clinic_c11 li img').height($('.clinic_c11 li img').width());

	//의료진
	$('.staff_list').slick({
	  arrows: false,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 1.8,
	  slidesToScroll: 1,
	});


});


function funcMenu(ID) {
	var custom1 = "${custom1}";
	if(custom1 == "") {
		custom1 = "${cust1}";
	}
	document.CTIseq.action = "/user/spc/cti/selectClinicInfo.do";
	document.CTIseq.MNG_SEQ.value = ID;
	document.CTIseq.MNG_CD.value = custom1;
	document.CTIseq.submit(); 
}


function funcOri() {
	var url = "${cust1}";
	location.href = "/user/spc/cti/selectCTIInfo.do?custom1=" + url;
}

$(".save").on("click",function(){
	var s = $(this);
	var check = (s.children(".check")).val();
	if('${LoginVO.name}'==null||'${LoginVO.name}'==""){
		alert("로그인 해주세요!");
		window.location.href = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/user/lgn/sin/userLogin.do";
	}else{
		var USER_ID = '${LoginVO.id}';
		var DR_ID = $(this).children("input[type=hidden]").val();
		var obj={
			url:"/user/hpm/smt/likecheck.do"
			, data:{USER_ID:USER_ID,DR_ID:DR_ID,check:check}
			, dataType:"text"
			, fnSuccess: function(data){
				if(data=='Y'){
					s.addClass("check");
					s.children(".check").val('Y');
				} else if(data=='N') {
					s.removeClass("check");
					s.children(".check").val('N');
				} else {
				}
			},
			fnError:function(error){
			}
		}
		fnAjax(obj);
	}
});

</script>
