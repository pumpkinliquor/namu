package fbcms.admin.hpm.faq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import fbcms.admin.hpm.faq.service.AdminFaqService;
import fbcms.admin.hpm.faq.service.AdminFaqVO;

@Service("AdminFaqService")
public class AdminFaqServiceImpl extends EgovAbstractServiceImpl implements AdminFaqService {

	@Resource(name = "AdminFaqDAO")
	private AdminFaqDAO adminFaqDAO;

	/** ID Generation */
	@Resource(name = "egovFaqManageIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Override
	public List<?> selectFaqList(AdminFaqVO adminFaqVO) {
		
		return adminFaqDAO.selectFaqList(adminFaqVO);
	}

	@Override
	public int selectFaqListCnt(AdminFaqVO adminFaqVO) {
		
		return adminFaqDAO.selectFaqListCnt(adminFaqVO);
	}

	@Override
	public AdminFaqVO selectFaqDetail(AdminFaqVO adminFaqVO) throws Exception {
		
		//조회수 증가
		adminFaqDAO.updateFaqInqireCo(adminFaqVO);
		
		AdminFaqVO resultVO = adminFaqDAO.selectFaqDetail(adminFaqVO);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	@Override
	public void insertFaq(AdminFaqVO adminFaqVO) throws FdlException {
		
		String faqId = idgenService.getNextStringId();
		adminFaqVO.setFaqId(faqId);
		adminFaqDAO.insertFaq(adminFaqVO);
		
		// 검색 태그 값이 있는 경우 처리
		if(!adminFaqVO.getTagNmList().equals("")) {
			String[] arrTagNm = adminFaqVO.getTagNmList().split(",");
			adminFaqDAO.deleteTagNm(adminFaqVO);
			for (String tagNm : arrTagNm) {
				AdminFaqVO tagNmBoard = new AdminFaqVO();
				tagNmBoard.setTagNm(tagNm.trim());
				tagNmBoard.setFaqId(adminFaqVO.getFaqId());
				if(!tagNm.equals("")) {
					adminFaqDAO.insertTagNm(tagNmBoard);
				}
			}
		}
	}

	@Override
	public void updateFaq(AdminFaqVO adminFaqVO) {
		
		adminFaqDAO.updateFaq(adminFaqVO);
		
		// 검색 태그 값이 있는 경우 처리
		if(!adminFaqVO.getTagNmList().equals("")) {
			String[] arrTagNm = adminFaqVO.getTagNmList().split(",");
			adminFaqDAO.deleteTagNm(adminFaqVO);
			for (String tagNm : arrTagNm) {
				AdminFaqVO tagNmBoard = new AdminFaqVO();
				tagNmBoard.setTagNm(tagNm.trim());
				tagNmBoard.setFaqId(adminFaqVO.getFaqId());
				if(!tagNm.equals("")) {
					adminFaqDAO.insertTagNm(tagNmBoard);
				}
			}
		}
	}

	@Override
	public void deleteFaq(AdminFaqVO adminFaqVO) {
		
		adminFaqDAO.deleteFaq(adminFaqVO);
	}
}
