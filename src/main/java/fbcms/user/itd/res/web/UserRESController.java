package fbcms.user.itd.res.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;

/**
* 진료실적를 처리하는 비즈니스 구현 클래스
*/
@Controller
public class UserRESController {
	
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	
	/**
	 * 진료실적 페이지
	 */
	@RequestMapping("/user/itd/res/result.do")
	public String a_result(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		AdminBoardVO boardVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000018");
		AdminBoardVO articleVO = adminArticleService.selectTRMDetail(boardVO);
		model.addAttribute("articleVO", articleVO);
		
		articleVO.setParnts(String.valueOf(articleVO.getNttId()));
		Map<String, Object> resultMap = adminArticleService.selectTRMChildList(articleVO);
		List<AdminBoardVO> resultList = (List<AdminBoardVO>) resultMap.get("resultList");
		model.addAttribute("resultList", resultList);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "010200");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/itd/res/result");
	}
}
