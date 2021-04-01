package fbcms.admin.sym.umt.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.sym.umt.service.AdminAdminDefaultVO;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

import org.springframework.stereotype.Repository;

/**
 * 관리자관리에 관한 데이터 접근 클래스를 정의한다.
 */
@Repository("AdminAdminManageDAO")
public class AdminAdminManageDAO extends EgovComAbstractDAO {

    /**
     * 기 등록된 특정 관리자의 정보를 데이터베이스에서 읽어와 화면에 출력
     */
    public List<?> selectAdminList(AdminAdminDefaultVO searchVO) {
        return list("AdminManage.selectAdminList", searchVO);
    }

    /**
     * 관리자총 갯수를 조회한다.
     */
    public int selectAdminListTotCnt(AdminAdminDefaultVO searchVO) {
        return (Integer)selectOne("AdminManage.selectAdminListTotCnt", searchVO);
    }

    /**
     * 기 등록된 관리자 중 검색조건에 맞는 관리자들의 정보를 데이터베이스에서 읽어와 화면에 출력
     */
    public AdminAdminManageVO selectAdminDetail(String uniqId) {
        return (AdminAdminManageVO) selectOne("AdminManage.selectAdminDetail", uniqId);
    }

    /**
     * 관리자의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     */
    public String insertAdmin(AdminAdminManageVO adminManageVO) {
    	// 2021.01.07 uniqId 중복값 처리 (관리자+고유번호 통합 후 처리 안되어있음)
    	adminManageVO.setUniqId(selectOne("AdminManage.selectUniqId"));
    	insert("AdminManage.insertAuthorAdmin", adminManageVO);
        return String.valueOf((int)insert("AdminManage.insertAdmin", adminManageVO));
    }

    /**
     * 화면에 조회된 관리자의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     */
    public void updateAdmin(AdminAdminManageVO adminManageVO) {
        update("AdminManage.updateAdmin",adminManageVO);
    }

    /**
     * 화면에 조회된 관리자의 정보를 데이터베이스에서 삭제
     */
    public void deleteAdmin(String delId) {
        delete("AdminManage.deleteAdmin", delId);
        delete("AdminMenuManage.deleteAdminMenu", delId);
    }

    /**
     * 입력한 관리자아이디의 중복여부를 체크하여 사용가능여부를 확인
     */
    public int checkIdDplct(String checkId) {
        return (Integer)selectOne("AdminManage.checkIdDplct", checkId);
    }

    /**
     * 업무관리자 암호수정
     */
    public void updatePassword(AdminAdminManageVO passVO) {
        update("AdminManage.updatePassword", passVO);
    }

    /**
     * 업무관리자가 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     */
    public AdminAdminManageVO selectPassword(AdminAdminManageVO adminManageVO) {
    	return (AdminAdminManageVO) selectOne("AdminManage.selectPassword", adminManageVO);
    }
    
    /**
     * 로그인인증제한 해제
     */
    public void updateLockIncorrect(AdminAdminManageVO adminManageVO) {
        update("AdminManage.updateLockIncorrect", adminManageVO);
    }

}