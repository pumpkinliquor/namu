package fbcms.user.cmm.src.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.cmm.src.service.SearchVO;
import fbcms.user.cmm.src.service.UserSearchService;

/**
 * 검색 컨트롤러
 * 
 * @author 엄국현
 * @since 2020.11.19
 */
@Controller
public class UserSearchController {
	
	@Autowired
	private UserSearchService userSearchService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserSearchController.class);

	@RequestMapping("/user/cmm/src/search.do")
	public String searchView(@ModelAttribute("SearchVO") SearchVO searchVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		if(searchVO.getLastTabIndex() == null) {
			searchVO.setLastTabIndex("All");
		}
		if(searchVO.getSearchKeyword() == null || searchVO.getSearchKeyword() == "") {
			model.addAttribute("searchVO", searchVO);
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/src/search");
		}
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(request.getSession().getAttribute("loginVO")!=null) {
			LoginVO LoginVO = (LoginVO)request.getSession().getAttribute("loginVO");
			model.addAttribute("LoginVO", LoginVO);
		}
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(searchVO.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		/** 총 게시글 수*/
		int totCnt = userSearchService.selectSearchBSSListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("bssListTotCnt", totCnt);
		model.addAttribute("paginationInfo",paginationInfo);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("resData", userSearchService.selectSearchListAll(searchVO));
		return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/src/searchResult");
	}
}