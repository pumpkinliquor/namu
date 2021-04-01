package fbcms.com.cmm.mod.service;

import java.util.List;

import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.user.cts.rsv.service.AppointmentVO;
import fbcms.user.drop.DropMemberVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.lgn.MembersVO;

public interface UserMBIService {
	/**
	 * 회원정보 리스트
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	public MembersVO selectMember(MembersVO membersVO) throws Exception;
	/**
	 * 아이디 중복 체크
	 * @param membersVO
	 * @throws
	 */
	public int passwordChk(String PASSWORD) throws Exception;
	/**
	 * SNS 구글 연동
	 * @param membersVO
	 * @throws
	 */
	public MembersVO snsGoogle(MembersVO membersVO) throws Exception;
	/**
	 * SNS 네이버 연동
	 * @param membersVO
	 * @throws
	 */
	public MembersVO snsNaver(MembersVO membersVO) throws Exception;
	/**
	 * SNS 카카오 연동
	 * @param membersVO
	 * @throws
	 */
	public MembersVO snsKakao(MembersVO membersVO) throws Exception;
	/**
	 * 멤버 정보 수정
	 * @param membersVO
	 * @return
	 */
	public int updateMBI(MembersVO membersVO) throws Exception;
	/**
	 * 연동 정보 수정 Naver
	 * @param membersVO
	 * @return
	 */
	public int updateNaver(MembersVO membersVO) throws Exception;
	/**
	 * 연동 정보 수정 Google
	 * @param membersVO
	 * @return
	 */
	public int updateGoogle(MembersVO membersVO) throws Exception;
	/**
	 * 연동 정보 수정 Kakao
	 * @param membersVO
	 * @return
	 */
	public int updateKakao(MembersVO membersVO) throws Exception;
	/**
	 * 유저 정보 삭제
	 * @param membersVO
	 * @return
	 */
	public int dropMember(DropMemberVO dropMemberVO) throws Exception;
	/**
	 * 유저 정보 삭제2
	 * @param membersVO
	 * @return
	 */
	public int deleteMember(MembersVO membersVO) throws Exception;
	/**
	 * 예약 리스트 가져오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectResList(AppointmentVO appointmentVO);
	/**
	 * 검진예약 정보 불러오기
	 * @param appointmentVO
	 * @return
	 */
	public List<AppointmentVO> selectChkUpList(AppointmentVO appointmentVO);
	/**
	 * 상담 리스트 불러오기
	 * @param adminBoardVO
	 * @return
	 */
	public List<AdminBoardVO> selectArticleLists(AdminBoardVO adminBoardVO);
	/**
	 * 의사 리스트 불러오기
	 * @param adminBoardVO
	 * @return
	 */
	public List<DoctorVO> selectLikedDr(DoctorVO doctorVO);
	/**
	 * 의사 좋아요 삭제
	 * @param adminBoardVO
	 * @return
	 */	
	public int deleteDrLike(favoritesDRVO fDrvo) throws Exception;
	
	
	
}
