package fbcms.user.cts.rsv.web;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.AdminDRMService;
import fbcms.admin.hpm.drm.service.impl.AdminDRMDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.rcm.cpm.service.impl.CheckupVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.cts.rsv.service.ScheduleVO;
import fbcms.user.cts.rsv.service.UserCheckupVO;
import fbcms.user.cts.rsv.service.UserClinicVO;
import fbcms.user.cts.rsv.service.UserReservationService;
import fbcms.user.hpm.hpm.DRListVO;

/**
 * 회원 예약 리스트 컨트롤러
 * @author 김명진
 * @since 2020.10.06
 */
@Controller
public class UserReservationController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserReservationController.class);
	
	@Autowired
	UserReservationService userRSVService;
	
	@RequestMapping(value="/user/cts/rsv/userRSVMain.do")
	public String ReservationMain(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user == null || user.getId() == null) {
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVMain");
	}
	/**
	 * 예약 리스트를 보여준다.
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVList.do")
	public ModelAndView ReservationList(@ModelAttribute("appointmentVO") AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVList"));
		AppointmentVO appoUsrVo = new AppointmentVO();
		if(user == null || user.getId() == null) {
			mv.setViewName("redirect:/user/lgn/sin/userLogin.do");
			return mv;
		}
		String gubnCd = appointmentVO.getAPPO_GUBN_CD() == null ? "01" : appointmentVO.getAPPO_GUBN_CD();
		
		appoUsrVo.setUSER_ID(user.getId());
		appoUsrVo = userRSVService.selectLoginUserInfo(appoUsrVo);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		/* **************************
		 * 검진예약 조회 처리 Process
		 * **************************/
		//fnReservationDetail
		AppointmentVO appointmentVO1 = new AppointmentVO();
		if(appointmentVO != null && appointmentVO.getAPPO_GUBN_CD() != null && appointmentVO.getAPPO_GUBN_CD().equals("01")) {
			appointmentVO1 = appointmentVO;
		}
		appointmentVO1.setAPPO_GUBN_CD("01");
		appointmentVO1.setUSER_ID(user.getId());
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(appointmentVO1.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(appointmentVO1.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(appointmentVO1.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		appointmentVO1.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		appointmentVO1.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		appointmentVO1.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		/** 총 게시글 수*/
		int totCnt = userRSVService.selectUserResListTotCnt(appointmentVO1);
		paginationInfo.setTotalRecordCount(totCnt);
		List<AppointmentVO> rsvList = (List<AppointmentVO>) userRSVService.selectUserResList(appointmentVO1);
		model.addAttribute("reservationList", rsvList);
		model.addAttribute("reservationListTotCnt", totCnt);
		model.addAttribute("paginationInfo",paginationInfo);
		model.addAttribute("appointmentVO1",appointmentVO1);
		
		/* **************************
		 * 진료예약 처리 Process
		 * **************************/
		AppointmentVO appointmentVO2 = new AppointmentVO();

		if(appointmentVO != null && appointmentVO.getAPPO_GUBN_CD() != null && appointmentVO.getAPPO_GUBN_CD().equals("02")) {
			appointmentVO2 = appointmentVO;
		}
		appointmentVO2.setAPPO_GUBN_CD("02");
		appointmentVO2.setUSER_ID(user.getId());
		
		/** paging */
		PaginationInfo paginationInfo2 = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo2.setCurrentPageNo(appointmentVO2.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo2.setRecordCountPerPage(appointmentVO2.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo2.setPageSize(appointmentVO2.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		appointmentVO2.setFirstIndex(paginationInfo2.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		appointmentVO2.setLastIndex(paginationInfo2.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		appointmentVO2.setRecordCountPerPage(paginationInfo2.getRecordCountPerPage());
		
		/** 총 게시글 수*/
		int totCnt2 = userRSVService.selectUserResListTotCnt(appointmentVO2);
		paginationInfo2.setTotalRecordCount(totCnt2);
		List<AppointmentVO> rsvList2 = (List<AppointmentVO>) userRSVService.selectChkUpList(appointmentVO2);
		model.addAttribute("reservationList2", rsvList2);
		model.addAttribute("reservationListTotCnt2", totCnt2);
		model.addAttribute("paginationInfo2",paginationInfo2);
		model.addAttribute("appointmentVO2",appointmentVO2);
		// -------------- 예약조회 끝 --------------
		appointmentVO.setAPPO_GUBN_CD(gubnCd);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date();
		model.addAttribute("today", sdf.format(dt));
		model.addAttribute("result", request.getParameter("result"));
		return mv;
	}
	
	/**
	 * 예약 상세를 보여준다.
	 */
	@PostMapping(value="/user/cts/rsv/userRSVDetail.do")
	public ModelAndView ReservationDetail(@ModelAttribute("appointmentVO") AppointmentVO appointmentVO, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVDetail"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		mv.addObject("gubnCd", appointmentVO.getAPPO_GUBN_CD());
		
		appointmentVO = userRSVService.selectRSV(appointmentVO);
		mv.addObject("reservationDetail", appointmentVO);
		
		// 진료예약일 경우
		if("01".equals(appointmentVO.getAPPO_GUBN_CD())) {
			// 의료진 정보를 가져온다.
			List<ReservationVO> mediDrList = userRSVService.selectMediDrListAll();
			mv.addObject("mediDrList", mediDrList);
		}
		
		// 검진예약일 경우
		if("02".equals(appointmentVO.getAPPO_GUBN_CD())) {
			// 검진프로그램 리스트를 가져온다.
			List<CheckupVO> exmnList = userRSVService.selectEXMNList();
			mv.addObject("exmnList", exmnList);
		}
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("today", sdf.format(dt));
		return mv;
	}
	/**
	 *  예약 수정
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVUpdate.do")
	public String ReservationUpdate(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model, @ModelAttribute("appointmentVO") AppointmentVO appointmentVO, RedirectAttributes redirectAttributes) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("appointmentVO", appointmentVO);
		
		if(user != null && user.getId() != null) {
			appointmentVO.setUPDT_ID(user.getId());
		} else {
			String setGuestId = "(비회원)"+appointmentVO.getAPPO_PRSN_NM()+"_"+appointmentVO.getMOBILE_PHONE_NO();
			appointmentVO.setUPDT_ID(setGuestId);
		}

		int res = userRSVService.updateRSV(appointmentVO);
		if(user == null || user.getId() == null) {
			redirectAttributes.addAttribute("APPO_PRSN_NM", appointmentVO.getAPPO_PRSN_NM());
			redirectAttributes.addAttribute("MOBILE_PHONE_NO", appointmentVO.getMOBILE_PHONE_NO());
			redirectAttributes.addAttribute("APPO_GUBN_CD", appointmentVO.getAPPO_GUBN_CD());
			return "redirect:/user/cts/rsv/nonMemberReservationList.do";
		} else {
			return "redirect:/user/cts/rsv/userRSVList.do?result="+res;
		}

	}
	/**
	 *  예약 취소
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVCancel.do")
	public String ReservationCancel(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model, @ModelAttribute("appointmentVO") AppointmentVO appointmentVO, RedirectAttributes redirectAttributes) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user != null && user.getId() != null) {
			appointmentVO.setUPDT_ID(user.getId());
		} else {
			String setGuestId = "(비회원)"+appointmentVO.getAPPO_PRSN_NM()+"_"+appointmentVO.getMOBILE_PHONE_NO();
			appointmentVO.setUPDT_ID(setGuestId);
		}
		
		if(appointmentVO.getSearchKeyword() == null) { 
			appointmentVO.setSearchKeyword(request.getParameter("searchKeyword").toString());
		}
		appointmentVO.setDEL_YN("Y");
		int res = userRSVService.updateReservationCancel(appointmentVO);
		if(user == null || user.getId() == null) {
			redirectAttributes.addAttribute("APPO_PRSN_NM", appointmentVO.getAPPO_PRSN_NM());
			redirectAttributes.addAttribute("MOBILE_PHONE_NO", appointmentVO.getMOBILE_PHONE_NO());
			redirectAttributes.addAttribute("APPO_GUBN_CD", appointmentVO.getAPPO_GUBN_CD());
			return "redirect:/user/cts/rsv/nonMemberReservationList.do";
		} else {
			return "redirect:/user/cts/rsv/userRSVList.do?result="+res;
		}
	}
	
	
	@RequestMapping(value="/user/cts/rsv/drScheduleView.do")
	public String drScheduleView(DoctorTimeTableVO timeTableVO, HttpServletRequest request, ModelMap model) throws Exception{
		FbcmsCommonUtils.getMenuNavigation(request, model, "060100");
		
		if(timeTableVO == null || timeTableVO.getMEDI_SBJ_CD() == null) {
			timeTableVO.setMEDI_SBJ_CD("GI");
			timeTableVO.setDR_ID("AA00011");
		}
		
		model.addAttribute("dptCd", timeTableVO.getMEDI_SBJ_CD());
		model.addAttribute("drId", timeTableVO.getDR_ID());
		
		/*예약 리스트*/
		List ScheduleList = userRSVService.selectDrScheduleList(timeTableVO);
		model.addAttribute("ScheduleList", ScheduleList);
		model.addAttribute("ScheduleComment", userRSVService.selectDrScheduleComment(timeTableVO));
		ReservationVO drVo = new ReservationVO();
		drVo.setMEDI_SBJ_CD(timeTableVO.getMEDI_SBJ_CD());
		/*의료진 리스트*/
		List DrList = userRSVService.selectMediDrList(drVo);
		model.addAttribute("DrList", DrList);

		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/drRSVScheduleMain");
	}

	@RequestMapping(value="/user/cts/rsv/drScheduleSelectList.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public  ModelAndView selectDrScheduleList(@RequestBody Map<String, Object> map) throws Exception{
		
		/*진료과 코드 얻기*/
		String MEDI_SBJ_CD =  String.valueOf(map.get("MEDI_SBJ_CD"));
		
		/*진료과 코드 넣기*/
		DoctorTimeTableVO doctorTimeTableVO = new DoctorTimeTableVO();
		doctorTimeTableVO.setMEDI_SBJ_CD(MEDI_SBJ_CD);
		
		/*진료과에 해당하는 리스트 넣기*/
		List vo = userRSVService.selectDrScheduleList(doctorTimeTableVO);
		
		List drVo = userRSVService.selectDrInfo(doctorTimeTableVO);
	
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("vo", vo);
		mv.addObject("drVo", drVo);
		mv.addObject("comment", userRSVService.selectDrScheduleComment(doctorTimeTableVO));
		
		 
		return mv;
	}
	
	@RequestMapping(value="/user/cts/rsv/drScheduleSelectInfo.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public  ModelAndView selectDrScheduleInfo(@RequestBody Map<String, Object> map) throws Exception{
		
		/*ajax 얻기*/
		String TodayInfo =  String.valueOf(map.get("TodayInfo"));
		String DR_ID =  String.valueOf(map.get("DR_ID"));

		/*얻은 데이터 넣기*/
		DoctorTimeTableVO doctorTimeTableVO = new DoctorTimeTableVO();
		DoctorTimeTableVO doctornameVO = new DoctorTimeTableVO();
		doctorTimeTableVO.setAPPO_DT(TodayInfo);
		doctorTimeTableVO.setDR_ID(DR_ID);
		doctornameVO.setDR_ID(DR_ID);
		
		List scInfo = userRSVService.selectDrScheduleInfo(doctorTimeTableVO);
		doctornameVO = userRSVService.selectDrNM(doctornameVO);
	
//		List scheduleList = userRSVService.selectDrScheduleList(timeTableVO);
//		scheduleList.add("zz");
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("drinfo",scInfo);
		mv.addObject("drname",doctornameVO);
		
		return mv;
	}
	
	/**
	 * 진료 예약 Chapter.1
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVClinic.do")
	public ModelAndView userRSVClinicPage(UserClinicVO userClinicVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVClinic"));
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user == null || user.getId() == null) {
			mv.setViewName("redirect:/user/lgn/sin/userLogin.do");
			return mv;
		}
		mv.addObject("userInfo", user);
		try {
			String msgCd = request.getParameter("msgCd");
			if("500".equals(msgCd)) {
				mv.addObject("alertMsg", msgCd);
			}
		} catch (Exception e) {
		}
		mv.addObject("userClinicVO", userClinicVO);
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		return mv;
	}
	
	/**
	 * 진료 예약 Chapter.2
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVClinicInfo.do")
	public ModelAndView userRSVClinicInfoPage(UserClinicVO userClinicVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVClinicInfo"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user == null || user.getId() == null) {
			mv.setViewName("redirect:/user/lgn/sin/userLogin.do");
			return mv;
		}

		// 에러코드 있는지 체크
		try {
			String msgCd = request.getParameter("msgCd").toString().trim();
			if(msgCd != null && !"".equals(msgCd)) {
				mv.addObject("alertMsg", msgCd);
				return mv;
			}
		} catch (Exception e) {
		}
		
		try {
			//진료시간표 가져오기
			mv.addObject("formData", userClinicVO);
			
			//주민번호를 검사하기 위해서 숫자 8자리를 먼저 받아온 후, 2-8자리만 가져온다.
			String usrBd = userClinicVO.getUsrBd().substring(2, 8);
			String usrBdTemp = userClinicVO.getUsrBd();
			userClinicVO.setUsrBd(usrBd);
			UserClinicVO patient = new UserClinicVO();
			// 병원에 의료정보 있는지 확인
			patient = userRSVService.selectPid(userClinicVO);
			userClinicVO.setUsrBd(usrBdTemp);
			if(patient != null) {
				userClinicVO.setPID(patient.getPID());
				userClinicVO.setGender(patient.getGender());
				mv.addObject("patientInfo", userClinicVO);
			} else {
				userClinicVO.setPID("NNNNNNNNN");
				if(userClinicVO.getReservation().equals("me")) {
					AppointmentVO genderVo = new AppointmentVO();
					genderVo.setUSER_ID(user.getId());
					genderVo = userRSVService.selectLoginUserInfo(genderVo);
					userClinicVO.setGender(genderVo.getGENDER_CD());
				}
				mv.addObject("patientInfo", userClinicVO);
			}
		} catch (Exception e) {
			mv.setViewName("redirect:/user/cts/rsv/userRSVClinic.do?msgCd=500");
			return mv;
		}
		
		//리스트를 가져온다.
		List<ReservationVO> mediSbjList = userRSVService.selectMediSbjList();
		
		//의료진 정보를 가져온다.
		List<ReservationVO> mediDrList = userRSVService.selectMediDrListAll();
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("today", sdf.format(dt));
		mv.addObject("mediSbjList", mediSbjList);
		mv.addObject("mediDrList", mediDrList);
		return mv;
	}
	
	/**
	 * 진료과 선택 이벤트 ajax
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/getDrList.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<ReservationVO> getDrList(@RequestBody Map<String, Object> map) throws Exception{
		
		/*진료과 코드 얻기*/
		String MEDI_SBJ_CD =  String.valueOf(map.get("MEDI_SBJ_CD"));
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setMEDI_SBJ_CD(MEDI_SBJ_CD);
		return userRSVService.selectMediDrList(reservationVO);
	}
	/**
	 * 의료진 진료일정
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/getCalendar.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<ScheduleVO> selectTE04DTCalendar(@RequestBody Map<String, Object> map) throws Exception{
		
		/*진료과 코드, 의료진ID 얻기*/
		String dptCd =  String.valueOf(map.get("DPTCD"));
		String drId =  String.valueOf(map.get("DRID"));
		String rsvDt = String.valueOf(map.get("RSVDT"));
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setDPT_CD(dptCd);
		scheduleVO.setDR_ID(drId);
		scheduleVO.setRSV_DT(rsvDt);
		
		return userRSVService.selectTE04DTCalendar(scheduleVO);
	}
	/**
	 * 의료진 진료일정
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/getCalendarMonth.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<ScheduleVO> selectTE04DTCalendarMonth(@RequestBody Map<String, Object> map) throws Exception{
		
		/*진료과 코드, 의료진ID 얻기*/
		String dptCd =  String.valueOf(map.get("DPTCD"));
		String drId =  String.valueOf(map.get("DRID"));
		String rsvDt = String.valueOf(map.get("RSVDT"));
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setDPT_CD(dptCd);
		scheduleVO.setDR_ID(drId);
		scheduleVO.setRSV_DT(rsvDt);
		
		return userRSVService.selectTE04DTCalendarMonth(scheduleVO);
	}
	/**
	 * 의료진 진료일정상세
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/getSchedule.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<ScheduleVO> selectTE04DTSchedule(@RequestBody Map<String, Object> map) throws Exception{
		
		/*진료과 코드, 의료진ID, 조회할 날자 얻기*/
		String dptCd =  String.valueOf(map.get("DPTCD"));
		String drId =  String.valueOf(map.get("DRID"));
		String rsvDt =  String.valueOf(map.get("RSVDT"));
		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setDPT_CD(dptCd);
		scheduleVO.setDR_ID(drId);
		scheduleVO.setRSV_DT(rsvDt);
		
		return userRSVService.selectTE04DTSchedule(scheduleVO);
	}
	
	/**
	 * 진료 예약 Chapter.3
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVClinicSuccess.do")
	public ModelAndView userRSVClinicSuccessPage(UserClinicVO userClinicVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVClinicSuccess"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		try {
			String tempUsrBd = userClinicVO.getUsrBd();
			UserClinicVO resPatient = userRSVService.insertClinicPatient(userClinicVO);
			userClinicVO.setUsrBd(tempUsrBd);
			// 프로시져 밸리데이션 체크 완료 후 에러코드가 N일 경우
			if(resPatient.getErrYn() == null || "N".equals(resPatient.getErrYn())) {
				mv.addObject("resPatient", resPatient);
				mv.addObject("userClinicVO", userClinicVO);
				LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
				if(user != null && user.getId() != null) {
					userClinicVO.setUSER_ID(user.getId());
					userRSVService.insertClinic(userClinicVO);
					
					// 진료 예약 후 메일 발송
					String reservation = user.getName() + "님의 진료예약";
					String subject = "비에비스 나무병원 " + reservation + "이 접수되었습니다";
					String fromEmail = "jineyjun@namu.com";
					String fromUsername = "비에비스 나무병원 예약관리자";
					//String toEmail = "mylee@namu.com"; // 콤마(,)로 여러개 나열
					String toEmail = "suyeon.lee@namu.com"; // 콤마(,)로 여러개 나열
//					String toEmail = "lancer11@naver.com"; // 콤마(,)로 여러개 나열
					
					// 메일에 출력할 텍스트
					String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 접수되었습니다";
					String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 예약을 확정해주세요</span>";
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("contentsSubject", contentsSubject);
					map.put("contentsHtml", contentsHtml);
					
					StringBuffer sb = new StringBuffer();
					sb = FbcmsCommonUtils.sendEmailAdminHtml(request, map);
					
					Map<String, Object> mailMap = new HashMap<String, Object>();
					mailMap.put("subject", subject);
					mailMap.put("fromEmail", fromEmail);
					mailMap.put("fromUsername", fromUsername);
					mailMap.put("toEmail", toEmail);
					mailMap.put("sendHtml", sb.toString());
					
					FbcmsCommonUtils.sendMailSMTP(request, mailMap, model);
				}
			}
		} catch (Exception e) {
			mv.setViewName("redirect:/user/cts/rsv/userRSVClinicInfo.do?msgCd="+URLEncoder.encode("예약 등록중 오류가 발생하여 이전페이지로 이동됩니다.", "UTF-8"));
			return mv;
		}
		return mv;
	}
	
	/**
	 * 검진 예약 절차 안내
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVCheckupStepInfo.do")
	public ModelAndView userRSVCheckupStepInfoPage(HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVCheckupStepInfo"));
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		return mv;
	}
	/**
	 * 검진 예약 Chapter.1
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVCheckup.do")
	public ModelAndView userRSVCheckupPage(HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVCheckup"));
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		mv.addObject("userInfo", user);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		return mv;
	}
	
	/**
	 * 검진 예약 Chapter.2
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVCheckupInfo.do")
	public ModelAndView userRSVCheckupInfoPage(UserCheckupVO userCheckupVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVCheckupInfo"));
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		mv.addObject("userInfo", user);
		
//		2020.12.16 수정사항
//		배현종(beronim2) 회원의 성별이 무조건 '여성' 으로 노출 됨
//		=> 회원 가입 시 등록된 성별로 보여야 합니다
//		요청사항 반영 S
//		try {
//			if(userCheckupVO.getReservation().equals("me")) {
//				UserCheckupVO getGenderVo = new UserCheckupVO();
//				if (user != null && user.getId() != null) {
//					getGenderVo.setUSER_ID(user.getId());
//				}
//				getGenderVo = userRSVService.selectUserGender(getGenderVo);
//				userCheckupVO.setGender(getGenderVo.getGender());
//				userCheckupVO.setAPPO_RLT_CD(null);
//			}
//		} catch (Exception e) {
//		}
		try {
			UserCheckupVO getGenderVo = new UserCheckupVO();
			if (user != null && user.getId() != null) {
				getGenderVo.setUSER_ID(user.getId());
			}
			getGenderVo = userRSVService.selectUserGender(getGenderVo);
			userCheckupVO.setGender(getGenderVo.getGender());
			if (userCheckupVO.getReservation().equals("me")) {
				userCheckupVO.setAPPO_RLT_CD(null);
			}
		} catch (Exception e) {
		}
//		요청사항 반영 E		
	
		List<CheckupVO> exmnList = userRSVService.selectEXMNList();
		// Chapter 1에서 입력한 정보 가져온다.
		mv.addObject("userCheckupVO", userCheckupVO);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("today", sdf.format(dt));
		mv.addObject("exmnList", exmnList);
		
		return mv;
	}
	@RequestMapping(value="/user/cts/rsv/selectCheckupCalendar.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<UserCheckupVO> selectCheckupCalendar(@RequestBody Map<String, Object> map) throws Exception{
		
		UserCheckupVO userCheckupVo = new UserCheckupVO();
		userCheckupVo.setRSVDT(map.get("RSVDT").toString());
		
		return userRSVService.selectCheckupCalendar(userCheckupVo);
	}
	/**
	 * 검진 예약 Chapter.3
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/userRSVCheckupSuccess.do")
	public ModelAndView userRSVCheckupSuccessPage(UserCheckupVO userCheckupVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVCheckupSuccess"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		// 실제 등록했을때만 메일 발송하도록 변경
		if (userRSVService.insertCheckup(userCheckupVO) > 0) {
			// 검진 예약 후 메일 발송
			String reservation = userCheckupVO.getUsrNm() + "님의 검진예약";
			String subject = "비에비스 나무병원 " + reservation + "이 접수되었습니다";
			String fromEmail = "jineyjun@namu.com";
			String fromUsername = "비에비스 나무병원 관리자";
			//String toEmail = "mylee@namu.com"; // 콤마(,)로 여러개 나열
			String toEmail = "suyeon.lee@namu.com"; // 콤마(,)로 여러개 나열
//			String toEmail = "lancer11@naver.com"; // 콤마(,)로 여러개 나열
			
			// 메일에 출력할 텍스트
			String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 접수되었습니다";
			String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 예약을 확정해주세요</span>";
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("contentsSubject", contentsSubject);
			map.put("contentsHtml", contentsHtml);
			
			StringBuffer sb = new StringBuffer();
			sb = FbcmsCommonUtils.sendEmailAdminHtml(request, map);
			
			Map<String, Object> mailMap = new HashMap<String, Object>();
			mailMap.put("subject", subject);
			mailMap.put("fromEmail", fromEmail);
			mailMap.put("fromUsername", fromUsername);
			mailMap.put("toEmail", toEmail);
			mailMap.put("sendHtml", sb.toString());
			
			FbcmsCommonUtils.sendMailSMTP(request, mailMap, model);
		}

		mv.addObject("userCheckupVO", userCheckupVO);
		return mv;
	}
	
	// 의사 상세 정보 AJAX용
	@RequestMapping(value = "/user/cts/rsv/drdetail.do")
	@ResponseBody
	public DRListVO drDetail(@RequestBody Map<String, Object> map) throws Exception {
		String DR_ID = (String)map.get("ID");
		DRListVO dr = userRSVService.DrDeInfo(DR_ID);
		return dr;
	}
	
	// 비회원 예약조회 페이지
	@RequestMapping("/user/cts/rsv/nonMemberReservation.do")
	public ModelAndView nonMemberReservationPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/userRSVNonMemberReservation"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		return mv;
	}
	// 비회원 예약조회 본인인증 후 메인페이지
	@RequestMapping("/user/cts/rsv/nonMemberReservationMain.do")
	public ModelAndView nonMemberReservationMainPage(AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationMain"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		mv.addObject("appointmentVO", appointmentVO);
		return mv;
	}
	/**
	 * 비회원 예약 리스트
	 * 
	 * @param appointmentVO
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/cts/rsv/nonMemberReservationList.do")
	public ModelAndView nonMemberReservationListPage(AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationList"));
		
		String gubnCd = appointmentVO.getAPPO_GUBN_CD() == null ? "01" : appointmentVO.getAPPO_GUBN_CD();
		String setGuestId = "(비회원)"+appointmentVO.getAPPO_PRSN_NM()+"_"+appointmentVO.getMOBILE_PHONE_NO();
		appointmentVO.setUSER_ID(setGuestId);
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		/* **************************
		 * 진료예약 조회 처리 Process
		 * **************************/
		//fnReservationDetail
		AppointmentVO appointmentVO1 = new AppointmentVO();
		if(appointmentVO != null) {
			appointmentVO1 = appointmentVO;
			appointmentVO1.setAPPO_GUBN_CD("01");
			
			/** paging */
			PaginationInfo paginationInfo = new PaginationInfo();
			/** paging 현재 page */
			paginationInfo.setCurrentPageNo(appointmentVO1.getPageIndex());
			/** 한페이지 당 게시물 갯수 */
			paginationInfo.setRecordCountPerPage(appointmentVO1.getPageUnit());
			/** 페이지 리스트에 게시되는 페이지 건수*/
			paginationInfo.setPageSize(appointmentVO1.getPageSize());
			/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
			appointmentVO1.setFirstIndex(paginationInfo.getFirstRecordIndex());
			/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
			appointmentVO1.setLastIndex(paginationInfo.getLastRecordIndex());
			/** 한페이지 당 게시물 갯수 */
			appointmentVO1.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			/** 총 게시글 수*/
			int totCnt = userRSVService.selectUserResListTotCnt(appointmentVO1);
			paginationInfo.setTotalRecordCount(totCnt);
			List<AppointmentVO> rsvList = (List<AppointmentVO>) userRSVService.selectUserResList(appointmentVO1);
			model.addAttribute("reservationList", rsvList);
			model.addAttribute("reservationListTotCnt", totCnt);
			model.addAttribute("paginationInfo",paginationInfo);
			model.addAttribute("appointmentVO1",appointmentVO1);
		}
		
		
		/* **************************
		 * 진료예약 처리 Process
		 * **************************/
		AppointmentVO appointmentVO2 = new AppointmentVO();

		if(appointmentVO != null) {
			appointmentVO2 = appointmentVO;
			appointmentVO2.setAPPO_GUBN_CD("02");
			
			/** paging */
			PaginationInfo paginationInfo2 = new PaginationInfo();
			/** paging 현재 page */
			paginationInfo2.setCurrentPageNo(appointmentVO2.getPageIndex());
			/** 한페이지 당 게시물 갯수 */
			paginationInfo2.setRecordCountPerPage(appointmentVO2.getPageUnit());
			/** 페이지 리스트에 게시되는 페이지 건수*/
			paginationInfo2.setPageSize(appointmentVO2.getPageSize());
			/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
			appointmentVO2.setFirstIndex(paginationInfo2.getFirstRecordIndex());
			/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
			appointmentVO2.setLastIndex(paginationInfo2.getLastRecordIndex());
			/** 한페이지 당 게시물 갯수 */
			appointmentVO2.setRecordCountPerPage(paginationInfo2.getRecordCountPerPage());
			
			/** 총 게시글 수*/
			int totCnt2 = userRSVService.selectUserResListTotCnt(appointmentVO2);
			paginationInfo2.setTotalRecordCount(totCnt2);
			List<AppointmentVO> rsvList2 = (List<AppointmentVO>) userRSVService.selectChkUpList(appointmentVO2);
			model.addAttribute("reservationList2", rsvList2);
			model.addAttribute("reservationListTotCnt2", totCnt2);
			model.addAttribute("paginationInfo2",paginationInfo2);
			model.addAttribute("appointmentVO2",appointmentVO2);
		}
		
		// -------------- 예약조회 끝 --------------
		appointmentVO.setAPPO_GUBN_CD(gubnCd);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date();
		model.addAttribute("today", sdf.format(dt));
		model.addAttribute("result", request.getParameter("result"));
		return mv;
	}
	

	/**
	 * 비회원 진료 예약 Chapter.1
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationClinic.do")
	public ModelAndView nonMemberReservationClinicPage(AppointmentVO appointmentVO, UserClinicVO userClinicVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationClinic"));
		try {
			String msgCd = request.getParameter("msgCd");
			if("500".equals(msgCd)) {
				mv.addObject("alertMsg", msgCd);
			}
		} catch (Exception e) {
		}
		mv.addObject("appointmentVO", appointmentVO);
		mv.addObject("userClinicVO", userClinicVO);
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		return mv;
	}
	
	/**
	 * 비회원 진료 예약 Chapter.2
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationClinicInfo.do")
	public ModelAndView nonMemberReservationClinicInfoPage(UserClinicVO userClinicVO, AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationClinicInfo"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		mv.addObject("appointmentVO", appointmentVO);
		// 에러코드 있는지 체크
		try {
			String msgCd = request.getParameter("msgCd").toString().trim();
			if(msgCd != null && !"".equals(msgCd)) {
				mv.addObject("alertMsg", msgCd);
				return mv;
			}
		} catch (Exception e) {
		}
		
		try {
			//진료시간표 가져오기
			mv.addObject("formData", userClinicVO);
			
			//주민번호를 검사하기 위해서 숫자 8자리를 먼저 받아온 후, 2-8자리만 가져온다.
			String usrBd = userClinicVO.getUsrBd().substring(2, 8);
			String usrBdTemp = userClinicVO.getUsrBd();
			userClinicVO.setUsrBd(usrBd);
			UserClinicVO patient = new UserClinicVO();
			// 병원에 의료정보 있는지 확인
			patient = userRSVService.selectPid(userClinicVO);
			userClinicVO.setUsrBd(usrBdTemp);
			if(patient != null) {
				userClinicVO.setPID(patient.getPID());
				userClinicVO.setGender(patient.getGender());
				mv.addObject("patientInfo", userClinicVO);
			} else {
				userClinicVO.setPID("NNNNNNNNN");
				mv.addObject("patientInfo", userClinicVO);
			}
		} catch (Exception e) {
			mv.setViewName("redirect:/user/cts/rsv/nonMemberReservationClinic.do?msgCd=500");
			return mv;
		}
		
		//리스트를 가져온다.
		List<ReservationVO> mediSbjList = userRSVService.selectMediSbjList();
		
		//의료진 정보를 가져온다.
		List<ReservationVO> mediDrList = userRSVService.selectMediDrListAll();
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("today", sdf.format(dt));
		mv.addObject("mediSbjList", mediSbjList);
		mv.addObject("mediDrList", mediDrList);
		return mv;
	}
	
	/**
	 * 비회원 진료 예약 Chapter.3
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationClinicSuccess.do")
	public ModelAndView nonMemberReservationClinicSuccessPage(UserClinicVO userClinicVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationClinicSuccess"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		
		try {
			String setGuestId = "(비회원)"+userClinicVO.getUsrNm()+"_"+userClinicVO.getfCtn()+"-"+userClinicVO.getmCtn()+"-"+userClinicVO.getlCtn();
			userClinicVO.setUSER_ID(setGuestId);
			String tempUsrBd = userClinicVO.getUsrBd();
			UserClinicVO resPatient = userRSVService.insertClinicPatient(userClinicVO);
			userClinicVO.setUsrBd(tempUsrBd);
			// 프로시져 밸리데이션 체크 완료 후 에러코드가 N일 경우
			if(resPatient.getErrYn() == null || "N".equals(resPatient.getErrYn())) {
				mv.addObject("resPatient", resPatient);
				mv.addObject("userClinicVO", userClinicVO);
				userClinicVO.setUSER_ID(setGuestId);
				userRSVService.insertClinic(userClinicVO);
				
				// 진료 예약 후 메일 발송
				String reservation = "(비회원)"+userClinicVO.getUsrNm() + "님의 진료예약";
				String subject = "비에비스 나무병원 " + reservation + "이 접수되었습니다";
				String fromEmail = "jineyjun@namu.com";
				String fromUsername = "비에비스 나무병원 예약관리자";
				//String toEmail = "mylee@namu.com"; // 콤마(,)로 여러개 나열
				String toEmail = "suyeon.lee@namu.com"; // 콤마(,)로 여러개 나열
//				String toEmail = "lancer11@naver.com"; // 콤마(,)로 여러개 나열
				
				// 메일에 출력할 텍스트
				String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 접수되었습니다";
				String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 예약을 확정해주세요</span>";
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("contentsSubject", contentsSubject);
				map.put("contentsHtml", contentsHtml);
				
				StringBuffer sb = new StringBuffer();
				sb = FbcmsCommonUtils.sendEmailAdminHtml(request, map);
				
				Map<String, Object> mailMap = new HashMap<String, Object>();
				mailMap.put("subject", subject);
				mailMap.put("fromEmail", fromEmail);
				mailMap.put("fromUsername", fromUsername);
				mailMap.put("toEmail", toEmail);
				mailMap.put("sendHtml", sb.toString());
				
				FbcmsCommonUtils.sendMailSMTP(request, mailMap, model);
			} else {
				// 에러코드가 있을 경우 오류값을 보낸다.
				mv.setViewName("redirect:/user/cts/rsv/nonMemberReservationClinicInfo.do?msgCd="+URLEncoder.encode(resPatient.getErrMsg(), "UTF-8"));
				return mv;
			}
		} catch (Exception e) {
			mv.setViewName("redirect:/user/cts/rsv/nonMemberReservationClinicInfo.do?msgCd="+URLEncoder.encode("예약 등록중 오류가 발생하여 이전페이지로 이동됩니다.", "UTF-8"));
			return mv;
		}
		return mv;
	}
	/**
	 * 비회원 검진 예약 절차 안내
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationCheckupStepInfo.do")
	public ModelAndView nonMemberReservationCheckupStepInfoPage(AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationCheckupStepInfo"));
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		mv.addObject("appointmentVO", appointmentVO);
		return mv;
	}
	/**
	 * 비회원 검진 예약 Chapter.1
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationCheckup.do")
	public ModelAndView nonMemberReservationCheckupPage(AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationCheckup"));
		mv.addObject("appointmentVO", appointmentVO);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		return mv;
	}
	
	/**
	 * 비회원 검진 예약 Chapter.2
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationCheckupInfo.do")
	public ModelAndView nonMemberReservationCheckupInfoPage(UserCheckupVO userCheckupVO, AppointmentVO appointmentVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationCheckupInfo"));
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		try {
			if (userCheckupVO.getReservation().equals("me")) {
				userCheckupVO.setAPPO_RLT_CD(null);
			}
		} catch (Exception e) {
		}
		
		List<CheckupVO> exmnList = userRSVService.selectEXMNList();
		// Chapter 1에서 입력한 정보 가져온다.
		mv.addObject("appointmentVO", appointmentVO);
		mv.addObject("userCheckupVO", userCheckupVO);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mv.addObject("today", sdf.format(dt));
		mv.addObject("exmnList", exmnList);
		
		return mv;
	}
	/**
	 * 비회원 검진 예약 Chapter.3
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cts/rsv/nonMemberReservationCheckupSuccess.do")
	public ModelAndView nonMemberReservationCheckupSuccessPage(UserCheckupVO userCheckupVO, HttpServletRequest request, HttpServletResponse response
			, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView(FbcmsCommonUtils.mobileJspReplace(request, "user/cts/rsv/nonMemberReservationCheckupSuccess"));
		FbcmsCommonUtils.getMenuNavigation(request, model, "060200");
		String setGuestId = "(비회원)"+userCheckupVO.getUsrNm()+"_"+userCheckupVO.getfCtn()+"-"+userCheckupVO.getmCtn()+"-"+userCheckupVO.getlCtn();
		userCheckupVO.setUSER_ID(setGuestId);
		
		// 실제 등록했을때만 메일 발송하도록 변경
		if (userRSVService.insertCheckup(userCheckupVO) > 0) {
			// 검진 예약 후 메일 발송
			String reservation = "(비회원)" + userCheckupVO.getUsrNm() + "님의 검진예약";
			String subject = "비에비스 나무병원 " + reservation + "이 접수되었습니다";
			String fromEmail = "jineyjun@namu.com";
			String fromUsername = "비에비스 나무병원 관리자";
			//String toEmail = "mylee@namu.com"; // 콤마(,)로 여러개 나열
			String toEmail = "suyeon.lee@namu.com"; // 콤마(,)로 여러개 나열
//			String toEmail = "lancer11@naver.com"; // 콤마(,)로 여러개 나열
			
			// 메일에 출력할 텍스트
			String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 접수되었습니다";
			String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 예약을 확정해주세요</span>";
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("contentsSubject", contentsSubject);
			map.put("contentsHtml", contentsHtml);
			
			StringBuffer sb = new StringBuffer();
			sb = FbcmsCommonUtils.sendEmailAdminHtml(request, map);
			
			Map<String, Object> mailMap = new HashMap<String, Object>();
			mailMap.put("subject", subject);
			mailMap.put("fromEmail", fromEmail);
			mailMap.put("fromUsername", fromUsername);
			mailMap.put("toEmail", toEmail);
			mailMap.put("sendHtml", sb.toString());
			
			FbcmsCommonUtils.sendMailSMTP(request, mailMap, model);
		}
		
		
		mv.addObject("userCheckupVO", userCheckupVO);
		return mv;
	}
} 