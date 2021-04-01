package fbcms.user.cts.cst.web;

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
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.com.cop.tpl.service.EgovTemplateManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;
import fbcms.com.cop.cmt.service.ComArticleCommentService;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
 */

@Controller
public class UserCSTController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserCSTController.class);
	
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
	
	@Resource(name = "ComArticleCommentService")
	protected ComArticleCommentService comArticleCommentService;

	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService egovTemplateManageService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 의료상담 첫 페이지
	 */
	@RequestMapping("/user/cts/cst/medicalConsultation.do")
	public String map(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060800");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/cst/medicalConsultation");
	}
	
	/**
	 * 의료상담에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/cts/cst/selectCSTList.do")
	public String selectCSTList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		boardVO.setFrstRegisterId(user.getUniqId());
		userArticleService.selectCSTList(boardVO, request, response, model, "BBSMSTR_000000000015", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "060800");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/cst/userCSTList");
	}
	
	/**
	 * 의료상담에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/cts/cst/selectCSTDetail.do")
	public String selectCSTDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000015", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "060800");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/cst/userCSTDetail");
	}

	/**
	 * 의료상담 등록을 위한 등록페이지로 이동한다.
	 */
	@RequestMapping("/user/cts/cst/insertCSTView.do")
	public String insertCSTView(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		boardVO.setBbsId("BBSMSTR_000000000015");
		
		AdminBoardMasterVO bdMstr = new AdminBoardMasterVO();
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		
		bdMstr = adminBBSMasterService.selectBBSMasterInf(vo);
	
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060800");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/cst/userCSTRegist");
	}

	/**
	 * 의료상담을 등록한다.
	 */
	@RequestMapping("/user/cts/cst/insertCST.do")
	public String insertCST(HttpServletRequest request
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
			, @ModelAttribute("board") AdminBoardVO board
			, BindingResult bindingResult
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		board.setNtcrId(board.getNtcrNm()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setFrstRegisterId(user.getUniqId());
		
		adminArticleService.insertArticle(board);
		
		// 관리자에게 메일 발송
		AdminBoardVO articleVO = new AdminBoardVO();
		articleVO.setBbsId(board.getBbsId());
		AdminBoardVO result = adminArticleService.selectArticleDetail(articleVO);

		String reservation = user.getName() + "님의 의료상담";
		String subject = "비에비스 나무병원 " + reservation + "이 등록되었습니다";
		String fromEmail = "jineyjun@namu.com";
		String fromUsername = "비에비스 나무병원 관리자";
		String toEmail = "kjh0082@namu.com"; // 콤마(,)로 여러개 나열
		
		// 메일에 출력할 텍스트
		String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 등록되었습니다";
		String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 답변을 작성해주세요</span>";
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
		
		return "redirect:/user/cts/cst/selectCSTList.do";
	}

	/**
	 * 의료상담 수정을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/user/cts/cst/updateCSTView.do")
	public String updateCSTView(@ModelAttribute("board") AdminBoardVO board
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		
		board.setBbsId("BBSMSTR_000000000015");
		
		AdminBoardMasterVO bmvo = new AdminBoardMasterVO();
		AdminBoardVO bdvo = new AdminBoardVO();
		bmvo.setBbsId(board.getBbsId());
		
		bmvo = adminBBSMasterService.selectBBSMasterInf(bmvo);
		bdvo = adminArticleService.selectArticleDetail(board);
		
		if(bdvo == null) {
			model.addAttribute("resultMsg", "수정할수 있는 권한이 없습니다.");
			return "redirect:/user/cts/cst/selectCSTList.do";
		}
		
		// 첨부파일 정보 가져온다.
		String atchFileId = bdvo.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", bdvo);
		model.addAttribute("boardMasterVO", bmvo);
		model.addAttribute("fileList", result);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060800");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/cst/userCSTUpdt");
	}

	/**
	 * 의료상담에 대한 내용을 수정한다.
	 */
	@RequestMapping("/user/cts/cst/updateCST.do")
	public String updateCST(HttpServletRequest request
			, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
			, @ModelAttribute("board") AdminBoard board
			, BindingResult bindingResult
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/user/lgn/sin/userLogin.do";
		}
			  	
		board.setLastUpdusrId(user.getUniqId());
		adminArticleService.updateArticle(board);
		
		model.addAttribute("bbsId", board.getBbsId());
		model.addAttribute("pageIndex", "1");
		
		// 관리자에게 메일 발송
		AdminBoardVO articleVO = new AdminBoardVO();
		articleVO.setBbsId(board.getBbsId());
		AdminBoardVO result = adminArticleService.selectArticleDetail(articleVO);

		String reservation = user.getName() + "님의 의료상담";
		String subject = "비에비스 나무병원 " + reservation + "이 수정되었습니다";
		String fromEmail = "jineyjun@namu.com";
		String fromUsername = "비에비스 나무병원 관리자";
		String toEmail = "kjh0082@namu.com"; // 콤마(,)로 여러개 나열
		
		// 메일에 출력할 텍스트
		String contentsSubject = "<span style=\"color:#00afaf\">" + reservation + "이</span> 수정되었습니다";
		String contentsHtml = "<span style=\"font-weight:bold;color:#333;\">확인 후 답변을 작성해주세요</span>";
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
		
		return "redirect:/user/cts/cst/selectCSTList.do";
	}

	/**
	 * 의료상담에 대한 내용을 삭제한다.
	 */
	@RequestMapping("/user/cts/cst/deleteCST.do")
	public String deleteCST(HttpServletRequest request, @ModelAttribute("searchVO") AdminBoardVO boardVO
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
		
		adminArticleService.deleteArticle(board);
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/user/cts/cst/selectCSTList.do";
	}
	
	/**
	 * 제증명발급
	 */
	@RequestMapping("/user/cts/pro/proof.do")
	public String f_proof01(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060500");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/pro/proof");
	}
	
	/**
	 * 입원안내
	 */
	@RequestMapping("/user/cts/gui/guide.do")
	public String f_guide01(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060400");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/gui/guide");
	}
}
