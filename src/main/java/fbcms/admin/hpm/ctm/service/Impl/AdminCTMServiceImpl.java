package fbcms.admin.hpm.ctm.service.Impl;

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
import fbcms.admin.hpm.ctm.service.AdminCTMService;

/**
 * 센터관리 서비스
 * @author 김명진
 * @since 2020.10.14
 */
@Service("AdminCTMService")
public class AdminCTMServiceImpl extends EgovAbstractServiceImpl implements AdminCTMService {
	@Autowired
	private AdminCTMDAO adminCTMDAO;
	@Autowired
	private AdminOcsCTMDAO adminOcsCTMDAO;
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	


	@Override
	/**
	 * Ocs 특화센터리스트
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public List selectOcsCTMList(CenterVO centerVO) throws Exception {
		return adminOcsCTMDAO.selectOcsCTMList(centerVO);
	}

	@Override
	/**
	 * 특화센터 템플릿 타입
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public CenterVO selectCTMTmpType(CenterVO centerVO) throws Exception {
		return adminCTMDAO.selectCTMTmpType(centerVO);
	}

	@Override
	/**
	 * 특화센터 수정
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	@Transactional(rollbackFor=Exception.class)
	public int updateCTM(CenterVO centerVO, CenterTemplVO centerTemplVO, CenterTemplDetailVO centerTemplDetailVO) throws Exception {
		if(centerTemplVO != null)
			adminCTMDAO.updateCTMTmp(centerTemplVO);
		if(centerTemplDetailVO != null) {
			for(CenterTemplDetailVO vo:centerTemplDetailVO.getDTIL_LIST()) {
				Map<String, MultipartFile> IMG_FILE= new LinkedHashMap<String, MultipartFile>();
				IMG_FILE.put("IMG_FILE", vo.getIMG_FILE());
				if (vo.getIMG_FILE() != null) {
					List<FileVO> IMG_FILE_RESULT = fileUtil.parseFileInf(IMG_FILE, "CTM_", 0, "", "");
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(vo.getIMG_ATCH_NO());
					fileMngService.deleteFileInf(fileVO);
					String IMG_ATCH_NO = fileMngService.insertFileInfs(IMG_FILE_RESULT);
					if(IMG_ATCH_NO != null)
						vo.setIMG_ATCH_NO(IMG_ATCH_NO);
				}
				
				Map<String, MultipartFile> VIDEO_FILE= new LinkedHashMap<String, MultipartFile>();
				VIDEO_FILE.put("VIDEO_FILE", vo.getVIDEO_FILE());
				if (vo.getVIDEO_FILE()!=null) {
					List<FileVO> VIDEO_FILE_RESULT = fileUtil.parseFileInf(VIDEO_FILE, "CTM_", 0, "", "");
					FileVO fileVO = new FileVO();
					fileVO.setAtchFileId(vo.getVIDEO_ATCH_NO());
					fileMngService.deleteFileInf(fileVO);
					String VIDEO_ATCH_NO = fileMngService.insertFileInfs(VIDEO_FILE_RESULT);
					if(VIDEO_ATCH_NO != null)
						vo.setVIDEO_ATCH_NO(VIDEO_ATCH_NO);	
				}
				vo.setMNG_CD(centerVO.getMNG_CD());
				adminCTMDAO.updateCTMTmpDetail(vo);
			}
		}
		return adminCTMDAO.updateCTM(centerVO);
	}
	
	/**
	 * 특화센터 상세
	 * @param centerVO
	 * @return
	 * @throws Exception
	 */
	public CenterVO selectCTM(CenterVO centerVO) throws Exception{
		//WHERE 검색 조건
		CenterTemplVO centerTemplVO = new CenterTemplVO();
		centerTemplVO.setMNG_GUBN_CD(centerVO.getMNG_GUBN_CD());
		centerTemplVO.setMNG_SEQ(centerVO.getMNG_SEQ());
		centerTemplVO.setMNG_CD(centerVO.getMNG_CD());
		
		centerVO.setTMP_LIST(adminCTMDAO.selectCTMTmpList(centerTemplVO));
		
		List<CenterTemplVO> TMP_LIST = centerVO.getTMP_LIST();
		
		for(CenterTemplVO vo:TMP_LIST) {
			//WHERE 검색 조건
			CenterTemplDetailVO centerTemplDetailVO = new CenterTemplDetailVO();
			centerTemplDetailVO.setMNG_GUBN_CD(centerTemplVO.getMNG_GUBN_CD());
			centerTemplDetailVO.setMNG_CD(centerTemplVO.getMNG_CD());
			centerTemplDetailVO.setMNG_SEQ(centerTemplVO.getMNG_SEQ());
			
			vo.setDTIL_LIST(adminCTMDAO.selectCTMTmpDetailList(centerTemplDetailVO));
			
			for(CenterTemplDetailVO dvo :vo.getDTIL_LIST()) {
				//이미지, 동영상 파일 이름 가져오기.
				String IMG_ATCH_NO = dvo.getIMG_ATCH_NO();
				String VIDEO_ATCH_NO = dvo.getVIDEO_ATCH_NO();
				FileVO IMG_FILE = new FileVO();
				FileVO VIDEO_FILE = new FileVO();
				IMG_FILE.setAtchFileId(IMG_ATCH_NO);
				VIDEO_FILE.setAtchFileId(VIDEO_ATCH_NO);
				IMG_FILE = fileMngService.selectFileInf(IMG_FILE);
				VIDEO_FILE = fileMngService.selectFileInf(VIDEO_FILE);
				if(IMG_FILE != null)
					dvo.setIMG_FILE_NM(IMG_FILE.getOrignlFileNm());
				if(VIDEO_FILE != null)
					dvo.setVIDEO_FILE_NM(VIDEO_FILE.getOrignlFileNm());
			}
		}
		CenterVO vo = adminCTMDAO.selectCTM(centerVO);
		centerVO.setSEARCH_TAGS(vo.getSEARCH_TAGS());
		centerVO.setREG_DT(vo.getREG_DT());
		centerVO.setRLT_MEDI_USE_YN(vo.getRLT_MEDI_USE_YN());
		centerVO.setIMP_DISS_USE_YN(vo.getIMP_DISS_USE_YN());
		return centerVO;
	}
	
}
