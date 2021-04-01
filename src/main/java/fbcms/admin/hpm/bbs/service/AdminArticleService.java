package fbcms.admin.hpm.bbs.service;

import java.util.List;
import java.util.Map;

import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;

public interface AdminArticleService {

	Map<String, Object> selectArticleList(AdminBoardVO adminBoardVO);
	
	Map<String, Object> selectArticleListExcel(AdminBoardVO adminBoardVO);

	AdminBoardVO selectArticleDetail(AdminBoardVO adminBoardVO);
	
	void insertArticle(AdminBoard adminBoard) throws FdlException;

	void updateArticle(AdminBoard adminBoard);

	void deleteArticle(AdminBoard adminBoard) throws Exception;

	List<AdminBoardVO> selectNoticeArticleList(AdminBoardVO adminBoardVO);
	
	Map<String, Object> selectGuestArticleList(AdminBoardVO adminBoardVO);
	
	/* 블로그 관련  */
	AdminBoardVO selectArticleCnOne(AdminBoardVO adminBoardVO);
	
	List<AdminBoardVO> selectBlogNmList(AdminBoardVO adminBoardVO);
	
	Map<String, Object> selectBlogListManager(AdminBoardVO adminBoardVO);
	
	List<AdminBoardVO> selectArticleDetailDefault(AdminBoardVO adminBoardVO);
	
	int selectArticleDetailDefaultCnt(AdminBoardVO adminBoardVO);
	
	List<AdminBoardVO> selectArticleDetailCn(AdminBoardVO adminBoardVO);
	
	int selectLoginUser(AdminBoardVO adminBoardVO);
	
	/* 커스텀 추가 */
	Map<String, Object> selectJACList(AdminBoardVO adminBoardVO);

	AdminBoardVO selectJACDetail(AdminBoardVO adminBoardVO);

	AdminBoardVO searchJACInfo(AdminBoardVO adminBoardVO);
	
	int selectArticleCurRownum(AdminBoardVO adminBoardVO);

	AdminBoardVO selectArticlePre(AdminBoardVO adminBoardVO);

	AdminBoardVO selectArticleNext(AdminBoardVO adminBoardVO);

	AdminBoardVO selectArticleReply(AdminBoardVO adminBoardVO);
	
	Map<String, Object> selectSPCList(AdminBoardVO adminBoardVO);

	AdminBoardVO selectSPCDetail(AdminBoardVO adminBoardVO);

	AdminBoardVO searchSPCInfo(AdminBoardVO adminBoardVO);

	List<CmmnDetailCodeVO> selectCmmDetailList(CmmnDetailCodeVO cmmnDetailCodeVO);
	
	void insertSPC(AdminBoard adminBoard) throws FdlException;
	
	Map<String, Object> selectSPCChildList(AdminBoardVO adminBoardVO);

	void updateSPC(AdminBoard adminBoard);

	AdminBoardVO selectTRMDetail(AdminBoardVO adminBoardVO);
	
	void insertTRM(AdminBoard adminBoard) throws FdlException;
	
	Map<String, Object> selectTRMChildList(AdminBoardVO adminBoardVO);

	void updateTRM(AdminBoard adminBoard);
}
