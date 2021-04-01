package fbcms.com.cmm.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.umm.service.AdminBannerVO;
import fbcms.admin.hpm.umm.service.AdminMainManageService;
import fbcms.admin.hpm.umm.service.AdminPopupVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;

/**
* 사용자 메인화면을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserMainController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserMainController.class);
	
	/** UserArticleService */
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;
	
    /** AdminMainManageService */
	@Resource(name = "AdminMainManageService")
    private AdminMainManageService adminMainManageService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	
	/**
	 * 사용자 메인화면
	 */
	@RequestMapping("/index.do")
	public String userMain(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		AdminBoardVO boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000001"); // 공지사항
		boardVO.setRecordCountPerPage(5);
		boardVO.setPostingYn("Y");
		List<AdminBoardVO> mainNTCList = userArticleService.selectMiniboardList(boardVO);
		
		boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000002"); // 언론보도
		boardVO.setRecordCountPerPage(5);
		boardVO.setPostingYn("Y");
		List<AdminBoardVO> mainPRSList = userArticleService.selectMiniboardList(boardVO);
		
		boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000012"); // 메인비주얼
		boardVO.setPostingYn("Y");
		List<AdminBoardVO> mainMainVisualList = userArticleService.selectMiniboardMainManageList(boardVO);
		
		boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000013"); // 주요서비스
		boardVO.setRecordCountPerPage(3);
		List<AdminBoardVO> mainMajorServiceList = userArticleService.selectMiniboardMainManageList(boardVO);
		
		boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000014"); // 프로모션
		boardVO.setRecordCountPerPage(5);
		boardVO.setPostingYn("Y");
		List<AdminBoardVO> resultTmpList = userArticleService.selectMiniboardMainManageList(boardVO);
		List<AdminBoardVO> mainPromotionList = new ArrayList<AdminBoardVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < resultTmpList.size(); i++) {
			AdminBoardVO fileBoardVO = (AdminBoardVO) resultTmpList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(fileBoardVO.getAtchFileId());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			fileBoardVO.setListFile(listFile);
			mainPromotionList.add(fileBoardVO);
		}
		
		AdminBannerVO bannerVO = new AdminBannerVO();
		bannerVO.setRecordCountPerPage(5);
		bannerVO.setPostingYn("Y");
		List<AdminBannerVO> mainTopBannerFileList = userArticleService.selectMainTopBannerList(bannerVO);
		List<AdminBannerVO> mainTopBannerList = new ArrayList<AdminBannerVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < mainTopBannerFileList.size(); i++) {
			AdminBannerVO fileBoardVO = (AdminBannerVO) mainTopBannerList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(fileBoardVO.getBannerImageFile());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			fileBoardVO.setListFile(listFile);
			mainTopBannerList.add(fileBoardVO);
		}
		
		Cookie[] arrCookie = request.getCookies();
		if(arrCookie != null) {
			for(int i = 0; i < arrCookie.length; i++) {
				Cookie cookie = arrCookie[i];
				if(cookie.getName().equals("vievis_topBanner")) {
					model.addAttribute("mainTopBannerCookie", cookie.getValue());
				}
				if(cookie.getName().equals("vievis_mainPopup01")) {
					model.addAttribute("mainPopupCookie01", cookie.getValue());
				}
				if(cookie.getName().equals("vievis_mainPopup02")) {
					model.addAttribute("mainPopupCookie02", cookie.getValue());
				}
			}
		}
		
		AdminPopupVO popupVO = new AdminPopupVO();
		popupVO.setRecordCountPerPage(5);
		popupVO.setNtceAt("Y");
		List<AdminPopupVO> mainPopupList = userArticleService.selectMainPopupList(popupVO);
		
		// 의료진
		List<?> mainDoctorList = userArticleService.selectDoctorList();
		List<EgovMap> mainDoctorFileList = new ArrayList<EgovMap>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < mainDoctorList.size(); i++) {
			EgovMap fileBoardVO = (EgovMap) mainDoctorList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId((String) fileBoardVO.get("atchFileId"));
			fileVO.setFileSn("0");
			FileVO filePcVO = fileMngService.selectFileInf(fileVO);
			fileVO = new FileVO();
			fileVO.setAtchFileId((String) fileBoardVO.get("atchFileIdMobile"));
			fileVO.setFileSn("0");
			FileVO fileMobileVO = fileMngService.selectFileInf(fileVO);
			
			List<FileVO> listFile = new ArrayList<FileVO>();
			listFile.add(filePcVO);
			listFile.add(fileMobileVO);
			fileBoardVO.put("listFile", listFile);
			mainDoctorFileList.add(fileBoardVO);
		}
		
		model.addAttribute("mainTopBannerList", mainTopBannerList);
		model.addAttribute("mainPopupList", mainPopupList);
		model.addAttribute("mainPRSList", mainPRSList);
		model.addAttribute("mainNTCList", mainNTCList);
        model.addAttribute("mainMainVisualList", mainMainVisualList);
        model.addAttribute("mainMajorServiceList", mainMajorServiceList);
        model.addAttribute("mainPromotionList", mainPromotionList);
        model.addAttribute("mainDoctorList", mainDoctorList);
        model.addAttribute("mainDoctorFileList", mainDoctorFileList);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/userMain");
	}
	
	/**
	 * 알림톡 추가 리다이렉트
	 */
	@RequestMapping("/cts/location/map.do")
	public String mapRedirect(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		return "redirect:/user/cts/location/map.do";
	}
	@RequestMapping("/cuc/pct/precautions.do")
	public String precautionsRedirect(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		String tab = (String) request.getParameter("tab");
		if(tab == null || tab.equals("")) {
			return "redirect:/user/cuc/pct/precautions.do";
		}
		return "redirect:/user/cuc/pct/precautions.do?tab="+tab;
	}
}
