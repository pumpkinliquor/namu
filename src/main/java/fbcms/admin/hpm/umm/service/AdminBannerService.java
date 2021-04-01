/**
 * 배너에 대한 Service Interface를 정의한다.
 */
package fbcms.admin.hpm.umm.service;

import java.util.List;

public interface AdminBannerService {
	
	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 */
	public List<AdminBannerVO> selectBannerList(AdminBannerVO adminBannerVO) throws Exception;
	
	/**
	 * 배너목록 총 갯수를 조회한다.
	 */
	public int selectBannerListTotCnt(AdminBannerVO adminBannerVO) throws Exception;
	
	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 */
	public AdminBannerVO selectBannerDetail(AdminBanner adminBanner) throws Exception;
	
	/**
	 * 배너정보를 신규로 등록한다.
	 */
	public AdminBannerVO insertBanner(AdminBanner adminBanner, AdminBannerVO adminBannerVO) throws Exception;
	
	/**
	 * 기 등록된 배너정보를 수정한다.
	 */
	public void updateBanner(AdminBanner adminBanner) throws Exception;
	
	/**
	 * 기 등록된 배너정보를 삭제한다.
	 */
	public void deleteBanner(AdminBanner adminBanner) throws Exception;
	
	/**
	 * 기 등록된 배너정보의 이미지파일을 삭제한다.
	 */
	public void deleteBannerFile(AdminBanner adminBanner) throws Exception;
	
	/**
	 * 배너가 특정화면에 반영된 결과를 조회한다.
	 */
	public List<AdminBannerVO> selectBannerResult(AdminBannerVO adminBannerVO) throws Exception;
}
