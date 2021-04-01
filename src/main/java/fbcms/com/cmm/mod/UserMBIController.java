package fbcms.com.cmm.mod;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.mbm.mbi.service.AdminMBIService;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.mod.service.UserMBIService;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.cts.rsv.service.UserReservationService;
import fbcms.user.drop.DropMemberVO;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.smt.service.UserSMTService;
import fbcms.user.lgn.MembersVO;

@Controller
public class UserMBIController {
	
	/** EgovMessageSource */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Autowired
	private UserMBIService userMBIService;
	@Autowired
	private UserSMTService userSMTService;
	@Autowired
	private UserReservationService userReservationService;
	@Autowired
	private AdminMBIService adminMBIService;
	
	/**
	 * 마이페이지 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cmm/mod/userMBIMypageView.do")
	public String ReservationList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");

		MembersVO membersVO = new MembersVO();
		membersVO.setMBER_ID(user.getId());
		membersVO = adminMBIService.selectMember(membersVO);
		if(membersVO == null || membersVO.getMBER_NM() == null) {
			model.addAttribute("message", egovMessageSource.getMessage("errors.xss.checkerUser"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}

		String Name = membersVO.getMBER_NM();
		model.addAttribute("Name", Name);
		
		/* **************************
		 * 진료예약 처리 Process
		 * **************************/
		AppointmentVO appointmentVO = new AppointmentVO();
		appointmentVO.setAPPO_GUBN_CD("01");
		appointmentVO.setUSER_ID(user.getId());
		
		List<AppointmentVO> rsvList = (List<AppointmentVO>) userMBIService.selectResList(appointmentVO);
		model.addAttribute("reservationList", rsvList);
		
		
		/* **************************
		 * 검진예약 조회 처리 Process
		 * **************************/
		AppointmentVO appointmentVO2 = new AppointmentVO();
		appointmentVO2.setAPPO_GUBN_CD("02");
		appointmentVO2.setUSER_ID(user.getId());
		List<AppointmentVO> rsvList2 = (List<AppointmentVO>) userMBIService.selectChkUpList(appointmentVO2);
		model.addAttribute("reservationList2", rsvList2);
		
		// -------------- 예약조회 끝 --------------
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = new Date();
		model.addAttribute("today", sdf.format(dt));
		
		// 게시판 리스트
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setFrstRegisterId(user.getId());
		List<AdminBoardVO> bList = userMBIService.selectArticleLists(adminBoardVO);
		model.addAttribute("bList", bList);
		
