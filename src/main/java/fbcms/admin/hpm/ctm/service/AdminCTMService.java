package fbcms.admin.hpm.ctm.service;

import java.util.List;

import fbcms.admin.hpm.ctm.service.Impl.CenterTemplDetailVO;
import fbcms.admin.hpm.ctm.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.ctm.service.Impl.CenterVO;

/**
 * 특화 센터관리 서비스 
 * @author 김명진
 * @since 2020.10.20
 */
public interface AdminCTMService {
	/**
	 * Ocs 특화센터리스트
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public List selectOcsCTMList(CenterVO centerVO) throws Exception;
	
	/**
	 * 특화센터 템플릿 타입
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public CenterVO selectCTMTmpType(CenterVO centerVO) throws Exception;
	
	/**
	 * 특화센터 수정
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public int updateCTM(CenterVO centerVO, CenterTemplVO centerTemplVO, CenterTemplDetailVO centerTemplDetailVO) throws Exception;
	
	/**
	 * 특화센터 상세
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public CenterVO selectCTM(CenterVO centerVO) throws Exception;
}
