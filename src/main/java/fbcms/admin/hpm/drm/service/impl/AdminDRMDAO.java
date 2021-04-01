package fbcms.admin.hpm.drm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminDRMDAO")
public class AdminDRMDAO extends EgovComAbstractDAO {
	// 의료진 리스트
	public List<DoctorVO> selectDRMList(DoctorVO doctorVO) {
		return selectList("AdminDRMDAO.selectDRMList",doctorVO);
	}
	// 의료진 리스트 팝업
	public List<DoctorVO> selectDRMListPopup(DoctorVO doctorVO) {
		return selectList("AdminDRMDAO.selectDRMListPopup",doctorVO);
	}

	public DoctorVO selectDRM(DoctorVO doctorVO) {
		return selectOne("AdminDRMDAO.selectDRM",doctorVO);
	}

	public int insertDRM(DoctorVO doctorVO) {
		//신규등록 시 예외발생 처리
		try {
			if(doctorVO.getSEARCH_TAG_ARRAY() != null) {
				delete("AdminDRMDAO.dropDrTag",doctorVO);
				insert("AdminDRMDAO.insertDrTag",doctorVO);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return insert("AdminDRMDAO.insertDRM",doctorVO);
	}

	public int updateDRM(DoctorVO doctorVO) {
		if(doctorVO.getSEARCH_TAG_ARRAY() != null) {
			delete("AdminDRMDAO.dropDrTag",doctorVO);
			insert("AdminDRMDAO.insertDrTag",doctorVO);
		}
		return update("AdminDRMDAO.updateDRM",doctorVO);
	}

	public int deleteDRM(DoctorVO doctorVO) {
		return update("AdminDRMDAO.deleteDRM",doctorVO);
	}

	public int selectDRMTotCnt(DoctorVO doctorVO) {
		return selectOne("AdminDRMDAO.selectDRMTotCnt",doctorVO);
	}

	// 진료시간표 관리 메인화면 조회 
	public List selectTMMMainList(DoctorTimeTableVO doctorTimeTableVO) {
		return selectList("AdminDRMDAO.selectTMMMainList",doctorTimeTableVO);
	}

	// 진료시간표 관리 상세화면 조회 
	public DoctorTimeTableVO selectTMMView(DoctorTimeTableVO doctorTimeTableVO) {
		return selectOne("AdminDRMDAO.selectTMMView",doctorTimeTableVO);
	}
	
	public int updateOrderDRM(DoctorVO doctorVO) {
		return update("AdminDRMDAO.updateOrderDRM",doctorVO);
	}

	public int updateTMM(DoctorTimeTableVO doctorTimeTableVO) {
		return insert("AdminDRMDAO.updateTMM",doctorTimeTableVO);
	}

	// 진료시간표 관리 오전 오후 진료시간 저장
	public int updateAMPM(DoctorTimeTableVO doctorTimeTableVO) {
		return insert("AdminDRMDAO.updateAMPM",doctorTimeTableVO);
	}

	public List selectTMMList(DoctorTimeTableVO doctorTimeTableVO) {
		return selectList("AdminDRMDAO.selectTMMList",doctorTimeTableVO);
	}
	
}
