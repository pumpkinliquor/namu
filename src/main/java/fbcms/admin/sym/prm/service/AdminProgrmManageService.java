package fbcms.admin.sym.prm.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 프로그램관리에 관한 서비스 인터페이스 클래스를 정의한다.
 */

public interface AdminProgrmManageService {
	
	/**
	 * 프로그램 목록을 조회
	 */
	List<?> selectProgrmList(ComDefaultVO vo) throws Exception;
	
	/**
	 * 프로그램목록 총건수를 조회한다.
	 */
	int selectProgrmListTotCnt(ComDefaultVO vo) throws Exception;
	
	/**
	 * 프로그램 상세정보를 조회
	 */
	AdminProgrmManageVO selectProgrmDetail(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 상세 URL 목록을 조회
	 */
	List<?> selectProgrmDetailUrlList(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 정보를 등록
	 */
	void insertProgrm(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 정보를 수정
	 */
	void updateProgrm(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 정보를 삭제
	 */
	void deleteProgrm(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 상세 URL를 삭제
	 */
	void deleteProgrmDetailUrl(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 상세 URL를 등록
	 */
	void insertProgrmDetailUrl(AdminProgrmManageVO vo) throws Exception;
	
	/**
	 * 프로그램 파일 존재여부를 조회
	 */
	int selectProgrmNMTotCnt(ComDefaultVO vo) throws Exception;
}