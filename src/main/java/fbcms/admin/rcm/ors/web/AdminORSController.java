package fbcms.admin.rcm.ors.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dsjdf.jdf.DateTime;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import fbcms.admin.rcm.ors.service.AdminORSService;
import fbcms.com.cmm.service.CommonCodeVO;
import fbcms.com.cmm.service.CommonService;
import fbcms.user.cts.rsv.service.ReservationVO;


/**
 * 외래 예약관리 컨트롤러
 * @author 김명진
 * @since 2020.10.08
 */
@Controller
public class AdminORSController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminORSController.class);
	
	@Autowired
	private AdminORSService adminORSService;
	@Autowired
	private CommonService commonService;
	
	/**
	 * 외래예약 리스트
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/selectORSList.do")
	public String selectORSList(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date dt = new Date();
		if(reservationVO.getFIRST_ADD_DT() == null) {
			reservationVO.setFIRST_ADD_DT(sdf.format(dt));
		}
		if(reservationVO.getBGN_DATE() == null) {
			reservationVO.setBGN_DATE(sdf.format(dt));
		}
		if(reservationVO.getEND_DATE() == null) {
			reservationVO.setEND_DATE(sdf.format(dt));
		}
		/** paging */
		PaginationInfo paginationInfo = new PaginationInfo();
		/** paging 현재 page */
		paginationInfo.setCurrentPageNo(reservationVO.getPageIndex());
		/** 한페이지 당 게시물 갯수 */
		paginationInfo.setRecordCountPerPage(reservationVO.getPageUnit());
		/** 페이지 리스트에 게시되는 페이지 건수*/
		paginationInfo.setPageSize(reservationVO.getPageSize());
		/**페이징 SQL의 조건절에 사용되는 시작 rownum*/
		reservationVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		/**페이징 SQL의 조건절에 사용되는 마지막 rownum*/
		reservationVO.setLastIndex(paginationInfo.getLastRecordIndex());
		/** 한페이지 당 게시물 갯수 */
		reservationVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = adminORSService.selectORSTotCnt(reservationVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		// 외래예약 리스트 가져오기
		List<ReservationVO> reservationList = adminORSService.selectORSList(reservationVO);
		
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("reservationListTotCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		// 공통코드 가져오기
		CommonCodeVO commCd = new CommonCodeVO();
		
		// 진료과
		commCd.setCOMMON_CODE("MEDI_SBJ_CD");
		List<CommonCodeVO> mediSbjCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("mediSbjCdList", mediSbjCdList);
		
		// 예약상태
		commCd.setCOMMON_CODE("APPO_STAT_CD");
		List<CommonCodeVO> appoStatCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoStatCdList", appoStatCdList);
		

		
		return "admin/rcm/ors/adminORSList";
	}
	
	/**
	 * 외래예약 리스트 엑셀다운
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/rcm/ors/selectORSListExcel.do")
	public ModelAndView selectORSListExcel(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model) throws Exception {
		// 전체 리스트 가져오기 
		int totCnt = adminORSService.selectORSTotCnt(reservationVO);
		reservationVO.setFirstIndex(0);
		reservationVO.setRecordCountPerPage(totCnt);
		
		List<ReservationVO> reservationList = adminORSService.selectORSList(reservationVO);
		
	    ModelAndView mav = new ModelAndView("excelView");
	    Map<String, Object> dataMap = new HashMap<String, Object>();

	    // List Data 만들기
	    List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	    
	    for(int i = 0; i < reservationList.size(); i++) {
	    	HashMap<String, Object> pMap = new HashMap<String, Object>();
	    	ReservationVO dataVO = reservationList.get(i);
	    	
	    	pMap.put("MEDI_SBJ_NM", dataVO.getMEDI_SBJ_NM());	// 진료과
	    	pMap.put("DR_NM", dataVO.getDR_NM());				// 의료진
	    	pMap.put("APPO_PRSN_NM", dataVO.getAPPO_PRSN_NM());	// 예약자
	    	pMap.put("FIRST_ADD_DT", dataVO.getFIRST_ADD_DT());	// 등록일
	    	pMap.put("APPO_DT", dataVO.getAPPO_DT());			// 예약일시
	    	pMap.put("APPO_STAT_NM", dataVO.getAPPO_STAT_NM());	// 상태
		    
		    list.add(i, pMap);
	    }
	    
	    String filename = "외래예약 리스트_" + DateTime.getDateString();
	    String[] columnArr = {"번호", "진료과", "의료진", "예약자", "등록일", "예약일시", "상태"};
	    String[] columnVarArr = {"idx", "MEDI_SBJ_NM", "DR_NM", "APPO_PRSN_NM", "FIRST_ADD_DT", "APPO_DT", "APPO_STAT_NM"};
	    
	    dataMap.put("columnArr", columnArr);
	    dataMap.put("columnVarArr", columnVarArr);
	    dataMap.put("sheetNm", "외래예약 리스트");    
	    dataMap.put("list", list);
	    
	    mav.addObject("dataMap", dataMap);
	    mav.addObject("filename", filename);
	    
	    return mav;
	}
	
	/**
	 * 외래예약 상세
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/selectORSDetail.do")
	public String selectORSDetail(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 외래예약 상세 가져오기
		reservationVO = adminORSService.selectORS(reservationVO);
		model.addAttribute("reservationInfo", reservationVO);

		// 공통코드 가져오기
		CommonCodeVO commCd = new CommonCodeVO();
		
		// 예약상태
		commCd.setCOMMON_CODE("APPO_STAT_CD");
		List<CommonCodeVO> appoStatCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoStatCdList", appoStatCdList);
		
		return "admin/rcm/ors/adminORSDetail";
	}
	
	/**
	 * 외래예약 수정 조회
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/updateORSView.do")
	public String updateORSView(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 외래예약 상세 가져오기
		reservationVO = adminORSService.selectORS(reservationVO);
		model.addAttribute("reservationInfo", reservationVO);

		// 공통코드 가져오기
		CommonCodeVO commCd = new CommonCodeVO();
		
		// 진료과
		commCd.setCOMMON_CODE("MEDI_SBJ_CD");
		List<CommonCodeVO> mediSbjCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("mediSbjCdList", mediSbjCdList);

		// 예약자관계
		commCd.setCOMMON_CODE("APPO_RLT_CD");
		List<CommonCodeVO> appoRltCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoRltCdList", appoRltCdList);

		// 예약상태
		commCd.setCOMMON_CODE("APPO_STAT_CD");
		List<CommonCodeVO> appoStatCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoStatCdList", appoStatCdList);
		
		return "admin/rcm/ors/adminORSModify";
	}
	
	/**
	 * 진료과 동적 Select
	 * @param model
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/selectDRList.do")
	@ResponseBody
	public List<ReservationVO> selectDRList(@RequestBody Map<String, Object> map) throws Exception{
		return adminORSService.selectboxChangedAndGetDR(map.get("MEDI_SBJ_CD").toString());
	}
	
	/**
	 * 외래예약 수정
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/updateORS.do")
	public String updateORS(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 외래예약 저장
		int res = adminORSService.updateORS(reservationVO);
		if(res == 1) {		//저장성공
			adminORSService.selectORS(reservationVO);
			remodel.addFlashAttribute("reservationVO", reservationVO);
			return "redirect:/admin/rcm/ors/selectORSDetail.do";
		}
		
		return "admin/rcm/ors/adminORSModify";
	}

	/**
	 * 외래예약 예약상태 수정
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/updateAppoStat.do")
	public String updateAppoStat(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 예약상태 저장
		int res = adminORSService.updateAppoStat(reservationVO);
		if(res == 1) {		//저장성공
			adminORSService.selectORS(reservationVO);
			remodel.addFlashAttribute("reservationVO", reservationVO);
			return "redirect:/admin/rcm/ors/selectORSDetail.do";
		}
		
		return "admin/rcm/ors/adminORSModify";
	}

	/**
	 * 외래예약 삭제
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/deleteORS.do")
	public String deleteORS(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model, RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 외래예약 삭제
		int res = adminORSService.deleteORS(reservationVO);
		if(res == 1) {		//삭제성공
			return "redirect:/admin/rcm/ors/selectORSList.do";
		}
		
		return "admin/rcm/ors/adminORSModify";
	}
	
	/**
	 * 외래예약 등록 조회
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/insertORSView.do")
	public String insertORSView(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 공통코드 가져오기
		CommonCodeVO commCd = new CommonCodeVO();
		
		// 진료과
		commCd.setCOMMON_CODE("MEDI_SBJ_CD");
		List<CommonCodeVO> mediSbjCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("mediSbjCdList", mediSbjCdList);

		// 예약자관계
		commCd.setCOMMON_CODE("APPO_RLT_CD");
		List<CommonCodeVO> appoRltCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoRltCdList", appoRltCdList);

		// 예약상태
		commCd.setCOMMON_CODE("APPO_STAT_CD");
		List<CommonCodeVO> appoStatCdList = commonService.selectCommonCodeList(commCd);
		model.addAttribute("appoStatCdList", appoStatCdList);
		
		return "admin/rcm/ors/adminORSRegist";
	}
	
	/**
	 * 외래예약 등록
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/rcm/ors/insertORS.do")
	public String insertORS(@ModelAttribute("reservationVO") ReservationVO reservationVO, ModelMap model ,RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 외래예약 저장
		int res = adminORSService.insertORS(reservationVO);
		if(res == 1) {		//저장성공
			reservationVO = adminORSService.selectORS(reservationVO);
			remodel.addFlashAttribute("reservationVO", reservationVO);
			return "redirect:/admin/rcm/ors/selectORSDetail.do";
		}
		
		return "admin/rcm/ors/adminORSRegist";
	}
}
