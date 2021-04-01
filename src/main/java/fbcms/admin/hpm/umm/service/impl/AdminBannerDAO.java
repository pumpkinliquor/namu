/**
 * 배너에 대한 DAO 클래스를 정의한다.
 */

package fbcms.admin.hpm.umm.service.impl;

import java.util.List;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.admin.hpm.umm.service.AdminBanner;
import fbcms.admin.hpm.umm.service.AdminBannerVO;

import org.springframework.stereotype.Repository;

@Repository("AdminBannerDAO")
public class AdminBannerDAO extends EgovComAbstractDAO {
	
	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 */	
	public List<AdminBannerVO> selectBannerList(AdminBannerVO adminBannerVO) throws Exception {
		return selectList("AdminBanner.selectBannerList", adminBannerVO);
	}
	
    /**
	 * 배너목록 총 갯수를 조회한다.
	 */
    public int selectBannerListTotCnt(AdminBannerVO adminBannerVO) throws Exception {
        return (Integer)selectOne("AdminBanner.selectBannerListTotCnt", adminBannerVO);
    }
    
	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 */
	public AdminBannerVO selectBannerDetail(AdminBanner adminBanner) throws Exception {
		return (AdminBannerVO) selectOne("AdminBanner.selectBannerDetail", adminBanner);
	}
	
	/**
	 * 배너정보를 신규로 등록한다.
	 */
	public void insertBanner(AdminBanner adminBanner) throws Exception {
		insert("AdminBanner.insertBanner", adminBanner);
	}
	
	/**
	 * 기 등록된 배너정보를 수정한다.
	 */
	public void updateBanner(AdminBanner adminBanner) throws Exception {
        update("AdminBanner.updateBanner", adminBanner);
	}
	
	/**
	 * 기 등록된 배너정보를 삭제한다.
	 */
	public void deleteBanner(AdminBanner adminBanner) throws Exception {
		delete("AdminBanner.deleteBanner", adminBanner);
	}
	
	/**
	 * 기 등록된 배너정보의 이미지파일을 삭제하기 위해 파일정보를 조회한다.
	 */
	public FileVO selectBannerFile(AdminBanner adminBanner) throws Exception {
		return (FileVO) selectOne("AdminBanner.selectBannerFile", adminBanner);
	}
	
	/**
	 * 배너가 특정화면에 반영된 결과를 조회한다.
	 */
	public List<AdminBannerVO> selectBannerResult(AdminBannerVO adminBannerVO) throws Exception {
		return selectList("AdminBanner.selectBannerResult", adminBannerVO);
	}
	
	/**
	 * 메인페이지 배너목록을 조회한다.
	 */	
	public List<AdminBannerVO> selectMainTopBannerList(AdminBannerVO adminBannerVO) throws Exception {
		return selectList("AdminBanner.selectMainTopBannerList", adminBannerVO);
	}
}
