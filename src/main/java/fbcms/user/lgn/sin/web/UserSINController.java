package fbcms.user.lgn.sin.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.lgn.idFindVO;
import fbcms.user.lgn.sin.service.UserSINService;


/**
 * 유저 로그인을 처리하는 컨트롤러 클래스
 */
@Controller
public class UserSINController {

	/** LoginService */
	@Resource(name = "UserSINService")
	private UserSINService userSINService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;

	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(UserSINController.class);
	
	
	/**
	 * 로그인 화면으로 들어간다
	 */
	@IncludedInfo(name = "로그인", listUrl = "/user/lgn/sin/userLogin.do", order = 10, gid = 10)
	@RequestMapping(value = "/user/lgn/sin/userLogin.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		/*
		 * 리다이렉트 URL 설정
		 * Get호출일 때, 회원가입 관련이 아닐 때만 세션에 저장해준다.
		 * */
		String redirectURL = request.getSession().getAttribute("r") == null ? "/" : request.getSession().getAttribute("r").toString();
		if (request.getMethod().equals("GET") && !redirectURL.contains("/mem/") && !redirectURL.contains("/sin/") && !redirectURL.contains("Login")) {
			request.getSession().setAttribute("r", (String) request.getHeader("REFERER"));
		}
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
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userLogin");
	}

	/**
	 * 일반(세션) 로그인을 처리한다
	 */
	@RequestMapping(value = "/user/lgn/sin/actionLogin.do")
	public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		// 로그인 인증제한 제외, 2020.12.15_김현철차장님 요청사항 반영
		// 1. 로그인인증제한 활성화시 
//		if( egovLoginConfig.isLock()) {
//		    Map<?,?> mapLockUserInfo = (EgovMap)userSINService.selectLoginIncorrect(loginVO);
//		    if(mapLockUserInfo != null) {
//				//2.1 로그인인증제한 처리
//				String sLoginIncorrectCode = userSINService.processLoginIncorrect(loginVO, mapLockUserInfo);
//				if(!sLoginIncorrectCode.equals("E")) {
//					if(sLoginIncorrectCode.equals("L")) {
//						model.addAttribute("message", egovMessageSource.getMessageArgs("fail.common.loginIncorrect", new Object[] {egovLoginConfig.getLockCount(),request.getLocale()}));
//					} else if(sLoginIncorrectCode.equals("C")) {
//						model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
//					}
//					return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userLogin");
//				}
//			} else {
//		    	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
//		    	return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userLogin");
//		    }
//		}
		
		// * 로그인 처리전에 기존회원여부 조회 (성별이 null인 데이터)
		/* ****************************************************
		 *  Process
		 * 
		 * 1. 아이디로 조회
		 * 2. 성별이 Null인 값으로 count
		 * 3. null인 아이디일 경우 패스워드및 성별 추가하는 페이지로 노출
		 * ****************************************************/
		if(userSINService.movedUserData(loginVO) > 0) {
			model.put("USER_ID", loginVO.getId());
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/pwReset2");
		}
		
		// 2. 로그인 처리
		LoginVO resultVO = userSINService.actionLogin(loginVO);
		List<String> Authority = userSINService.selectLoginAuthority(loginVO.getId());
		
		// 3. 일반 로그인 처리
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
	
			if(resultVO.getSTAT_CD().equals("02")) {
				return "redirect:/user/lgn/sin/dormancy.do";
			} else if("Y".equals(resultVO.getPW_INIT_YN())) {
				// 초기화 대상자일 경우 비밀번호 변경으로 넘긴다.
				model.addAttribute("USER_ID", resultVO.getId());
				return "redirect:/user/lgn/sin/pwreset.do";
			}
			
			// 3-1. 로그인 일시 저장
			userSINService.updateLoginDt(resultVO);
			
