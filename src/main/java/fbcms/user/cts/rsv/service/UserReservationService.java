package fbcms.user.cts.rsv.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.rcm.cpm.service.impl.CheckupVO;
import fbcms.user.hpm.hpm.DRListVO;

/**
 * 회원 예약 서비스
 * @author 김명진
 * @since 2020.10.06
 */
public interface UserReservationService {
	/**
	 * 진료 예약 리스트
	 * @return List<UserReservationVO> 
	 */
	public List<ReservationVO> selectRSVList(ReservationVO reservationVO) throws Exception;
	/**
	 * 진료 예약 리스트의 총 수
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	public int selectRSVListTotCnt(ReservationVO reservationVO) throws Exception;
	/**
	 * 진료 예약 상세
	 * @param appointmentVO
	 * @return
	 * @throws Exception
	 */
	public AppointmentVO selectRSV(AppointmentVO appointmentVO) throws Exception;
	/**
	 * 진료 예약 수정
	 * @param reservationVO
	 * @return
	 */
	public int updateRSV(AppointmentVO appointmentVO) throws Exception;
	/**
	 * 의료진 진료 시간표 리스트 코멘트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public EgovMap selectDrScheduleComment(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	/**
	 * 의료진 진료 시간표 리스트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public List selectDrScheduleList(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	/**
	 * 의료진 리스트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public List selectDrInfo(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	/**
	 * 의료진 예약  리스트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public List selectDrScheduleInfo(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	/**
	 * 의료진 이름
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public DoctorTimeTableVO selectDrNM(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	/**
	 * 진료과 선택 리스트
	 * @param
	 * @return
	 * @throws Exception
	 */
	public List<ReservationVO> selectMediSbjList() throws Exception;
	/**
	 * 의료진 선택 리스트
	 * @param reservationVO
	 * @return
	 * @throws Exception
	 */
	public List<ReservationVO> selectMediDrList(ReservationVO reservationVO) throws Exception;
	/**
	 * 의료진 진료시간표
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTCalendarMonth(ScheduleVO scheduleVO) throws Exception;
	/**
	 * 의료진 예약가능 일자
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTCalendar(ScheduleVO scheduleVO) throws Exception;
	/**
	 * 의료진 예약가능 상세
	 * @param scheduleVO
	 * @return
	 * @throws Exception
	 */
	public List<ScheduleVO> selectTE04DTSchedule(ScheduleVO scheduleVO) throws Exception;
	/**
	 * 검진 리스트
	 * 
	 * @param checkupVO
	 * @return
	 */
	public List<CheckupVO> selectEXMNList();
	/**
	 * PID 조회
	 * 
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO selectPid(UserClinicVO userClinicVO);
	
	public DRListVO DrDeInfo(String DR_ID) throws Exception;	
	/**
	 * 진료예약 등록 (OCS)
	 * 
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO insertClinicPatient(UserClinicVO userClinicVO);
	/**
	 * 진료예약취소 (OCS)
	 * 
	 * @param userClinicVO
	 * @return
	 */
	public UserClinicVO cancelClinicPatient(AppointmentVO appointmentVO);
	/**
	 * 의료진 전체 리스트
	 * 
	 * @return
	 */
	public List<ReservationVO> selectMediDrListAll();
	/**
	 * 검진 캘린더 리스트
	 * @param userCheckupVO
	 * @return
	 */
	public List<UserCheckupVO> selectCheckupCalendar(UserCheckupVO userCheckupVO);
	/**
	 * 유저 성별 가져오기
	 * @param userCheckupVO
	 * @return
	 */
	public UserCheckupVO selectUserGender(UserCheckupVO userCheckupVO);
	/**
	 * 검진예약 추가
	 * 
	 * @param userCheckupVO
	 * @return
	 */
	public int insertCheckup(UserCheckupVO userCheckupVO);
	/**
	 * 예약조회 처리할 카운트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public int selectResListTotCnt(AppointmentVO appointmentVO);
	/**
	 * 예약 리스트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO);
	/**
	 * 로그인 사용자 유저 정보 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public AppointmentVO selectLoginUserInfo(AppointmentVO appointmentVO);
	/**
	 * 로그인 사용자 검진예약 정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO);
	/**
	 * 로그인 사용자 예약정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectUserResList(AppointmentVO appointmentVO);
	/**
	 * 페이징 처리 카운트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public int selectUserResListTotCnt(AppointmentVO appointmentVO);
	/**
	 * 예약 취소
	 * 
	 * @param appointmentVO
	 * @return
	 */
	public int updateReservationCancel(AppointmentVO appointmentVO);
	/**
	 * 클리닉 Mariadb 등록
	 * 
	 * @param userClinicVO
	 */
	public int insertClinic(UserClinicVO userClinicVO);

}
