package fbcms.user.cts.rsv.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.rcm.cpm.service.impl.CheckupVO;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.cts.rsv.service.UserCheckupVO;
import fbcms.user.cts.rsv.service.UserClinicVO;
import fbcms.user.hpm.hpm.DRListVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 예약
 * @author 김명진
 *
 */
@Repository("UserReservationDAO")
public class UserReservationDAO extends EgovComAbstractDAO {
	/**
	 * 진료예약 리스트 SELECT
	 * @param reservationVO
	 * @return
	 */
	public List<?> selectRSVList(ReservationVO reservationVO){
		return selectList("UserReservationDAO.selectUserReservationList",reservationVO);
	}
	/**
	 * 진료예약 리스트 total count
	 * @param reservationVO
	 * @return 
	 */
	public int selectRSVListTotCnt(ReservationVO reservationVO) {
		return (int)selectOne("UserReservationDAO.selectUserReservationTotCnt",reservationVO);
	}
	/**
	 * 진료예약 상세 SELECT
	 * @param appointmentVO
	 * @return UserReservationVO
	 */
	public AppointmentVO selectRSV(AppointmentVO appointmentVO) {
		return (AppointmentVO)selectOne("UserReservationDAO.selectUserReservation",appointmentVO);
	};
	
	public int updateRSV(AppointmentVO appointmentVO) {
		return update("UserReservationDAO.updateUserReservation",appointmentVO);
	}
	/**
	 * 진료예약 스케쥴 SELECT
	 * @param doctorTimeTableVO
	 * @return DoctorTimeTableVO
	 */
	public List selectDrScheduleList(DoctorTimeTableVO doctorTimeTableVO) {
		return selectList("AdminDRMDAO.selectDrScheduleList", doctorTimeTableVO);
	}
	/**
	 * 의사정보 리스트 SELECT
	 * @param doctorTimeTableVO
	 * @return DoctorTimeTableVO
	 */
	public List selectDrInfo(DoctorTimeTableVO doctorTimeTableVO) {
		return selectList("AdminDRMDAO.selectDrInfo", doctorTimeTableVO);
	}
	/**
	 * 의료진 진료 시간표 리스트 코멘트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public EgovMap selectDrScheduleComment(DoctorTimeTableVO doctorTimeTableVO) {
		return selectOne("AdminDRMDAO.selectDrScheduleComment", doctorTimeTableVO);
	}
	/**
	 * 예약 리스트 SELECT
	 * @param doctorTimeTableVO
	 * @return DoctorTimeTableVO
	 */
	public List selectDrScheduleInfo(DoctorTimeTableVO doctorTimeTableVO) {
		return selectList("AdminDRMDAO.selectDrScheduleInfo", doctorTimeTableVO);
	}
	/**
	 * 진료과 선택 리스트
	 * @return
	 */
	public List<ReservationVO> selectMediSbjList() {
		return selectList("UserReservationDAO.selectMediSbjList");
	}
	/**
	 * 의료진 선택 리스트
	 * @param reservationVO
	 * @return
	 */
	public List<ReservationVO> selectMediDrList(ReservationVO reservationVO) {
		return selectList("UserReservationDAO.selectMediDrList", reservationVO);
	}
	
	/**
	 * 의사 이름 SELECT
	 * @param doctorTimeTableVO
	 * @return DoctorTimeTableVO
	 */
	public DoctorTimeTableVO selectDrNM(DoctorTimeTableVO doctorTimeTableVO) {
		return selectOne("AdminDRMDAO.selectDrNM", doctorTimeTableVO);
	}
	/**
	 * 검진 리스트
	 * @return
	 */
	public List<CheckupVO> selectEXMNList() {
		return selectList("UserReservationDAO.selectEXMNList");
	}
	public List<ReservationVO> selectMediDrListAll() {
		return selectList("UserReservationDAO.selectMediDrListAll");
	}
	
	public DRListVO DrDeInfo(String DR_ID) {
		return selectOne("UserReservationDAO.DrDeInfo", DR_ID);
	}
	/**
	 * 달력에 체크가능여부를 가져온다.
	 * @param userCheckupVO
	 * @return
	 */
	public List<UserCheckupVO> selectCheckupCalendar(UserCheckupVO userCheckupVO) {
		return selectList("UserReservationDAO.selectCheckupCalendar", userCheckupVO);
	}
	/**
	 * 등록 전 로그인되어있는 경우 성별을 가져온다.
	 * @param userCheckupVO
	 * @return
	 */
	public UserCheckupVO selectUserGender(UserCheckupVO userCheckupVO) {
		return selectOne("UserReservationDAO.selectUserGender", userCheckupVO);
	}
	/**
	 * 
	 * @param userCheckupVO
	 * @return
	 */
	public int existCheckup(UserCheckupVO userCheckupVO) {
		return (int)selectOne("UserReservationDAO.existCheckup", userCheckupVO);
	}
	/**
	 * 
	 * @param userCheckupVO
	 * @return
	 */
	public int insertCheckup(UserCheckupVO userCheckupVO) {
		return insert("UserReservationDAO.insertCheckup", userCheckupVO);
	}
	/**
	 * 예약 리스트 카운팅
	 * @param appointmentVO
	 * @return
	 */
	public int selectResListTotCnt(AppointmentVO appointmentVO) {
		try {
			return selectOne("UserReservationDAO.selectResListTotCnt", appointmentVO);
		} catch (Exception e) {
			return 0;
		}
	}
	/**
	 * 예약 리스트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO) {
		return selectList("UserReservationDAO.selectResList", appointmentVO);
	}
	/**
	 * 로그인 사용자 정보 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public AppointmentVO selectLoginUserInfo(AppointmentVO appointmentVO) {
		return selectOne("UserReservationDAO.selectLoginUserInfo", appointmentVO);
	}
	/**
	 * 검진예약 정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO) {
		return selectList("UserReservationDAO.selectChkUpList", appointmentVO);
	}
	/**
	 * 로그인 사용자 예약정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectUserResList(AppointmentVO appointmentVO) {
		return selectList("UserReservationDAO.selectUserResList", appointmentVO);
	}
	/**
	 * 페이징 처리 카운트 가져오기
	 * 
	 * @param appointmentVO
	 * @return
	 */
	public int selectUserResListTotCnt(AppointmentVO appointmentVO) {
		try {
			return selectOne("UserReservationDAO.selectUserResListTotCnt", appointmentVO);
		} catch (Exception e) {
			return 0;
		}
	}
	/**
	 * 예약 취소
	 * @param appointmentVO
	 * @return
	 */
	public int updateReservationCancel(AppointmentVO appointmentVO) {
		return update("UserReservationDAO.updateReservationCancel",appointmentVO);
	}
	/**
	 * 클리닉 Mariadb 등록
	 * @param userClinicVO
	 * @return
	 */
	public int insertClinic(UserClinicVO userClinicVO) {
		return insert("UserReservationDAO.insertClinic", userClinicVO);
	}
	
}
