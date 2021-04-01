package fbcms.com.cmm.mod.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.com.cmm.mod.service.UserMBIService;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.drop.DropMemberVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.lgn.MembersVO;
import fbcms.user.lgn.UserInterlockVO;

@Service("userMBIService")
public class UserMBIServiceImpl extends EgovAbstractServiceImpl implements UserMBIService{
	
	@Autowired 
	private UserMBIDAO userMBIDAO;
	@Autowired
	private AdminOcsCTMDAO adminOcsCTMDAO;
	
	@Override
	public MembersVO selectMember(MembersVO membersVO) throws Exception {
		return (MembersVO)userMBIDAO.selectMember(membersVO);
	}
	
	@Override
	public int passwordChk(String PASSWORD) throws Exception {
		return userMBIDAO.passwordChk(PASSWORD);
	}
	
	@Override
	public MembersVO snsGoogle(MembersVO membersVO) throws Exception {
		return (MembersVO)userMBIDAO.snsGoogle(membersVO);
	}

	@Override
	public MembersVO snsNaver(MembersVO membersVO) throws Exception {
		return (MembersVO)userMBIDAO.snsNaver(membersVO);
	}

	@Override
	public MembersVO snsKakao(MembersVO membersVO) throws Exception {
		return (MembersVO)userMBIDAO.snsKakao(membersVO);
	}

	@Override
	public int updateMBI(MembersVO membersVO) throws Exception {
		return userMBIDAO.updateMBI(membersVO);
	}

	@Override
	public int updateNaver(MembersVO membersVO) throws Exception {
		return userMBIDAO.updateNaver(membersVO);
	}

	@Override
	public int updateGoogle(MembersVO membersVO) throws Exception {
		return userMBIDAO.updateGoogle(membersVO);
	}

	@Override
	public int updateKakao(MembersVO membersVO) throws Exception {
		return userMBIDAO.updateKakao(membersVO);
	}

	@Override
	public int dropMember(DropMemberVO dropMemberVO) throws Exception {
		return userMBIDAO.dropMember(dropMemberVO);
	}
	
	@Override
	public int deleteMember(MembersVO membersVO) throws Exception {
		return userMBIDAO.deleteMember(membersVO);
	}
	/*검진예약 정보 불러오기*/
	@Override
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO) {
		return userMBIDAO.selectChkUpList(appointmentVO);
	}
	/*예약 리스트 가져오기*/
	@Override
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO) {
		
		List<AppointmentVO> resList = userMBIDAO.selectResList(appointmentVO);
		
		
		for(int i=0; i<resList.size(); i++) {
			String MNG_CD = resList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			resList.get(i).setMEDI_SBJ_NM(NM);
		}
		
		return resList;
	}
	
	@Override
	public List<AdminBoardVO> selectArticleLists(AdminBoardVO appointmentVO) {
		return userMBIDAO.selectArticleLists(appointmentVO);
	}
	
	@Override
	public int deleteDrLike(favoritesDRVO fDrvo) {
		return userMBIDAO.deleteDrLike(fDrvo);
	}

	@Override
	public List<DoctorVO> selectLikedDr(DoctorVO doctorVO) {
		return userMBIDAO.selectLikedDr(doctorVO);
	}
	
}
