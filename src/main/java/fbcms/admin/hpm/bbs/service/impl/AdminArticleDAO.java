package fbcms.admin.hpm.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;

@Repository("AdminArticleDAO")
public class AdminArticleDAO extends EgovComAbstractDAO {

	@SuppressWarnings("deprecation")
	public List<?> selectArticleList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectArticleList", adminBoardVO);
	}

	public int selectArticleListCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectArticleListCnt", adminBoardVO);
	}

	@SuppressWarnings("deprecation")
	public List<?> selectArticleListExcel(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectArticleListExcel", adminBoardVO);
	}

	public int selectMaxInqireCo(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectMaxInqireCo", adminBoardVO);
	}

	public void updateInqireCo(AdminBoardVO adminBoardVO) {
		update("AdminBBSArticle.updateInqireCo", adminBoardVO);
	}

	public AdminBoardVO selectArticleDetail(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectArticleDetail", adminBoardVO);
	}
	
	public void replyArticle(AdminBoard adminBoard) {
		insert("AdminBBSArticle.replyArticle", adminBoard);
	}

	public void insertArticle(AdminBoard adminBoard) {
		insert("AdminBBSArticle.insertArticle", adminBoard);
	}

	public void updateArticle(AdminBoard adminBoard) {
		update("AdminBBSArticle.updateArticle", adminBoard);
	}

	public void deleteArticle(AdminBoard adminBoard) {
		update("AdminBBSArticle.deleteArticle", adminBoard);
	}

	public void deleteTagNm(AdminBoard adminBoard) {
		delete("AdminBBSArticle.deleteTagNm", adminBoard);
	}

	public void insertTagNm(AdminBoard adminBoard) {
		insert("AdminBBSArticle.insertTagNm", adminBoard);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<AdminBoardVO> selectNoticeArticleList(AdminBoardVO adminBoardVO) {
		return (List<AdminBoardVO>) list("AdminBBSArticle.selectNoticeArticleList", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectGuestArticleList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectGuestArticleList", adminBoardVO);
	}

	public int selectGuestArticleListCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectGuestArticleListCnt", adminBoardVO);
	}
	
	/* 블로그 관련 */
	public AdminBoardVO selectArticleCnOne(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectArticleCnOne", adminBoardVO);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBoardVO> selectBlogNmList(AdminBoardVO adminBoardVO) {
		return (List<AdminBoardVO>) list("AdminBBSArticle.selectBlogNmList", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectBlogListManager(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectBlogListManager", adminBoardVO);
	}
	
	public int selectBlogListManagerCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectBlogListManagerCnt", adminBoardVO);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBoardVO> selectArticleDetailDefault(AdminBoardVO adminBoardVO) {
		return (List<AdminBoardVO>) list("BBSArticle.selectArticleDetailDefault", adminBoardVO);
	}
	
	public int selectArticleDetailDefaultCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectArticleDetailDefaultCnt", adminBoardVO);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AdminBoardVO> selectArticleDetailCn(AdminBoardVO adminBoardVO) {
		return (List<AdminBoardVO>) list("AdminBBSArticle.selectArticleDetailCn", adminBoardVO);
	}
	
	public int selectLoginUser(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectLoginUser", adminBoardVO);
	}
	
	/* 커스텀 추가 */
	@SuppressWarnings("deprecation")
	public List<?> selectJACList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectJACList", adminBoardVO);
	}

	public int selectJACListCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectJACListCnt", adminBoardVO);
	}

	public AdminBoardVO selectJACDetail(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectJACDetail", adminBoardVO);
	}

	public AdminBoardVO searchJACInfo(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.searchJACInfo", adminBoardVO);
	}
	
	public int selectArticleCurRownum(AdminBoardVO adminBoardVO) {
		return (int) selectOne("AdminBBSArticle.selectArticleCurRownum", adminBoardVO);
	}

	public AdminBoardVO selectArticlePre(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectArticlePre", adminBoardVO);
	}

	public AdminBoardVO selectArticleNext(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectArticleNext", adminBoardVO);
	}

	public AdminBoardVO selectArticleReply(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectArticleReply", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectSPCList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectSPCList", adminBoardVO);
	}

	public int selectSPCListCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectSPCListCnt", adminBoardVO);
	}

	public AdminBoardVO selectSPCDetail(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectSPCDetail", adminBoardVO);
	}

	public AdminBoardVO searchSPCInfo(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.searchSPCInfo", adminBoardVO);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<CmmnDetailCodeVO> selectCmmDetailList(CmmnDetailCodeVO cmmnDetailCodeVO) {
		return (List<CmmnDetailCodeVO>) list("AdminBBSArticle.selectCmmDetailList", cmmnDetailCodeVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectMiniboardList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectMiniboardList", adminBoardVO);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectMiniboardMainManageList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectMiniboardMainManageList", adminBoardVO);
	}

	public void insertSPC(AdminBoard adminBoard) {
		insert("AdminBBSArticle.insertSPC", adminBoard);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectSPCChildList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectSPCChildList", adminBoardVO);
	}

	public void updateSPC(AdminBoard adminBoard) {
		update("AdminBBSArticle.updateSPC", adminBoard);
	}

	public AdminBoardVO selectTRMDetail(AdminBoardVO adminBoardVO) {
		return (AdminBoardVO) selectOne("AdminBBSArticle.selectTRMDetail", adminBoardVO);
	}

	public void insertTRM(AdminBoard adminBoard) {
		insert("AdminBBSArticle.insertTRM", adminBoard);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectTRMChildList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectTRMChildList", adminBoardVO);
	}

	public void updateTRM(AdminBoard adminBoard) {
		update("AdminBBSArticle.updateTRM", adminBoard);
	}
	
	@SuppressWarnings("deprecation")
	public List<?> selectCSTList(AdminBoardVO adminBoardVO) {
		return list("AdminBBSArticle.selectCSTList", adminBoardVO);
	}

	public int selectCSTListCnt(AdminBoardVO adminBoardVO) {
		return (Integer)selectOne("AdminBBSArticle.selectCSTListCnt", adminBoardVO);
	}
}
