<%--
	Class Name : userFooter.jsp
	Description : 사용자 모바일 푸터
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
				<ul>
					<li><a href="/user/cmm/footer/sitemap.do">사이트맵</a></li>
					<li><a href="/user/cmm/footer/unpaid.do">비급여진료공개</a></li>
					<li><a href="/user/cmm/footer/privacy.do">개인정보 처리방침</a></li>
					<li><a href="/user/cmm/footer/terms.do">이용약관</a></li>
				</ul>
				<p>비에비스 나무병원<span>대표자:홍성수</span>사업자등록번호:211-10-54459</p>
				<address>주소 : 06117 서울시 강남구 논현로 627<br>대표전화 : <a href="tel:1577-7502">1577-7502</a></address>
				<p class="copyright">COPYRIGHT @ 2020 VIEVIS NAMUH ALL RIGHTS RESERVED.</p>
				<div class="sns">
					<jsp:include page="/user/cmm/footer/snsList.do" flush="false" />
				</div>
			</footer>

		</div>
		<!-- //wrap e -->
	</body>
</html>