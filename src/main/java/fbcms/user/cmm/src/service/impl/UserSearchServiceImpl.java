package fbcms.user.cmm.src.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fbcms.user.cmm.src.service.SearchVO;
import fbcms.user.cmm.src.service.UserSearchService;

/**
 * 검색 서비스 impl
 * 
 * @author 엄국현
 * @since 2020.11.19
 */
@Service("UserSearchService")
public class UserSearchServiceImpl implements UserSearchService {

	@Autowired
	private UserSearchDAO userSearchDAO;

	@Override
	public SearchVO selectSearchListAll(SearchVO searchVO) {
		SearchVO resultVO = new SearchVO();
		resultVO.setSbmList(userSearchDAO.selectSearchSBMList(searchVO));
		resultVO.setCenterList(userSearchDAO.selectSearchSPCList(searchVO));
		resultVO.setDoctorList(userSearchDAO.selectSearchDrList(searchVO));
		resultVO.setBoardList(userSearchDAO.selectSearchBSSList(searchVO));
		resultVO.setFaqList(userSearchDAO.selectSearchFaqList(searchVO));
		return resultVO;
	}

	@Override
	public List<?> selectSearchSBMList(SearchVO searchVO) {
		return userSearchDAO.selectSearchSBMList(searchVO);
	}

	@Override
	public List<?> selectSearchSPCList(SearchVO searchVO) {
		return userSearchDAO.selectSearchSPCList(searchVO);
	}

	@Override
	public List<?> selectSearchDrList(SearchVO searchVO) {
		return userSearchDAO.selectSearchDrList(searchVO);
	}

	@Override
	public int selectSearchBSSListTotCnt(SearchVO searchVO) {
		return userSearchDAO.selectSearchBSSListTotCnt(searchVO);
	}
	
	@Override
	public List<?> selectSearchBSSList(SearchVO searchVO) {
		return userSearchDAO.selectSearchBSSList(searchVO);
	}

	@Override
	public List<?> selectSearchFaqList(SearchVO searchVO) {
		return userSearchDAO.selectSearchFaqList(searchVO);
	}
	
	
}
