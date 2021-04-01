package fbcms.com.cmm.service;

import java.util.List;

/**
 * 공통 서비스 클래스
 * @author 김명진
 * @since 2020.10.14
 */
public interface CommonService {
	/**
	 * 공통코드 리스트 조회
	 * @param commonCode
	 * @return List(CommonCodeVO)
	 * @throws Exception
	 */
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO commonCodeVO) throws Exception;
	/**
	 * 공통코드 등록(있으면 수정)
	 * @param commonCodeVO
	 * @return
	 * @throws Exception
	 */
	public int insertCommonCode(CommonCodeVO commonCodeVO) throws Exception;
	/**
	 * 공통상세 등록
	 * @param commonCodeVO
	 * @return
	 * @throws Exception
	 */
	public int insertCommonCodeDetail(CommonCodeVO commonCodeVO) throws Exception;
	/**
	 * 공통코드 조회
	 * @param commonCodeVO
	 */
	public CommonCodeVO selectCommonCode(CommonCodeVO commonCodeVO) throws Exception ;
	
}
