<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(function() {
		$('.ex_list li a *:nth-child(1)').height($('.ex_list li a *:nth-child(1)').width() * 0.641);
	});
</script>

<!-- contents s -->
<div class="contents">
	<ul class="tab_list02 tab_list03"><!-- tab -->
		<li class="selected"><a href="#n" title="선택된 탭">발급절차</a></li>
		<li><a href="#n">구비서류안내</a></li>
		<li><a href="#n">발급비용</a></li>
	</ul>

	<!-- 01 s -->
	<div class="tab_box">
		<h4 class="con_in_tit04 mt40">외래환자</h4>
		<p class="con_in_txt02">※ 신규 진단서 발급은 환자 본인에 한하여 가능합니다</p>
		<h5 class="con_in_tit08">제증명 서류</h5>
		<ul class="num_list">
			<li>
				<span>01</span>
				<div>
					<p>담당 의사 진료일로 접수</p>
					<ul class="dot_list03 mar0">
						<li>콜센터 및 원무팀</li>
					</ul>
				</div>
			</li>
			<li>
				<span>02</span>
				<div>
					<p>신분확인 및 서류제출</p>
					<ul class="dot_list03 mar0">
						<li>원무팀</li>
					</ul>
				</div>
			</li>
			<li>
				<span>03</span>
				<div>
					<p>담당의사 상담 후 내용입력</p>
				</div>
			</li>
			<li>
				<span>04</span>
				<div>
					<p>수납</p>
				</div>
			</li>
			<li>
				<span>05</span>
				<div>
					<p>직인 날인 후 서류교부</p>
				</div>
			</li>
		</ul>

		<h5 class="con_in_tit08 mt15">의무기록 및 영상자료</h5>
		<ul class="num_list">
			<li>
				<span>01</span>
				<div>
					<p>담당 의사 진료일로 접수</p>
					<ul class="dot_list03 mar0">
						<li>콜센터 및 원무팀</li>
					</ul>
				</div>
			</li>
			<li>
				<span>02</span>
				<div>
					<p>신분확인 및 서류제출</p>
					<ul class="dot_list03 mar0">
						<li>원무팀</li>
					</ul>
				</div>
			</li>
			<li>
				<span>03</span>
				<div>
					<p>담당의사 상담</p>
				</div>
			</li>
			<li>
				<span>04</span>
				<div>
					<p>수납</p>
				</div>
			</li>
			<li>
				<span>05</span>
				<div>
					<p>사본교부</p>
				</div>
			</li>
		</ul>

		<h5 class="con_in_tit08 mt15">입원환자</h5>
		<ul class="num_list">
			<li>
				<span>01</span>
				<div>
					<p>발급의뢰 (해당 병동 간호사)</p>
				</div>
			</li>
			<li>
				<span>02</span>
				<div>
					<p>주치의 확인</p>
				</div>
			</li>
			<li>
				<span>03</span>
				<div>
					<p>발급 (원무팀)</p>
				</div>
			</li>
		</ul>

		<div class="box_blue mb0">
			<ul>
				<li>서류발급 비용은 퇴원시 입원진료비(진단서 및 제증명료)에 같이 계산됩니다</li>
				<li>제증명 및 의무기록 창구 위치 : 본원 1층 원무팀(입퇴원창구)</li>
			</ul>
		</div>
	</div>
	<!-- //01 e -->

	<!-- 02 s -->
	<div class="tab_box">
		<div class="box_blue mt40">
			<h5 class="important">의무기록 사본발급 안내</h5>
			<p>의료법 제19조 및 제21조에 의거 환자의 개인정보 보호를 위해서 의료기관은 비밀을 유지할 책임이 있습니다<br>
			환자의 의무기록 열람 및 사본 발급시 환자 본인외의 가족이 신청하는 경우 위임장(환자 본인이 작성)을 첨부하여야 하오니 협조하여 주시기 바랍니다
			</p>
		</div>

		<h4 class="con_in_tit04">사본발급 시 필요한 서류</h4>
		<ul class="dot_list03 c_gray3">
			<li>신분증 (사진과 주민등록번호가 있는 주민등록증, 여권, 자동차 운전면허증 등)</li>
			<li>친족관계임을 확인할 수 있는 서류 (가족관계증명서, 주민등록등본 등)
				<ul class="hy_list">
					<li>의료보험증은 친족관계가 입증되지 않으므로 인정되지 않음</li>
					<li>의무기록 사본발급일 기준 3개월 이내에 발급 받은 것만 인정함</li>
				</ul>
			</li>
			<li>동의서 및 위임장 서명란에 ‘자필서명’만 인정되며 도장 및 지장은 인정되지 않음</li>
			<li>동의서에는 사본발급 받는 범위(날짜, 기록지 범위 등)를 구체적으로 명기하도록 해야 함</li>
			<li>사망, 의식불명인자, 미성년자 등의 경우에는 법정 대리인이 대신할 수 있으며 환자의 동의를 받을 수 없는 경우에는 사유를 증명할 수 있는 서류를 첨부해야함
				<ul class="hy_list">
					<li>환자가 사망한 경우 : 사망진단서</li>
					<li>환자가 의식불명, 중증의 질환, 부상으로 자필서명을 할 수 없는 경우 : 진단서</li>
				</ul>
			</li>
		</ul>

		<div class="tdetail tdetail04 mar0 mt40">
			<table>
				<caption>제목, 필요한 서류로 구성된 표</caption>
				<col style="width:100px">
				<col>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">필요한 서류</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">환자본인</th>
						<td>
							<ul class="hy_list hyphen02">
								<li>사진이 있는 신분증</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row">환자<br><em class="c_gray6">(만19세 미만)</em><br> 친권자</th>
						<td>
							<ul class="hy_list hyphen02">
								<li>친권자의 신분증</li>
								<li>친권자임을 확인할 수 있는 서류 (가족관계증명서 등)</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row">친족<br><em class="c_gray6">(배우자, 직계존속, 직계비속,<br>배우자의 직계존속)</em></th>
						<td class="t_left">
							<ul class="hy_list hyphen02">
								<li>신청자의 신분증 또는 사본</li>
								<li>친족관계증명서 (가족관계서류, 주민등록등본 등 친족임을 입증 할 수 있는 서류)</li>
								<li>환자가 자필 서명한 동의서</li>
								<li>환자의 신분증 사본</li>
							</ul>
							<p class="desc02 mt10"><em class="c_point">* 형제 자매는 <환자의 대리인>기준으로만 발급 가능</em>(친족 기준에 해당 안됨)</p>
						</td>
					</tr>
					<tr>
						<th scope="row">환자 대리인<br><em class="c_gray6">(형제&middot;자매&middot;보험회사 등)</em></th>
						<td>
							<ul class="hy_list hyphen02">
								<li>신청자의 신분증 또는 사본</li>
								<li>환자가 자필 서명한 동의서</li>
								<li>환자가 자필 서명한 위임장</li>
								<li>환자의 신분증 사본</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<h4 class="con_in_tit04">양식 다운로드</h4>
			<ul class="proof_down">
				<li>
					<strong>동의서 양식</strong>
					<span>(별지 제9호의 2서식)</span>
					<a href="javascript:resourceFileDown('동의서.hwp');">다운로드</a>
				</li>
				<li>
					<strong>위임장 양식</strong>
					<span>(별지 제9호의 3서식)</span>
					<a href="javascript:resourceFileDown('위임장.hwp');">다운로드</a>
				</li>
				<li>
					<strong>처방전 대리수령 신청서 양식</strong>
					<span>(별지 제8호의 2서식)</span>
					<a href="javascript:resourceFileDown('처방전대리수령.hwp');">다운로드</a>
				</li>
			</ul>

		<div class="box_blue mt40">
			<h5 class="important">제증명 발급 안내</h5>
			<p>진단서는 의료법 제17조에 의거하여 의료업에 종사하고 자신이 진찰 또는 검안한 의사, 치과의사가 아니면 진단서, 검안서, 증명서를 작성하여 교부할 수 없습니다<br>
			의료법 제17조(진단서 등)에 의거하여, 진단서의 경우 진료기록부 등의 경우와 달리 환자의 의식이 있는 경우에는 대리인에게 위임이 불가합니다 (환자 본인만 발급 가능)</p><!-- 1210 -->
		</div>
		<h4 class="con_in_tit04">사본발급 가능시간</h4>
		<ul class="dot_list02 listt">
			<li><em class="c_gray3">평　일</em> <span>08:00 ~ 13:00</span><span class="bar">14:00 ~ 16:30</span></li>
			<li><em class="c_gray3">토요일</em> <span>08:00 ~ 12:30</span></li>
		</ul>
		<p class="desc02 c_point">* 각종 진단서 및 의무기록 사본 발급시 반드시 담당의사 진료시간을 확인하시고 오셔야 합니다</p>
	</div>
	<!-- //02 e -->

	<!-- 03 s -->
	<div class="tab_box">
		<h4 class="con_in_tit04 mt40">제증명 종류</h4>
		<div class="tdetail tdetail04 mar0">
			<table>
				<caption>발급부서, 증명서 종료, 비고 구성된 표</caption>
				<thead>
					<tr>
						<th scope="col">발급부서</th>
						<th scope="col">증명서 종류</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">진료과 주치의<br> 발급<span>(진료 예약필요)</span></th>
						<td>
							<ul class="hy_list hyphen02">
								<li>진료기록지, 의뢰서</li>
								<li>통원확인서(병명 기재)</li>
								<li>진단서, 소견서</li>
								<li>입·퇴원 확인서</li>
								<li>수술·시술 확인서</li>
							</ul>
						</td>
						<td>
							<ul class="hy_list hyphen02">
								<li>진찰료 및 수수료 발생</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th scope="row">원무과 발급<span>(진료 불필요)</span></th>
						<td>
							<ul class="hy_list hyphen02">
								<li>영수증</li>
								<li>진료비 세부내역서</li>
								<li>통원확인서(통원일자만 기재)</li>
								<li>상급병실 사용확인서</li>
								<li>연말정산 납입증명서</li>
							</ul>
						</td>
						<td>
							<ul class="hy_list hyphen02">
								<li>무료</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<h4 class="con_in_tit04">수수료</h4>
		<div class="tdetail tdetail04 mar0">
			<table>
				<caption>증명서 종류, 비용, 비고, 발급장소로 구성된 표</caption>
				<thead>
					<tr>
						<th scope="col">증명서 종류</th>
						<th scope="col">비용</th>
						<th scope="col">비고</th>
						<th scope="col">발급장소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="t_left" scope="row">일반진단서</th>
						<td>
							<ul>
								<li>10,000</li>
							</ul>
						</td>
						<td rowspan="9">
							<ul>
								<li>사본:<br> 1,000</li>
							</ul>
						</td>
						<td rowspan="13">
							<ul>
								<li>1층 원무팀<br>통합데스크</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">의사소견서</th>
						<td>
							<ul>
								<li>10,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">진단서/소견서<br>(영문)</th>
						<td>
							<ul>
								<li>20,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">사망진단서</th>
						<td>
							<ul>
								<li>10,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">수술(시술)확인서</th>
						<td>
							<ul>
								<li>3,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">일반채용신체검사서</th>
						<td>
							<ul>
								<li>40,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">입퇴원확인서 및<br> 통원확인서<br>(병명,날짜기재)</th>
						<td>
							<ul>
								<li>3,000</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">통원확인서<br>(날짜만 기재)</th>
						<td>
							<ul>
								<li>무료</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">상급병실사용확인서</th>
						<td>
							<ul>
								<li>무료</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">진료의뢰서</th>
						<td>
							<ul>
								<li>무료</li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">진료비 납입증명서</th>
						<td>
							<ul>
								<li>무료</li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">의무기록사본<br>(기본5장)</th>
						<td>
							<ul>
								<li>1,000</li>
							</ul>
						</td>
						<td>
							<ul>
								<li>추가 장당:<br> 100</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th class="t_left" scope="row">CD copy</th>
						<td>
							<ul>
								<li>10,000</li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<p class="desc02 c_point mt20">* 증명서 발급비용은 진찰료와는 별도로 부담하셔야 합니다.</p>
	</div>
	<!-- //03 e -->