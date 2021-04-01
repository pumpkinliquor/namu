<%--
	Class Name : userPopup.jsp
	Description : 사용자 모바일 팝업
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
	
	<c:if test="${not empty mainPopupList and (empty mainPopupCookie01 or empty mainPopupCookie02)}">
		<c:forEach var="mainPopupInfo" items="${mainPopupList}" begin="0" end="1" varStatus="status">
			<div class="m_layer">
				<c:choose>
					<c:when test="${status.count eq 1 and not empty mainPopupCookie01}"></c:when>
					<c:when test="${status.count eq 2 and not empty mainPopupCookie02}"></c:when>
					<c:otherwise>
						<div class="layer_con">
							<c:choose>
								<c:when test="${mainPopupInfo.fileUrl eq '' }">
									<img src="/getImage/${mainPopupInfo.listFile[1].streFileNm }" alt="<c:out value='${mainPopupInfo.popupTitleNm}'/>">
								</c:when>
								<c:otherwise>
									<a href="<c:out value='${mainPopupInfo.fileUrl}'/>"<c:if test="${mainPopupInfo.popupTargetYn eq 'Y' }"> target="_blank"</c:if>>
										<img src="/getImage/${mainPopupInfo.listFile[1].streFileNm }" alt="<c:out value='${mainPopupInfo.popupTitleNm}'/>">
									</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="layer_foot">
							<a href="#none" onclick="javascript:fnMainPopupClose('vievis_mainPopup0${status.count}', 'todayClose0${status.count}')" class="close_today">오늘 하루 보기 않기</a>
							<a href="javascript:void(0);" class="close_layer">닫기</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
		<script>
			$(document).ready(function() {
				//layer popup
				$('#wrap').after('<div class="dim"/>');
				/* if($('.m_layer').height() > 0) {
					$('.m_layer').css('margin-top',- $('.m_layer').height() / 2);
				} else {
					$('.m_layer img').load(function () {
						$('.m_layer').css('margin-top',- $('.m_layer').height() / 2);	
					});
				} */
				$('body').css('overflow','hidden');
				
				$('.layer_foot a').click(function(){
					var layerP = $('.m_layer').length;
					$(this).parent().parent().remove();
					if(layerP <= 1){
						$('.dim').remove();
						$('body').css('overflow','');
					}
				});
			});
			
			window.onload = function() {
				$('.m_layer').css('margin-top',- $('.m_layer').height() / 2);	
				/* if($('.m_layer > div').length > 1) {
					$('.m_layer').css({
						left: $(window).outerWidth()/2 - ($('.m_layer').outerWidth() + $('.m_layer').outerWidth() + 50)/2,
						top: $(window).outerHeight()/2 - $('.m_layer').outerHeight()/2
					});
					$('.m_layer').css({
						left: $('.m_layer').outerWidth() + 50
					});
				} else if($('.m_layer > div').length > 0) {
					$('.m_layer').css({
						left: $(window).outerWidth()/2 - $('.m_layer').outerWidth()/2,
						top: $(window).outerHeight()/2 - $('.m_layer').outerHeight()/2
					});
				} */
			};
			
			function fnMainPopupClose(id, checkboxId) {
				fnSetCookie(id, 1, 1 );
			}
		</script>
	</c:if>
	