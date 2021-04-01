package fbcms.admin.mbm.mbi.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dsjdf.jdf.DateTime;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.mbm.mbi.service.AdminMBIService;
import fbcms.user.lgn.MembersVO;

/**
 * 회원정보 컨트롤러 클래스
 * 
 * @author 김명진
 * @since 2020.10.07
 */
@Controller
public class AdminMBIController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMBIController.class);
	@Autowired
	private AdminMBIService adminMBIService;
	
	/**
	 * 회원 정보 리스트
	 * @return
	 * @ {
	 * throws Exception
	 */
	@RequestMapping(value="/admin/mbm/mbi/selectMBIList.do")
	public String selectMBIList(ModelMap model,@ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(membersVO.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(membersVO.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(membersVO.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		membersVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		membersVO.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		membersVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		/*회원수 Count*/
		int totCnt = adminMBIService.selectMemberListTotCnt(membersVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		/*회원정보 리스트 가져오기*/
		List<MembersVO> memberList = adminMBIService.selectMemberList(membersVO);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberListTotCnt", totCnt);
		model.addAttribute("paginationInfo",paginationInfo);
		
		return "admin/mbm/mbi/adminMemberInfoList";
	}

	/**
	 * 회원 리스트 엑셀다운
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/mbm/mbi/selectMBIListExcel.do")
	public ModelAndView selectCRSListExcel(@ModelAttribute("membersVO") MembersVO membersVO, ModelMap model)
			throws Exception {
		// 전체 리스트 가져오기
		int totCnt = adminMBIService.selectMemberListTotCnt(membersVO);
		membersVO.setFirstIndex(0);
		membersVO.setRecordCountPerPage(totCnt);

		List<MembersVO> memberList = adminMBIService.selectMemberList(membersVO);

		ModelAndView mav = new ModelAndView("excelView");
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// List Data 만들기
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		for (int i = 0; i < memberList.size(); i++) {
			HashMap<String, Object> pMap = new HashMap<String, Object>();
			MembersVO dataVO = memberList.get(i);

			pMap.put("MBER_NM", dataVO.getMBER_NM()); 				// 이름
			pMap.put("MBER_ID", dataVO.getMBER_ID()); 				// 아이디
			pMap.put("MBER_EMAIL_ADRES", dataVO.getMBER_EMAIL_ADRES()); 			// 이메일
			pMap.put("FRIST_JOIN_DT", dataVO.getFRIST_JOIN_DT()); 	// 회원가입일
			pMap.put("GUBN_CD", dataVO.getGUBN_CD()); 				// 구분
			pMap.put("STAT_CD", dataVO.getSTAT_CD()); 				// 상태

			list.add(i, pMap);
		}

		String filename = "회원 정보 리스트_" + DateTime.getDateString();
		String[] columnArr = { "번호", "이름", "아이디", "이메일", "회원가입일", "구분", "상태" };
		String[] columnVarArr = { "idx", "MBER_NM", "MBER_ID", "MBER_EMAIL_ADRES", "FRIST_JOIN_DT", "GUBN_CD", "STAT_CD" };

		dataMap.put("columnArr", columnArr);
		dataMap.put("columnVarArr", columnVarArr);
		dataMap.put("sheetNm", "회원 정보 리스트");
		dataMap.put("list", list);

		mav.addObject("dataMap", dataMap);
		mav.addObject("filename", filename);

		return mav;

	}

	/**
	 * 회원 정보 상세
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/selectMBIDetail.do")
	public String selectMember(ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/*회원 정보 가져오기*/
		membersVO = adminMBIService.selectMember(membersVO);
		model.addAttribute("memberInfo", membersVO);
		
		return "admin/mbm/mbi/adminMemberInfoDetail";
	}

	/**
	 * 회원 정보 등록페이지
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/registMBIView.do")
	public String insertMemberView(ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		return "admin/mbm/mbi/adminMemberInfoRegist";
	}

	/**
	 * 회원 정보 등록
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/registMBI.do")
	public String insertMember(ModelMap model, @ModelAttribute("membersVO") MembersVO membersVO,
			RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/*회원 정보 Update*/
		String id = membersVO.getMBER_ID();
		String pw = "namuh1234!";
		
		String enpassword = EgovFileScrty.encryptPassword(pw, id);
		membersVO.setPASSWORD(enpassword);

		int res = adminMBIService.insertMember(membersVO);
		if (res != 0) {
			membersVO = adminMBIService.selectMember(membersVO);
			remodel.addFlashAttribute("membersVO", membersVO);
			return "redirect:/admin/mbm/mbi/selectMBIDetail.do";
		} else {
			return "/admin/mbm/mbi/registMBIView.do";
		}

	}

	/**
	 * 회원수정페이지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/updateMBIView.do")
	public String updateMemberView(ModelMap model, @ModelAttribute("memberVO") MembersVO membersVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
				
		// 회원 정보 상세 가져오기
		membersVO = adminMBIService.selectMember(membersVO);
		model.addAttribute("memberInfo", membersVO);

		return "admin/mbm/mbi/adminMemberInfoModify";
	}
	
	/**
	 * 비밀번호 초기화
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/resetPw.do")
	public String resetPw(@ModelAttribute("membersVO") MembersVO membersVO, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
				
		/*회원 정보 Update*/
		String id = membersVO.getMBER_ID();
		String pw = membersVO.getPASSWORD();
		String enpassword = EgovFileScrty.encryptPassword(pw, id);
		membersVO.setPASSWORD(enpassword);
	
		
		
		int res = adminMBIService.updateResetPw(membersVO);
		if (res != 0) {
			membersVO = adminMBIService.selectMember(membersVO);
			remodel.addFlashAttribute("membersVO", membersVO);
			
			return "redirect:/admin/mbm/mbi/selectMBIDetail.do";
		} else
			return "";
	}

	/**
	 * 회원수정
	 * @param model
	 * @param memberVO
	 * @param currentId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/updateMBI.do")
	public String updateMember(@ModelAttribute("membersVO") MembersVO membersVO, ModelMap model, RedirectAttributes remodel)
			throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/*회원 정보 Update*/
		String id = membersVO.getMBER_ID();
		String pw = membersVO.getPASSWORD();
		
		String enpassword = EgovFileScrty.encryptPassword(pw, id);
		membersVO.setPASSWORD(enpassword);
	
		
		
		int res = adminMBIService.updateMember(membersVO);
		if (res != 0) {
			membersVO = adminMBIService.selectMember(membersVO);
			remodel.addFlashAttribute("membersVO", membersVO);
			
			return "redirect:/admin/mbm/mbi/selectMBIDetail.do";
		} else
			return "";
	}
	/**
	 * 회원 삭제
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/mbm/mbi/deleteMBI.do")
	public String deleteMember(ModelMap model, @ModelAttribute("memberVO") MembersVO membersVO) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/*회원정보 Delete */
		int res = adminMBIService.deleteMember(membersVO);
		if (res == 1) {
			return "redirect:/admin/mbm/mbi/selectMBIList.do";
		} else
			return "";
	}
	
	
	/**
	 * 아이디 중복 체크
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/mbm/mbi/idCheck.do")
	@ResponseBody
	public ModelAndView idDupCheck(@RequestBody Map<String, Object> map) throws Exception{
		
		String USER_ID =  String.valueOf(map.get("userID"));
		
		/*중복된 아이디 Check*/
		int result = adminMBIService.idDupChk(USER_ID);
		adminMBIService.idDupChk(USER_ID);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject(result);
		 
		return mv;
	}
}
