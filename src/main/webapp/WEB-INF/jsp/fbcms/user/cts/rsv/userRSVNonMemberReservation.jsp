<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="contents w1200">

	<form method="post" action="" id="reservationForm" name="reservationForm">
		<section class="re_nonmem">
			<header>비회원 예약&middot;조회하기</header>
			<div class="re_loginbox">
				<p>
					<label for="APPO_PRSN_NM">이름</label>
					<input type="text" name="APPO_PRSN_NM" id="APPO_PRSN_NM" placeholder="이름을 입력해주세요">
				</p>
				<p>
					<label for="rePw">휴대폰</label>
					<select id="fCtn" title="휴대폰">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="0130">0130</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<span>-</span>
					<input type="text" id="mCtn" title="휴대폰 중간자리" maxlength="4">
					<span>-</span>
					<input type="text" id="lCtn" title="휴대폰 뒷자리" maxlength="4">
					<input type="hidden" id="MOBILE_PHONE_NO" name="MOBILE_PHONE_NO">
					<input type="hidden" id="BIRTH_DT" name="BIRTH_DT">
					<input type="hidden" id="GENDER_CD" name="GENDER_CD">
				</p>
			</div>

			<section class="re_privacy">
				<header>개인정보취급방침</header>
				<div class="s01">
					<p class="con_in_txt mb60">비에비스 나무병원(이하 “병원”)은 고객의 개인정보보호를 최우선으로 생각하고, 이를 보호하기 위해 항상 최선의 노력을 다하고 있습니다.<br>
					병원은 &#x300C;정보통신망 이용촉진 및 정보보호 등에 관한 법률&#x300D;을 비롯한 모든 개인정보보호 관련 법률규정 및 정보통신부가 제정한&#12302;개인정보보호지침&#12303;등 <br>
					개인정보보호 관련 각종 법규를 준수하고 있습니다. 병원은 &#x300C;개인정보 취급방법&#x300D;을 제정하여 이를 준수하고 있으며, 서비스 이용약관, 홈페이지 등을 통하여 <br>
					고객의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
				
					<h5 class="con_in_tit01">1. 개인 정보의 수집 목적 및 이용</h5>
					<p class="con_in_txt">병원은 회원가입, 진료예약, 검진예약, 예약조회, 각종 서비스 제공을 위한 목적으로 귀하의 개인정보를 수집 &middot; 이용하고 있습니다.</p>
					<h6 class="con_in_tit09">수집하는 개인정보 항목</h6>
					<ul class="hy_list">
						<li>성명, 아이디, 비밀번호, 주민등록번호</li>
						<li>진료 &middot; 검진 예약, 예약조회 및 회원제 서비스 이용에 따른 본인 확인 절차에 이용</li>
						<li>이메일 주소, 전화번호, 핸드폰 번호 검진 예약 확정을 위한 연락, 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 행사정보 등의 안내</li>
						<li>주소 물품 배송에 대한 정확한 배송지의 확보</li>
					</ul>
				
					<h5 class="con_in_tit01 mt50">2. 개인정보 수집에 대한 동의</h5>
					<p class="con_in_txt">병원은 귀하의 개인정보 수집과 관련하여 병원의 개인정보 취급방법 또는 이용약관의 내용에 대해&#12300;동의&#12301;버튼 또는&#12300;취소&#12301;버튼을 클릭할 수 있는 절차를 마련하고 있으며, 귀하가 &#12300;동의&#12301;버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.</p>
				
					<h5 class="con_in_tit01 mt50">3. 목적 외 사용 및 제 3자에 대한 제공</h5>
					<p class="con_in_txt">병원은 회원님의 개인정보를 &#12300;개인정보의 수집목적 및 이용목적&#12301;에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업 &middot; 기관에 제공하지 않습니다. 단, 고객의 동의가 있거나 다음과 같은 경우에는 예외로 합니다. </p>
					<ul class="hy_list">
						<li>통계 작성, 학술연구, 시장 조사 등에 특정 개인을 식별할 수 없는 형태로 가공되어 제공하는 경우 </li>
						<li>'홈페이지'의 이용약관을 위배하거나 타인에게 피해를 주어 법적 조취를 위해 개인 정보를 공개해야 한다고 판단되는 경우 </li>
						<li>관련법령에 의거 적법한 절차에 의한 정부/수사기관의 요청이 있는 경우</li>
					</ul>
				
					<h5 class="con_in_tit01 mt50">4. 개인정보 수집</h5>
					<p class="con_in_txt">병원은 회원가입 시 서비스 이용과 진료와 검진 예약을 위해 필요한 최소한의 개인정보만을 수집합니다.<br>
					귀하가 병원의 서비스를 이용하기 위해서는 <span class="uline">회원가입 시 아이디, 비밀번호, 성명, 주소, 휴대폰, e-mail을 필수적으로 입력</span>하셔야 합니다. 그러나, 메일수신여부 등과 같은 선택항목은 이를 입력하지 않더라도 서비스 이용에는 제한이 없습니다. 주민등록번호는 가입 시 실명확인(저장은 안됨)과 진료 및 검진 예약 시에 입력합니다.</p>
					<p class="con_in_txt"><strong>* 개인정보의 처리 및 보유 기간 : 진료 목적을 위하여 수집한 경우: &#12302;의료법&#12303; 기준에 준함</strong></p>
					<p class="con_in_txt"><strong>* 개인정보 파기에  관한 사항</strong></p>
					<ul class="hy_list">
						<li>파기절차 : 이용목적이 달성된 후 내부 방침 및 정보보호 사유에 따라 파기되거나 파기됩니다.</li>
						<li>파기방법 : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.</li>
				          </ul>
				          
				          <h5 class="con_in_tit01 mt50">5. 쿠키에 의한 개인정보 수집</h5>
					<p class="con_in_txt">병원은 이용자들의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버(HTTP)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</p>
				          <p class="con_in_txt"><strong>쿠키의 사용 목적 :</strong> 병원의 각 서비스에 대한 접속 빈도 및 방문 시간 등을 분석하여 이용자에게 최적화된 정보 제공을 위하여 사용합니다.</p>
				          <p class="con_in_txt"><strong>쿠키의 설치/운영 및 거부:</strong></p>
					<ul class="hy_list">
						<li>이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</li>
				              <li>쿠키 설정을 거부하는 방법으로는 이용자가 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</li>
				              <li>설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 <strong>도구 &#62; 인터넷 옵션 &#62; 개인정보</strong></li>
				              <li>다만, 쿠키의 저장을 거부할 경우에는 <span class="uline">로그인이 필요한 일부 서비스는 이용에 어려움</span>이 있을 수 있습니다.</li>
				          </ul>
				          
				          <h5 class="con_in_tit01 mt50">6. 개인정보의 열람, 정정 및 탈퇴</h5>
				          <p class="con_in_txt">회원님은 언제든지 제공된 개인 정보를 열람, 정정, 삭제를 요청하실 수 있습니다.<br>
				          개인 정보 열람 및 정정은 '홈페이지'에 로그인하신 후 <strong>개인정보조회/수정-회원탈퇴 메뉴</strong>를 통해 스스로 처리하실 수 있습니다.<br>
				          개인 정보 관련하여 불만이나 의견이 있으신 분은 개인 정보 관리 담당자에게 의견을 주시면 접수 즉시 조치하고 처리 결과를 통보해 드리겠습니다.</p>
				
				          <h5 class="con_in_tit01 mt50">7. 만 14세 미만 아동의 개인정보보호</h5>
				          <p class="con_in_txt">병원 홈페이지에서는 만 14세 미만 아동의 개인정보보호를 위해 온라인 회원가입을 받지 않습니다.<br> 
					만 14세 미만 아동의 경우는 법적 보호자가 대신 진료나 검진 예약을 할 수 있습니다.</p>
				
					<h5 class="con_in_tit01 mt50">8. 개인정보침해 관련 상담 및 신고</h5>
				          <p class="con_in_txt">개인정보침해에 대한 신고 &middot; 상담이 필요하신 경우에는 정보통신부 산하 공공기관인 한국정보보호진흥원(KISA)내 개인정보침해신고센터로 문의하시기 바랍니다.</p>
				          <h6 class="con_in_tit09">&#91;개인정보침해 신고센터&#93;</h6>
					<p class="con_in_txt">전화 : 국번없이 118<br>
						URL : <a href="http://privacy.kisa.or.kr" target="_blank">privacy.kisa.or.kr</a></p>
				
				
					<h5 class="con_in_tit01 mt50">9. 개인 정보 관리 책임자</h5>
				          <p class="con_in_txt">병원은 고객의 개인정보보호를 매우 소중하게 생각하며, 고객의 개인정보가 훼손, 침해 또는 누설되지 않도록 최선을 다하고 있습니다.<br>
					그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다.</p>
				          <p class="con_in_txt">고객이 개인정보보호 담당자와 연락을 원하실 경우 아래의 연락처 또는 이메일로 연락을 주시면 개인정보 관련 문의사항에 대하여 신속하고 성실하게 답변해 드리겠습니다.</p>
				          <h6 class="con_in_tit09">개인정보 보호책임자</h6>
					<ul class="hy_list">
						<li>성명 : 병원장 홍성수</li>
						<li>전화번호 : 02-519-8800</li>
						<li>이메일 : <a href="mailto:sshong@namu.com">sshong@namu.com</a></li>
				          </ul>
				          <h6 class="con_in_tit09">개인정보 보호 실무담당자</h6>
					<ul class="hy_list">
						<li>성명 : 운영팀 전수경 실장</li>
						<li>전화번호 : 02-519-8925</li>
						<li>이메일 : <a href="mailto:jineyjun@namu.com">jineyjun@namu.com</a></li>
				          </ul>
				
				          <h5 class="con_in_tit01 mt50">10. 정책 변경에 따른 공지의무</h5>
				          <p class="con_in_txt">이 개인정보취급방법은 <strong>2008년 8월 11일에 제정</strong>되었으며 정부의 법령 &middot; 정책 또는 보안기술의 변경에 따라 내용의 추가 &middot; 삭제 및 수정이 있을 시에는<br>
				          개정 최소 7일 전에 병원 홈페이지를 통해 변경사유 및 내용 등을 고지할 것입니다.</p>
				</div>
				<p>
					<input type="checkbox" id="necessary">
					<label for="necessary">개인정보 수집 및 활용동의(필수)</label>
				</p>

				<div class="btn_Lbox">
					<a href="#none" class="btn bblue" id="phoneAuth">비회원 예약&middot;조회</a>
				</div>
			</section>
		</section>
	</form>
	
