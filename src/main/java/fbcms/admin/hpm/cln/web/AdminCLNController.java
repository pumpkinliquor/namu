package fbcms.admin.hpm.cln.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import fbcms.admin.hpm.cln.service.AdminCLNService;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplDetailVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.cln.service.Impl.CenterVO;
import fbcms.admin.hpm.cln.service.Impl.CodeDetailVO;;


/**
 * 클리닉 관리
 * @author 김명진
 * @since 2020.10.21
 */
@Controller
public class AdminCLNController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminCLNController.class);

	@Autowired
	private AdminCLNService adminCLNService;
	
	/**
	 * 클리닉 리스트 페이지
	 * @param model
	 * @param centerVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/selectCLNList.do")
	public String selectCLNList(HttpServletRequest request, ModelMap model, @ModelAttribute("centerVO")CenterVO centerVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// 센터 리스트 가져오기
		List<CenterVO> centerList = adminCLNService.selectCLNCenterList(centerVO);
		model.addAttribute("centerList", centerList);

		// 센터에 따른 클리닉 리스트 가져오기
		for(int i = 0; i < centerList.size(); i++) {
			CenterVO centerVo = centerList.get(i);
			
			// 클리닉 리스트 가져오기
			List<CenterVO> clinicList = adminCLNService.selectCLNList(centerVo);
			request.setAttribute("clinicList"+(i+1), clinicList);
		}
		
		return "admin/hpm/cln/adminCLNList";
	}

	/**
	 * 클리닉 등록 페이지
	 * @param model
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/insertCLNView.do")
	public String insertCLN(ModelMap model,@ModelAttribute("centerVO")CenterVO centerVO, CodeDetailVO codeDetailVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 질환리스트
		List<?> dissList = adminCLNService.selectDissCode();
		model.addAttribute("dissList", dissList);

		// 의료진리스트
		List<?> drlist = adminCLNService.selectDrList();
		model.addAttribute("drList", drlist);
		
		model.addAttribute("clinicInfo", centerVO);
		
		return "admin/hpm/cln/adminCLNRegist";
	}

	/**
	 * 클리닉 등록
	 * @param request
	 * @param mutirequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/insertCLN.do")
	public String insertCLN(@ModelAttribute("centerVO")CenterVO centerVO
			   ,@ModelAttribute("centerTemplVO")CenterTemplVO centerTemplVO
			   ,@ModelAttribute("CenterTemplDetailVOList")CenterTemplDetailVO CenterTemplDetailVOList
			   ,MultipartHttpServletRequest multirequest
			   ,RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		// 클리닉 저장
		adminCLNService.insertCLN(centerVO);
		
		return "redirect:/admin/hpm/cln/selectCLNList.do";
	}
	
	/**
	 * 클리닉 수정 페이지
	 * @param model
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/updateCLNView.do")
	public String selectCLNView(ModelMap model,@ModelAttribute("centerVO")CenterVO centerVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 질환리스트
		List<?> dissList = adminCLNService.selectDissCode();
		model.addAttribute("dissList", dissList);

		// 의료진리스트
		List<?> drlist = adminCLNService.selectDrList();
		model.addAttribute("drList", drlist);
		
		// 클리닉 상세 조회
		centerVO = adminCLNService.selectCLN(centerVO);
		model.addAttribute("clinicInfo", centerVO);
		
		return "admin/hpm/cln/adminCLNModify";
	}
	
	/**
	 * 클리닉 수정
	 * @param request
	 * @param mutirequest
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/updateCLN.do")
	public String updateCLN(@ModelAttribute("centerVO")CenterVO centerVO
			   ,@ModelAttribute("centerTemplVO")CenterTemplVO centerTemplVO
			   ,@ModelAttribute("CenterTemplDetailVOList")CenterTemplDetailVO CenterTemplDetailVOList
			   ,MultipartHttpServletRequest multirequest
			   ,RedirectAttributes remodel) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		// 클리닉 저장
		adminCLNService.updateCLN(centerVO);
		
		return "redirect:/admin/hpm/cln/selectCLNList.do";
	}
	
	/**
	 * 클리닉 삭제
	 * @param model
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/deleteCLN.do")
	public String deleteCLN(ModelMap model,@ModelAttribute("centerVO")CenterVO centerVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		centerVO.setUSER_ID(user.getUniqId());

		// 클리닉 삭제
		int res = adminCLNService.deleteCLN(centerVO);
		if(res == 1) {		//삭제성공
			return "redirect:/admin/hpm/cln/selectCLNList.do";
		}
		
		return "admin/hpm/cln/adminCLNRegist";
	}
	

	/**
	 * 클리닉 정렬 순서 수정
	 * @param model
	 * @param centerVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/cln/updateOrderChange.do")
	public String updateOrderChange(HttpServletRequest request, ModelMap model,@ModelAttribute("centerVO")CenterVO centerVO) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		String mngCd = request.getParameter("mngCd");   	// 클리닉 Code
		String trCount = request.getParameter("trCount");	// 전체 row 수
		
		if(!trCount.isEmpty()) {
			int trCnt = Integer.parseInt(trCount);
			for(int i = 0; i < trCnt; i++) {
				if(request.getParameter("seq"+(i+1)+"Order") != null && request.getParameter("seq"+(i+1)+"MngSeq") != null) {
					int orderNo = Integer.parseInt(request.getParameter("seq"+(i+1)+"Order").toString());
					String mngSeq = request.getParameter("seq"+(i+1)+"MngSeq");
					
					CenterVO newVO = new CenterVO(); 
					newVO.setMNG_GUBN_CD("03");	// 관리구분
					newVO.setMNG_CD(mngCd);     // 관리코드
					newVO.setMNG_SEQ(mngSeq);   // 관리순번
					newVO.setORDER_NO(orderNo);	// 정렬순번
					
					// 순서 수정
					adminCLNService.updateOrderChange(newVO);
				}
			}
		}
		return "redirect:/admin/hpm/cln/selectCLNList.do";
	}
	
}
