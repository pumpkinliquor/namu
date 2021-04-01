package fbcms.admin.hpm.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.sym.ccm.cde.service.CmmnDetailCodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;

@Service("AdminArticleService")
public class AdminArticleServiceImpl extends EgovAbstractServiceImpl implements AdminArticleService {

	@Resource(name = "AdminArticleDAO")
    private AdminArticleDAO adminArticleDAO;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "egovNttIdGnrService")
    private EgovIdGnrService nttIdgenService;
	
	@Override
	public Map<String, Object> selectArticleList(AdminBoardVO adminBoardVO) {
		
		List<?> resultList = adminArticleDAO.selectArticleList(adminBoardVO);
		int resultCnt = adminArticleDAO.selectArticleListCnt(adminBoardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", resultList);
		map.put("resultCnt", Integer.toString(resultCnt));

		return map;
	}
	
	@Override
	public Map<String, Object> selectArticleListExcel(AdminBoardVO adminBoardVO) {
		
		List<?> resultListExcel = adminArticleDAO.selectArticleListExcel(adminBoardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultListExcel", resultListExcel);

		return map;
	}

	@Override
	public AdminBoardVO selectArticleDetail(AdminBoardVO adminBoardVO) {
		
	    int iniqireCo = adminArticleDAO.selectMaxInqireCo(adminBoardVO);

	    adminBoardVO.setInqireCo(iniqireCo);
	    adminArticleDAO.updateInqireCo(adminBoardVO);

		return adminArticleDAO.selectArticleDetail(adminBoardVO);
	}
	
	@Override
	public AdminBoardVO selectArticleCnOne(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleCnOne(adminBoardVO);
	}
	
	@Override
	public List<AdminBoardVO> selectArticleDetailDefault(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleDetailDefault(adminBoardVO);
	}
	
	@Override
	public int selectArticleDetailDefaultCnt(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleDetailDefaultCnt(adminBoardVO);
	}
	
	@Override
	public List<AdminBoardVO> selectArticleDetailCn(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleDetailCn(adminBoardVO);
	}

	@Override
	public void insertArticle(AdminBoard adminBoard) throws FdlException {
		
		if ("Y".equals(adminBoard.getReplyAt())) {
		    // 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
		    // replyLc는 부모글의 ReplyLc + 1
			adminBoard.setNttId(nttIdgenService.getNextIntegerId()); // 답글에 대한 nttId 생성
		    adminArticleDAO.replyArticle(adminBoard);
		} else {
		    // 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
			// 1211 수정사항: 입사지원내역(BBSMSTR_000000000010)
			// 입사지원의 경우에는 parnts를 변경하지 않는다.
			if(!"BBSMSTR_000000000010".equals(adminBoard.getBbsId())) {
				adminBoard.setParnts("0");
			}
			adminBoard.setReplyLc("0");
			adminBoard.setReplyAt("N");
			adminBoard.setNttId(nttIdgenService.getNextIntegerId());

		    adminArticleDAO.insertArticle(adminBoard);
		}
		
		// 검색 태그 값이 있는 경우 처리
		if(!adminBoard.getTagNmList().equals("")) {
			String[] arrTagNm = adminBoard.getTagNmList().split(",");
			adminArticleDAO.deleteTagNm(adminBoard);
			for (String tagNm : arrTagNm) {
				AdminBoard tagNmBoard = new AdminBoard();
				tagNmBoard.setTagNm(tagNm);
				tagNmBoard.setNttId(adminBoard.getNttId());
				adminArticleDAO.insertTagNm(tagNmBoard);
			}
		}
	}

	@Override
	public void updateArticle(AdminBoard adminBoard) {
		
		adminArticleDAO.updateArticle(adminBoard);
		
		// 검색 태그 값이 있는 경우 처리
		if(!adminBoard.getTagNmList().equals("")) {
			String[] arrTagNm = adminBoard.getTagNmList().split(",");
			adminArticleDAO.deleteTagNm(adminBoard);
			for (String tagNm : arrTagNm) {
				AdminBoard tagNmBoard = new AdminBoard();
				tagNmBoard.setTagNm(tagNm.trim());
				tagNmBoard.setNttId(adminBoard.getNttId());
				if(!tagNm.equals("")) {
					adminArticleDAO.insertTagNm(tagNmBoard);
				}
			}
		}
	}

	@Override
	public void deleteArticle(AdminBoard adminBoard) throws Exception {
		
		FileVO fvo = new FileVO();
		fvo.setAtchFileId(adminBoard.getAtchFileId());
		adminBoard.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		adminArticleDAO.deleteArticle(adminBoard);

		if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
		    fileService.deleteAllFileInf(fvo);
		}
	}

	@Override
	public List<AdminBoardVO> selectNoticeArticleList(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectNoticeArticleList(adminBoardVO);
	}
	
	@Override
	public List<AdminBoardVO> selectBlogNmList(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectBlogNmList(adminBoardVO);
	}

	@Override
	public Map<String, Object> selectGuestArticleList(AdminBoardVO vo) {
		
		List<?> list = adminArticleDAO.selectGuestArticleList(vo);
		int cnt = adminArticleDAO.selectGuestArticleListCnt(vo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	@Override
	public int selectLoginUser(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectLoginUser(adminBoardVO);
	}
	
	@Override
	public Map<String, Object> selectBlogListManager(AdminBoardVO vo) {
		
		List<?> result = adminArticleDAO.selectBlogListManager(vo);
		int cnt = adminArticleDAO.selectBlogListManagerCnt(vo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
	
	@Override
	public Map<String, Object> selectJACList(AdminBoardVO adminBoardVO) {
		
		List<?> resultList = adminArticleDAO.selectJACList(adminBoardVO);
		int resultCnt = adminArticleDAO.selectJACListCnt(adminBoardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", resultList);
		map.put("resultCnt", Integer.toString(resultCnt));

		return map;
	}

	@Override
	public AdminBoardVO selectJACDetail(AdminBoardVO adminBoardVO) {
		
	    int iniqireCo = adminArticleDAO.selectMaxInqireCo(adminBoardVO);

	    adminBoardVO.setInqireCo(iniqireCo);
	    adminArticleDAO.updateInqireCo(adminBoardVO);

		return adminArticleDAO.selectJACDetail(adminBoardVO);
	}

	@Override
	public AdminBoardVO searchJACInfo(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.searchJACInfo(adminBoardVO);
	}

	@Override
	public int selectArticleCurRownum(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleCurRownum(adminBoardVO);
	}

	@Override
	public AdminBoardVO selectArticlePre(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticlePre(adminBoardVO);
	}

	@Override
	public AdminBoardVO selectArticleNext(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleNext(adminBoardVO);
	}

	@Override
	public AdminBoardVO selectArticleReply(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.selectArticleReply(adminBoardVO);
	}
	
	@Override
	public Map<String, Object> selectSPCList(AdminBoardVO adminBoardVO) {
		
		List<?> resultList = adminArticleDAO.selectSPCList(adminBoardVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", resultList);
		
		return map;
	}

	@Override
	public AdminBoardVO selectSPCDetail(AdminBoardVO adminBoardVO) {
		
	    int iniqireCo = adminArticleDAO.selectMaxInqireCo(adminBoardVO);

	    adminBoardVO.setInqireCo(iniqireCo);
	    adminArticleDAO.updateInqireCo(adminBoardVO);

		return adminArticleDAO.selectSPCDetail(adminBoardVO);
	}

	@Override
	public AdminBoardVO searchSPCInfo(AdminBoardVO adminBoardVO) {
		
		return adminArticleDAO.searchSPCInfo(adminBoardVO);
	}

	@Override
	public List<CmmnDetailCodeVO> selectCmmDetailList(CmmnDetailCodeVO cmmnDetailCodeVO) {
		
		return adminArticleDAO.selectCmmDetailList(cmmnDetailCodeVO);
	}

	@Override
	public void insertSPC(AdminBoard adminBoard) throws FdlException {
		
		adminBoard.setReplyLc("0");
		adminBoard.setReplyAt("N");
		adminBoard.setNttId(nttIdgenService.getNextIntegerId());
		
	    adminArticleDAO.insertSPC(adminBoard);
	}
	
	@Override
	public Map<String, Object> selectSPCChildList(AdminBoardVO adminBoardVO) {
		
		List<?> resultList = adminArticleDAO.selectSPCChildList(adminBoardVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", resultList);
		
		return map;
	}

	@Override
	public void updateSPC(AdminBoard adminBoard) {
		
		adminArticleDAO.updateSPC(adminBoard);
	}

	@Override
	public AdminBoardVO selectTRMDetail(AdminBoardVO adminBoardVO) {
		
	    int iniqireCo = adminArticleDAO.selectMaxInqireCo(adminBoardVO);

	    adminBoardVO.setInqireCo(iniqireCo);
	    adminArticleDAO.updateInqireCo(adminBoardVO);

		return adminArticleDAO.selectTRMDetail(adminBoardVO);
	}

	@Override
	public void insertTRM(AdminBoard adminBoard) throws FdlException {
		
		adminBoard.setReplyLc("0");
		adminBoard.setReplyAt("N");
		adminBoard.setNttId(nttIdgenService.getNextIntegerId());
		
	    adminArticleDAO.insertTRM(adminBoard);
	}
	
	@Override
	public Map<String, Object> selectTRMChildList(AdminBoardVO adminBoardVO) {
		
		List<?> resultList = adminArticleDAO.selectTRMChildList(adminBoardVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultList", resultList);
		
		return map;
	}

	@Override
	public void updateTRM(AdminBoard adminBoard) {
		
		adminArticleDAO.updateTRM(adminBoard);
	}
}
