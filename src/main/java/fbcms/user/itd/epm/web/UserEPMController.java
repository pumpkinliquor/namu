package fbcms.user.itd.epm.web;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
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
import fbcms.com.cmm.service.UserArticleService;

/**
* 채용(Employment)를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserEPMController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserEPMController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;
	
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
	 * 채용 안내 페이지
	 */
	@RequestMapping("/user/itd/epm/employmentGuide.do")
	public String selectPRSList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		AdminBoardVO boardVO = new AdminBoardVO();
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000009", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		String message = (String)request.getParameter("message");
		if (message != null && !message.isEmpty()) {
			model.addAttribute("message", message);
		}
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/employmentGuide");
	}
	
	/**
	 * 채용공고에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/itd/epm/selectEPADetail.do")
	public String selectEPADetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000009", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userEPADetail");
	}
	
	/**
	 * 입사지원에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/itd/epm/selectJACList.do")
	public String selectJACList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boardVO.setBbsId("BBSMSTR_000000000010");
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		AdminBoardMasterVO master = adminBBSMasterService.selectBBSMasterInf(vo);
		
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		if(FbcmsCommonUtils.mobileCheck(request)) { // 모바일인 경우
			boardVO.setPageSize(5);
		} else {
			boardVO.setPageSize(propertyService.getInt("pageSize"));
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = adminArticleService.selectJACList(boardVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACList");
	}
	
	/**
	 * 입사지원에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/itd/epm/selectJACDetail.do")
	public String selectJACDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		AdminBoardVO vo = adminArticleService.selectJACDetail(boardVO);
		model.addAttribute("result", vo);
		
		AdminBoardMasterVO master = new AdminBoardMasterVO();
		master.setBbsId(boardVO.getBbsId());
		
		AdminBoardMasterVO masterVo = adminBBSMasterService.selectBBSMasterInf(master);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = vo.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("fileList", result);
		model.addAttribute("boardMasterVO", masterVo);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACDetail");
	}

	/**
	 * 입사지원 등록을 위한 등록페이지로 이동한다.
	 */
	@RequestMapping("/user/itd/epm/insertJACView.do")
	public String insertJACView(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boardVO.setBbsId("BBSMSTR_000000000010");
		
		AdminBoardMasterVO bdMstr = new AdminBoardMasterVO();
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		
		bdMstr = adminBBSMasterService.selectBBSMasterInf(vo);
	
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACRegist");
	}

	/**
	 * 입사지원을 등록한다.
	 */
	@RequestMapping("/user/itd/epm/insertJAC.do")
	public String insertJAC(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
		, @ModelAttribute("board") AdminBoardVO board
		, HttpServletRequest request
		, BindingResult bindingResult
		, ModelMap model
		, RedirectAttributes redirectAttributes) throws Exception {
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			
			AdminBoardMasterVO master = new AdminBoardMasterVO();
			
			master.setBbsId(board.getBbsId());
			
			master = adminBBSMasterService.selectBBSMasterInf(master);
			
			model.addAttribute("boardMasterVO", master);
			
			return "user/itd/epm/userJACRegist";
		}
		
		List<FileVO> result = null;
		String atchFileId = "";
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}
		board.setAtchFileId(atchFileId);
		board.setNtcrId(board.getNtcrNm()); //게시물 통계 집계를 위해 등록자 ID 저장
		
		adminArticleService.insertArticle(board);
		
		// 관리자에게 메일 발송
		String employment = board.getNtcrNm() + "님의 입사지원";
		String subject = "비에비스 나무병원 " + employment + "이 등록되었습니다";
		String fromEmail = "jineyjun@namu.com";
		String fromUsername = "비에비스 나무병원 인사담당자";
		String toEmail = "recruit@namu.com"; // 콤마(,)로 여러개 나열
		
		// 메일에 출력할 텍스트
		String contentsSubject = "<span style=\"color:#00afaf\">" + employment + "이</span> 등록되었습니다";
		String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인해주세요</span>";
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
		
		return "redirect:/user/itd/epm/insertJACComplete.do";
	}

	/**
	 * 입사지원 완료페이지로 이동한다.
	 */
	@RequestMapping("/user/itd/epm/insertJACComplete.do")
	public String insertJACComplete(@ModelAttribute("board") AdminBoardVO vo
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACComplete");
	}

	/**
	 * 입사지원 조회페이지로 이동한다.
	 */
	@RequestMapping("/user/itd/epm/searchJACInfo.do")
	public String searchJACInfo(@ModelAttribute("board") AdminBoardVO vo
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		String errorCode = (String)request.getParameter("errorCode");
		if (errorCode != null && !errorCode.isEmpty()) {
			model.addAttribute("errorCode", errorCode);
		}
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACInfo");
	}

	/**
	 * 입사지원 수정을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/user/itd/epm/updateJACView.do")
	public String updateJACView(@ModelAttribute("board") AdminBoardVO board
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {

		board.setBbsId("BBSMSTR_000000000010");
		
		AdminBoardMasterVO bmvo = new AdminBoardMasterVO();
		AdminBoardVO bdvo = new AdminBoardVO();
		bmvo.setBbsId(board.getBbsId());
		
		bmvo = adminBBSMasterService.selectBBSMasterInf(bmvo);
		bdvo = adminArticleService.searchJACInfo(board);
		
		if(bdvo == null) {
			model.addAttribute("errorCode", "9999");
			return "redirect:/user/itd/epm/searchJACInfo.do";
		}
		
		// 첨부파일 정보 가져온다.
		String atchFileId = bdvo.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", bdvo);
		model.addAttribute("boardMasterVO", bmvo);
		model.addAttribute("fileList", result);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010700");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/epm/userJACUpdt");
	}

	/**
	 * 입사지원에 대한 내용을 수정한다.
	 */
	@RequestMapping("/user/itd/epm/updateJAC.do")
	public String updateJAC(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
			, @ModelAttribute("board") AdminBoard board
			, HttpServletRequest request
			, BindingResult bindingResult
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
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
	  	
		String atchFileId = vo.getAtchFileId();
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			
			AdminBoardMasterVO bmvo = new AdminBoardMasterVO();
			AdminBoardVO bdvo = new AdminBoardVO();
			
			bmvo.setBbsId(vo.getBbsId());
			
			bmvo = adminBBSMasterService.selectBBSMasterInf(bmvo);
			bdvo = adminArticleService.selectArticleDetail(boardVO);
			
			model.addAttribute("articleVO", bdvo);
			model.addAttribute("boardMasterVO", bmvo);
			
			return "user/itd/epm/userJACUpdt";
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!multiRequest.getFile("file_1").isEmpty()) {
			Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
			insertFiles.put("file0", multiRequest.getFile("file_1"));
			
			if (!"".equals(atchFileId)) {
				// 기존 첨부파일 삭제처리
				String deleteFileSn = "0";
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(atchFileId);
				fvo.setFileSn(deleteFileSn);
				
				fileMngService.deleteFileInf(fvo);

				List<FileVO> result = fileUtil.parseFileInf(insertFiles, "BBS_", 0, atchFileId, "");
				int fileMasterCnt = fileMngService.selectFileMaster(fvo);
				
				// 마스터 파일정보 없을경우 넣어준다.
				if(fileMasterCnt > 0) {
					fileMngService.updateFileInfs(result);
				} else {
					fileMngService.insertFileInfs(result);
				}
			} else {
				List<FileVO> _result = fileUtil.parseFileInf(insertFiles, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(_result);
				boardVO.setAtchFileId(atchFileId);
			}
		}
		
		adminArticleService.updateArticle(board);
		
		// 관리자에게 메일 발송
		String employment = board.getNtcrNm() + "님의 입사지원";
		String subject = "비에비스 나무병원 " + employment + "이 수정되었습니다";
		String fromEmail = "jineyjun@namu.com";
		String fromUsername = "비에비스 나무병원 인사담당자";
		String toEmail = "recruit@namu.com"; // 콤마(,)로 여러개 나열
		
		// 메일에 출력할 텍스트
		String contentsSubject = "<span style=\"color:#00afaf\">" + employment + "이</span> 수정되었습니다";
		String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인해주세요</span>";
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
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		redirectAttributes.addAttribute("message", "수정되었습니다.");
		
		return "redirect:/user/itd/epm/employmentGuide.do";
	}

	/**
	 * 입사지원에 대한 내용을 삭제한다.
	 */
	@RequestMapping("/user/itd/epm/deleteJAC.do")
	public String deleteJAC(HttpServletRequest request, @ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("board") AdminBoard board
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
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
		
		if (true) {
			adminArticleService.deleteArticle(board);
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		redirectAttributes.addAttribute("message", "삭제되었습니다.");
		
		return "redirect:/user/itd/epm/employmentGuide.do";
	}
}
