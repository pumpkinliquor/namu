package fbcms.admin.hpm.umm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;

@Repository("AdminMainManageDAO")
public class AdminMainManageDAO extends EgovComAbstractDAO {

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBoardVO> selectMainManageList(AdminBoardVO adminBoardVO) {
		return (List<AdminBoardVO>) list("AdminMainManage.selectMainManageList", adminBoardVO);
	}
}
