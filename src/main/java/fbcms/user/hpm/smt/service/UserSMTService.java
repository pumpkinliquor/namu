package fbcms.user.hpm.smt.service;

import java.util.List;
import java.util.Map;

import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.centerVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.hpm.specialityVO;

public interface UserSMTService {

	public List<DRListVO> DRList(Map<String, Object> map) throws Exception;

	public specialityVO specialityList(String code) throws Exception;

	public String likeCheck(Map<String, Object> map) throws Exception;

	public List<?> centerList(Map<String, Object> map) throws Exception;

	public DRListVO drDetail(String DR_ID) throws Exception;

	public List<favoritesDRVO> favoritesDRList(String USER_ID) throws Exception;

	public List<specialityVO> dissList(Map<String, Object> map) throws Exception;

	public String dissListTemp(String dCode) throws Exception;

	public List<?> majorDiseaseList(specialityVO spVO);

}
