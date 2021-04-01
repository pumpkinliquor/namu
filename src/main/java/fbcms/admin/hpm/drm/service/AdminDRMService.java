package fbcms.admin.hpm.drm.service;

import java.util.List;

import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;

public interface AdminDRMService {
	/**
	 * 의료진 리스트
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public List<DoctorVO> selectDRMList(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 리스트 팝업
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public List<DoctorVO> selectDRMListPopup(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 상세
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public DoctorVO selectDRM(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 등록
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public int insertDRM(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 수정
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public int updateDRM(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 삭제
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public int deleteDRM(DoctorVO doctorVO) throws Exception;
	
	/**
	 * 의료진 수
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	public int selectDRMTotCnt(DoctorVO doctorVO) throws Exception;
	
	/**
	 * OCS 의사 리스트
	 * @return
	 * @throws Exception
	 */
	public List selectOcsDrList(DoctorVO doctorVO) throws Exception;
	
	/**
	 * OCS 센터 리스트
	 * @return
	 * @throws Exception
	 */
	public List selectOcsCtList() throws Exception;
	
	/**
	 * 진료시간표 관리 메인화면 조회
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public List selectTMMMainList(DoctorTimeTableVO doctorTimeTableVO) throws Exception;

	/**
	 * 진료시간표 관리 상세화면 조회
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public DoctorTimeTableVO selectTMMView(DoctorTimeTableVO doctorTimeTableVO) throws Exception;

	/**
	 * 의료진 순서 변경
	 * @param newVO
	 * @throws Exception
	 */
	public int updateOrderDRM(DoctorVO newVO)throws Exception;
	
	/**
	 * 의료진 시간표 변경
	 * @param vo
	 * @throws Exception
	 */
	public int updateTMM(DoctorTimeTableVO vo) throws Exception;
	
	/**
	 * 진료시간표 관리 오전 오후 진료시간 저장
	 * @param doctorTimeTableVO
	 * @throws Exception
	 */
	public int updateAMPM(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	
	/**
	 * 의료진 진료 시간표 리스트
	 * @param doctorTimeTableVO
	 * @return
	 * @throws Exception
	 */
	public List selectTMMList(DoctorTimeTableVO doctorTimeTableVO) throws Exception;
	
}
