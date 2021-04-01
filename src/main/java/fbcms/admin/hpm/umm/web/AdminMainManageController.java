package fbcms.admin.hpm.umm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
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
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.umm.service.AdminMainManageService;
import fbcms.com.cmm.FbcmsCommonUtils;
import jdk.net.NetworkPermission;

/**
 * 사용자 메인 관리에 대한 Controller를 정의한다.
 */
@Controller
public class AdminMainManageController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMainManageController.class);
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    /** EgovFileMngService */
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	/** EgovFileMngUtil */
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
    /** AdminMainManageService */
	@Resource(name = "AdminMainManageService")
    private AdminMainManageService adminMainManageService;
	
	/** AdminArticleService */
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	/** AdminBBSMasterService */
	@Resource(name = "AdminBBSMasterService")
	private AdminBBSMasterService adminBBSMasterService;
	
	/** Validation 관련 */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
     * 메인관리 목록을 조회한다.
     */
    @RequestMapping(value="/admin/hpm/umm/selectMainManageList.do")
    public String selectMainManageList(ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000012");
		adminBoardVO.setSearchCnd("5");
		
		List<AdminBoardVO> listMainVisual = adminMainManageService.selectMainManageList(adminBoardVO);
		
		adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000013");
		adminBoardVO.setSearchCnd("3");
		
		List<AdminBoardVO> listMajorService = adminMainManageService.selectMainManageList(adminBoardVO);
		
		adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000014");
		adminBoardVO.setSearchCnd("5");
		
		List<AdminBoardVO> listPromotion = adminMainManageService.selectMainManageList(adminBoardVO);

        model.addAttribute("listMainVisual", listMainVisual);
        model.addAttribute("listMajorService", listMajorService);
        model.addAttribute("listPromotion", listPromotion);
        
        return "admin/hpm/umm/adminMainManageList";
    }
    
    /**
     * 메인비주얼을 등록 전 단계처리
     */
    @RequestMapping("/admin/hpm/umm/insertMainVisualView.do")
    public String insertMainVisualView(Model model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000012");
		
		AdminBoardMasterVO bdMstr = new AdminBoardMasterVO();
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(adminBoardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		model.addAttribute("articleVO", adminBoardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
        return "admin/hpm/umm/adminMainVisualRegist";
    }
    
    /**
     * 메인비주얼을 등록한다.
     */
    @RequestMapping("/admin/hpm/umm/insertMainVisual.do")
    public String insertMainVisual(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("boardVO") AdminBoardVO boardVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(boardVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/insertMainVisualView.do";
		}
		
		List<FileVO> result = null;
		String atchFileId = "";
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		boardVO.setAtchFileId(atchFileId);
		boardVO.setFrstRegisterId(user.getUniqId());
		
		boardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		boardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		boardVO.setNttCn(FbcmsCommonUtils.unscript(boardVO.getNttCn()));	// XSS 방지
		adminArticleService.insertArticle(boardVO);
        
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 메인비주얼을 수정하기 전 단계처리
     */
    @RequestMapping("/admin/hpm/umm/updateMainVisualView.do")
    public String updateMainVisualView(@ModelAttribute("boardVO") AdminBoardVO boardVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		boardVO.setFrstRegisterId(user.getUniqId());
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardVO articleVO = new AdminBoardVO();
		
		boardVO.setBbsId(boardVO.getBbsId());
		
		boardMasterVO.setBbsId(boardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		articleVO = adminArticleService.selectArticleDetail(boardVO);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = articleVO.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("fileList", fileList);
		
        return "admin/hpm/umm/adminMainVisualUpdt";
    }
	
    /**
     * 메인비주얼을 수정 처리한다
     */
    @RequestMapping("/admin/hpm/umm/updateMainVisual.do")
    public String updateMainVisual(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("searchVO") AdminBoardVO boardVO
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("board") AdminBoard board
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
		AdminBoardVO vo = adminArticleService.selectArticleDetail(boardVO);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
	  	
		String atchFileId = boardVO.getAtchFileId();
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/updateMainVisualView.do";
		}
		
		// 첨부파일 처리
		for (int i = 0; i < 2; i++) {
			if (!multiRequest.getFile("file_"+(i+1)).isEmpty()) {
				Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
				insertFiles.put("file0", multiRequest.getFile("file_"+(i+1)));
				
				if (!"".equals(atchFileId)) {
					// 기존 첨부파일 삭제처리
					String deleteFileSn = ""+i;
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					fvo.setFileSn(deleteFileSn);
					
					fileMngService.deleteFileInf(fvo);
					
					List<FileVO> result = fileUtil.parseFileInf(insertFiles, "BBS_", i, atchFileId, "");
					fileMngService.updateFileInfs(result);
				} else {
					List<FileVO> _result = fileUtil.parseFileInf(insertFiles, "BBS_", i, "", "");
					atchFileId = fileMngService.insertFileInfs(_result);
					boardVO.setAtchFileId(atchFileId);
				}
			}
		}
		
		board.setLastUpdusrId(user.getUniqId());
		
		board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		
		adminArticleService.updateArticle(board);
		
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 메인비주얼을 삭제한다.
     */
    @RequestMapping("/admin/hpm/umm/deleteMainVisual.do")
    public String deleteMainVisual(HttpServletRequest request
    		, @ModelAttribute("adminBoardVO") AdminBoardVO adminBoardVO
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
		AdminBoardVO vo = adminArticleService.selectArticleDetail(adminBoardVO);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
		
	  	adminBoardVO.setLastUpdusrId(user.getUniqId());
		adminArticleService.deleteArticle(adminBoardVO);
		
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 주요서비스를 수정하기 전 단계처리
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/admin/hpm/umm/updateMajorServiceView.do")
    public String updateMajorServiceView(ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		
		adminBoardVO.setBbsId("BBSMSTR_000000000013");
		adminBoardVO.setFrstRegisterId(user.getUniqId());
		adminBoardVO.setSearchCnd("3");
		
		boardMasterVO.setBbsId(adminBoardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		List<AdminBoardVO> resultList = adminMainManageService.selectMainManageList(adminBoardVO);
		if(resultList.size() < 1) {
			return "admin/hpm/umm/adminMajorServiceRegist";
		}
		
		if(resultList != null && resultList.size() > 0) {
			// 첨부파일 정보 가져온다.
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("fileList1", fileList);
		}
		if(resultList != null && resultList.size() > 1) {
			// 첨부파일 정보 가져온다.
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(resultList.get(1).getAtchFileId());
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("fileList2", fileList);
		}
		if(resultList != null && resultList.size() > 2) {
			// 첨부파일 정보 가져온다.
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(resultList.get(2).getAtchFileId());
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("fileList3", fileList);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("boardMasterVO", boardMasterVO);
		
        return "admin/hpm/umm/adminMajorServiceUpdt";
    }
    
    /**
     * 주요서비스를 등록한다.
     */
    @RequestMapping("/admin/hpm/umm/insertMajorService.do")
    public String insertMajorService(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("boardVO") AdminBoardVO boardVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String[] arrayNttSj = multiRequest.getParameterValues("nttSj");
		String[] arrayCustom2 = multiRequest.getParameterValues("custom2");
		String[] arrayCustom3 = multiRequest.getParameterValues("custom3");
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		for (int i = 0; i < 3; i++) { 
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000013");
			adminBoardVO.setNttSj(arrayNttSj[i]);
			adminBoardVO.setCustom2(arrayCustom2[i]);
			adminBoardVO.setCustom3(arrayCustom3[i]);
			adminBoardVO.setPostingYn("Y");
			
			beanValidator.validate(adminBoardVO, bindingResult);
			if (bindingResult.hasErrors()) {
				model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
				return "redirect:/admin/hpm/umm/updateMajorServiceView.do";
			}
			
			List<FileVO> result = null;
			String atchFileId = "";
			
			if (!files.isEmpty()) {
				Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
				insertFiles.put("file0", multiRequest.getFile("file_1_"+i));
				insertFiles.put("file1", multiRequest.getFile("file_2_"+i));
				result = fileUtil.parseFileInf(insertFiles, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			adminBoardVO.setAtchFileId(atchFileId);
			adminBoardVO.setFrstRegisterId(user.getUniqId());
			
			adminBoardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			adminBoardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(adminBoardVO.getNttCn()));	// XSS 방지
			adminArticleService.insertArticle(adminBoardVO);
		}
        
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
	
    /**
     * 주요서비스를 수정 처리한다
     */
    @SuppressWarnings("unchecked")
	@RequestMapping("/admin/hpm/umm/updateMajorService.do")
    public String updateMajorService(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("boardVO") AdminBoardVO boardVO
    		, @ModelAttribute("acticleVO") AdminBoardVO acticleVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		String[] arrayNttId = multiRequest.getParameterValues("arrayNttId");
		String[] arrayNttSj = multiRequest.getParameterValues("nttSj");
		String[] arrayCustom2 = multiRequest.getParameterValues("custom2");
		String[] arrayCustom3 = multiRequest.getParameterValues("custom3");
		
		for (int i = 0; i < 3; i++) { 
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000013");
			adminBoardVO.setNttId(Long.parseLong(arrayNttId[i]));
			adminBoardVO.setNttSj(arrayNttSj[i]);
			adminBoardVO.setCustom2(arrayCustom2[i]);
			adminBoardVO.setCustom3(arrayCustom3[i]);
			adminBoardVO.setPostingYn("Y");
			
			AdminBoardVO bdvo = adminArticleService.selectArticleDetail(adminBoardVO);
			String atchFileId = bdvo.getAtchFileId();
			adminBoardVO.setAtchFileId(atchFileId);
			
			beanValidator.validate(adminBoardVO, bindingResult);
			if (bindingResult.hasErrors()) {
				model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
				return "redirect:/admin/hpm/umm/updateMajorServiceView.do";
			}
			
			// 첨부파일 처리
			for (int j = 0; j < 2; j++) {
				if (!multiRequest.getFile("file_"+(j+1) + "_" + i).isEmpty()) {
					Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
					insertFiles.put("file0", multiRequest.getFile("file_"+(j+1) + "_" + i));
					
					if (!"".equals(atchFileId)) {
						// 기존 첨부파일 삭제처리
						String deleteFileSn = ""+j;
						FileVO fvo = new FileVO();
						fvo.setAtchFileId(atchFileId);
						fvo.setFileSn(deleteFileSn);
						
						fileMngService.deleteFileInf(fvo);
						
						List<FileVO> result = fileUtil.parseFileInf(insertFiles, "BBS_", j, atchFileId, "");
						fileMngService.updateFileInfs(result);
					} else {
						List<FileVO> _result = fileUtil.parseFileInf(insertFiles, "BBS_", j, "", "");
						atchFileId = fileMngService.insertFileInfs(_result);
						adminBoardVO.setAtchFileId(atchFileId);
					}
				}
			}
			
			adminBoardVO.setLastUpdusrId(user.getUniqId());
			
			adminBoardVO.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			adminBoardVO.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			
			adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(adminBoardVO.getNttCn()));	// XSS 방지
			
			adminArticleService.updateArticle(adminBoardVO);
    	}
		
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 프로모션을 등록 전 단계처리
     */
    @RequestMapping("/admin/hpm/umm/insertPromotionView.do")
    public String insertPromotionView(Model model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000014");
		
		AdminBoardMasterVO bdMstr = new AdminBoardMasterVO();
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(adminBoardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		model.addAttribute("articleVO", adminBoardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
        return "admin/hpm/umm/adminPromotionRegist";
    }
    
    /**
     * 프로모션을 등록한다.
     */
    @RequestMapping("/admin/hpm/umm/insertPromotion.do")
    public String insertPromotion(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("boardVO") AdminBoardVO boardVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(boardVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/insertPromotionView.do";
		}
		
		List<FileVO> result = null;
		String atchFileId = "";
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		boardVO.setAtchFileId(atchFileId);
		boardVO.setFrstRegisterId(user.getUniqId());
		
		boardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		boardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		boardVO.setNttCn(FbcmsCommonUtils.unscript(boardVO.getNttCn()));	// XSS 방지
		adminArticleService.insertArticle(boardVO);
        
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 프로모션을 수정하기 전 단계처리
     */
    @RequestMapping("/admin/hpm/umm/updatePromotionView.do")
    public String updatePromotionView(@ModelAttribute("boardVO") AdminBoardVO boardVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		boardVO.setFrstRegisterId(user.getUniqId());
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardVO articleVO = new AdminBoardVO();
		
		boardVO.setBbsId(boardVO.getBbsId());
		
		boardMasterVO.setBbsId(boardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		articleVO = adminArticleService.selectArticleDetail(boardVO);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = articleVO.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("fileList", fileList);
		
        return "admin/hpm/umm/adminPromotionUpdt";
    }
	
    /**
     * 프로모션을 수정 처리한다
     */
    @RequestMapping("/admin/hpm/umm/updatePromotion.do")
    public String updatePromotion(final MultipartHttpServletRequest multiRequest
    		, @ModelAttribute("searchVO") AdminBoardVO boardVO
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("board") AdminBoard board
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
		AdminBoardVO vo = adminArticleService.selectArticleDetail(boardVO);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
	  	
		String atchFileId = boardVO.getAtchFileId();
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/umm/updateMainVisualView.do";
		}
		
		// 첨부파일 처리
		for (int i = 0; i < 2; i++) {
			if (!multiRequest.getFile("file_"+(i+1)).isEmpty()) {
				Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
				insertFiles.put("file0", multiRequest.getFile("file_"+(i+1)));
				
				if (!"".equals(atchFileId)) {
					// 기존 첨부파일 삭제처리
					String deleteFileSn = ""+i;
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					fvo.setFileSn(deleteFileSn);
					
					fileMngService.deleteFileInf(fvo);
					
					List<FileVO> result = fileUtil.parseFileInf(insertFiles, "BBS_", i, atchFileId, "");
					fileMngService.updateFileInfs(result);
				} else {
					List<FileVO> _result = fileUtil.parseFileInf(insertFiles, "BBS_", i, "", "");
					atchFileId = fileMngService.insertFileInfs(_result);
				}
			}
		}
		
		board.setLastUpdusrId(user.getUniqId());
		
		board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		
		adminArticleService.updateArticle(board);
		
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
    
    /**
     * 프로모션을 삭제한다.
     */
    @RequestMapping("/admin/hpm/umm/deletePromotion.do")
    public String deletePromotion(HttpServletRequest request
    		, @ModelAttribute("adminBoardVO") AdminBoardVO adminBoardVO
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
		AdminBoardVO vo = adminArticleService.selectArticleDetail(adminBoardVO);
		
		//step2 EgovXssChecker 공통모듈을 이용한 권한체크
		EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
		
	  	adminBoardVO.setLastUpdusrId(user.getUniqId());
		adminArticleService.deleteArticle(adminBoardVO);
		
        return "redirect:/admin/hpm/umm/selectMainManageList.do";
    }
}
