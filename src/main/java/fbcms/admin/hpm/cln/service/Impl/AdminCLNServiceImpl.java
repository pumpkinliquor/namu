package fbcms.admin.hpm.cln.service.Impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.hpm.cln.service.AdminCLNService;
import fbcms.admin.hpm.drm.service.impl.DoctorVO;
import fbcms.user.cts.rsv.service.ReservationVO;

/**
 * 센터관리 서비스
 * @author 김명진
 * @since 2020.10.21
 */
@Service("AdminCLNService")
public class AdminCLNServiceImpl extends EgovAbstractServiceImpl implements AdminCLNService {
	@Autowired
	private AdminCLNDAO adminCLNDAO;
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	// 센터 리스트 조회
	public List<CenterVO> selectCLNCenterList(CenterVO centerVO) throws Exception {
		return adminCLNDAO.selectCLNCenterList(centerVO);
	}
	
	// 클리닉 리스트 조회
	public List<CenterVO> selectCLNList(CenterVO centerVO) throws Exception {
		return adminCLNDAO.selectCLNList(centerVO);
	}

	// 클리닉 조회
	public CenterVO selectCLN(CenterVO centerVO) throws Exception {
		// 클리닉 가져오기
		centerVO = adminCLNDAO.selectCLN(centerVO);
		
		// 질병코드 리스트 객체 저장용
		String strMajorDissCds = centerVO.getMAJOR_DISS_CDS() == null ? "" : centerVO.getMAJOR_DISS_CDS();
		if(!strMajorDissCds.isEmpty()) {
			String[] dissArray = strMajorDissCds.split(",");
			List<String> dissList = new ArrayList<String>();
			for (String item : dissArray) {
				
				String dissCode = item.replaceAll("[^0-9a-zA-Z]", "").trim();
				dissList.add(adminCLNDAO.selectDissNm(dissCode));
			}
			if(dissList.size() > 0) {
				centerVO.setDISS_CDS_LIST(dissList);
			}
		}
		
		// 의사 리스트 객체 저장용
		String strDrIds = centerVO.getDR_IDS() == null ? "" : centerVO.getDR_IDS();
		if(!strDrIds.isEmpty()) {
			String[] drArray = strDrIds.split(",");
			List<String> drList = new ArrayList<String>();
			for (String item : drArray) {
				
				String drCode = item.replaceAll("[^0-9a-zA-Z]", "").trim();
				drList.add(adminCLNDAO.selectDrNm(drCode));
			}
			if(drList.size() > 0) {
				centerVO.setDR_LIST2(drList);
			}
		}
		
		// 클리닉 상세 가져오기
		List<CenterTemplVO> centerTemplVO = adminCLNDAO.selectCLNTmpList(centerVO);
		
		for(CenterTemplVO vo : centerTemplVO) {
			centerVO.setSEQ(vo.getSEQ());
			
			// 클리닉 상세 상세 가져오기
			List<CenterTemplDetailVO> centerTemplDetailVO = adminCLNDAO.selectCLNTmpDtilList(centerVO);
			
			for(CenterTemplDetailVO dvo : centerTemplDetailVO) {
				// 이미지, 동영상 파일 이름 가져오기
				FileVO IMG_FILE = new FileVO();
				FileVO VIDEO_FILE = new FileVO();
				String IMG_ATCH_NO = dvo.getIMG_ATCH_NO();
				String VIDEO_ATCH_NO = dvo.getVIDEO_ATCH_NO();
				
				IMG_FILE.setAtchFileId(IMG_ATCH_NO);
				VIDEO_FILE.setAtchFileId(VIDEO_ATCH_NO);
				IMG_FILE = fileMngService.selectFileInf(IMG_FILE);
				VIDEO_FILE = fileMngService.selectFileInf(VIDEO_FILE);
				
				if(IMG_FILE != null) {
					dvo.setIMG_FILE_NM(IMG_FILE.getOrignlFileNm());
				}
				if(VIDEO_FILE != null) {
					dvo.setVIDEO_FILE_NM(VIDEO_FILE.getOrignlFileNm());
				}
			}
			vo.setDTIL_LIST(centerTemplDetailVO);	// 클리닉 상세 상세 리스트 셋팅
		}
		centerVO.setTMP_LIST(centerTemplVO);		// 클리닉 상세 리스트 셋팅
		
		
		return centerVO;
	}

