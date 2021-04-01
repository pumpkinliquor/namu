<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content pad0">
	<div class="mar20">
		<h4 class="hours">
			Hours
		</h4>
		<div class="tdetail tdetail04">
			<table>
				<caption>요일, 구분, 외래, 검진으로 구성된 표</caption>
				<colgroup><col style="width:25%">
				<col style="width:25%">
				<col style="width:25%">
				<col>
				</colgroup><thead>
					<tr>
						<th scope="col">Day of the week</th>
						<th scope="col">Classification</th>
						<th scope="col">Outpatient</th>
						<th scope="col">Exam</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" rowspan="2">Weekday</th>
						<td>Hours</td>
						<td>08:00 ~ 17:00</td>
						<td>07:30 ~ 16:30</td>
					</tr>
					<tr>
						<td>Lunch</td>
						<td>13:00 ~ 14:00</td>
						<td>-</td>
					</tr>
					<tr>
						<th scope="row">Saturday</th>
						<td>Hours</td>
						<td>08:00 ~ 13:00</td>
						<td>07:30 ~ 13:00</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="box_blue">
			<h6 class="con_in_tit10">* Appointment procedure</h6>
			<p>Complete the application form<span class="sche_arr"></span>
				Submit to reception<span class="sche_arr"></span>
				Treatment at outpatient department<span class="sche_arr"></span>
				Payment/reservation<span class="sche_arr"></span>
				Examination/prescription</p>
			<h6 class="con_in_tit10">* Reception deadline for same-day outpatient treatment: </h6>
			<ul class="hy_list">
				<li>Weekdays: until 12:00 pm, until 16:30 pm </li>
				<li>Saturday: until 12:30 </li>
			</ul>
			<h6 class="con_in_tit10">* Reservations: <a href="tel:1577-7502">1577-7502</a>, Fax : 02-519-8855</h6>
			<h6 class="con_in_tit10"><span>*</span> <span>Patients with medical benefits who wish to receive second-stage treatment at the hospital must submit the “request for medical benefit”<br>
			issued by the doctor of the first-stage medical benefit institution to the hospital administrative staff within 7 days from the date of issue<br>(excluding holidays)</span></h6>
		</div>
	</div>

	<section class="location_map">
		<h3>Directions</h3>

		<img src="/images/fbcms/mobileEng/img_map.png" alt="">

		<div>
			<h4 class="con_in_tit04">Address</h4>
			<p>06117 627 Nonhyeon-ro, Gangnam-gu, Seoul<br>
			(175-10, Nonhyeon 1-dong, Gangnam-gu, Seoul)</p>
			<ul>
				<li><strong><span>9</span>Eonju Station</strong>
					<p>200M-walk from Exit 2 </p>
				</li>
				<li><strong><span>7</span>Hakdong Station</strong>
					<p>480M-walk from Exit 4<br>
					Exit 5 Get off at "Nonhyeon-dong Pass" <br>
					from Bus No. 241,3412<br>
					Exit 7 Get off at "Nonhyeon-dong Pass" <br>
					from Bus No. 147, 463, 4211</p>
				</li>
			</ul>
		</div>
	</section>