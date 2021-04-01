package fbcms.admin.rcm.ors.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.cts.rsv.service.ReservationVO;

@Repository("AdminORSDAO")
public class AdminORSDAO extends EgovComAbstractDAO{

	// 예약 리스트 Count
	public int selectORSTotCnt(ReservationVO reservationVO) {
		return selectOne("AdminORSDAO.selectORSTotCnt", reservationVO);
	}

	// 예약 리스트
	public List<ReservationVO> selectORSList(ReservationVO reservationVO) {
		return selectList("AdminORSDAO.selectORSList", reservationVO);
	}

	// 예약 정보 상세
	public ReservationVO selectORS(ReservationVO reservationVO) {
		return selectOne("AdminORSDAO.selectORS", reservationVO);
	}

	// 예약 등록
	public int insertORS(ReservationVO reservationVO) {
		return insert("AdminORSDAO.insertORS", reservationVO);
	}

	// 예약 정보 수정
	public int updateORS(ReservationVO reservationVO) {
		return update("AdminORSDAO.updateORS", reservationVO);
	}

	// 예약상태 정보 수정
	public int updateAppoStat(ReservationVO reservationVO) {
		return update("AdminORSDAO.updateAppoStat", reservationVO);
	}
	
	// 예약 정보 삭제
	public int deleteORS(ReservationVO reservationVO) {
		return update("AdminORSDAO.deleteORS", reservationVO);
	}
	
	// Selectbox 변경 이벤트 ajax 처리
	public List<ReservationVO> selectboxChangedAndGetDR(String MEDI_SBJ_CD) {
		return selectList("AdminORSDAO.selectboxChangedAndGetDR", MEDI_SBJ_CD);
	}
	
	
}
