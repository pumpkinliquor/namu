package fbcms.jpn.itd.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 병원소개를 처리하는 비즈니스 구현 클래스
*/
@Controller
public class JpnITDController {
	
	
	/**
	 * 병원소개 페이지
	 */
	@RequestMapping("/jpn/itd/vievis.do")
	public String vievis(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010000", "jpn");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "jpn/itd/vievis", "jpn/", "mobileJpn/");
	}
}