	// 클리닉 등록
	@Transactional(rollbackFor=Exception.class)
	public int insertCLN(CenterVO centerVO) throws Exception {
		// 태그등록
		if(centerVO.getSEARCH_TAGS() != null) {
			String[] tagArray = centerVO.getSEARCH_TAGS().split(",");
			centerVO.setSEARCH_TAG_ARRAY(tagArray);
		}
		// 클리닉 등록
		adminCLNDAO.insertCLN(centerVO);
		
		// 클리닉 템플릿 가져오기
		List<CenterTemplVO> listTemplVO = centerVO.getTMP_LIST();
		
		for(CenterTemplVO templVo : listTemplVO) {
			// 키값 셋팅
			templVo.setMNG_CD(centerVO.getMNG_CD());
			templVo.setMNG_SEQ(centerVO.getMNG_SEQ());
			
			// 클리닉 템플릿 저장
			adminCLNDAO.updateCLNTmp(templVo);
			
			// 클리닉 템플릿 상세 가져오기
			List<CenterTemplDetailVO> listTemplDetailVo = templVo.getDTIL_LIST();
			
			for(CenterTemplDetailVO vo : listTemplDetailVo) {
				// 키값 셋팅
				vo.setMNG_CD(centerVO.getMNG_CD());
				vo.setMNG_SEQ(centerVO.getMNG_SEQ());
				vo.setSEQ(templVo.getSEQ());
				
				// 이미지 파일 셋팅
				Map<String, MultipartFile> IMG_FILE= new LinkedHashMap<String, MultipartFile>();
				IMG_FILE.put("IMG_FILE", vo.getIMG_FILE());
				
				if (vo.getIMG_FILE() != null) {
					List<FileVO> IMG_FILE_RESULT = fileUtil.parseFileInf(IMG_FILE, "CLN_", 0, "", "");
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(vo.getIMG_ATCH_NO());
					fileMngService.deleteFileInf(fileVO);
					
					String IMG_ATCH_NO = fileMngService.insertFileInfs(IMG_FILE_RESULT);
					if(IMG_ATCH_NO != null)
						vo.setIMG_ATCH_NO(IMG_ATCH_NO);
				}
				
				// 비디오 파일 셋팅
				Map<String, MultipartFile> VIDEO_FILE= new LinkedHashMap<String, MultipartFile>();
				VIDEO_FILE.put("VIDEO_FILE", vo.getVIDEO_FILE());
				
				if (vo.getVIDEO_FILE()!=null) {
					List<FileVO> VIDEO_FILE_RESULT = fileUtil.parseFileInf(VIDEO_FILE, "CLN_", 0, "", "");
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(vo.getVIDEO_ATCH_NO());
					fileMngService.deleteFileInf(fileVO);
					
					String VIDEO_ATCH_NO = fileMngService.insertFileInfs(VIDEO_FILE_RESULT);
					if(VIDEO_ATCH_NO != null)
						vo.setVIDEO_ATCH_NO(VIDEO_ATCH_NO);	
				}

				// 클리닉 템플릿 상세 저장
				adminCLNDAO.updateCLNTmpDetail(vo);
			}
		}
		
		return 1;
	}
	
