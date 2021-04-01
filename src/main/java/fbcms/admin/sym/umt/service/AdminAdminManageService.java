package fbcms.admin.sym.umt.service;
import java.util.List;

/**
 * 관리자관리에 관한 인터페이스클래스를 정의한다.
 */
public interface AdminAdminManageService  {
	
	/**
	 * 기 등록된 특정 관리자의 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	public List<?> selectAdminList(AdminAdminDefaultVO searchVO) throws Exception;
	
	/**
	 * 기 등록된 특정 관리자목록의 전체수를 확인
	 */
	public int selectAdminListTotCnt(AdminAdminDefaultVO searchVO) throws Exception;
	
	/**
	 * 기 등록된 관리자 중 검색조건에 맞는 관리자의 정보를 데이터베이스에서 읽어와 화면에 출력
	 */
	public AdminAdminManageVO selectAdminDetail(String emplyrId) throws Exception;

	/**
	 * @param userManageVO 업무관리자 등록정보
	 */
	public String insertAdmin(AdminAdminManageVO adminAdminManageVO) throws Exception;
	
	/**
	 * 화면에 조회된 관리자의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 */
	public void updateAdmin(AdminAdminManageVO adminAdminManageVO) throws Exception;

	/**
	 * 화면에 조회된 관리자의 정보를 데이터베이스에서 삭제
	 */
	public void deleteAdmin(String checkedIdForDel) throws Exception;

	/**
	 * 입력한 관리자아이디의 중복여부를 체크하여 사용가능여부를 확인
	 */
	public int checkIdDplct(String checkId) throws Exception;
	
	/**
	 * 업무관리자 암호 수정
	 */
	public void updatePassword(AdminAdminManageVO adminAdminManageVO) throws Exception;
	
	/**
	 * 관리자가 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 */
	public AdminAdminManageVO selectPassword(AdminAdminManageVO adminAdminManageVO) throws Exception;
	
	/**
	 * 로그인인증제한 해제 
	 */
	public void updateLockIncorrect(AdminAdminManageVO adminAdminManageVO) throws Exception;
}