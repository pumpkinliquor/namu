package fbcms.admin.mbm.dur.service;

import java.util.List;

import fbcms.user.drop.DropMemberVO;

/**
 * Admin 탈퇴 회원 정보 서비스 클래스
 * @author 박원준
 */

public interface AdminDURService {
	/**
	 * 탈퇴 회원정보 리스트
	 * @param DropMemberVO
	 * @return
	 * @throws Exception
	 */
	public List<DropMemberVO> selectDURList(DropMemberVO dropmemberVO) throws Exception;
	
	/**
	 * 탈퇴 회원 카운트
	 * @param DropMemberVO
	 * @return
	 */
	public int selectMemberListTotCnt(DropMemberVO dropmemberVO);
}
