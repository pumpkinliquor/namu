package fbcms.admin.hpm.drm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.AdminDRMService;
import fbcms.com.cmm.service.CommonCodeVO;
import fbcms.com.cmm.service.CommonService;

/**
 * 의료진 관리 서비스
 * @author 김명진
 * @since 2020.10.13
 */
@Service("AdminDRMService")
public class AdminDRMServiceImpl extends EgovAbstractServiceImpl implements AdminDRMService{
	@Autowired
	AdminDRMDAO adminDRMDAO;
	@Autowired
	AdminOcsDrDAO adminOcsDrDAO;
	@Autowired
	CommonService commonService;
	@Autowired
	AdminOcsCTMDAO adminOcsCTMDAO;
	
	// 의료진 리스트
	public List<DoctorVO> selectDRMList(DoctorVO doctorVO) throws Exception {
		
		List<DoctorVO> drmList = adminDRMDAO.selectDRMList(doctorVO);
		
		
		for(int i=0; i<drmList.size(); i++) {
			String MNG_CD = drmList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			drmList.get(i).setMEDI_SBJ_NM(NM);
		}
		return drmList;
	}
	// 의료진 팝업 리스트
	public List<DoctorVO> selectDRMListPopup(DoctorVO doctorVO) throws Exception {
		
		List<DoctorVO> drmList = adminDRMDAO.selectDRMListPopup(doctorVO);
		
		
		for(int i=0; i<drmList.size(); i++) {
			String MNG_CD = drmList.get(i).getMEDI_SBJ_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			drmList.get(i).setMEDI_SBJ_NM(NM);
		}
		return drmList;
	}

	@Override
	public DoctorVO selectDRM(DoctorVO doctorVO) throws Exception {
		
		doctorVO = adminDRMDAO.selectDRM(doctorVO);
		String MNG_CD = doctorVO.getMEDI_SBJ_CD();
		
		String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
		doctorVO.setMEDI_SBJ_NM(NM);
		
		return doctorVO;
	}
	@Override
	public int insertDRM(DoctorVO doctorVO) throws Exception {
		// 태그등록
		if(doctorVO.getSEARCH_TAG_CT() != null) {
			String[] tagArray = doctorVO.getSEARCH_TAG_CT().split(",");
			doctorVO.setSEARCH_TAG_ARRAY(tagArray);
		}
		//공통 없으면 등록
		CommonCodeVO SubjectCode = new CommonCodeVO();
		SubjectCode.setCOMMON_CODE("MNG_CD");
		SubjectCode.setCODE(doctorVO.getMEDI_SBJ_CD());
		SubjectCode.setNAME("진료과 관리");
		commonService.insertCommonCode(SubjectCode);
		SubjectCode.setNAME(doctorVO.getMEDI_SBJ_NM());
		//공통 상세 없으면 등록
		commonService.insertCommonCodeDetail(SubjectCode);
		return adminDRMDAO.insertDRM(doctorVO);
	}

	@Override
	public int updateDRM(DoctorVO doctorVO) throws Exception {
		if(doctorVO.getSEARCH_TAG_CT() != null) {
			String[] tagArray = doctorVO.getSEARCH_TAG_CT().split(",");
			doctorVO.setSEARCH_TAG_ARRAY(tagArray);
		}
		return adminDRMDAO.updateDRM(doctorVO);
	}

	@Override
	public int deleteDRM(DoctorVO doctorVO) throws Exception {
		return adminDRMDAO.deleteDRM(doctorVO);
	}

	@Override
	public int selectDRMTotCnt(DoctorVO doctorVO) throws Exception {
		return adminDRMDAO.selectDRMTotCnt(doctorVO);
	}
	
	public List selectOcsDrList(DoctorVO doctorVO) throws Exception{
		return adminOcsDrDAO.selectDRList(doctorVO);
	}
	
	public List selectOcsCtList() throws Exception{
		return adminOcsDrDAO.selectCtList();
	}

	// 진료시간표 관리 메인화면 조회 
	@Override
	public List selectTMMMainList(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return adminDRMDAO.selectTMMMainList(doctorTimeTableVO);
	}

	// 진료시간표 관리 상세화면 조회
	@Override
	public DoctorTimeTableVO selectTMMView(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		
		return adminDRMDAO.selectTMMView(doctorTimeTableVO);
	}
	
	@Override
	public int updateOrderDRM(DoctorVO doctorVO) throws Exception {
		return adminDRMDAO.updateOrderDRM(doctorVO);
	}

	@Override
	public int updateTMM(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return adminDRMDAO.updateTMM(doctorTimeTableVO);
	}

	// 진료시간표 관리 오전 오후 진료시간 저장
	@Override
	public int updateAMPM(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return adminDRMDAO.updateAMPM(doctorTimeTableVO);
	}
	
	@Override
	public List selectTMMList(DoctorTimeTableVO doctorTimeTableVO) throws Exception {
		return adminDRMDAO.selectTMMList(doctorTimeTableVO);
	}

}
