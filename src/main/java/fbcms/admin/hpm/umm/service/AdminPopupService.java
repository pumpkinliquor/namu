package fbcms.admin.hpm.umm.service;

import java.util.List;

/**
 * 팝업창에 대한 Service Interface를 정의한다.
 */
public interface AdminPopupService {
	
	/**
	 * 기 등록된 팝업창정보를 삭제한다.
	 */
	public void deletePopup(AdminPopup adminPopup) throws Exception;
	
	/**
	 * 팝업창정보를 신규로 등록한다.
	 */
	public void insertPopup(AdminPopup adminPopup) throws Exception;
	
	/**
	 * 기 등록된 팝업창정보를 수정한다.
	 */
	public void updatePopup(AdminPopup adminPopup) throws Exception;
	
	/**
	 * 팝업창을 사용자 화면에서 볼수 있는 정보들을 조회한다.
	 */
	public AdminPopupVO selectPopupDetail(AdminPopup adminPopup) throws Exception;
	
	/**
	 * 팝업창의 취약점을 관리하기 위해 등록된 팝업창 화이트리스트를 조회한다.
	 */
	public List<?> selectPopupWhiteList() throws Exception;
	
	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록을 조회한다.
	 */
	public List<?> selectPopupList(AdminPopupVO adminPopupVO) throws Exception;
	
	/**
	 * 팝업창를 관리하기 위해 등록된 팝업창목록을 조회한다.
	 */
	public int selectPopupListCnt(AdminPopupVO adminPopupVO) throws Exception;
	
	/**
	 * 팝업창을 사용하기 위해 팝업창목록을 조회한다.
	 */
	public List<?> selectMainPopupList(AdminPopupVO adminPopupVO) throws Exception;
}