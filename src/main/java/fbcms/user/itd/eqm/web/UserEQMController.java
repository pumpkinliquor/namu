package fbcms.user.itd.eqm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 장비소개를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserEQMController {
	
	
	/**
	 * 장비소개
	 */
	@RequestMapping("/user/itd/eqm/equipment.do")
	public String selectEQMList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010400");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/eqm/equipment");
	}
}
