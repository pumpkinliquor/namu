package fbcms.user.lgn.sup.service.Impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.lgn.MemberVO;

/**
 * 회원가입을 처리하는 DAO 클래스
 * @author 박원준
 * @since 2020.11.02
 * @version 1.0
 * @see
 */
@Repository("UserSUPDAO")
public class UserSUPDAO extends EgovComAbstractDAO {

	public int sign(Map<String, Object> map) {
		
		return insert("Sign.sign", map);
	}

	public int sign2(Map<String, Object> map) {
		
		return insert("Sign.sign2", map);
	}

	public int repetitionCheck(MemberVO memberVO) {
		
		return (int) selectOne("Sign.repetitionCheck", memberVO);
	}
}
