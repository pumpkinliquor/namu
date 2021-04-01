package fbcms.user.lgn.sin.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.lgn.idFindVO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.26  서준식          EsntlId를 이용한 로그인 추가
 *  2017.07.21  장동한 			로그인인증제한 작업
 *  </pre>
 */
@Repository("UserSINDAO")
public class UserSINDAO extends EgovComAbstractDAO {

    /**
     * 2011.08.26
	 * EsntlId를 이용한 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception {
    	return (LoginVO)selectOne("UserAuthDAO.ssoLoginByEsntlId", vo);
    }

    /**
     * 일반 로그인을 처리한다
     * @param vo LoginVO
     * @return LoginVO
     * @exception Exception
     */
    public int movedUserData(LoginVO vo) throws Exception {
    	return (int)selectOne("UserAuthDAO.movedUserData", vo);
    }
    
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectOne("UserAuthDAO.actionLogin", vo);
    }

    /**
	 * 인증서 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionCrtfctLogin(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("UserAuthDAO.actionCrtfctLogin", vo);
    }

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("UserAuthDAO.searchId", vo);
    }

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("UserAuthDAO.searchPassword", vo);
    }

    /**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("UserAuthDAO.updatePassword", vo);
    }
    
    
    /**
	 * 로그인인증제한 내역을 조회한다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
	public Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception {
    	return (Map<?,?>)selectOne("UserAuthDAO.selectLoginIncorrect", vo);
    }

    /**
	 * 로그인인증제한 내역을 업데이트 한다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public void updateLoginIncorrect(Map<?,?> map) throws Exception {
    	update("UserAuthDAO.updateLoginIncorrect"+map.get("USER_SE"), map);
    }

    /**
   	 * 이름과 전화번호를 받아서 ID가 있는지 확인한다..
   	 */
	public idFindVO findId(@RequestBody Map<String, Object> map) throws Exception {
		List<Object> list = (List<Object>) selectList("UserAuthDAO.findId", map);
		if (list.size() > 0) {
			Object VO = list.get(0);
			idFindVO check = (idFindVO) VO;
			return check;
		}
		return null;
	}

   /**
    * 로그인 일시 저장
    */
   public int updateLoginDt(LoginVO loginVO) throws Exception {
	   return update("UserAuthDAO.updateLoginDt", loginVO);
   }
   
   /**
    * 비밀번호 변경
    */
   public int pwChange(@RequestBody Map<String, Object> map) throws Exception{
   	
   	return update("UserAuthDAO.pwChange", map);
   	    	
   }
    
    public Map<?,?> selectLoginAuthority(String USER_ID)throws Exception{
    	return selectOne("UserAuthDAO.selectLoginAuthority",USER_ID);
    }

    /** 휴면 계정 복구
     * 
     */
	public int okdormancy(Map<String, Object> map) {
		
		return update("UserAuthDAO.okdormancy",map);
	}

}
