package fbcms.admin.hpm.bbs.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBlog;
import fbcms.admin.hpm.bbs.service.AdminBlogUserVO;
import fbcms.admin.hpm.bbs.service.AdminBlogVO;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;


/**
 * 게시판 속성관리를 위한 컨트롤러  클래스
 */

@Controller
public class AdminBBSMasterController {

    @Resource(name = "AdminBBSMasterService")
    private AdminBBSMasterService adminBBSMasterService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name = "egovBBSMstrIdGnrService")
    private EgovIdGnrService idgenServiceBbs;
    
    @Resource(name = "egovBlogIdGnrService")
    private EgovIdGnrService idgenServiceBlog;
    
    /** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    @Autowired
    private DefaultBeanValidator beanValidator;
    
    
    /**
     * 게시판 마스터 목록을 조회한다.
     */
    @IncludedInfo(name="게시판관리",order = 180 ,gid = 40)
    @RequestMapping("/admin/hpm/bbs/selectBBSMasterList.do")
    public String selectBBSMasterInfs(@ModelAttribute("searchVO") AdminBoardMasterVO searchVO
    		, ModelMap model) throws Exception {
    	
    	searchVO.setPageUnit(propertyService.getInt("pageUnit"));
    	searchVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
	
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = adminBBSMasterService.selectBBSMasterInfs(searchVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "fbcms/admin/hpm/bbs/fbcmsBBSMasterList";
    }
    
    /**
     * 게시판 마스터 상세내용을 조회한다.
     */
    @RequestMapping("/admin/hpm/bbs/selectBBSMasterDetail.do")
    public String selectBBSMasterDetail(@ModelAttribute("searchVO") AdminBoardMasterVO searchVO
    		, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	AdminBoardMasterVO vo = adminBBSMasterService.selectBBSMasterInf(searchVO);
		model.addAttribute("result", vo);
	
		//---------------------------------
		// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
		//---------------------------------
		
		if(EgovComponentChecker.hasComponent("EgovArticleCommentService")) {
			model.addAttribute("useComment", "true");
		}
		if(EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {
			model.addAttribute("useSatisfaction", "true");
		}
		
		return "fbcms/admin/hpm/bbs/fbcmsBBSMasterDetail";
    }
    
    /**
     * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
     */
    @RequestMapping("/admin/hpm/bbs/insertBBSMasterView.do")
    public String insertBBSMasterView(@ModelAttribute("searchVO") AdminBoardMasterVO boardMasterVO
    		, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	AdminBoardMasterVO boardMaster = new AdminBoardMasterVO();
		//공통코드(게시판유형)
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM101");
		List<?> codeResult = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("bbsTyCode", codeResult);
		model.addAttribute("boardMasterVO", boardMaster);
		
		if(EgovComponentChecker.hasComponent("EgovArticleCommentService")) {
			model.addAttribute("useComment", "true");
		}
		if(EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {
			model.addAttribute("useSatisfaction", "true");
		}
		
		return "fbcms/admin/hpm/bbs/fbcmsBBSMasterRegist";
    }

    /**
     * 신규 게시판 마스터 정보를 등록한다.
     */
    @RequestMapping("/admin/hpm/bbs/insertBBSMaster.do")
    public String insertBBSMaster(@ModelAttribute("searchVO") AdminBoardMasterVO boardMasterVO
    		, @ModelAttribute("boardMaster") AdminBoardMaster boardMaster
    		, BindingResult bindingResult, ModelMap model) throws Exception {
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/bbs/insertBBSMasterView.do";
		}
		
	    boardMaster.setFrstRegisterId(user.getUniqId());
	    if(boardMasterVO.getBlogAt().equals("Y")) {
	    	boardMaster.setBlogAt("Y");
	    } else {
	    	boardMaster.setBlogAt("N");
	    }
	    adminBBSMasterService.insertBBSMasterInf(boardMaster);
		
		return "forward:/admin/hpm/bbs/selectBBSMasterList.do";
    }
    
    /**
     * 게시판 마스터정보를 수정하기 위한 전 처리
     */
    @RequestMapping("/admin/hpm/bbs/updateBBSMasterView.do")
    public String updateBBSMasterView(@RequestParam("bbsId") String bbsId
    		, @ModelAttribute("searchVO") AdminBoardMaster searchVO
    		, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
    	
    	AdminBoardMasterVO adminBoardMasterVO = new AdminBoardMasterVO();
        
        //게시판유형코드
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId("COM101");
        List<?> bbsTyCode = cmmUseService.selectCmmCodeDetail(vo);
        model.addAttribute("bbsTyCode", bbsTyCode);
        
        // Primary Key 값 세팅
        adminBoardMasterVO.setBbsId(bbsId);

        model.addAttribute("boardMasterVO", adminBBSMasterService.selectBBSMasterInf(adminBoardMasterVO));

		//---------------------------------
		// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
		//---------------------------------
		
		if(EgovComponentChecker.hasComponent("EgovArticleCommentService")) {
			model.addAttribute("useComment", "true");
		}
		if(EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {
			model.addAttribute("useSatisfaction", "true");
		}
        
        return "fbcms/admin/hpm/bbs/fbcmsBBSMasterUpdt";
    }
    

    /**
     * 게시판 마스터 정보를 수정한다.
     */
    @RequestMapping("/admin/hpm/bbs/updateBBSMaster.do")
    public String updateBBSMaster(@ModelAttribute("searchVO") AdminBoardMasterVO boardMasterVO
    		, @ModelAttribute("boardMaster") AdminBoardMaster boardMaster
    		, BindingResult bindingResult
    		, ModelMap model) throws Exception {
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/bbs/updateBBSMasterView.do";
		}
		
		boardMaster.setLastUpdusrId(user.getUniqId());
		adminBBSMasterService.updateBBSMasterInf(boardMaster);
		
		return "forward:/admin/hpm/bbs/selectBBSMasterList.do";
    }

    /**
     * 게시판 마스터 정보를 삭제한다.
     */
    @RequestMapping("/admin/hpm/bbs/deleteBBSMaster.do")
    public String deleteBBSMaster(@ModelAttribute("searchVO") AdminBoardMasterVO searchVO
    		, @ModelAttribute("boardMaster") AdminBoardMaster boardMaster
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		boardMaster.setLastUpdusrId(user.getUniqId());
		adminBBSMasterService.deleteBBSMasterInf(boardMaster);
		
		return "redirect:/admin/hpm/bbs/selectBBSMasterList.do";
    }
}
