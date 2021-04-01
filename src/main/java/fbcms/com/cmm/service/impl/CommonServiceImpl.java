package fbcms.com.cmm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.com.cmm.service.CommonCodeVO;
import fbcms.com.cmm.service.CommonService;

/**
 * 공통 서비스 클래스
 * @author 김명진
 * @since 2020.10.14
 */
@Service("CommonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {
	@Autowired
	private CommonDAO commonDAO;
	
	/**
	 * 공통코드 리스트 조회
	 * @param commonCode
	 * @return List(CommonCodeVO)
	 * @throws Exception
	 */
	@Override
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO commonCodeVO) throws Exception {
		return commonDAO.selectCommonCodeList(commonCodeVO);
	}
	/**
	 * 공통코드 등록(있으면 수정)
	 * @param commonCodeVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public int insertCommonCode(CommonCodeVO commonCodeVO) throws Exception {
		return commonDAO.insertCommonCode(commonCodeVO);
	}
	/**
	 * 공통상세 등록
	 * @param commonCodeVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public int insertCommonCodeDetail(CommonCodeVO commonCodeVO) throws Exception {
		return commonDAO.insertCommonCodeDetail(commonCodeVO);
	}
	/**
	 * 공통코드 조회
	 */
	public CommonCodeVO selectCommonCode(CommonCodeVO commonCodeVO) throws Exception  {
		return commonDAO.selectCommonCode(commonCodeVO);
	}

}
