package fbcms.user.itd.ptn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 협력병원를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserPTNController {
	
	
	/**
	 * 협력병원 페이지
	 */
	@RequestMapping("/user/itd/ptn/partner.do")
	public String selectPRSList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010600");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/ptn/partner");
	}
}
