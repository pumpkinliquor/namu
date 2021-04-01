package fbcms.admin.hpm.sbm.service;

import java.util.List;

import fbcms.admin.hpm.sbm.service.Impl.RelationCenterVO;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;

/**
 * 진료과 관리 서비스
 * @author 김명진
 * @since 2020.10.14
 */
public interface AdminSBMService {
	/**
	 * 진료과(OCS) 리스트
	 * @return
	 * @throws Exception
	 */
	public List selectOcsSBMList(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 진료과 리스트
	 * @return
	 * @throws Exception
	 */
	public List selectSBMList(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 진료과 수정상세
	 * @return
	 * @throws Exception
	 */
	public SubjectVO selectSBM(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 진료과 삭제
	 * @param subjectVO
	 * @return
	 * @throws Exception
	 */
	public int deleteSBM(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 진료과 수정
	 * @param subjectVO
	 * @return
	 * @throws Exception
	 */
	public int updateSBM(SubjectVO subjectVO) throws Exception;

	/**
	 * 신규 진료과 공통코드 저장
	 * @param subjectVO
	 * @return
	 * @throws Exception
	 */
	public int updateMngCd(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 진료과 수정 관련센터 삭제
	 * @param subjectVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRelationCenter(RelationCenterVO relationCenterVO) throws Exception;
	
	/**
	 * 진료과 수정 관련센터 저장
	 * @param subjectVO
	 * @return
	 * @throws Exception
	 */
	public int updateRelationCenter(RelationCenterVO relationCenterVO) throws Exception;
	/**
	 * 특화센터 리스트
	 * @param adminCmmCodeVO
	 * @return
	 */
	public List selectAllCenter() throws Exception;

	public List<?> selectSBMDissListAll();
	
	public List<?> selectSBMDissList(SubjectVO subjectVO);
	
	public List<String> selectSBMDissCodeList(SubjectVO subjectVO);
}
