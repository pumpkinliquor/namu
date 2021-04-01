package fbcms.admin.rcm.cpm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("AdminCPMDAO")
public class AdminCPMDAO extends EgovComAbstractDAO {
	// 검진프로그램 리스트
	public List<CheckupVO> selectCPMList(CheckupVO checkupVO) {
		return selectList("AdminCPMDAO.selectCPMList", checkupVO);
	}

	// 검진프로그램 삭제
	public int updateOrderChange(CheckupVO checkupVO) {
		return update("AdminCPMDAO.updateOrderChange", checkupVO);
	}
	
	// 검진프로그램 상세
	public CheckupVO selectCPM(CheckupVO checkupVO) {
		return selectOne("AdminCPMDAO.selectCPM", checkupVO);
	}

	// 검진프로그램 등록
	public int insertCPM(CheckupVO checkupVO) {
		return insert("AdminCPMDAO.insertCPM", checkupVO);
	}

	// 검진프로그램 수정
	public int updateCPM(Map map) {
		return update("AdminCPMDAO.updateCPM", map);
	}

	// 검진프로그램 삭제
	public int deleteCPM(CheckupVO checkupVO) {
		return delete("AdminCPMDAO.deleteCPM", checkupVO);
	}

	// 검진예약일정 관리 조회
	public List<HashMap<String,Object>> selectTableCPMList(HashMap<String,Object> hMap) {
		return selectList("AdminCPMDAO.selectTableCPMList", hMap);
	}

	// 검진예약일정 관리 삭제
	public int deleteTableCPM(HashMap<String,Object> hMap) {
		return delete("AdminCPMDAO.deleteTableCPM", hMap);
	}
	
	// 검진예약일정 관리 저장
	public int insertTableCPM(HashMap<String,Object> hMap) {
		return insert("AdminCPMDAO.insertTableCPM", hMap);
	}
}
