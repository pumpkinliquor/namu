package fbcms.admin.hpm.bbs.web;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.dsjdf.jdf.DateTime;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
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
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cop.cmt.service.ComArticleCommentService;
import fbcms.user.cts.rsv.service.ReservationVO;

/**
 * ????????? ????????? ?????? ???????????? ?????????
 */
@Controller
public class AdminArticleController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminArticleController.class);
	
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

    @Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
    
    @Resource(name="AdminSBMService")
	private AdminSBMService adminSBMService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * ???????????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/selectArticleList.do")
	public String selectArticleList(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
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
		
		//???????????? ??????
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
		
		// ???????????? ????????????
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();

		// ???????????? ????????????
		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000003");
			List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listDSIComCode", listDSIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000005");
			List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listNTIComCode", listNTIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000006");
			List<?> listMVIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVIComCode", listMVIComCode );
		}
		// ??????????????? ????????????
		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000008");
			List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVMComCode", listMVMComCode );
		}
		
		return "admin/hpm/bbs/adminArticleList";
	}
	
	/**
	 * ???????????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/selectArticleListExcel.do")
	public ModelAndView selectArticleListExcel(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model) throws Exception {
		
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		vo.setBbsId(articleVO.getBbsId());
		AdminBoardMasterVO master = adminBBSMasterService.selectBBSMasterInf(vo);
		
		Map<String, Object> map = adminArticleService.selectArticleListExcel(articleVO);
		List<?> resultList = (List<?>) map.get("resultListExcel");
		
		// ???????????? ????????????
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		List<CmmnDetailCode> listComCode = new ArrayList<CmmnDetailCode>();

		// ???????????? ????????????
		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000003");
			listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000005");
			listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000006");
			listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		}
		// ??????????????? ????????????
		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000008");
			listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		}
		
	    ModelAndView mav = new ModelAndView("excelView");
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    // List Data ?????????
	    List<HashMap<String, Object>> listData = new ArrayList<HashMap<String, Object>>();
	    for(int i = 0; i < resultList.size(); i++) {
	    	HashMap<String, Object> pMap = new HashMap<String, Object>();
	    	AdminBoardVO dataVO = (AdminBoardVO) resultList.get(i);
	    	
	    	pMap.put("no", String.valueOf(resultList.size() - i));
	    	pMap.put("nttSj", dataVO.getNttSj());
	    	pMap.put("custom1", dataVO.getCustom1());
	    	pMap.put("customDate1", dataVO.getCustomDate1());
	    	pMap.put("frstRegisterPnttm", dataVO.getFrstRegisterPnttm());
	    	pMap.put("custom2", dataVO.getCustom2());
	    	pMap.put("postingYn", dataVO.getPostingYn());
	    	
	    	for(int j = 0; j < listComCode.size(); j++) {
	    		if(listComCode.get(j).getCode().equals(dataVO.getCustom1())) {
	    			pMap.put("custom1", dataVO.getCustom1());
	    		}
	    	}
		    
	    	listData.add(i, pMap);
	    }
	    
	    String filename = master.getBbsNm() + " ??????_" + DateTime.getDateString();
	    String[] columnArr = {"??????", "??????", "?????????", "??????", "?????????", "????????????", "????????????"};
	    String[] columnVarArr = {"no", "nttSj", "custom1", "customDate1", "frstRegisterPnttm", "custom2", "postingYn"};
	    // ???????????? ????????????
 		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
 		    columnArr = new String[]{"??????", "????????????", "?????????", "?????????", "????????????"};
 		    columnVarArr = new String[]{"no", "custom1", "nttSj", "frstRegisterPnttm", "postingYn"};
 		}
 		// ???????????? ????????????
 		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
 		    columnArr = new String[]{"??????", "????????????", "??????", "?????????", "????????????"};
 		    columnVarArr = new String[]{"no", "custom1", "nttSj", "frstRegisterPnttm", "postingYn"};
 		}
 		// ???????????? ????????????
 		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
 		    columnArr = new String[]{"??????", "????????????", "??????", "?????????", "????????????"};
 		    columnVarArr = new String[]{"no", "custom1", "nttSj", "frstRegisterPnttm", "postingYn"};
 		}
 		// ??????????????? ????????????
 		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
 		    columnArr = new String[]{"??????", "????????????", "??????", "?????????", "????????????"};
 		    columnVarArr = new String[]{"no", "custom1", "nttSj", "frstRegisterPnttm", "postingYn"};
 		}
	    
	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", master.getBbsNm());    
	    dataMap.put("list", listData);
	    
	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);
	    
	    return mav;
	}
	
	/**
	 * ???????????? ?????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/selectArticleDetail.do")
	public String selectArticleDetail(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
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
		
		AdminBoardMasterVO master = new AdminBoardMasterVO();
		
		master.setBbsId(articleVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		AdminBoardMasterVO masterVo = adminBBSMasterService.selectBBSMasterInf(master);
	
		////-----------------------------
		//----------------------------
		// 2009.06.29 : 2?????? ?????? ??????
		// 2011.07.01 : ?????? ????????? ????????? ??????
		//----------------------------
		if (comArticleCommentService != null) {
			if (comArticleCommentService.canUseComment(articleVO.getBbsId())) {
				model.addAttribute("useComment", "true");
			}
		}
		////--------------------------
		
		model.addAttribute("boardMasterVO", masterVo);
		
		// ???????????? ????????????
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();

		// ???????????? ????????????
		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000003");
			List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listDSIComCode", listDSIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000005");
			List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listNTIComCode", listNTIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000006");
			List<?> listMVIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVIComCode", listMVIComCode );
		}
		// ??????????????? ????????????
		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000008");
			List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVMComCode", listMVMComCode );
		}
	
		return "admin/hpm/bbs/adminArticleDetail";
	}

	/**
	 * ????????? ????????? ?????? ?????????????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/insertArticleView.do")
	public String insertArticleView(@ModelAttribute("searchVO") AdminBoardVO articleVO
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		
		AdminBoardMasterVO adminBoardMasterVO = new AdminBoardMasterVO();
		adminBoardMasterVO.setBbsId(articleVO.getBbsId());
		adminBoardMasterVO.setUniqId(user.getUniqId());
				
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(adminBoardMasterVO);
		
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		
		// ???????????? ????????????
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		// ???????????? ????????????
		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000003");
			List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listDSIComCode", listDSIComCode );
			
			SubjectVO subjectVO = new SubjectVO();
			// OCS ????????? ?????????
			List<SubjectVO> listOcsSBM = adminSBMService.selectOcsSBMList(subjectVO);
			model.addAttribute("listOcsSBM", listOcsSBM );
			// ????????? ?????????
			List<SubjectVO> listSBM = adminSBMService.selectSBMList(subjectVO);
			model.addAttribute("listSBM", listSBM );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000005");
			List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listNTIComCode", listNTIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000006");
			List<?> listMVIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVIComCode", listMVIComCode );
		}
		// ??????????????? ????????????
		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000008");
			List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVMComCode", listMVMComCode );
		}
	
		return "admin/hpm/bbs/adminArticleRegist";
	}

	/**
	 * ???????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/insertArticle.do")
	public String insertArticle(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminBoardVO searchVO
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
			return "redirect:/admin/hpm/bbs/insertArticleView.do";
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
			board.setBbsId(searchVO.getBbsId());
			board.setBlogId(searchVO.getBlogId());
			
			board.setNtcrId(user.getId()); //????????? ?????? ????????? ?????? ????????? ID ??????
			board.setNtcrNm(user.getName()); //????????? ?????? ????????? ?????? ????????? Name ??????
			
			board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS ??????
			adminArticleService.insertArticle(board);
		}
		
		redirectAttributes.addAttribute("bbsId", searchVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/hpm/bbs/selectArticleList.do";
	}

	/**
	 * ???????????? ?????? ?????? ????????? ?????? ?????????????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/replyArticleView.do")
	public String addReplyBoardArticle(@ModelAttribute("searchVO") AdminBoardVO result
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {
		
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
		
		model.addAttribute("articleVO", articleVO);
		
		return "admin/hpm/bbs/adminArticleReply";
	}

	/**
	 * ???????????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/replyArticle.do")
	public String replyBoardArticle(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminBoardVO articleVO
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
			return "redirect:/admin/hpm/bbs/replyArticleView.do";
		}
	
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		String atchFileId = "";

		if (!files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		}

		board.setAtchFileId(atchFileId);
		board.setReplyAt("Y");
		board.setFrstRegisterId(user.getUniqId());
		board.setBbsId(board.getBbsId());
		board.setParnts(Long.toString(articleVO.getNttId()));
		board.setSortOrdr(articleVO.getSortOrdr());
		board.setReplyLc(Integer.toString(Integer.parseInt(articleVO.getReplyLc()) + 1));
		
		board.setNtcrId(user.getId()); //????????? ?????? ????????? ?????? ????????? ID ??????
		board.setNtcrNm(user.getName()); //????????? ?????? ????????? ?????? ????????? Name ??????
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS ??????
		
		adminArticleService.insertArticle(board);
		
		redirectAttributes.addAttribute("bbsId", board.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/hpm/bbs/selectArticleList.do";
	}

	/**
	 * ????????? ????????? ?????? ?????????????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/updateArticleView.do")
	public String updateArticleView(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, @ModelAttribute("board") AdminBoardVO board
			, ModelMap model
			, RedirectAttributes redirectAttributes) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		boardVO.setFrstRegisterId(user.getUniqId());
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();
		AdminBoardVO articleVO = new AdminBoardVO();
		
		board.setBbsId(boardVO.getBbsId());
		
		boardMasterVO.setBbsId(boardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		articleVO = adminArticleService.selectArticleDetail(boardVO);
		
		// ???????????? ?????? ????????????.
		String atchFileId = articleVO.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("fileList", fileList);
		
		// ???????????? ????????????
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();

		// ???????????? ????????????
		if("BBSMSTR_000000000003".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000003");
			List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listDSIComCode", listDSIComCode );
			
			SubjectVO subjectVO = new SubjectVO();
			// OCS ????????? ?????????
			List<SubjectVO> listOcsSBM = adminSBMService.selectOcsSBMList(subjectVO);
			model.addAttribute("listOcsSBM", listOcsSBM );
			// ????????? ?????????
			List<SubjectVO> listSBM = adminSBMService.selectSBMList(subjectVO);
			model.addAttribute("listSBM", listSBM );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000005".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000005");
			List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listNTIComCode", listNTIComCode );
		}
		// ???????????? ????????????
		if("BBSMSTR_000000000006".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000006");
			List<?> listMVIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVIComCode", listMVIComCode );
		}
		// ??????????????? ????????????
		if("BBSMSTR_000000000008".equals(articleVO.getBbsId())) {
			voComCode.setCodeId("000008");
			List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
			model.addAttribute("listMVMComCode", listMVMComCode );
		}
		
		return "admin/hpm/bbs/adminArticleUpdt";
	}

	/**
	 * ???????????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/updateArticle.do")
	public String updateBoardArticle(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminBoardVO searchVO
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
		// @ XSS ?????? ???????????? ??????  START
		// param1 : ???????????????ID(uniqId,esntlId)
		//--------------------------------------------------------
		LOGGER.debug("@ XSS ???????????? START ----------------------------------------------");
		//step1 DB?????? ?????? ???????????? uniqId ??????
		AdminBoardVO vo = adminArticleService.selectArticleDetail(searchVO);
		
		//step2 EgovXssChecker ??????????????? ????????? ????????????
		EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId());
	  	LOGGER.debug("@ XSS ???????????? END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS ?????? ???????????? ?????? END
		//--------------------------------------------------------------------------------------------
	
		String atchFileId = searchVO.getAtchFileId();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/bbs/updateArticleView.do";
		}

		String[] arrayDeleteFileSn = {searchVO.getDeleteFileSn1(), searchVO.getDeleteFileSn2(), searchVO.getDeleteFileSn3(), searchVO.getDeleteFileSn4(), searchVO.getDeleteFileSn5()};
		String[] arrayDeleteFileYn = {searchVO.getDeleteFileYn1(), searchVO.getDeleteFileYn2(), searchVO.getDeleteFileYn3(), searchVO.getDeleteFileYn4(), searchVO.getDeleteFileYn5()};
		
		
		// ?????? ???????????? ????????????
		int delCnt = 0;
		FileVO delVO = new FileVO();
		FileVO delFileVO = new FileVO();
		for(String fileSn : arrayDeleteFileSn) {
			if(arrayDeleteFileYn[delCnt].equals("Y")) {
				delVO.setAtchFileId(atchFileId);
				delVO.setFileSn(fileSn);
				delFileVO = fileMngService.selectFileInf(delVO);
				
				try { // ??????????????? ??????????????? ??????
					
					String filePath = delFileVO.getFileStreCours() + delFileVO.getStreFileNm();
					if(new File(filePath).exists()) {
						new File(filePath).delete();
					}
					
				} catch (Exception e) {
					LOGGER.error("updateBoardArticle ???????????? Exception ----> {}", e.getMessage());
				}
				
				fileMngService.deleteFileInf(delVO); // DB??????
			}
			delCnt++;
		}
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			if ("".equals(atchFileId)) {
				List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
				atchFileId = fileMngService.insertFileInfs(result);
				board.setAtchFileId(atchFileId);
			} else {
				/* ?????????????????? ????????? ???????????? ????????? ?????? ????????? ??? ????????????. ????????? ?????? ????????? ???????????? ???????????? ??????. */
				delVO = new FileVO();
				delFileVO = new FileVO();
				for(int i = 1; i < 6; i++) {
					if(files.get("file_"+i) != null && !files.get("file_"+i).isEmpty()) {
						Map<String, MultipartFile> modifyFile = new HashMap<String, MultipartFile>();
						modifyFile.put("file_"+i, files.get("file_"+i));
						int cnt = i - 1;
						delVO.setAtchFileId(atchFileId);
						delVO.setFileSn(String.valueOf(cnt));
						delFileVO = fileMngService.selectFileInf(delVO);
						
						LOGGER.error("updateBoardArticle ???????????? start ---> [{}][{}]", atchFileId, delVO.getFileSn());
						try { // ??????????????? ??????????????? ??????
							
							String filePath = delFileVO.getFileStreCours() + delFileVO.getStreFileNm();
							if(new File(filePath).exists()) {
								new File(filePath).delete();
							}
							
						} catch (Exception e) {
							LOGGER.error("updateBoardArticle ???????????? Exception ----> [{}][{}]", delVO.getFileSn(), e.getMessage());
						}
						fileMngService.deleteFileInf(delVO); // DB??????
						LOGGER.error("updateBoardArticle ???????????? end ---> [{}][{}]", atchFileId, delVO.getFileSn());
						
						FileVO fvo = new FileVO();
						fvo.setAtchFileId(atchFileId);
						List<FileVO> _result = fileUtil.parseFileInf(modifyFile, "BBS_", cnt, atchFileId, "");
						fileMngService.updateFileInfs(_result);
					}
				}
			}
		}

		board.setLastUpdusrId(user.getUniqId());
		
		board.setNtcrNm("");	// dummy ?????? ?????? (????????? ?????? ?????? validator ????????? ?????? dummy??? ?????????)
		board.setPassword("");	// dummy ?????? ?????? (????????? ?????? ?????? validator ????????? ?????? dummy??? ?????????)
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS ??????
		
		adminArticleService.updateArticle(board);
		
		redirectAttributes.addAttribute("bbsId", searchVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/hpm/bbs/selectArticleList.do";
	}

	/**
	 * ???????????? ?????? ????????? ????????????.
	 */
	@RequestMapping("/admin/hpm/bbs/deleteArticle.do")
	public String deleteBoardArticle(HttpServletRequest request
			, @ModelAttribute("searchVO") AdminBoardVO searchVO
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
		// @ XSS ?????? ???????????? ??????  START
		// param1 : ???????????????ID(uniqId,esntlId)
		//--------------------------------------------------------
		LOGGER.debug("@ XSS ???????????? START ----------------------------------------------");
		//step1 DB?????? ?????? ???????????? uniqId ??????
		AdminBoardVO vo = adminArticleService.selectArticleDetail(searchVO);
		
		//step2 EgovXssChecker ??????????????? ????????? ????????????
		EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId());
	  	LOGGER.debug("@ XSS ???????????? END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS ?????? ???????????? ?????? END
		//--------------------------------------------------------------------------------------------
		
		board.setLastUpdusrId(user.getUniqId());
		adminArticleService.deleteArticle(board);
		
		redirectAttributes.addAttribute("bbsId", searchVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
		return "redirect:/admin/hpm/bbs/selectArticleList.do";
	}
}
