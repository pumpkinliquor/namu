package fbcms.admin.hpm.umm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.umm.service.AdminMainManageService;

@Service("AdminMainManageService")
public class AdminMainManageServiceImpl extends EgovAbstractServiceImpl implements AdminMainManageService {

	@Resource(name = "AdminMainManageDAO")
    private AdminMainManageDAO adminMainManageDAO;
	
	@Override
	public List<AdminBoardVO> selectMainManageList(AdminBoardVO adminBoardVO) {
		
		List<AdminBoardVO> resultList = adminMainManageDAO.selectMainManageList(adminBoardVO);

		return resultList;
	}
}
