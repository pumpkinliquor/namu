package fbcms.admin.sym.umt.service.impl;

import java.util.List;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import fbcms.admin.sym.umt.service.AdminAdminDefaultVO;
import fbcms.admin.sym.umt.service.AdminAdminManageService;
import fbcms.admin.sym.umt.service.AdminAdminManageVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 관리자관리에 관한 비지니스 클래스를 정의한다.
 */
@Service("AdminAdminManageService")
public class AdminAdminManageServiceImpl extends EgovAbstractServiceImpl implements AdminAdminManageService {

	/** userManageDAO */
	@Resource(name="AdminAdminManageDAO")
	private AdminAdminManageDAO adminManageDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	

	/**
	 * 기 등록된 특정 사용자의 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	@Override
	public List<?> selectAdminList(AdminAdminDefaultVO searchVO) {
		List<?> result = adminManageDAO.selectAdminList(searchVO);
		return result;
	}

	/**
	 * 기 등록된 특정 사용자목록의 전체수를 확인
	 */
	@Override
	public int selectAdminListTotCnt(AdminAdminDefaultVO searchVO) {
		return adminManageDAO.selectAdminListTotCnt(searchVO);
	}

	/**
	 * 기 등록된 사용자 중 검색조건에 맞는 사용자의 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	@Override
	public AdminAdminManageVO selectAdminDetail(String uniqId) {
		AdminAdminManageVO userManageVO = adminManageDAO.selectAdminDetail(uniqId);
		return userManageVO;
	}

	/**
	 * @param userManageVO 업무사용자 등록정보
	 */
	@Override
	public String insertAdmin(AdminAdminManageVO adminAdminManageVO) throws Exception {
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		adminAdminManageVO.setUniqId(uniqId);
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(adminAdminManageVO.getPassword(), EgovStringUtil.isNullToString(adminAdminManageVO.getEmplyrId()));//KISA 보안약점 조치 (2018-10-29, 윤창원)
		adminAdminManageVO.setPassword(pass);
		String result = adminManageDAO.insertAdmin(adminAdminManageVO);
		return result;
	}

	/**
	 * 화면에 조회된 사용자의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 */
	@Override
	public void updateAdmin(AdminAdminManageVO adminAdminManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(adminAdminManageVO.getPassword(), EgovStringUtil.isNullToString(adminAdminManageVO.getEmplyrId()));//KISA 보안약점 조치 (2018-10-29, 윤창원)
		adminAdminManageVO.setPassword(pass);

		adminManageDAO.updateAdmin(adminAdminManageVO);
	}

	/**
	 * 화면에 조회된 사용자의 정보를 데이터베이스에서 삭제
	 */
	@Override
	public void deleteAdmin(String checkedIdForDel) {
		//KISA 보안약점 조치 (2018-10-29, 윤창원)
		String [] delId = EgovStringUtil.isNullToString(checkedIdForDel).split(",");
		for (int i=0; i<delId.length ; i++){
			String [] id = delId[i].split(":");
			if (id[1].equals("USR03")){
		        //업무사용자(직원)삭제
				adminManageDAO.deleteAdmin(id[0]);
			}
		}
	}
	
	/**
	 * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 */
	@Override
	public int checkIdDplct(String checkId) {
		return adminManageDAO.checkIdDplct(checkId);
	}

	/**
	 * 업무사용자 암호 수정
	 */
	@Override
	public void updatePassword(AdminAdminManageVO adminAdminManageVO) {
		adminManageDAO.updatePassword(adminAdminManageVO);
	}

	/**
	 * 사용자가 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 */
	@Override
	public AdminAdminManageVO selectPassword(AdminAdminManageVO adminAdminManageVO) {
		return adminManageDAO.selectPassword(adminAdminManageVO);
	}
	
	/**
	 * 로그인인증제한 해제 
	 */
	@Override
	public void updateLockIncorrect(AdminAdminManageVO adminAdminManageVO) throws Exception {
		adminManageDAO.updateLockIncorrect(adminAdminManageVO);
	}
}