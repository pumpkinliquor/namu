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
		<li class="selected"><a href="#none" onclick="funcOri()" title="선택된 탭">센터소개</a></li>
		<c:forEach var="clinicInfo" items="${listClinic }">
			<li><a href="#none" onclick="funcMenu(${clinicInfo.mngSeq})"><c:out value="${clinicInfo.clinicNm }" /></a></li>
		</c:forEach>
	</ul>
	
	<!-- 01 s -->
	<c:if test="${result1.useAt eq 'Y' }">
		<div class="section01 max1200">
			<h4><c:out value='${result1.nttSj }'/></h4>
			<p><fbcms:editorTextareaContent value="${result1.nttCn }" flag="2"/></p>
			<c:if test="${not empty fileList1 and not empty fileList1[0]}">
				<img src="/getImage/<c:out value='${fileList1[0].streFileNm}'/>" alt="<c:out value='${fileList1[0].orignlFileNm}'/>">
			</c:if>
		</div>
	</c:if>
	<!-- //01 e -->
	
	<!-- 02 s -->
	<c:if test="${result2.useAt eq 'Y' }">
		<div class="section02">
			<div class="max1200">
				<h4><c:out value='${result2.nttSj }'/></h4>
				<ul>
					<li>
						<c:if test="${not empty fileList2 and not empty fileList2[0]}">
							<img src="/getImage/<c:out value='${fileList2[0].streFileNm}'/>" alt="<c:out value='${fileList2[0].orignlFileNm}'/>">
						</c:if>
						<div>
							<h5><c:out value="${result2.custom1 }" /></h5>
							<%-- <p><c:out value="${result2.nttCn }" escapeXml="false"/></p> --%>
							<p><fbcms:editorTextareaContent value="${result2.nttCn }" flag="2"/></p>
						</div>
					</li>
					<li>
						<c:if test="${not empty fileList3 and not empty fileList3[0]}">
							<img src="/getImage/<c:out value='${fileList3[0].streFileNm}'/>" alt="<c:out value='${fileList3[0].orignlFileNm}'/>">
						</c:if>
						<div>
							<h5><c:out value="${result3.custom1 }" /></h5>
							<p><fbcms:editorTextareaContent value="${result3.nttCn }" flag="2"/></p>
						</div>
					</li>
					<li>
						<c:if test="${not empty fileList4 and not empty fileList4[0]}">
							<img src="/getImage/<c:out value='${fileList4[0].streFileNm}'/>" alt="<c:out value='${fileList4[0].orignlFileNm}'/>">
						</c:if>
						<div>
							<h5><c:out value="${result4.custom1 }" /></h5>
							<p><fbcms:editorTextareaContent value="${result4.nttCn }" flag="2"/></p>
						</div>
					</li>
					<li>
						<c:if test="${not empty fileList5 and not empty fileList5[0]}">
							<img src="/getImage/<c:out value='${fileList5[0].streFileNm}'/>" alt="<c:out value='${fileList5[0].orignlFileNm}'/>">
						</c:if>
						<div>
							<h5><c:out value="${result5.custom1 }" /></h5>
							<p><fbcms:editorTextareaContent value="${result5.nttCn }" flag="2"/></p>
						</div>
					</li>
					<c:if test="${result2.custom2 eq '6' }">
						<li>
							<c:if test="${not empty fileList6 and not empty fileList6[0]}">
								<img src="/getImage/<c:out value='${fileList6[0].streFileNm}'/>" alt="<c:out value='${fileList6[0].orignlFileNm}'/>">
							</c:if>
							<div>
								<h5><c:out value="${result6.custom1 }" /></h5>
								<p><fbcms:editorTextareaContent value="${result6.nttCn }" flag="2"/></p>
							</div>
						</li>
						<li>
							<c:if test="${not empty fileList7 and not empty fileList7[0]}">
								<img src="/getImage/<c:out value='${fileList7[0].streFileNm}'/>" alt="<c:out value='${fileList7[0].orignlFileNm}'/>">
							</c:if>
							<div>
								<h5><c:out value="${result7.custom1 }" /></h5>
								<p><fbcms:editorTextareaContent value="${result7.nttCn }" flag="2"/></p>
							</div>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</c:if>
	<!-- //02 e -->
	
	<!-- 03 s -->
	<c:if test="${result8.useAt eq 'Y' }">
		<div class="section03 max1200">
			<h4><c:out value='${result8.nttSj }'/></h4>
			<div>
				<c:if test="${not empty fileList8 and not empty fileList8[0]}">
					<img src="/getImage/<c:out value='${fileList8[0].streFileNm}'/>" alt="<c:out value='${fileList8[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result8.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result8.nttCn }" flag="2"/></p>
				</div>
			</div>
			<c:if test="${result8.custom3 eq 'Y' }">
				<p>VS</p>
			</c:if>
			<div>
				<c:if test="${not empty fileList9 and not empty fileList9[0]}">
					<img src="/getImage/<c:out value='${fileList9[0].streFileNm}'/>" alt="<c:out value='${fileList9[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result9.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result9.nttCn }" flag="2"/></p>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //03 e -->
	
	<!-- 04 s -->
	<c:if test="${result10.useAt eq 'Y' }">
		<div class="section04">
			<div class="max1200">
				<h4><c:out value='${result10.nttSj }'/></h4>
				<div>
					<c:if test="${not empty fileList10 and not empty fileList10[0]}">
						<img src="/getImage/<c:out value='${fileList10[0].streFileNm}'/>" alt="<c:out value='${fileList10[0].orignlFileNm}'/>">
					</c:if>
					<div>
						<h5><c:out value="${result10.custom1 }" /></h5>
						<p><fbcms:editorTextareaContent value="${result10.nttCn }" flag="2"/></p>
					</div>
				</div>
				<c:if test="${result10.custom3 eq 'Y' }">
					<p>VS</p>
				</c:if>
				<div>
					<c:if test="${not empty fileList11 and not empty fileList11[0]}">
						<img src="/getImage/<c:out value='${fileList11[0].streFileNm}'/>" alt="<c:out value='${fileList11[0].orignlFileNm}'/>">
					</c:if>
					<div>
						<h5><c:out value="${result11.custom1 }" /></h5>
						<p><fbcms:editorTextareaContent value="${result11.nttCn }" flag="2"/></p>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //04 e -->
	
	<!-- 05 s -->
	<c:if test="${result12.useAt eq 'Y' }">
		<div class="section05">
			<div class="max1200">
				<h4><c:out value='${result12.nttSj }'/></h4>
				<c:if test="${not empty fileList12 and not empty fileList12[0]}">
					<img src="/getImage/<c:out value='${fileList12[0].streFileNm}'/>" alt="<c:out value='${fileList12[0].orignlFileNm}'/>">
				</c:if>
				<p><fbcms:editorTextareaContent value="${result12.nttCn }" flag="2"/></p>
			</div>
		</div>
	</c:if>
	<!-- //05 e -->
	
	<!-- 06 s -->
	<c:if test="${result13.useAt eq 'Y' }">
		<div class="section06 max1200">
			<h4><c:out value='${result13.nttSj }'/></h4>
			<div>
				<c:if test="${not empty fileList13 and not empty fileList13[0]}">
					<img src="/getImage/<c:out value='${fileList13[0].streFileNm}'/>" alt="<c:out value='${fileList13[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result13.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result13.nttCn }" flag="2"/></p>
				</div>
			</div>
			<c:if test="${result13.custom3 eq 'Y' }">
				<p>VS</p>
			</c:if>
			<div>
				<c:if test="${not empty fileList14 and not empty fileList14[0]}">
					<img src="/getImage/<c:out value='${fileList14[0].streFileNm}'/>" alt="<c:out value='${fileList14[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result14.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result14.nttCn }" flag="2"/></p>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //06 e -->
	
	<!-- 07 s -->
	<c:if test="${result15.useAt eq 'Y' }">
		<div class="section07">
			<div class="max1200">
				<h4><c:out value='${result15.nttSj }'/></h4>
				<ul>
					<li>
						<c:if test="${not empty fileList15 and not empty fileList15[0]}">
							<img src="/getImage/<c:out value='${fileList15[0].streFileNm}'/>" alt="<c:out value='${fileList15[0].orignlFileNm}'/>">
						</c:if>
						<strong><c:out value="${result15.custom4 }" /></strong>
						<span><c:out value="${result15.custom1 }" /></span>
					</li>
					<li>
						<c:if test="${not empty fileList16 and not empty fileList16[0]}">
							<img src="/getImage/<c:out value='${fileList16[0].streFileNm}'/>" alt="<c:out value='${fileList16[0].orignlFileNm}'/>">
						</c:if>
						<strong><c:out value="${result16.custom4 }" /></strong>
						<span><c:out value="${result16.custom1 }" /></span>
					</li>
					<li>
						<c:if test="${not empty fileList17 and not empty fileList17[0]}">
							<img src="/getImage/<c:out value='${fileList17[0].streFileNm}'/>" alt="<c:out value='${fileList17[0].orignlFileNm}'/>">
						</c:if>
						<strong><c:out value="${result17.custom4 }" /></strong>
						<span><c:out value="${result17.custom1 }" /></span>
					</li>
				</ul>
			</div>
		</div>
	</c:if>
	<!-- //07 e -->
	
	<!-- 08 s -->
	<c:if test="${result18.useAt eq 'Y' }">
		<div class="section08 max1200">
			<h4><c:out value='${result18.nttSj }'/></h4>
			<c:if test="${not empty fileList18 and not empty fileList18[0]}">
				<video src="/getImage/<c:out value='${fileList18[0].streFileNm}'/>" width="1200" controls autoplay muted></video>
			</c:if>
			<p><fbcms:editorTextareaContent value="${result18.nttCn }" flag="2"/></p>
		</div>
	</c:if>
	<!-- //08 e -->
	
	<!-- 09 s -->
	<c:if test="${result19.useAt eq 'Y' }">
		<div class="section09">
			<div class="max1200">
				<h4><c:out value='${result19.nttSj }'/></h4>
				<div>
					<c:if test="${not empty fileList19 and not empty fileList19[0]}">
						<img src="/getImage/<c:out value='${fileList19[0].streFileNm}'/>" alt="<c:out value='${fileList19[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result19.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result19.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList20 and not empty fileList20[0]}">
						<img src="/getImage/<c:out value='${fileList20[0].streFileNm}'/>" alt="<c:out value='${fileList20[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result20.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result20.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList21 and not empty fileList21[0]}">
						<img src="/getImage/<c:out value='${fileList21[0].streFileNm}'/>" alt="<c:out value='${fileList21[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result21.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result21.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList22 and not empty fileList22[0]}">
						<img src="/getImage/<c:out value='${fileList22[0].streFileNm}'/>" alt="<c:out value='${fileList22[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result22.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result22.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList23 and not empty fileList23[0]}">
						<img src="/getImage/<c:out value='${fileList23[0].streFileNm}'/>" alt="<c:out value='${fileList23[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result23.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result23.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList24 and not empty fileList24[0]}">
						<img src="/getImage/<c:out value='${fileList24[0].streFileNm}'/>" alt="<c:out value='${fileList24[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result24.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result24.nttCn }" flag="2"/></p>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //09 e -->
	
	<!-- 10 s -->
	<c:if test="${result25.useAt eq 'Y' }">
		<div class="section10 max1200">
			<h4><c:out value='${result25.nttSj }'/></h4>
			<div>
				<c:if test="${not empty fileList25 and not empty fileList25[0]}">
					<img src="/getImage/<c:out value='${fileList25[0].streFileNm}'/>" alt="<c:out value='${fileList25[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result25.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result25.nttCn }" flag="2"/></p>
				</div>
			</div>
			<c:if test="${result25.custom3 eq 'Y' }">
				<p>VS</p>
			</c:if>
			<div>
				<c:if test="${not empty fileList26 and not empty fileList26[0]}">
					<img src="/getImage/<c:out value='${fileList26[0].streFileNm}'/>" alt="<c:out value='${fileList26[0].orignlFileNm}'/>">
				</c:if>
				<div>
					<h5><c:out value="${result26.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result26.nttCn }" flag="2"/></p>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //10 e -->
	
	<!-- 11 s -->
	<c:if test="${result27.useAt eq 'Y' }">
		<div class="section11">
			<div class="max1200">
				<h4><c:out value='${result27.nttSj }'/></h4>
				<div>
					<c:if test="${not empty fileList27 and not empty fileList27[0]}">
						<img src="/getImage/<c:out value='${fileList27[0].streFileNm}'/>" alt="<c:out value='${fileList27[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result27.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result27.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList28 and not empty fileList28[0]}">
						<img src="/getImage/<c:out value='${fileList28[0].streFileNm}'/>" alt="<c:out value='${fileList28[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result28.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result28.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList29 and not empty fileList29[0]}">
						<img src="/getImage/<c:out value='${fileList29[0].streFileNm}'/>" alt="<c:out value='${fileList29[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result29.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result29.nttCn }" flag="2"/></p>
				</div>
				<div>
					<c:if test="${not empty fileList30 and not empty fileList30[0]}">
						<img src="/getImage/<c:out value='${fileList30[0].streFileNm}'/>" alt="<c:out value='${fileList30[0].orignlFileNm}'/>">
					</c:if>
					<h5><c:out value="${result30.custom1 }" /></h5>
					<p><fbcms:editorTextareaContent value="${result30.nttCn }" flag="2"/></p>
				</div>
			</div>
		</div>
	</c:if>
	<!-- //11 e -->
	
	<!-- 12 s -->
	<c:if test="${result31.useAt eq 'Y' }">
		<div class="section12 max1200">
			<div>
				<h4><c:out value='${result31.nttSj }'/></h4>
				<p><fbcms:editorTextareaContent value="${result31.nttCn }" flag="2"/></p>
			</div>
			<c:if test="${not empty fileList31 and not empty fileList31[0]}">
				<img src="/getImage/<c:out value='${fileList31[0].streFileNm}'/>" alt="<c:out value='${fileList31[0].orignlFileNm}'/>">
			</c:if>
		</div>
	</c:if>
	<!-- //12 e -->
	
	<!-- 13 s -->
	<c:if test="${result32.useAt eq 'Y' }">
		<div class="section13">
			<div class="max1200">
				<h4><c:out value='${result32.nttSj }'/></h4>
				<c:if test="${not empty fileList32 and not empty fileList32[0]}">
					<video id="" src="/getImage/<c:out value='${fileList32[0].streFileNm}'/>" width="1200" controls autoplay muted></video>
				</c:if>
				<h5><c:out value="${result32.custom1 }" /></h5>
				<p><fbcms:editorTextareaContent value="${result32.nttCn }" flag="2"/></p>
			</div>
		</div>
	</c:if>
	<!-- //13 e -->
	
	<!-- 14 s -->
	<c:if test="${result33.useAt eq 'Y' }">
		<div class="section14 max1200">
			<h4><c:out value='${result33.nttSj }'/></h4>
			<p><fbcms:editorTextareaContent value="${result33.nttCn }" flag="2"/></p>
			<c:if test="${not empty fileList33 and not empty fileList33[0]}">
				<img src="/getImage/<c:out value='${fileList33[0].streFileNm}'/>" alt="<c:out value='${fileList33[0].orignlFileNm}'/>">
			</c:if>
		</div>
	</c:if>
	<!-- //14 e -->
	
	<!-- 진료과 s -->
	<c:if test="${articleVO.custom2 eq 'Y' }">
		<div class="section15 max1200">
			<h4>진료과</h4>
			<ul>
				<c:forEach var="subjectInfo" items="${subjectList }" varStatus="status">
					<li class="s0${subjectInfo.orderNo }">
						<h6><c:out value="${subjectInfo.mngNm }"/></h6>
						<p><a href="/user/hpm/smt/SMTPage.do?code=${subjectInfo.mngCd }">더보기 +</a></p>
					</li>
					<c:set var="majorDissCds">${subjectInfo.majorDissCds}</c:set>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<!-- //진료과 e -->

	<!-- 주요질환 s -->
	<c:if test="${articleVO.custom3 eq 'Y' }">
		<div class="section16 max1200">
			<h4>주요질환</h4>
			<div class="tag_list">
				<c:forEach var="dissInfo" items="${dissList}">
					<a href="/user/hti/dsi/selectDSIDetail.do?nttId=${dissInfo.nttId}">${dissInfo.nttSj}</a>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<!-- //주요질환 e -->

	<!-- 의료진 s -->
	<!-- <div class="section17 max1200">
		<h4>의료진</h4>
		<div class="staff_list">
			<div>
				<img src="../resources/images/img_staff01.png" alt="">
				<p>
					<strong>홍성수<span>병원장</span></strong>
					<span>내과 전문의</span>
				</p>
				<div>
					<a href="javascript:void(0);" class="more">자세히 보기 +</a>
					<a href="javascript:void(0);" class="reserved">예약하기</a>
					<a href="javascript:void(0);" class="save"></a>
				</div>
			</div>
			<div>
				<img src="../resources/images/img_staff01.png" alt="">
				<p>
					<strong>홍성수<span>병원장</span></strong>
					<span>내과 전문의</span>
				</p>
				<div>
					<a href="javascript:void(0);" class="more">자세히 보기 +</a>
					<a href="javascript:void(0);" class="reserved">예약하기</a>
					<a href="javascript:void(0);" class="save check">저장</a>
				</div>
			</div>
		</div>
	</div> -->
	<!-- //의료진 e -->
	
	<form name="CTIseq" action="" method="post">
		<input type="hidden" name="MNG_SEQ" id="MNG_SEQ" value=""/>
		<input type="hidden" name="MNG_CD" id="MNG_CD" value=""/>
	</form>
	
<script>
	$(document).ready(function() {
		//1210 숫자 카운트
		$('.section07 > div > ul li').each(function(index){
			  var resultn = $(this).index();
			  var memberCountConTxt = $('.section07 > div > ul li').eq(resultn).find('strong').text();
			  memberCountConTxt = memberCountConTxt.replace(/[^0-9]/g,'');
		  		
			  $({ val : 0 }).animate({ val : memberCountConTxt }, {
			   duration: 2000,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.section07 > div > ul li').eq(resultn).find('strong').text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $('.section07 > div > ul li').eq(resultn).find('strong').text(num);
			  }
			});
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function funcMenu(ID) {
		
		var custom1 = "${cus1}";
		
		if(custom1 == "") {
			custom1 = "${cus1}";
		}
		
		document.CTIseq.action = "/user/spc/cti/selectClinicInfo.do";
		document.CTIseq.MNG_SEQ.value = ID;
		document.CTIseq.MNG_CD.value = custom1;
		document.CTIseq.submit(); 
	}
	
	
	function funcOri() {
		
		var url = "${cus1}";
		
		location.href = "/user/spc/cti/selectCTIInfo.do?custom1=" + url;
	}
</script>
	