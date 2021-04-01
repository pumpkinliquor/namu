package fbcms.user.cmm.src.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import fbcms.user.cmm.src.service.SearchVO;

@Repository("UserSearchDAO")
public class UserSearchDAO extends EgovComAbstractDAO {
	
	public List<?> selectSearchSBMList(SearchVO searchVO) {
		return selectList("UserSearchDAO.selectSearchSBMList",searchVO);
	}
	public List<?> selectSearchSPCList(SearchVO searchVO) {
		return selectList("UserSearchDAO.selectSearchSPCList",searchVO);
	}
	public List<?> selectSearchDrList(SearchVO searchVO) {
		return selectList("UserSearchDAO.selectSearchDrList",searchVO);
	}
	public int selectSearchBSSListTotCnt(SearchVO searchVO) {
		int totCnt = 0;
		try {
			totCnt = selectOne("UserSearchDAO.selectSearchBSSListTotCnt",searchVO);
		} catch (Exception e) {
		}
		return totCnt;
	}
	public List<?> selectSearchBSSList(SearchVO searchVO) {
		return selectList("UserSearchDAO.selectSearchBSSList",searchVO);
	}
	public List<?> selectSearchFaqList(SearchVO searchVO) {
		return selectList("UserSearchDAO.selectSearchFaqList",searchVO);
	}

}
