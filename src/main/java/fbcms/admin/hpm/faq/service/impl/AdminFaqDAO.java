package fbcms.admin.hpm.faq.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.faq.service.AdminFaqVO;

@Repository("AdminFaqDAO")
public class AdminFaqDAO extends EgovComAbstractDAO {

	@SuppressWarnings("deprecation")
	public List<?> selectFaqList(AdminFaqVO adminFaqVO) {
		return list("AdminFaqManage.selectFaqList", adminFaqVO);
	}

	public int selectFaqListCnt(AdminFaqVO adminFaqVO) {
		return (Integer) selectOne("AdminFaqManage.selectFaqListCnt", adminFaqVO);
	}

	public void updateFaqInqireCo(AdminFaqVO adminFaqVO) {
		update("AdminFaqManage.updateFaqInqireCo", adminFaqVO);
	}

	public AdminFaqVO selectFaqDetail(AdminFaqVO adminFaqVO) {
		return (AdminFaqVO) selectOne("AdminFaqManage.selectFaqDetail", adminFaqVO);
	}

	public void insertFaq(AdminFaqVO adminFaqVO) {
		insert("AdminFaqManage.insertFaq", adminFaqVO);
	}

	public void updateFaq(AdminFaqVO adminFaqVO) {
		update("AdminFaqManage.updateFaq", adminFaqVO);
	}

	public void deleteFaq(AdminFaqVO adminFaqVO) {
		delete("AdminFaqManage.deleteFaq", adminFaqVO);
	}

	public void deleteTagNm(AdminFaqVO adminFaqVO) {
		delete("AdminFaqManage.deleteTagNm", adminFaqVO);
	}

	public void insertTagNm(AdminFaqVO adminFaqVO) {
		insert("AdminFaqManage.insertTagNm", adminFaqVO);
	}

}
