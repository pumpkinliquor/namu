package fbcms.user.spc.cti.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.cln.service.Impl.CenterVO;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;

/**
 * 센터정보를 처리하는 비즈니스 인터페이스 클래스
 */
public interface UserCTIService {
	
	List<?> selectCTIClinicList(AdminBoardVO adminBoardVO);
	
	/*클리닉명 리스트 가져오기*/
	List<?> selectCLINM(CenterVO centerVO) throws Exception;
	
	public CenterVO selectCLN(CenterVO centerVO) throws Exception;

	List<?> selectCTISBMList(AdminBoardVO boardVO);
	
	String selectCTIDissListGroup(AdminBoardVO boardVO);
}
