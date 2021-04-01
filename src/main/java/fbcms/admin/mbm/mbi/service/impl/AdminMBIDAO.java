package fbcms.admin.mbm.mbi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.lgn.MemberVO;
import fbcms.user.lgn.MembersVO;

/**
 * Admin 회원정보 관리 DAO
 * @author 김명진
 * @since 2020.10.07
 */
@Repository("AdminMBIDAO")
public class AdminMBIDAO extends EgovComAbstractDAO {
	//
	public List<MembersVO> selectMemberList(MembersVO membersVO) {
		return selectList("AdminMBIDAO.selectMemberList",membersVO);
	}

	public int selectMemberListTotCnt(MembersVO membersVO) {
		return selectOne("AdminMBIDAO.selectMemberTotCnt",membersVO);
	}

	public MembersVO selectMember(MembersVO membersVO) {
		return selectOne("AdminMBIDAO.selectMember",membersVO);
	}

	public int insertMember(MembersVO membersVO) {
		int result = 0;
		if ((int) insert("AdminMBIDAO.insertMember",membersVO) > 0) {
			result = (int)insert("AdminMBIDAO.insertMemberAuth",membersVO);
		}
		return result;
	}

	public int updateMember(MembersVO membersVO) {
		return update("AdminMBIDAO.updateMember",membersVO);
	}

	public int deleteMember(MembersVO membersVO) {
		return delete("AdminMBIDAO.deleteMember",membersVO);
	}
	
	public int idDupChk(String membersVO) {
		int result = selectOne("AdminMBIDAO.idDupChk", membersVO);
		return result;
		
	}

	public int updateResetPw(MembersVO membersVO) {
		return update("AdminMBIDAO.updateResetPw", membersVO);
	}

}
