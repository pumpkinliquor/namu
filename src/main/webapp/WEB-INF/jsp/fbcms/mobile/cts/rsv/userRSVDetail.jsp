<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->
<script src="/js/fbcms/user/ajax_cmm.js"></script>


	<!-- contents s -->
	<div class="contents">
	
		<section class="tab_box">		
		
			<div <c:if test="${appointmentVO.APPO_GUBN_CD eq '01' or empty appointmentVO.APPO_GUBN_CD}">style="display: block"</c:if><c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">style="display: none"</c:if>>
				<h4 class="con_in_tit01 mar20 mt40">예약수정</h4>
				<p class="n_txt mar20"><em class="ootc">*</em>필수입력 항목</p>
				
				<!-- 예약자 본인일 경우 s -->
				<div class="tdetail tdetail03">
					<table>
						<caption>리스트 상세 등록 페이지</caption>
						<tbody>
							<tr>
								<th scope="row"><em class="ootc">*</em>이름</th>
								<td><input type="text" class="disabled in_full" title="이름" value="${reservationDetail.APPO_PRSN_NM}" disabled=""></td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>생년월일</th>
								<td>
									<input type="text" class="in_full disabled" title="제목" disabled="" value="${fn:substring(reservationDetail.BIRTH_DT, 0,4)}.${fn:substring(reservationDetail.BIRTH_DT, 4,6)}.${fn:substring(reservationDetail.BIRTH_DT, 6,8)}">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>휴대폰</th>
								<td class="phone">
									<select title="휴대폰 앞자리" id="MOBILE_PHONE_NO_0">
										<option value="010" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '010'}">selected="selected"</c:if>>010</option>
										<option value="011" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '011'}">selected="selected"</c:if>>011</option>
										<option value="012" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '012'}">selected="selected"</c:if>>012</option>
										<option value="0130" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '0130'}">selected="selected"</c:if>>0130</option>
										<option value="016" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '016'}">selected="selected"</c:if>>016</option>
										<option value="017" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '017'}">selected="selected"</c:if>>017</option>
										<option value="018" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '018'}">selected="selected"</c:if>>018</option>
										<option value="019" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '019'}">selected="selected"</c:if>>019</option>
									</select>
									<span>-</span>
									<input type="text" title="휴대폰 가운데 자리" value="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[1]}" id="MOBILE_PHONE_NO_1">
									<span>-</span>
									<input type="text" title="휴대폰 뒷 자리" value="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[2]}" id="MOBILE_PHONE_NO_2">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc_none"></em>전화번호</th>
								<td class="phone">
									<select title="전화번호 앞자리" id="PHONE_NO_0">
										<option value="02" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '02'}">selected="selected"</c:if>>02</option>
										<option value="031" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '031'}">selected="selected"</c:if>>031</option>
										<option value="032" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '032'}">selected="selected"</c:if>>032</option>
										<option value="033" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '033'}">selected="selected"</c:if>>033</option>
										<option value="041" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '041'}">selected="selected"</c:if>>041</option>
										<option value="042" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '042'}">selected="selected"</c:if>>042</option>
										<option value="043" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '043'}">selected="selected"</c:if>>043</option>
										<option value="044" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '044'}">selected="selected"</c:if>>044</option>
										<option value="051" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '051'}">selected="selected"</c:if>>051</option>
										<option value="052" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '052'}">selected="selected"</c:if>>052</option>
										<option value="053" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '053'}">selected="selected"</c:if>>053</option>
										<option value="054" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '054'}">selected="selected"</c:if>>054</option>
										<option value="055" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '055'}">selected="selected"</c:if>>055</option>
										<option value="061" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '061'}">selected="selected"</c:if>>061</option>
										<option value="062" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '062'}">selected="selected"</c:if>>062</option>
										<option value="063" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '063'}">selected="selected"</c:if>>063</option>
										<option value="064" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '064'}">selected="selected"</c:if>>064</option>
										<option value="070" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '070'}">selected="selected"</c:if>>070</option>
									</select>
									<span>-</span>
									<input type="text" title="전화번호 가운데 자리" value="${fn:split(reservationDetail.PHONE_NO,'-')[1]}" id="PHONE_NO_1">
									<span>-</span>
									<input type="text" title="전화번호 뒷 자리" value="${fn:split(reservationDetail.PHONE_NO,'-')[2]}" id="PHONE_NO_2">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //예약자 본인일 경우 e -->
				
				
				<div class="f_step mt40"><!-- 의료진 선택 -->
						<p class="sel">의료진 선택<span></span></p>
						<div class="f_step02 doct01">
							<ul class="s02">
							<c:forEach items="${mediDrList}" var="list" varStatus="status">
								<li style="display: list-item;">
									<img src="<c:url value='/getImage/${list.MOBILE_IMG_ATCH_NO}'/>" >
									<strong>${list.DR_NM}</strong>
									<span>${list.FIELD_CT}</span>
									<a href="javascript:getDrCalendarList2('${list.MEDI_SBJ_CD}', '${list.DR_ID}', '${list.DR_NM}', '${list.FIELD_CT}')"></a>
								</li>
							</c:forEach>
							</ul>
							<a href="#n" class="btn_more">자세히 보기</a>
						</div>	
					</div>
				
				<div class="f_step"><!-- 날짜 선택 -->
						<p class="sel">날짜 선택<span></span></p>
						<div class="date_sel f_step03">
							<div class="date_year">
								<a href="javascript:prevm2();" id="prev">이전 년도로 이동</a>
								<span id="yearmonth2"></span>
								<a href="javascript:nextm2();" id="next">다음 년도로 이동</a>
							</div>
							<p><a href="#n" class="am">오전</a><a href="#n" class="pm">오후</a></p>
			
			
						<div class="date_table">
							<table id="calendar2">
								<caption>달력</caption>
								<thead>
									<tr>
										<th scope="col">월</th>
										<th scope="col">화</th>
										<th scope="col">수</th>
										<th scope="col">목</th>
										<th scope="col">금</th>
										<th scope="col">토</th>
									</tr>
								</thead>
								<tbody id="calendarBody2">
								</tbody>
							</table>
						</div>
						<p class="date_desc">* 진료 외의 시간에는 수술/검사 등을 진행합니다</p>
					</div>	
				</div>
				
				<div class="f_step"><!-- 예약시간 선택 -->
					<p class="sel">예약시간 선택<span></span></p>
						<ul class="f_step01" name="rTime" id="rTime" title="예약시간 선택">
							<li onclick="javascript:fnTimeSet('0000');"><a href="#none">00:00</a></li>
							<%--
							<li onclick="javascript:fnTimeSet('0900');"><a href="#none">09:00</a></li>
							<li onclick="javascript:fnTimeSet('1000');"><a href="#none">10:00</a></li>
							<li onclick="javascript:fnTimeSet('1100');"><a href="#none">11:00</a></li>
							<li onclick="javascript:fnTimeSet('1200');"><a href="#none">12:00</a></li>
							<li onclick="javascript:fnTimeSet('1300');"><a href="#none">13:00</a></li>
							<li onclick="javascript:fnTimeSet('1400');"><a href="#none">14:00</a></li>
							<li onclick="javascript:fnTimeSet('1500');"><a href="#none">15:00</a></li>
							<li onclick="javascript:fnTimeSet('1600');"><a href="#none">16:00</a></li>
							<li onclick="javascript:fnTimeSet('1700');"><a href="#none">17:00</a></li>
							<li onclick="javascript:fnTimeSet('1800');"><a href="#none">18:00</a></li>
							 --%>
					</ul>
				</div>
				
				<div class="f_step"><!-- 예약정보 확인 -->
					<p class="sel">예약정보 확인<span></span></p>
					<dl class="f_step05">
						<dt>이름</dt>
						<dd id="DD_APPO_PRSN_NM">${reservationDetail.APPO_PRSN_NM }</dd>
						<dt>진료과</dt>
						<dd id="DD_MEDI_SBJ_NM">${reservationDetail.MEDI_SBJ_NM}</dd>
						<dt>의료진</dt>
						<dd id="DD_DR_NM">${reservationDetail.DR_NM}</dd>
						<dt>예약일시</dt>
						<dd id="DD_APPO_DTM">
							${fn:substring(reservationDetail.APPO_DT, 0, 4)}.${fn:substring(reservationDetail.APPO_DT, 4, 6)}.${fn:substring(reservationDetail.APPO_DT, 6, 8)}<br>${fn:substring(reservationDetail.APPO_TIME, 0, 2)}:${fn:substring(reservationDetail.APPO_TIME, 2, 4)}
						</dd>
					</dl>
				</div>
				
				<div class="btn_Lbox">
					<a href="javascript:fnCancel()" class="btn btn02 bgreen">취소</a>
					<a href="javascript:fnReservationUpdate()" class="btn btn02 breservation">수정</a>
				</div>
			</div>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<div <c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">style="display: block"</c:if><c:if test="${appointmentVO.APPO_GUBN_CD eq '01'}">style="display: none"</c:if>>
	
				<h4 class="con_in_tit01 mar20 mt40">예약수정</h4>
				<p class="n_txt mar20"><em class="ootc">*</em>필수입력 항목</p>
		
	
				<div class="tdetail tdetail03">
					<table>
						<caption>리스트 상세 등록 페이지</caption>
						<tbody>
							<tr>
								<th scope="row"><em class="ootc">*</em>이름</th>
								<td><input type="text" class="disabled in_full" title="이름" value="${reservationDetail.APPO_PRSN_NM}" disabled=""></td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>생년월일</th>
								<td>
									<input type="text" class="in_full disabled" title="제목" disabled="" value="${fn:substring(reservationDetail.BIRTH_DT, 0,4)}.${fn:substring(reservationDetail.BIRTH_DT, 4,6)}.${fn:substring(reservationDetail.BIRTH_DT, 6,8)}">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc">*</em>휴대폰</th>
								<td class="phone">
									<select title="휴대폰 앞자리" id="MOBILE_PHONE_NO_0">
										<option value="010" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '010'}">selected="selected"</c:if>>010</option>
										<option value="011" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '011'}">selected="selected"</c:if>>011</option>
										<option value="012" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '012'}">selected="selected"</c:if>>012</option>
										<option value="0130" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '0130'}">selected="selected"</c:if>>0130</option>
										<option value="016" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '016'}">selected="selected"</c:if>>016</option>
										<option value="017" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '017'}">selected="selected"</c:if>>017</option>
										<option value="018" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '018'}">selected="selected"</c:if>>018</option>
										<option value="019" <c:if test="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[0] eq '019'}">selected="selected"</c:if>>019</option>
									</select>
									<span>-</span>
									<input type="text" title="휴대폰 가운데 자리" value="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[1]}" id="MOBILE_PHONE_NO_1" maxlength="4">
									<span>-</span>
									<input type="text" title="휴대폰 뒷 자리" value="${fn:split(reservationDetail.MOBILE_PHONE_NO,'-')[2]}" id="MOBILE_PHONE_NO_2" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc_none"></em>전화번호</th>
								<td class="phone">
									<select title="전화번호 앞자리" id="PHONE_NO_0">
										<option value="02" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '02'}">selected="selected"</c:if>>02</option>
										<option value="031" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '031'}">selected="selected"</c:if>>031</option>
										<option value="032" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '032'}">selected="selected"</c:if>>032</option>
										<option value="033" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '033'}">selected="selected"</c:if>>033</option>
										<option value="041" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '041'}">selected="selected"</c:if>>041</option>
										<option value="042" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '042'}">selected="selected"</c:if>>042</option>
										<option value="043" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '043'}">selected="selected"</c:if>>043</option>
										<option value="044" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '044'}">selected="selected"</c:if>>044</option>
										<option value="051" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '051'}">selected="selected"</c:if>>051</option>
										<option value="052" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '052'}">selected="selected"</c:if>>052</option>
										<option value="053" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '053'}">selected="selected"</c:if>>053</option>
										<option value="054" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '054'}">selected="selected"</c:if>>054</option>
										<option value="055" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '055'}">selected="selected"</c:if>>055</option>
										<option value="061" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '061'}">selected="selected"</c:if>>061</option>
										<option value="062" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '062'}">selected="selected"</c:if>>062</option>
										<option value="063" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '063'}">selected="selected"</c:if>>063</option>
										<option value="064" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '064'}">selected="selected"</c:if>>064</option>
										<option value="070" <c:if test="${fn:split(reservationDetail.PHONE_NO,'-')[0] eq '070'}">selected="selected"</c:if>>070</option>
									</select>
									<span>-</span>
									<input type="text" title="전화번호 가운데 자리" value="${fn:split(reservationDetail.PHONE_NO,'-')[1]}" id="PHONE_NO_1" maxlength="4">
									<span>-</span>
									<input type="text" title="전화번호 뒷 자리" value="${fn:split(reservationDetail.PHONE_NO,'-')[2]}" id="PHONE_NO_2" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ootc_none"></em>이메일</th>
								<td class="phone">
									<input type="text" title="이메일 입력" id="EMAIL_ID_0" value="${fn:split(reservationDetail.EMAIL_ID,'@')[0]}">
									<span>@</span>
									<input type="text" style="width:calc((100% - -8px) / 3)" title="이메일 입력" id="EMAIL_ID_1" value="${fn:split(reservationDetail.EMAIL_ID,'@')[1]}">
										<select title="메일선택" class="ml5 fsize" id="emailSelect">
										<option value="">직접입력</option>
										<option value="gmail.com">구글</option>
										<option value="naver.com">네이버</option>
										<option value="daum.net">다음</option>
										<option value="kakao.com">카카오</option>
										<option value="nate.com">네이트</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td>
									<div>
										<input type="text" class="in_full disabled" title="주소입력" disabled="" style="width:calc(100% - 108px)" value="<c:url value="${reservationDetail.ADDR_TX}"/>" id="F_ADDR_TX">
										<a href="javascript:execDaumPostcode();" id="searchAddress" class="btn bs ml5">주소등록</a>
									</div>
									<div>
										<input type="text" class="in_full mt10" title="상세 주소입력" value="<c:url value="${reservationDetail.ADDR_DTIL_TX}"/>" id="F_ADDR_DTIL_TX">
									</div>
		
								</td>
							</tr>
							<tr>
								<th scope="row">문의 및 전달사항</th>
								<td>
									<textarea title="내용" class="textarea_100" id="F_INQR_SEND_TX"><c:url value="${reservationDetail.INQR_SEND_TX}"/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			
				<div class="f_step mt40"><!-- 검진 프로그램 선택 -->
					<p class="sel">검진 프로그램 선택<span></span></p>
						<ul class="f_step01 overflowY">
							<c:forEach items="${exmnList}" var="item" varStatus="status">
							<li onclick="javascript:nextCal('${item.DTIL_CD}', '${item.DTIL_CODE_NM}');"<c:if test="${item.DTIL_CD eq reservationDetail.EXMN_PROG_CD}"> class="active"</c:if>">
								<a href="#none">${item.DTIL_CODE_NM}</a>
							</li>
							</c:forEach>
						</ul>	
				</div>
			
				<div class="f_step"><!-- 날짜 선택 -->
					<p class="sel">날짜 선택<span id="selDate"></span></p>
					<div class="date_sel f_step03">
						<div class="date_year mb10">
							<a href="javascript:prevm();" id="prev">이전 년도로 이동</a>
							<span id="yearmonth"></span>
							<a href="javascript:nextm();" id="next">다음 년도로 이동</a>
						</div>

					<div class="date_table">
						<table id="calendar">
							<caption>달력</caption>
							<thead>
								<tr>
									<th scope="col">월</th>
									<th scope="col">화</th>
									<th scope="col">수</th>
									<th scope="col">목</th>
									<th scope="col">금</th>
									<th scope="col">토</th>
								</tr>
							</thead>
							<tbody id="calendarBody">
							</tbody>
						</table>
					</div>
					<p class="date_desc">* 진료 외의 시간에는 수술/검사 등을 진행합니다</p>
				</div>
			</div>		
			
				<div class="f_step"><!-- 예약시간 선택 -->
					<p class="sel">예약시간 선택<span></span></p>
					<ul class="f_step01" title="예약시간 선택">
					<li onclick="javascript:fnTimeSet('0000');"><a href="#none">00:00</a></li>
					<!-- 	<li onclick="javascript:fnTimeSet('0900');"><a href="#none">09:00</a></li>
						<li onclick="javascript:fnTimeSet('1000');"><a href="#none">10:00</a></li>
						<li onclick="javascript:fnTimeSet('1100');"><a href="#none">11:00</a></li>
						<li onclick="javascript:fnTimeSet('1200');"><a href="#none">12:00</a></li>
						<li onclick="javascript:fnTimeSet('1300');"><a href="#none">13:00</a></li>
						<li onclick="javascript:fnTimeSet('1400');"><a href="#none">14:00</a></li>
						<li onclick="javascript:fnTimeSet('1500');"><a href="#none">15:00</a></li>
						<li onclick="javascript:fnTimeSet('1600');"><a href="#none">16:00</a></li>
						<li onclick="javascript:fnTimeSet('1700');"><a href="#none">17:00</a></li>
						<li onclick="javascript:fnTimeSet('1800');"><a href="#none">18:00</a></li>
					 --></ul>
				</div>
				<section class="info">
				<div class="f_step"><!-- 예약정보 확인 -->
					<p class="sel">예약정보 확인<span></span></p>
						<dl class="f_step05">
							<dt>이름</dt>
							<dd id="DD_NMRS_PRSN">${reservationDetail.APPO_PRSN_NM}</dd>
							<dt>검진프로그램</dt>
							<dd id="DD_EXMN_PROG_NM">${reservationDetail.EXMN_PROG_NM}</dd>
							<dt>예약일시</dt>
							<dd id="DD_EXMN_DTM">
							${fn:substring(reservationDetail.APPO_DT, 0, 4)}.${fn:substring(reservationDetail.APPO_DT, 4, 6)}.${fn:substring(reservationDetail.APPO_DT, 6, 8)} &nbsp; ${fn:substring(reservationDetail.APPO_TIME, 0, 2)}:${fn:substring(reservationDetail.APPO_TIME, 2, 4)}
							</dd>
							
					</dl>
				</div>
				</section>			
				<div class="btn_Lbox">
					<a href="javascript:fnCancel()" class="btn btn02 bgreen">취소</a>
					<a href="javascript:fnReservationUpdate()" class="btn btn02 breservation">수정</a>
				</div>
			</div>		
		
		</section>	
	</div>

