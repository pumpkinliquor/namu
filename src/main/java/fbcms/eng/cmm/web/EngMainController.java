package fbcms.eng.cmm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 영어 메인화면을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class EngMainController {
	
	
	/**
	 * 영어 메인화면
	 */
	@RequestMapping("/eng/index.do")
	public String engMain(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000", "eng");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "eng/index", "eng/", "mobileEng/");
	}
}
