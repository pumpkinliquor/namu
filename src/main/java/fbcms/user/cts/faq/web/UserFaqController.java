package fbcms.user.cts.faq.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import fbcms.admin.hpm.faq.service.AdminFaqService;
import fbcms.admin.hpm.faq.service.AdminFaqVO;
import fbcms.com.cmm.FbcmsCommonUtils;

/**
* FAQ내용을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class UserFaqController {
	
	@Resource(name = "AdminFaqService")
	private AdminFaqService adminFaqService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/**
	 * FAQ 목록을 조회한다.
	 * @param searchVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/cts/faq/selectFaqList.do")
	public String selectFaqList(@ModelAttribute("searchVO") AdminFaqVO searchVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {

		/** EgovPropertyService.SiteList */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		searchVO.setPostingYn("Y");

		List<?> resultList = adminFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", resultList);

		int totCnt = adminFaqService.selectFaqListCnt(searchVO);
		model.addAttribute("resultListTotCnt", totCnt);
		
		FbcmsCommonUtils.getMenuNavigation(request, model, "060700");

		return FbcmsCommonUtils.mobileJspReplace(request, "user/cts/faq/userFaqList");
	}
	
	/**
	 * FAQ 목록을 추가조회한다.
	 */
	@RequestMapping("/com/cmm/ajax/selectFaqAjaxList.do")
	public String selectFaqAjaxList(AdminFaqVO faqVO
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {

		/** EgovPropertyService.SiteList */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		searchVO.setPostingYn("Y");

		List<?> resultList = adminFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", resultList);

		int totCnt = adminFaqService.selectFaqListCnt(searchVO);
		model.addAttribute("resultListTotCnt", totCnt);

		return "com/cmm/ajax/userFaqAjaxList";
	}
	
	/**
	 * FAQ 목록을 추가조회한다.
	 */
	@RequestMapping("/com/cmm/ajax/selectFaqAjaxMobileList.do")
	public String selectFaqAjaxMobileList(AdminFaqVO faqVO
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model) throws Exception {

		/** EgovPropertyService.SiteList */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		searchVO.setPostingYn("Y");

		List<?> resultList = adminFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", resultList);

		int totCnt = adminFaqService.selectFaqListCnt(searchVO);
		model.addAttribute("resultListTotCnt", totCnt);

		return "com/cmm/ajax/userFaqAjaxMobileList";
	}
}