<!-- 수정 -->
<form method="post" action="" name="UpdateForm" id="UpdateForm">
	<input type="hidden" name="rTime" id="rTime" value="">
	<input type="hidden" name="searchCondition" value="1">
	<input type="hidden" name="searchKeyword" value="<c:out value='${appointmentVO.searchKeyword}'/>">
	<input type="hidden" name="pageIndex" value="<c:out value='${appointmentVO.pageIndex}'/>">
	<input type="hidden" name="USER_ID" id="USER_ID" value="<c:out value='${reservationDetail.USER_ID}'/>"/>
	<input type="hidden" name="USER_NM" id="USER_NM" value="<c:out value='${reservationDetail.APPO_PRSN_NM }'/>"/>
	<input type="hidden" name="APPO_GUBN_CD" id="APPO_GUBN_CD" value="<c:out value='${reservationDetail.APPO_GUBN_CD}'/>"/>
	<input type="hidden" name="APPO_PRSN_NM" id="APPO_PRSN_NM" value="<c:out value='${reservationDetail.APPO_PRSN_NM }'/>"/>
	<input type="hidden" name="APPO_NO" id="APPO_NO" value="<c:out value='${reservationDetail.APPO_NO}'/>"/>
	<input type="hidden" name="MEDI_SBJ_CD" id="MEDI_SBJ_CD" value="<c:out value='${reservationDetail.MEDI_SBJ_CD}'/>"/>
	<input type="hidden" name="MEDI_SBJ_NM" id="MEDI_SBJ_NM" value="<c:out value='${reservationDetail.MEDI_SBJ_NM}'/>"/>
	<input type="hidden" name="DR_ID" id="DR_ID" value="<c:out value='${reservationDetail.DR_ID}'/>"/>
	<input type="hidden" name="DR_NM" id="DR_NM" value="<c:out value='${reservationDetail.DR_NM}'/>"/>
	<input type="hidden" name="APPO_DT" id="APPO_DT" value="<c:out value='${reservationDetail.APPO_DT}'/>"/>
	<input type="hidden" name="APPO_TIME" id="APPO_TIME" value="<c:out value='${reservationDetail.APPO_TIME}'/>"/>
	<input type="hidden" name="BIRTH_DT" id="BIRTH_DT" value="<c:out value='${reservationDetail.BIRTH_DT}'/>"/>
	<input type="hidden" name="MOBILE_PHONE_NO" id="MOBILE_PHONE_NO" value="<c:out value='${reservationDetail.MOBILE_PHONE_NO}'/>"/>
	<input type="hidden" name="PHONE_NO" id="PHONE_NO" value="<c:out value='${reservationDetail.PHONE_NO}'/>"/>
	<input type="hidden" name="EXMN_PROG_CD" id="EXMN_PROG_CD" value="<c:out value='${reservationDetail.EXMN_PROG_CD}'/>"/>
	<input type="hidden" name="EXMN_PROG_MN" id="EXMN_PROG_NM" value="<c:out value='${reservationDetail.EXMN_PROG_NM}'/>"/>
	<input type="hidden" name="EMAIL_ID" id="EMAIL_ID" value="<c:out value='${reservationDetail.EMAIL_ID}'/>"/>
	<input type="hidden" name="POST_NO" id="POST_NO" value="<c:out value='${reservationDetail.POST_NO}'/>"/>
	<input type="hidden" name="ADDR_TX" id="ADDR_TX" value="<c:out value='${reservationDetail.ADDR_TX}'/>"/>
	<input type="hidden" name="ADDR_DTIL_TX" id="ADDR_DTIL_TX" value="<c:out value='${reservationDetail.ADDR_DTIL_TX}'/>"/>
	<input type="hidden" name="INQR_SEND_TX" id="INQR_SEND_TX" value="<c:out value='${reservationDetail.INQR_SEND_TX}'/>"/>
	<input type="hidden" name="GENDER_CD" id="GENDER_CD" value="<c:out value='${reservationDetail.GENDER_CD}'/>"/>
