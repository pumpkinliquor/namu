package fbcms.user.cmm.src.service;

import java.util.List;


/**
 * 검색 서비스
 * @author 엄국현
 * @since 2020.11.19
 */
public interface UserSearchService {
	public SearchVO selectSearchListAll(SearchVO searchVO);
	public List<?> selectSearchSBMList(SearchVO searchVO);
	public List<?> selectSearchSPCList(SearchVO searchVO);
	public List<?> selectSearchDrList(SearchVO searchVO);
	public int selectSearchBSSListTotCnt(SearchVO searchVO);
	public List<?> selectSearchBSSList(SearchVO searchVO);
	public List<?> selectSearchFaqList(SearchVO searchVO);

}
