package fbcms.jpn.cmm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 일본어 메인화면을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class JpnMainController {
	
	
	/**
	 * 일본어 메인화면
	 */
	@RequestMapping("/jpn/index.do")
	public String jpnMain(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000", "jpn");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "jpn/index", "jpn/", "mobileJpn/");
	}
}
