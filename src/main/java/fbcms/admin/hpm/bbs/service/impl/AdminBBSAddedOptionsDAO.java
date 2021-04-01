package fbcms.admin.hpm.bbs.service.impl;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;

import org.springframework.stereotype.Repository;

/**
 * 2단계 기능 추가 (댓글관리, 만족도조사) 관리를 위한 데이터 접근 클래스
 */
@Repository("AdminBBSAddedOptionsDAO")
public class AdminBBSAddedOptionsDAO extends EgovComAbstractDAO {

    /**
     * 신규 게시판 추가기능 정보를 등록한다.
     * 
     * @param adminBoardMaster
     */
    public String insertAddedOptionsInf(AdminBoardMaster adminBoardMaster) throws Exception {
    	return Integer.toString(insert("AdminBBSAddedOptions.insertAddedOptionsInf", adminBoardMaster));
    }
    
    /**
     * 게시판 추가기능 정보 한 건을 상세조회 한다.
     * 
     * @param adminBoardMaster
     */
    public AdminBoardMasterVO selectAddedOptionsInf(AdminBoardMaster adminBoardMaster) throws Exception {
    	return (AdminBoardMasterVO)selectOne("AdminBBSAddedOptions.selectAddedOptionsInf", adminBoardMaster);
    }
    
    /**
     * 게시판 추가기능 정보를 수정한다.
     * 
     * @param adminBoardMaster
     */
    public void updateAddedOptionsInf(AdminBoardMaster adminBoardMaster) throws Exception {
    	update("AdminBBSAddedOptions.updateAddedOptionsInf", adminBoardMaster);
    }
}
