package fbcms.user.spc.cti.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.collection.CollectionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import fbcms.admin.hpm.bbs.service.AdminArticleService;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.cln.service.Impl.CenterVO;
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.smt.service.UserSMTService;
import fbcms.user.spc.cti.service.UserCTIService;

/**
 * 특화센터(SPecialized Center) - 센터정보(CenTerInfo)를 처리하는 비즈니스 구현 클래스
 */
@Controller
public class UserCTIController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserCTIController.class);

	@Resource(name = "AdminArticleService")
	private AdminArticleService adminArticleService;

	@Resource(name = "UserCTIService")
	private UserCTIService userCTIService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "AdminSBMService")
	private AdminSBMService adminSBMService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	@Resource(name = "UserSMTService")
	private UserSMTService userSMTService;
	

	/**
	 * 각 특화센터 센터소개 페이지
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/user/spc/cti/selectCTIInfo.do")
	public String selectCTIInfo(@ModelAttribute("centerVO") CenterVO centerVO,
			@ModelAttribute("board") AdminBoardVO boardVO, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		if ("SPC009".equals(boardVO.getCustom1())) {
			return "redirect:/user/cuc/ccc/infoCCC.do";
		} else if ("SPC010".equals(boardVO.getCustom1())) {
			return "redirect:/user/cuc/icc/infoICC.do";
		}
		
		AdminBoardVO articleVO = new AdminBoardVO();
		boardVO.setBbsId("BBSMSTR_000000000017");
		boardVO.setParntsCustom1("SPC");

		String cus1 = boardVO.getCustom1();
		model.addAttribute("cus1", cus1);

		articleVO = adminArticleService.selectSPCDetail(boardVO);
		model.addAttribute("articleVO", articleVO);

		// 연관 클리닉 명칭 불러오기
		List<?> listClinic = userCTIService.selectCTIClinicList(articleVO);
		model.addAttribute("listClinic", listClinic);

		// 센터소개
		articleVO.setParntsCustom1(articleVO.getCustom1());
		Map<String, Object> resultMap = adminArticleService.selectSPCChildList(articleVO);
		List<AdminBoardVO> resultList = (List<AdminBoardVO>) resultMap.get("resultList");

		if (!resultList.isEmpty()) {
			long nttNo = 1;
			for (AdminBoardVO result : resultList) {
				if (nttNo == result.getNttNo()) {
					model.addAttribute("result" + nttNo, result);

					// 첨부파일 정보 가져온다.
					String atchFileId = result.getAtchFileId();
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(atchFileId);

					List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);

					model.addAttribute("fileList" + nttNo, fileList);
				}
				nttNo++;
			}
		}

		// 진료과 리스트
		List<?> subjectList = userCTIService.selectCTISBMList(boardVO);
		model.addAttribute("subjectList", subjectList);

		/* 1217 정책 변경
		// 질환정보 카테고리
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000003");
		List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listDSIComCode", listDSIComCode);
		
		// 질환정보 리스트 중복 제거 셋팅
		String dissListGroup = userCTIService.selectCTIDissListGroup(boardVO);
		String[] dissArray = dissListGroup.split(",");
		List<String> dissList = new ArrayList<String>();
		for(String diss : dissArray) {
			if(!dissList.contains(diss)) {
				dissList.add(diss);
			}
		}
		model.addAttribute("dissList", dissList);
		*/
		SubjectVO dissListVo = new SubjectVO();
		if(articleVO.getCustom4() != null && articleVO.getCustom4() != "") {
			dissListVo.setMAJOR_DISS_CDS(articleVO.getCustom4());
			List<String> dissCds = new ArrayList<>();
			for (String item : dissListVo.getMAJOR_DISS_CDS().split(",")) {
				dissCds.add(item);
			}
			if(dissCds.size() == 0) {
				dissCds.add("0");
			}
			dissListVo.setDISS_CDS_LIST(dissCds);
			List<?> dissList = adminSBMService.selectSBMDissList(dissListVo);
			model.addAttribute("dissList", dissList);
		}

		if ("SPC002".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030200");
		} else if ("SPC003".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030300");
		} else if ("SPC004".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030400");
		} else if ("SPC005".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030500");
		} else if ("SPC006".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030600");
		} else if ("SPC007".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030700");
		} else if ("SPC008".equals(boardVO.getCustom1())) {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030800");
		} else {
			FbcmsCommonUtils.getMenuNavigation(request, model, "030100");
		}

		return FbcmsCommonUtils.mobileJspReplace(request, "user/spc/cti/userCTIInfo");
	}

	/**
	 * 각 특화센터 클리닉 상세정보 페이지
	 */
	@RequestMapping("/user/spc/cti/selectClinicInfo.do")
	public String selectClinicInfo(@ModelAttribute("centerVO") CenterVO centerVO,
			@ModelAttribute("board") AdminBoardVO boardVO, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		String MNG_CD = request.getParameter("MNG_CD");
		if(MNG_CD != null) {
			boardVO.setCustom1(MNG_CD);
		}
		// 로그인 확인하기
		if(request.getSession().getAttribute("loginVO")!=null) {
			LoginVO VO = (LoginVO)request.getSession().getAttribute("loginVO");
			model.addAttribute("LoginVO", VO);
			String USER_ID = VO.getId();
			
			List<favoritesDRVO> favoritesDRList= userSMTService.favoritesDRList(USER_ID);
			model.addAttribute("favoritesDRList", favoritesDRList);			
		}
		
		String seq = centerVO.getMNG_SEQ();
		String mngcd = centerVO.getMNG_CD();
		// URL을 바로 입력해서 들어왔을 때 custom1 누락 오류 처리
		if(boardVO.getCustom1() == null || boardVO.getCustom1().isEmpty()) {
			boardVO.setCustom1("SPC001");
		}
		if(centerVO == null || centerVO.getMNG_SEQ() == null || centerVO.getMNG_CD() == null) {
			return "redirect:/user/spc/cti/selectCTIInfo.do?custom1="+boardVO.getCustom1();
		}
		// SPC0__에서 추출한 숫자로 getMenuNavigation 맵핑처리
		int spc = 1;
		try {
			spc = Integer.parseInt(boardVO.getCustom1().replaceAll("[^0-9]","").trim());
		} catch (Exception e) {
			spc = 1;
		}

		model.addAttribute("mseq", seq);
		model.addAttribute("cust1", mngcd);
		
		centerVO.setMNG_CD(mngcd);
		boardVO.setBbsId("BBSMSTR_000000000017");
		boardVO.setParntsCustom1("SPC");
		boardVO.setCustom1(mngcd);

		centerVO = userCTIService.selectCLN(centerVO);
		model.addAttribute("clinicInfo", centerVO);

		List<?> listClinic = userCTIService.selectCTIClinicList(boardVO);
		model.addAttribute("listClinic", listClinic);
		
		// 질환정보 카테고리
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000003");
		List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listDSIComCode", listDSIComCode);
		
		String returnStr = "user/spc/cti/userClinicInfoTypeA";
		if("B".equals(centerVO.getTEMPL_CD())) {
			returnStr = "user/spc/cti/userClinicInfoTypeB";
		} else if("C".equals(centerVO.getTEMPL_CD())) {
			returnStr = "user/spc/cti/userClinicInfoTypeC";
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, "03"+String.format("%02d", spc)+"00");

		return FbcmsCommonUtils.mobileJspReplace(request, returnStr);
	}
	
	/**
	 * 의사 팝업 데이터
	 */
	@RequestMapping(value="/user/spc/cti/drdetail.do")
	@ResponseBody
	public ModelAndView drdetail(@RequestBody Map<String, Object> map) throws Exception {
		
		String DR_ID =  String.valueOf(map.get("DR_ID"));
		
		DRListVO drListVO = new DRListVO();
		drListVO.setDR_ID(DR_ID);
		
		/*중복된 아이디 Check*/
		drListVO = userSMTService.drDetail(DR_ID);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("jsonView");
		mv.addObject("drListVO", drListVO);
		 
		return mv;
	}

}
