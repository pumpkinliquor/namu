package fbcms.admin.lgn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cop.ems.service.EgovSndngMailRegistService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import fbcms.admin.lgn.service.AdminLoginService;

/**
 * 관리자 로그인을 처리하는 비즈니스 구현 클래스
 */
@Service("AdminLoginService")
public class AdminLoginServiceImpl extends EgovAbstractServiceImpl implements AdminLoginService {
	
	@Resource(name="AdminLoginDAO")
	private AdminLoginDAO adminLoginDAO;
	
	/** EgovSndngMailRegistService */
	@Resource(name = "sndngMailRegistService")
	private EgovSndngMailRegistService sndngMailRegistService;
	
	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;
	
	
	/**
	 * EsntlId를 이용한 로그인을 처리한다
	 */
    @Override
	public LoginVO actionLoginByEsntlId(LoginVO vo) throws Exception {

    	LoginVO loginVO = adminLoginDAO.actionLoginByEsntlId(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }
    
	/**
	 * 관리자 로그인을 처리한다
	 */
	@Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {
		
		// 1. 입력한 비밀번호를 암호화한다.
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
		vo.setPassword(enpassword);
		
		// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
		LoginVO loginVO = adminLoginDAO.actionLogin(vo);
		
		// 3. 결과를 리턴한다.
		if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
			// 3-1. 로그인 일시를 DB에 저장
			adminLoginDAO.updateLastLoginDT(vo);
			return loginVO;
		} else {
			loginVO = new LoginVO();
		}
		
		return loginVO;
	}
	
	/**
	 * 로그인인증제한을 조회한다.
	 */
	public Map<?,?> selectLoginIncorrect(LoginVO vo) throws Exception {
		
		return adminLoginDAO.selectLoginIncorrect(vo);
	}
	
	/**
	 * 로그인인증제한을 처리한다.
	 */
	public String processLoginIncorrect(LoginVO vo, Map<?,?> mapLockUserInfo) throws Exception {
		
		String sRtnCode = "C";
		//KISA 보안약점 조치 (2018-10-29, 윤창원)
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), EgovStringUtil.isNullToString(vo.getId()));
		Map<String,String> mapParam = new HashMap<String,String>();
		mapParam.put("USER_SE", vo.getUserSe());
		mapParam.put("id", EgovStringUtil.isNullToString(vo.getId()));//KISA 보안약점 조치 (2018-10-29, 윤창원)
		
		if("Y".equals(((String)mapLockUserInfo.get("lockAt")))) { //잠김시 
			sRtnCode = "L";
		} else if(((String)mapLockUserInfo.get("userPw")).equals(enpassword) ) { //패드워드 인증시 
			//LOCK 해제
			mapParam.put("updateAt", "E");
			adminLoginDAO.updateLoginIncorrect(mapParam);
			sRtnCode = "E";
		} else if(!"Y".equals(((String)mapLockUserInfo.get("lockAt")))) { //패드워드 비인증시
			if( Integer.parseInt(String.valueOf(mapLockUserInfo.get("lockCnt")))+1 >= egovLoginConfig.getLockCount()) { //LOCK 설정				
				mapParam.put("updateAt", "L");
				adminLoginDAO.updateLoginIncorrect(mapParam);
				sRtnCode = "L";
			} else { //LOCK 증가
				mapParam.put("updateAt", "C");
				adminLoginDAO.updateLoginIncorrect(mapParam);
				sRtnCode = "C";
			}
		}
		
		return sRtnCode;
	}
	
	/**
	 * 로그인 권한 조회
	 */
	public List<String> selectLoginAuthority(LoginVO vo) throws Exception {
		List<String> list = new ArrayList<String>();
		String strAuthority = adminLoginDAO.selectLoginAuthority(vo);
		if(strAuthority != null && !strAuthority.isEmpty()) {
			list.add(strAuthority);
		}
		return list;
	}
}
