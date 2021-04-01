package fbcms.user.cts.rsv.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.rcm.cpm.service.impl.CheckupVO;
import fbcms.com.cmm.mod.service.impl.UserMBIDAO;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.cts.rsv.service.ScheduleVO;
import fbcms.user.cts.rsv.service.UserCheckupVO;
import fbcms.user.cts.rsv.service.UserClinicVO;
import fbcms.user.cts.rsv.service.UserReservationService;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.lgn.MembersVO;

@Service("UserReservationService")
public class UserReservationServiceImpl extends EgovAbstractServiceImpl implements UserReservationService{
	@Autowired
	UserReservationDAO userReservationDAO;
	@Autowired
	UserReservationMSDAO userReservationMSDAO;
	@Autowired
	AdminOcsCTMDAO adminOcsCTMDAO;
	@Autowired
	UserMBIDAO userMBIDAO;
	/**
	 * 예약 조회 리스트
	 */
	@Override
	public List<ReservationVO> selectRSVList(ReservationVO reservationVO) throws Exception {
		return (List<ReservationVO>) userReservationDAO.selectRSVList(reservationVO);
	}
	/**
	 * 예약  조회 리스트 total Count
	 */
	public int selectRSVListTotCnt(ReservationVO reservationVO) throws Exception{
		return userReservationDAO.selectRSVListTotCnt(reservationVO);
	}
	/**
	 * 예약 상세 조회
	 */
	public AppointmentVO selectRSV(AppointmentVO appointmentVO) throws Exception{
		
		if("01".equals(appointmentVO.getAPPO_GUBN_CD())) {
			String MNG_CD = appointmentVO.getMEDI_SBJ_CD();
			
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			appointmentVO.setMEDI_SBJ_NM(NM);
		}
		
		return (AppointmentVO) userReservationDAO.selectRSV(appointmentVO);
	}
	/**
	 * 예약 수정
	 */
	public int updateRSV(AppointmentVO appointmentVO) {
		
		// 수정 전 기존 데이터 가져오기
		AppointmentVO tempVo = new AppointmentVO();
		AppointmentVO updateVo = new AppointmentVO();
		updateVo = appointmentVO;
		
		try {
			
			tempVo = userReservationDAO.selectRSV(appointmentVO);
			
			MembersVO membersVO = new MembersVO();
			membersVO.setMBER_ID(appointmentVO.getUSER_ID());
			membersVO = userMBIDAO.selectMember(membersVO);
			
			if("01".equals(appointmentVO.getAPPO_GUBN_CD())) {
				UserClinicVO resVo = new UserClinicVO();
				AppointmentVO nPidVo = userReservationMSDAO.selectClinicPatientNPID(tempVo);
				if(nPidVo != null) {
					// TS211 Table에 예약된 정보조회
					resVo = userReservationMSDAO.cancelClinicPatientNPID(nPidVo);
					
				} else {
					// TS21 Table에 예약된 정보조회 및 처리
					appointmentVO.setMOBILE_PHONE_NO(membersVO.getMBTLNUM());
					UserClinicVO pidVo = userReservationMSDAO.selectPidFullCTN(appointmentVO);
					
					if(pidVo != null) {
						tempVo.setPID(pidVo.getPID());
						tempVo.setEmrKey(tempVo.getAPPO_DT()+","+tempVo.getPID()+","+tempVo.getMEDI_SBJ_CD()+","+tempVo.getAPPO_TIME()+"00");
						updateVo.setPID(pidVo.getPID());
						resVo = userReservationMSDAO.cancelClinicPatient(tempVo);
					}else {
						return 503;
					}
				}
				if(resVo.getErrYn() != null) {
					// ts21
					if("N".equals(resVo.getErrYn()) || "이미 취소된 내역입니다. 취소할 수 없습니다.".equals(resVo.getErrMsg())) {
						// 취소처리가 성공했을 시 업데이트를 한다.
						resVo = userReservationMSDAO.updateClinicPatient(updateVo);
						if("N".equals(resVo.getErrYn()) || "이미 취소된 내역입니다. 취소할 수 없습니다.".equals(resVo.getErrMsg())) {
							userReservationDAO.updateRSV(updateVo);
							return 200;
						}
						return 501;
					}
				} else {
					// ts211
					updateVo.setPID("NNNNNNNNN");
					String jumin = appointmentVO.getBIRTH_DT().substring(2, 8);
					switch (appointmentVO.getGENDER_CD()) {
					case "M":
						jumin += "1000000";
						break;

					case "F":
						jumin += "2000000";
						break;
					}
					updateVo.setBIRTH_DT(jumin);
					resVo = userReservationMSDAO.updateClinicPatientNPID(updateVo);
					updateVo.setBIRTH_DT(tempVo.getBIRTH_DT());
					userReservationDAO.updateRSV(updateVo);
					return 200;
				}
			} else {
				userReservationDAO.updateRSV(updateVo);
				return 200;
			}
		} catch (Exception e) {
			return 502;
		}
		return 500;
	}
	/*진료 예약 리스트 코멘트*/
	@Override
	public EgovMap selectDrScheduleComment(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return userReservationDAO.selectDrScheduleComment(doctorTimeTableVO);
	}
	/*진료 예약 리스트*/
	@Override
	public List selectDrScheduleList(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return userReservationDAO.selectDrScheduleList(doctorTimeTableVO);
	}
	
