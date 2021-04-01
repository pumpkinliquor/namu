package fbcms.admin.sym.mpm.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

/**
 * 메뉴관리에 관한 서비스 인터페이스 클래스를 정의한다.
 */

public interface AdminMenuManageService {

	/**
	 * 메뉴 목록을 조회
	 */
	List<?> selectMenuManageList(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴목록 총건수를 조회한다.
	 */
	int selectMenuManageListTotCnt(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴 상세정보를 조회
	 */
	AdminMenuManageVO selectMenuManageDetail(AdminMenuManageVO vo) throws Exception;

	/**
	 * 메뉴번호 존재 여부를 조회한다.
	 */
	int selectMenuNoByPk(AdminMenuManageVO vo) throws Exception;

	int selectUpperMenuNoByPk(AdminMenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 등록
	 */
	void insertMenuManage(AdminMenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 수정
	 */
	void updateMenuManage(AdminMenuManageVO vo) throws Exception;

	/**
	 * 메뉴 정보를 삭제
	 */
	void deleteMenuManage(AdminMenuManageVO vo) throws Exception;

	/**
	 * 메뉴 목록을 조회
	 */
	List<?> selectMenuList() throws Exception;

	/**
	 * 관리자 메뉴 권한을 조회
	 */
	List<?> selectMenuListAuthCheckAll(AdminAdminManageVO adminAdminManageVO) throws Exception;

	/**
	 * 관리자 메뉴 권한을 등록
	 */
	void insertAdminMenu(AdminMenuManageVO adminMenuManageVO, String listAdminMenu) throws Exception;

	/**
	 * 관리자 메뉴 권한을 삭제
	 */
	void deleteAdminMenu(AdminMenuManageVO adminMenuManageVO) throws Exception;

	/**
	 * 공통 메뉴 gnb 조회
	 */
	List<HashMap<String, String>> selectMenuGnb(HashMap<String, String> hashMap) throws Exception;

	/**
	 * 공통 메뉴 lnb 조회
	 */
	List<HashMap<String, String>> selectMenuLnb(HashMap<String, String> hashMap) throws Exception;

	/**
	 * 공통 메뉴 현재메뉴 조회
	 */
	HashMap<String, String> selectCurrentMenu(HashMap<String, String> hashMap) throws Exception;
}