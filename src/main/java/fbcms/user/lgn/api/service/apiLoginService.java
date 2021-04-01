package fbcms.user.lgn.api.service;

import java.util.Map;

import fbcms.user.lgn.MembersVO;

/**
 * api 로그인을 처리하는 비즈니스 인터페이스 클래스
 */
public interface apiLoginService {
	
	
	
	// 회원가입 여부 체크
	public int joinCheck(String USER_ID) throws Exception;

	public int apiSign(Map<String, Object> map) throws Exception;

	public int apiCheck(String apiID) throws Exception;

	public MembersVO findforAPI(String apiID) throws Exception;
	
}
