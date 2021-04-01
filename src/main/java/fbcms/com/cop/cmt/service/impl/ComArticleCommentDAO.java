package fbcms.com.cop.cmt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.com.cop.cmt.service.ComArticleComment;
import fbcms.com.cop.cmt.service.ComArticleCommentVO;

@Repository("ComArticleCommentDAO")
public class ComArticleCommentDAO extends EgovComAbstractDAO{

	@SuppressWarnings("deprecation")
	public List<?> selectArticleCommentList(ComArticleCommentVO comArticleCommentVO) {
		return list("ArticleComment.selectArticleCommentList", comArticleCommentVO);
	}

	public int selectArticleCommentListCnt(ComArticleCommentVO comArticleCommentVO) {
		return (Integer)selectOne("ArticleComment.selectArticleCommentListCnt", comArticleCommentVO);
	}

	public void insertArticleComment(ComArticleComment comArticleComment) {
		insert("ArticleComment.insertArticleComment", comArticleComment);
	}

	public void deleteArticleComment(ComArticleCommentVO comArticleCommentVO) {
		update("ArticleComment.deleteArticleComment", comArticleCommentVO);
	}

	public ComArticleCommentVO selectArticleCommentDetail(ComArticleCommentVO comArticleCommentVO) {
		return (ComArticleCommentVO) selectOne("ArticleComment.selectArticleCommentDetail", comArticleCommentVO);
	}

	public void updateArticleComment(ComArticleComment comArticleComment) {
		update("ArticleComment.updateArticleComment", comArticleComment);
	}

}
