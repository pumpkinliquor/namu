package fbcms.eng.cuc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 검진센터(CheckUp Center)을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class EngCUCController {
	
	
	/**
	 * 검진센터 정보 페이지
	 */
	@RequestMapping("/eng/cuc/health.do")
	public String health(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "040000", "eng");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "eng/cuc/health", "eng/", "mobileEng/");
	}
}
