package fbcms.eng.cts.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
 * 고객서비스 위한 컨트롤러 클래스
 */
@Controller
public class EngCTSController {
	
	
	/**
	 * 고객서비스 페이지
	 */
	@RequestMapping("/eng/cts/customer.do")
	public String customer(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "050000", "eng");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "eng/cts/customer", "eng/", "mobileEng/");
	}
}
