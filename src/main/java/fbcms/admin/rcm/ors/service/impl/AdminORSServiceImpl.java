package fbcms.admin.rcm.ors.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.rcm.ors.service.AdminORSService;
import fbcms.user.cts.rsv.service.ReservationVO;

@Service("AdminORSService")
public class AdminORSServiceImpl extends EgovAbstractServiceImpl implements AdminORSService {
	@Autowired
	private AdminORSDAO adminORSDAO; 
	@Autowired
	private AdminOcsCTMDAO adminOcsCTMDAO;

	// 예약 리스트 Count
	@Override
	public int selectORSTotCnt(ReservationVO reservationVO) throws Exception {
		return adminORSDAO.selectORSTotCnt(reservationVO);
	}
	
	// 예약 리스트
	@Override
	public List<ReservationVO> selectORSList(ReservationVO reservationVO) throws Exception {
		
		List<ReservationVO> orsList = adminORSDAO.selectORSList(reservationVO);
		
		
		for(int i=0; i<orsList.size(); i++) {
			String MNG_CD = orsList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			orsList.get(i).setMEDI_SBJ_NM(NM);
		}
		
		return orsList;
	}
	
	// 예약 정보 상세
	@Override
	public ReservationVO selectORS(ReservationVO reservationVO) throws Exception {
		
		reservationVO = adminORSDAO.selectORS(reservationVO);
		String MNG_CD = reservationVO.getMEDI_SBJ_CD();
		
		String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
		reservationVO.setMEDI_SBJ_NM(NM);
		
		return reservationVO;
	}
	
	// 예약 등록
	@Override
	public int insertORS(ReservationVO reservationVO) throws Exception {
		return adminORSDAO.insertORS(reservationVO);
	}
	
	// 예약 정보 수정
	@Override
	public int updateORS(ReservationVO reservationVO) throws Exception {
		return adminORSDAO.updateORS(reservationVO);
	}

	// 예약상태 정보 수정
	@Override
	public int updateAppoStat(ReservationVO reservationVO) throws Exception {
		return adminORSDAO.updateAppoStat(reservationVO);
	}
	
	// 예약 정보 삭제
	@Override
	public int deleteORS(ReservationVO reservationVO) throws Exception {
		return adminORSDAO.deleteORS(reservationVO);
	}
	
	// Selectbox 변경 이벤트 ajax 처리
	@Override
	public List<ReservationVO> selectboxChangedAndGetDR(String MEDI_SBJ_CD) {
		return adminORSDAO.selectboxChangedAndGetDR(MEDI_SBJ_CD);
	}
}
