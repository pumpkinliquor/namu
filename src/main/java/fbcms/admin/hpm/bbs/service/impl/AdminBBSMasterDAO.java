package fbcms.admin.hpm.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBlogVO;
import fbcms.admin.hpm.bbs.service.AdminBlog;
import fbcms.admin.hpm.bbs.service.AdminBlogUser;

@Repository("AdminBBSMasterDAO")
public class AdminBBSMasterDAO extends EgovComAbstractDAO {

	@SuppressWarnings("deprecation")
	public List<?> selectBBSMasterInfs(AdminBoardMasterVO adminBoardMasterVO) {
		return list("AdminBBSMaster.selectBBSMasterList", adminBoardMasterVO);
	}

	public int selectBBSMasterInfsCnt(AdminBoardMasterVO adminBoardMasterVO) {
		return (Integer)selectOne("AdminBBSMaster.selectBBSMasterListTotCnt", adminBoardMasterVO);
	}
	
	public AdminBoardMasterVO selectBBSMasterDetail(AdminBoardMasterVO adminBoardMasterVO) {
		return (AdminBoardMasterVO) selectOne("AdminBBSMaster.selectBBSMasterDetail", adminBoardMasterVO);
	}

	public void insertBBSMasterInf(AdminBoardMaster adminBoardMaster) {
		insert("AdminBBSMaster.insertBBSMaster", adminBoardMaster);
	}

	public void updateBBSMaster(AdminBoardMaster adminBoardMaster) {
		update("AdminBBSMaster.updateBBSMaster", adminBoardMaster);
	}

	public void deleteBBSMaster(AdminBoardMaster adminBoardMaster) {
		update("AdminBBSMaster.deleteBBSMaster", adminBoardMaster);
	}
	
	/*
	 * 블로그 관련
	 */
	@SuppressWarnings("deprecation")
	public List<?> selectBlogMasterInfs(AdminBoardMasterVO adminBoardMasterVO) {
		return list("AdminBBSMaster.selectBlogMasterList", adminBoardMasterVO);
	}
	
	public int selectBlogMasterInfsCnt(AdminBoardMasterVO adminBoardMasterVO) {
		return (Integer)selectOne("AdminBBSMaster.selectBlogMasterListTotCnt", adminBoardMasterVO);
	}
	
	public int checkExistUser(AdminBlogVO adminBlogVO) {
		return (Integer)selectOne("AdminBBSMaster.checkExistUser", adminBlogVO);
	}
	
	public AdminBlogVO checkExistUser2(AdminBlogVO adminBlogVO) {
		return (AdminBlogVO) selectOne("AdminBBSMaster.checkExistUser2", adminBlogVO);
	}
	
	public void insertBoardBlogUserRqst(AdminBlogUser adminBlogUser) {
		insert("AdminBBSMaster.insertBoardBlogUserRqst", adminBlogUser);
	}
	
	public void insertBlogMaster(AdminBlog adminBlog) {
		insert("BBSMaster.insertBlogMaster", adminBlog);
	}
	
	public AdminBlogVO selectBlogDetail(AdminBlogVO adminBlogVO) {
		return (AdminBlogVO) selectOne("AdminBBSMaster.selectBlogDetail", adminBlogVO);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBlogVO> selectBlogListPortlet(AdminBlogVO adminBlogVO) throws Exception{
		return (List<AdminBlogVO>) list("AdminBBSMaster.selectBlogListPortlet", adminBlogVO);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBoardMasterVO> selectBBSListPortlet(AdminBoardMasterVO adminBoardMasterVO) {
		return (List<AdminBoardMasterVO>) list("AdminBBSMaster.selectBBSListPortlet", adminBoardMasterVO);
	}
}
