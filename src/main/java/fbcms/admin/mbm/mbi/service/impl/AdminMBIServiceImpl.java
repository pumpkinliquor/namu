package fbcms.admin.mbm.mbi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.mbm.mbi.service.AdminMBIService;
import fbcms.user.lgn.MemberVO;
import fbcms.user.lgn.MembersVO;
@Service("AdminMBIService")
public class AdminMBIServiceImpl extends EgovAbstractServiceImpl implements AdminMBIService {
	
	@Autowired
	private AdminMBIDAO adminMBIDAO;
	
	@Override
	public List<MembersVO> selectMemberList(MembersVO membersVO) throws Exception {
		return (List<MembersVO>)adminMBIDAO.selectMemberList(membersVO);
	}

	@Override
	public MembersVO selectMember(MembersVO membersVO) throws Exception {

		return (MembersVO)adminMBIDAO.selectMember(membersVO);
	}

	@Override
	public int updateMember(MembersVO membersVO) throws Exception {

		return adminMBIDAO.updateMember(membersVO);
	}

	@Override
	public int insertMember(MembersVO membersVO) throws Exception {
		return adminMBIDAO.insertMember(membersVO);
	}

	@Override
	public int deleteMember(MembersVO membersVO) throws Exception {
		return adminMBIDAO.deleteMember(membersVO);
	}

	@Override
	public int selectMemberListTotCnt(MembersVO membersVO) {
		return adminMBIDAO.selectMemberListTotCnt(membersVO);
	}

	@Override
	public int idDupChk(String USER_ID) throws Exception {
		return 	adminMBIDAO.idDupChk(USER_ID);
	}

	@Override
	public int updateResetPw(MembersVO membersVO) throws Exception {
		return adminMBIDAO.updateResetPw(membersVO);
	}

}
