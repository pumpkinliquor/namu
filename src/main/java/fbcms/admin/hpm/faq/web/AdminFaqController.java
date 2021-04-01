package fbcms.admin.hpm.faq.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import fbcms.admin.hpm.faq.service.AdminFaqService;
import fbcms.admin.hpm.faq.service.AdminFaqVO;

/**
* FAQ내용을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class AdminFaqController {
	
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

	// Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * FAQ 목록을 조회한다.
	 */
	@IncludedInfo(name = "FAQ관리", order = 540, gid = 50)
	@RequestMapping(value = "/admin/hpm/faq/selectFaqList.do")
	public String selectFaqList(@ModelAttribute("searchVO") AdminFaqVO searchVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
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
		
		List<?> resultList = adminFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", resultList);
		
		int totCnt = adminFaqService.selectFaqListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/hpm/faq/adminFaqList";
	}
	
	/**
	 * FAQ 목록에 대한 상세정보를 조회한다.
	 */
	@RequestMapping("/admin/hpm/faq/selectFaqDetail.do")
	public String selectFaqDetail(AdminFaqVO faqVO
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminFaqVO result = adminFaqService.selectFaqDetail(searchVO);
		
		model.addAttribute("result", result);
		
		return "admin/hpm/faq/adminFaqDetail";
	}
	
	/**
	 * FAQ를 등록하기 위한 전 처리
	 */
	@RequestMapping("/admin/hpm/faq/insertFaqView.do")
	public String insertFaqView(@ModelAttribute("searchVO") AdminFaqVO searchVO
			, Model model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("faqVO", new AdminFaqVO());
		
		return "admin/hpm/faq/adminFaqRegist";
	}
	
	/**
	 * FAQ를 등록한다.
	 */
	@RequestMapping("/admin/hpm/faq/insertFaq.do")
	public String insertFaqCn(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, @ModelAttribute("faqManageVO") AdminFaqVO faqVO
			, BindingResult bindingResult
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		beanValidator.validate(faqVO, bindingResult);
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/faq/insertFaqView.do";
		}
		
		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = null;
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "FAQ_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}
		
		// 리턴받은 첨부파일ID를 셋팅한다..
		faqVO.setAtchFileId(_atchFileId); // 첨부파일 ID
		
		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String frstRegisterId = loginVO.getUniqId();
		
		faqVO.setFrstRegisterId(frstRegisterId); // 최초등록자ID
		faqVO.setLastUpdusrId(frstRegisterId); // 최종수정자ID
		
		adminFaqService.insertFaq(faqVO);
		
		return "redirect:/admin/hpm/faq/selectFaqList.do";
	}
	
	/**
	 * FAQ를 수정하기 위한 전 처리
	 */
	@RequestMapping("/admin/hpm/faq/updateFaqView.do")
	public String updateFaqView(@RequestParam("faqId") String faqId
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminFaqVO faqVO = new AdminFaqVO();
		
		// Primary Key 값 세팅
		faqVO.setFaqId(faqId);
		
		// 변수명은 CoC 에 따라 JSTL사용을 위해
		model.addAttribute("faqVO", adminFaqService.selectFaqDetail(faqVO));
		
		return "admin/hpm/faq/adminFaqUpdt";
	}

	/**
	 * FAQ를 수정처리한다.
	 */
	@RequestMapping("/admin/hpm/faq/updateFaq.do")
	public String updateFaqCn(final MultipartHttpServletRequest multiRequest
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, @ModelAttribute("faqVO") AdminFaqVO faqVO
			, BindingResult bindingResult
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// Validation
		beanValidator.validate(faqVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "redirect:/admin/hpm/faq/updateFaqView.do";
		}
		
		// 첨부파일 관련 ID 생성 start....
		String atchFileId = faqVO.getAtchFileId();
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
			if ("".equals(atchFileId)) {
			    List<FileVO> result = fileUtil.parseFileInf(files, "FAQ_", 0, atchFileId, "");
			    atchFileId = fileMngService.insertFileInfs(result);
			    faqVO.setAtchFileId(atchFileId);
			} else {
			    FileVO fvo = new FileVO();
			    fvo.setAtchFileId(atchFileId);
			    int cnt = fileMngService.getMaxFileSN(fvo);
			    List<FileVO> _result = fileUtil.parseFileInf(files, "FAQ_", cnt, atchFileId, "");
			    fileMngService.updateFileInfs(_result);
			}
	    }
		// 첨부파일 관련 ID 생성 end...
	    
		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String lastUpdusrId = loginVO.getUniqId();
		faqVO.setLastUpdusrId(lastUpdusrId); // 최종수정자ID
		
		adminFaqService.updateFaq(faqVO);
		
		return "redirect:/admin/hpm/faq/selectFaqList.do";
	}

	/**
	 * FAQ를 삭제처리한다.
	 */
	@RequestMapping("/admin/hpm/faq/deleteFaq.do")
	public String deleteFaq(AdminFaqVO faqVO
			, @ModelAttribute("searchVO") AdminFaqVO searchVO
			, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 첨부파일 삭제를 위한 ID 생성 start....
		String _atchFileId = faqVO.getAtchFileId();
		
		adminFaqService.deleteFaq(faqVO);
		
		// 첨부파일을 삭제하기 위한  Vo
		FileVO fvo = new FileVO();
		fvo.setAtchFileId(_atchFileId);
		
		fileMngService.deleteAllFileInf(fvo);
		// 첨부파일 삭제 End.............
		
		return "redirect:/admin/hpm/faq/selectFaqList.do";
	}
}
