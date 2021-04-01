package fbcms.admin.hpm.umm.web;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.umm.service.AdminPopup;
import fbcms.admin.hpm.umm.service.AdminPopupService;
import fbcms.admin.hpm.umm.service.AdminPopupVO;
import fbcms.com.cmm.FbcmsCommonUtils;

/**
 * 사용자 메인 팝업창에 대한 Controller를 정의한다.
 */
@Controller
public class AdminPopupController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminPopupController.class);
	
	/** AdminPopupService */
	@Resource(name = "AdminPopupService")
	private AdminPopupService adminPopupService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validation 관련 */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 팝업창관리 목록을 조회한다.
	 */
	@IncludedInfo(name = "팝업창관리", order = 720, gid = 50)
	@RequestMapping(value = "/admin/hpm/umm/selectPopupList.do")
	public String selectPopupList(@ModelAttribute("searchVO") AdminPopupVO searchVO
			, ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
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
		
		List<?> reusltList = adminPopupService.selectPopupList(searchVO);
		model.addAttribute("resultList", reusltList);
		
		int totCnt = adminPopupService.selectPopupListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/hpm/umm/adminPopupList";
	}
	
	/**
	 * 팝업창관리 목록을 상세조회 조회한다.
	 */
	@RequestMapping(value = "/admin/hpm/umm/selectPopupDetail.do")
	public String selectPopupDetail(@ModelAttribute("searchVO") AdminPopupVO searchVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		searchVO.setLastUpdusrId(user.getUniqId());
		AdminPopupVO popupVO = adminPopupService.selectPopupDetail(searchVO);
		
		model.addAttribute("popupVO", popupVO);
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		return "admin/hpm/umm/adminPopupDetail";
	}

	/**
	 * 팝업창관리 등록을 위한 등록페이지로 이동한다.
	 */
	@RequestMapping("/admin/hpm/umm/insertPopupView.do")
	public String insertPopupView(@ModelAttribute("searchVO") AdminPopupVO searchVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		model.addAttribute("popupVO", searchVO);
		
		return "admin/hpm/umm/adminPopupRegist";
	}

	/**
	 * 팝업창관리를 등록한다.
	 */
	@RequestMapping("/admin/hpm/umm/insertPopup.do")
	public String insertPopup(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminPopupVO searchVO
			, @ModelAttribute("popup") AdminPopupVO popup
			, BindingResult bindingResult
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		beanValidator.validate(popup, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/insertPopupView.do";
		}
		
		List<FileVO> result = null;
		String atchFileId = "";
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "POP_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		popup.setAtchFileId(atchFileId);
		popup.setFrstRegisterId(user.getUniqId());
		
		adminPopupService.insertPopup(popup);
		
		return "redirect:/admin/hpm/umm/selectPopupList.do";
	}

	/**
	 * 팝업창관리 수정을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/admin/hpm/umm/updatePopupView.do")
	public String updatePopupView(@ModelAttribute("searchVO") AdminPopupVO searchVO
			, @ModelAttribute("popup") AdminPopup popup
			, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		popup.setFrstRegisterId(user.getUniqId());
		
		AdminPopupVO popupVO = adminPopupService.selectPopupDetail(popup);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = popupVO.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("popupVO", popupVO);
		model.addAttribute("fileList", fileList);
		
		return "admin/hpm/umm/adminPopupUpdt";
	}

	/**
	 * 팝업창관리에 대한 내용을 수정한다.
	 */
	@RequestMapping("/admin/hpm/umm/updatePopup.do")
	public String updateBoardPopup(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminPopupVO searchVO
			, @ModelAttribute("popup") AdminPopup popup
			, BindingResult bindingResult
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		//--------------------------------------------------------------------------------------------
		// @ XSS 대응 권한체크 체크  START
		// param1 : 사용자고유ID(uniqId,esntlId)
		//--------------------------------------------------------
		LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
		//step1 DB에서 해당 게시물의 uniqId 조회
		AdminPopupVO vo = adminPopupService.selectPopupDetail(popup);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
	
		String atchFileId = popup.getAtchFileId();
	
		beanValidator.validate(popup, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/updatePopupView.do";
		}
		
		// 기존 첨부파일 삭제처리
		String deleteFileYn1 = searchVO.getDeleteFileYn1();
		if(deleteFileYn1.equals("Y")) {
			String deleteFileSn = searchVO.getDeleteFileSn1();
			FileVO fvo = new FileVO();
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(deleteFileSn);
			fileMngService.deleteFileInf(fvo);
		}
		String deleteFileYn2 = searchVO.getDeleteFileYn2();
		if(deleteFileYn2.equals("Y")) {
			String deleteFileSn = searchVO.getDeleteFileSn2();
			FileVO fvo = new FileVO();
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(deleteFileSn);
			fileMngService.deleteFileInf(fvo);
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			if ("".equals(atchFileId)) {
				List<FileVO> result = fileUtil.parseFileInf(files, "POP_", 0, atchFileId, "");
				atchFileId = fileMngService.insertFileInfs(result);
				popup.setAtchFileId(atchFileId);
			} else {
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(atchFileId);
				int cnt = fileMngService.getMaxFileSN(fvo);
				List<FileVO> _result = fileUtil.parseFileInf(files, "POP_", cnt, atchFileId, "");
				fileMngService.updateFileInfs(_result);
			}
		}
		
		popup.setLastUpdusrId(user.getUniqId());
		
		adminPopupService.updatePopup(popup);
		
		return "redirect:/admin/hpm/umm/selectPopupList.do";
	}

	/**
	 * 팝업창관리에 대한 내용을 삭제한다.
	 */
	@RequestMapping("/admin/hpm/umm/deletePopup.do")
	public String deleteBoardPopup(HttpServletRequest request
			, @ModelAttribute("searchVO") AdminPopupVO popupVO
			, @ModelAttribute("popup") AdminPopup popup
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		//--------------------------------------------------------------------------------------------
		// @ XSS 대응 권한체크 체크  START
		// param1 : 사용자고유ID(uniqId,esntlId)
		//--------------------------------------------------------
		LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
		//step1 DB에서 해당 게시물의 uniqId 조회
		AdminPopupVO vo = adminPopupService.selectPopupDetail(popup);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
		
	  	popup.setLastUpdusrId(user.getUniqId());
		adminPopupService.deletePopup(popup);
		
		return "redirect:/admin/hpm/umm/selectPopupList.do";
	}
}