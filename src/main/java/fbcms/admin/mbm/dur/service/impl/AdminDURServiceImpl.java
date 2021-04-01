package fbcms.admin.mbm.dur.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.mbm.dur.service.AdminDURService;
import fbcms.user.drop.DropMemberVO;

@Service("AdminDURService")
public class AdminDURServiceImpl extends EgovAbstractServiceImpl implements AdminDURService {
	@Autowired
	private AdminDURDAO adminDURDAO;
		
	// 탈퇴 회원 정보 리스트
	@Override
	public List<DropMemberVO> selectDURList(DropMemberVO dropmemberVO) throws Exception {
		return adminDURDAO.selectDURList(dropmemberVO);
	}
	
	// 탈퇴 회원 카운트
	@Override
	public int selectMemberListTotCnt(DropMemberVO dropmemberVO) {
		return adminDURDAO.selectMemberListTotCnt(dropmemberVO);
	}
}
