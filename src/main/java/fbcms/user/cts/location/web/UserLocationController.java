package fbcms.user.cts.location.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 찾아오시는길 처리하는 비즈니스 구현 클래스
*/
@Controller
public class UserLocationController {
	/**
	 * 찾아오시는 길
	 */
	@RequestMapping("/user/cts/location/map.do")
	public String map(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060300");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/location/map");
	}
}
