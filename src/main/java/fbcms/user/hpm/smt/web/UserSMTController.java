package fbcms.user.hpm.smt.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.centerVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.hpm.specialityVO;
import fbcms.user.hpm.smt.service.UserSMTService;


@Controller
public class UserSMTController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserSMTController.class);

	
	/** 회원가입 **/
	@Resource(name = "UserSMTService")
	private UserSMTService UserSMTService;
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	// 주요질환코드
	@Autowired
	private AdminSBMService adminSBMService;
	
	@RequestMapping(value = "/user/hpm/smt/SMTPage.do")
	public String SMTPage(Map<String, Object> map, HttpServletRequest request, 
			HttpServletResponse response, ModelMap model, String code, String code2)  throws Exception{
		
		if(code==null) {
			code = "GI";
		}
		String menuCode = "020100";
		switch (code) {
		case "GI":
			//소화기내과
			menuCode = "020100";
			break;
		case "GS":
			//소화기외과
			menuCode = "020200";
			break;
		case "NE":
			//신장내과
			menuCode = "020300";
			break;
		case "FM":
			//가정의학과
			menuCode = "020400";
			break;
		case "BE":
			//유방·갑상선외과
			menuCode = "020500";
			break;
		case "GY":
			//부인과
			menuCode = "020600";
			break;
		case "XR":
			//영상의학과
			menuCode = "020700";
			break;

		default:
			menuCode = "020000";
			break;
		}
		FbcmsCommonUtils.getMenuNavigation(request, model, menuCode);
		
		// 로그인 확인하기
		
		if(request.getSession().getAttribute("loginVO")!=null) {
			LoginVO VO = (LoginVO)request.getSession().getAttribute("loginVO");
			map.put("LoginVO", VO);
			String USER_ID = VO.getId();
			
			List<favoritesDRVO> favoritesDRList= UserSMTService.favoritesDRList(USER_ID);
			map.put("favoritesDRList", favoritesDRList);			
			
		}
		
		map.put("code", code);
		
		/* **************************************
		 * 2020.12.29
		 * 가정의학과 페이지 선택 시 안티에이징 동시노출 처리
		 * ************************************** */
		if(code != null && "FM".equals(code)) {
			code2 = "AO";
		}
		if(code2!=null) {			
			map.put("code2", code2);
		}
				
		// 의사진 리스트
		List<DRListVO> drList = UserSMTService.DRList(map);
		
		map.put("DRList", drList);
		
//		if(code.equals("BE")) {
//			code = "BEC";
//		}
		
		// 진료과 리스트
		specialityVO spVO = (specialityVO)UserSMTService.specialityList(code);
		map.put("spVO", spVO);
		
		
		// 주요질환리스트 주석처리 => 진료과에 통합
//		String dCode = (String) map.get("code");
//		
//		try {
//			// 주요질환 게시판으로 즉시 이동하도록 변경처리
//			List<?> adList = UserSMTService.majorDiseaseList(spVO);
//			model.addAttribute("adList", adList);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
		SubjectVO dissListVo = new SubjectVO();
		dissListVo.setMNG_CD(code);
		if(spVO.getMAJOR_DISS_CDS() != null) {
			dissListVo.setMAJOR_DISS_CDS(spVO.getMAJOR_DISS_CDS());
			List<String> dissCds = new ArrayList<>();
			for (String item : dissListVo.getMAJOR_DISS_CDS().split(",")) {
				dissCds.add(item);
			}
			if(dissCds.size() == 0) {
				dissCds.add("0");
			}
			dissListVo.setDISS_CDS_LIST(dissCds);
			List<?> dissList = adminSBMService.selectSBMDissList(dissListVo);
			model.addAttribute("DL", dissList);
		}
		// 질환정보 카테고리
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode.setCodeId("000003");
		List<?> listDSIComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("listDSIComCode", listDSIComCode);
		
		
		if(code.equals("BEC")) {
			code = "BE";
		}
		
		// 관련센터 리스트
		List<?> centerList = UserSMTService.centerList(map);
		
		map.put("centerList", centerList);
		return FbcmsCommonUtils.mobileJspReplace(request, "user/hpm/smt/SMTList");
		
	}	
	
	// 좋아요 체크
	@RequestMapping(value = "/user/hpm/smt/likecheck.do")
	@ResponseBody
	public String likeCheck(@RequestBody Map<String, Object> map) throws Exception {
		String likeCheck = UserSMTService.likeCheck(map);
		if (likeCheck != null) {
			return likeCheck;
		} else {
			return null;
		}
	}
	
	// 의사 상세 정보 AJAX용
	@RequestMapping(value = "/user/hpm/smt/drdetail.do")
	@ResponseBody
	public DRListVO drDetail(@RequestBody Map<String, Object> map) throws Exception {
		
//		String code = (String) map.get("code");
//		if (code.equals("BE")) {
//			map.put("code2", "C");
//		} else if (code.equals("C")) {
//			map.put("code2", "NE");
//		} else {
//			map.put("code2", null);
//		}
		
		List<DRListVO> drList = UserSMTService.DRList(map);
		int idx = 0;
		idx = (int)(map.get("idx"));
		if(idx < 0) {
			idx = drList.size() + ( idx % drList.size() );
			if(idx==drList.size()) {
				idx = 0;
			}
		} else if(idx>=0) {
			idx = idx%drList.size();
		}
		DRListVO dr = drList.get(idx);
		if(!dr.getSPCL_FIELD_TX().isEmpty()) {
			dr.setSPCL_FIELD_TX(dr.getSPCL_FIELD_TX().replaceAll("\n", "</li><li>"));
		}
		if(!dr.getHISTORY_TX().isEmpty()) {
			dr.setHISTORY_TX(dr.getHISTORY_TX().replaceAll("\n", "</li><li>"));
		}
		if(!dr.getHISTORY_TX2().isEmpty()) {
			dr.setHISTORY_TX2(dr.getHISTORY_TX2().replaceAll("\n", "</li><li>"));
		}
		
		return dr;
	}
	
}
