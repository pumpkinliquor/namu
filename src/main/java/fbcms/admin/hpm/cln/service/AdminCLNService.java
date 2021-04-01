package fbcms.admin.hpm.cln.service;

import java.util.List;

import fbcms.admin.hpm.cln.service.Impl.CenterVO;
/**
 * 클리닉 관리 서비스 
 * @author 김명진
 * @since 2020.10.21
 */
import fbcms.admin.hpm.cln.service.Impl.CodeDetailVO;
public interface AdminCLNService {
	/**
	 * 센터 리스트 조회
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public List<CenterVO> selectCLNCenterList(CenterVO centerVO) throws Exception;
	
	/**
	 * 클리닉 리스트 조회
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public List<CenterVO> selectCLNList(CenterVO centerVO) throws Exception;

	/**
	 * 클리닉 조회
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public CenterVO selectCLN(CenterVO centerVO) throws Exception;

	/**
	 * 클리닉 등록
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public int insertCLN(CenterVO centerVO) throws Exception;
	
	/**
	 * 클리닉 수정
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public int updateCLN(CenterVO centerVO) throws Exception;
	
	/**
	 * 클리닉 삭제
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCLN(CenterVO centerVO) throws Exception;
	
	/**
	 * 정렬 순서 수정
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrderChange(CenterVO centerVO) throws Exception;
	
	/**
	 * 질환 코드 리스트
	 */
	public List<?> selectDissCode();
	
	/**
	 * 의료진 리스트
	 */
	public List<?> selectDrList();
}
