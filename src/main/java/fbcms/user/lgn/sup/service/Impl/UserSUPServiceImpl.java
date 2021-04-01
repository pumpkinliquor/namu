package fbcms.user.lgn.sup.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.user.lgn.MemberVO;
import fbcms.user.lgn.sup.service.UserSUPService;

/**
 * 회원가입을 처리하는 비즈니스 구현 클래스
 */
@Service("UserSUPService")
public class UserSUPServiceImpl extends EgovAbstractServiceImpl implements UserSUPService {

    @Resource(name="UserSUPDAO")
    private UserSUPDAO UserSUPDAO;

	@Override
	public int sign(Map<String, Object> map) throws Exception {
	
		return UserSUPDAO.sign(map);
	}
	
	@Override
	public int sign2(Map<String, Object> map) throws Exception {
		
		return UserSUPDAO.sign2(map);
	}

	@Override
	public int repetitionCheck(MemberVO memberVO) throws Exception {

		return UserSUPDAO.repetitionCheck(memberVO);
	}
}
