package fbcms.admin.lgn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import fbcms.admin.lgn.service.AdminLoginService;
import fbcms.admin.sym.umt.service.AdminAdminDefaultVO;
import fbcms.admin.sym.umt.service.AdminAdminManageService;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 관리자 로그인을 처리하는 컨트롤러 클래스
 */
@Controller
public class AdminLoginController {

	/** AdminAdminManageService */
	@Resource(name = "AdminAdminManageService")
	private AdminAdminManageService adminAdminManageService;

	/** AdminLoginService */
	@Resource(name = "AdminLoginService")
	private AdminLoginService adminLoginService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminLoginController.class);
	
	
	/**
	 * 로그인 화면으로 들어간다
	 */
	@IncludedInfo(name = "로그인", listUrl = "/admin/lgn/adminLogin.do", order = 10, gid = 10)
	@RequestMapping(value = "/admin/lgn/adminLogin.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		if (EgovComponentChecker.hasComponent("mberManageService")) {
			model.addAttribute("useMemberManage", "true");
		}
				
		//권한체크시 에러 페이지 이동
		String auth_error =  request.getParameter("auth_error") == null ? "" : (String)request.getParameter("auth_error");
		if(auth_error != null && auth_error.equals("1")) {
			return "egovframework/com/cmm/error/accessDenied";
		}
		
		String message = (String)request.getParameter("message");
		if (message != null && !message.isEmpty()) {
			model.addAttribute("message", message);
		}
		
		return "fbcms/admin/lgn/adminLogin";
	}

	/**
	 * 일반(세션) 로그인을 처리한다
	 */
	@RequestMapping(value = "/admin/lgn/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		// 1. 로그인인증제한 활성화시 
		if( egovLoginConfig.isLock()) {
		    Map<?,?> mapLockUserInfo = (EgovMap)adminLoginService.selectLoginIncorrect(loginVO);
		    if(mapLockUserInfo != null) {			
				//2.1 로그인인증제한 처리
				String sLoginIncorrectCode = adminLoginService.processLoginIncorrect(loginVO, mapLockUserInfo);
				if(!sLoginIncorrectCode.equals("E")) {
					if(sLoginIncorrectCode.equals("L")) {
						model.addAttribute("message", egovMessageSource.getMessageArgs("fail.common.loginIncorrect", new Object[] {egovLoginConfig.getLockCount(),request.getLocale()}));
					} else if(sLoginIncorrectCode.equals("C")) {
						model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
					}
					return "redirect:/admin/lgn/adminLogin.do";
				}
			} else {
		    	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
		    	return "redirect:/admin/lgn/adminLogin.do";
		    }
		}
		
		// 2. 로그인 처리
		LoginVO resultVO = adminLoginService.actionLogin(loginVO);
		List<String> listAuthority = adminLoginService.selectLoginAuthority(loginVO);
		
		// 3. 관리자 로그인 성공 실패 확인
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			// 3-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("AUTHORITY", listAuthority);
			
			return "redirect:/admin/lgn/actionMain.do";
		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
			return "redirect:/admin/lgn/adminLogin.do";
		}
	}	

	/**
	 * 로그인 후 메인화면으로 들어간다
	 */
	@RequestMapping(value = "/admin/lgn/actionMain.do")
	public String actionMain(ModelMap model) throws Exception {

		// 1. Spring Security 사용자권한 처리
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		return "redirect:/admin/sym/umt/emplyrDetail.do";
	}

	/**
	 * 로그아웃한다.
	 */
	@RequestMapping(value = "/admin/lgn/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		/*String userIp = EgovClntInfo.getClntIP(request);

		// 1. Security 연동
		return "redirect:/j_spring_security_logout";*/
		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("AUTHORITY", null);
		
		return "redirect:/admin/lgn/adminLogin.do";
	}
}