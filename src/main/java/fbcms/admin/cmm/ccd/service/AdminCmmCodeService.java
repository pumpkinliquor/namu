package fbcms.admin.cmm.ccd.service;

import java.util.List;
import java.util.Map;

/**
 * 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기 위한 서비스 인터페이스
 */
public interface AdminCmmCodeService {
	
    /**
     * 공통코드를 조회한다.
     */
    public List<AdminCmmCodeVO> selectCmmCodeList(AdminCmmCodeVO vo) throws Exception;
    
    /**
     * 공통상세코드를 조회한다.
     */
    public List<AdminCmmCodeVO> selectCmmCodeDetailList(AdminCmmCodeVO vo) throws Exception;
    
    /**
     * 여러개의 코드 리스트를 맵에 담아서 리턴한다.
     */
    public Map<String, List<AdminCmmCodeVO>> selectCmmCodeDetails(List<?> voList) throws Exception;
    
    /**
     * 조직정보를 코드형태로 리턴한다.
     */
    public List<AdminCmmCodeVO> selectOgrnztIdDetailList(AdminCmmCodeVO vo) throws Exception;
    
    /**
     * 그룹정보를 코드형태로 리턴한다.
     */
    public List<AdminCmmCodeVO> selectGroupIdDetailList(AdminCmmCodeVO vo) throws Exception;
}