			// 3-2. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);
			request.getSession().setAttribute("AUTHORITY", Authority);
			return "redirect:/user/lgn/sin/actionMain.do";

		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userLogin");
		}
	}	
	
	// 로그인 시 휴면계정 처리
	@RequestMapping(value = "/user/lgn/sin/dormancy.do")
	public String dormancyPage(HttpServletRequest request, HttpServletResponse response, ModelMap model, String step) throws Exception {
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null && user.getId() != null) {
			return "redirect:/";
		}
		if (step == null)
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/dormancyStep01");
		else {
			if (step.equals("02")) {
				return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/dormancyStep" + step);
			}
		}
		return null;
	}
	
	// 휴면계정 복구
	@RequestMapping(value = "/user/lgn/sin/okdormancy.do")
	@ResponseBody
	public int okdormancy(@RequestBody Map<String, Object> map) throws Exception {
				
		int result = userSINService.okdormancy(map);
		
		return result;
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 * 
	 * 2020.11.24 수정 : 엄국현
	 * Redirect URL 로그인 시도 전 페이지로 이동
	 */
	@RequestMapping(value = "/user/lgn/sin/actionMain.do")
	public String actionMain(ModelMap model, HttpServletRequest request) throws Exception {
		// 1. Spring Security 사용자권한 처리
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "user/cmm/lgn/userLogin";
		}
		
		// 3. 메인 페이지 이동
		// --> 2020.11.24 수정 로그인 페이지 이동 직전 페이지로 넘김
		String main_page = request.getSession().getAttribute("r") == null ? "/" : request.getSession().getAttribute("r").toString(); 
		// 변수에 저장 후 세션 청소
		request.getSession().removeAttribute("r");
		if(main_page.contains("/sin")) {
			main_page = "/";
		}
		return "redirect:" + main_page;
	}

	/**
	 * 로그아웃한다.
	 */
	@RequestMapping(value = "/user/lgn/sin/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {

		/*String userIp = EgovClntInfo.getClntIP(request);

		// 1. Security 연동
		return "redirect:/j_spring_security_logout";*/
		request.getSession().setAttribute("loginVO", null);
		request.getSession().setAttribute("AUTHORITY", null);
		request.getSession().invalidate();
		
		return "redirect:/user/lgn/sin/userLogin.do";
	}

	/**
	 * 아이디/비밀번호 찾기 화면으로 들어간다
	 */
	@RequestMapping(value = "/user/lgn/sin/userIdPasswordSearch.do")
	public String idPasswordSearchView(HttpServletRequest request, ModelMap model) throws Exception {

		/*
		// 1. 비밀번호 힌트 공통코드 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM022");
		List<?> code = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("pwhtCdList", code);*/
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/idpwFind");
	}
	
	/**
	 * 이름과 전화번호를 받아서 ID가 있는지 확인한다.
	 */
	@RequestMapping(value = "/user/lgn/sin/findId.do")
	@ResponseBody
	public idFindVO findId(@RequestBody Map<String, Object> map) throws Exception {
		
		idFindVO VO = userSINService.findId(map);
		
		if(VO!=null) {
			return VO;
		} else {
			return null;
		}
	}
	
	/**
	 * 비밀번호를 재설정하는 페이지로 이동.
	 */
	@RequestMapping(value = "/user/lgn/sin/pwreset.do")
	public String pwReset(HttpServletRequest request, ModelMap model, String USER_ID) throws Exception {
		
		model.addAttribute("USER_ID", USER_ID);
		
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/pwReset"); 
	}
	
	 /**
	 * 비밀번호 변경
	 */
	@RequestMapping(value = "/user/lgn/sin/pwchange.do")
	@ResponseBody
	public int pwChange(@RequestBody Map<String, Object> map) throws Exception {
		
		String PW = (String)map.get("PW");
		String ID = (String)map.get("USER_ID");
		
		
		String flag = (String)map.get("flag") == null ? "N" : (String)map.get("flag");
		/**
		 * 사전 체크 (리뉴얼 전 기존회원인데, 데이터가 깨져있는지 검사)
		 * 데이터가 없을 경우 보정해준다
		 * flag가 Y로 들어와야만 진행 가능.
		 */
		if("Y".equals(flag)) {
			String name = (String)map.get("name") == null ? null : (String)map.get("name");
			String SEXDSTN_CODE = (String)map.get("SEXDSTN_CODE") == null ? null : (String)map.get("SEXDSTN_CODE");
			String birthDt = (String)map.get("birthDt") == null ? null : (String)map.get("birthDt");
			String ctn = (String)map.get("ctn") == null ? null : (String)map.get("ctn");
			map.put("flag", flag);
			map.put("name", name);
			map.put("birthDt", birthDt);
			map.put("ctn", ctn);
			map.put("SEXDSTN_CODE", SEXDSTN_CODE);
		}
		
		// 저장받은 패스워드를 불러와서 암호화 시켜준 후 다시 맵에 넣어서  DB에 값을 넣을 때 사용함.
		PW = EgovFileScrty.encryptPassword(PW, ID);
		
		map.put("PW", PW);
		return userSINService.pwChange(map);
	}
		

	/**
	 * 아이디를 찾는다.
	 */
	@RequestMapping(value = "/user/lgn/sin/searchId.do")
	public String searchId(@ModelAttribute("loginVO") LoginVO loginVO
			, HttpServletRequest request
			, ModelMap model) throws Exception {

		if (loginVO == null || loginVO.getName() == null || loginVO.getName().equals("") && loginVO.getEmail() == null || loginVO.getEmail().equals("")
				&& loginVO.getUserSe() == null || loginVO.getUserSe().equals("")) {
			return "user/cmm/lgn/egovError";
		}

		// 1. 아이디 찾기
		loginVO.setName(loginVO.getName().replaceAll(" ", ""));
		LoginVO resultVO = userSINService.searchId(loginVO);

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

			model.addAttribute("resultInfo", "아이디는 " + resultVO.getId() + " 입니다.");
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userIdPasswordResult");
		} else {
			model.addAttribute("resultInfo", egovMessageSource.getMessage("fail.common.idsearch"));
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userIdPasswordResult");
		}
	}

	/**
	 * 비밀번호를 찾는다.
	 */
	@RequestMapping(value = "/user/lgn/sin/searchPassword.do")
	public String searchPassword(@ModelAttribute("loginVO") LoginVO loginVO
			, HttpServletRequest request
			, ModelMap model) throws Exception {

		//KISA 보안약점 조치 (2018-10-29, 윤창원)
		if (loginVO == null || loginVO.getId() == null || loginVO.getId().equals("") && loginVO.getName() == null || "".equals(loginVO.getName()) && loginVO.getEmail() == null
				|| loginVO.getEmail().equals("") && loginVO.getPasswordHint() == null || "".equals(loginVO.getPasswordHint()) && loginVO.getPasswordCnsr() == null
				|| "".equals(loginVO.getPasswordCnsr()) && loginVO.getUserSe() == null || "".equals(loginVO.getUserSe())) {
			return "user/cmm/lgn/egovError";
		}

		// 1. 비밀번호 찾기
		boolean result = userSINService.searchPassword(loginVO);

		// 2. 결과 리턴
		if (result) {
			model.addAttribute("resultInfo", "임시 비밀번호를 발송하였습니다.");
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userIdPasswordResult");
		} else {
			model.addAttribute("resultInfo", egovMessageSource.getMessage("fail.common.pwsearch"));
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/lgn/userIdPasswordResult");
		}
	}
}