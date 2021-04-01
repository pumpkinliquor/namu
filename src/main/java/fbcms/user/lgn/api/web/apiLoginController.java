package fbcms.user.lgn.api.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fbcms.user.lgn.MembersVO;
import fbcms.user.lgn.api.service.apiLoginService;


/**
 * 유저 로그인을 처리하는 컨트롤러 클래스
 */
@Controller
public class apiLoginController {

	@Resource(name = "apiLoginService")
	private apiLoginService apiLoginService;
	
	// 네이버 로그인 아이디 코드 값을 가져오는 콜백
	@RequestMapping(value = "/user/lgn/api/naverLoginCallBack.do")
	public String naverLoginCallBack() {
									
		return "fbcms/user/cmm/lgn/naverLoginCallBack";
					
	}
		
	
	// 회원가입 여부를 확인한다.
	
	@RequestMapping(value = "/user/lgn/api/joinCheck.do")
	@ResponseBody
	public int joinCheck(@RequestBody Map<String, Object> map) throws Exception {
		
		String USER_ID = (String)map.get("USER_ID");
		
		
		int result = apiLoginService.joinCheck(USER_ID);
		
		
		return result;
		
	}
	
	// 회원가입 여부를 확인한다.	
	@RequestMapping(value = "/user/lgn/api/apiCheck.do")
	@ResponseBody
	public int apiCheck(@RequestBody Map<String, Object> map) throws Exception {
		
		String apiID = (String)map.get("USER_ID");
		
		int result = apiLoginService.apiCheck(apiID);
		
		return result;
		
	}	
	
	
	// AJAX로 API ID를 이용해 회원 ID, PW를 가져옴
	@RequestMapping(value = "/user/lgn/api/findforAPI.do")
	@ResponseBody
	public MembersVO findforAPI(@RequestBody Map<String, Object> map) throws Exception {
		
		String apiID = (String)map.get("USER_ID");
		
		MembersVO result = apiLoginService.findforAPI(apiID);	
		
		return result;
		
	}	
	
	
	
	
	// api 회원 등록
	@RequestMapping(value = "/user/lgn/api/apisign.do")
	@ResponseBody
	public int apiSign(@RequestBody Map<String, Object> map) throws Exception {
		
		int result = apiLoginService.apiSign(map);

		return result;
		
	}
	
	
	
}