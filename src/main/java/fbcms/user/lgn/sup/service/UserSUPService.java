package fbcms.user.lgn.sup.service;

import java.util.Map;

import fbcms.user.lgn.MemberVO;

/**
 * 회원가입을 처리하는 비즈니스 인터페이스 클래스
 */
public interface UserSUPService {

	int sign(Map<String, Object> map) throws Exception;

	int sign2(Map<String, Object> map) throws Exception;

	int repetitionCheck(MemberVO memberVO) throws Exception;

	
}
