<%--
	Class Name : userFooter.jsp
	Description : 사용자 푸터
	Modification Information

	수정일                    수정자                 수정내용
	-------     --------    ---------------------------
	2020.09.01    KHC        최초 생성

	author   : KHC
	since    : 2020.09.01
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

				</div>
				<!-- //contents e -->
		
			</div>
			
			<!-- footer -->
			<footer>
				<div class="f_top w1200">
					<div class="location">
						<header>LOCATION</header>
						<ul>
							<li>
								<address>
									<em>06117</em>서울시 강남구 논현로 627
								</address>
							</li>
							<li><em>언주역</em>2번 출구 <span>도보 200m</span></li>
							<li><em>학동역</em>
								<p>
									4번 출구 <span>도보 480m</span><br>
									5번 출구 <span>241, 3412</span> "논현동고개" 하차<br>
									7번 출구 <span>147, 463, 4211</span> "논현동고개" 하차
								</p>
							</li>
						</ul>
					</div>
		
					<div class="contact">
						<div>
							<header>CONTACT</header>
							<p>1577-7502</p>
						</div>
		
						<div>
							<header>OFFICE HOUR</header>
							<ul>
								<li><em>외래진료</em>평일 08:00 - 17:00<span>토요일 08:00 - 13:00</span></li>
								<li><em>건강검진</em>평일 07:30 - 16:30<span>토요일 07:30 - 13:00</span></li>
								<li><em>점심시간</em>평일 13:00 - 14:00</li>
							</ul>
						</div>
					</div>
				</div>
		
				<div class="foot w1200">
					<ul>
						<li><a href="/user/itd/itd/vievis.do">병원소개</a></li>
						<li><a href="/user/cmm/footer/unpaid.do">비급여진료공개</a></li>
						<li><a href="/user/cts/pro/proof.do">제증명 발급</a></li>
						<li><a href="/user/cmm/footer/privacy.do">개인정보 처리방침</a></li>
						<li><a href="/user/cmm/footer/terms.do">이용약관</a></li>
						<li><a href="/user/cmm/footer/sitemap.do">사이트맵</a></li>
					</ul>
					<p>비에비스 나무병원<span>대표자:홍성수</span>사업자등록번호:211-10-54459</p>
					<p class="copyright">COPYRIGHT @ 2020 VIEVIS NAMUH ALL RIGHTS RESERVED.</p>
					<div class="sns">
						<jsp:include page="/user/cmm/footer/snsList.do" flush="false" />
					</div>
				</div>
			</footer>

		</div>
		<!-- //wrap e -->
	</body>
</html>