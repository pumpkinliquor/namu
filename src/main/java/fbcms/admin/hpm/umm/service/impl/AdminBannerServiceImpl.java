/**
 * 배너에 대한 ServiceImpl 클래스를 정의한다.
 */

package fbcms.admin.hpm.umm.service.impl;

import java.io.File;
import java.util.List;

import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.umm.service.AdminBanner;
import fbcms.admin.hpm.umm.service.AdminBannerService;
import fbcms.admin.hpm.umm.service.AdminBannerVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("AdminBannerService")
public class AdminBannerServiceImpl extends EgovAbstractServiceImpl implements AdminBannerService {
	
	/** logger */
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminBannerServiceImpl.class);
	
	@Resource(name="AdminBannerDAO")
    private AdminBannerDAO adminBannerDAO;
	
	
	/**
	 * 배너를 관리하기 위해 등록된 배너목록을 조회한다.
	 */
	public List<AdminBannerVO> selectBannerList(AdminBannerVO adminBannerVO) throws Exception {
		return adminBannerDAO.selectBannerList(adminBannerVO);
	}
	
	/**
	 * 배너목록 총 갯수를 조회한다.
	 */
	public int selectBannerListTotCnt(AdminBannerVO adminBannerVO) throws Exception {
		return adminBannerDAO.selectBannerListTotCnt(adminBannerVO);
	}
	
	/**
	 * 등록된 배너의 상세정보를 조회한다.
	 */
	public AdminBannerVO selectBannerDetail(AdminBanner adminBanner) throws Exception {
		return adminBannerDAO.selectBannerDetail(adminBanner);
	}
	
	/**
	 * 배너정보를 신규로 등록한다.
	 */
	public AdminBannerVO insertBanner(AdminBanner adminBanner
			, AdminBannerVO adminBannerVO) throws Exception {
		adminBannerDAO.insertBanner(adminBanner);
		adminBannerVO.setBannerId(adminBanner.getBannerId());
        return selectBannerDetail(adminBannerVO);
	}
	
	/**
	 * 기 등록된 배너정보를 수정한다.
	 */
	public void updateBanner(AdminBanner adminBanner) throws Exception {
		adminBannerDAO.updateBanner(adminBanner);
	}
	
	/**
	 * 기 등록된 배너정보를 삭제한다.
	 */
	public void deleteBanner(AdminBanner adminBanner) throws Exception {
		deleteBannerFile(adminBanner);
		adminBannerDAO.deleteBanner(adminBanner);
	}
	
	/**
	 * 기 등록된 배너정보의 이미지파일을 삭제한다.
	 */
	public void deleteBannerFile(AdminBanner adminBanner) throws Exception {
		FileVO fileVO = (FileVO)adminBannerDAO.selectBannerFile(adminBanner);
		File file = new File(fileVO.getFileStreCours()+fileVO.getStreFileNm());
		//2017.02.08 	이정은 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
		if(file.delete()) {
			LOGGER.debug("[file.delete] file : File Deletion Success");
		} else {
			LOGGER.error("[file.delete] file : File Deletion Fail");
		}
	}
	
	/**
	 * 배너가 특정화면에 반영된 결과를 조회한다.
	 */
	public List<AdminBannerVO> selectBannerResult(AdminBannerVO adminBannerVO) throws Exception {
		return adminBannerDAO.selectBannerResult(adminBannerVO);
	}
}