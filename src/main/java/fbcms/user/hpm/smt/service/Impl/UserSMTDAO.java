package fbcms.user.hpm.smt.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import fbcms.admin.hpm.bbs.service.AdminBoard;
import fbcms.user.hpm.hpm.DRListVO;
import fbcms.user.hpm.hpm.centerVO;
import fbcms.user.hpm.hpm.favoritesDRVO;
import fbcms.user.hpm.hpm.specialityVO;


@Repository("UserSMTDAO")
public class UserSMTDAO  extends EgovComAbstractDAO {

	// 진료과 코드를 이용한 해당 과 의사 리스트
	public List<DRListVO> DRList(Map<String, Object> map) throws Exception{

		return selectList("UserSMT.DrList", map);
		
	}

	
 	// 진료과 내용 리스트
	public specialityVO specialityList(String code) throws Exception {
	
		return selectOne("UserSMT.specialityList", code);
		
	}
	
	// 관련 센터 리스트
	public List<?> centerList(Map<String, Object> map) {
		
		return selectList("UserSMT.centerList", map);
		
	}
	
	
	// 선호 의사 리스트
	public List<favoritesDRVO> favoritesDRList(String USER_ID) throws Exception{
		
		return selectList("UserSMT.favoritesDRList", USER_ID);
		
	}

	
	// 선호 의사 체크
	public String likeCheck(Map<String, Object> map) {
			
		
		String ch = (String)map.get("check");
		
		String check = "";
		
		if(ch.equals("N")) {
			
			check = selectOne("UserSMT.likeCheck", map);
			
			
			if(check==null) {
				
				insert("UserSMT.createLike", map);
			
			}
			
			else {
				
				map.put("check", "Y");
				
				update("UserSMT.changeLike", map);
				
			}
			
			
		}
		
		else {
			
			map.put("check", "N");
			
			update("UserSMT.changeLike", map);
			
		}
		
		check = selectOne("UserSMT.likeCheck", map);
		
		
		return check;
	}

	
	// 상세보기
	public DRListVO drDetail(String DR_ID) {
		return selectOne("UserSMT.drDetail", DR_ID);
	}


	// 질병 리스트
	public List<specialityVO> dissList(Map<String, Object> map) {
		
		List<specialityVO> dissList = selectList("UserSMT.dissList", map);
		
		for(int i=0; i<dissList.size(); i++) {
		
		}
		return dissList;
	}


	public String dissListTemp(String dCode) {
		return selectOne("UserSMT.dissListTemp", dCode);
	}


	public List<?> majorDiseaseList(specialityVO spVO) {
		return selectList("UserSMT.majorDiseaseList", spVO);
	}


	

}
