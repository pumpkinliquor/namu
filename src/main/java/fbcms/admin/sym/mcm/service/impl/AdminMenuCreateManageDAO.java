package fbcms.admin.sym.mcm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.sym.mcm.service.AdminMenuCreateVO;

import org.springframework.stereotype.Repository;

/**
 * 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다. *
 */
@Repository("AdminMenuCreateManageDAO")
public class AdminMenuCreateManageDAO extends EgovComAbstractDAO {
	
	/**
	 * ID 존재여부를 조회
	 */
	public int selectUsrByPk(ComDefaultVO vo) throws Exception {
		return (Integer)selectOne("AdminMenuCreateManage.selectUsrByPk", vo);
	}

	/**
	 * ID에 대한 권한코드를 조회
	 */
	public AdminMenuCreateVO selectAuthorByUsr(ComDefaultVO vo) throws Exception {
		return (AdminMenuCreateVO)selectOne("AdminMenuCreateManage.selectAuthorByUsr", vo);
	}

	/**
	 * 메뉴생성관리 내역을 조회
	 */
	public List<?> selectMenuCreateManageList(ComDefaultVO vo) throws Exception {
		return selectList("AdminMenuCreateManage.selectMenuCreateManageList", vo);
	}

	/**
	 * 메뉴생성관리 총건수를 조회한다.
	 */
    public int selectMenuCreateManageTotCnt(ComDefaultVO vo) {
        return (Integer)selectOne("AdminMenuCreateManage.selectMenuCreateManageTotCnt", vo);
    }

	/**
	 * 메뉴생성 내역을 조회
	 */
	public List<?> selectMenuCreateList(AdminMenuCreateVO vo) throws Exception {
		return selectList("AdminMenuCreateManage.selectMenuCreateList", vo);
	}

	/**
	 * 메뉴생성내역 등록
	 */
	public void insertMenuCreate(AdminMenuCreateVO vo) {
		insert("AdminMenuCreateManage.insertMenuCreate", vo);
	}

	/**
	 * 메뉴생성내역 존재여부 조회한다.
	 */
    public int selectMenuCreateCnt(AdminMenuCreateVO vo) {
        return (Integer)selectOne("AdminMenuCreateManage.selectMenuCreateCnt", vo);
    }

	/**
	 * 메뉴생성내역 수정
	 */
	public void updateMenuCreate(AdminMenuCreateVO vo) {
		update("AdminMenuCreateManage.updateMenuCreate", vo);
	}

	/**
	 * 메뉴생성내역 삭제
	 */
	public void deleteMenuCreate(AdminMenuCreateVO vo) {
		delete("AdminMenuCreateManage.deleteMenuCreate", vo);
	}
}
