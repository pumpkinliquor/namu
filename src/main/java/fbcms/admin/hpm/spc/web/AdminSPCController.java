package fbcms.admin.hpm.spc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.rte.fdl.property.EgovPropertyService;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeService;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeVO;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.CommonService;

/**
* 특화센터(SPecialized Center)을 처리하는 비즈니스 구현 클래스
*/
@Controller
public class AdminSPCController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminSPCController.class);
	
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	
	@Resource(name = "AdminBBSMasterService")
	private AdminBBSMasterService adminBBSMasterService;
	
	@Resource(name = "AdminCmmCodeService")
	private AdminCmmCodeService adminCmmCodeService;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Autowired
	private AdminSBMService adminSBMService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	
	/**
	 * 특화센터 게시물에 대한 목록을 조회한다.
	 */
	@RequestMapping("/admin/hpm/spc/selectSPCList.do")
	public String selectSPCList(@ModelAttribute("searchVO") AdminBoardVO articleVO, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		articleVO.setBbsId("BBSMSTR_000000000017");
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		
		articleVO.setParntsCustom1("SPC");
		
		vo.setBbsId(articleVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		AdminBoardMasterVO boardMasterVO = adminBBSMasterService.selectBBSMasterInf(vo);
		
		Map<String, Object> resultMap = adminArticleService.selectSPCList(articleVO);

		model.addAttribute("articleVO", articleVO);
		model.addAttribute("resultList", resultMap.get("resultList"));
		model.addAttribute("boardMasterVO", boardMasterVO);
		
		return "admin/hpm/spc/adminSPCList";
	}
    
    /**
     * 특화센터를 수정하기 전 단계처리
     */
	@RequestMapping("/admin/hpm/spc/updateSPCView.do")
    public String updateSPCView(@ModelAttribute("board") AdminBoardVO boardVO
			, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		AdminBoardMasterVO boardMasterVO = new AdminBoardMasterVO();

		boardMasterVO.setBbsId(boardVO.getBbsId());
		boardMasterVO.setUniqId(user.getUniqId());
		boardMasterVO = adminBBSMasterService.selectBBSMasterInf(boardMasterVO);
		
		model.addAttribute("boardMasterVO", boardMasterVO);
		
		AdminBoardVO articleVO = new AdminBoardVO();		
		articleVO = adminArticleService.selectSPCDetail(boardVO);
		model.addAttribute("articleVO", articleVO);
		
		List<?> dissList = adminSBMService.selectSBMDissListAll();
		model.addAttribute("dissList", dissList);
		
		if(articleVO == null || articleVO.getNttId() < 1) {
			return "admin/hpm/spc/adminSPCRegist";
		}
		
		articleVO.setParntsCustom1(articleVO.getCustom1());
		Map<String, Object> resultMap = adminArticleService.selectSPCChildList(articleVO);
		List<AdminBoardVO> resultList = (List<AdminBoardVO>) resultMap.get("resultList");
		if(!resultList.isEmpty()) {
			long nttNo = 1;
			for (AdminBoardVO result : resultList) {
				if(nttNo == result.getNttNo()) {
					model.addAttribute("result"+nttNo, result);
					
					// 첨부파일 정보 가져온다.
					String atchFileId = result.getAtchFileId();
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(atchFileId);
					List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
					model.addAttribute("fileList"+nttNo, fileList);
				}
				nttNo++;
			}
		}
		
		if(articleVO.getCustom4() != null && articleVO.getCustom4() != "") {
			List<String> dissCds = new ArrayList<>();
			for (String dissInfo : articleVO.getCustom4().split(",")) {
				dissCds.add(dissInfo);
			}
			SubjectVO subjectVO = new SubjectVO();
			subjectVO.setDISS_CDS_LIST(dissCds);
			subjectVO.setDISS_CDS_LIST(adminSBMService.selectSBMDissCodeList(subjectVO));
			model.addAttribute("subjectInfo", subjectVO);
		}
		
        return "admin/hpm/spc/adminSPCUpdt";
    }
    
    /**
     * 특화센터를 등록한다.
     */
    @RequestMapping("/admin/hpm/spc/insertSPC.do")
    public String insertSPC(final MultipartHttpServletRequest multiRequest
    		, HttpServletRequest request
    		, @ModelAttribute("searchVO") AdminBoardVO boardVO
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("board") AdminBoardVO board
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		board.setFrstRegisterId(user.getUniqId());
		board.setBbsId(boardVO.getBbsId());
		board.setBlogId(boardVO.getBlogId());
		
		board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		adminArticleService.insertArticle(board);
		
		for (int i = 0; i < 33; i++) {
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000017");
			adminBoardVO.setNttSj(request.getParameter("nttSj" + (i+1)));
			adminBoardVO.setCustom1(request.getParameter("custom1_" + (i+1)));
			adminBoardVO.setCustom2(request.getParameter("custom2_" + (i+1)));
			adminBoardVO.setCustom3(request.getParameter("custom3_" + (i+1)));
			adminBoardVO.setCustom4(request.getParameter("custom4_" + (i+1)));
			adminBoardVO.setPostingYn("Y");
			adminBoardVO.setUseAt(request.getParameter("useAt" + (i+1)));
			adminBoardVO.setNttNo((i+1));
			adminBoardVO.setParntsCustom1(board.getCustom1());
			
			List<FileVO> result = null;
			String atchFileId = "";
			
			if (!multiRequest.getFile("file_"+(i+1)).isEmpty()) {
				Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
				insertFiles.put("file0", multiRequest.getFile("file_"+(i+1)));
				result = fileUtil.parseFileInf(insertFiles, "SPC_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			adminBoardVO.setAtchFileId(atchFileId);
			adminBoardVO.setFrstRegisterId(user.getUniqId());
			
			adminBoardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			adminBoardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(request.getParameter("nttCn" + (i+1))));	// XSS 방지
			adminArticleService.insertSPC(adminBoardVO);	
		}
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
        
		return "redirect:/admin/hpm/spc/selectSPCList.do";
    }
	
    /**
     * 특화센터를 수정 처리한다
     */
	@RequestMapping("/admin/hpm/spc/updateSPC.do")
    public String updateSPC(final MultipartHttpServletRequest multiRequest
    		, HttpServletRequest request
    		, @ModelAttribute("searchVO") AdminBoardVO boardVO
    		, @ModelAttribute("bdMstr") AdminBoardMaster bdMstr
    		, @ModelAttribute("board") AdminBoard board
    		, BindingResult bindingResult
    		, ModelMap model
    		, RedirectAttributes redirectAttributes) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "redirect:/admin/lgn/adminLogin.do";
		}

		//--------------------------------------------------------------------------------------------
		// @ XSS 대응 권한체크 체크  START
		// param1 : 사용자고유ID(uniqId,esntlId)
		//--------------------------------------------------------
		LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
		//step1 DB에서 해당 게시물의 uniqId 조회
		AdminBoardVO vo = adminArticleService.selectSPCDetail(boardVO);
		
		if(multiRequest != null && vo != null) {
			//step2 EgovXssChecker 공통모듈을 이용한 권한체크
			EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId());
		}
	  	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
		//--------------------------------------------------------
		// @ XSS 대응 권한체크 체크 END
		//--------------------------------------------------------------------------------------------
	  	
		
	  	for (int i = 0; i < 33; i++) {
			AdminBoardVO adminBoardVO = new AdminBoardVO();
			adminBoardVO.setBbsId("BBSMSTR_000000000017");
			String tmpNttId = "";
			try {
				tmpNttId = request.getParameter("nttId" + (i+1));
			} catch(Exception e) {
				tmpNttId = "";
			}
			if(tmpNttId == null || tmpNttId.isEmpty()) {
			} else {
				adminBoardVO.setNttId(Long.parseLong(request.getParameter("nttId" + (i+1))));
				adminBoardVO.setNttSj(request.getParameter("nttSj" + (i+1)));
				adminBoardVO.setCustom1(request.getParameter("custom1_" + (i+1)));
				adminBoardVO.setCustom2(request.getParameter("custom2_" + (i+1)));
				adminBoardVO.setCustom3(request.getParameter("custom3_" + (i+1)));
				adminBoardVO.setCustom4(request.getParameter("custom4_" + (i+1)));
				adminBoardVO.setPostingYn("Y");
				adminBoardVO.setUseAt(request.getParameter("useAt" + (i+1)));
				adminBoardVO.setNttNo((i+1));
				adminBoardVO.setAtchFileId(request.getParameter("atchFileId_" + (i+1)));
				
				String atchFileId = adminBoardVO.getAtchFileId();
				
				if (!multiRequest.getFile("file_"+(i+1)).isEmpty()) {
					Map<String, MultipartFile> insertFiles = new HashMap<String, MultipartFile>();
					insertFiles.put("file0", multiRequest.getFile("file_"+(i+1)));
					
					if (!"".equals(atchFileId)) {
						// 기존 첨부파일 삭제처리
						String deleteFileSn = "0";
						FileVO fvo = new FileVO();
						fvo.setAtchFileId(atchFileId);
						fvo.setFileSn(deleteFileSn);
						
						fileMngService.deleteFileInf(fvo);
						
						List<FileVO> result = fileUtil.parseFileInf(insertFiles, "SPC_", 0, atchFileId, "");
						fileMngService.updateFileInfs(result);
					} else {
						List<FileVO> _result = fileUtil.parseFileInf(insertFiles, "SPC_", 0, "", "");
						atchFileId = fileMngService.insertFileInfs(_result);
					}
				}
				adminBoardVO.setAtchFileId(atchFileId);
				adminBoardVO.setLastUpdusrId(user.getUniqId());
				
				adminBoardVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
				adminBoardVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
				
				adminBoardVO.setNttCn(FbcmsCommonUtils.unscript(request.getParameter("nttCn" + (i+1))));	// XSS 방지
				adminArticleService.updateSPC(adminBoardVO);
			}
		}
		
		board.setLastUpdusrId(user.getUniqId());
		board.setBbsId(boardVO.getBbsId());
		board.setBlogId(boardVO.getBlogId());
		
		board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		
		board.setNttCn(FbcmsCommonUtils.unscript(board.getNttCn()));	// XSS 방지
		adminArticleService.updateArticle(board);
		
		redirectAttributes.addAttribute("bbsId", boardVO.getBbsId());
		redirectAttributes.addAttribute("pageIndex", "1");
		
        return "redirect:/admin/hpm/spc/selectSPCList.do";
    }
}
