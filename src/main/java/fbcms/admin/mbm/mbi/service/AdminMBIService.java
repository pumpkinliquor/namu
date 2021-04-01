package fbcms.admin.mbm.mbi.service;

import java.util.List;

import fbcms.user.lgn.MemberVO;
import fbcms.user.lgn.MembersVO;
/**
 * Admin 회원 정보 관리 서비스 클래스
 * @author 김명진
 */
public interface AdminMBIService {
	/**
	 * 회원정보 리스트
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	public List<MembersVO> selectMemberList(MembersVO membersVO) throws Exception;
	/**
	 * 회원정보
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	public MembersVO selectMember(MembersVO membersVO) throws Exception;
	/**
	 * 회원 정보 수정
	 * @param membersVO
	 * @param currentId 
	 * @return
	 * @throws Exception
	 */
	public int updateMember(MembersVO membersVO) throws Exception;
	/**
	 * 신규 회원 생성
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	public int insertMember(MembersVO membersVO) throws Exception;
	/**
	 * 회원 탈퇴 (개인정보/예약정보등 삭제)
	 * @param membersVO
	 * @return
	 * @throws Exception
	 */
	public int deleteMember(MembersVO membersVO) throws Exception;
	/**
	 * 회원 total count
	 * @param membersVO
	 * @return
	 */
	public int selectMemberListTotCnt(MembersVO membersVO) throws Exception;
	/**
	 * 회원 리스트
	 * @param memberVO
	 * @return List(membersVO)
	 * @throws Exception
	 */
	public int idDupChk(String USER_ID) throws Exception;
	/**
	 * 비밀번호 초기화
	 * @param membersVO
	 * @throws
	 */
	public int updateResetPw(MembersVO membersVO) throws Exception;
	
}
