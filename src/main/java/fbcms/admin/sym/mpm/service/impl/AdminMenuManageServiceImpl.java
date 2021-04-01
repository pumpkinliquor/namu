package fbcms.admin.sym.mpm.service.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.excel.EgovExcelService;
import fbcms.admin.sym.mpm.service.AdminMenuManageService;
import fbcms.admin.sym.mpm.service.AdminMenuManageVO;
import fbcms.admin.sym.prm.service.AdminProgrmManageVO;
import fbcms.admin.sym.prm.service.impl.AdminProgrmManageDAO;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 메뉴목록관리, 생성, 사이트맵을 처리하는 비즈니스 구현 클래스를 정의한다.
 */

@Service("AdminMenuManageService")
public class AdminMenuManageServiceImpl extends EgovAbstractServiceImpl implements AdminMenuManageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminMenuManageServiceImpl.class);

	@Resource(name = "AdminMenuManageDAO")
	private AdminMenuManageDAO adminMenuManageDAO;
	
	@Resource(name = "AdminProgrmManageDAO")
	private AdminProgrmManageDAO adminProgrmManageDAO;
	
	@Resource(name = "excelZipService")
	private EgovExcelService excelZipService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver mailmultipartResolver;
	

	/**
	 * 메뉴 목록을 조회
	 */
	public List<?> selectMenuManageList(ComDefaultVO vo) throws Exception {
		return adminMenuManageDAO.selectMenuManageList(vo);
	}

	/**
	 * 메뉴목록 총건수를 조회한다.
	 */
	public int selectMenuManageListTotCnt(ComDefaultVO vo) throws Exception {
		return adminMenuManageDAO.selectMenuManageListTotCnt(vo);
	}

	/**
	 * 메뉴 상세정보를 조회
	 */
	public AdminMenuManageVO selectMenuManageDetail(AdminMenuManageVO vo) throws Exception {
		return adminMenuManageDAO.selectMenuManageDetail(vo);
	}

	/**
	 * 메뉴번호를 상위메뉴로 참조하고 있는 메뉴 존재여부를 조회
	 */
	public int selectUpperMenuNoByPk(AdminMenuManageVO vo) throws Exception {
		return adminMenuManageDAO.selectUpperMenuNoByPk(vo);
	}

	/**
	 * 메뉴번호 존재 여부를 조회한다.
	 */
	public int selectMenuNoByPk(AdminMenuManageVO vo) throws Exception {
		return adminMenuManageDAO.selectMenuNoByPk(vo);
	}

	/**
	 * 메뉴 정보를 등록
	 */
	public void insertMenuManage(AdminMenuManageVO vo) throws Exception {
		adminMenuManageDAO.insertMenuManage(vo);
	}

	/**
	 * 메뉴 정보를 수정
	 */
	public void updateMenuManage(AdminMenuManageVO vo) throws Exception {
		adminMenuManageDAO.updateMenuManage(vo);
	}

	/**
	 * 메뉴 정보를 삭제
	 */
	public void deleteMenuManage(AdminMenuManageVO vo) throws Exception {
		adminMenuManageDAO.deleteMenuManage(vo);
	}

	/**
	 * 메뉴 목록을 조회
	 */
	public List<?> selectMenuList() throws Exception {
		return adminMenuManageDAO.selectMenuList();
	}

	/**
	 * 관리자 메뉴 목록 권한을 조회
	 */
	public List<?> selectMenuListAuthCheckAll(AdminAdminManageVO adminAdminManageVO) throws Exception {
		return adminMenuManageDAO.selectMenuListAuthCheckAll(adminAdminManageVO);
	}

	/**
	 * 관리자 메뉴 권한을 등록
	 */
	public void insertAdminMenu(AdminMenuManageVO adminMenuManageVO, String checkedMenuNoList) throws Exception {
		String[] adminMenuList = checkedMenuNoList.split(",");
		
		for(int i = 0; i < adminMenuList.length; i++) {
			String menuNo = EgovStringUtil.isNullToString(adminMenuList[i]);
			if(!"".equals(menuNo)) {
				adminMenuManageVO.setMenuNo(Integer.parseInt(menuNo));
				adminMenuManageDAO.insertAdminMenu(adminMenuManageVO);
			}
		}
	}

	/**
	 * 관리자 메뉴 권한을 삭제
	 */
	public void deleteAdminMenu(AdminMenuManageVO adminMenuManageVO) throws Exception {
		adminMenuManageDAO.deleteAdminMenu(adminMenuManageVO);
	}

	/**
	 * 공통 메뉴 gnb 조회
	 */
	public List<HashMap<String, String>> selectMenuGnb(HashMap<String, String> hashMap) throws Exception {
		return adminMenuManageDAO.selectMenuGnb(hashMap);
	}

	/**
	 * 공통 메뉴 lnb 조회
	 */
	public List<HashMap<String, String>> selectMenuLnb(HashMap<String, String> hashMap) throws Exception {
		return adminMenuManageDAO.selectMenuLnb(hashMap);
	}

	/**
	 * 공통 메뉴 현재메뉴 조회
	 */
	public HashMap<String, String> selectCurrentMenu(HashMap<String, String> hashMap) throws Exception {
		return adminMenuManageDAO.selectCurrentMenu(hashMap);
	}
}