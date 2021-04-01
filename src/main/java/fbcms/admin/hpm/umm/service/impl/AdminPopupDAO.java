package fbcms.admin.hpm.umm.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.umm.service.AdminPopup;
import fbcms.admin.hpm.umm.service.AdminPopupVO;

import org.springframework.stereotype.Repository;

/**
 * 팝업창에 대한 DAO를 정의한다.
 */
@Repository("AdminPopupDAO")
public class AdminPopupDAO extends EgovComAbstractDAO {
	
	/**
	 * 기 등록된 팝업창정보를 삭제한다.
	 */
	public void deletePopup(AdminPopup adminPopup) throws Exception {
		delete("AdminPopup.deletePopup", adminPopup);
	}
	
	/**
	 * 팝업창정보를 신규로 등록한다.
	 */
	public void insertPopup(AdminPopup adminPopup) throws Exception {
		insert("AdminPopup.insertPopup", adminPopup);
	}
	
	/**
	 * 기 등록된 팝업창정보를 수정한다.
	 */
	public void updatePopup(AdminPopup adminPopup) throws Exception {
		update("AdminPopup.updatePopup", adminPopup);
	}

	/**
	 * 팝업창을 사용자 화면에서 볼수 있는 정보들을 조회한다.
	 */
	public AdminPopupVO selectPopupDetail(AdminPopup adminPopup) throws Exception {
		return (AdminPopupVO)selectOne("AdminPopup.selectPopupDetail", adminPopup);
	}

	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창 화이트리스트를 조회한다.
	 */
	public List<?> selectPopupWhiteList() throws Exception {
		return selectList("AdminPopup.selectPopupWhiteList");
	}
	
	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록을 조회한다.
	 */
	public List<?> selectPopupList(AdminPopupVO adminPopupVO) throws Exception {
		return selectList("AdminPopup.selectPopupList", adminPopupVO);
	}

	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록 총갯수를 조회한다.
	 */
	public int selectPopupListCnt(AdminPopupVO adminPopupVO) throws Exception {
		return (Integer)selectOne("AdminPopup.selectPopupListCnt", adminPopupVO);
	}

	/**
	 * 팝업창를 사용하기 위해 등록된 팝업창목록을 조회한다.
	 */
	public List<?> selectMainPopupList(AdminPopupVO adminPopupVO) throws Exception {
		return selectList("AdminPopup.selectMainPopupList", adminPopupVO);
	}
}