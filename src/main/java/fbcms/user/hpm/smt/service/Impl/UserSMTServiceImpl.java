package fbcms.user.hpm.smt.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.centerVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.hpm.specialityVO;
import fbcms.user.hpm.smt.service.UserSMTService;

@Service("UserSMTService")
public class UserSMTServiceImpl  extends EgovAbstractServiceImpl implements UserSMTService{
	
	@Resource(name="UserSMTDAO")
    private UserSMTDAO UserSMTDAO;
	
	@Override
	public List<DRListVO> DRList(Map<String, Object> map) throws Exception {
		
		return UserSMTDAO.DRList(map);
	}

	@Override
	public specialityVO specialityList(String code) throws Exception {
		
		return UserSMTDAO.specialityList(code);
	}
	
	@Override
	public String likeCheck(Map<String, Object> map) throws Exception {
		
		return UserSMTDAO.likeCheck(map);
	}
	
	@Override
	public List<?> centerList(Map<String, Object> map) throws Exception {
		
		return UserSMTDAO.centerList(map);
	}
	
	@Override
	public DRListVO drDetail(String DR_ID) throws Exception {
		
		return UserSMTDAO.drDetail(DR_ID);
	}
	
	@Override
	public List<favoritesDRVO> favoritesDRList(String USER_ID) throws Exception {
		return UserSMTDAO.favoritesDRList(USER_ID);
	}
	
	@Override
	public List<specialityVO> dissList(Map<String, Object> map) throws Exception {
		
		return UserSMTDAO.dissList(map);
	}

	@Override
	public String dissListTemp(String dCode) throws Exception {
		return UserSMTDAO.dissListTemp(dCode);
	}

	@Override
	public List<?> majorDiseaseList(specialityVO spVO) {
		return UserSMTDAO.majorDiseaseList(spVO);
	}
	
}
