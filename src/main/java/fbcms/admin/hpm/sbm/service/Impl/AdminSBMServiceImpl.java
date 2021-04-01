package fbcms.admin.hpm.sbm.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.stringtemplate.v4.compiler.CodeGenerator.region_return;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.ctm.service.Impl.AdminOcsCTMDAO;
import fbcms.admin.hpm.drm.service.impl.AdminOcsDrDAO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.admin.hpm.sbm.service.AdminSBMService;

@Service("AdminSBMService")
public class AdminSBMServiceImpl extends EgovAbstractServiceImpl implements AdminSBMService {
	@Autowired
	private AdminSBMDAO adminSBMDAO;
	@Autowired
	private adminOcsSBMDAO adminOcsSBMDAO;
	@Autowired
	private AdminOcsCTMDAO adminOcsCTMDAO;
	
	// 진료과(OCS) 리스트
	@Override
	public List selectOcsSBMList(SubjectVO subjectVO) throws Exception {
		return adminOcsSBMDAO.selectOcsSBMList(subjectVO);
	}

	// 진료과 리스트
	public List selectSBMList(SubjectVO subjectVO) throws Exception {
		
		List<SubjectVO> sbmList = adminSBMDAO.selectSBMList(subjectVO);
		
		
		for(int i=0; i<sbmList.size(); i++) {
			String MNG_CD = sbmList.get(i).getMNG_CD();
			String NM = adminOcsCTMDAO.selectDPTName(MNG_CD);
			
			sbmList.get(i).setMNG_NM(NM);
		}
		
		return sbmList;
	}

	// 진료과 수정상세
	public SubjectVO selectSBM(SubjectVO subjectVO) throws Exception {
		
		return adminSBMDAO.selectSBM(subjectVO);
	}
	
	// 진료과 삭제
	public int deleteSBM(SubjectVO subjectVO) throws Exception {
		return adminSBMDAO.deleteSBM(subjectVO);
	}

	// 진료과 수정
	public int updateSBM(SubjectVO subjectVO) throws Exception {
		if(subjectVO.getSEARCH_TAGS() != null) {
			if(subjectVO.getSEARCH_TAGS().startsWith(",")) {
				subjectVO.setSEARCH_TAGS(subjectVO.getSEARCH_TAGS().substring(1, subjectVO.getSEARCH_TAGS().length()));
			}
			if(subjectVO.getSEARCH_TAGS().endsWith(",")) {
				subjectVO.setSEARCH_TAGS(subjectVO.getSEARCH_TAGS().substring(0, subjectVO.getSEARCH_TAGS().length()-1));
			}
			String[] tagArray = subjectVO.getSEARCH_TAGS().split(",");
			subjectVO.setSEARCH_TAG_ARRAY(tagArray);
		}
		return adminSBMDAO.updateSBM(subjectVO);
	}

	// 신규 진료과 공통코드 저장
	public int updateMngCd(SubjectVO subjectVO) throws Exception {
		return adminSBMDAO.updateMngCd(subjectVO);
	}
	
	// 진료과 수정 관련센터 저장
	public int deleteRelationCenter(RelationCenterVO relationCenterVO) throws Exception {
		return adminSBMDAO.deleteRelationCenter(relationCenterVO);
	}	

	// 진료과 수정 관련센터 저장
	public int updateRelationCenter(RelationCenterVO relationCenterVO) throws Exception {
		return adminSBMDAO.updateRelationCenter(relationCenterVO);
	}
	
	// 특화센터 리스트
	public List selectAllCenter() throws Exception {
		return adminSBMDAO.selectAllCenter();
	}

	/* 진료과 - 주요질환 검색용 리스트 */
	@Override
	public List<?> selectSBMDissListAll() {
		return adminSBMDAO.selectSBMDissListAll();
	}
	
	/* 진료과 - 주요질환 선택 리스트*/
	@Override
	public List<?> selectSBMDissList(SubjectVO subjectVO) {
		return adminSBMDAO.selectSBMDissList(subjectVO);
	}

	/* 진료과 - 주요질환 텍스트 */
	@Override
	public List<String> selectSBMDissCodeList(SubjectVO subjectVO) {
		return adminSBMDAO.selectSBMDissCodeList(subjectVO);
	}
}
