package fbcms.admin.rcm.crs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.rcm.crs.service.AdminCRSService;
import fbcms.user.cts.rsv.service.ReservationVO;
@Service("AdminCRSService")
public class AdminCRSServiceImpl extends EgovAbstractServiceImpl implements AdminCRSService {
	@Autowired
	private AdminCRSDAO adminCRSDAO; 

	// 예약 리스트 Count
	@Override
	public int selectCRSTotCnt(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.selectCRSTotCnt(reservationVO);
	}
	
	// 예약 리스트
	@Override
	public List<ReservationVO> selectCRSList(ReservationVO reservationVO) throws Exception {
		// TODO Auto-generated method stub
		return adminCRSDAO.selectCRSList(reservationVO);
	}
	
	// 예약 정보 상세
	@Override
	public ReservationVO selectCRS(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.selectCRS(reservationVO);
	}
	
	// 예약 등록
	@Override
	public int insertCRS(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.insertCRS(reservationVO);
	}

	// 예약 정보 수정
	@Override
	public int updateCRS(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.updateCRS(reservationVO);
	}
	
	// 예약상태 정보 수정
	@Override
	public int updateAppoStat(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.updateAppoStat(reservationVO);
	}
	
	// 예약 정보 삭제
	@Override
	public int deleteCRS(ReservationVO reservationVO) throws Exception {
		return adminCRSDAO.deleteCRS(reservationVO);
	}
}
