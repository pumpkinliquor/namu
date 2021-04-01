package fbcms.user.cuc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 검진센터(CheckUp Center)을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class UserCUCController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserCUCController.class);
	
	
	/**
	 * 건강검진(Health CheckUp) 정보 페이지
	 */
	@RequestMapping("/user/cuc/hcu/infoHCU.do")
	public String infoHCU(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "040100");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cuc/hcu/infoHCU");
	}
	
	/**
	 * 종합검진센터(Comprehensive Checkup Center) 정보 페이지
	 */
	@RequestMapping("/user/cuc/ccc/infoCCC.do")
	public String infoCCC(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "040200");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cuc/ccc/infoCCC");
	}
	
	/**
	 * 공단검진센터(Industrial Checkup Center) 정보 페이지
	 */
	@RequestMapping("/user/cuc/icc/infoICC.do")
	public String infoICC(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "040300");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cuc/icc/infoICC");
	}
	
	/**
	 * 공단검진센터(Industrial Checkup Center) 정보 페이지
	 */
	@RequestMapping("/user/cuc/pct/precautions.do")
	public String precautions(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "040400");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cuc/pct/precautions");
	}
}
