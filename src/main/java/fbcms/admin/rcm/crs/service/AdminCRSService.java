package fbcms.admin.rcm.crs.service;

import java.util.List;

import fbcms.user.cts.rsv.service.ReservationVO;

/**
 * 외래예약관리 서비스 클래스
 * @author 김명진
 * @since 2020.10.11
 */
public interface AdminCRSService {
	/**
	 * 예약 리스트 총 수
	 * @param reservationVO
	 * @return Integer(예약 리스트 총 수)
	 * @throws Exception
	 */
	public int selectCRSTotCnt(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 리스트
	 * @param reservationVO
	 * @return List(ReservationVO)
	 * @throws Exception
	 */
	public List<ReservationVO> selectCRSList(ReservationVO reservationVO) throws Exception;

	/**
	 * 예약 정보 상세
	 * @param reservationVO
	 * @return reservationVO
	 * @throws Exception
	 */
	public ReservationVO selectCRS(ReservationVO reservationVO) throws Exception;

	/**
	 * 예약 등록
	 * @param reservationVO
	 * @return result => 1 성공
	 * @throws Exception
	 */
	public int insertCRS(ReservationVO reservationVO) throws Exception;
	
	/**
	 * 예약 정보 수정
	 * @param reservationVO
	 * @return
	 */
	public int updateCRS(ReservationVO reservationVO) throws Exception;

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
	public int deleteCRS(ReservationVO reservationVO) throws Exception;
}
