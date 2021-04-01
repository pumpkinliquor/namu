package fbcms.admin.hpm.umm.service.impl;

import java.util.List;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import fbcms.admin.hpm.umm.service.AdminPopup;
import fbcms.admin.hpm.umm.service.AdminPopupService;
import fbcms.admin.hpm.umm.service.AdminPopupVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 팝업창에 대한 ServiceImpl을 정의한다.
 */
@Service("AdminPopupService")
public class AdminPopupServiceImpl extends EgovAbstractServiceImpl implements AdminPopupService {
	
	@Resource(name = "AdminPopupDAO")
	public AdminPopupDAO adminPopupDAO;

	@Resource(name = "egovPopupManageIdGnrService")
	private EgovIdGnrService idgenService;
	
	
	/**
	 * 기 등록된 팝업창정보를 삭제한다.
	 */
	@Override
	public void deletePopup(AdminPopup adminPopup) throws Exception {
		adminPopupDAO.deletePopup(adminPopup);
	}
	
	/**
	 * 팝업창정보를 신규로 등록한다.
	 */
	@Override
	public void insertPopup(AdminPopup adminPopup) throws Exception {
		String sMakeId = idgenService.getNextStringId();
		adminPopup.setPopupId(sMakeId);
		adminPopupDAO.insertPopup(adminPopup);
	}
	
	/**
	 * 기 등록된 팝업창정보를 수정한다.
	 */
	@Override
	public void updatePopup(AdminPopup adminPopup) throws Exception {
		adminPopupDAO.updatePopup(adminPopup);
	}
	
	/**
	 * 팝업창을 사용자 화면에서 볼수 있는 정보들을 조회한다.
	 */
	@Override
	public AdminPopupVO selectPopupDetail(AdminPopup adminPopup) throws Exception {
		return adminPopupDAO.selectPopupDetail(adminPopup);
	}
	
	/**
	 * 팝업창의 취약점을 관리하기 위해 등록된 팝업창 화이트리스트를 조회한다.
	 */
	@Override
	public List<?> selectPopupWhiteList() throws Exception {
		return adminPopupDAO.selectPopupWhiteList();
	}
	
	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록을 조회한다.
	 */
	@Override
	public List<?> selectPopupList(AdminPopupVO adminPopupVO) throws Exception {
		return adminPopupDAO.selectPopupList(adminPopupVO);
	}
	
	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록을 조회한다.
	 */
	@Override
	public int selectPopupListCnt(AdminPopupVO adminPopupVO) throws Exception {
		return adminPopupDAO.selectPopupListCnt(adminPopupVO);
	}
	
	/**
	 * 팝업창를 사용하기위해 위해 등록된 팝업창목록을 조회한다.
	 */
	@Override
	public List<?> selectMainPopupList(AdminPopupVO adminPopupVO) throws Exception {
		return adminPopupDAO.selectMainPopupList(adminPopupVO);
	}
}