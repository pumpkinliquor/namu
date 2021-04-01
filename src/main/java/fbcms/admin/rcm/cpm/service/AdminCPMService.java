package fbcms.admin.rcm.cpm.service;

import java.util.HashMap;
import java.util.List;

import fbcms.admin.rcm.cpm.service.impl.CheckupVO;

/**
 * 검진 프로그램 관리
 * @author 김명진
 *
 */
public interface AdminCPMService {
	/**
	 * 검진프로그램 리스트
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public List<CheckupVO> selectCPMList(CheckupVO checkupVO) throws Exception;

	/**
	 * 정렬 순서 수정
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrderChange(CheckupVO checkupVO) throws Exception;
	
	/**
	 * 검진프로그램 상세
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public CheckupVO selectCPM(CheckupVO checkupVO) throws Exception;

	/**
	 * 검진프로그램 등록
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public int insertCPM(CheckupVO checkupVO) throws Exception;
	
	/**
	 * 검진프로그램 수정
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public int updateCPM(CheckupVO checkupVO, String EXMN_PROG_CD_CRT) throws Exception;
	
	/**
	 * 검진프로그램 삭제
	 * @param checkupVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCPM(CheckupVO checkupVO) throws Exception;

	/**
	 * 검진예약일정 관리 조회
	 * @param hMap
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectTableCPMList(HashMap<String,Object> hMap) throws Exception;

	/**
	 * 검진예약일정 관리 삭제
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int deleteTableCPM(HashMap<String,Object> hMap) throws Exception;
	
	/**
	 * 검진예약일정 관리 저장
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int insertTableCPM(HashMap<String,Object> hMap) throws Exception;
}
