package fbcms.user.spc.cti.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplDetailVO;
import fbcms.admin.hpm.cln.service.Impl.CenterTemplVO;
import fbcms.admin.hpm.cln.service.Impl.CenterVO;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.user.cts.rsv.service.ReservationVO;
import fbcms.user.spc.cti.service.UserCTIService;

/**
 * 센터정보를 처리하는 비즈니스 구현 클래스
 */
@Service("UserCTIService")
public class UserCTIServiceImpl extends EgovAbstractServiceImpl implements UserCTIService {

    @Resource(name="UserCTIDAO")
    private UserCTIDAO userCTIDAO;
    
	
	@Override
	public List<?> selectCTIClinicList(AdminBoardVO adminBoardVO) {
		
		return userCTIDAO.selectCTIClinicList(adminBoardVO);
	}
	
	// 센터 이름 가져오기
	public List<?> selectCLINM(CenterVO centerVO) throws Exception {
		return userCTIDAO.selectCLINM(centerVO);
	}
	
	// 클리닉 조회
	public CenterVO selectCLN(CenterVO centerVO) throws Exception {
		// 클리닉 가져오기
		
		centerVO = userCTIDAO.selectCLN(centerVO);
		// 질병코드 리스트 객체 저장용
		if(centerVO != null && centerVO.getMAJOR_DISS_CDS() != null) {
			String[] dissArray = centerVO.getMAJOR_DISS_CDS().split(",");
			List<String> dissList = new ArrayList<String>();
			if(dissArray.length > 0) {
				for (String item : dissArray) {
					
					String dissCode = item.replaceAll("[^0-9a-zA-Z]", "").trim();
					dissList.add(userCTIDAO.selectCodeNm(dissCode));
				}
				if(dissList.size() > 0) {
					centerVO.setDISS_CDS_LIST(dissList);
				}
			}
		}
		
		
		if(!"".equals(centerVO.getDR_IDS())) {
			// 의사 리스트 객체 저장용
			String[] drArray = centerVO.getDR_IDS().split(",");
			List<DoctorVO> drList = new ArrayList<DoctorVO>();
			
			if(drArray.length > 0) {
				for (String item : drArray) {
					
					String drCode = item.replaceAll("[^0-9a-zA-Z]", "").trim();
					DoctorVO drVo = new DoctorVO();
					ReservationVO resVo = userCTIDAO.selectDrInf(drCode);
					drVo.setDR_ID(resVo.getDR_ID());
					drVo.setDR_NM(resVo.getDR_NM());
					drVo.setFIELD_CT(resVo.getFIELD_CT());
					drVo.setPOSITION_CT(resVo.getPOSITION_CT());
					drVo.setPC_IMG_ATCH_NO(resVo.getPC_IMG_ATCH_NO());
					drVo.setMEDI_SBJ_CD(resVo.getMEDI_SBJ_CD());
					drVo.setFILE_EXTSN(resVo.getPC_IMG_ATCH_EXT_SN());
					drVo.setADD_OPEN_SET_CD(resVo.getADD_OPEN_SET_CD());
					
					drList.add(drVo);
				}
				if(drList.size() > 0) {
					centerVO.setDR_LIST(drList);
				}
			}
		}
		
		// 클리닉 상세 가져오기
		List<CenterTemplVO> centerTemplVO = userCTIDAO.selectCLNTmpList(centerVO);
		
		
		for(CenterTemplVO vo : centerTemplVO) {
			centerVO.setSEQ(vo.getSEQ());
			centerVO.setMNG_GUBN_CD("03");
			
			// 클리닉 상세 상세 가져오기
			List<CenterTemplDetailVO> centerTemplDetailVO = userCTIDAO.selectCLNTmpDtilList(centerVO);
			vo.setDTIL_LIST(centerTemplDetailVO);	// 클리닉 상세 상세 리스트 셋팅
			
		}
		centerVO.setTMP_LIST(centerTemplVO);		// 클리닉 상세 리스트 셋팅
		
		return centerVO;
	}
	
	@Override
	public List<?> selectCTISBMList(AdminBoardVO adminBoardVO) {
		
		return userCTIDAO.selectCTISBMList(adminBoardVO);
	}
	
	@Override
	public String selectCTIDissListGroup(AdminBoardVO adminBoardVO) {
		
		return userCTIDAO.selectCTIDissListGroup(adminBoardVO);
	}
}