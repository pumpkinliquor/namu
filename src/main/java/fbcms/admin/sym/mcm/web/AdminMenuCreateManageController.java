package fbcms.admin.sym.mcm.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.sym.mcm.service.AdminMenuCreateVO;
import fbcms.admin.sym.mcm.service.AdminMenuCreateManageService;

/**
 * 메뉴목록 관리및 메뉴생성, 사이트맵 생성을 처리하는 비즈니스 구현 클래스
 */
@Controller
public class AdminMenuCreateManageController {
	
	/* Validator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** AdminMenuCreateManageService */
	@Resource(name = "AdminMenuCreateManageService")
	private AdminMenuCreateManageService adminMenuCreateManageService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/**
	 * 메뉴생성 세부화면을 조회한다.
	 */
	@RequestMapping(value = "/admin/sym/mcm/selectMenuCreateList.do")
	public String selectMenuCreateList(@ModelAttribute("menuCreateVO") AdminMenuCreateVO menuCreateVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		List<?> list_menulist = adminMenuCreateManageService.selectMenuCreateList(menuCreateVO);
		model.addAttribute("list_menulist", list_menulist);
		model.addAttribute("resultVO", menuCreateVO);

		return "admin/sym/mcm/adminMenuCreate";
	}

	/**
	 * 메뉴생성처리 및 메뉴생성내역을 등록한다.
	 */
	@RequestMapping("/admin/sym/mcm/insertMenuCreateList.do")
	public String insertMenuCreateList(@RequestParam("checkedAuthorForInsert") String checkedAuthorForInsert
			, @RequestParam("checkedMenuNoForInsert") String checkedMenuNoForInsert
			, @ModelAttribute("menuCreateVO") AdminMenuCreateVO menuCreateVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String resultMsg = "";
		String[] insertMenuNo = checkedMenuNoForInsert.split(",");
		if (insertMenuNo == null || (insertMenuNo.length == 0)) {
			resultMsg = egovMessageSource.getMessage("fail.common.insert");
		} else {
			adminMenuCreateManageService.insertMenuCreateList(checkedAuthorForInsert, checkedMenuNoForInsert);
			resultMsg = egovMessageSource.getMessage("success.common.insert");
		}
		model.addAttribute("resultMsg", resultMsg);
		return "redirect:/admin/sym/mcm/adminMenuCreateList.do";
	}
}
