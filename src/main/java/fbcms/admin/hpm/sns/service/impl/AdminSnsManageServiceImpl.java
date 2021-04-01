package fbcms.admin.hpm.sns.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.ion.ulm.service.UnityLink;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.sns.service.AdminSnsManage;
import fbcms.admin.hpm.sns.service.AdminSnsManageService;

@Service("AdminSnsManageService")
public class AdminSnsManageServiceImpl extends EgovAbstractServiceImpl implements AdminSnsManageService {

	@Resource(name = "AdminSnsManageDAO")
    private AdminSnsManageDAO adminSnsManageDAO;

    @Resource(name = "egovUnityLinkIdGnrService")
    private EgovIdGnrService idgenService;
	
	
	/**
     * SNS 관리를(을) 조회 한다.
     */
    @SuppressWarnings("unchecked")
	@Override
	public List<AdminSnsManage> selectUnityLinkList(AdminSnsManage adminSnsManage) throws Exception {
        return (List<AdminSnsManage>) adminSnsManageDAO.selectUnityLinkList(adminSnsManage);
    }

    /**
     * SNS 관리를(을) 등록한다.
     */
    @Override
	public void insertUnityLink(AdminSnsManage adminSnsManage) throws Exception {
        String sMakeId = idgenService.getNextStringId();
        adminSnsManage.setUnityLinkId(sMakeId);
        adminSnsManageDAO.insertUnityLink(adminSnsManage);
    }

    /**
     * SNS 관리를(을) 수정한다.
     */
    @Override
	public void updateUnityLink(AdminSnsManage adminSnsManage) throws Exception {
    	adminSnsManageDAO.updateUnityLink(adminSnsManage);
    }
}
