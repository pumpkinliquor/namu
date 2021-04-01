package fbcms.admin.hpm.cln.service.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * 클리닉 관리
 * @author 김명진
 * 2020.10.21
 */
@Repository("AdminCLNDAO")
public class AdminCLNDAO extends EgovComAbstractDAO {
	// 센터 리스트 조회
	public List<CenterVO> selectCLNCenterList(CenterVO centerVO) {
		return selectList("AdminCLNDAO.selectCLNCenterList", centerVO);
	}
	
	// 클리닉 리스트 조회
	public List<CenterVO> selectCLNList(CenterVO centerVO) {
		return selectList("AdminCLNDAO.selectCLNList", centerVO);
	}

	// 클리닉 조회
	public CenterVO selectCLN(CenterVO centerVO) {
		return selectOne("AdminCLNDAO.selectCLN", centerVO);
	}

	// 클리닉 템플릿 조회
	public List<CenterTemplVO> selectCLNTmpList(CenterVO centerVO) {
		return selectList("AdminCLNDAO.selectCLNTmpList", centerVO);
	}

	// 클리닉 템플릿 상세 조회
	public List<CenterTemplDetailVO> selectCLNTmpDtilList(CenterVO centerVO) {
		return selectList("AdminCLNDAO.selectCLNTmpDtilList", centerVO);
	}

	// 클리닉 등록
	public int insertCLN(CenterVO centerVO) {
		if(centerVO.getMNG_SEQ() == null || centerVO.getMNG_SEQ().isEmpty()) {
			centerVO.setMNG_SEQ(selectOne("AdminCLNDAO.selectMngSeq", centerVO));
		}
		if(centerVO.getSEARCH_TAG_ARRAY() != null) {
			delete("AdminCLNDAO.dropCLNTag",centerVO);
			insert("AdminCLNDAO.insertCLNTag",centerVO);
		}
		return insert("AdminCLNDAO.insertCLN",centerVO);
	}
	
	// 클리닉 수정
	public int updateCLN(CenterVO centerVO) {
		if(centerVO.getSEARCH_TAG_ARRAY() != null) {
			delete("AdminCLNDAO.dropCLNTag",centerVO);
			insert("AdminCLNDAO.insertCLNTag",centerVO);
		}
		return insert("AdminCLNDAO.updateCLN",centerVO);
	}
	
	// 클리닉 템플릿 저장
	public int updateCLNTmp(CenterTemplVO centerTemplVO) {
		return insert("AdminCLNDAO.updateCLNTmp", centerTemplVO);
	}
	
	// 클리닉 템플릿 상세 저장
	public int updateCLNTmpDetail(CenterTemplDetailVO centerTemplDetailVO) {
		return insert("AdminCLNDAO.updateCLNTmpDetail", centerTemplDetailVO);
	}
	
	// 클리닉 삭제
	public int deleteCLN(CenterVO centerVO) {
		return update("AdminCLNDAO.deleteCLN", centerVO);
	}

	// 정렬 순서 저장
	public int updateOrderChange(CenterVO centerVO) {
		return update("AdminCLNDAO.updateOrderChange", centerVO);
	}
	
	// 질환 코드 리스트
	public List<?> selectDissCode() {
		return selectList("AdminCLNDAO.selectDissCode");
	}
	
	// 질환 코드 이름
	public String selectDissNm(String dissCode) {
		return selectOne("AdminCLNDAO.selectDissNm", dissCode);
	}
	
	// 클리닉 질환코드 리스트
	public String selectDrNm(String dissCode) {
		return selectOne("AdminCLNDAO.selectDrNm", dissCode);
	}
	
	// 의료진 리스트
	public List<?> selectDrList() {
		return selectList("AdminCLNDAO.selectDrList");
	}
}
