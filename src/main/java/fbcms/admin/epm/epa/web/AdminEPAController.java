package fbcms.admin.epm.epa.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 채용공고(EmPloymentAnnouncement)을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class AdminEPAController {
	
private static final Logger LOGGER = LoggerFactory.getLogger(AdminEPAController.class);
	
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	@Resource(name = "AdminBBSMasterService")
	private AdminBBSMasterService adminBBSMasterService;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 채용공고 게시물에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/epm/epa/selectEPAList.do")
	public String selectEPAList(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setBbsId("BBSMSTR_000000000009");
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		vo.setBbsId(articleVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		AdminBoardMasterVO boardMasterVO = adminBBSMasterService.selectBBSMasterInf(vo);
		
		articleVO.setPageUnit(propertyService.getInt("pageUnit"));
		articleVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(articleVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(articleVO.getPageUnit());
		paginationInfo.setPageSize(articleVO.getPageSize());
		
		articleVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		articleVO.setLastIndex(paginationInfo.getLastRecordIndex());
		articleVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = adminArticleService.selectArticleList(articleVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		if(user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/epm/epa/adminEPAList";
	}
	
	/**
	 * 채용공고 게시물에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/epm/epa/selectEPAListExcel.do")
	public String selectEPAListExcel(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, ModelMap model) throws Exception {
		
		
		return "admin/epm/epa/adminEPAList";
	}
	
	/**
	 * 채용공고 게시물에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/admin/epm/epa/selectEPADetail.do")
	public String selectEPADetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		boardVO.setLastUpdusrId(user.getUniqId());
		AdminBoardVO result = adminArticleService.selectArticleDetail(boardVO);
		
		model.addAttribute("result", result);
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		AdminBoardMasterVO master = new AdminBoardMasterVO();
		
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		AdminBoardMasterVO boardMasterVO = adminBBSMasterService.selectBBSMasterInf(master);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = result.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		model.addAttribute("fileList", fileList);
	
		model.addAttribute("boardMasterVO", boardMasterVO);
	
		return "admin/epm/epa/adminEPADetail";
	}

	/**
	 * 채용공고 게시물 등록을 위한 등록페이지로 이동한다.
	 */
	@RequestMapping("/admin/epm/epa/insertEPAView.do")
	public String insertEPAView(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setBbsId("BBSMSTR_000000000009");
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(articleVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(vo);
	
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
	
		return "admin/epm/epa/adminEPARegist";
	}

	/**
	 * 채용공고 게시물을 등록한다.
	 */
	@RequestMapping("/admin/epm/epa/insertEPA.do")
	public String insertEPA(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
			, @ModelAttribute("board") AdminBoardVO board
			, BindingResult bindingResult
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/epm/epa/insertEPAView.do";
		}
	
		if (isAuthenticated) {
			List<FileVO> result = null;
			String atchFileId = "";
			
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			board.setAtchFileId(atchFileId);
			board.setFrstRegisterId(user.getUniqId());
			board.setBbsId(boardVO.getBbsId());
			board.setBlogId(boardVO.getBlogId());
			
			board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
			adminArticleService.insertArticle(board);
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		return "redirect:/admin/epm/epa/selectEPAList.do";
	}

	/**
	 * 채용공고 게시물 수정을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/admin/epm/epa/updateEPAView.do")
	public String updateEPAView(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("board") AdminBoardVO vo
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
		
		vo.setBbsId(boardVO.getBbsId());
		
		boardMasterVO.setBbsId(boardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		articleVO = adminArticleService.selectArticleDetail(boardVO);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = articleVO.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("fileList", result);
		
		return "admin/epm/epa/adminEPAUpdt";
	}

	/**
	 * 채용공고 게시물에 대한 내용을 수정한다.
	 */
	@RequestMapping("/admin/epm/epa/updateEPA.do")
	public String updateEPA(final MultipartHttpServletRequest multiRequest
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
			return "redirect:/admin/epm/epa/updateEPAView.do";
		}
		
		if (isAuthenticated) {
			// 기존 첨부파일 삭제처리
			String deleteFileYn1 = boardVO.getDeleteFileYn1();
			if(deleteFileYn1.equals("Y")) {
				String deleteFileSn = boardVO.getDeleteFileSn1();
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(atchFileId);
				fvo.setFileSn(deleteFileSn);
				fileMngService.deleteFileInf(fvo);
			}
			
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
					List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
					atchFileId = fileMngService.insertFileInfs(result);
					board.setAtchFileId(atchFileId);
				} else {
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					int cnt = fileMngService.getMaxFileSN(fvo);
					List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
					fileMngService.updateFileInfs(_result);
				}
			}
			
			board.setLastUpdusrId(user.getUniqId());
			
			board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			
			board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
			
			adminArticleService.updateArticle(board);
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/epm/epa/selectEPAList.do";
	}

	/**
	 * 채용공고 게시물에 대한 내용을 삭제한다.
	 */
	@RequestMapping("/admin/epm/epa/deleteEPA.do")
	public String deleteEPA(HttpServletRequest request
			, @ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("board") AdminBoard board
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
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
		EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
		
		if (isAuthenticated) {
			board.setLastUpdusrId(user.getUniqId());
			adminArticleService.deleteArticle(board);
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/epm/epa/selectEPAList.do";
	}
}
