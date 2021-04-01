package fbcms.admin.cmm.ccd.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeVO;

import org.springframework.stereotype.Repository;

/**
 * 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 데이터 접근 클래스
 */
@Repository("AdminCmmCodeDAO")
public class AdminCmmCodeDAO extends EgovComAbstractDAO {
	
	/**
	 * 주어진 조건에 따른 공통코드를 불러온다.
	 */
	@SuppressWarnings("unchecked")
	public List<AdminCmmCodeVO> selectCmmCodeList(AdminCmmCodeVO vo) throws Exception {
		return (List<AdminCmmCodeVO>) list("AdminCmmCode.selectCmmCodeList", vo);
	}
	
	/**
	 * 주어진 조건에 따른 공통코드를 불러온다.
	 */
	@SuppressWarnings("unchecked")
	public List<AdminCmmCodeVO> selectCmmCodeDetailList(AdminCmmCodeVO vo) throws Exception {
		return (List<AdminCmmCodeVO>) list("AdminCmmCode.selectCmmCodeDetailList", vo);
	}

	/**
	 * 공통코드로 사용할 조직정보를 를 불러온다.
	 */
	@SuppressWarnings("unchecked")
	public List<AdminCmmCodeVO> selectOgrnztIdDetailList(AdminCmmCodeVO vo) throws Exception {
		return (List<AdminCmmCodeVO>) list("AdminCmmCode.selectOgrnztIdDetailList", vo);
	}

	/**
	 * 공통코드로 사용할그룹정보를 를 불러온다.
	 */
	@SuppressWarnings("unchecked")
	public List<AdminCmmCodeVO> selectGroupIdDetailList(AdminCmmCodeVO vo) throws Exception {
		return (List<AdminCmmCodeVO>) list("AdminCmmCode.selectGroupIdDetailList", vo);
	}
}
