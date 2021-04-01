package fbcms.admin.hpm.ctm.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


/**
 * 센터관리
 * @author 김명진
 * 2020.10.14
 */
@Repository("AdminCTMDAO")
public class AdminCTMDAO extends EgovComAbstractDAO {
	/**
	 * HP_HOSPITAL_MNG 센터관리
	 * @param centerVO
	 * @return
	 */
	public int updateCTM(CenterVO centerVO) {
		return insert("AdminCTMDAO.updateCTM",centerVO);
	}
	/**
	 * HP_CODE_DTIL (MNG_CD: RMK_CT) 센터 템플릿
	 * @param centerVO
	 * @return
	 */
	public CenterVO selectCTMTmpType(CenterVO centerVO) {
		return selectOne("AdminCTMDAO.selectTmplateType",centerVO);
	}
	/**
	 * HP_MNG_TEMPL 관리 템플릿
	 * @param centerTemplVO
	 * @return
	 */
	public int updateCTMTmp(CenterTemplVO centerTemplVO) {
		return insert("AdminCTMDAO.updateCTMTmp", centerTemplVO);
	}
	/**
	 * HP_MNG_TEMPL_DTIL 관리 템플릿 상세
	 * @param centerTemplVO
	 * @return
	 */
	public int updateCTMTmpDetail(CenterTemplDetailVO centerTemplDetailVO) {
		return insert("AdminCTMDAO.updateCTMTmpDetail", centerTemplDetailVO);
	}
	
	/**
	 * HP_MNG_TEMPL 리스트
	 * @param centerTemplVO
	 * @return
	 */
	public List selectCTMTmpList(CenterTemplVO centerTemplVO) {
		return selectList("AdminCTMDAO.selectTmpList",centerTemplVO);
	}
	/**
	 * HP_MNG_TEMPL_DTIL 리스트
	 * @param centerTemplDetailVO
	 * @return
	 */
	public List selectCTMTmpDetailList(CenterTemplDetailVO centerTemplDetailVO) {
		return selectList("AdminCTMDAO.selectTmpDetailList",centerTemplDetailVO);
	}
	
	public CenterVO selectCTM(CenterVO centerVO) {
		return selectOne("AdminCTMDAO.selectCTM", centerVO);
	}
}
