package fbcms.com.cmm.mod.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.drop.DropMemberVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.lgn.MembersVO;

/**
 * User 정보 관리 DAO
 * @author 이민재
 * @since 2020.10.30
 */

@Repository("userMBIDAO")
public class UserMBIDAO extends EgovComAbstractDAO{
	
	/*멤버 정보 조회*/
	public MembersVO selectMember(MembersVO membersVO) {
		return selectOne("userMBIDAO.selectMember", membersVO);
	}
	
	/*비밀번호 체크*/
	public int passwordChk(String membersVO) {
		int result = selectOne("userMBIDAO.passwordChk", membersVO);
		return result;
	}
	
	/*SNS 연동 여부(구글)*/
	public MembersVO snsGoogle(MembersVO membersVO) {
		return selectOne("userMBIDAO.snsGoogle", membersVO);
	}
	
	/*SNS 연동 여부(네이버)*/
	public MembersVO snsNaver(MembersVO membersVO) {
		return selectOne("userMBIDAO.snsNaver", membersVO);
	}
	
	/*SNS 연동 여부(카카오)*/
	public MembersVO snsKakao(MembersVO membersVO) {
		return selectOne("userMBIDAO.snsKakao", membersVO);
	}
	
	/*멤버 정보 수정*/
	public int updateMBI(MembersVO membersVO) {
		return update("userMBIDAO.updateMBI", membersVO);
	}
	
	public int updateGoogle(MembersVO membersVO) {
		return update("userMBIDAO.updateGoogle", membersVO);
	}
	
	public int updateNaver(MembersVO membersVO) {
		return update("userMBIDAO.updateNaver", membersVO);
	}
	
	public int updateKakao(MembersVO membersVO) {
		return update("userMBIDAO.updateKakao", membersVO);
	}
	
	public int dropMember(DropMemberVO dropMemberVO) {
		return insert("userMBIDAO.dropMember", dropMemberVO);
	}
	
	public int deleteMember(MembersVO membersVO) {
		return insert("userMBIDAO.deleteMember", membersVO);
	}
	/**
	 * 예약 리스트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO) {
		return selectList("userMBIDAO.selectResList", appointmentVO);
	}
	/**
	 * 검진예약 정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO) {
		return selectList("userMBIDAO.selectChkUpList", appointmentVO);
	}
	/**
	 * 상담 리스트 불러오기
	 * @param appointmentVO
	 * @return
	 */
	 public List<AdminBoardVO> selectArticleLists(AdminBoardVO adminBoardVO) {
		return selectList("userMBIDAO.selectArticleLists", adminBoardVO);
	 }
	 /**
	  * 좋아요한 의사 리스트 불러오기
	  * @param DoctorVO
	  * @return
	  */
	 public List<DoctorVO> selectLikedDr(DoctorVO doctorVO) {
		return selectList("userMBIDAO.selectLikedDr", doctorVO);
	 }
	 
	 public int deleteDrLike(favoritesDRVO fDrvo) {
		 return update("userMBIDAO.deleteDrLike", fDrvo);
	 }
	
	
}
