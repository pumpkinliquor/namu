package fbcms.com.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cop.tpl.service.EgovTemplateManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.bbs.service.impl.AdminArticleDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.umm.service.AdminBannerVO;
import fbcms.admin.hpm.umm.service.AdminPopupVO;
import fbcms.admin.hpm.umm.service.impl.AdminBannerDAO;
import fbcms.admin.hpm.umm.service.impl.AdminPopupDAO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.com.cmm.service.UserArticleService;
import fbcms.com.cop.cmt.service.ComArticleCommentService;

@Service("UserArticleService")
public class UserArticleServiceImpl extends EgovAbstractServiceImpl implements UserArticleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserArticleServiceImpl.class);
	
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
	private EgovMessageSource egovMessageSource;
	
	@Resource(name = "ComArticleCommentService")
	protected ComArticleCommentService comArticleCommentService;

	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService egovTemplateManageService;
	
	@Resource(name = "AdminArticleDAO")
    private AdminArticleDAO adminArticleDAO;
	
	@Resource(name = "AdminBannerDAO")
    private AdminBannerDAO adminBannerDAO;
	
	@Resource(name = "AdminPopupDAO")
    private AdminPopupDAO adminPopupDAO;

    @Resource(name = "egovNttIdGnrService")
    private EgovIdGnrService nttIdgenService;
    
    @Resource(name = "UserDoctorDAO")
    private UserDoctorDAO userDoctorDAO;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Override
	public void selectArticleList(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception {
		
		boardVO.setBbsId(bbsId);
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		
		AdminBoardMasterVO master = adminBBSMasterService.selectBBSMasterInf(vo);
		
		boardVO.setPageUnit(pageUnit);
		if(FbcmsCommonUtils.mobileCheck(request)) { // 모바일인 경우
			boardVO.setPageSize(5);
		} else {
			boardVO.setPageSize(propertyService.getInt("pageSize"));
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(!"BBSMSTR_000000000013".equals(bbsId)) {
			boardVO.setPostingYn("Y");
		}
		
		List<?> resultTmpList = adminArticleDAO.selectArticleList(boardVO);
		int totCnt = adminArticleDAO.selectArticleListCnt(boardVO);
		
		//공지사항 추출
		List<AdminBoardVO> noticeList = adminArticleService.selectNoticeArticleList(boardVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		List<AdminBoardVO> resultList = new ArrayList<AdminBoardVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < resultTmpList.size(); i++) {
			AdminBoardVO fileBoardVO = (AdminBoardVO) resultTmpList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(fileBoardVO.getAtchFileId());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			fileBoardVO.setListFile(listFile);
			resultList.add(fileBoardVO);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
	}

	@Override
	public boolean selectArticleDetail(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception {
		
		boardVO.setBbsId(bbsId);
		AdminBoardVO result = adminArticleService.selectArticleDetail(boardVO);
		if(result == null || result.getBbsId().isEmpty() || "".equals(result.getBbsId())) {
			return false;
		} else {
			model.addAttribute("result", result);
			
			AdminBoardMasterVO master = new AdminBoardMasterVO();
			master.setBbsId(boardVO.getBbsId());
			
			AdminBoardMasterVO masterVo = adminBBSMasterService.selectBBSMasterInf(master);
			
			model.addAttribute("boardMasterVO", masterVo);
			
			if(!"BBSMSTR_000000000013".equals(bbsId)) {
				boardVO.setPostingYn("Y");
			}
			
			// 첨부파일 정보 가져온다.
			String atchFileId = result.getAtchFileId();
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(atchFileId);
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("fileList", fileList);
	
			AdminBoardVO preBoardVO = null;
			AdminBoardVO nextBoardVO = null;
			try {
				int curRownum = adminArticleService.selectArticleCurRownum(boardVO);
				if(curRownum - 2 >= 0) {
					boardVO.setRecordCountPerPage(curRownum-2);
					preBoardVO = adminArticleService.selectArticlePre(boardVO);
				}
				if(curRownum >= 0) {
					boardVO.setRecordCountPerPage(curRownum);
					nextBoardVO = adminArticleService.selectArticleNext(boardVO);
				}
			} catch (Exception e) {
				LOGGER.error("Exception : " + e.getMessage());
			} 
			model.addAttribute("preBoardVO", preBoardVO);
			model.addAttribute("nextBoardVO", nextBoardVO);
			
			AdminBoardVO replyBoardVO = adminArticleService.selectArticleReply(boardVO);
			model.addAttribute("replyBoardVO", replyBoardVO);
			
			return true;
		}
	}
	
	@Override
	public Map<String, Object> selectJACList(AdminBoardVO adminBoardVO) throws Exception {
		
		List<?> resultList = adminArticleDAO.selectJACList(adminBoardVO);
		int resultCnt = adminArticleDAO.selectJACListCnt(adminBoardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", resultList);
		map.put("resultCnt", Integer.toString(resultCnt));

		return map;
	}

	@Override
	public AdminBoardVO selectJACDetail(AdminBoardVO adminBoardVO) throws Exception {
		
	    int iniqireCo = adminArticleDAO.selectMaxInqireCo(adminBoardVO);

	    adminBoardVO.setInqireCo(iniqireCo);
	    adminArticleDAO.updateInqireCo(adminBoardVO);

		return adminArticleDAO.selectJACDetail(adminBoardVO);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdminBoardVO> selectMiniboardList(AdminBoardVO adminBoardVO) throws Exception {
		
		return (List<AdminBoardVO>) adminArticleDAO.selectMiniboardList(adminBoardVO);
	}
	
	@Override
	public List<AdminBoardVO> selectMiniboardMainManageList(AdminBoardVO boardVO) throws Exception {
		
		List<?> resultTmpList = adminArticleDAO.selectMiniboardMainManageList(boardVO);
		
		List<AdminBoardVO> resultList = new ArrayList<AdminBoardVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < resultTmpList.size(); i++) {
			AdminBoardVO fileBoardVO = (AdminBoardVO) resultTmpList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(fileBoardVO.getAtchFileId());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			fileBoardVO.setListFile(listFile);
			resultList.add(fileBoardVO);
		}
		
		return resultList;
	}
	
	@Override
	public List<AdminBannerVO> selectMainTopBannerList(AdminBannerVO bannerVO) throws Exception {
		
		return adminBannerDAO.selectMainTopBannerList(bannerVO);
	}
	
	@Override
	public List<AdminPopupVO> selectMainPopupList(AdminPopupVO popupVO) throws Exception {
		
		List<?> resultTmpList = adminPopupDAO.selectMainPopupList(popupVO);
		
		List<AdminPopupVO> resultList = new ArrayList<AdminPopupVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < resultTmpList.size(); i++) {
			AdminPopupVO filePopupVO = (AdminPopupVO) resultTmpList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(filePopupVO.getAtchFileId());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			filePopupVO.setListFile(listFile);
			resultList.add(filePopupVO);
		}
		
		return resultList;
	}
	
	@Override
	public void selectCSTList(AdminBoardVO boardVO
			, HttpServletRequest request
			, HttpServletResponse response
			, ModelMap model
			, String bbsId
			, int pageUnit) throws Exception {
		
		boardVO.setBbsId(bbsId);
		AdminBoardMasterVO vo = new AdminBoardMasterVO();
		vo.setBbsId(boardVO.getBbsId());
		
		AdminBoardMasterVO master = adminBBSMasterService.selectBBSMasterInf(vo);
		
		boardVO.setPageUnit(pageUnit);
		if(FbcmsCommonUtils.mobileCheck(request)) { // 모바일인 경우
			boardVO.setPageSize(5);
		} else {
			boardVO.setPageSize(propertyService.getInt("pageSize"));
		}
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		if(!"BBSMSTR_000000000013".equals(bbsId)) {
			boardVO.setPostingYn("Y");
		}
		
		List<?> resultTmpList = adminArticleDAO.selectCSTList(boardVO);
		int totCnt = adminArticleDAO.selectCSTListCnt(boardVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		List<AdminBoardVO> resultList = new ArrayList<AdminBoardVO>();
		// 첨부파일 정보도 list에 필요
		for(int i = 0; i < resultTmpList.size(); i++) {
			AdminBoardVO fileBoardVO = (AdminBoardVO) resultTmpList.get(i);
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(fileBoardVO.getAtchFileId());
			List<FileVO> listFile = fileMngService.selectFileInfs(fileVO);
			fileBoardVO.setListFile(listFile);
			resultList.add(fileBoardVO);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
	}
	
	@Override
	public List<?> selectDoctorList() throws Exception {
		return userDoctorDAO.selectDoctorList();
	}
}
