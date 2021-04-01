package fbcms.eng.hpm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 진료과를 처리하는 비즈니스 구현 클래스
*/
@Controller
public class EngHpmController {
	
	
	/**
	 * 진료과 페이지
	 */
	@RequestMapping("/eng/hpm/departments.do")
	public String vievis(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "020000", "eng");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "eng/hpm/departments", "eng/", "mobileEng/");
	}
}