</form>


<c:if test="${appointmentVO.APPO_GUBN_CD eq '01' or empty appointmentVO.APPO_GUBN_CD}">
<script type="text/javascript">

	$('.f_step .sel').click(function(e){
		if($(this).next('[class*="f_step"]').is(':hidden')){
			$(this).next('[class*="f_step"]').slideDown();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat right',
				backgroundSize:'35px'
			});
		}else{
			$(this).next('[class*="f_step"]').slideUp();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat  right',
				backgroundSize:'35px'
			});
		}
	});
	
	//진료과
	$('.f_step01 li').click(function(){
		var txt = $(this).children('a').text();
		$(this).parents('ul').prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
		//$(this).parents('ul').slideUp();
	});
	
	//의료진
	$('.f_step02 ul li').click(function(){
		var txt = $(this).children('strong').text();
		$(this).parents('ul').parents().prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
	});
	var step01More = $('.doct01 .btn_more');
	$('.doct01 li').slice(0, 10).show();
	if($('.doct01 li').length < 11){
		step01More.hide();
	}
	step01More.click(function(e){
		e.preventDefault();
		$('.doct01 li:hidden').slice(0, 10).show();
		if($('.doct01 li:hidden').length == 0){
			step02More.hide();
		}
	});
	var step02More = $('.doct02 .btn_more');
	$('.doct02 li').slice(0, 10).show();
	if($('.doct02 li').length < 11){
		step01More.hide();
	}
	step02More.click(function(e){
		e.preventDefault();
		$('.doct02 li:hidden').slice(0, 10).show();
		if($('.doct02 li:hidden').length == 0){
			step02More.hide();
		}
	});
	
	//날짜선택
	$('.date_table td a:not(.closed)').off();
	$('.date_table td a:not(.closed)').click(function(){
		var year = $(this).closest('.date_table').prev().prev('.date_year').children('span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
		$('.date_table td a').removeClass('selected');
		$(this).addClass('selected');
		if(str < 10){
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
			$('#APPO_DT').val(year + '' + str)
		}else{
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.' + str);
			$('#APPO_DT').val(year + '.' + str)
		}
	
	});


	// 스크롤
	$(function() {
		
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".f_step01").mCustomScrollbar({theme:"minimal-dark"});
		$(".f_step02").mCustomScrollbar({theme:"minimal-dark"});
		
		rstEvt();
	});

	function rstEvt() {
		$('.f_step01 li').click(function(){
			var txt = $(this).children('a').text();
			$(this).parents('ul').prev('.sel').children('span').text(txt);
			$(this).addClass('selected').siblings('li').removeClass('selected');
		});
		
		//의료진
		$('.f_step02 ul li').click(function(){
			var txt = $(this).children('strong').text();
			$(this).parents('ul').parents().prev('.sel').children('span').text(txt);
			$(this).addClass('selected').siblings('li').removeClass('selected');
			
			$('#MEDI_SBJ_CD').val('');
			$('#DR_ID').val('');
			$('#APPO_DT').val('');
			$('#APPO_TIME').val('');
			$('#DD_DR_NM').text('');
			$('#DD_APPO_DTM').text('');
			$('#DD_MEDI_SBJ_NM').text($(this).text());
			$('#MEDI_SBJ_NM').val($(this).text());
			clearOption('rTime');
			build2();
		});
		
		var step01More = $('.doct01 .btn_more');
		$('.doct01 li').slice(0, 10).show();
		if($('.doct01 li').length < 11){
			step01More.hide();
		}
		step01More.click(function(e){
			e.preventDefault();
			$('.doct01 li:hidden').slice(0, 10).show();
			if($('.doct01 li:hidden').length == 0){
				step02More.hide();
			}
		});
		var step02More = $('.doct02 .btn_more');
		$('.doct02 li').slice(0, 10).show();
		if($('.doct02 li').length < 11){
			step01More.hide();
		}
		step02More.click(function(e){
			e.preventDefault();
			$('.doct02 li:hidden').slice(0, 10).show();
			if($('.doct02 li:hidden').length == 0){
				step02More.hide();
			}
		});
		
		//날짜 선택
		$('.date_table td a:not(.closed)').off();
		$('.date_table td a:not(.closed)').click(function(){
			var year = $(this).closest('.date_table').prev().prev('.date_year').children('span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
			$('.date_table td a').removeClass('selected');
			$(this).addClass('selected');
			let DPT_CD = $('#MEDI_SBJ_CD').val();
			let DR_ID = $('#DR_ID').val();
			let RSV_DT = event.currentTarget.id;
			if(RSV_DT.length == 10) {
				RSV_DT = RSV_DT.replace('_2', '');
				getSchedule2(DPT_CD, DR_ID, RSV_DT);
			} else {
				getSchedule(DPT_CD, DR_ID, RSV_DT);
			}
		});
		var timeSet = $('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+' '+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4));
		$('#DD_DR_NM').text($('#DR_NM').val());
		$('#DD_MEDI_SBJ_NM').text($('#MEDI_SBJ_NM').val());
		$('#DD_APPO_DTM').html(timeSet);
		
	}

	function numberPad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	var today2 = new Date('${today}');
	var date2 = new Date();
	function prevm2() {
		clearOption('rTime');
		today2 = new Date(today2.getFullYear(), today2.getMonth() - 1, today2.getDate());
		build2();
		getCalendar2($('#MEDI_SBJ_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
	}

	function nextm2() {
		clearOption('rTime');
		$('#APPO_DT').val('');
		today2 = new Date(today2.getFullYear(), today2.getMonth() + 1, today2.getDate());
		build2();
		getCalendar2($('#MEDI_SBJ_CD').val(), $('#DR_ID').val(), $('#DR_NM').val(), $('#MEDI_SBJ_NM').val());
	}

	function build2() {
		var nMonth = new Date(today2.getFullYear(), today2.getMonth(), 1);
		var lastdate2 = new Date(today2.getFullYear(), today2.getMonth() + 1, 0);
		var tbca2 = document.getElementById("calendarBody2");
		var yearmonth2 = document.getElementById("yearmonth2");
		yearmonth2.innerHTML = today2.getFullYear() + "." + numberPad(today2.getMonth() + 1, 2);

		if (today2.getMonth() + 1 == 12) { //  눌렀을 때 월이 넘어가는 곳
			prev.innerHTML = (today2.getMonth()) + "월";
			next.innerHTML = "1월";
		} else if (today2.getMonth() + 1 == 1) { //  1월 일 때
			prev.innerHTML = "12월";
			next.innerHTML = (today2.getMonth() + 2) + "월";
		} else { //   12월 일 때
			prev.innerHTML = (today2.getMonth()) + "월";
			next.innerHTML = (today2.getMonth() + 2) + "월";
		}

		// 남은 테이블 줄 삭제
		while (tbca2.rows.length > 0) {
			tbca2.deleteRow(tbca2.rows.length - 1);
		}

		var row = null;
		row = tbca2.insertRow();
		var cnt = 0;

		// 1일 시작칸 찾기
		for (i = 0; i < nMonth.getDay(); i++) {
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
			}
			cnt = cnt + 1;
		}

		// 달력 출력
		for (i = 1; i <= lastdate2.getDate(); i++) { // 1일부터 마지막 일까지
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
				cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today2.getFullYear()+numberPad(today2.getMonth()+1, 2)+numberPad(i, 2)+'_2"></a>';
				cnt = cnt + 1;
				if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
					row = calendar2.insertRow();// 줄 추가
				}
				if (today2.getFullYear() == today2.getFullYear() && today2.getMonth() == today2.getMonth() && i == today2.getDate()) {
					cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today2.getFullYear()+numberPad(today2.getMonth()+1, 2)+numberPad(i, 2)+'_2"></a>';
				}
			} else {
				cnt = cnt + 1;
			}
			if(i == lastdate2.getDate()) {
				var endLine = 7 - (cnt % 7);
				if(endLine < 6) {
					for (var j = 0; j < endLine; j++) {
						cell = row.insertCell();
					}
				}
				
			}
		}
		
	}
	
	
	
function clearOption(selId) {
	$('#'+selId).empty();
}
function addOption(selId, optVal, txt) {
	$('#'+selId).append('<li onclick="javascript:fnTimeSet(\''+optVal+'\');"><a href="#none">'+txt+'</a></li>');
}
function fnTimeSet(RSVTM) {
	$('#APPO_TIME').val(RSVTM);
	$('#rsvExDt').text($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+' '+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4)));
	$('#rsvExDt2').text($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+' '+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4)));
	$('#DD_APPO_DTM').html($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+' '+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4)))
} 
/* 의료진 리스트 ajax */
function getDrList(MEDI_SBJ_CD) {
	$('#MEDI_SBJ_CD').val(MEDI_SBJ_CD);
	var object = {
		url : "/user/cts/rsv/getDrList.do",
		data : {
			"MEDI_SBJ_CD" : MEDI_SBJ_CD
		},
		fnSuccess : function(data) {
			
			$('.s02 li').remove();
			var li = '';
			$.each(data, function(index, value) {
					li += '<li>';
					li += "<img src=<c:url value='/getImage/"+value.mobile_IMG_ATCH_NO+"'/> class='mCS_img_loaded' >";
					li += '<strong>'+value.dr_NM+'</strong>';
					li += '<span>'+value.field_CT+'</span>';
					li += '<a href="javascript:getCalendar(\''+MEDI_SBJ_CD+'\',\''+value.dr_ID+'\',\''+value.dr_NM+'\')"></a>';
					li += '</li>';
			});
			$('.s02').append(li);
			rstEvt();
		}
	};
	fnAjax(object);
}
function getCalendar2(DPT_CD, DR_ID, DR_NM) {
	$('#DR_ID').val(DR_ID);
	$('#DR_NM').val(DR_NM);
	$('#MEDI_SBJ_CD').val(DPT_CD);
	$('#rsvDrNm').text(DR_NM);
	$('#rsvExDt').text('');
	var RSV_DT = today2.getFullYear() + numberPad(today2.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendar.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A' && value.r1_AVL > 0) {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A' && value.r2_AVL > 0) {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A' && value.r1_AVL > 0 && value.r2_AVL > 0) {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT+'_2').removeClass('closed');
				$('#'+value.rsv_DT+'_2').addClass(fgClass);
				$('#'+value.rsv_DT+'_2').prop('onclick', 'getDrCalendarList2("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT+'", "'+$('#MEDI_SBJ_NM').val()+'")');
				$('#'+value.rsv_DT+'_2').html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}
function getDrCalendarList2(DPT_CD, DR_ID, DR_NM, FIELD_CT, RSV_DT) {
	$('#DR_ID').val(DR_ID);
	$('#MEDI_SBJ_CD').val(DPT_CD);
	$('#DR_NM').val(DR_NM);
	$('#DPT_CD').val(DPT_CD);
	$('#rsvDrNm2').text(DR_NM);
	$('#rsvSbjNm2').text(FIELD_CT);
	$('#MEDI_SBJ_NM').val(FIELD_CT);
	$('#rsvExDt2').text('');
	var RSV_DT = today2.getFullYear() + numberPad(today2.getMonth() + 1, 2);
	var object = {
		url : "/user/cts/rsv/getCalendar.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if (value.am_FG === 'A' && value.r1_AVL > 0) {
					fgClass = 'tam'; 
					fgText = '오전';
				}
				if(value.pm_FG === 'A' && value.r2_AVL > 0) {
					fgClass = 'tpm';
					fgText = '오후';
				}
				if(value.pm_FG === 'A' && value.am_FG === 'A' && value.r1_AVL > 0 && value.r2_AVL > 0) {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.rsv_DT+"_2").removeClass('closed');
				$('#'+value.rsv_DT+"_2").addClass(fgClass);
				
				$('#'+value.rsv_DT+"_2").prop('onclick', 'getSchedule2("'+DPT_CD+'", "'+DR_ID+'", "'+value.rsv_DT.replace('_2', '')+'")');
				$('#'+value.rsv_DT+"_2").html(fgText);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}

function getSchedule2(DPT_CD, DR_ID, RSV_DT) {
	$('#DR_ID').val(DR_ID);
	$('#MEDI_SBJ_CD').val(DPT_CD);
	RSV_DT = RSV_DT.replaceAll('_2', '');
	$('#APPO_DT').val(RSV_DT);
	var object = {
		url : "/user/cts/rsv/getSchedule.do",
		data : {
			"DPTCD" : DPT_CD,
			"DRID" : DR_ID,
			"RSVDT" : RSV_DT
		},
		fnSuccess : function(data) {
			clearOption('rTime')
			$.each(data, function(index, value) {
				addOption('rTime', value.rsv_HR+value.rsv_MN, value.rsv_HR+':'+value.rsv_MN);
			});
			rstEvt();
		}
	};
	fnAjax(object);
}
</script>
</c:if>
<c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">
<script type="text/javascript">

	
	$('.f_step .sel').click(function(e){
		if($(this).next('[class*="f_step"]').is(':hidden')){
			$(this).next('[class*="f_step"]').slideDown();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat right',
				backgroundSize:'35px'
			});
		}else{
			$(this).next('[class*="f_step"]').slideUp();
			$(this).css({
				background:'url(/images/fbcms/mobile/bg_arrow_f_down.png) no-repeat  right',
				backgroundSize:'35px'
			});
		}
	});
	
	//진료과
	$('.f_step01 li').click(function(){
		var txt = $(this).children('a').text();
		$(this).parents('ul').prev('.sel').children('span').text(txt);
		$(this).addClass('selected').siblings('li').removeClass('selected');
		//$(this).parents('ul').slideUp();
	});
	
	//날짜선택
	$('.date_table td a:not(.closed)').off();
	$('.date_table td a:not(.closed)').click(function(){
		var year = $(this).closest('.date_table').prev().prev('.date_year').children('span').text(),
			txt = $(this).parents('td').text(),
			str = txt.replace(/[^0-9]/g,'');
		$('.date_table td a').removeClass('selected');
		$(this).addClass('selected');
		if(str < 10){
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.0' + str);
		}else{
			$(this).closest('.date_sel').prev('.sel').children('span').text(year + '.' + str);
		}
		
		});



	// 스크롤
	$(function() {
	
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		
		// 진료과 선택
		$('.f_step01 ul li a').click(function(event) {
			$('.f_step01 ul li a').removeClass('active');
			$(this).addClass('active');
			
		});
	
		$('#MOBILE_PHONE_NO_1').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$('#MOBILE_PHONE_NO_2').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$('#PHONE_NO_1').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$('#PHONE_NO_2').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$('#rTime').change(function() {
			$('#DD_APPO_DTM').html($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+'<br>'+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4)));
			$('#APPO_TIME').val($('#rTime').val());
		});
		$('#MOBILE_PHONE_NO_0').change(function() {
			const MOBILE_PHONE_NO = $('#MOBILE_PHONE_NO_0').val()+'-'+$('#MOBILE_PHONE_NO_1').val()+'-'+$('#MOBILE_PHONE_NO_2').val();
			$('#MOBILE_PHONE_NO').val(MOBILE_PHONE_NO);
		});
		$('#MOBILE_PHONE_NO_1').change(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			const MOBILE_PHONE_NO = $('#MOBILE_PHONE_NO_0').val()+'-'+$('#MOBILE_PHONE_NO_1').val()+'-'+$('#MOBILE_PHONE_NO_2').val();
			$('#MOBILE_PHONE_NO').val(MOBILE_PHONE_NO);
		});
		$('#MOBILE_PHONE_NO_2').change(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			const MOBILE_PHONE_NO = $('#MOBILE_PHONE_NO_0').val()+'-'+$('#MOBILE_PHONE_NO_1').val()+'-'+$('#MOBILE_PHONE_NO_2').val();
			$('#MOBILE_PHONE_NO').val(MOBILE_PHONE_NO);
		});
		$('#PHONE_NO_0').change(function() {
			const PHONE_NO = $('#PHONE_NO_0').val()+'-'+$('#PHONE_NO_1').val()+'-'+$('#PHONE_NO_2').val();
			$('#PHONE_NO').val(PHONE_NO);
		});
		$('#PHONE_NO_1').change(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			const PHONE_NO = $('#PHONE_NO_0').val()+'-'+$('#PHONE_NO_1').val()+'-'+$('#PHONE_NO_2').val();
			$('#PHONE_NO').val(PHONE_NO);
		});
		$('#PHONE_NO_2').change(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			const PHONE_NO = $('#PHONE_NO_0').val()+'-'+$('#PHONE_NO_1').val()+'-'+$('#PHONE_NO_2').val();
			$('#PHONE_NO').val(PHONE_NO);
		});
		$('#EMAIL_ID_0').change(function() {
			const EMAIL_ID = $('#EMAIL_ID_0').val()+'@'+$('#EMAIL_ID_1').val();
			$('#EMAIL_ID').val(EMAIL_ID);
		});
		$('#EMAIL_ID_1').change(function() {
			const EMAIL_ID = $('#EMAIL_ID_0').val()+'@'+$('#EMAIL_ID_1').val();
			$('#EMAIL_ID').val(EMAIL_ID);
		});
		$('#emailSelect').change(function() {
			if($('#emailSelect').val() == '') {
				$('#EMAIL_ID_1').val('');
				$('#EMAIL_ID_1').removeAttr('readonly');
			} else {
				$('#EMAIL_ID_1').attr('readonly', 'readonly');
				$('#EMAIL_ID_1').val($('#emailSelect').val());
			}
			$('#EMAIL_ID').val($('#EMAIL_ID_0').val()+'@'+$('#EMAIL_ID_1').val());
		});
		$('#F_ADDR_TX').change(function() {
			$('#ADDR_TX').val($('#F_ADDR_TX').val());
		});
		$('#F_ADDR_DTIL_TX').change(function() {
			$('#ADDR_DTIL_TX').val($('#F_ADDR_DTIL_TX').val());
		});
		$('#F_INQR_SEND_TX').change(function() {
			$('#INQR_SEND_TX').val($('#F_INQR_SEND_TX').val());
		});
		build();
	});
	
	function numberPad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	var today = new Date('${reservationDetail.APPO_DT}'.substring(0,4)+'-'+'${reservationDetail.APPO_DT}'.substring(4,6)+'-'+'${reservationDetail.APPO_DT}'.substring(6,8));
	var date = new Date();
	var qryYm = '00000000'; 
	
	function prevm() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		build();
	}
	
	function nextm() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		build();
	}
	
	function build() {
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		var tbcal = document.getElementById("calendarBody");
		var yearmonth = document.getElementById("yearmonth");
		yearmonth.innerHTML = today.getFullYear() + "." + numberPad(today.getMonth() + 1, 2);
	
		if (today.getMonth() + 1 == 12) { //  눌렀을 때 월이 넘어가는 곳
			prev.innerHTML = (today.getMonth()) + "월";
			next.innerHTML = "1월";
		} else if (today.getMonth() + 1 == 1) { //  1월 일 때
			prev.innerHTML = "12월";
			next.innerHTML = (today.getMonth() + 2) + "월";
		} else { //   12월 일 때
			prev.innerHTML = (today.getMonth()) + "월";
			next.innerHTML = (today.getMonth() + 2) + "월";
		}
	
		// 남은 테이블 줄 삭제
		while (tbcal.rows.length > 0) {
			tbcal.deleteRow(tbcal.rows.length - 1);
		}
	
		var row = null;
		row = tbcal.insertRow();
		var cnt = 0;
	
		// 1일 시작칸 찾기
		for (i = 0; i < nMonth.getDay(); i++) {
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
			}
			cnt = cnt + 1;
		}
		
		//쿼리용 달력 날짜 선택
		qryYm = today.getFullYear()+numberPad(today.getMonth()+1, 2);
	
		// 달력 출력
		for (i = 1; i <= lastDate.getDate(); i++) { // 1일부터 마지막 일까지
			if ((cnt + 1) % 7 != 1) {
				cell = row.insertCell();
				cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today.getFullYear()+numberPad(today.getMonth()+1, 2)+numberPad(i, 2)+'"></a>';
				cnt = cnt + 1;
				if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
					row = calendar.insertRow();// 줄 추가
				}
				if (today.getFullYear() == today.getFullYear() && today.getMonth() == today.getMonth() && i == today.getDate()) {
					cell.innerHTML = i + '<a href="javascript:void(0);" class="closed" id="'+today.getFullYear()+numberPad(today.getMonth()+1, 2)+numberPad(i, 2)+'"></a>';
					//cell.classList.add('active'); //오늘날짜배경색
				}
			} else {
				cnt = cnt + 1;
			}
			if(i == lastDate.getDate()) {
				var endLine = 7 - (cnt % 7);
				if(endLine < 6) {
					for (var j = 0; j < endLine; j++) {
						cell = row.insertCell();
					}
				}
				
			}
		}
		selectCalendar(qryYm);
	}
	
	function rstEvent() {
		
		//진료과
		$('.f_step01 li').click(function(){
			var txt = $(this).children('a').text();
			$(this).parents('ul').prev('.sel').children('span').text(txt);
			$(this).addClass('selected').siblings('li').removeClass('selected');
			//$(this).parents('ul').slideUp();
		
		});
		
		//날짜 선택
		$('.date_table td a:not(.closed)').off();
		$('.date_table td a:not(.closed)').click(function(event) {
			$('.date_table a').removeClass('selected');
			$(this).addClass('selected');
			$('#APPO_DT').val(event.target.id);
			$('#APPO_TIME').val($('#rTime').val());
			
			$('#selDate').html($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8));
			$('#DD_EXMN_DTM').html($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+'<br>선택없음');
		
			
		});
	}
	function clearOption(selId) {
		$('#'+selId).empty();
	}
	function addOption(selId, liVal, txt) {
		$('#'+selId).append('<li onclick="javascript:fnTimeSet(\''+liVal+'\');"><a href="#none">'+txt+'</a></li>');
	}
	function fnTimeSet(RSVTM) {
		$('#rTime').val(RSVTM);
		$('#APPO_TIME').val($('#rTime').val());
		$('#DD_EXMN_DTM').html($('#APPO_DT').val().substring(0,4)+'.'+$('#APPO_DT').val().substring(4,6)+'.'+$('#APPO_DT').val().substring(6,8)+' '+ ($('#APPO_TIME').val().substring(0,2)+':'+$('#APPO_TIME').val().substring(2,4)));
	}
	
	function nextCal(EXMN_PROG_CD, EXMN_PROG_NM) {
	$("#DD_EXMN_PROG_NM").text("");
	$("#DD_EXMN_PROG_NM").text(EXMN_PROG_NM);
	$("#EXMN_PROG_CD").val(EXMN_PROG_CD);
	$("#EXMN_PROG_NM").val(EXMN_PROG_NM);
	}
	function selectCalendar(yearMonth) {
	var object = {
		url : "/user/cts/rsv/selectCheckupCalendar.do",
		data : {
			"RSVDT" : yearMonth
		},
		fnSuccess : function(data) {
			$.each(data, function(index, value) {
				let fgClass = 'closed';
				let fgText = '진료없음';
				if(value.posb_YN === 'Y') {
					fgClass = 'tall';
					fgText = '오전, 오후';
				}
				$('#'+value.appo_SCHE_DT).removeClass('closed');
				if('${reservationDetail.APPO_DT}' == value.appo_SCHE_DT) {
					$('#'+value.appo_SCHE_DT).addClass(fgClass + 'active');
				} else {
					$('#'+value.appo_SCHE_DT).addClass(fgClass);
				}
	
				$('#'+value.appo_SCHE_DT).prop('onclick', 'changeTime("'+value.appo_SCHE_DT+'")');
				$('#'+value.appo_SCHE_DT).html(fgText);
			});
			rstEvent();
		}
	};
	fnAjax(object);
	}
	
	//다음 우편번호API
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.roadAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('POST_NO').value = data.zonecode;
				document.getElementById("F_ADDR_TX").value = addr;
				document.getElementById("ADDR_TX").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("F_ADDR_DTIL_TX").value = '';
				document.getElementById("F_ADDR_DTIL_TX").focus();
			}
		}).open();
	};
	</script>
	</c:if>
	<script type="text/javascript">
	/***************************************************
	* 예약 수정
	***************************************************/
	function fnReservationUpdate() {
		<c:if test="${appointmentVO.APPO_GUBN_CD eq '02'}">
		if($('#MOBILE_PHONE_NO_1').val().length < 4) {
			alert('휴대폰 번호를 정확히 입력해 주시기 바랍니다.');
			$('#MOBILE_PHONE_NO_1').focus();
			return false;
		}
		if($('#MOBILE_PHONE_NO_2').val().length < 4) {
			alert('휴대폰 번호를 정확히 입력해 주시기 바랍니다.');
			$('#MOBILE_PHONE_NO_2').focus();
			return false;
		}
		</c:if>
		var varFrom = document.getElementById("UpdateForm");
		varFrom.action = "<c:url value='/user/cts/rsv/userRSVUpdate.do'/>";
		varFrom.PHONE_NO.value = document.getElementById('PHONE_NO_0').value+'-'+document.getElementById('PHONE_NO_1').value+'-'+document.getElementById('PHONE_NO_2').value;
		if(confirm("<spring:message code="ussIonBnr.bannerUpdt.saveImage"/>")){/* 저장 하시겠습니까? */
		        varFrom.submit();
		}
	}
	/***************************************************
	* 이전페이지로 돌아가기
	***************************************************/
	function fnCancel() {
		window.location.href = "/user/cts/rsv/userRSVList.do";
	}
</script>