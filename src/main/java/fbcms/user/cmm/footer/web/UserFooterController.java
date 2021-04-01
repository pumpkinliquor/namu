package fbcms.user.cmm.footer.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.admin.hpm.sns.service.AdminSnsManage;
import fbcms.admin.hpm.sns.service.AdminSnsManageService;
import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 풋터를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserFooterController {
	
    /** AdminSnsManageService */
	@Resource(name = "AdminSnsManageService")
    private AdminSnsManageService adminSnsManageService;
	
	
	/**
	 * 비급여진료비 안내
	 */
	@RequestMapping("/user/cmm/footer/unpaid.do")
	public String unpaid(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/footer/unpaid");
	}
	
	/**
	 * 개인정보 처리방침 페이지
	 */
	@RequestMapping("/user/cmm/footer/privacy.do")
	public String privacy(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010100");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/footer/privacy");
	}
	
	/**
	 * 이용약관
	 */
	@RequestMapping("/user/cmm/footer/terms.do")
	public String terms(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/footer/terms");
	}
	
	/**
	 * 사이트맵
	 */
	@RequestMapping("/user/cmm/footer/sitemap.do")
	public String sitemap(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/footer/sitemap");
	}
	
	/**
	 * SNS 리스트
	 */
	@RequestMapping("/user/cmm/footer/snsList.do")
	public String snsList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		// 푸터 SNS 링크 가져오기 
		AdminSnsManage adminSnsManage = new AdminSnsManage();
		adminSnsManage.setUnityLinkSeCode("SNS");
	    List<AdminSnsManage> snsList = adminSnsManageService.selectUnityLinkList(adminSnsManage);
	    model.addAttribute("snsList", snsList);
	    
	    return "fbcms/user/cmm/footer/snsList";
	}
	
	/**
	 * 모바일 GNB SNS 리스트
	 */
	@RequestMapping("/mobile/cmm/gnb/snsMobileList.do")
	public String snsMobileList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		// 모바일 GNB 링크 가져오기 
		AdminSnsManage adminSnsManage = new AdminSnsManage();
		adminSnsManage.setUnityLinkSeCode("SNS");
	    List<AdminSnsManage> snsList = adminSnsManageService.selectUnityLinkList(adminSnsManage);
	    model.addAttribute("snsList", snsList);
	    
	    return "fbcms/mobile/cmm/gnb/snsMobileList";
	}
}
