package fbcms.user.lgn.api.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.user.lgn.MembersVO;
import fbcms.user.lgn.api.service.apiLoginService;

/**
 * api 로그인을 처리하는 비즈니스 구현 클래스
 */
@Service("apiLoginService")
public class apiLoginServiceImpl extends EgovAbstractServiceImpl implements apiLoginService {

    @Resource(name="apiLoginDAO")
    private apiLoginDAO apiLoginDAO;

    
    
    // 회원가입 여부를 확인한다.
	@Override
	public int joinCheck(String USER_ID) throws Exception {
		
		return apiLoginDAO.joinCheck(USER_ID);
		
	}
	
	@Override
	public int apiSign(Map<String, Object> map) throws Exception {
		
		return apiLoginDAO.apiSign(map);
	}
	
	@Override
	public MembersVO findforAPI(String apiID) throws Exception {
		
		return apiLoginDAO.findforAPI(apiID);
	}
	
	
	@Override
	public int apiCheck(String apiID) throws Exception {
		// TODO Auto-generated method stub
		return apiLoginDAO.apiCheck(apiID);
	}
	
	
}
