package fbcms.user.itd.flg.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 층별안내를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserFLGController {
	
	
	/**
	 * 층별안내 페이지
	 */
	@RequestMapping("/user/itd/flg/floorguide.do")
	public String selectPRSList(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010300");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/flg/floorguide");
	}
}
