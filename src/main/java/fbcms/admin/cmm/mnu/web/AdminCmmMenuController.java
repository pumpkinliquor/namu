package fbcms.admin.cmm.mnu.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import egovframework.rte.fdl.property.EgovPropertyService;
import fbcms.admin.sym.mpm.service.AdminMenuManageService;
import fbcms.admin.sym.mpm.service.AdminMenuManageVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 메인메뉴 해당링크 처리를 하는 비즈니스 구현 클래스
 */

@Controller
public class AdminCmmMenuController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCmmMenuController.class);

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** AdminMenuManageService */
	@Resource(name = "AdminMenuManageService")
    private AdminMenuManageService adminMenuManageService;
	
	
    /**
     * Head메뉴를 조회한다.
     */
    @RequestMapping(value="/admin/cmm/mnu/selectMenuGnb.do")
    public String selectMenuGnb(
    		HttpServletRequest request
    		, @ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	HashMap<String, String> hashMap = new HashMap<String, String>();
    	hashMap.put("userId", user.getUniqId());
    	
    	String chkURL = (String) request.getParameter("referer");
    	if(!request.getParameter("queryString").isEmpty()) {
    		chkURL = chkURL + "?" + request.getParameter("queryString");
    	}
    	hashMap.put("chkURL", chkURL);

    	List<HashMap<String, String>> listMenuGnb = adminMenuManageService.selectMenuGnb(hashMap);
        model.addAttribute("listMenuGnb", listMenuGnb);

    	HashMap<String, String> resultHashMap = adminMenuManageService.selectCurrentMenu(hashMap);
    	if(resultHashMap != null && !resultHashMap.isEmpty()) {
	        model.addAttribute("oneDepthNo", resultHashMap.get("oneDepthNo"));
    	}
        
		return "fbcms/admin/cmm/mnu/menuGnb";
    }
    
    /**
     * 좌측메뉴를 조회한다.
     */
    @RequestMapping(value="/admin/cmm/mnu/selectMenuLnb.do")
    public String selectMenuLnb(
    		HttpServletRequest request
    		, @ModelAttribute("menuManageVO") AdminMenuManageVO menuManageVO
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	HashMap<String, String> hashMap = new HashMap<String, String>();
    	hashMap.put("userId", user.getUniqId());
    	
    	String chkURL = (String) request.getParameter("referer");
    	if(!request.getParameter("queryString").isEmpty()) {
    		chkURL = chkURL + "?" + request.getParameter("queryString");
    	}
    	hashMap.put("chkURL", chkURL);

    	List<HashMap<String, String>> listMenuLnb = adminMenuManageService.selectMenuLnb(hashMap);
        model.addAttribute("listMenuLnb", listMenuLnb);

    	HashMap<String, String> resultHashMap = adminMenuManageService.selectCurrentMenu(hashMap);
    	if(resultHashMap != null && !resultHashMap.isEmpty()) {
	        model.addAttribute("oneDepthNo", resultHashMap.get("oneDepthNo"));
	        model.addAttribute("twoDepthNo", resultHashMap.get("twoDepthNo"));
	        model.addAttribute("threeDepthNo", resultHashMap.get("threeDepthNo"));
    	}
        
      	return "fbcms/admin/cmm/mnu/menuLnb";
    }
}