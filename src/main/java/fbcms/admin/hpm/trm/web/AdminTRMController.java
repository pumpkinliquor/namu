package fbcms.admin.hpm.trm.web;

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
import egovframework.rte.fdl.property.EgovPropertyService;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeService;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeVO;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.CommonService;

/**
* 진료실적관리(Treatment Results Manager)을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class AdminTRMController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminTRMController.class);
	
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	@Resource(name = "AdminBBSMasterService")
	private AdminBBSMasterService adminBBSMasterService;
	
	@Resource(name = "AdminCmmCodeService")
	private AdminCmmCodeService adminCmmCodeService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
    /**
     * 진료실적관리를 수정하기 전 단계처리
     */
	@RequestMapping("/admin/hpm/trm/updateTRMView.do")
    public String updateTRMView(@ModelAttribute("board") AdminBoardVO boardVO
			, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();

		boardMasterVO.setBbsId("BBSMSTR_000000000018");
		boardMasterVO.setUniqId(user.getUniqId());
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		
		model.addAttribute("boardMasterVO", boardMasterVO);
		
		AdminBoardVO articleVO = new AdminBoardVO();
		boardVO.setBbsId(boardMasterVO.getBbsId());
		articleVO = adminArticleService.selectTRMDetail(boardVO);
		model.addAttribute("articleVO", articleVO);
		
		if(articleVO == null || articleVO.getNttId() < 1) {
			return "admin/hpm/trm/adminTRMRegist";
		}
		
		articleVO.setParnts(String.valueOf(articleVO.getNttId()));
		Map<String, Object> resultMap = adminArticleService.selectTRMChildList(articleVO);
		List<AdminBoardVO> resultList = (List<AdminBoardVO>) resultMap.get("resultList");
		model.addAttribute("resultList", resultList);
		
        return "admin/hpm/trm/adminTRMUpdt";
    }
    
    /**
     * 진료실적관리를 등록한다.
     */
    @RequestMapping("/admin/hpm/trm/insertTRM.do")
    public String insertTRM(final MultipartHttpServletRequest multiRequest
    		, HttpServletRequest request
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
		
		board.setFrstRegisterId(user.getUniqId());
		board.setBbsId(boardVO.getBbsId());
		board.setBlogId(boardVO.getBlogId());
		
		board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		adminArticleService.insertArticle(board);
		
		for (int i = 0; i < 5; i++) {
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000018");
			adminBoardVO.setNttSj(request.getParameter("nttSj" + (i+1)));
			adminBoardVO.setCustom1(request.getParameter("custom1_" + (i+1)));
			adminBoardVO.setUseAt("Y");
			adminBoardVO.setNttNo((i+1));
			
			adminBoardVO.setFrstRegisterId(user.getUniqId());
			
			adminBoardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			adminBoardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(request.getParameter("nttCn" + (i+1))));	// XSS 방지
			adminArticleService.insertTRM(adminBoardVO);	
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
        
		return "redirect:/admin/hpm/trm/updateTRMView.do";
    }
	
    /**
     * 진료실적관리를 수정 처리한다
     */
	@RequestMapping("/admin/hpm/trm/updateTRM.do")
    public String updateTRM(final MultipartHttpServletRequest multiRequest
    		, HttpServletRequest request
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
		AdminBoardVO vo = adminArticleService.selectTRMDetail(boardVO);
		
		if(multiRequest != null && vo != null) {
			//step2 EgovXssChecker 공통모듈을 이용한 권한체크
			EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId());
		}
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
	  	
		
	  	for (int i = 0; i < 5; i++) {
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000018");
			adminBoardVO.setNttId(Long.parseLong(request.getParameter("nttId" + (i+1))));
			adminBoardVO.setNttSj(request.getParameter("nttSj" + (i+1)));
			adminBoardVO.setCustom1(request.getParameter("custom1_" + (i+1)));
			adminBoardVO.setUseAt("Y");
			adminBoardVO.setNttNo((i+1));
			
			adminBoardVO.setLastUpdusrId(user.getUniqId());
			
			adminBoardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			adminBoardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(request.getParameter("nttCn" + (i+1))));	// XSS 방지
			adminArticleService.updateTRM(adminBoardVO);	
		}
		
		board.setLastUpdusrId(user.getUniqId());
		board.setBbsId(boardVO.getBbsId());
		board.setBlogId(boardVO.getBlogId());
		
		board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		adminArticleService.updateArticle(board);
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
        return "redirect:/admin/hpm/trm/updateTRMView.do";
    }
}