</div>
		
<script type="text/javascript" src="/js/fbcms/user/jquery.mCustomScrollbar.concat.min.js"></script><!-- 스크롤 -->

<script>
	// 스크롤
	$(window).on("load",function(){
		$.mCustomScrollbar.defaults.scrollButtons.enable=true;
		$.mCustomScrollbar.defaults.axis="yx";
		$(".s01").mCustomScrollbar({theme:"minimal-dark"});
		
		$("#phoneAuth").on("click",function(){
			if($('#APPO_PRSN_NM').val() === '') {
				alert('환자분의 성함을 입력해 주세요.');
				return;
			} else if($('#fCtn').val() === '' || $('#mCtn').val() === '' || $('#mCtn').val().length < 3 || $('#lCtn').val() === '' || $('#lCtn').val().length < 4) {
				alert('휴대폰 번호를 입력해 주세요.');
				return;
			} else if($('#necessary').is(':checked') == false) {
				alert('개인정보 수집 및 활용동의가 필요합니다.');
				return;
			}
			var URL = "<c:url value='/danal/Ready.do'/>";
			var popupName = "_blank";
			var popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
			
			window.open(URL, popupName, popupOptions);
		});
		
		$('#fCtn').change(function() {
			$('#MOBILE_PHONE_NO').val($('#fCtn').val()+'-'+$('#mCtn').val()+'-'+$('#lCtn').val());
		});
		$('#mCtn').change(function() {
			$('#MOBILE_PHONE_NO').val($('#fCtn').val()+'-'+$('#mCtn').val()+'-'+$('#lCtn').val());
		});
		$('#lCtn').change(function() {
			$('#MOBILE_PHONE_NO').val($('#fCtn').val()+'-'+$('#mCtn').val()+'-'+$('#lCtn').val());
		});
		$('#APPO_PRSN_NM').change(function() {
			$(this).val($(this).val().replace(/[^a-zA-z가-힣]/g,""));
		});
		$('#mCtn').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$('#lCtn').keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	});

