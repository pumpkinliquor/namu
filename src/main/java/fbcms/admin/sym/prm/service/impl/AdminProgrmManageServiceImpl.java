package fbcms.admin.sym.prm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.sym.prm.service.AdminProgrmManageService;
import fbcms.admin.sym.prm.service.AdminProgrmManageVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 프로그램목록관리 및 프로그램변경관리에 관한 비즈니스 구현 클래스를 정의한다.
 */
@Service("AdminProgrmManageService")
public class AdminProgrmManageServiceImpl extends EgovAbstractServiceImpl implements AdminProgrmManageService {
	
	@Resource(name="AdminProgrmManageDAO")
    private AdminProgrmManageDAO progrmManageDAO;
	
	
	/**
	 * 프로그램 목록을 조회
	 */
	@Override
	public List<?> selectProgrmList(ComDefaultVO vo) throws Exception {
   		return progrmManageDAO.selectProgrmList(vo);
	}
	
	/**
	 * 프로그램목록 총건수를 조회한다.
	 */
    @Override
	public int selectProgrmListTotCnt(ComDefaultVO vo) throws Exception {
        return progrmManageDAO.selectProgrmListTotCnt(vo);
	}
    
	/**
	 * 프로그램 상세정보를 조회
	 */
	@Override
	public AdminProgrmManageVO selectProgrmDetail(AdminProgrmManageVO vo) throws Exception {
		return progrmManageDAO.selectProgrmDetail(vo);
	}
	
	/**
	 * 프로그램 상세 URL 목록을 조회
	 */
	@Override
	public List<?> selectProgrmDetailUrlList(AdminProgrmManageVO vo) throws Exception {
   		return progrmManageDAO.selectProgrmDetailUrlList(vo);
	}
	
	/**
	 * 프로그램 정보를 등록
	 */
	@Override
	public void insertProgrm(AdminProgrmManageVO vo) throws Exception {
    	progrmManageDAO.insertProgrm(vo);
	}

	/**
	 * 프로그램 정보를 수정
	 */
	@Override
	public void updateProgrm(AdminProgrmManageVO vo) throws Exception {
    	progrmManageDAO.updateProgrm(vo);
	}

	/**
	 * 프로그램 정보를 삭제
	 */
	@Override
	public void deleteProgrm(AdminProgrmManageVO vo) throws Exception {
    	progrmManageDAO.deleteProgrm(vo);
	}

	/**
	 * 프로그램 상세 URL를 삭제
	 */
	@Override
	public void deleteProgrmDetailUrl(AdminProgrmManageVO vo) throws Exception {
    	progrmManageDAO.deleteProgrmDetailUrl(vo);
	}
	
	/**
	 * 프로그램 상세 URL를 등록
	 */
	@Override
	public void insertProgrmDetailUrl(AdminProgrmManageVO vo) throws Exception {
    	progrmManageDAO.insertProgrmDetailUrl(vo);
	}

	/**
	 * 프로그램 파일 존재여부를 조회
	 */
	@Override
	public int selectProgrmNMTotCnt(ComDefaultVO vo) throws Exception{
		return progrmManageDAO.selectProgrmNMTotCnt(vo);
	}
}