		// 의사 리스트
		DoctorVO doctorVO = new DoctorVO();
		doctorVO.setUSER_ID(user.getId());
		List<DoctorVO> dList = userMBIService.selectLikedDr(doctorVO);
		model.addAttribute("dList", dList);
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mod/userMBIMypage");
	}
	
	@RequestMapping(value="/user/cmm/mod/DeleteDrLike.do")
	@ResponseBody
	public ModelAndView DeleteDrLike(@RequestBody Map<String, Object> map, favoritesDRVO fDrvo) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		String ID =  String.valueOf(map.get("ID"));
		
		fDrvo.setDR_ID(ID);
		fDrvo.setUSER_ID(user.getId());
		
		
		/*중복된 아이디 Check*/
		int result = userMBIService.deleteDrLike(fDrvo);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		 
		return mv;
	}
	
	@RequestMapping(value="/user/cmm/mod/drdetail.do")
	@ResponseBody
	public ModelAndView drdetail(@RequestBody Map<String, Object> map) throws Exception {
		
		
		String DR_ID =  String.valueOf(map.get("DR_ID"));
		
		
		DRListVO drListVO = new DRListVO();
		drListVO.setDR_ID(DR_ID);
		
		/*중복된 아이디 Check*/
		drListVO = userSMTService.drDetail(DR_ID);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("drListVO", drListVO);
		 
		return mv;
	}
	
	@RequestMapping(value="/user/cmm/mod/updateReservationCancel.do")
	@ResponseBody
	public ModelAndView updateReservationCancel(@RequestBody Map<String, Object> map) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		
		String searchKeyword =  String.valueOf(map.get("searchKeyword"));
		AppointmentVO appointmentVO = new AppointmentVO();
		appointmentVO.setUPDT_ID(user.getId());
		appointmentVO.setSearchKeyword(searchKeyword);
		
	 	int res = userReservationService.updateReservationCancel(appointmentVO);
	 	
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("res", res);
		 
		return mv;
	}
	
	
	
	/**
	 * 회원 정보
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cmm/mod/identifyMBI.do")
	public String selectMember(HttpServletRequest request, ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		membersVO.setMBER_ID(user.getId());
		
		/*회원정보 가져오기*/
		membersVO = userMBIService.selectMember(membersVO);
					
		model.addAttribute("memberInfo", membersVO);
		
		return  FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mod/userMBIIdentify");
	}
	
	/**
	 * 비밀번호 확인
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/cmm/mod/passwordChk.do")
	@ResponseBody
	public ModelAndView passwordChk(@RequestBody Map<String, Object> map) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		String PASSWORD =  String.valueOf(map.get("PASSWORD"));
		String enpassword = EgovFileScrty.encryptPassword(PASSWORD, user.getId());
		
		String currentId = user.getId();
		
		/*중복된 아이디 Check*/
		int result = userMBIService.passwordChk(enpassword);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("result", result);
		 
		return mv;
	}
	
	/**
	 * 회원수정페이지
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/user/cmm/mod/modifyMBIView.do")
	public String modifyMemberView(HttpServletRequest request, ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		// 로그인이 아닌경우
		if(user == null || user.getId() == null || user.getId().isEmpty()) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		membersVO.setMBER_ID(user.getId());
		
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		String ID =membersVO.getMBER_ID();
	    membersVO.setUSER_ID(ID);
				
		MembersVO google = userMBIService.snsGoogle(membersVO); 
		MembersVO kakao = userMBIService.snsKakao(membersVO);
		MembersVO naver = userMBIService.snsNaver(membersVO);
		membersVO = userMBIService.selectMember(membersVO);
		
		model.addAttribute("memberInfo", membersVO);
		model.addAttribute("google", google);
		model.addAttribute("kakao", kakao);
		model.addAttribute("naver", naver);


		return  FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mod/userMBIModify");
	}
	
	/**
	 * 회원수정
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/user/cmm/mod/modifyMBI.do")
	public String modifyMember(@ModelAttribute("membersVO") MembersVO membersVO, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		} 
		
		membersVO.setMBER_ID(user.getId());
		
		String enpassword = EgovFileScrty.encryptPassword(membersVO.getPASSWORD(), membersVO.getMBER_ID());
		membersVO.setPASSWORD(enpassword);
		int res1 = userMBIService.updateMBI(membersVO);
		
		int res2 = userMBIService.updateGoogle(membersVO);
		int res3 = userMBIService.updateKakao(membersVO);
		int res4 = userMBIService.updateNaver(membersVO);
		
		if (res1 == 1) {
			userMBIService.selectMember(membersVO);
			
			remodel.addFlashAttribute("membersVO", membersVO);
			return "redirect:/user/cmm/mod/userMBIMypageView.do";
		}
		return "";
	}
	
	/**
	 * 회원삭제 페이지
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/user/cmm/mod/dropMBIView.do")
	public String dropMemberView(HttpServletRequest request, ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mod/userMBIDrop");
	}
	
	/**
	 * 회원삭제
	 * @param dropMemberVO
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/user/cmm/mod/dropMBI.do")
	public String dropMember(ModelMap model, @ModelAttribute("dropMemberVO") DropMemberVO dropMemberVO, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		dropMemberVO.setUSER_ID(user.getId());
		
		MembersVO membersVO = new MembersVO();
		membersVO.setMBER_ID(user.getId());
		
		if(membersVO == null || membersVO.getMBER_ID() == null) {
			model.addAttribute("message", egovMessageSource.getMessage("errors.xss.checkerUser"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}

		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		int res = userMBIService.dropMember(dropMemberVO);
		int res2 = userMBIService.deleteMember(membersVO);
		if(res == 1) {
			return "redirect:/user/lgn/sin/actionLogout.do";
		}
		
		return "";
	}
	
	
	
}
