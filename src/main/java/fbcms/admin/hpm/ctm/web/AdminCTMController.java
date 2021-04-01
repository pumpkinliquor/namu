package fbcms.admin.hpm.ctm.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import fbcms.admin.hpm.ctm.service.AdminCTMService;
import fbcms.admin.hpm.ctm.service.Impl.CenterTemplDetailVO;
import fbcms.admin.hpm.ctm.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.ctm.service.Impl.CenterVO;
import fbcms.com.cmm.service.CommonCodeVO;
import fbcms.com.cmm.service.CommonService;

/**
 * 센터관리
 * @author 김명진
 * @since 2020.10.14
 */
@Controller
public class AdminCTMController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCTMController.class);
	@Autowired
	AdminCTMService adminCTMService;
	@Autowired
	CommonService commonService;
	
	/**
	 * 센터관리 리스트 페이지
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/ctm/selectCTMList.do")
	public String selectCTMList(ModelMap model, @ModelAttribute CenterVO centerVO) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		List centerList = adminCTMService.selectOcsCTMList(centerVO);
		model.addAttribute("centerList", centerList);
		return "admin/hpm/ctm/adminCTMList";
	}
	
	/**
	 * 센터관리 관리페이지
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/ctm/updateCTMView.do")
	public String updateCTMView(ModelMap model,@ModelAttribute CenterVO centerVO) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		CommonCodeVO commonCodeVO = new CommonCodeVO();
		
		commonCodeVO.setCOMMON_CODE("MNG_CD");
		commonCodeVO.setCODE(centerVO.getMNG_CD());
		commonCodeVO.setNAME(centerVO.getMNG_NM());
		commonService.insertCommonCodeDetail(commonCodeVO);
		
		adminCTMService.updateCTM(centerVO,null,null);
		
		CenterVO tmpType = adminCTMService.selectCTMTmpType(centerVO);
		centerVO.setMNG_GUBN_CD("02");  //02 센터
		centerVO.setMNG_SEQ("1"); //1 기본
		centerVO = adminCTMService.selectCTM(centerVO);
		model.addAttribute("index",tmpType.getINDEX());
		model.addAttribute("centerVO",centerVO);
		return "admin/hpm/ctm/adminCTMModify";
	}
	
	/**
	 * 센터관리 저장하기
	 * @param request
	 * @param mutirequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/ctm/updateCTM.do")
	public String updateCTM(@ModelAttribute("centerVO")CenterVO centerVO
						   ,@ModelAttribute("centerTemplVO")CenterTemplVO centerTemplVO
						   ,@ModelAttribute("CenterTemplDetailVOList")CenterTemplDetailVO CenterTemplDetailVOList
						   ,MultipartHttpServletRequest multirequest
						   ,RedirectAttributes remodel) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		adminCTMService.updateCTM(centerVO, centerTemplVO, CenterTemplDetailVOList);
		return "redirect:/admin/hpm/ctm/selectCTMList.do";
	}
}
