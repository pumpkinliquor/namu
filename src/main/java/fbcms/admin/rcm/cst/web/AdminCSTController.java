package fbcms.admin.rcm.cst.web;

import java.util.HashMap;
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
import fbcms.com.cop.cmt.service.ComArticleCommentService;

/**
 * 의료상담 관리를 위한 컨트롤러 클래스
 */

@Controller
public class AdminCSTController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCSTController.class);
	
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
	 * 의료상담에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/rcm/cst/selectCSTList.do")
	public String selectCSTList(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		articleVO.setBbsId("BBSMSTR_000000000015");
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		vo.setBbsId(articleVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		AdminBoardMasterVO master = adminBBSMasterService.selectBBSMasterInf(vo);
		
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
		
		//공지사항 추출
		List<AdminBoardVO> noticeList = adminArticleService.selectNoticeArticleList(articleVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		if(user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
		return "admin/rcm/cst/adminCSTList";
	}
	
	/**
	 * 의료상담에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/rcm/cst/selectCSTListExcel.do")
	public String selectCSTListExcel(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		
		
		return "admin/rcm/cst/adminCSTList";
	}
	
	/**
	 * 의료상담에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/admin/rcm/cst/selectCSTDetail.do")
	public String selectCSTDetail(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setLastUpdusrId(user.getUniqId());
		AdminBoardVO vo = adminArticleService.selectArticleDetail(articleVO);
		
		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		//비밀글은 작성자만 볼수 있음 
		if(!EgovStringUtil.isEmpty(vo.getSecretAt()) && vo.getSecretAt().equals("Y") && !user.getUniqId().equals(vo.getFrstRegisterId())) {
			return "forward:/admin/rcm/cst/selectCSTList.do";
		}
		
		AdminBoardMasterVO master = new AdminBoardMasterVO();
		
		master.setBbsId(articleVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		AdminBoardMasterVO masterVo = adminBBSMasterService.selectBBSMasterInf(master);
		
		//----------------------------
		// 2009.06.29 : 2단계 기능 추가
		// 2011.07.01 : 댓글 기능의 종속성 제거
		//----------------------------
		if (comArticleCommentService != null) {
			if (comArticleCommentService.canUseComment(articleVO.getBbsId())) {
				model.addAttribute("useComment", "true");
			}
		}
		////--------------------------
		
		model.addAttribute("boardMasterVO", masterVo);
		
		AdminBoardVO replyBoardVO = adminArticleService.selectArticleReply(vo);
		model.addAttribute("replyBoardVO", replyBoardVO);
		
		model.addAttribute("user", user);
	
		return "admin/rcm/cst/adminCSTDetail";
	}

	/**
	 * 의료상담에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 */
	@RequestMapping("/admin/rcm/cst/replyCSTView.do")
	public String addReplyBoardCST(@ModelAttribute("searchVO") AdminBoardVO result, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardVO articleVO = new AdminBoardVO();
		boardMasterVO.setBbsId(result.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
	
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		result = adminArticleService.selectArticleDetail(result);
		
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("result", result);
		
		AdminBoardVO replyBoardVO = adminArticleService.selectArticleReply(result);
		model.addAttribute("replyBoardVO", replyBoardVO);
		
		model.addAttribute("user", user);
		model.addAttribute("articleVO", articleVO);
		
		return "admin/rcm/cst/adminCSTReply";
	}

	/**
	 * 의료상담에 대한 답변을 등록한다.
	 */
	@RequestMapping("/admin/rcm/cst/replyCST.do")
	public String replyBoardCST(HttpServletRequest request, @ModelAttribute("searchVO") AdminBoardVO articleVO,
		@ModelAttribute("bdMstr") AdminBoardMaster bdMstr, @ModelAttribute("board") AdminBoardVO board, BindingResult bindingResult, ModelMap model
		) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/rcm/cst/replyCSTView.do";
		}
		
		board.setReplyAt("Y");
		board.setFrstRegisterId(user.getUniqId());
		board.setBbsId(board.getBbsId());
		board.setParnts(Long.toString(articleVO.getNttId()));
		board.setSortOrdr(articleVO.getSortOrdr());
		board.setReplyLc(Integer.toString(Integer.parseInt(articleVO.getReplyLc()) + 1));
		
		board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		
		adminArticleService.insertArticle(board);
		
		// 사용자에게 메일 발송
		String subject = "비에비스 나무병원 의료상담 답변이 등록되었습니다";
		String fromEmail = "kjh0082@namu.com";
		String fromUsername = "비에비스 나무병원 상담담당자";
		String toEmail = "kjh0082@namu.com"; // 콤마(,)로 여러개 나열
		
		AdminBoardVO result = adminArticleService.selectArticleDetail(articleVO);
		
		AdminBoardVO replyBoardVO = adminArticleService.selectArticleReply(result);
		model.addAttribute("replyBoardVO", replyBoardVO);
		
		// 메일에 출력할 텍스트
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNm", user.getName());
		String custom1 = "기타 문의";
		if(replyBoardVO.getCustom1().equals("1")) {
			custom1 = "비용관련 문의";
		} else if(replyBoardVO.getCustom1().equals("2")) {
			custom1 = "소화기 질환 증상 문의";
		} else if(replyBoardVO.getCustom1().equals("3")) {
			custom1 = "내시경 관련 문의(준비사항/과정 등)";
		} else if(replyBoardVO.getCustom1().equals("4")) {
			custom1 = "건강검진 문의(예약/추가검사 비용 등)";
		} else if(replyBoardVO.getCustom1().equals("5")) {
			custom1 = "수술관련 문의(수술준비사항 등)";
		} else if(replyBoardVO.getCustom1().equals("6")) {
			custom1 = "안티에이징/비만시술 문의";
		} else if(replyBoardVO.getCustom1().equals("7")) {
			custom1 = "유방/갑상선 질환 문의";
		} else if(replyBoardVO.getCustom1().equals("8")) {
			custom1 = "부인과 질환 문의";
		} else if(replyBoardVO.getCustom1().equals("9")) {
			custom1 = "만성질환(당뇨/고혈압 등) 문의";
		}
		
		map.put("custom1", custom1);
		map.put("nttSj", result.getNttSj());
		map.put("replyNttCn", replyBoardVO.getNttCn());
		
		StringBuffer sb = new StringBuffer();
		sb = FbcmsCommonUtils.sendEmailHtmlCST(request, map);
		
		Map<String, Object> mailMap = new HashMap<String, Object>();
		mailMap.put("subject", subject);
		mailMap.put("fromEmail", fromEmail);
		mailMap.put("fromUsername", fromUsername);
		mailMap.put("toEmail", toEmail);
		mailMap.put("sendHtml", sb.toString());
		
		FbcmsCommonUtils.sendMailSMTP(request, mailMap, model);
		
		return "redirect:/admin/rcm/cst/selectCSTList.do";
	}
}
