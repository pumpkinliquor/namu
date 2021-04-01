<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content pad0">
	<div class="mar20">
		<h4 class="hours">
			診療時間のご案内
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
						<th scope="col">曜日</th>
						<th scope="col">区分</th>
						<th scope="col">外来</th>
						<th scope="col">検診</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" rowspan="2">平日</th>
						<td>診療時間</td>
						<td>08:00 ~ 17:00</td>
						<td>07:30 ~ 16:30</td>
					</tr>
					<tr>
						<td>昼休憩</td>
						<td>13:00 ~ 14:00</td>
						<td>-</td>
					</tr>
					<tr>
						<th scope="row">土曜日</th>
						<td>診療時間</td>
						<td>08:00 ~ 13:00</td>
						<td>07:30 ~ 13:00</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="box_blue">
			<h6 class="con_in_tit10">※ 診療の流れのご案内</h6>
			<p>診療申込書の作成<span class="sche_arr"></span>受付<span class="sche_arr"></span>外来診療科の診療<span class="sche_arr"></span>会計&middot;予約<span class="sche_arr"></span>検査·処方<span class="sche_arr"></span>帰宅</p>
			<h6 class="con_in_tit10">※ 外来診療当日の受付締切</h6>
			<ul class="hy_list">
				<li>平日 : 午前 12:00 まで, 午後 16:30 まで</li>
				<li>土曜日 : 12:30 まで</li>
			</ul>
			<h6 class="con_in_tit10">※ 電話予約 : <a href="tel:1577-7502">1577-7502</a>, FAX : 02-519-8855</h6>
			<h6 class="con_in_tit10"><span>※</span> <span> 医療給与患者が当院 (2次医療機関)にて2段階診療を受け
			るためには、1段階医療給与機関(1次医療機関)の医師から発
			行を受けた「療養給与依頼書 (診療依頼書) 」を発行日から7
			日以内に(祝日を除く)院務科に提出しなければなりません。</span></h6>
		</div>
	</div>

	<section class="location_map">
		<h3>アクセス</h3>

		<img src="/images/fbcms/mobileJpn/img_map.png" alt="">

		<div>
			<h4 class="con_in_tit04">住所</h4>
			<p>06117 ソウル市 江南(カンナム)区 論硯(ノンヒョン)路 627
				(ソウル市 江南(カンナム)区 論硯(ノンヒョン)1洞 175-10)</p>
			<ul>
				<li><strong><span>9</span>彦州(オンジュ)駅</strong>
					<p>2番出口より徒歩 200M</p>
				</li>
				<li><strong><span>7</span>鶴洞(ハクドン)駅</strong>
					<p>4番出口より徒歩 480M<br>
					5番出口　241,3412 “ノンヒョンドンコゲ” 下車<br>
					7番出口　147, 463, 4211 “ノンヒョンドンコゲ“下車</p>
				</li>
			</ul>
		</div>
	</section>