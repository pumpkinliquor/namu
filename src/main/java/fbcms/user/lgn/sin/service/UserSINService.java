package fbcms.user.lgn.sin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import egovframework.com.cmm.LoginVO;
import fbcms.user.lgn.idFindVO;

/**
 * 관리자 로그인을 처리하는 비즈니스 인터페이스 클래스
 */
public interface UserSINService {
	
	/**
     * 2011.08.26
	 * EsntlId를 이용한 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception;
	
    /**
     * 기존회원 체크를 한다
     * @param vo LoginVO
     * @return LoginVO
     * @exception Exception
     */
    public int movedUserData(LoginVO vo) throws Exception;
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionLogin(LoginVO vo) throws Exception;
    
    /**
	 * 인증서 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionCrtfctLogin(LoginVO vo) throws Exception;
    
    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO searchId(LoginVO vo) throws Exception;
    
    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    boolean searchPassword(LoginVO vo) throws Exception;
    
    
    /**
	 * 로그인인증제한을 처리한다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    String processLoginIncorrect(LoginVO vo, Map<?,?> mapLockUserInfo) throws Exception;
    
    /**
	 * 로그인인증제한을 조회한다.
	 * @param vo LoginVO
	 * @param Map mapLockUserInfo
	 * @return boolean
	 * @exception Exception
	 */
    Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception;
    /**
     * 로그인 권한 조회
     * @param USER_ID
     * @return
     * @throws Exception
     */
    public List<String> selectLoginAuthority(String USER_ID) throws Exception;

    /**
	 * 이름과 전화번호를 받아서 ID가 있는지 확인한다.
	 */
    public idFindVO findId(@RequestBody Map<String, Object> map) throws Exception;

	/**
	 * 로그인 일시 저장
	 * @param loginVO
	 * @return
	 */
	public int updateLoginDt(LoginVO loginVO) throws Exception;
    
    /**
   	 * 비밀번호 변경
   	 */
    public int pwChange(@RequestBody Map<String, Object> map) throws Exception;

    /**
   	 * 휴면 해제
   	 */
	public int okdormancy(Map<String, Object> map) throws Exception;
}
