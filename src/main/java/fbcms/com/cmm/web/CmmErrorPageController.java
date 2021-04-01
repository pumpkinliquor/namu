package fbcms.com.cmm.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.umm.service.AdminBannerVO;
import fbcms.admin.hpm.umm.service.AdminMainManageService;
import fbcms.admin.hpm.umm.service.AdminPopupVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;

/**
* 공통 에러화면을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class CmmErrorPageController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserMainController.class);
	
	
	/**
	 * 공통 에러화면
	 */
	@RequestMapping("/user/cmm/err/error.do")
	public String userMain(HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/err/error");
	}
}
