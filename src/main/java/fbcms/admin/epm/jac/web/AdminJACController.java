package fbcms.admin.epm.jac.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;

/**
* 입사지원(JobAppliCation)을 처리하는 비즈니스 구현 클래스
*/

@Controller
public class AdminJACController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminJACController.class);
	
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	@Resource(name = "AdminBBSMasterService")
	private AdminBBSMasterService adminBBSMasterService;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/**
	 * 입사지원 게시물에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/epm/jac/selectJACList.do")
	public String selectJACList(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setBbsId("BBSMSTR_000000000010");
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		vo.setBbsId(articleVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		AdminBoardMasterVO boardMasterVO = adminBBSMasterService.selectBBSMasterInf(vo);
		
		articleVO.setPageUnit(propertyService.getInt("pageUnit"));
		articleVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(articleVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(articleVO.getPageUnit());
		paginationInfo.setPageSize(articleVO.getPageSize());
		
		articleVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		articleVO.setLastIndex(paginationInfo.getLastRecordIndex());
		articleVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = adminArticleService.selectJACList(articleVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		if(user != null) {
			model.addAttribute("sessionUniqId", user.getUniqId());
		}
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("boardMasterVO", boardMasterVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/epm/jac/adminJACList";
	}
	
	/**
	 * 입사지원 게시물에 대한 목록을 엑셀다운로드한다.
	 */
	@RequestMapping("/admin/epm/jac/selectJACListExcel.do")
	public String selectJACListExcel(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setBbsId("BBSMSTR_000000000010");
		
		
		
		return "admin/epm/jac/adminJACList";
	}
	
	/**
	 * 입사지원 게시물에 대한 상세 정보를 조회한다.
	 */
	@RequestMapping("/admin/epm/jac/selectJACDetail.do")
	public String selectJACDetail(@ModelAttribute("searchVO") AdminBoardVO boardVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		boardVO.setLastUpdusrId(user.getUniqId());
		AdminBoardVO result = adminArticleService.selectJACDetail(boardVO);
		
		model.addAttribute("result", result);
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		AdminBoardMasterVO master = new AdminBoardMasterVO();
		
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		AdminBoardMasterVO boardMasterVO = adminBBSMasterService.selectBBSMasterInf(master);
		
		// 첨부파일 정보 가져온다.
		String atchFileId = result.getAtchFileId();
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
		model.addAttribute("fileList", fileList);
	
		model.addAttribute("boardMasterVO", boardMasterVO);
	
		return "admin/epm/jac/adminJACDetail";
	}
}
