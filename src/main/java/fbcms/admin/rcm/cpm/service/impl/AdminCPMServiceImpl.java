package fbcms.admin.rcm.cpm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.rcm.cpm.service.AdminCPMService;

@Service("AdminCPMService")
public class AdminCPMServiceImpl extends EgovAbstractServiceImpl implements AdminCPMService {

	@Autowired
	private AdminCPMDAO adminCPMDAO;
	
	// 검진프로그램 리스트
	public List<CheckupVO> selectCPMList(CheckupVO checkupVO) throws Exception {
		return adminCPMDAO.selectCPMList(checkupVO);
	}

	// 정렬 순서 수정
	public int updateOrderChange(CheckupVO checkupVO) throws Exception {
		return adminCPMDAO.updateOrderChange(checkupVO);
	}
	
	// 검진프로그램 상세
	public CheckupVO selectCPM(CheckupVO checkupVO) throws Exception {
		return adminCPMDAO.selectCPM(checkupVO);
	}

	// 검진프로그램 등록
	public int insertCPM(CheckupVO checkupVO) throws Exception {
		return adminCPMDAO.insertCPM(checkupVO);
	}

	// 검진프로그램 수정
	public int updateCPM(CheckupVO checkupVO, String DTIL_CD_CRT) throws Exception {
		Map map = new HashMap();
		map.put("checkupVO", checkupVO);
		map.put("DTIL_CD_CRT", DTIL_CD_CRT);
		return adminCPMDAO.updateCPM(map);
	}

	// 검진프로그램 삭제
	public int deleteCPM(CheckupVO checkupVO) throws Exception {
		return adminCPMDAO.deleteCPM(checkupVO);
	}

	// 검진예약일정 관리 조회
	public List<HashMap<String,Object>> selectTableCPMList(HashMap<String,Object> hMap) throws Exception {
		return adminCPMDAO.selectTableCPMList(hMap);
	}

	// 검진예약일정 관리 삭제
	public int deleteTableCPM(HashMap<String,Object> hMap) throws Exception {
		return adminCPMDAO.deleteTableCPM(hMap);
	}
	
	// 검진예약일정 관리 저장
	public int insertTableCPM(HashMap<String,Object> hMap) throws Exception {
		return adminCPMDAO.insertTableCPM(hMap);
	}
}
