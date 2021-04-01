package fbcms.admin.hpm.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import fbcms.admin.hpm.bbs.service.AdminBBSMasterService;
import fbcms.admin.hpm.bbs.service.AdminBlog;
import fbcms.admin.hpm.bbs.service.AdminBlogUser;
import fbcms.admin.hpm.bbs.service.AdminBlogVO;
import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;

@Service("AdminBBSMasterService")
public class AdminBBSMasterServiceImpl extends EgovAbstractServiceImpl implements AdminBBSMasterService {

	@Resource(name = "AdminBBSMasterDAO")
    private AdminBBSMasterDAO adminBBSMasterDAO;

    @Resource(name = "egovBBSMstrIdGnrService")
    private EgovIdGnrService idgenService;
	
    //---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    @Resource(name = "AdminBBSAddedOptionsDAO")
    private AdminBBSAddedOptionsDAO adminBBSAddedOptionsDAO;
    ////-------------------------------
    
	@Override
	public Map<String, Object> selectNotUsedBdMstrList(AdminBoardMasterVO adminBoardMasterVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBBSMasterInf(AdminBoardMaster adminBoardMaster) {
		adminBBSMasterDAO.deleteBBSMaster(adminBoardMaster);	
	}

	@Override
	public void updateBBSMasterInf(AdminBoardMaster adminBoardMaster) throws Exception {
		adminBBSMasterDAO.updateBBSMaster(adminBoardMaster);
		
		//---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		//---------------------------------
		if (adminBoardMaster.getOption().equals("comment") || adminBoardMaster.getOption().equals("stsfdg")) {
			adminBBSAddedOptionsDAO.insertAddedOptionsInf(adminBoardMaster);
		}
		
	}

	@Override
	public AdminBoardMasterVO selectBBSMasterInf(AdminBoardMasterVO adminBoardMasterVO) throws Exception {
		AdminBoardMasterVO resultVO = adminBBSMasterDAO.selectBBSMasterDetail(adminBoardMasterVO);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        
    	if(EgovComponentChecker.hasComponent("EgovBBSCommentService") || EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")){//2011.09.15
    		AdminBoardMasterVO options = adminBBSAddedOptionsDAO.selectAddedOptionsInf(adminBoardMasterVO);
    	    
    	    if (options != null) {
	    		if (options.getCommentAt().equals("Y")) {
	    			resultVO.setOption("comment");
	    		}
	
	    		if (options.getStsfdgAt().equals("Y")) {
	    			resultVO.setOption("stsfdg");
	    		}
    	    } else {
    	    	resultVO.setOption("na");	// 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
    	    }
    	}
        
        return resultVO;
	}

	@Override
	public Map<String, Object> selectBBSMasterInfs(AdminBoardMasterVO adminBoardMasterVO) {
		List<?> result = adminBBSMasterDAO.selectBBSMasterInfs(adminBoardMasterVO);
		int cnt = adminBBSMasterDAO.selectBBSMasterInfsCnt(adminBoardMasterVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	@Override
	public Map<String, Object> selectBlogMasterInfs(AdminBoardMasterVO adminBoardMasterVO) {
		List<?> result = adminBBSMasterDAO.selectBlogMasterInfs(adminBoardMasterVO);
		int cnt = adminBBSMasterDAO.selectBlogMasterInfsCnt(adminBoardMasterVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	@Override
	public void insertBBSMasterInf(AdminBoardMaster adminBoardMaster) throws Exception {
		
		//게시판 ID 채번
		String bbsId = idgenService.getNextStringId();
		adminBoardMaster.setBbsId(bbsId);
		
		adminBBSMasterDAO.insertBBSMasterInf(adminBoardMaster);
		
		//---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		//---------------------------------
		if (adminBoardMaster.getOption().equals("comment") || adminBoardMaster.getOption().equals("stsfdg")) {
			adminBBSAddedOptionsDAO.insertAddedOptionsInf(adminBoardMaster);
		}

	}
	
	@Override
	public String checkBlogUser(AdminBlogVO adminBlogVO) {

		int userCnt = adminBBSMasterDAO.checkExistUser(adminBlogVO);
		
		if (userCnt == 0) {
		    return "";
		} else {
		    return "EXIST";
		}
	}
	
	@Override
	public AdminBlogVO checkBlogUser2(AdminBlogVO adminBlogVO) {
		AdminBlogVO userBlog = adminBBSMasterDAO.checkExistUser2(adminBlogVO);
		return userBlog;
	}
	
	@Override
	public void insertBoardBlogUserRqst(AdminBlogUser adminBlogUser) {
		adminBBSMasterDAO.insertBoardBlogUserRqst(adminBlogUser);
	}
	
	@Override
	public void insertBlogMaster(AdminBlog adminBlog) throws FdlException {
		adminBBSMasterDAO.insertBlogMaster(adminBlog);
	}
	
	@Override
	public AdminBlogVO selectBlogDetail(AdminBlogVO adminBlogVO) throws Exception {
		AdminBlogVO resultVO = adminBBSMasterDAO.selectBlogDetail(adminBlogVO);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
	}

	@Override
	public List<AdminBlogVO> selectBlogListPortlet(AdminBlogVO adminBlogVO) throws Exception{
		return adminBBSMasterDAO.selectBlogListPortlet(adminBlogVO);
	}

	@Override
	public List<AdminBoardMasterVO> selectBBSListPortlet(AdminBoardMasterVO adminBoardMasterVO) throws Exception {
		return adminBBSMasterDAO.selectBBSListPortlet(adminBoardMasterVO);
	}
	
}
