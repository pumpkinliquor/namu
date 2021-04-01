package fbcms.user.cts.rsv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.cts.rsv.service.ScheduleVO;
import fbcms.user.cts.rsv.service.UserClinicVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 예약 - MS-SQL DAO
 * @author 엄국현
 *
 */
@Repository("UserReservationMSDAO")
public class UserReservationMSDAO extends EgovComAbstractDAO {
	
	@Resource(name="egov.sqlSessionOCS")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
	
	/**
	 * 의료진 진료시간표
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTCalendarMonth(ScheduleVO scheduleVO) {
		return selectList("UserReservationMSDAO.selectTE04DTCalendarMonth", scheduleVO);
	}
	/**
	 * 의료진 예약가능 일자
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTCalendar(ScheduleVO scheduleVO) {
		return selectList("UserReservationMSDAO.selectTE04DTCalendar", scheduleVO);
	}
	/**
	 * 의료진 예약가능 상세
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTSchedule(ScheduleVO scheduleVO) {
		return selectList("UserReservationMSDAO.selectTE04DTSchedule", scheduleVO);
	}
	/**
	 * 사용자 정보로 PID 가져옴
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO selectPid(UserClinicVO userClinicVO) {
		return selectOne("UserReservationMSDAO.selectPID", userClinicVO);
	}
	
	/**
	 * 프로시저 예약 등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO insertClinicPatient(UserClinicVO userClinicVO) {
		return selectOne("UserReservationMSDAO.insertClinicPatient", userClinicVO);
	}
	/**
	 * PID 없는 사용자 프로시저 예약 등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO insertClinicPatientNPID(UserClinicVO userClinicVO) {
		return selectOne("UserReservationMSDAO.insertClinicPatientNPID", userClinicVO);
	}
	/**
	 * 프로시저 예약취소 등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO cancelClinicPatient(AppointmentVO appointmentVO) {
		return selectOne("UserReservationMSDAO.cancelClinicPatient", appointmentVO);
	}
	
	/**
	 * PID 없는 사용자 프로시저 예약취소 등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO cancelClinicPatientNPID(AppointmentVO appointmentVO) {
		return selectOne("UserReservationMSDAO.cancelClinicPatientNPID", appointmentVO);
	}

	/**
	 * 프로시저 재등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO updateClinicPatient(AppointmentVO updateVo) {
		return selectOne("UserReservationMSDAO.updateClinicPatient", updateVo);
	}
	
	/**
	 * PID 없는 사용자 프로시저 재등록
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO updateClinicPatientNPID(AppointmentVO updateVo) {
		return selectOne("UserReservationMSDAO.updateClinicPatientNPID", updateVo);
	}

	public UserClinicVO selectPidFullCTN(AppointmentVO appointmentVO) {
		return selectOne("UserReservationMSDAO.selectPIDFullCTN", appointmentVO);
	}

	/**
	 * WEB 등록건 정보 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public AppointmentVO selectClinicPatientNPID(AppointmentVO appointmentVO) {
		return selectOne("UserReservationMSDAO.selectClinicPatientNPID", appointmentVO);
	}
}
