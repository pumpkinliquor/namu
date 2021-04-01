package fbcms.admin.sym.mpm.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.sym.mpm.service.AdminMenuManageVO;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

import org.springframework.stereotype.Repository;
/**
 * 메뉴관리, 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다.
 */

@Repository("AdminMenuManageDAO")
public class AdminMenuManageDAO extends EgovComAbstractDAO {
	
	/**
	 * 메뉴목록을 조회
	 */
	public List<?> selectMenuManageList(ComDefaultVO vo) throws Exception {
		return selectList("AdminMenuManage.selectMenuManageList", vo);
	}
	
    /**
	 * 메뉴목록관리 총건수를 조회한다.
	 */
    public int selectMenuManageListTotCnt(ComDefaultVO vo) {
        return (Integer)selectOne("AdminMenuManage.selectMenuManageListTotCnt", vo);
    }
    
	/**
	 * 메뉴목록관리 기본정보를 조회
	 */
	public AdminMenuManageVO selectMenuManageDetail(AdminMenuManageVO vo)throws Exception {
		return (AdminMenuManageVO)selectOne("AdminMenuManage.selectMenuManageDetail", vo);
	}
	
	/**
	 * 메뉴번호 존재여부를 조회
	 */
	public int selectMenuNoByPk(AdminMenuManageVO vo) throws Exception {
		return (Integer)selectOne("AdminMenuManage.selectMenuNoByPk", vo);
	}
	
	/**
	 * 메뉴번호를 상위메뉴로 참조하고 있는 메뉴 존재여부를 조회
	 */
	public int selectUpperMenuNoByPk(AdminMenuManageVO vo) throws Exception {
		return (Integer)selectOne("AdminMenuManage.selectUpperMenuNoByPk", vo);
	}
	
	/**
	 * 메뉴목록 기본정보를 등록
	 */
	public void insertMenuManage(AdminMenuManageVO vo) {
		insert("AdminMenuManage.insertMenuManage", vo);
	}
	
	/**
	 * 메뉴목록 기본정보를 수정
	 */
	public void updateMenuManage(AdminMenuManageVO vo) {
		update("AdminMenuManage.updateMenuManage", vo);
	}
	
	/**
	 * 메뉴목록 기본정보를 삭제
	 */
	public void deleteMenuManage(AdminMenuManageVO vo) {
		delete("AdminMenuManage.deleteMenuManage", vo);
	}

	/**
	 * 메뉴 전체목록을 조회
	 */
	public List<?> selectMenuList() throws Exception {
		ComDefaultVO vo  = new ComDefaultVO();
		return selectList("AdminMenuManage.selectMenuList", vo);
	}

	/**
	 * 관리자 메뉴 목록 권한을 조회
	 */
	public List<?> selectMenuListAuthCheckAll(AdminAdminManageVO adminAdminManageVO) throws Exception {
		return selectList("AdminMenuManage.selectMenuListAuthCheckAll", adminAdminManageVO);
	}
	
	/**
	 * 관리자 메뉴 권한을 등록
	 */
	public void insertAdminMenu(AdminMenuManageVO adminMenuManageVO) {
		insert("AdminMenuManage.insertAdminMenu", adminMenuManageVO);
	}
	
	/**
	 * 관리자 메뉴 권한을 삭제
	 */
	public void deleteAdminMenu(AdminMenuManageVO adminMenuManageVO) {
		delete("AdminMenuManage.deleteAdminMenu", adminMenuManageVO);
	}
    
	/**
	 * 공통 메뉴 gnb 조회
	 */
	public List<HashMap<String, String>> selectMenuGnb(HashMap<String, String> hashMap) throws Exception {
		return selectList("AdminCmmMenu.selectMenuGnb", hashMap);
	}
	
	/**
	 * 공통 메뉴 lnb 조회
	 */
	public List<HashMap<String, String>> selectMenuLnb(HashMap<String, String> hashMap) throws Exception {
		return selectList("AdminCmmMenu.selectMenuLnb", hashMap);
	}
	
	/**
	 * 공통 메뉴 현재메뉴 조회
	 */
	public HashMap<String, String> selectCurrentMenu(HashMap<String, String> hashMap) throws Exception {
		return selectOne("AdminCmmMenu.selectCurrentMenu", hashMap);
	}
}