package fbcms.admin.sym.umt.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.sym.umt.service.AdminAdminManageService;
import fbcms.admin.sym.mpm.service.AdminMenuManageService;
import fbcms.admin.sym.mpm.service.AdminMenuManageVO;
import fbcms.admin.sym.umt.service.AdminAdminDefaultVO;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 관리자관리를 처리하는 비즈니스 구현 클래스
 */
@Controller
public class AdminAdminManageController {

	/** AdminAdminManageService */
	@Resource(name = "AdminAdminManageService")
	private AdminAdminManageService adminAdminManageService;

	/** AdminMenuManageService */
	@Resource(name = "AdminMenuManageService")
	private AdminMenuManageService adminMenuManageService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
	
	/**
	 * 관리자목록을 조회한다. (pageing)
	 */
	@IncludedInfo(name = "관리자관리", order = 460, gid = 50)
	@RequestMapping(value = "/admin/sym/umt/selectAdminList.do")
	public String selectAdminList(@ModelAttribute("searchVO") AdminAdminDefaultVO searchVO
			, HttpServletRequest request
			, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		/** EgovPropertyService */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> resultList = adminAdminManageService.selectAdminList(searchVO);
		model.addAttribute("resultList", resultList);

		int totCnt = adminAdminManageService.selectAdminListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		//관리자상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM013");
		List<?> emplyrSttusCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("emplyrSttusCodeResult", emplyrSttusCodeResult);//관리자상태코드목록
		
		String resultMsg = (String)request.getParameter("resultMsg");
		if (resultMsg != null && !resultMsg.isEmpty()) {
			model.addAttribute("resultMsg", resultMsg);
		}

		return "admin/sym/umt/adminAdminList";
	}

	/**
	 * 관리자 상세화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/selectAdminDetail.do")
	public String selectAdminDetail(@ModelAttribute("searchVO") AdminAdminDefaultVO searchVO
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//소속기관코드를 코드정보로부터 조회 - COM025
		vo.setCodeId("COM025");
		List<?> insttCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> orgnztIdResult = cmmUseService.selectOgrnztIdDetail(vo);

		model.addAttribute("insttCodeResult", insttCodeResult); //소속기관코드목록
		model.addAttribute("orgnztIdResult", orgnztIdResult); //조직정보 목록

		AdminAdminManageVO adminAdminManageVO = new AdminAdminManageVO();
		adminAdminManageVO = adminAdminManageService.selectAdminDetail(user.getUniqId());
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("adminAdminManageVO", adminAdminManageVO);

		return "admin/sym/umt/adminAdminRegist";
	}

	/**
	 * 관리자등록화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/insertAdminView.do")
	public String insertAdminView(@ModelAttribute("searchVO") AdminAdminDefaultVO searchVO
			, @ModelAttribute("adminAdminManageVO") AdminAdminManageVO adminAdminManageVO
			, HttpServletRequest request
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		
		//소속기관코드를 코드정보로부터 조회 - COM025
		vo.setCodeId("COM025");
		List<?> insttCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> orgnztIdResult = cmmUseService.selectOgrnztIdDetail(vo);

		model.addAttribute("insttCodeResult", insttCodeResult); //소속기관코드목록
		model.addAttribute("orgnztIdResult", orgnztIdResult); //조직정보 목록
		
		List<?> listMenulist = adminMenuManageService.selectMenuListAuthCheckAll(adminAdminManageVO);
        model.addAttribute("listMenulist", listMenulist);
        
        String resultMsg = (String)request.getParameter("resultMsg");
		if (resultMsg != null && !resultMsg.isEmpty()) {
			model.addAttribute("resultMsg", resultMsg);
		}

		return "admin/sym/umt/adminAdminRegist";
	}

	/**
	 * 관리자등록처리후 목록화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/insertAdmin.do")
	public String insertAdmin(@RequestParam("checkedMenuNoList") String checkedMenuNoList
			, @ModelAttribute("adminAdminManageVO") AdminAdminManageVO adminAdminManageVO
			, BindingResult bindingResult
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		beanValidator.validate(adminAdminManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/umt/insertAdminView.do";
		}
		
		if ("".equals(adminAdminManageVO.getOrgnztId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setOrgnztId(null);
		}
		if ("".equals(adminAdminManageVO.getGroupId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setGroupId(null);
		}
		adminAdminManageService.insertAdmin(adminAdminManageVO);
		
		AdminMenuManageVO adminMenuManageVO = new AdminMenuManageVO();
		adminMenuManageVO.setTmpId(adminAdminManageVO.getUniqId());
		adminMenuManageVO.setTmpUniqId(user.getUniqId());
		adminMenuManageService.deleteAdminMenu(adminMenuManageVO);
		adminMenuManageService.insertAdminMenu(adminMenuManageVO, checkedMenuNoList);
		
		//Exception 없이 진행시 등록성공메시지
		model.addAttribute("resultMsg", egovMessageSource.getMessage("success.common.insert"));
		
		return "redirect:/admin/sym/umt/selectAdminList.do";
	}

	/**
	 * 관리자정보 수정을 위해 관리자정보를 상세조회한다.
	 */
	@RequestMapping("/admin/sym/umt/updateAdminView.do")
	public String updateAdminView(@RequestParam("selectedId") String uniqId
			, @ModelAttribute("searchVO") AdminAdminDefaultVO searchVO
			, HttpServletRequest request
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//소속기관코드를 코드정보로부터 조회 - COM025
		vo.setCodeId("COM025");
		List<?> insttCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> orgnztIdResult = cmmUseService.selectOgrnztIdDetail(vo);

		model.addAttribute("insttCodeResult", insttCodeResult); //소속기관코드목록
		model.addAttribute("orgnztIdResult", orgnztIdResult); //조직정보 목록

		AdminAdminManageVO adminAdminManageVO = new AdminAdminManageVO();
		adminAdminManageVO = adminAdminManageService.selectAdminDetail(uniqId);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("adminAdminManageVO", adminAdminManageVO);
		
		List<?> listMenulist = adminMenuManageService.selectMenuListAuthCheckAll(adminAdminManageVO);
        model.addAttribute("listMenulist", listMenulist);
        
        String resultMsg = (String)request.getParameter("resultMsg");
		if (resultMsg != null && !resultMsg.isEmpty()) {
			model.addAttribute("resultMsg", resultMsg);
		}

		return "admin/sym/umt/adminAdminUpdt";
	}

