package fbcms.admin.hpm.drm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;

@Repository("AdminOcsDrDAO")
public class AdminOcsDrDAO extends EgovComAbstractDAO
{
	@Resource(name="egov.sqlSessionOCS")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}
	
	public List selectDRList(DoctorVO doctorVO) {
		return selectList("AdminOcsDrDAO.selectDRList", doctorVO);
	}
	public List selectCtList() {
		return selectList("AdminOcsDrDAO.selectCTList");
	}
	
}
