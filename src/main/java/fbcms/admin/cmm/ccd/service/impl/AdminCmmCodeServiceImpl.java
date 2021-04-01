package fbcms.admin.cmm.ccd.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeService;
import fbcms.admin.cmm.ccd.service.AdminCmmCodeVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 공통코드등 전체 업무에서 공용해서 사용해야 하는 서비스를 정의하기위한 서비스 구현 클래스
 */
@Service("AdminCmmCodeService")
public class AdminCmmCodeServiceImpl extends EgovAbstractServiceImpl implements AdminCmmCodeService {

    @Resource(name = "AdminCmmCodeDAO")
    private AdminCmmCodeDAO adminCmmCodeDAO;
    
    
    /**
     * 공통코드를 조회한다.
     */
    public List<AdminCmmCodeVO> selectCmmCodeList(AdminCmmCodeVO vo) throws Exception {
    	return adminCmmCodeDAO.selectCmmCodeList(vo);
    }

    /**
     * 공통상세코드를 조회한다.
     */
    public List<AdminCmmCodeVO> selectCmmCodeDetailList(AdminCmmCodeVO vo) throws Exception {
    	return adminCmmCodeDAO.selectCmmCodeDetailList(vo);
    }

    /**
     * 여러개의 코드 리스트를 맵에 담아서 리턴한다.
     */
    public Map<String, List<AdminCmmCodeVO>> selectCmmCodeDetails(List<?> voList) throws Exception {
    	AdminCmmCodeVO vo;
		Map<String, List<AdminCmmCodeVO>> map = new HashMap<String, List<AdminCmmCodeVO>>();

		Iterator<?> iter = voList.iterator();
		while (iter.hasNext()) {
		    vo = (AdminCmmCodeVO)iter.next();
		    map.put(vo.getCodeId(), adminCmmCodeDAO.selectCmmCodeDetailList(vo));
		}

		return map;
    }

    /**
     * 조직정보를 코드형태로 리턴한다.
     */
    public List<AdminCmmCodeVO> selectOgrnztIdDetailList(AdminCmmCodeVO vo) throws Exception {
    	return adminCmmCodeDAO.selectOgrnztIdDetailList(vo);
    }

    /**
     * 그룹정보를 코드형태로 리턴한다.
     */
    public List<AdminCmmCodeVO> selectGroupIdDetailList(AdminCmmCodeVO vo) throws Exception {
    	return adminCmmCodeDAO.selectGroupIdDetailList(vo);
    }
}
