package fbcms.admin.rcm.crs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.cts.rsv.service.ReservationVO;

@Repository("AdminCRSDAO")
public class AdminCRSDAO extends EgovComAbstractDAO{
	// 예약 리스트 Count
	public int selectCRSTotCnt(ReservationVO reservationVO) {
		return selectOne("AdminCRSDAO.selectCRSTotCnt", reservationVO);
	}

	// 예약 리스트
	public List<ReservationVO> selectCRSList(ReservationVO reservationVO) {
		return selectList("AdminCRSDAO.selectCRSList",reservationVO);
	}

	// 예약 정보 상세
	public ReservationVO selectCRS(ReservationVO reservationVO) {
		return selectOne("AdminCRSDAO.selectCRS",reservationVO);
	}

	// 예약 등록
	public int insertCRS(ReservationVO reservationVO) {
		return insert("AdminCRSDAO.insertCRS", reservationVO);
	}
	
	// 예약 정보 수정
	public int updateCRS(ReservationVO reservationVO) {
		return update("AdminCRSDAO.updateCRS",reservationVO);
	}

	// 예약상태 정보 수정
	public int updateAppoStat(ReservationVO reservationVO) {
		return update("AdminCRSDAO.updateAppoStat", reservationVO);
	}
	
	// 예약 정보 삭제
	public int deleteCRS(ReservationVO reservationVO) {
		return update("AdminCRSDAO.deleteCRS", reservationVO);
	}
}
