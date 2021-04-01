package fbcms.admin.mbm.dur.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.drop.DropMemberVO;


/**
 * Admin 탈퇴회원정보 관리 DAO
 * @author 박원준
 * @since 2020.10.26
 */
@Repository("AdminDURDAO")
public class AdminDURDAO extends EgovComAbstractDAO {
	// 탈퇴 회원 정보 리스트
	public List<DropMemberVO> selectDURList(DropMemberVO dropmemberVO) {
		return selectList("AdminDURDAO.selectDropMemberList", dropmemberVO);
	}

	// 탈퇴 회원 카운트
	public int selectMemberListTotCnt(DropMemberVO dropmemberVO) {
		return selectOne("AdminDURDAO.selectDropMemberTotCnt", dropmemberVO);
	}
}