	// 클리닉 수정
	@Transactional(rollbackFor=Exception.class)
	public int updateCLN(CenterVO centerVO) throws Exception {
		// 태그등록
		if(centerVO.getSEARCH_TAGS() != null) {
			String[] tagArray = centerVO.getSEARCH_TAGS().split(",");
			centerVO.setSEARCH_TAG_ARRAY(tagArray);
		}
		
		// 클리닉 저장
		adminCLNDAO.updateCLN(centerVO);
		
		// 클리닉 템플릿 가져오기
		List<CenterTemplVO> listTemplVO = centerVO.getTMP_LIST();
		
		for(CenterTemplVO templVo : listTemplVO) {
			// 키값 셋팅
			templVo.setMNG_CD(centerVO.getMNG_CD());
			templVo.setMNG_SEQ(centerVO.getMNG_SEQ());
			
			// 클리닉 템플릿 저장
			adminCLNDAO.updateCLNTmp(templVo);
			
			// 클리닉 템플릿 상세 가져오기
			List<CenterTemplDetailVO> listTemplDetailVo = templVo.getDTIL_LIST();
			
			for(CenterTemplDetailVO vo : listTemplDetailVo) {
				// 키값 셋팅
				vo.setMNG_CD(centerVO.getMNG_CD());
				vo.setMNG_SEQ(centerVO.getMNG_SEQ());
				vo.setSEQ(templVo.getSEQ());
				
				// 이미지 파일 셋팅
				Map<String, MultipartFile> IMG_FILE= new LinkedHashMap<String, MultipartFile>();
				IMG_FILE.put("IMG_FILE", vo.getIMG_FILE());
				
				if (vo.getIMG_FILE() != null) {
					List<FileVO> IMG_FILE_RESULT = fileUtil.parseFileInf(IMG_FILE, "CLN_", 0, "", "");
					
					if (!IMG_FILE_RESULT.isEmpty()) {		// 이미지 파일 존재여부 체크
						FileVO fileVO = new FileVO();
						fileVO.setAtchFileId(vo.getIMG_ATCH_NO());
						fileMngService.deleteFileInf(fileVO);
						
						String IMG_ATCH_NO = fileMngService.insertFileInfs(IMG_FILE_RESULT);
						if(IMG_ATCH_NO != null)
							vo.setIMG_ATCH_NO(IMG_ATCH_NO);
					}
				}
				
				// 비디오 파일 셋팅
				Map<String, MultipartFile> VIDEO_FILE= new LinkedHashMap<String, MultipartFile>();
				VIDEO_FILE.put("VIDEO_FILE", vo.getVIDEO_FILE());
				
				if (vo.getVIDEO_FILE()!=null) {
					List<FileVO> VIDEO_FILE_RESULT = fileUtil.parseFileInf(VIDEO_FILE, "CLN_", 0, "", "");
					
					if (!VIDEO_FILE_RESULT.isEmpty()) {		// 비디오 파일 존재여부 체크
						FileVO fileVO = new FileVO();
						fileVO.setAtchFileId(vo.getVIDEO_ATCH_NO());
						fileMngService.deleteFileInf(fileVO);
						
						String VIDEO_ATCH_NO = fileMngService.insertFileInfs(VIDEO_FILE_RESULT);
						if(VIDEO_ATCH_NO != null)
							vo.setVIDEO_ATCH_NO(VIDEO_ATCH_NO);
					}
				}

				// 클리닉 템플릿 상세 저장
				adminCLNDAO.updateCLNTmpDetail(vo);
			}
		}
		
		return 1;
	}
	
	// 클리닉 삭제
	public int deleteCLN(CenterVO centerVO) throws Exception {
		return adminCLNDAO.deleteCLN(centerVO);
	}

	// 정렬 순서 저장
	@Transactional(rollbackFor=Exception.class)
	public int updateOrderChange(CenterVO centerVO) throws Exception {
		return adminCLNDAO.updateOrderChange(centerVO);
	}

	// 질환 리스트 
	@Override
	public List<?> selectDissCode() {
		return adminCLNDAO.selectDissCode();
	}

	// 의료진 리스트 
	@Override
	public List<?> selectDrList() {
		return adminCLNDAO.selectDrList();
	}

}
