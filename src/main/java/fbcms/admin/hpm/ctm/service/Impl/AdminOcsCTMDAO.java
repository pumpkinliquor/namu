package fbcms.admin.hpm.ctm.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;

@Repository("AdminOcsCTMDAO")
public class AdminOcsCTMDAO extends EgovComAbstractDAO {
	@Resource(name="egov.sqlSessionOCS")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
	
	/**
	 * Ocs 센터 리스트
	 * @param centerVO
	 * @return
	 */
	public List selectOcsCTMList(CenterVO centerVO) {
		return selectList("AdminOcsCTMDAO.selectOcsCTMList", centerVO);
	}
	
	/**
	 * Ocs 진료과 이름 
	 * @param centerVO
	 * @return
	 */
	public String selectDPTName(String MNG_CD) {
		return selectOne("AdminOcsCTMDAO.selectDPTName", MNG_CD);
	}
}
