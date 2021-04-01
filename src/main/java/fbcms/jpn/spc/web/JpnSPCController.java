package fbcms.jpn.spc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
 * 특화센터(SPecialized Center)를 처리하는 비즈니스 구현 클래스
 */
@Controller
public class JpnSPCController {
	

	/**
	 * 각 특화센터 센터소개 페이지
	 */
	@RequestMapping("/jpn/spc/specialized.do")
	public String specialized(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "030000", "jpn");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "jpn/spc/specialized", "jpn/", "mobileJpn/");
	}
}
