package fbcms.admin.hpm.sbm.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * 진료과 DAO
 * @author 김명진
 * @since 2020-10-19
 */
@Repository("AdminSBMDAO")
public class AdminSBMDAO extends EgovComAbstractDAO {
	/**
	 * 진료과 리스트
	 * @param subjectVO
	 * @return
	 */
	public List selectSBMList(SubjectVO subjectVO) {
		return selectList("AdminSBMDAO.selectSBMList",subjectVO);
	}

	/**
	 * 진료과 상세
	 * @param subjectVO
	 * @return
	 */
	public SubjectVO selectSBM(SubjectVO subjectVO) {
		return selectOne("AdminSBMDAO.selectSBM", subjectVO);
	}
	
	/**
	 * 진료과 삭제
	 * @param subjectVO
	 * @return
	 */
	public int deleteSBM(SubjectVO subjectVO) {
		return insert("AdminSBMDAO.deleteSBM",subjectVO);
	}

	/**
	 * 진료과 수정
	 * @param subjectVO
	 * @return
	 */
	public int updateSBM(SubjectVO subjectVO) {
		if(subjectVO.getSEARCH_TAG_ARRAY() != null) {
			delete("AdminSBMDAO.deleteSBMTag",subjectVO);
			insert("AdminSBMDAO.insertSBMTag",subjectVO);
		}
		return insert("AdminSBMDAO.updateSBM",subjectVO);
	}

	/**
	 * 신규 진료과 공통코드 저장
	 * @param subjectVO
	 * @return
	 */
	public int updateMngCd(SubjectVO subjectVO) {
		return insert("AdminSBMDAO.updateMngCd",subjectVO);
	}
	
	/**
	 * 진료과 수정 관련센터 삭제
	 * @param relationCenterVO
	 * @return
	 */
	public int deleteRelationCenter(RelationCenterVO relationCenterVO) {
		return insert("AdminSBMDAO.deleteRelationCenter",relationCenterVO);
	}
	
	/**
	 * 진료과 수정 관련센터 저장
	 * @param relationCenterVO
	 * @return
	 */
	public int updateRelationCenter(RelationCenterVO relationCenterVO) {
		return insert("AdminSBMDAO.updateRelationCenter",relationCenterVO);
	}
	/**
	 * 특화센터 리스트
	 * @param adminCmmCodeVO
	 * @return
	 */
	public List selectAllCenter() {
		return selectList("AdminSBMDAO.selectAllCenter");
	}

	public List<?> selectSBMDissListAll() {
		return selectList("AdminSBMDAO.selectSBMDissListAll");
	}
	public List<?> selectSBMDissList(SubjectVO subjectVO) {
		return selectList("AdminSBMDAO.selectSBMDissList", subjectVO);
	}
	public List<String> selectSBMDissCodeList(SubjectVO subjectVO) {
		return selectList("AdminSBMDAO.selectSBMDissCodeList", subjectVO);
	}
}
