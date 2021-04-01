package fbcms.admin.mbm.dur.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dsjdf.jdf.DateTime;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.mbm.dur.service.AdminDURService;
import fbcms.user.drop.DropMemberVO;

/**
 * 탈퇴 회원정보 컨트롤러 클래스
 * @author 박원준
 * @since 2020.10.26
 */
@Controller
public class AdminDURController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminDURController.class);
	@Autowired
	private AdminDURService adminDURService;
	
	/**
	 * 탈퇴 회원 정보 리스트
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/mbm/dur/selectDURList.do")
	public String selectDURList(ModelMap model,@ModelAttribute("dropMemberVO") DropMemberVO dropMemberVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(dropMemberVO.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(dropMemberVO.getPageUnit());		
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(dropMemberVO.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		dropMemberVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		dropMemberVO.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		dropMemberVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = adminDURService.selectMemberListTotCnt(dropMemberVO);
		paginationInfo.setTotalRecordCount(totCnt);
						
		
		// 탈퇴회원 리스트 가져오기 
		List<DropMemberVO> dropMemberList = adminDURService.selectDURList(dropMemberVO);
		model.addAttribute("dropMemberList", dropMemberList);
		model.addAttribute("dropMemberListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "admin/mbm/dur/adminDURList";
	}
	
	/**
	 * 탈퇴 회원 리스트 엑셀다운
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/mbm/dur/selectDURListExcel.do")
	public ModelAndView selectDURListExcel(@ModelAttribute("dropMemberVO") DropMemberVO dropMemberVO, ModelMap model) throws Exception {
		// 전체 리스트 가져오기 
		int totCnt = adminDURService.selectMemberListTotCnt(dropMemberVO);
		dropMemberVO.setFirstIndex(0);
		dropMemberVO.setRecordCountPerPage(totCnt);
		
		List<DropMemberVO> dropMemberList = adminDURService.selectDURList(dropMemberVO);
		
	    ModelAndView mav = new ModelAndView("excelView");
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    // List Data 만들기
	    List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	    
	    for(int i = 0; i < dropMemberList.size(); i++) {
	    	HashMap<String, Object> pMap = new HashMap<String, Object>();
	    	DropMemberVO dataVO = dropMemberList.get(i);
	    	
	    	pMap.put("USER_ID", dataVO.getUSER_ID());		// 아이디
	    	pMap.put("USER_RES", dataVO.getDROP_RESN_CD());		// 탈퇴사유
	    	pMap.put("DROP_DATE", dataVO.getDROP_DT());	// 탈퇴일
	    	    
		    list.add(i, pMap);
	    }
	    
	    String filename = "탈퇴회원 리스트_" + DateTime.getDateString();
	    String[] columnArr = {"번호", "아이디", "탈퇴사유", "탈퇴일"};
	    String[] columnVarArr = {"idx", "USER_ID", "USER_RES", "DROP_DATE"};
	    
	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "탈퇴 회원 리스트");    
	    dataMap.put("list", list);
	    
	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);
	    
	    return mav;
	}
}