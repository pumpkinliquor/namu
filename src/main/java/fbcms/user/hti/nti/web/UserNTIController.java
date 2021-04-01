package fbcms.user.hti.nti.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;

/**
* 영양정보를 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserNTIController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserNTIController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;

    @Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	
	/**
	 * 영양정보에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/hti/nti/selectNTIList.do")
	public String selectNTIList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000005", 10);
		FbcmsCommonUtils.getMenuNavigation(request, model, "050300");
		
		// 카테고리 가져오기
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000005");
		List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listNTIComCode", listNTIComCode );
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/nti/userNTIList");
	}
	
	/**
	 * 영양정보에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/hti/nti/selectNTIDetail.do")
	public String selectNTIDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000005", 10);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "050300");
		
		// 카테고리 가져오기
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000005");
		List<?> listNTIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listNTIComCode", listNTIComCode );
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/nti/userNTIDetail");
	}
}
