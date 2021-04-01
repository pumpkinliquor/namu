package fbcms.user.cts.ntc.web;

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
 * 공지사항을 위한 컨트롤러 클래스
 */

@Controller
public class UserNTCController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserNTCController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;
	
	
	/**
	 * 공지사항에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/cts/ntc/selectNTCList.do")
	public String selectNTCList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000001", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "060600");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/ntc/userNTCList");
	}
	
	/**
	 * 공지사항에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/cts/ntc/selectNTCDetail.do")
	public String selectNTCDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000001", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "060600");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/ntc/userNTCDetail");
	}
}
