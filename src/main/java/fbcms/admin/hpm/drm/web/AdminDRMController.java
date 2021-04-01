package fbcms.admin.hpm.drm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.AdminDRMService;
import fbcms.admin.hpm.drm.service.impl.DoctorTimeTableVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.service.CommonCodeVO;
import fbcms.com.cmm.service.CommonService;

/**
 * 의료진 관리
 * @author 김명진
 * @since 2020.10.13
 */
@Controller
public class AdminDRMController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminDRMController.class);
	
	@Autowired
	private AdminSBMService adminSBMService;
	@Autowired
	private AdminDRMService adminDRMService;
	@Autowired
	private CommonService commonService;
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;
	@Resource(name = "AdminOcsCTMDAO")
	private AdminOcsCTMDAO adminOcsCTMDAO;
	
	/**
	 * 의료진관리 리스트 페이지
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/selectDRMList.do")
	public String selectDRMList(ModelMap model,@ModelAttribute("doctorVO")DoctorVO doctorVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(doctorVO.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(doctorVO.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(doctorVO.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		doctorVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		doctorVO.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		doctorVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		// 진료과목 디폴트 셋팅 (GI:소화기내과)
		if(doctorVO != null && doctorVO.getMEDI_SBJ_CD() == null)
			doctorVO.setMEDI_SBJ_CD("GI");
		
		// 총 개수
		int totCnt = adminDRMService.selectDRMTotCnt(doctorVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		// 의료진 리스트 가져오기
		List<DoctorVO> doctorList = adminDRMService.selectDRMList(doctorVO);
		List<DoctorVO> doctorListPopup = adminDRMService.selectDRMListPopup(doctorVO);
		
		model.addAttribute("doctorList", doctorList);
		model.addAttribute("doctorListPopup", doctorListPopup);
		model.addAttribute("doctorListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		// 공통코드 가져오기
		CommonCodeVO commCd = new CommonCodeVO();
		
		// 진료과목
		commCd.setCOMMON_CODE("MEDI_SBJ_CD");
		List<CommonCodeVO> exmnProgCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("exmnProgCdList", exmnProgCdList);
		
		return "admin/hpm/drm/adminDRMList";
	}

	/**
	 * 노출 순서 변경
	 * @param model
	 * @param doctorVO
	 * @param remodel
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/updateOrderDRM.do")
	public String updateOrderDRM(ModelMap model
								,@ModelAttribute("doctorVO")DoctorVO doctorVO
								,RedirectAttributes remodel
								,HttpServletRequest request) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String trCount = request.getParameter("trCount");
		if(trCount!=null) {
			int trCnt = Integer.parseInt(trCount);
			for(int i=0; i < trCnt; i++) {
				if(request.getParameter("seq"+(i+1)+"Order") != null && request.getParameter("seq"+(i+1)+"DoctorId") != null) {
					DoctorVO newVO = new DoctorVO();
					int ORDER_NO = Integer.parseInt(request.getParameter("seq"+(i+1)+"Order").toString());
					newVO.setORDER_NO(ORDER_NO);
					String DR_ID = request.getParameter("seq"+(i+1)+"DoctorId");
					newVO.setDR_ID(DR_ID);
					adminDRMService.updateOrderDRM(newVO);
				}
			}
		}
		
		remodel.addFlashAttribute("doctorVO", doctorVO);
		return "redirect:/admin/hpm/drm/selectDRMList.do";
	}
	
	/**
	 * 수정 페이지
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/updateDRMView.do")
	public String updateDRMView(ModelMap model,@ModelAttribute("doctorVO")DoctorVO doctorVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		/**
		 * 의료진 등록 되있으면  is = Y JSP에서 처리
		 */
		List<HashMap> doctorOCSList = adminDRMService.selectOcsDrList(doctorVO);
		List<DoctorVO> doctorList = adminDRMService.selectDRMList(doctorVO);
		for(HashMap map : doctorOCSList) {
			for(DoctorVO searchVO : doctorList) {
				if(map.containsValue(searchVO.getDR_ID())) {
					map.put("is", "Y");
					break;
				}
			}
		}
		doctorVO = adminDRMService.selectDRM(doctorVO);
		FileVO mbFileInfo = new FileVO();
		FileVO pcFileInfo = new FileVO();
		mbFileInfo.setAtchFileId(doctorVO.getMOBILE_IMG_ATCH_NO());
		pcFileInfo.setAtchFileId(doctorVO.getPC_IMG_ATCH_NO());
		mbFileInfo = fileMngService.selectFileInf(mbFileInfo);
		pcFileInfo = fileMngService.selectFileInf(pcFileInfo);
		//List centorList = adminDRMService.selectOcsCtList();
		
		model.addAttribute("doctorInfo", doctorVO);
		if(mbFileInfo != null) {
			model.addAttribute("MOBILE_IMG_ATCH_NM", mbFileInfo.getOrignlFileNm());
			model.addAttribute("MOBILE_IMG_ATCH_FILE_ID", mbFileInfo.getAtchFileId());
		}
		if(pcFileInfo != null) {
			model.addAttribute("PC_IMG_ATCH_NM", pcFileInfo.getOrignlFileNm());
			model.addAttribute("PC_IMG_ATCH_FILE_ID", pcFileInfo.getAtchFileId());
		}
		
		//List<HashMap> centerOcsList = adminDRMService.selectOcsCtList();
		//model.addAttribute("centerList", centerOcsList);		
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000017");
		adminBoardVO.setParntsCustom1("SPC");
		
		Map<String, Object> resultMap = adminArticleService.selectSPCList(adminBoardVO);
		model.addAttribute("centerList", resultMap.get("resultList"));
		
		
		return "admin/hpm/drm/adminDRMModify";
	}
	
	/**
	 * 의료진 수정
	 * @param model
	 * @param doctorVO
	 * @param remodel
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/updateDRM.do")
	public String updateDRM(ModelMap model,@ModelAttribute("doctorVO")DoctorVO doctorVO
			,RedirectAttributes remodel
			,HttpServletRequest request
			,MultipartHttpServletRequest multiRequest) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/**
		 * 파일등록
		 */
		String PC_IMG_ATCH_NO = "";
		String MOBILE_IMG_ATCH_NO ="";
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		List<FileVO> result1 = null;
		Map<String,MultipartFile> file1 = new LinkedHashMap<String,MultipartFile>();
		file1.put("file_up1", files.get("file_up1"));
		if (!file1.isEmpty()) {
			result1 = fileUtil.parseFileInf(file1, "DRM_", 0, "", "");
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(PC_IMG_ATCH_NO);
			fileMngService.deleteFileInf(fileVO);
			PC_IMG_ATCH_NO = fileMngService.insertFileInfs(result1);
		}
		
		List<FileVO> result2 = null;
		
		Map<String,MultipartFile> file2 = new LinkedHashMap<String,MultipartFile>();
		file2.put("file_up2", files.get("file_up2"));
		if (!file2.isEmpty()) {
			result2 = fileUtil.parseFileInf(file2, "DRM_", 0, "", "");
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(MOBILE_IMG_ATCH_NO);
			fileMngService.deleteFileInf(fileVO);
			MOBILE_IMG_ATCH_NO = fileMngService.insertFileInfs(result2);
		}
		
		if(doctorVO != null) {
			String[] ADD_OPEN_SET_CDS = request.getParameterValues("ADD_OPEN_SET_CD");
			StringBuffer ADD_OPEN_SET_CD = new StringBuffer();
			String[] BLOG_USE = request.getParameterValues("BLOG_USE");
			String BLOG_USE_YN;
			if(BLOG_USE!=null) {
					BLOG_USE_YN = BLOG_USE[0];
					doctorVO.setBLOG_USE_YN(BLOG_USE_YN);
			}
			if(ADD_OPEN_SET_CDS !=null) {
				for(int i =0; i<ADD_OPEN_SET_CDS.length; i++) {
					if(i==0) {
						ADD_OPEN_SET_CD.append(ADD_OPEN_SET_CDS[i]);
					}
					else {
						ADD_OPEN_SET_CD.append(",");
						ADD_OPEN_SET_CD.append(ADD_OPEN_SET_CDS[i]);
					}
				}
			}
			doctorVO.setADD_OPEN_SET_CD(ADD_OPEN_SET_CD.toString());
			doctorVO.setMOBILE_IMG_ATCH_NO(MOBILE_IMG_ATCH_NO);
			doctorVO.setPC_IMG_ATCH_NO(PC_IMG_ATCH_NO);
			int res = adminDRMService.updateDRM(doctorVO);
			DoctorVO redirectVO = new DoctorVO();
			redirectVO.setMEDI_SBJ_CD(doctorVO.getMEDI_SBJ_CD());
			remodel.addFlashAttribute("doctorVO", redirectVO);
		}
		
		
		
		return "redirect:/admin/hpm/drm/selectDRMList.do";
	}
	
	/**
	 * 의료진 삭제
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/deleteDRM.do")
	public String deleteDRM(ModelMap model,@ModelAttribute("doctorVO")DoctorVO doctorVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		int res = adminDRMService.deleteDRM(doctorVO);
		
		return "redirect:/admin/hpm/drm/selectDRMList.do";
	}
	
	/**
	 * 의료진 등록 페이지
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/insertDRMView.do")
	public String insertDRMView(ModelMap model,@ModelAttribute("doctorVO")DoctorVO doctorVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/**
		 * 의료진 등록 되있으면  is = Y JSP에서 처리
		 */
		List<HashMap> doctorOCSList = adminDRMService.selectOcsDrList(doctorVO);
		List<DoctorVO> doctorList = adminDRMService.selectDRMList(doctorVO);
		//List<HashMap> centerList = adminDRMService.selectOcsCtList();
		for(HashMap map : doctorOCSList) {
			for(DoctorVO searchVO : doctorList) {
				if(map.containsValue(searchVO.getDR_ID())) {
					map.put("is", "Y");
					break;
				}
			}
		}
		
		model.addAttribute("doctorList", doctorOCSList);
		//model.addAttribute("centerList", centerList);
		
		AdminBoardVO adminBoardVO = new AdminBoardVO();
		adminBoardVO.setBbsId("BBSMSTR_000000000017");
		adminBoardVO.setParntsCustom1("SPC");
		
		Map<String, Object> resultMap = adminArticleService.selectSPCList(adminBoardVO);
		model.addAttribute("centerList", resultMap.get("resultList"));
		
		return "admin/hpm/drm/adminDRMRegist";
	}
	
	/**
	 * 의료진 등록
	 * @param model
	 * @param doctorVO
	 * @param multiRequest
	 * @param remodel
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/insertDRM.do")
	public String insertDRM(ModelMap model
			, @ModelAttribute("doctorVO")DoctorVO doctorVO
			, MultipartHttpServletRequest multiRequest
			, RedirectAttributes remodel
			, HttpServletRequest request) throws Exception {
		
		/**
		 * 파일등록
		 */
		List<FileVO> result1 = null;
		List<FileVO> result2 = null;
		String PC_IMG_ATCH_NO = "";
		String MOBILE_IMG_ATCH_NO ="";
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		Map<String,MultipartFile> file1 = new LinkedHashMap<String,MultipartFile>();
		file1.put("file_up1", files.get("file_up1"));
		Map<String,MultipartFile> file2 = new LinkedHashMap<String,MultipartFile>();
		file2.put("file_up2", files.get("file_up2"));
		if (!file1.isEmpty()) {
			result1 = fileUtil.parseFileInf(file1, "DRM_", 0, "", "");
			PC_IMG_ATCH_NO = fileMngService.insertFileInfs(result1);
		}
		if (!file2.isEmpty()) {
			result2 = fileUtil.parseFileInf(file2, "DRM_", 0, "", "");
			MOBILE_IMG_ATCH_NO = fileMngService.insertFileInfs(result2);
		}
		 
		
		if(doctorVO != null) {
			String[] ADD_OPEN_SET_CDS = request.getParameterValues("ADD_OPEN_SET_CD");
			String[] BLOG_USE = request.getParameterValues("BLOG_USE");
			String BLOG_USE_YN;
			if(BLOG_USE!=null) {
					BLOG_USE_YN = BLOG_USE[0];
					doctorVO.setBLOG_USE_YN(BLOG_USE_YN);
			}
			
			StringBuffer ADD_OPEN_SET_CD = new StringBuffer();
			if(ADD_OPEN_SET_CDS!=null) {
				for(int i =0; i<ADD_OPEN_SET_CDS.length; i++) {
					if(i==0) {
						ADD_OPEN_SET_CD.append(ADD_OPEN_SET_CDS[i]);
					}
					else {
						ADD_OPEN_SET_CD.append(",");
						ADD_OPEN_SET_CD.append(ADD_OPEN_SET_CDS[i]);
					}
				}
			}
				
			doctorVO.setADD_OPEN_SET_CD(ADD_OPEN_SET_CD.toString());
			doctorVO.setMOBILE_IMG_ATCH_NO(MOBILE_IMG_ATCH_NO);
			doctorVO.setPC_IMG_ATCH_NO(PC_IMG_ATCH_NO);
			adminDRMService.insertDRM(doctorVO);
			DoctorVO redirectVO = new DoctorVO();
			redirectVO.setMEDI_SBJ_CD(doctorVO.getMEDI_SBJ_CD());
			remodel.addFlashAttribute("doctorVO", redirectVO);
		}
		return "redirect:/admin/hpm/drm/selectDRMList.do";
	}

	/**
	 * 진료시간표
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/selectTMMList.do")
	public String selectTMMList(ModelMap model,@ModelAttribute("doctorTimeTableVO")DoctorTimeTableVO doctorTimeTableVO, @ModelAttribute("subjectVO")SubjectVO subjectVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		List<SubjectVO> subjectOcsList = adminSBMService.selectOcsSBMList(subjectVO);
		List<DoctorTimeTableVO> dttList = adminDRMService.selectTMMMainList(doctorTimeTableVO);
		for(SubjectVO Ocsvo : subjectOcsList) {
			for(DoctorTimeTableVO vo : dttList ) {
				if( vo.getLAST_MOD_DT() != null && !vo.getLAST_MOD_DT().equals("") && Ocsvo.getMNG_CD().equals(vo.getMEDI_SBJ_CD()))
					Ocsvo.setREG_DT(vo.getLAST_MOD_DT());
			}
		}
		
		model.addAttribute("subjectList", subjectOcsList);
		return "admin/hpm/drm/adminTMMList";
	}

	/**
	 * 진료시간표 수정페이지
	 * @param model
	 * @param doctorVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/updateTMMView.do")
	public String updateTMMView(ModelMap model,@ModelAttribute("doctorTimeTableVO")DoctorTimeTableVO doctorTimeTableVO,@ModelAttribute("subjectVO")SubjectVO subjectVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String NM = adminOcsCTMDAO.selectDPTName(doctorTimeTableVO.getMEDI_SBJ_CD());
		
		DoctorTimeTableVO dtt = adminDRMService.selectTMMView(doctorTimeTableVO);
		
		doctorTimeTableVO.setMEDI_SBJ_NM(NM);
		
		//진료과 의사리스트 검색
		DoctorVO VO = new DoctorVO();
		VO.setMEDI_SBJ_CD(doctorTimeTableVO.getMEDI_SBJ_CD());
		System.out.println("DRM입니다" + VO.getADD_OPEN_SET_CD());
		
		//페이징 사용x
		VO.setRecordCountPerPage(0);
		VO.setADD_OPEN_SET_CD("01");
		//진료시간표 노출
		List<DoctorVO> doctorList = adminDRMService.selectDRMList(VO);
		
		model.addAttribute("doctorTimeTable", dtt);
		model.addAttribute("MNG_CD",doctorTimeTableVO.getMEDI_SBJ_CD());
		model.addAttribute("MEDI_SBJ_CD", doctorTimeTableVO.getMEDI_SBJ_NM());
		model.addAttribute("doctorList",doctorList);
		
		List drTimeTableList = adminDRMService.selectTMMList(doctorTimeTableVO);
		model.addAttribute("drTimeTableList", drTimeTableList);
		
		return "admin/hpm/drm/adminTMMModify";
	}
	
	/**
	 * 진료시간표 수정
	 * @param model
	 * @param doctorVO
	 * @param subjectVO
	 * @param remodel
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/drm/updateTMM.do")
	public String updateTMM(ModelMap model,@ModelAttribute("doctorTimeTableVO")DoctorTimeTableVO doctorTimeTableVO
			, @ModelAttribute("subjectVO")SubjectVO subjectVO, RedirectAttributes remodel
			, HttpServletRequest request) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 오전 오후 진료시간 저장
		String MEDI_SBJ_CD = request.getParameter("MNG_CD");
		String AM_BIGO = request.getParameter("AM_BIGO");
		String PM_BIGO = request.getParameter("PM_BIGO");
		
		doctorTimeTableVO.setMEDI_SBJ_CD(MEDI_SBJ_CD);
		doctorTimeTableVO.setAM_CT(AM_BIGO);
		doctorTimeTableVO.setPM_CT(PM_BIGO);
		
		adminDRMService.updateAMPM(doctorTimeTableVO);
		
		String strTR_CNT = request.getParameter("TR_CNT");
		List<DoctorTimeTableVO> DrTimeTableList = new ArrayList<>();
		if(strTR_CNT!=null) {
			int TR_CNT = Integer.parseInt(strTR_CNT);
			String MNG_CD = subjectVO.getMNG_CD();
			//의사리스트 수
			for(int i=0; i<TR_CNT; i++) {
				String DR_ID = request.getParameter("seq"+i+"DR_ID");
				//월~토 6일 오전
				for(int j=0; j<6;j++) {
					String DAY_WEEK_CD = request.getParameter("seq"+i+"AM_DAY"+j);
					String TIME_GUBN_CD = "AM";
					String[] POSB_YNS = request.getParameterValues("seq"+i+"AM_DAY"+j+"_POSB_YN");
					String POSB_YN =null;
					if(POSB_YNS != null)
						POSB_YN = POSB_YNS[0];
					String DAY_WEEK_BIGO_TX = request.getParameter("seq"+i+"AM_DAY"+j+"_BIGO");
					DoctorTimeTableVO vo = new DoctorTimeTableVO();
					if(MNG_CD != null && DR_ID != null && DAY_WEEK_CD != null ) {
						vo.setMEDI_SBJ_CD(MNG_CD);
						vo.setDAY_WEEK_CD(DAY_WEEK_CD);
						vo.setDR_ID(DR_ID);
						vo.setTIME_GUBN_CD(TIME_GUBN_CD);
					}
					vo.setPOSB_YN(POSB_YN);
					vo.setDAY_WEEK_BIGO_TX(DAY_WEEK_BIGO_TX);
					DrTimeTableList.add(vo);
					if(vo.getDR_ID() != null)
						adminDRMService.updateTMM(vo);
					
				}
				//월~토 6일 오후
				for(int j=0; j<6;j++) {
					String DAY_WEEK_CD = request.getParameter("seq"+i+"PM_DAY"+j);
					String TIME_GUBN_CD = "PM";
					String POSB_YN = request.getParameter("seq"+i+"PM_DAY"+j+"_POSB_YN");
					String DAY_WEEK_BIGO_TX = request.getParameter("seq"+i+"PM_DAY"+j+"_BIGO");
					DoctorTimeTableVO vo = new DoctorTimeTableVO();
					if(MNG_CD != null && DR_ID != null && DAY_WEEK_CD != null ) {
						vo.setMEDI_SBJ_CD(MNG_CD);
						vo.setDAY_WEEK_CD(DAY_WEEK_CD);
						vo.setDR_ID(DR_ID);
						vo.setTIME_GUBN_CD(TIME_GUBN_CD);
					}
					vo.setPOSB_YN(POSB_YN);
					vo.setDAY_WEEK_BIGO_TX(DAY_WEEK_BIGO_TX);
					DrTimeTableList.add(vo);
					if(vo.getDR_ID() != null)
						adminDRMService.updateTMM(vo);
					
				}
			}
		}
		
		remodel.addFlashAttribute("doctorTimeTableVO", doctorTimeTableVO);
		return "redirect:/admin/hpm/drm/selectTMMList.do";
	}
}
