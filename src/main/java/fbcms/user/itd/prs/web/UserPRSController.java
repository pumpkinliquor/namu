package fbcms.user.itd.prs.web;

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
* 언론보도(PReSs)을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserPRSController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserPRSController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;
	
	
	/**
	 * 언론보도에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/itd/prs/selectPRSList.do")
	public String selectPRSList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000002", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "010500");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/prs/userPRSList");
	}
	
	/**
	 * 언론보도에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/itd/prs/selectPRSDetail.do")
	public String selectPRSDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000002", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "010500");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/prs/userPRSDetail");
	}
}
