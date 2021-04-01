package fbcms.admin.rcm.ors.service;

import java.util.List;

import fbcms.user.cts.rsv.service.ReservationVO;

/**
 * 외래예약관리 서비스 클래스
 * @author 김명진
 * @since 2020.10.08
 */
public interface AdminORSService {
	
	/**
	 * 예약 리스트 Count
	 * @param reservationVO
	 * @return Integer(예약 리스트 총 수)
	 * @throws Exception
	 */
	public int selectORSTotCnt(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 리스트
	 * @param reservationVO
	 * @return List(ReservationVO)
	 * @throws Exception
	 */
	public List<ReservationVO> selectORSList(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 정보 상세
	 * @param reservationVO
	 * @return reservationVO
	 * @throws Exception
	 */
	public ReservationVO selectORS(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 등록
	 * @param reservationVO
	 * @return result => 1 성공
	 * @throws Exception
	 */
	public int insertORS(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 정보 수정
	 * @param reservationVO
	 * @return
	 */
	public int updateORS(ReservationVO reservationVO) throws Exception;

	/**
	 * 예약상태 정보 수정
	 * @param reservationVO
	 * @return
	 */
	public int updateAppoStat(ReservationVO reservationVO) throws Exception;

	/**
	 * 예약 정보 삭제
	 * @param reservationVO
	 * @return
	 */
	public int deleteORS(ReservationVO reservationVO) throws Exception;

	/**
	 * Selectbox 변경 이벤트 ajax 처리
	 * 
	 * @param MEDI_SBJ_CD
	 * @return
	 */
	public List<ReservationVO> selectboxChangedAndGetDR(String MEDI_SBJ_CD);
}
