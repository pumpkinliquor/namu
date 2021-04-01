package fbcms.com.cop.cmt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import fbcms.admin.hpm.bbs.service.AdminBoardMaster;
import fbcms.admin.hpm.bbs.service.AdminBoardMasterVO;
import fbcms.admin.hpm.bbs.service.impl.AdminBBSAddedOptionsDAO;
import fbcms.com.cop.cmt.service.ComArticleComment;
import fbcms.com.cop.cmt.service.ComArticleCommentVO;
import fbcms.com.cop.cmt.service.ComArticleCommentService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("ComArticleCommentService")
public class ComArticleCommentServiceImpl extends EgovAbstractServiceImpl implements ComArticleCommentService {

    @Resource(name = "AdminBBSAddedOptionsDAO")
    private AdminBBSAddedOptionsDAO addedOptionsDAO;

    @Resource(name = "ComArticleCommentDAO")
    private ComArticleCommentDAO comArticleCommentDao;
    
    @Resource(name = "egovAnswerNoGnrService")
    private EgovIdGnrService egovAnswerNoGnrService;

    /**
     * 댓글 사용 가능 여부를 확인한다.
     */
    public boolean canUseComment(String bbsId) throws Exception {
	//String flag = EgovProperties.getProperty("Globals.addedOptions");
	//if (flag != null && flag.trim().equalsIgnoreCase("true")) {//2011.09.15
    	AdminBoardMaster vo = new AdminBoardMaster();
	    
	    vo.setBbsId(bbsId);
	    
	    AdminBoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(vo);
	    
	    if (options == null) {
		return false;
	    }
	    
	    if (options.getCommentAt().equals("Y")) {
		return true;
	    }
	//}
	
	return false;
    }    
	
	@Override
	public Map<String, Object> selectArticleCommentList(ComArticleCommentVO comArticleCommentVO) {
		List<?> result = comArticleCommentDao.selectArticleCommentList(comArticleCommentVO);
		int cnt = comArticleCommentDao.selectArticleCommentListCnt(comArticleCommentVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}


	@Override
	public void insertArticleComment(ComArticleComment comArticleComment) throws FdlException {
		comArticleComment.setCommentNo(egovAnswerNoGnrService.getNextLongId() + "");//2011.10.18
		comArticleCommentDao.insertArticleComment(comArticleComment);
	}


	@Override
	public void deleteArticleComment(ComArticleCommentVO comArticleCommentVO) {
		comArticleCommentDao.deleteArticleComment(comArticleCommentVO);
	}


	@Override
	public ComArticleCommentVO selectArticleCommentDetail(ComArticleCommentVO comArticleCommentVO) {
		return comArticleCommentDao.selectArticleCommentDetail(comArticleCommentVO);
	}


	@Override
	public void updateArticleComment(ComArticleComment comArticleComment) {
		comArticleCommentDao.updateArticleComment(comArticleComment);
	}

}
