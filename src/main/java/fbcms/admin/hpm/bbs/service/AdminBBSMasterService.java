package fbcms.admin.hpm.bbs.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import fbcms.admin.hpm.bbs.service.AdminBlogUser;
import fbcms.admin.hpm.bbs.service.AdminBlogVO;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBlog;

public interface AdminBBSMasterService {

	Map<String, Object> selectNotUsedBdMstrList(AdminBoardMasterVO adminBoardMasterVO);

	void deleteBBSMasterInf(AdminBoardMaster adminBoardMaster);

	void updateBBSMasterInf(AdminBoardMaster adminBoardMaster) throws Exception;

	AdminBoardMasterVO selectBBSMasterInf(AdminBoardMasterVO adminBoardMasterVO) throws Exception;

	Map<String, Object> selectBBSMasterInfs(AdminBoardMasterVO adminBoardMasterVO);
	
	void insertBBSMasterInf(AdminBoardMaster adminBoardMaster) throws Exception;

	/*
	 * 블로그 관련
	 */
	Map<String, Object> selectBlogMasterInfs(AdminBoardMasterVO adminBoardMasterVO);
	
	String checkBlogUser(AdminBlogVO adminBlogVO);
	
	AdminBlogVO checkBlogUser2(AdminBlogVO adminBlogVO);

	void insertBoardBlogUserRqst(AdminBlogUser adminBlogUser);
	
	void insertBlogMaster(AdminBlog adminBlog) throws FdlException;
	
	AdminBlogVO selectBlogDetail(AdminBlogVO adminBlogVO) throws Exception;

	List<AdminBlogVO> selectBlogListPortlet(AdminBlogVO adminBlogVO) throws Exception;

	List<AdminBoardMasterVO> selectBBSListPortlet(AdminBoardMasterVO adminBoardMasterVO) throws Exception;

}
