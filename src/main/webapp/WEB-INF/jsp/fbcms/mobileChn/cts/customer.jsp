<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content pad0">
	<div class="mar20">
		<h4 class="hours">
			诊疗时间
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
						<th scope="col">日期分类</th>
						<th scope="col">时间分类</th>
						<th scope="col">门诊</th>
						<th scope="col">体检</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" rowspan="2">平日</th>
						<td>诊疗时间</td>
						<td>08:00 ~ 17:00</td>
						<td>07:30 ~ 16:30</td>
					</tr>
					<tr>
						<td>午休时间</td>
						<td>13:00 ~ 14:00</td>
						<td>-</td>
					</tr>
					<tr>
						<th scope="row">周六</th>
						<td>诊疗时间</td>
						<td>08:00 ~ 13:00</td>
						<td>07:30 ~ 13:00</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="box_blue">
			<h6 class="con_in_tit10">※ 诊疗程序介绍</h6>
			<p>填写诊疗申请表<span class="sche_arr"></span>受理<span class="sche_arr"></span>门诊科室诊疗<span class="sche_arr"></span>缴费与预约<span class="sche_arr"></span>检查与处方<span class="sche_arr"></span>回家</p>
			<h6 class="con_in_tit10">※ 门诊当日受理截止时间</h6>
			<ul class="hy_list">
				<li>平日：上午12:00， 下午16:30截止</li>
				<li>周六：中午12:30截止</li>
			</ul>
			<h6 class="con_in_tit10">※ 预约咨询： <a href="tel:1577-7502">1577-7502</a>, 传真： 02-519-8855</h6>
			<h6 class="con_in_tit10"><span>※</span> <span>医保补助患者应向第一阶段医保机构的医生申请开具《疗
				养补助委托书》，并于7天内（公休日除外）提交到本院院务组，
				以便来院接受第二阶段诊疗。</span></h6>
		</div>
	</div>

	<section class="location_map">
		<h3>来访指南</h3>

		<img src="/images/fbcms/mobileChn/img_map.png" alt="">

		<div>
			<h4 class="con_in_tit04">地址</h4>
			<p>(邮编：06117）首尔市江南区论岘路627号<br>
				(首尔市江南区论岘一洞175-10号)</p>
			<ul>
				<li><strong><span>9</span>彦州站</strong>
					<p>从2号出口步行200米。</p>
				</li>
				<li><strong><span>7</span>鹤洞站</strong>
					<p>从4号出口步行480米。<br>
					在5号出口乘坐241、3412路，在“论岘洞坡”
					站下车。<br>
					在7号出口乘坐147、463、4211路，在“论岘洞
					坡”站下车</p>
				</li>
			</ul>
		</div>
	</section>