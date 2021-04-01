package fbcms.admin.sym.mcm.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 메뉴관리에 관한 서비스 인터페이스 클래스를 정의한다.
 */
public interface AdminMenuCreateManageService {

	/**
	 * ID 존재여부를 조회
	 */
	int selectUsrByPk(ComDefaultVO vo) throws Exception;

	/**
	 * ID에 대한 권한코드를 조회
	 */
	AdminMenuCreateVO selectAuthorByUsr(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴생성관리 목록을 조회
	 */
	List<?> selectMenuCreateManageList(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴생성관리 총건수를 조회한다.
	 */
	int selectMenuCreateManageTotCnt(ComDefaultVO vo) throws Exception;

	/**
	 * 메뉴생성 내역을 조회
	 */
	List<?> selectMenuCreateList(AdminMenuCreateVO vo) throws Exception;

	/**
	 * 화면에 조회된 메뉴정보로 메뉴생성내역 데이터베이스에서 입력
	 */
	void insertMenuCreateList(String checkedScrtyForInsert, String checkedMenuNoForInsert) throws Exception;
}
