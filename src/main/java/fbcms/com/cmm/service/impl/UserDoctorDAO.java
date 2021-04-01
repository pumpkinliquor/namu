package fbcms.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.com.cmm.service.CommonCodeVO;

/**
 * 사용자 의료진 클래스
 */
@Repository("UserDoctorDAO")
public class UserDoctorDAO extends EgovComAbstractDAO {
	
	
	/**
	 * 의료진 전체 리스트 조회
	 */
	public List<?> selectDoctorList() {
		return selectList("UserDoctorDAO.selectDoctorList");
	}
}
