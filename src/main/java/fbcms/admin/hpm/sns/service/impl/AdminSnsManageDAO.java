package fbcms.admin.hpm.sns.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.sns.service.AdminSnsManage;

@Repository("AdminSnsManageDAO")
public class AdminSnsManageDAO extends EgovComAbstractDAO {

	/**
     * SNS 관리를(을) 조회 한다.
     */
    public List<?> selectUnityLinkList(AdminSnsManage adminSnsManage) throws Exception {
        return (List<?>)selectList("AdminSnsManage.selectUnityLinkList", adminSnsManage);
    }

    /**
     * SNS 관리를(을) 등록한다.
     */
    public void insertUnityLink(AdminSnsManage adminSnsManage) throws Exception {
        insert("AdminSnsManage.insertUnityLink", adminSnsManage);
    }

    /**
     * SNS 관리를(을) 수정한다.
     */
    public void updateUnityLink(AdminSnsManage adminSnsManage) throws Exception {
        update("AdminSnsManage.updateUnityLink", adminSnsManage);
    }
}
