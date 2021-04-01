package fbcms.user.lgn.api.service.Impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.lgn.MembersVO;

/**
 * api 로그인을 처리하는 DAO 클래스
 * @author 박원준
 * @since 2020.10.28
 */

@Repository("apiLoginDAO")
public class apiLoginDAO extends EgovComAbstractDAO {


	
	/**
	 * 회원 가입 여부를 처리한다.
	 */
    public int joinCheck(String USER_ID) throws Exception {
    	
    	int result =  (int)selectOne("UserAuthDAO.joinCheck", USER_ID);
    	
    	return result;
    }

	public int apiSign(Map<String, Object> map) {
		
		return insert("apiSign.apisign", map);
	}
	
	public int apiCheck(String apiID) {
		
		return (int)selectOne("apiSign.apicheck", apiID);
	}

	public MembersVO findforAPI(String apiID) {
		
		return selectOne("apiSign.findforAPI", apiID);
	}
    
}
