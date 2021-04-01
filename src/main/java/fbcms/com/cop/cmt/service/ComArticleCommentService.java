package fbcms.com.cop.cmt.service;

import java.util.Map;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface ComArticleCommentService {

    public boolean canUseComment(String bbsId) throws Exception;

    Map<String, Object> selectArticleCommentList(ComArticleCommentVO commentVO);

	void insertArticleComment(ComArticleComment comment) throws FdlException;

	void deleteArticleComment(ComArticleCommentVO commentVO);

	ComArticleCommentVO selectArticleCommentDetail(ComArticleCommentVO commentVO);

	void updateArticleComment(ComArticleComment comment);

}
