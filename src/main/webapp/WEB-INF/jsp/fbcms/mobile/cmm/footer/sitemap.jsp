<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- container -->
<div id="container">
	<div class="no_con">
		<h4 class="con_in_tit02 mb15">사이트맵</h4>
		<ul class="sitemap_box">
			<li><h5>병원소개</h5>
				<ul>
					<li><a href="/user/itd/itd/vievis.do">비에비스 나무병원은</a></li>
					<li><a href="/user/itd/res/result.do">진료실적</a></li>
					<li><a href="/user/itd/flg/floorguide.do">층별안내</a></li>
					<li><a href="/user/itd/eqm/equipment.do">장비소개</a></li>
					<li><a href="/user/itd/prs/selectPRSList.do">언론보도</a></li>
					<li><a href="/user/itd/ptn/partner.do">협력병원</a></li>
					<li><a href="/user/itd/epm/employmentGuide.do">채용안내</a></li>
				</ul>
			</li>
			<li><h5>진료과&middot;의료진</h5>
				<ul>
					<li><a href="/user/hpm/smt/SMTPage.do?code=GI">소화기내과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=GS">소화기외과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=NE">신장내과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=FM">가정의학과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=BE&code2=C">유방&middot;갑상선외과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=GY">부인과</a></li>
					<li><a href="/user/hpm/smt/SMTPage.do?code=XR">영상의학과</a></li>
				</ul>
			</li>
			<li><h5>특화센터</h5>
				<ul>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC001">당일내시경센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC002">용종&middot;암 치료내시경센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC008">간센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC005">당뇨센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC003">담석수술센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC004">유방&middot;갑상선센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC006">안티에이징센터</a></li>
					<li><a href="/user/spc/cti/selectCTIInfo.do?custom1=SPC007">비만센터</a></li>
				</ul>
			</li>
			<li><h5>검진센터</h5>
				<ul>
					<li><a href="/user/cuc/hcu/infoHCU.do">나무병원 건강검진은</a></li>
					<li><a href="/user/cuc/ccc/infoCCC.do">종합검진센터</a></li>
					<li><a href="/user/cuc/icc/infoICC.do">공단검진센터</a></li>
					<li><a href="/user/cuc/pct/precautions.do">검사 전 주의사항</a></li>
				</ul>
			</li>
			<li><h5>건강정보</h5>
				<ul>
					<li><a href="/user/hti/dsi/selectDSIList.do">질환정보</a></li>
					<li><a href="/user/hti/dct/selectDCTList.do">Dr.민영일의 건강백서</a></li>
					<li><a href="/user/hti/nti/selectNTIList.do">영양정보</a></li>
					<li><a href="/user/hti/mvi/selectMVIList.do">운동정보</a></li>
					<li><a href="/user/hti/htm/selectHTMList.do">건강동영상</a></li>
					<li><a href="/user/hti/mvm/selectMVMList.do">운동동영상</a></li>
				</ul>
			</li>
			<li><h5>고객서비스</h5>
				<ul>
					<li><a href="/user/cts/rsv/drScheduleView.do">진료시간표</a></li>
					<li><a href="/user/cts/rsv/userRSVMain.do">진료/검진 예약 및 조회</a></li>
					<li><a href="/user/cts/location/map.do">찾아오시는 길</a></li>
					<li><a href="/user/cts/gui/guide.do">입원안내</a></li>
					<li><a href="/user/cts/pro/proof.do">제증명발급</a></li>
					<li><a href="/user/cts/ntc/selectNTCList.do">공지사항</a></li>
					<li><a href="/user/cts/faq/selectFaqList.do">자주하는 질문</a></li>
					<li><a href="/user/cts/cst/medicalConsultation.do">의료상담(Q&A)</a></li>
				</ul>
			</li>
		</ul>