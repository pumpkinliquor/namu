package fbcms.admin.hpm.sbm.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("adminOcsSBMDAO")
public class adminOcsSBMDAO extends EgovComAbstractDAO {

	@Resource(name="egov.sqlSessionOCS")
	public void setSqlSessionFactory(SqlSessionFactory sqlSession) {
		super.setSqlSessionFactory(sqlSession);
	}

	public List selectOcsSBMList(SubjectVO subjectVO) {
		return selectList("adminOcsSBMDAO.selectOCSSBMList",subjectVO);
	}
}
