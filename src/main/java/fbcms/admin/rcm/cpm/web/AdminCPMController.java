package fbcms.admin.rcm.cpm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dsjdf.jdf.DateTime;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import fbcms.admin.rcm.cpm.service.AdminCPMService;
import fbcms.admin.rcm.cpm.service.impl.CheckupVO;

/**
 * 검진 프로그램관리 컨트롤러
 * @author 김명진
 * @since 2020.10.08
 */
@Controller
public class AdminCPMController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCPMController.class);
	@Autowired
	private AdminCPMService adminCPMService;
	
	/**
	 * 검진 프로그램 리스트
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/selectCPMList.do")
	public String selectCPMList(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 검진 프로그램 리스트 가져오기
		List<CheckupVO> checkupList = adminCPMService.selectCPMList(checkupVO);
		
		model.addAttribute("checkupList", checkupList);
		return "admin/rcm/cpm/adminCPMList";
	}

	/**
	 * 검진 프로그램 리스트 엑셀다운
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/rcm/cpm/selectCPMListExcel.do")
	public ModelAndView selectORSListExcel(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		// 검진 프로그램 리스트 가져오기
		List<CheckupVO> checkupList = adminCPMService.selectCPMList(checkupVO);
		
	    ModelAndView mav = new ModelAndView("excelView");
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    // List Data 만들기
	    List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	    
	    for(int i = 0; i < checkupList.size(); i++) {
	    	HashMap<String, Object> pMap = new HashMap<String, Object>();
	    	CheckupVO dataVO = checkupList.get(i);
	    	
	    	pMap.put("DTIL_CD", dataVO.getDTIL_CD());			// 코드
	    	pMap.put("DTIL_CODE_NM", dataVO.getDTIL_CODE_NM());	// 검진프로그램
	    	pMap.put("USE_YN", dataVO.getUSE_YN());				// 사용여부
		    
		    list.add(i, pMap);
	    }
	    
	    String filename = "검진프로그램 리스트_" + DateTime.getDateString();
	    String[] columnArr = {"번호", "코드", "검진프로그램", "사용여부"};
	    String[] columnVarArr = {"idx", "DTIL_CD", "DTIL_CODE_NM", "USE_YN"};
	    
	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "검진프로그램 리스트");    
	    dataMap.put("list", list);
	    
	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);
	    
	    return mav;
	}

	/**
	 * 정렬 순서 수정
	 * @param model
	 * @param doctorVO
	 * @param remodel
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/updateOrderChange.do")
	public String updateOrderChange(ModelMap model, @ModelAttribute("checkupVO") CheckupVO checkupVO, RedirectAttributes remodel, HttpServletRequest request) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String trCount = request.getParameter("trCount");	// 전체 row 수
		
		if(!trCount.isEmpty()) {
			int trCnt = Integer.parseInt(trCount);
			
			for(int i = 0; i < trCnt; i++) {
				if(request.getParameter("seq"+(i+1)+"Order") != null && request.getParameter("seq"+(i+1)+"DtilCd") != null) {
					int ORDER_NO = Integer.parseInt(request.getParameter("seq"+(i+1)+"Order").toString());
					String DTIL_CD = request.getParameter("seq"+(i+1)+"DtilCd");
					
					CheckupVO newVO = new CheckupVO();
					newVO.setORDER_NO(ORDER_NO);
					newVO.setDTIL_CD(DTIL_CD);
					
					// 정렬 순서 저장
					adminCPMService.updateOrderChange(newVO);
				}
			}
		}
		
		return "redirect:/admin/rcm/cpm/selectCPMList.do";
	}

	/**
	 * 검진프로그램 등록 페이지
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/insertCPMView.do")
	public String insertCPMView(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		return "admin/rcm/cpm/adminCPMRegist";
	}
	
	/**
	 * 검진프로그램 등록
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/insertCPM.do")
	public String insertCPM(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 검진프로그램 등록
		int res = adminCPMService.insertCPM(checkupVO);
		if(res == 1) {
			return "redirect:/admin/rcm/cpm/selectCPMList.do";
		}
		
		return "admin/rcm/cpm/adminCPMRegist";
	}
	
	/**
	 * 검진프로그램 수정 페이지 
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/updateCPMView.do")
	public String updateCPMView(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 검진프로그램 상세 가져오기
		checkupVO = adminCPMService.selectCPM(checkupVO);
		
		model.addAttribute("checkupProgramInfo", checkupVO);
		return "admin/rcm/cpm/adminCPMModify";
	}
	
	/**
	 * 검진프로그램 수정
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/updateCPM.do")
	public String updateCPM(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model, @RequestParam(value="DTIL_CD_CRT") String DTIL_CD_CRT) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 검진프로그램 저장
		int res = adminCPMService.updateCPM(checkupVO, DTIL_CD_CRT);
		if(res == 1) {
			return "redirect:/admin/rcm/cpm/selectCPMList.do";
		}
		
		return "admin/rcm/cpm/adminCPMModify";
	}
	
	/**
	 * 검진 프로그램 삭제
	 * @param checkupVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/deleteCPM.do")
	public String deleteCPM(@ModelAttribute("checkupVO") CheckupVO checkupVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 삭제
		adminCPMService.deleteCPM(checkupVO);
		
		return "redirect:/admin/rcm/cpm/selectCPMList.do";
	}

	/**
	 * 검진예약일정 관리 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/tableCPM.do")
	public String tableCPM(HttpServletRequest request, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 검색조건
		String rqYear = request.getParameter("year");
		String rqMonth = request.getParameter("month");
		String year = "";
		String month = "";
		
		if(rqYear == null || rqMonth == null) {
			// 현재기준 년월 추출
			Calendar cal = Calendar.getInstance();
			year = String.format("%02d", cal.get(Calendar.YEAR));
			month = String.format("%02d", cal.get(Calendar.MONTH) + 1);
		} else {
			year = rqYear;
			month = rqMonth;
		}

		// 검진예약일정 조회
		HashMap<String,Object> hMap = new HashMap<String,Object>();
		hMap.put("YEAR", year);
		hMap.put("MONTH", month);
		
		List<HashMap<String,Object>> tableList = adminCPMService.selectTableCPMList(hMap);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("tableList", tableList);
		
		return "admin/rcm/cpm/adminCPMTable";
	}

	/**
	 * 검진예약일정 관리 저장
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/cpm/insertTableCPM.do")
	public String insertTableCPM(HttpServletRequest request, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		HashMap<String,Object> hMap = new HashMap<String,Object>();
		String endDate = request.getParameter("endDate");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		int intEndDate = Integer.parseInt(endDate);
		
		// 날짜별 예약 가능여부 가져오기
		for(int i = 1; i <= intEndDate; i++) {
			hMap.put("display" + String.format("%02d", i).toString(), request.getParameter("display" + String.format("%02d", i).toString()));
		}
		
		hMap.put("year", year);
		hMap.put("month", month);

		// 검진예약일정 삭제 (초기화)
		adminCPMService.deleteTableCPM(hMap);
		// 검진예약일정 저장
		adminCPMService.insertTableCPM(hMap);

		remodel.addAttribute("year", year);
		remodel.addAttribute("month", month);
		return "redirect:/admin/rcm/cpm/tableCPM.do";
	}
}
