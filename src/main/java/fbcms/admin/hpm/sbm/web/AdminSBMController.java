
package fbcms.admin.hpm.sbm.web;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import fbcms.admin.hpm.drm.service.AdminDRMService;
import fbcms.admin.hpm.sbm.service.AdminSBMService;
import fbcms.admin.hpm.sbm.service.Impl.RelationCenterVO;
import fbcms.admin.hpm.sbm.service.Impl.SubjectVO;
import fbcms.com.cmm.service.CommonService;
import fbcms.user.spc.cti.service.Impl.UserCTIDAO;
/**
 * 진료과 관리
 * @author 김명진
 * @since 2020.10.14
 */
@Controller
public class AdminSBMController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminSBMController.class);
	@Autowired
	private AdminSBMService adminSBMService;
	@Autowired
	private AdminDRMService adminDRMService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private UserCTIDAO userCTIDAO; 
	
	/**
	 * 진료과 관리 리스트 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/sbm/selectSBMList.do")
	public String selectSBMList(ModelMap model, @ModelAttribute("subjectVO") SubjectVO subjectVO) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		// OCS 진료과 리스트
		List<SubjectVO> subjectOcsList = adminSBMService.selectOcsSBMList(subjectVO);
		// 진료과 리스트
		List<SubjectVO> subjectList = adminSBMService.selectSBMList(subjectVO);
		
		// OCS 진료과 리스트에 최종수정일 맵핑
		for(int i = 0; i < subjectOcsList.size(); i++) {
			for(int j = 0; j < subjectList.size(); j++) {
				SubjectVO ocsVo = subjectOcsList.get(i);
				SubjectVO vo = subjectList.get(j);
				
				String ocdMngCd = ocsVo.getMNG_CD();
				String mngCd = vo.getMNG_CD();
				
				if(ocdMngCd.equals(mngCd)) {	// 진료과 코드가 같으면 최종수정일 입력
					String updtDt = vo.getUPDT_DT();
					ocsVo.setUPDT_DT(updtDt);
				}
			}
		}
		model.addAttribute("subjectList", subjectOcsList);
		
		return "admin/hpm/sbm/adminSBMList";
	}
	
	/**
	 * 진료과 관리 수정 페이지
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/sbm/updateSBMView.do")
	public String updateSBMView(ModelMap model, @ModelAttribute("subjectVO") SubjectVO subjectVO) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}

		String mngCd = subjectVO.getMNG_CD();	// 진료과
		String mngNm = subjectVO.getMNG_NM();	// 진료과명
		
		
		// 상세 내용 가져오기
		SubjectVO sb = adminSBMService.selectSBM(subjectVO);
		// OCS 센터 리스트 가져오기
		//List centerList = adminDRMService.selectOcsCtList();
		// 센터 리스트 가져오기
		List AllCenter = adminSBMService.selectAllCenter();
		
		if(sb == null) {		// 데이터가 없을 경우 초기화
			sb = new SubjectVO();
		}
		sb.setMNG_CD(mngCd);	// 진료과 셋팅 (OCS데이터)
		sb.setMNG_NM(mngNm);	// 진료과 이름 셋팅 (OCS데이터)
		if(sb.getMAJOR_DISS_CDS() != null) {
			List<String> dissCds = new ArrayList<>();
			for (String item : sb.getMAJOR_DISS_CDS().split(",")) {
				dissCds.add(item);
			}
			sb.setDISS_CDS_LIST(dissCds);
			sb.setDISS_CDS_LIST(adminSBMService.selectSBMDissCodeList(sb));
		}
		
		List<?> dissList = adminSBMService.selectSBMDissListAll();
		model.addAttribute("dissList", dissList);
		
//		if(sb.getMAJOR_DISS_CDS() != null) {
//			String[] dissArray = sb.getMAJOR_DISS_CDS().split(",");
//			List<String> dissList = new ArrayList<String>();
//			if(dissArray.length > 0) {
//				for (String item : dissArray) {
//					
//					String dissCode = item.replaceAll("[^0-9a-zA-Z]", "").trim();
//					dissList.add(userCTIDAO.selectCodeNm(dissCode));
//				}
//				if(dissList.size() > 0) {
//					//sb.setDISS_CDS_LIST(dissList);
//					model.addAttribute("DL", dissList);
//				}
//			}
//		}
		
		
		//model.addAttribute("centerList", centerList);
		model.addAttribute("centerList", AllCenter);
		model.addAttribute("subjectInfo", sb);
		model.addAttribute("centerPopupType", "radio");
		
		return "admin/hpm/sbm/adminSBMModify";
	}
	
	/**
	 * 진료과 관리 수정
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin/hpm/sbm/updateSBM.do")
	public String updateSBM(ModelMap model, @ModelAttribute("subjectVO") SubjectVO subjectVO
						, RedirectAttributes remodel, HttpServletRequest request) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			return "redirect:/admin/lgn/adminLogin.do";
		}
		
		//item.replaceAll("[^0-9a-zA-Z]", "").trim()
		
//		if(subjectVO.getMAJOR_DISS_CDS() != null) {
//			String[] dissArray = subjectVO.getMAJOR_DISS_CDS().split(",");
//			List<String> dissList = new ArrayList<String>();
//			for(int i=0; i<dissArray.length; i++) {
//				dissList.add(userCTIDAO.selectCode(dissArray[i]));
//				String DL = String.join(", ", dissList);
//				subjectVO.setMAJOR_DISS_CDS(DL);
//			}
//			
//		}
		
		// 상세내역 삭제
		adminSBMService.deleteSBM(subjectVO);
		// 상세내역 저장
		adminSBMService.updateSBM(subjectVO);
		// 신규 진료과 공통코드 저장
		adminSBMService.updateMngCd(subjectVO);
		
		// 관련센터 저장
		String MNG_CD = request.getParameter("MNG_CD");
		String MNG_CENTER_CD1 = request.getParameter("MNG_CENTER_CD1");
		String MNG_CENTER_CD1_BIGO = request.getParameter("MNG_CENTER_CD1_BIGO");
		String MNG_CENTER_CD2 = request.getParameter("MNG_CENTER_CD2");
		String MNG_CENTER_CD2_BIGO = request.getParameter("MNG_CENTER_CD2_BIGO");
		String MNG_CENTER_CD3 = request.getParameter("MNG_CENTER_CD3");
		String MNG_CENTER_CD3_BIGO = request.getParameter("MNG_CENTER_CD3_BIGO");
		String MAJOR_DISS_CDS = request.getParameter("MAJOR_DISS_CDS");

		RelationCenterVO relationCenterVO = new RelationCenterVO();
		relationCenterVO.setMNG_CD(MNG_CD);
		
		// 관련센터 1 저장
		if(MNG_CENTER_CD1 != null) {
			relationCenterVO.setCENTER_CD(MNG_CENTER_CD1);
			relationCenterVO.setCENTER_BIGO_TX(MNG_CENTER_CD1_BIGO);
			relationCenterVO.setMNG_SEQ("1");
			adminSBMService.deleteRelationCenter(relationCenterVO);
			adminSBMService.updateRelationCenter(relationCenterVO);
		}
		
		// 관련센터 2 저장
		if(MNG_CENTER_CD2 != null) {
			relationCenterVO.setCENTER_CD(MNG_CENTER_CD2);
			relationCenterVO.setCENTER_BIGO_TX(MNG_CENTER_CD2_BIGO);
			relationCenterVO.setMNG_SEQ("2");
			adminSBMService.deleteRelationCenter(relationCenterVO);
			adminSBMService.updateRelationCenter(relationCenterVO);
		}

		// 관련센터 3 저장
		if(MNG_CENTER_CD3 != null) {
			relationCenterVO.setCENTER_CD(MNG_CENTER_CD3);
			relationCenterVO.setCENTER_BIGO_TX(MNG_CENTER_CD3_BIGO);
			relationCenterVO.setMNG_SEQ("3");
			adminSBMService.deleteRelationCenter(relationCenterVO);
			adminSBMService.updateRelationCenter(relationCenterVO);
		}
		
		remodel.addFlashAttribute("subjectVO", adminSBMService.selectSBM(subjectVO));
		return "redirect:/admin/hpm/sbm/selectSBMList.do";
	}
}
