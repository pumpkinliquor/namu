package fbcms.admin.sym.mcm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.sym.mcm.service.AdminMenuCreateVO;
import fbcms.admin.sym.mcm.service.AdminMenuCreateManageService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 메뉴목록, 사이트맵 생성을 처리하는 비즈니스 구현 클래스를 정의한다.
 */
@Service("AdminMenuCreateManageService")
public class AdminMenuCreateManageServiceImpl extends EgovAbstractServiceImpl implements AdminMenuCreateManageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMenuCreateManageServiceImpl.class);

	@Resource(name = "AdminMenuCreateManageDAO")
	private AdminMenuCreateManageDAO menuCreateManageDAO;

	/**
	 * ID 존재여부를 조회
	 */
	public int selectUsrByPk(ComDefaultVO vo) throws Exception {
		return menuCreateManageDAO.selectUsrByPk(vo);
	}

	/**
	 * 메뉴생성 내역을 조회
	 */
	public List<?> selectMenuCreateList(AdminMenuCreateVO vo) throws Exception {
		return menuCreateManageDAO.selectMenuCreateList(vo);
	}

	/**
	 * 화면에 조회된 메뉴정보로 메뉴생성내역 데이터베이스에서 입력
	 */
	public void insertMenuCreateList(String checkedAuthorForInsert, String checkedMenuNoForInsert) throws Exception {
		AdminMenuCreateVO menuCreateVO = null;
		int AuthorCnt = 0;
		String[] insertMenuNo = checkedMenuNoForInsert.split(",");

		String insertAuthor = checkedAuthorForInsert;
		menuCreateVO = new AdminMenuCreateVO();
		menuCreateVO.setAuthorCode(insertAuthor);
		AuthorCnt = menuCreateManageDAO.selectMenuCreateCnt(menuCreateVO);

		// 이전에 존재하는 권한코드에 대한 메뉴설정내역 삭제
		if (AuthorCnt > 0) {
			menuCreateManageDAO.deleteMenuCreate(menuCreateVO);
		}
		for (int i = 0; i < insertMenuNo.length; i++) {
			menuCreateVO.setAuthorCode(insertAuthor);
			menuCreateVO.setMenuNo(Integer.parseInt(insertMenuNo[i]));
			menuCreateManageDAO.insertMenuCreate(menuCreateVO);
		}
	}

	/**
	 * 메뉴생성관리 목록을 조회
	 */
	public List<?> selectMenuCreateManageList(ComDefaultVO vo) throws Exception {
		return menuCreateManageDAO.selectMenuCreateManageList(vo);
	}

	/**
	 * ID에 대한 권한코드를 조회
	 */
	public AdminMenuCreateVO selectAuthorByUsr(ComDefaultVO vo) throws Exception {
		return menuCreateManageDAO.selectAuthorByUsr(vo);
	}

	/**
	 * 메뉴생성관리 총건수를 조회한다.
	 */
	public int selectMenuCreateManageTotCnt(ComDefaultVO vo) throws Exception {
		return menuCreateManageDAO.selectMenuCreateManageTotCnt(vo);
	}
}