package fbcms.admin.lgn.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;

/**
 * 관리자 로그인을 처리하는 비즈니스 인터페이스 클래스
 */
public interface AdminLoginService {
	
	/**
	 * EsntlId를 이용한 로그인을 처리한다
	 */
    public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception;
	
	/**
	 * 관리자 로그인을 처리한다
	 */
	LoginVO actionLogin(LoginVO vo) throws Exception;
	
	/**
	 * 로그인인증제한을 처리한다.
	 */
	String processLoginIncorrect(LoginVO vo, Map<?,?> mapLockUserInfo) throws Exception;
	
	/**
	 * 로그인인증제한을 조회한다.
	 */
	Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception;
	
	/**
	 * 관리자 로그인 권한 조회
	 */
	public List<String> selectLoginAuthority(LoginVO vo) throws Exception;
}
