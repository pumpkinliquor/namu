package fbcms.admin.sym.prm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.sym.prm.service.AdminProgrmManageVO;

import org.springframework.stereotype.Repository;
/**
 * 프로그램 목록관리및 프로그램변경관리에 대한 DAO 클래스를 정의한다.
 */

@Repository("AdminProgrmManageDAO")
public class AdminProgrmManageDAO extends EgovComAbstractDAO {

	/**
	 * 프로그램 목록을 조회
	 */
	public List<?> selectProgrmList(ComDefaultVO vo) throws Exception {
		return selectList("AdminProgrmManage.selectProgrmList", vo);
	}

    /**
	 * 프로그램목록 총건수를 조회한다.
	 */
    public int selectProgrmListTotCnt(ComDefaultVO vo) {
        return (Integer)selectOne("AdminProgrmManage.selectProgrmListTotCnt", vo);
    }

	/**
	 * 프로그램 기본정보를 조회
	 */
	public AdminProgrmManageVO selectProgrmDetail(AdminProgrmManageVO vo)throws Exception {
		return (AdminProgrmManageVO)selectOne("AdminProgrmManage.selectProgrmDetail", vo);
	}

	/**
	 * 프로그램 상세 URL 목록을 조회
	 */
	public List<?> selectProgrmDetailUrlList(AdminProgrmManageVO vo) throws Exception {
		return selectList("AdminProgrmManage.selectProgrmDetailUrlList", vo);
	}

	/**
	 * 프로그램 기본정보를 등록
	 */
	public void insertProgrm(AdminProgrmManageVO vo) {
		insert("AdminProgrmManage.insertProgrm", vo);
	}

	/**
	 * 프로그램 기본정보를 수정
	 */
	public void updateProgrm(AdminProgrmManageVO vo) {
		update("AdminProgrmManage.updateProgrm", vo);
	}

	/**
	 * 프로그램 기본정보를 삭제
	 */
	public void deleteProgrm(AdminProgrmManageVO vo) {
		delete("AdminProgrmManage.deleteProgrm", vo);
	}

	/**
	 * 프로그램 상세 URL을 삭제
	 */
	public void deleteProgrmDetailUrl(AdminProgrmManageVO vo) {
		delete("AdminProgrmManage.deleteProgrmDetailUrl", vo);
	}

	/**
	 * 프로그램 상세 URL을 등록
	 */
	public void insertProgrmDetailUrl(AdminProgrmManageVO vo) {
		insert("AdminProgrmManage.insertProgrmDetailUrl", vo);
	}

	/**
	 * 프로그램 파일 존재여부를 조회
	 */
	public int selectProgrmNMTotCnt(ComDefaultVO vo) throws Exception {
		return (Integer)selectOne("AdminProgrmManage.selectProgrmNMTotCnt", vo);
	}
}