	/**
	 * 관리자정보 수정후 목록조회 화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/updateAdmin.do")
	public String updateAdmin(@RequestParam("checkedMenuNoList") String checkedMenuNoList
			, @ModelAttribute("adminAdminManageVO") AdminAdminManageVO adminAdminManageVO
			, BindingResult bindingResult
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		beanValidator.validate(adminAdminManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/umt/updateAdminView.do";
		}
		
		if ("".equals(adminAdminManageVO.getOrgnztId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setOrgnztId(null);
		}
		if ("".equals(adminAdminManageVO.getGroupId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setGroupId(null);
		}
		adminAdminManageService.updateAdmin(adminAdminManageVO);
		
		if("ORGNZT_9999999999999".equals(user.getOrgnztId())) { // 슈퍼관리자가 로그인한 경우만 메뉴 수정권한을 가진다.
			AdminMenuManageVO adminMenuManageVO = new AdminMenuManageVO();
			adminMenuManageVO.setTmpId(adminAdminManageVO.getUniqId());
			adminMenuManageVO.setTmpUniqId(user.getUniqId());
			adminMenuManageService.deleteAdminMenu(adminMenuManageVO);
			adminMenuManageService.insertAdminMenu(adminMenuManageVO, checkedMenuNoList);
		}
		
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", egovMessageSource.getMessage("success.common.update"));
		
		return "redirect:/admin/sym/umt/selectAdminList.do";
	}

	/**
	 * 관리자정보삭제후 목록조회 화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/deleteAdmin.do")
	public String deleteAdmin(@RequestParam("checkedIdForDel") String checkedIdForDel
			, @ModelAttribute("searchVO") AdminAdminDefaultVO searchVO
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		adminAdminManageService.deleteAdmin(checkedIdForDel);
		
		//Exception 없이 진행시 등록성공메시지
		model.addAttribute("resultMsg", egovMessageSource.getMessage("success.common.delete"));
		return "redirect:/admin/sym/umt/selectAdminList.do";
	}
	
	
	/**
	 * 입력한 관리자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 */
	@RequestMapping(value = "/admin/sym/umt/checkIdDplctAjax.do")
	public ModelAndView checkIdDplctAjax(@RequestParam Map<String, Object> commandMap) throws Exception {

    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.setViewName("jsonView");

		String checkId = (String) commandMap.get("checkId");
		//checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");

		int usedCnt = adminAdminManageService.checkIdDplct(checkId);
		modelAndView.addObject("usedCnt", usedCnt);
		modelAndView.addObject("checkId", checkId);

		return modelAndView;
	}
	
