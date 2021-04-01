package fbcms.com.cmm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.umm.service.AdminBannerVO;
import fbcms.admin.hpm.umm.service.AdminPopupVO;

public interface UserArticleService {

	void selectArticleList(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception;

	boolean selectArticleDetail(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception;
	
	/* 커스텀 추가 */
	Map<String, Object> selectJACList(AdminBoardVO adminBoardVO) throws Exception;

	AdminBoardVO selectJACDetail(AdminBoardVO adminBoardVO) throws Exception;
	
	List<AdminBoardVO> selectMiniboardList(AdminBoardVO adminBoardVO) throws Exception;
	
	List<AdminBoardVO> selectMiniboardMainManageList(AdminBoardVO boardVO) throws Exception;
	
	List<AdminBannerVO> selectMainTopBannerList(AdminBannerVO bannerVO) throws Exception;
	
	List<AdminPopupVO> selectMainPopupList(AdminPopupVO popupVO) throws Exception;

	void selectCSTList(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception;
	
	
	/**
	 * 의료진 리스트
	 */
	List<?> selectDoctorList() throws Exception;
}
