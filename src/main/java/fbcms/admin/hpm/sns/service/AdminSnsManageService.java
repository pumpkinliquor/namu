package fbcms.admin.hpm.sns.service;

import java.util.List;

import fbcms.admin.hpm.sns.service.AdminSnsManage;

public interface AdminSnsManageService {

	/**
	 * SNS 관리를(을) 조회 한다.
	 */
	public List<AdminSnsManage> selectUnityLinkList(AdminSnsManage adminSnsManage) throws Exception;

	/**
	* SNS 관리를(을) 등록한다.
	*/
	void insertUnityLink(AdminSnsManage adminSnsManage) throws Exception;

	/**
	* SNS 관리를(을) 수정한다.
	*/
	void updateUnityLink(AdminSnsManage adminSnsManage) throws Exception;
}
