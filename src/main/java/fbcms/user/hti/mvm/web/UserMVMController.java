package fbcms.user.hti.mvm.web;

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
* 운동동영상을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserMVMController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserMVMController.class);
	
	@Resource(name = "UserArticleService")
	private UserArticleService userArticleService;

    @Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	
	/**
	 * 운동동영상에 대한 목록을 조회한다.
	 */
	@RequestMapping("/user/hti/mvm/selectMVMList.do")
	public String selectMVMList(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		userArticleService.selectArticleList(boardVO, request, response, model, "BBSMSTR_000000000008", 12);
		FbcmsCommonUtils.getMenuNavigation(request, model, "050600");
		
		// 카테고리 가져오기
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000008");
		List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listMVMComCode", listMVMComCode );
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/mvm/userMVMList");
	}
	
	/**
	 * 운동동영상에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/user/hti/mvm/selectMVMDetail.do")
	public String selectMVMDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		boolean bDetail = userArticleService.selectArticleDetail(boardVO, request, response, model, "BBSMSTR_000000000008", 12);
		if(!bDetail) {
			return "redirect:/user/cmm/err/error.do";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "050600");
		
		// 카테고리 가져오기
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000008");
		List<?> listMVMComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listMVMComCode", listMVMComCode );
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hti/mvm/userMVMDetail");
	}
}
