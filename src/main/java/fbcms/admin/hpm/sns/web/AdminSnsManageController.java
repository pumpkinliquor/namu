package fbcms.admin.hpm.sns.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.com.uss.ion.ulm.service.UnityLink;
import egovframework.rte.fdl.property.EgovPropertyService;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.sns.service.AdminSnsManage;
import fbcms.admin.hpm.sns.service.AdminSnsManageService;
import fbcms.com.cmm.FbcmsCommonUtils;
import jdk.net.NetworkPermission;

/**
 * SNS 관리에 대한 Controller를 정의한다.
 */
@Controller
public class AdminSnsManageController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminSnsManageController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
    /** AdminSnsManageService */
	@Resource(name = "AdminSnsManageService")
    private AdminSnsManageService adminSnsManageService;
	
	
	/**
     * SNS를 수정하기 전 단계처리
     */
    @RequestMapping("/admin/hpm/sns/updateSnsManageView.do")
    public String updateSnsManageView(@ModelAttribute("adminSnsManage") AdminSnsManage adminSnsManage
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	
		//통합링크구분설정
		adminSnsManage.setUnityLinkSeCode("SNS");
        List<AdminSnsManage> resultList = adminSnsManageService.selectUnityLinkList(adminSnsManage);
        model.addAttribute("resultList", resultList);
        
        return "admin/hpm/sns/adminSnsManageUpdt";
    }
	
    /**
     * SNS를 등록 처리한다
     */
    @RequestMapping("/admin/hpm/sns/insertSnsManage.do")
    public String insertSnsManage(HttpServletRequest request
    		, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		for(int i = 0; i < 3; i++) {
			AdminSnsManage adminSnsManage = new AdminSnsManage();
			adminSnsManage.setUnityLinkSeCode(request.getParameter("unityLinkSeCode"));
			adminSnsManage.setUnityLinkNm(request.getParameter("unityLinkNm_" + (i+1)));
			adminSnsManage.setUnityLinkUrl(request.getParameter("unityLinkUrl_" + (i+1)));
			adminSnsManage.setUnityLinkDc(request.getParameter("unityLinkNm_" + (i+1)));
			adminSnsManage.setFrstRegisterId(user.getUniqId());
			adminSnsManage.setLastUpdusrId(user.getUniqId());
			
			adminSnsManageService.insertUnityLink(adminSnsManage);
		}
		
        return "redirect:/admin/hpm/sns/updateSnsManageView.do";
    }
	
    /**
     * SNS를 수정 처리한다
     */
    @RequestMapping("/admin/hpm/sns/updateSnsManage.do")
    public String updateSnsManage(HttpServletRequest request
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		for(int i = 0; i < 3; i++) {
			AdminSnsManage adminSnsManage = new AdminSnsManage();
			adminSnsManage.setUnityLinkId(request.getParameter("unityLinkId_" + (i+1)));
			adminSnsManage.setUnityLinkSeCode(request.getParameter("unityLinkSeCode"));
			adminSnsManage.setUnityLinkNm(request.getParameter("unityLinkNm_" + (i+1)));
			adminSnsManage.setUnityLinkUrl(request.getParameter("unityLinkUrl_" + (i+1)));
			adminSnsManage.setUnityLinkDc(request.getParameter("unityLinkNm_" + (i+1)));
			adminSnsManage.setFrstRegisterId(user.getUniqId());
			adminSnsManage.setLastUpdusrId(user.getUniqId());
			
			adminSnsManageService.updateUnityLink(adminSnsManage);
		}
		
        return "redirect:/admin/hpm/sns/updateSnsManageView.do";
    }
}
