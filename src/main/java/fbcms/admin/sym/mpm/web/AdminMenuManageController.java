package fbcms.admin.sym.mpm.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.sym.mpm.service.AdminMenuManageService;
import fbcms.admin.sym.mpm.service.AdminMenuManageVO;
import fbcms.admin.sym.prm.service.AdminProgrmManageService;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 메뉴목록 관리및 메뉴생성, 사이트맵 생성을 처리하는 비즈니스 구현 클래스
 */

@Controller
public class AdminMenuManageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMenuManageController.class);

	/* Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovMenuManageService */
	@Resource(name = "AdminMenuManageService")
    private AdminMenuManageService adminMenuManageService;

    /** EgovMenuManageService */
	@Resource(name = "AdminProgrmManageService")
	private AdminProgrmManageService adminProgrmManageService;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    
    /**
     * 메뉴목록 리스트조회한다.
     */
    @IncludedInfo(name="메뉴관리리스트", order = 1091 ,gid = 60)
    @RequestMapping(value="/admin/sym/mpm/selectMenuManageList.do")
    public String selectMenuManageList(@ModelAttribute("searchVO") ComDefaultVO searchVO
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

		List<?> resultList = adminMenuManageService.selectMenuManageList(searchVO);
		model.addAttribute("resultList", resultList);

        int totCnt = adminMenuManageService.selectMenuManageListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("resultListTotCnt", totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

      	return "admin/sym/mpm/adminMenuManageList";
    }
    
    /**
     * 메뉴정보목록을 상세화면 호출 및 상세조회한다.
     */
    @RequestMapping(value="/admin/sym/mpm/insertMenuManageView.do")
    public String insertMenuManageView(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, @ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
    	return "admin/sym/mpm/adminMenuManageRegist";
    }
    
    /**
     * 메뉴정보를 등록화면으로 이동 및 등록 한다.
     */
    @RequestMapping(value="/admin/sym/mpm/insertMenuManage.do")
    public String insertMenuManage(@RequestParam Map<?, ?> commandMap
    		, @ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String sLocationUrl = null;
    	String resultMsg    = "";
        
        beanValidator.validate(menuManageVO, bindingResult);
        if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/sym/mpm/insertMenuManageView.do";
		}
		
		if(adminMenuManageService.selectMenuNoByPk(menuManageVO) == 0) {
			ComDefaultVO searchVO = new ComDefaultVO();
			searchVO.setSearchKeyword(menuManageVO.getProgrmFileNm());
			if(adminProgrmManageService.selectProgrmNMTotCnt(searchVO) == 0) {
	    		resultMsg = egovMessageSource.getMessage("fail.common.insert");
	    		model.addAttribute("resultMsg", resultMsg);
		        sLocationUrl = "admin/sym/mpm/adminMenuManageRegist";
			} else {
	        	adminMenuManageService.insertMenuManage(menuManageVO);
        		resultMsg = egovMessageSource.getMessage("success.common.insert");
        		model.addAttribute("resultMsg", resultMsg);
        		return "redirect:/admin/sym/mpm/selectMenuManageList.do";
			}
		} else {
    		resultMsg = egovMessageSource.getMessage("common.isExist.msg");
    		sLocationUrl = "admin/sym/mpm/adminMenuManageRegist";
		}
    	
		model.addAttribute("resultMsg", resultMsg);
		return sLocationUrl;
    }
    
    /**
     * 메뉴정보목록을 상세화면 호출 및 상세조회한다.
     */
    @RequestMapping(value="/admin/sym/mpm/updateMenuManageView.do")
    public String updateMenuManageView(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, @ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	AdminMenuManageVO resultVO = adminMenuManageService.selectMenuManageDetail(menuManageVO);
        model.addAttribute("menuManageVO", resultVO);

        return "admin/sym/mpm/adminMenuManageUpdt";
    }
    
    /**
     * 메뉴정보를 수정 한다.
     */
    @RequestMapping(value="/admin/sym/mpm/updateMenuManage.do")
    public String updateMenuManage(@ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
    	
        beanValidator.validate(menuManageVO, bindingResult);
        if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/redirect:/admin/sym/mpm/updateMenuManageView.do";
		}
		
        String sLocationUrl = null;
    	String resultMsg    = "";
        
		ComDefaultVO searchVO = new ComDefaultVO();
		searchVO.setSearchKeyword(menuManageVO.getProgrmFileNm());
		if(adminProgrmManageService.selectProgrmNMTotCnt(searchVO) == 0) {
    		resultMsg = egovMessageSource.getMessage("fail.common.update");
	        sLocationUrl = "redirect:/admin/sym/mpm/updateMenuManageView.do";
		} else {
			adminMenuManageService.updateMenuManage(menuManageVO);
	    	resultMsg = egovMessageSource.getMessage("success.common.update");
	       	sLocationUrl = "redirect:/admin/sym/mpm/selectMenuManageList.do";
		}
		
    	model.addAttribute("resultMsg", resultMsg);
		redirectAttributes.addFlashAttribute("resultMsg", resultMsg);
		
		return sLocationUrl;
    }

    /**
     * 메뉴정보를 삭제 한다.
     */
    @RequestMapping(value="/admin/sym/mpm/deleteMenuManage.do")
    public String deleteMenuManage(@ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
    	String resultMsg    = "";
    	if (adminMenuManageService.selectUpperMenuNoByPk(menuManageVO) != 0) {
    		resultMsg = egovMessageSource.getMessage("fail.common.delete.upperMenuExist");
    		model.addAttribute("resultMsg", resultMsg);
    		return "redirect:/admin/sym/mpm/selectMenuManageList.do";
		}

    	adminMenuManageService.deleteMenuManage(menuManageVO);
    	resultMsg = egovMessageSource.getMessage("success.common.delete");
    	String _MenuNm = "%";
    	menuManageVO.setMenuNm(_MenuNm);
    	model.addAttribute("resultMsg", resultMsg);
    	
      	return "redirect:/admin/sym/mpm/selectMenuManageList.do";
    }

    /**
     * 메뉴리스트의 메뉴정보를 이동 메뉴목록을 조회한다.
     */
    @RequestMapping(value="/admin/sym/mpm/selectMenuListSelectMvmn.do")
    public String selectMenuListSelectMvmn(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

    	List<?> listMenulist = adminMenuManageService.selectMenuList();
        model.addAttribute("listMenulist", listMenulist);
        
      	return  "fbcms/admin/sym/mpm/adminMenuMvmn";
    }

    /**
     * 메뉴리스트의 메뉴정보를 이동 메뉴목록을 조회한다. (New)
     */
    @RequestMapping(value="/admin/sym/mpm/selectMenuListSelectMvmnNew.do")
    public String selectMenuListSelectMvmnNew(@ModelAttribute("searchVO") ComDefaultVO searchVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

    	List<?> listMenulist = adminMenuManageService.selectMenuList();
        model.addAttribute("listMenulist", listMenulist);
        
      	return  "fbcms/admin/sym/mpm/adminMenuMvmnNew";
    }
}