	/**
	 * 로그인인증제한 해제 
	 */
	@RequestMapping("/admin/sym/umt/updateLockIncorrect.do")
	public String updateLockIncorrect(AdminAdminManageVO adminAdminManageVO
			, Model model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		adminAdminManageService.updateLockIncorrect(adminAdminManageVO);
		
		return "redirect:/admin/sym/umt/adminAdminSelectUpdtView.do";
	}

	/**
	 * 관리자 상세화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/emplyrDetail.do")
	public String emplyrInfo(HttpServletRequest request
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//소속기관코드를 코드정보로부터 조회 - COM025
		vo.setCodeId("COM025");
		List<?> insttCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> orgnztIdResult = cmmUseService.selectOgrnztIdDetail(vo);

		model.addAttribute("insttCodeResult", insttCodeResult); //소속기관코드목록
		model.addAttribute("orgnztIdResult", orgnztIdResult); //조직정보 목록

		AdminAdminManageVO adminAdminManageVO = new AdminAdminManageVO();
		adminAdminManageVO = adminAdminManageService.selectAdminDetail(user.getUniqId());
		model.addAttribute("adminAdminManageVO", adminAdminManageVO);
		
		String resultMsg = (String)request.getParameter("resultMsg");
		if (resultMsg != null && !resultMsg.isEmpty()) {
			model.addAttribute("resultMsg", resultMsg);
		}

		return "admin/sym/umt/adminEmplyrDetail";
	}

	/**
	 * 수정을 위해 관리자정보를 상세조회한다.
	 */
	@RequestMapping("/admin/sym/umt/updateEmplyrView.do")
	public String updateEmplyrView(HttpServletRequest request
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//소속기관코드를 코드정보로부터 조회 - COM025
		vo.setCodeId("COM025");
		List<?> insttCodeResult = cmmUseService.selectCmmCodeDetail(vo);
		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> orgnztIdResult = cmmUseService.selectOgrnztIdDetail(vo);

		model.addAttribute("insttCodeResult", insttCodeResult); //소속기관코드목록
		model.addAttribute("orgnztIdResult", orgnztIdResult); //조직정보 목록

		AdminAdminManageVO adminAdminManageVO = new AdminAdminManageVO();
		adminAdminManageVO = adminAdminManageService.selectAdminDetail(user.getUniqId());
		model.addAttribute("adminAdminManageVO", adminAdminManageVO);
		
		String resultMsg = (String)request.getParameter("resultMsg");
		if (resultMsg != null && !resultMsg.isEmpty()) {
			model.addAttribute("resultMsg", resultMsg);
		}

		return "admin/sym/umt/adminEmplyrUpdt";
	}

	/**
	 * 수정후 메인 화면으로 이동한다.
	 */
	@RequestMapping("/admin/sym/umt/updateEmplyr.do")
	public String updateEmplyr(@ModelAttribute("adminAdminManageVO") AdminAdminManageVO adminAdminManageVO
			, BindingResult bindingResult
			, Model model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		beanValidator.validate(adminAdminManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/umt/updateEmplyrView.do";
		}
		
		adminAdminManageVO.setLastUpdusrId(user.getId());
		if ("".equals(adminAdminManageVO.getOrgnztId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setOrgnztId(null);
		}
		if ("".equals(adminAdminManageVO.getGroupId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			adminAdminManageVO.setGroupId(null);
		}
		adminAdminManageService.updateAdmin(adminAdminManageVO);
		
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", egovMessageSource.getMessage("success.common.update"));
		
		return "redirect:/admin/sym/umt/emplyrDetail.do";
	}
}