	/*의료진 리스트*/
	@Override
	public List selectDrInfo(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return userReservationDAO.selectDrInfo(doctorTimeTableVO);
	}
	/*예약 정보 리스트*/
	@Override
	public List selectDrScheduleInfo(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return userReservationDAO.selectDrScheduleInfo(doctorTimeTableVO);
	}
	/*의사 이름 리스트*/
	@Override
	public DoctorTimeTableVO selectDrNM(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return (DoctorTimeTableVO)userReservationDAO.selectDrNM(doctorTimeTableVO);
	}
	/*진료과 선택 리스트*/
	@Override
	public List<ReservationVO> selectMediSbjList() throws Exception {
		return userReservationDAO.selectMediSbjList();
	}
	/*의료진 선택 리스트*/
	@Override
	public List<ReservationVO> selectMediDrList(ReservationVO reservationVO) throws Exception {
		return userReservationDAO.selectMediDrList(reservationVO);
	}
	/*의료진 진료일정표*/
	@Override
	public List<ScheduleVO> selectTE04DTCalendarMonth(ScheduleVO scheduleVO) throws Exception {
		return userReservationMSDAO.selectTE04DTCalendarMonth(scheduleVO);
	}
	/*의료진 진료일정표*/
	@Override
	public List<ScheduleVO> selectTE04DTCalendar(ScheduleVO scheduleVO) throws Exception {
		return userReservationMSDAO.selectTE04DTCalendar(scheduleVO);
	}
	/*의료진 진료일정 상세*/
	@Override
	public List<ScheduleVO> selectTE04DTSchedule(ScheduleVO scheduleVO) throws Exception {
		return userReservationMSDAO.selectTE04DTSchedule(scheduleVO);
	}
	/*검진예약 가능 리스트*/
	@Override
	public List<CheckupVO> selectEXMNList() {
		return userReservationDAO.selectEXMNList();
	}
	/*PID 조회*/
	@Override
	public UserClinicVO selectPid(UserClinicVO userClinicVO) {
		/*validation check*/
		
		/*본인이 아닐 때 성별, 관계 선택이 누락되면 null return*/
		if(!userClinicVO.getReservation().equals("me")) {
			if(userClinicVO.getGender() == null || userClinicVO.getAPPO_RLT_CD() == null) {
				return null;
			}
		}
		/*이름,생년월일,휴대폰번호*/
		if(userClinicVO.getUsrNm() == null || userClinicVO.getUsrBd() == null || userClinicVO.getfCtn() == null || userClinicVO.getmCtn() == null || userClinicVO.getlCtn() == null) {
			return null;
		}
		return userReservationMSDAO.selectPid(userClinicVO);
	}
	@Override
	public UserClinicVO insertClinicPatient(UserClinicVO userClinicVO) {
		if("NNNNNNNNN".equals(userClinicVO.getPID())) {
			// ts211
			String jumin = userClinicVO.getUsrBd().substring(2, 8);
			String tempBtdt = userClinicVO.getUsrBd();
			switch (userClinicVO.getGender()) {
			case "M":
				jumin += "1000000";
				break;

			case "F":
				jumin += "2000000";
				break;
			}
			userClinicVO.setUsrBd(jumin);
			UserClinicVO resVo = userReservationMSDAO.insertClinicPatientNPID(userClinicVO);
			userClinicVO.setUsrBd(tempBtdt);
			return resVo;
		} else {
			// ts21
			return userReservationMSDAO.insertClinicPatient(userClinicVO);
		}
	}
	@Override
	public UserClinicVO cancelClinicPatient(AppointmentVO appointmentVO) {
		if("NNNNNNNNN".equals(appointmentVO.getPID())) {
			// ts211
			String jumin = appointmentVO.getBIRTH_DT().substring(2, 8);
			String tempBtdt = appointmentVO.getBIRTH_DT();
			switch (appointmentVO.getGENDER_CD()) {
			case "M":
				jumin += "1000000";
				break;

			case "F":
				jumin += "2000000";
				break;
			}
			appointmentVO.setBIRTH_DT(jumin);
			UserClinicVO resVo = userReservationMSDAO.cancelClinicPatientNPID(appointmentVO);
			appointmentVO.setBIRTH_DT(tempBtdt);
			return resVo;
		} else {
			// ts21
			return userReservationMSDAO.cancelClinicPatient(appointmentVO);
		}
	}
	@Override
	public List<ReservationVO> selectMediDrListAll() {
		return userReservationDAO.selectMediDrListAll();
	}
	@Override
	public DRListVO DrDeInfo(String DR_ID) throws Exception {
		return userReservationDAO.DrDeInfo(DR_ID);
	}
	/*이번달 캘린더 정보 가져오기*/
	@Override
	public List<UserCheckupVO> selectCheckupCalendar(UserCheckupVO userCheckupVO) {
		return userReservationDAO.selectCheckupCalendar(userCheckupVO);
	}
	/*성별정보 로그인사용자일경우 가져오기*/
	@Override
	public UserCheckupVO selectUserGender(UserCheckupVO userCheckupVO) {
		return userReservationDAO.selectUserGender(userCheckupVO);
	}
	/*검진예약 등록*/
	@Override
	public int insertCheckup(UserCheckupVO userCheckupVO) {
		if(userReservationDAO.existCheckup(userCheckupVO) > 0) {
			return 0;
		} else {
			return userReservationDAO.insertCheckup(userCheckupVO);
		}
	}
	/*예약건수 가져오기*/
	@Override
	public int selectResListTotCnt(AppointmentVO appointmentVO) {
		return userReservationDAO.selectResListTotCnt(appointmentVO);
	}
	/*예약 리스트 가져오기*/
	@Override
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO) {
		
		List<AppointmentVO> resList = userReservationDAO.selectResList(appointmentVO);
		
		
		for(int i=0; i<resList.size(); i++) {
			String MNG_CD = resList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			resList.get(i).setMEDI_SBJ_NM(NM);
		}
		
		return userReservationDAO.selectResList(appointmentVO);
	}
	/*로그인 사용자 유저 정보 가져오기*/
	@Override
	public AppointmentVO selectLoginUserInfo(AppointmentVO appointmentVO) {
		return userReservationDAO.selectLoginUserInfo(appointmentVO);
	}
	/*검진예약 정보 불러오기*/
	@Override
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO) {
		return userReservationDAO.selectChkUpList(appointmentVO);
	}
	/*로그인 사용자 예약정보 불러오기*/
	@Override
	public List<AppointmentVO> selectUserResList(AppointmentVO appointmentVO) {
		
		List<AppointmentVO> uResList = userReservationDAO.selectUserResList(appointmentVO);
		
		
		for(int i=0; i<uResList.size(); i++) {
			String MNG_CD = uResList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			uResList.get(i).setMEDI_SBJ_NM(NM);
		}
		
		return uResList;
	}
	/*페이징 처리 카운트 가져오기*/
	@Override
	public int selectUserResListTotCnt(AppointmentVO appointmentVO) {
		return userReservationDAO.selectUserResListTotCnt(appointmentVO);
	}
	/*예약 취소*/
	@Override
	public int updateReservationCancel(AppointmentVO appointmentVO) {
		try {
			AppointmentVO tempVo = new AppointmentVO();
			tempVo = userReservationDAO.selectRSV(appointmentVO);
			appointmentVO.setAPPO_GUBN_CD(tempVo.getAPPO_GUBN_CD());
			tempVo.setSearchKeyword(appointmentVO.getSearchKeyword());
			tempVo.setUPDT_ID(appointmentVO.getUPDT_ID());
			if("01".equals(tempVo.getAPPO_GUBN_CD())) {
				AppointmentVO nPidVo = userReservationMSDAO.selectClinicPatientNPID(tempVo);
				if(nPidVo != null) {
					// TS211
					UserClinicVO resVo = userReservationMSDAO.cancelClinicPatientNPID(nPidVo);
					if(resVo == null) {
						return 500;
					}
				} else {
					// TS21
					tempVo.setUSER_NM(tempVo.getAPPO_PRSN_NM());
					UserClinicVO pidVo = userReservationMSDAO.selectPidFullCTN(tempVo);
					if(pidVo == null || pidVo.getPID() == null) {
						return 501;
					}
					tempVo.setPID(pidVo.getPID());
					tempVo.setEmrKey(tempVo.getAPPO_DT() + "," + tempVo.getPID() + "," + tempVo.getMEDI_SBJ_CD() + "," + tempVo.getAPPO_TIME() + "00");
					UserClinicVO resVo = userReservationMSDAO.cancelClinicPatient(tempVo);
					if(resVo == null) {
						return 500;
					}
				}
			}
			tempVo.setDEL_YN("Y");
			userReservationDAO.updateReservationCancel(tempVo);
			return 200;
		} catch (Exception e) {
			return 502;
		}
	}
	/*클리닉 Mariadb 등록*/
	@Override
	public int insertClinic(UserClinicVO userClinicVO) {
		return userReservationDAO.insertClinic(userClinicVO);
	}
}
