package fbcms.chn.cts.web;

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
public class ChnCTSController {
	
	
	/**
	 * 고객서비스 페이지
	 */
	@RequestMapping("/chn/cts/customer.do")
	public String customer(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "050000", "chn");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "chn/cts/customer", "chn/", "mobileChn/");
	}
}
