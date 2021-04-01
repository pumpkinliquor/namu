package fbcms.admin.lgn.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 */
@Repository("AdminLoginDAO")
public class AdminLoginDAO extends EgovComAbstractDAO {
	
    /**
	 * EsntlId를 이용한 로그인을 처리한다
	 */
    public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception {
    	
    	return (LoginVO)selectOne("AdminLogin.ssoLoginByEsntlId", vo);
    }
    
	/**
	 * 일반 로그인을 처리한다
	 */
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		
		return (LoginVO)selectOne("AdminLogin.actionLogin", vo);
	}
	
	/**
	 * 로그인인증제한 내역을 조회한다.
	 */
	public Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception {
		
		return (Map<?,?>)selectOne("AdminLogin.selectLoginIncorrect", vo);
	}
	
	/**
	 * 로그인인증제한 내역을 업데이트 한다.
	 */
	public void updateLoginIncorrect(Map<?,?> map) throws Exception {
		
		update("AdminLogin.updateLoginIncorrect"+map.get("USER_SE"), map);
	}
	
	/**
	 * 로그인 권한 조회
	 */
	public String selectLoginAuthority(LoginVO vo) throws Exception {
		
		return selectOne("AdminLogin.selectLoginAuthority", vo);
	}

	/**
	 * 최종 로그인 일시를 업데이트 한다.
	 */
	public void updateLastLoginDT(LoginVO vo) throws Exception {
		
		update("AdminLogin.updateLastLoginDT", vo);
	}
}
