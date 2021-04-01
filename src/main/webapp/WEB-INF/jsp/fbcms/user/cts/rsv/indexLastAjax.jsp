<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<tbody id="AMSchedule">
					<c:forEach items="${ScheduleList }" var="scheduleInfo">
						<tr>
							<th scope="row">${scheduleInfo.DR_NM}</th>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_MON eq 'Y' and not empty scheduleInfo.AM_MON_BIGO}">
										${scheduleInfo.AM_MON_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_MON eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>

								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_TUE eq 'Y' and not empty scheduleInfo.AM_TUE_BIGO}">
										${scheduleInfo.AM_TUE_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_TUE eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_WED eq 'Y' and not empty scheduleInfo.AM_WED_BIGO}">
										${scheduleInfo.AM_WED_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_WED eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_THU eq 'Y' and not empty scheduleInfo.AM_THU_BIGO}">
										${scheduleInfo.AM_THU_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_THU eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_FRI eq 'Y' and not empty scheduleInfo.AM_FRI_BIGO}">
										${scheduleInfo.AM_FRI_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_FRI eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
							<td><c:choose>
									<c:when
										test="${scheduleInfo.AM_SAT eq 'Y' and not empty scheduleInfo.AM_SAT_BIGO}">
										${scheduleInfo.AM_SAT_BIGO }
									</c:when>
									<c:when test="${scheduleInfo.AM_SAT eq 'Y' }">
										<img src="/images/fbcms/user/ico_tam.png" alt="오전">
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>