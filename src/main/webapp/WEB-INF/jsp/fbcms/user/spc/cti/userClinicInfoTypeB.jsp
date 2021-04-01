<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fbcms" uri="/WEB-INF/tlds/fbcms.tld" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!-- contents s -->
<div class="contents">
	<ul class="tab_list02 max1200"><!-- tab -->
		<li class=""><a href="#none" onclick="funcOri()" title="선택된 탭">센터소개</a></li>
		<c:forEach var="clinicInfo" items="${listClinic }">
			<li class="SEQ${clinicInfo.mngSeq}"><a href="#none" onclick="funcMenu(${clinicInfo.mngSeq})"><c:out value="${clinicInfo.clinicNm }" /></a></li>
		</c:forEach>
	</ul>

			<!-- title s -->
			<div class="clinic_a max1200">
				<header>${clinicInfo.CLINIC_NM}</header>
			</div>
			<!-- //title e -->

			<!-- 01 s -->
			<c:if test="${clinicInfo.TMP_LIST[0].USE_YN eq 'Y' }">
				<div class="section01 max1200">
					<h4>${clinicInfo.TMP_LIST[0].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[0].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
				</div>
			</c:if>
			<!-- //01 e -->

			<!-- 02 s -->
			<c:if test="${clinicInfo.TMP_LIST[1].USE_YN eq 'Y' }">
				<div class="clinic_b02">
					<div class="max1200">
						<h4>${clinicInfo.TMP_LIST[1].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[1].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[1].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[1].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[1].DTIL_LIST[1].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[1].DTIL_LIST[1].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //02 e -->

			<!-- 03 s -->
			<c:if test="${clinicInfo.TMP_LIST[2].USE_YN eq 'Y' }">
				<div class="clinic_b03">
					<div class="max1200">
						<h4>${clinicInfo.TMP_LIST[2].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[2].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[2].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
						<c:if test="${clinicInfo.TMP_LIST[2].VS_MARK_USE_YN eq 'Y' }">
							<p>VS</p>
						</c:if>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[2].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5>${clinicInfo.TMP_LIST[2].DTIL_LIST[1].TITLE_CT}</h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[2].DTIL_LIST[1].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //03 e -->

			<!-- 04 s -->
			<c:if test="${clinicInfo.TMP_LIST[3].USE_YN eq 'Y' }">
				<div class="clinic_b04 max1200">
					<div>
						<h4>${clinicInfo.TMP_LIST[3].AREA_TITLE_CT}</h4>
						<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[3].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
					</div>
					<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[3].DTIL_LIST[0].IMG_ATCH_NO}'/>">
				</div>
			</c:if>
			<!-- //04 e -->

			<!-- 05 s -->
			<c:if test="${clinicInfo.TMP_LIST[4].USE_YN eq 'Y' }">
				<div class="clinic_b05 max1200">
					<h4>${clinicInfo.TMP_LIST[4].AREA_TITLE_CT}</h4>
					<div>
						<div>
<%-- 							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TITLE_CT}" flag="2" /></h5> --%>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
						</div>
						<div>
<%-- 							<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[4].DTIL_LIST[0].TITLE_CT}" flag="2" /></h5> --%>
							<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[4].DTIL_LIST[1].TEXT_TX}" flag="2" /></p>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //05 e -->

			<!-- 06 s -->
			<c:if test="${clinicInfo.TMP_LIST[5].USE_YN eq 'Y' }">
				<div class="clinic_b06">
					<div class="section10 max1200">
						<h4>${clinicInfo.TMP_LIST[5].AREA_TITLE_CT}</h4>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[5].DTIL_LIST[0].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TITLE_CT}" flag="2" /></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[5].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
						<c:if test="${clinicInfo.TMP_LIST[5].VS_MARK_USE_YN eq 'Y' }">
							<p>VS</p>
						</c:if>
						<div>
							<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[5].DTIL_LIST[1].IMG_ATCH_NO}'/>">
							<div>
								<h5><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TITLE_CT}" flag="2" /></h5>
								<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[5].DTIL_LIST[1].TEXT_TX}" flag="2" /></p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- //06 e -->

			<!-- 07 S -->
			<c:if test="${clinicInfo.TMP_LIST[6].USE_YN eq 'Y' }">
				<div class="section01 max1200">
					<h4>${clinicInfo.TMP_LIST[6].AREA_TITLE_CT}</h4>
					<p><fbcms:editorTextareaContent value="${clinicInfo.TMP_LIST[6].DTIL_LIST[0].TEXT_TX}" flag="2" /></p>
					<img src="<c:url value='/getImage/'/><c:out value='${clinicInfo.TMP_LIST[6].DTIL_LIST[0].IMG_ATCH_NO}'/>">
				</div>
			</c:if>
			<!-- //07 e -->

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
		<div class="subject section17 max1200">
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
						<a href="javascript:fnDrDetail('${DR.DR_ID}')" class="more">자세히 보기 +
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
		
		<!-- 의료진 popup s-->
		<jsp:include page="/WEB-INF/jsp/fbcms/user/spc/cti/drdetail.jsp" />
		<!-- 의료진 popup e-->

<form name="CTIseq" action="" method="post">
	<input type="hidden" name="MNG_SEQ" id="MNG_SEQ" value=""/>
	<input type="hidden" name="MNG_CD" id="MNG_CD" value=""/>
</form>

<script src="/js/fbcms/user/ajax_cmm.js"></script>
<script>

$(function() {
	$(".SEQ" + ${mseq}).addClass("selected");
	
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
