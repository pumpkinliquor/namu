package fbcms.user.hti.dct.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;

/**
* Dr.민영일의 건강백서를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserDCTController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserDCTController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;
	
	
	/**
	 * Dr.민영일의 건강백서에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/hti/dct/selectDCTList.do")
	public String selectDCTList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000004", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "050200");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/dct/userDCTList");
	}
	
	/**
	 * Dr.민영일의 건강백서에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/hti/dct/selectDCTDetail.do")
	public String selectDCTDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000004", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "050200");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/dct/userDCTDetail");
	}
}
