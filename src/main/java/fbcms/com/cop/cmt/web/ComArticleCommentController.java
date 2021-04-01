package fbcms.com.cop.cmt.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.com.cop.cmt.service.ComArticleComment;
import fbcms.com.cop.cmt.service.ComArticleCommentVO;
import fbcms.com.cop.cmt.service.ComArticleCommentService;

/**
 * 댓글 관리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 신용호
 * @since 2016.07.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2016.07.22   신용호              최초 생성
 *   2018.06.27     신용호		    댓글 등록후 처리 예외 수정
 * </pre>
 */

@Controller
public class ComArticleCommentController {

	@Resource(name = "ComArticleCommentService")
    protected ComArticleCommentService comArticleCommentService;
    
    @Resource(name="propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Autowired
    private DefaultBeanValidator beanValidator;
    
    //protected Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 댓글관리 목록 조회를 제공한다.
     * 
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/selectArticleCommentList.do")
    public String selectArticleCommentList(@ModelAttribute("searchVO") ComArticleCommentVO commentVO, ModelMap model) throws Exception {

    	ComArticleCommentVO articleCommentVO = new ComArticleCommentVO();
    	
		// 수정 처리된 후 댓글 등록 화면으로 처리되기 위한 구현
		if (commentVO.isModified()) {
		    commentVO.setCommentNo("");
		    commentVO.setCommentCn("");
		}
		
		// 수정을 위한 처리
		if (!commentVO.getCommentNo().equals("")) {
		    return "forward:/cop/cmt/updateArticleCommentView.do";
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
   	 	// KISA 보안취약점 조치 (2018-12-10, 신용호)
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if(!isAuthenticated) {
            return "fbcms/admin/lgn/adminLogin";
        }
		
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		commentVO.setWrterNm(user.getName());
		
//		commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
//		commentVO.setSubPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
		paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
		paginationInfo.setPageSize(commentVO.getSubPageSize());
	
		commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
		commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
		commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = comArticleCommentService.selectArticleCommentList(commentVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("type", "body");	// 댓글 페이지 body import용
		
		model.addAttribute("articleCommentVO", articleCommentVO);	// validator 용도 
		
		commentVO.setCommentCn("");	// 등록 후 댓글 내용 처리
	
		return "/com/cop/cmt/EgovArticleCommentList";
    }
    
    
    /**
     * 댓글을 등록한다.
     * 
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/insertArticleComment.do")
    public String insertArticleComment(@RequestParam HashMap<String, String> map
    		, @ModelAttribute("searchVO") ComArticleCommentVO commentVO
    		, @ModelAttribute("comment") ComArticleComment comment
    		, BindingResult bindingResult
    		, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(comment, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("msg", "댓글내용은 필수 입력값입니다.");
		    
		    return "forward:/cop/bbs/selectArticleDetail.do";
		}
	
		if (isAuthenticated) {
		    comment.setFrstRegisterId(user.getUniqId());
		    comment.setWrterId(user.getUniqId());
		    comment.setWrterNm(user.getName());
		    
		    
		    comArticleCommentService.insertArticleComment(comment);
		    
		    commentVO.setCommentCn("");
		    commentVO.setCommentNo("");
		}
		
		String chkBlog = map.get("blogAt");
		
		if("Y".equals(chkBlog)){
			return "forward:/cop/bbs/selectArticleBlogList.do";
		}else{
			return "forward:/cop/bbs/selectArticleDetail.do";
		}
		
    }
    
    
    /**
     * 댓글을 삭제한다.
     * 
     * @param commentVO
     * @param comment
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/deleteArticleComment.do")
    public String deleteArticleComment(@ModelAttribute("searchVO") ComArticleCommentVO commentVO, @ModelAttribute("comment") ComArticleComment comment, 
    		ModelMap model, @RequestParam HashMap<String, String> map) throws Exception {
		@SuppressWarnings("unused")
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
		    comArticleCommentService.deleteArticleComment(commentVO);
		}
		
		commentVO.setCommentCn("");
		commentVO.setCommentNo("");
		
		String chkBlog = map.get("blogAt");
		
		if("Y".equals(chkBlog)){
			return "forward:/cop/bbs/selectArticleBlogList.do";
		}else{
			return "forward:/cop/bbs/selectArticleDetail.do";
		}
    }
    
    
    /**
     * 댓글 수정 페이지로 이동한다.
     * 
     * @param commentVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/updateArticleCommentView.do")
    public String updateArticleCommentView(@ModelAttribute("searchVO") ComArticleCommentVO commentVO, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 //KISA 보안취약점 조치 (2018-12-10, 신용호)
    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    if(!isAuthenticated) {
        return "fbcms/admin/lgn/adminLogin";
    }

	ComArticleCommentVO articleCommentVO = new ComArticleCommentVO();
	
	commentVO.setWrterNm(user.getName());

	commentVO.setSubPageUnit(propertyService.getInt("pageUnit"));
	commentVO.setSubPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
	paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
	paginationInfo.setPageSize(commentVO.getSubPageSize());

	commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
	commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
	commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = comArticleCommentService.selectArticleCommentList(commentVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultListTotCnt", totCnt);
	model.addAttribute("paginationInfo", paginationInfo);
	model.addAttribute("type", "body");	// body import
	
	articleCommentVO = comArticleCommentService.selectArticleCommentDetail(commentVO);
	
	model.addAttribute("articleCommentVO", articleCommentVO);
	
	
	return "fbcms/com/cop/cmt/EgovArticleCommentList";
    }
    
    
    /**
     * 댓글을 수정한다.
     * 
     * @param commentVO
     * @param comment
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmt/updateArticleComment.do")
    public String updateArticleComment(@ModelAttribute("searchVO") ComArticleCommentVO commentVO, @ModelAttribute("comment") ComArticleComment comment, 
	    BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(comment, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("msg", "내용은 필수 입력 값입니다.");
		    
		    return "forward:/cop/bbs/selectArticleDetail.do";
		}
	
		if (isAuthenticated) {
		    comment.setLastUpdusrId(user.getUniqId());
		    
		    comArticleCommentService.updateArticleComment(comment);
		    
		    commentVO.setCommentCn("");
		    commentVO.setCommentNo("");
		}
	
		return "forward:/cop/bbs/selectArticleDetail.do";
    }
    
	
}