// 본인인증 완료 후 처리
function fnNextStep(tid, name, iden, phone) {
	let inputPhone = $("#fCtn").val()+$("#mCtn").val()+$("#lCtn").val();
	let birthDt = iden.substr(0,6);
	let genderCd = iden.substr(6,1);
	if(inputPhone == phone && $('#APPO_PRSN_NM').val() == name) {
		if(genderCd == "1" || genderCd == "5") {		// 1900년대 남자(국내,외국인)
			$("input[name=GENDER_CD]").val("M");
			$("input[name=BIRTH_DT]").val("19"+birthDt);
		}
		else if(genderCd == "2" || genderCd == "6") {	// 1900년대 여자(국내,외국인)
			$("input[name=GENDER_CD]").val("F");
			$("input[name=BIRTH_DT]").val("19"+birthDt);
		}
		else if(genderCd == "3" || genderCd == "7") {	// 2000년대 남자(국내,외국인)
			$("input[name=GENDER_CD]").val("M");
			$("input[name=BIRTH_DT]").val("20"+birthDt);
		}
		else if(genderCd == "4" || genderCd == "8") {	// 2000년대 여자(국내,외국인)
			$("input[name=GENDER_CD]").val("F");
			$("input[name=BIRTH_DT]").val("20"+birthDt);
		}
		document.reservationForm.action = "<c:url value='/user/cts/rsv/nonMemberReservationMain.do'/>";
		document.reservationForm.submit();
	}
}

</script>
