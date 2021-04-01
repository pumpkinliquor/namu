package fbcms.admin.sym.prm.web;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.sym.prm.service.AdminProgrmManageService;
import fbcms.admin.sym.prm.service.AdminProgrmManageVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 프로그램목록 관리및 변경을 처리하는 비즈니스 구현 클래스
 */
@Controller
public class AdminProgrmManageController {

	/** Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** AdminProgrmManageService */
	@Resource(name = "AdminProgrmManageService")
    private AdminProgrmManageService adminProgrmManageService;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
    
    /**
     * 프로그램목록 리스트조회한다.
     */
    @IncludedInfo(name="프로그램관리",order = 1111 ,gid = 60)
    @RequestMapping(value="/admin/sym/prm/selectProgrmList.do")
    public String selectProgrmList(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	// 내역 조회
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> resultList = adminProgrmManageService.selectProgrmList(searchVO);
        model.addAttribute("resultList", resultList);
        model.addAttribute("searchVO", searchVO);

        int totCnt = adminProgrmManageService.selectProgrmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
        model.addAttribute("resultListTotCnt", totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

      	return "admin/sym/prm/adminProgrmList";

    }

    /**
     * 프로그램목록을 등록하기 위한 전 처리
     */
    @RequestMapping(value="/admin/sym/prm/insertProgrmView.do")
    public String insertProgrmView(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, @ModelAttribute("progrmManageVO") AdminProgrmManageVO progrmManageVO
    		, BindingResult bindingResult
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		return "admin/sym/prm/adminProgrmRegist";
    }

    /**
     * 프로그램목록을 수정하기 위한 전 처리
     */
    @RequestMapping(value="/admin/sym/prm/insertProgrm.do")
    public String insertProgrmList(@ModelAttribute("progrmManageVO") AdminProgrmManageVO progrmManageVO
    		, HttpServletRequest request
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
        String resultMsg = "";
        
        beanValidator.validate(progrmManageVO, bindingResult);
        if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/prm/insertProgrmView.do";
        }
		
		if(progrmManageVO.getProgrmDc() == null || progrmManageVO.getProgrmDc().equals("")) {
			progrmManageVO.setProgrmDc(" ");
		}
		adminProgrmManageService.insertProgrm(progrmManageVO);
		adminProgrmManageService.deleteProgrmDetailUrl(progrmManageVO);
		
		String[] arrayDetailUrl = request.getParameterValues("detailUrl");
		for(int i = 0; i < arrayDetailUrl.length; i++) {
			AdminProgrmManageVO progrmManageDetailUrlVO = new AdminProgrmManageVO();
			progrmManageDetailUrlVO.setProgrmFileNm(progrmManageVO.getProgrmFileNm());
			progrmManageDetailUrlVO.setUrl(arrayDetailUrl[i]);
			adminProgrmManageService.insertProgrmDetailUrl(progrmManageDetailUrlVO);
		}
		
		resultMsg = egovMessageSource.getMessage("success.common.insert");
		
		model.addAttribute("resultMsg", resultMsg);
		
		return "redirect:/admin/sym/prm/selectProgrmList.do";
    }
	
    /**
     * 프로그램목록을 수정하기 위한 전 처리
     */
    @RequestMapping(value="/admin/sym/prm/updateProgrmView.do")
    public String updateProgrmView(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, @ModelAttribute("progrmManageVO") AdminProgrmManageVO progrmManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	AdminProgrmManageVO resultVO = adminProgrmManageService.selectProgrmDetail(progrmManageVO);
        model.addAttribute("progrmManageVO", resultVO);
        
    	List<?> resultDetailUrlList = adminProgrmManageService.selectProgrmDetailUrlList(progrmManageVO);
        model.addAttribute("resultDetailUrlList", resultDetailUrlList);
        
        return "admin/sym/prm/adminProgrmUpdt";
    }

    /**
     * 프로그램목록을 수정 한다.
     */
    /*프로그램목록수정*/
    @RequestMapping(value="/admin/sym/prm/updateProgrm.do")
    public String updateProgrm(@ModelAttribute("progrmManageVO") AdminProgrmManageVO progrmManageVO
    		, HttpServletRequest request
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

        beanValidator.validate(progrmManageVO, bindingResult);
        if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/prm/updateProgrmView.do";
		}
		
		String resultMsg = "";
		
		if(progrmManageVO.getProgrmDc() == null || progrmManageVO.getProgrmDc().equals("")) {
			progrmManageVO.setProgrmDc(" ");
		}
		adminProgrmManageService.updateProgrm(progrmManageVO);
		adminProgrmManageService.deleteProgrmDetailUrl(progrmManageVO);
		
		String[] arrayDetailUrl = request.getParameterValues("detailUrl");
		for(int i = 0; i < arrayDetailUrl.length; i++) {
			AdminProgrmManageVO progrmManageDetailUrlVO = new AdminProgrmManageVO();
			progrmManageDetailUrlVO.setProgrmFileNm(progrmManageVO.getProgrmFileNm());
			progrmManageDetailUrlVO.setUrl(arrayDetailUrl[i]);
			adminProgrmManageService.insertProgrmDetailUrl(progrmManageDetailUrlVO);
		}
		resultMsg = egovMessageSource.getMessage("success.common.update");
        
		model.addAttribute("resultMsg", resultMsg);
		
		return "redirect:/admin/sym/prm/selectProgrmList.do";
    }

    /**
     * 프로그램목록을 삭제 한다.
     */
    @RequestMapping(value="/admin/sym/prm/deleteProgrm.do")
    public String deleteProgrm(@ModelAttribute("progrmManageVO") AdminProgrmManageVO progrmManageVO
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	String resultMsg = "";
        adminProgrmManageService.deleteProgrm(progrmManageVO);
        resultMsg = egovMessageSource.getMessage("success.common.delete");
    	
        model.addAttribute("resultMsg", resultMsg);
		
		return "redirect:/admin/sym/prm/selectProgrmList.do";
	}

    /**
     * 프로그램파일명을 조회한다.
     */
    @RequestMapping(value="/admin/sym/prm/selectProgrmListSearch.do")
    public String selectProgrmListSearch(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	// 내역 조회
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> listProgrmManage = adminProgrmManageService.selectProgrmList(searchVO);
        model.addAttribute("listProgrmManage", listProgrmManage);

        int totCnt = adminProgrmManageService.selectProgrmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

      	return "fbcms/admin/sym/prm/adminFileNmSearch";

    }

    /**
     * 프로그램파일명을 조회한다.
     */
    @RequestMapping(value="/admin/sym/prm/selectProgrmListSearchNew.do")
    public String selectProgrmListSearchNew(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	// 내역 조회
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> listProgrmManage = adminProgrmManageService.selectProgrmList(searchVO);
        model.addAttribute("listProgrmManage", listProgrmManage);

        int totCnt = adminProgrmManageService.selectProgrmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

      	return "fbcms/admin/sym/prm/adminFileNmSearchNew";

    }
}