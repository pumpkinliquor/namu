package fbcms.admin.hpm.faq.service;

import java.util.List;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface AdminFaqService {

	List<?> selectFaqList(AdminFaqVO adminFaqVO);

	int selectFaqListCnt(AdminFaqVO adminFaqVO);

	AdminFaqVO selectFaqDetail(AdminFaqVO adminFaqVO) throws Exception;

	void insertFaq(AdminFaqVO adminFaqVO) throws FdlException;

	void updateFaq(AdminFaqVO adminFaqVO);

	void deleteFaq(AdminFaqVO adminFaqVO);

}
