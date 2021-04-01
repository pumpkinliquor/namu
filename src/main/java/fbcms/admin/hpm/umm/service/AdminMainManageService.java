package fbcms.admin.hpm.umm.service;

import java.util.List;

import fbcms.admin.hpm.bbs.service.AdminBoardVO;

public interface AdminMainManageService {

	List<AdminBoardVO> selectMainManageList(AdminBoardVO adminBoardVO);
}
