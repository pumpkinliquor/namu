package fbcms.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.com.cmm.service.CommonCodeVO;

/**
 * 공통 서비스 클래스
 * @author 김명진
 * @since 2020.10.14
 */
@Repository("CommonDAO")
public class CommonDAO extends EgovComAbstractDAO{
	/**
	 * 공통코드 리스트 조회
	 * @param commonCode
	 * @return List(CommonCodeVO)
	 * @throws Exception
	 */
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO commonCodeVO) {
		return selectList("CommonDAO.selectCommonCodeList", commonCodeVO);
	}

	public int insertCommonCode(CommonCodeVO commonCodeVO) {
		return insert("CommonDAO.insertCommon",commonCodeVO);
	}

	public int insertCommonCodeDetail(CommonCodeVO commonCodeVO) {
		return insert("CommonDAO.insertCommonDetail",commonCodeVO);
	}

	public CommonCodeVO selectCommonCode(CommonCodeVO commonCodeVO) {
		return selectOne("CommonDAO.selectCommonCode",commonCodeVO);
	}

}
