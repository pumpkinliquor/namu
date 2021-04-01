<%--
	Class Name : userTopBanner.jsp
	Description : 사용자 탑배너
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
	
	<c:if test="${not empty mainTopBannerList and empty mainTopBannerCookie }">
		<div class="m_banner">
			<div class="w1200">
				<ul class="banner_box">
					<c:forEach var="topBannerInfo" items="${mainTopBannerList}" begin="0" end="4">
						<li>
							<a href="<c:out value='${topBannerInfo.linkUrl}'/>"<c:if test="${topBannerInfo.bannerTargetYn eq 'Y' }"> target="_blank"</c:if>>
								<img alt="<c:out value='${topBannerInfo.bannerNm}'/>" height="100px" src='<c:url value='/cmm/fms/getImage.do'/>?atchFileId=<c:out value="${topBannerInfo.bannerImageFile}"/>'>
							</a>
						</li>
					</c:forEach>
				</ul>
				<div>
					<input type="checkbox" value="1" id="today"><label for="today">오늘 하루 보지 않기</label>
					<a href="#none" onclick="javascript:fnTopBannerClose('vievis_topBanner')" class="close_banner">닫기</a>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				//banner
				var bann = $('.banner_box').bxSlider({
					mode:'vertical',
					auto: true,
					moveSlides: 1,
					slideMargin:0,
					infiniteLoop: true,
					speed:1000,
					pause:4000,
					touchEnabled: false,
					onSlideBefore: function() {
						bann.stopAuto();
						bann.startAuto({pause:4000});
					}
				});
				$('.close_banner').click(function(event) {
					$('.m_banner').slideUp('swing');
				});
			});
			
			function fnTopBannerClose(id) {
				if($('#today').is(':checked')) {
					fnSetCookie(id, $('#today').val(), 1 );
				}
			}
		</script>
	</c:if>
	
	<c:if test="${not empty mainPopupList and (empty mainPopupCookie01 or empty mainPopupCookie02)}">
		<div class="m_layer lay0${fn:length(mainPopupList) }">
			<c:forEach var="mainPopupInfo" items="${mainPopupList}" begin="0" end="1" varStatus="status">
				<c:choose>
					<c:when test="${status.count eq 1 and not empty mainPopupCookie01}"></c:when>
					<c:when test="${status.count eq 2 and not empty mainPopupCookie02}"></c:when>
					<c:otherwise>
						<div class="ml0${status.count}">
							<div class="layer_con">
							<c:choose>
								<c:when test="${mainPopupInfo.fileUrl eq '' }">
									<img src="/getImage/${mainPopupInfo.listFile[0].streFileNm }" alt="<c:out value='${mainPopupInfo.popupTitleNm}'/>">
								</c:when>
								<c:otherwise>
									<a href="<c:out value='${mainPopupInfo.fileUrl}'/>"<c:if test="${mainPopupInfo.popupTargetYn eq 'Y' }"> target="_blank"</c:if>>
										<img src="/getImage/${mainPopupInfo.listFile[0].streFileNm }" alt="<c:out value='${mainPopupInfo.popupTitleNm}'/>">
									</a>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="layer_foot">
								<input type="checkbox" id="todayClose0${status.count}" class="todayPopupClose" value="1">
								<label for="todayClose0${status.count}">오늘 하루 보기 않기</label>
								<a href="#none" onclick="javascript:fnMainPopupClose('vievis_mainPopup0${status.count}', 'todayClose0${status.count}')" class="close_layer">닫기</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<script>
			$(document).ready(function() {
				//layer popup
				var layerP = $('.m_layer > div').length;
				
				$('#wrap').after('<div class="dim"/>');
				if(layerP <= 0) {
					$('.dim').remove();
				}
				
				$('.close_layer').click(function() {
					$(this).parents('.m_layer > div').remove();
					lngL = $('.m_layer > div').length;
					if(lngL < 1){
						$('.dim, .m_layer').remove();
						//$('body').css('overflow','auto');
					}
				});
			});
			
			window.onload = function() {
				/* if($('.m_layer > div').length > 1) {
					$('.m_layer').css({
						left: $(window).outerWidth()/2 - ($('.m_layer .ml01').outerWidth() + $('.m_layer .ml02').outerWidth() + 50)/2,
						top: $(window).outerHeight()/2 - $('.m_layer .ml01').outerHeight()/2
					});
					$('.m_layer .ml02').css({
						left: $('.m_layer .ml01').outerWidth() + 50
					});
				} else if($('.m_layer > div').length > 0) {
					$('.m_layer').css({
						left: $(window).outerWidth()/2 - $('.m_layer .ml01').outerWidth()/2,
						top: $(window).outerHeight()/2 - $('.m_layer .ml01').outerHeight()/2
					});
				} */
			};
			
			function fnMainPopupClose(id, checkboxId) {
				if($('#'+checkboxId).is(':checked')) {
					fnSetCookie(id, 1, 1 );
				}
			}
		</script>
	</c:if>
	