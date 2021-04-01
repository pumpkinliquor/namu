package fbcms.user.spc.cti.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplDetailVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.cln.service.Impl.CenterVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.lgn.idFindVO;

/**
 * 센터정보를 처리하는 DAO 클래스
 */
@Repository("UserCTIDAO")
public class UserCTIDAO extends EgovComAbstractDAO {
	
	@SuppressWarnings("deprecation")
	public List<?> selectCTISBMList(AdminBoardVO adminBoardVO) {
		return list("UserCTIDAO.selectCTISBMList", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public String selectCTIDissListGroup(AdminBoardVO adminBoardVO) {
		return selectOne("UserCTIDAO.selectCTIDissListGroup", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectCTIClinicList(AdminBoardVO adminBoardVO) {
		return list("UserCTIDAO.selectCTIClinicList", adminBoardVO);
	}
	
	//클리닉명 조회
	public List<?> selectCLINM(CenterVO centerVO) {
		return list("UserCTIDAO.selectCLINM", centerVO);
	}
	
	// 클리닉 조회
	public CenterVO selectCLN(CenterVO centerVO) {
		return selectOne("UserCTIDAO.selectCLN", centerVO);
	}

	// 클리닉 템플릿 조회
	public List<CenterTemplVO> selectCLNTmpList(CenterVO centerVO) {
		return selectList("UserCTIDAO.selectCLNTmpList", centerVO);
	}

	// 클리닉 템플릿 상세 조회
	public List<CenterTemplDetailVO> selectCLNTmpDtilList(CenterVO centerVO) {
		return selectList("UserCTIDAO.selectCLNTmpDtilList", centerVO);
	}
	
	// 클리닉 질병코드 이름
	public String selectCodeNm(String dissCode) {
		return selectOne("UserCTIDAO.selectCodeNm", dissCode);
	}
	
	// 클리닉 질병코드
	public String selectCode(String dissNm) {
		return selectOne("UserCTIDAO.selectCode", dissNm);
	}
	
	// 클리닉 질병코드 리스트
	public ReservationVO selectDrInf(String drCode) {
		return selectOne("UserCTIDAO.selectDrInf", drCode);
	}

}
