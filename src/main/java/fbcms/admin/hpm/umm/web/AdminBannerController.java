package fbcms.admin.hpm.umm.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.umm.service.AdminBanner;
import fbcms.admin.hpm.umm.service.AdminBannerService;
import fbcms.admin.hpm.umm.service.AdminBannerVO;
import fbcms.admin.hpm.umm.service.AdminPopup;
import fbcms.admin.hpm.umm.service.AdminPopupVO;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 사용자 메인배너에 대한 controller 클래스를 정의한다.
 */
@Controller
public class AdminBannerController {

	/** AdminBannerService */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** AdminBannerService */
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;

	/** AdminBannerService */
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	/** Message ID Generation */
	@Resource(name="egovBannerIdGnrService")
	private EgovIdGnrService egovBannerIdGnrService;
	
	/** AdminBannerService */
	@Resource(name = "AdminBannerService")
	private AdminBannerService adminBannerService;
	
	/** Validation 관련 */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 */
	@IncludedInfo(name="배너관리", order = 740 ,gid = 50)
	@RequestMapping(value="/admin/hpm/umm/selectBannerList.do")
	public String selectBannerList(@ModelAttribute("searchVO") AdminBannerVO searchVO
			, @ModelAttribute("bannerVO") AdminBannerVO adminBannerVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(adminBannerVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(adminBannerVO.getPageUnit());
		paginationInfo.setPageSize(adminBannerVO.getPageSize());
		
		adminBannerVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		adminBannerVO.setLastIndex(paginationInfo.getLastRecordIndex());
		adminBannerVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		adminBannerVO.setBannerList(adminBannerService.selectBannerList(adminBannerVO));
		
		model.addAttribute("resultList", adminBannerVO.getBannerList());
		
		int totCnt = adminBannerService.selectBannerListTotCnt(adminBannerVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
		
		return "admin/hpm/umm/adminBannerList";
	}
	
	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 */
	@RequestMapping(value="/admin/hpm/umm/selectBannerDetail.do")
	public String selectBanner(@ModelAttribute("searchVO") AdminBannerVO searchVO
			, @RequestParam("bannerId") String bannerId
			, @ModelAttribute("bannerVO") AdminBannerVO adminBannerVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		adminBannerVO.setBannerId(bannerId);
		
		model.addAttribute("banner", adminBannerService.selectBannerDetail(adminBannerVO));
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
		
		return "admin/hpm/umm/adminBannerDetail";
	}
	
	/**
	 * 배너등록 화면으로 이동한다.
	 */
	@RequestMapping(value="/admin/hpm/umm/insertBannerView.do")
	public String insertViewBanner(@ModelAttribute("searchVO") AdminBannerVO searchVO
			, @ModelAttribute("bannerVO") AdminBannerVO bannerVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		model.addAttribute("bannerVO", bannerVO);
		
		return "admin/hpm/umm/adminBannerRegist";
	}
	
	/**
	 * 배너정보를 신규로 등록한다.
	 */
	@RequestMapping(value="/admin/hpm/umm/insertBanner.do")
	public String insertBanner(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("banner") AdminBanner adminBanner
			, @ModelAttribute("bannerVO") AdminBannerVO bannerVO
			, BindingResult bindingResult
			, SessionStatus status
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(adminBanner, bindingResult); //validation 수행
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/insertBannerView.do";
		}
		List<FileVO> result = null;
		
		String uploadFolder = "";
		String bannerImage = "";
		String bannerImageFile = "";
		String atchFileId = "";
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if(!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BNR_", 0, "", uploadFolder);
			atchFileId = fileMngService.insertFileInfs(result);
			
			FileVO vo = result.get(0);
			Iterator<FileVO> iter = result.iterator();
			
			while (iter.hasNext()) {
				vo = iter.next();
				bannerImage = vo.getOrignlFileNm();
				bannerImageFile = vo.getStreFileNm();
			}
		}
					
		adminBanner.setBannerId(egovBannerIdGnrService.getNextStringId());
		adminBanner.setBannerImage(bannerImage);
		adminBanner.setBannerImageFile(atchFileId);
		adminBanner.setUserId(user.getId());
		bannerVO.setBannerId(adminBanner.getBannerId());
		status.setComplete();
		
		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
		model.addAttribute("banner", adminBannerService.insertBanner(adminBanner, bannerVO));
		
		return "redirect:/admin/hpm/umm/selectBannerList.do";
	}

	/**
	 * 팝업창관리 수정을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/admin/hpm/umm/updateBannerView.do")
	public String updateBannerView(@ModelAttribute("searchVO") AdminBannerVO searchVO
			, @ModelAttribute("banner") AdminBanner banner
			, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		banner.setFrstRegisterId(user.getUniqId());
		
		AdminBannerVO bannerVO = adminBannerService.selectBannerDetail(banner);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = bannerVO.getBannerImageFile();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("bannerVO", bannerVO);
		model.addAttribute("fileList", fileList);
		
		return "admin/hpm/umm/adminBannerUpdt";
	}
	
	/**
	 * 기 등록된 배너정보를 수정한다.
	 */
	@RequestMapping(value="/admin/hpm/umm/updateBanner.do")
	public String updateBanner(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("bannerVO") AdminBannerVO bannerVO
			, BindingResult bindingResult
			, SessionStatus status
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(bannerVO, bindingResult); //validation 수행
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/updateBannerView.do";
		}
		List<FileVO> result = null;
		
		String uploadFolder = "";
		String bannerImage = "";
		String bannerImageFile = "";
		String atchFileId = bannerVO.getBannerImageFile();
		
		// 기존 첨부파일 삭제처리
		String deleteFileYn1 = bannerVO.getDeleteFileYn1();
		if(deleteFileYn1.equals("Y")) {
			String deleteFileSn = bannerVO.getDeleteFileSn1();
			FileVO fvo = new FileVO();
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(deleteFileSn);
			fileMngService.deleteFileInf(fvo);
		}
		String deleteFileYn2 = bannerVO.getDeleteFileYn2();
		if(deleteFileYn2.equals("Y")) {
			String deleteFileSn = bannerVO.getDeleteFileSn2();
			FileVO fvo = new FileVO();
			fvo.setAtchFileId(atchFileId);
			fvo.setFileSn(deleteFileSn);
			fileMngService.deleteFileInf(fvo);
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BNR_", 0, "", uploadFolder);
			atchFileId = fileMngService.insertFileInfs(result);
			
			FileVO vo = null;
			Iterator<FileVO> iter = result.iterator();
			
			while (iter.hasNext()) {
				vo = iter.next();
				bannerImage = vo.getOrignlFileNm();
				bannerImageFile = vo.getStreFileNm();
			}
			
			if (vo == null) {
				bannerVO.setAtchFile(false);
			} else {
				bannerVO.setBannerImage(bannerImage);
				bannerVO.setBannerImageFile(atchFileId);
				bannerVO.setAtchFile(true);
			}
		} else { 
			bannerVO.setAtchFile(false);
		}
		
		bannerVO.setUserId(user.getId());
		
		adminBannerService.updateBanner(bannerVO);
		
		return "redirect:/admin/hpm/umm/selectBannerList.do";
	}
	
	/**
	 * 기 등록된 배너정보를 삭제한다.
	 */
	@RequestMapping(value="/admin/hpm/umm/removeBanner.do")
	public String deleteBanner(@RequestParam("bannerId") String bannerId
			, @ModelAttribute("bannerVO") AdminBannerVO adminBannerVO
			, SessionStatus status
			, ModelMap model) throws Exception {
		
		adminBannerVO.setBannerId(bannerId);
		adminBannerService.deleteBanner(adminBannerVO);
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		
		return "redirect:/admin/hpm/umm/selectBannerList.do";
	}
}
