package egovframework.com.cmm.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2011.09.07  서준식          인증이 필요없는 URL을 패스하는 로직 추가
 *  2017.08.31  장동한          인증된 사용자 체크로직 변경 및 관리자 권한 체크 로직 추가 
 *  </pre>
 */


public class UserAuthenticInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private Environment environment;
	
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(UserAuthenticInterceptor.class);
	
	/** 유저 접근 권한 패턴 목록 */
	private List<String> userAuthPatternList;
	
	public List<String> getUserAuthPatternList() {
		return userAuthPatternList;
	}

	public void setUserAuthPatternList(List<String> userAuthPatternList) {
		this.userAuthPatternList = userAuthPatternList;
	}

	/**
	 * 인증된 사용자 여부로 인증 여부를 체크한다.
	 * 관리자 권한에 따라 접근 페이지 권한을 체크한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		/*
		 * 리다이렉트 URL 설정
		 * Get호출일 때, 회원가입 관련이 아닐 때만 세션에 저장해준다.
		 * */
		String redirectURL = (String) request.getHeader("REFERER") == null ? "/" : (String) request.getHeader("REFERER");
		if (request.getMethod().equals("GET") && !redirectURL.contains("/mem/") && !redirectURL.contains("/sin/") && !redirectURL.contains("Login")) {
			request.getSession().setAttribute("r", (String) request.getHeader("REFERER"));
		}
		//인증된사용자 여부
		boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		/*
		 * 미인증 사용자 아래로 통합
		 * 2020.11.26
		 */
		//미민증사용자 체크
//		if(!isAuthenticated) {
//			ModelAndView modelAndView 	= new ModelAndView("redirect:/user/lgn/sin/userLogin.do");
//			throw new ModelAndViewDefiningException(modelAndView);
//		}
		//인증된 권한 목록
		List<String> authList = (List<String>)EgovUserDetailsHelper.getAuthorities();
		//관리자인증여부
		boolean userAuthUrlPatternMatcher = false;
		//AntPathRequestMatcher
		AntPathRequestMatcher antPathRequestMatcher = null;
		//관리자가 아닐때 체크함
		for(String userAuthPattern : userAuthPatternList){
			antPathRequestMatcher = new AntPathRequestMatcher(userAuthPattern);
			if(antPathRequestMatcher.matches(request)){
				userAuthUrlPatternMatcher = true;
			}
		}
		//미인증 사용자 유저/어드민 공통 체크.
		if(authList == null || (userAuthUrlPatternMatcher && !authList.contains("ROLE_USER") && !isAuthenticated)){
			ModelAndView modelAndView = new ModelAndView("redirect:/user/lgn/sin/userLogin.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
		return true;
	}
}
