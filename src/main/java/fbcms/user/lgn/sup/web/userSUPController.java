package fbcms.user.lgn.sup.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileScrty;
import fbcms.com.cmm.FbcmsCommonUtils;
import fbcms.user.lgn.MemberVO;
import fbcms.user.lgn.sup.service.UserSUPService;

/**
 * @since 2020.10.05
 * @Description 유저 회원가입(userSignUP)을 위한 컨트롤러 클래스
 * @author 김명진
 */
@Controller
public class userSUPController {

	/** EgovMessageSource */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	/** 회원가입 **/
	@Resource(name = "UserSUPService")
	private UserSUPService UserSUPService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(userSUPController.class);

	@RequestMapping(value = "/user/cmm/mem/signup.do")
	public String signupPage(HttpServletRequest request, HttpServletResponse response, ModelMap model, MemberVO memberVO, Map<String,Object> map , String step, String name,
			String agree01, String agree02, String api, String apiID, String apiName, String apiGender, String apiEmail) throws Exception {
		FbcmsCommonUtils.getMenuNavigation(request, model, "000000");
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if (user != null && user.getId() != null) {
			return "redirect:/";
		}
		String ref = (String)request.getHeader("REFERER");
		
		int result = UserSUPService.repetitionCheck(memberVO);
		if (result > 0) {
			model.addAttribute("message", "회원정보가 이미 존재합니다");
			model.addAttribute("ref", ref);
			return "redirect:/user/lgn/sin/userLogin.do";
		}
		if(apiGender != null && apiGender.equals("male")) {
			apiGender = "M";
		}
		else if(apiGender != null && apiGender.equals("female")) {
			apiGender = "F";
		}
		
		if (step == null) {
		
			System.out.println("API에서 가져온 자료들!! 컨트롤러 >>>  "+api+", "+apiID+", "+apiName+", "+apiGender+", "+apiEmail);
			
			map.put("api", api);
			map.put("apiID", apiID);
			map.put("apiName", apiName);
			map.put("apiGender", apiGender);
			map.put("apiEmail", apiEmail);
			
			model.addAttribute("map", map);
			model.addAttribute("ref", ref);
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mem/memberSignUPStep01");
			
		} else {
						
			System.out.println("API에서 가져온 자료들!! 컨트롤러 2 >>>  "+api+", "+apiID+", "+apiName+", "+apiGender+", "+apiEmail);
			
			if (step.equals("02")) {
				model.addAttribute("agree01", true);
				model.addAttribute("agree02", true);
				map.put("api", api);
				map.put("apiID", apiID);
				map.put("apiName", apiName);
				map.put("apiGender", apiGender);
				map.put("apiEmail", apiEmail);
				
			} else if (step.equals("03")) {
				map.put("api", api);
				map.put("apiID", apiID);
				map.put("apiEmail", apiEmail);
				model.addAttribute("memberinfo", memberVO);
				
			} else if (step.equals("04")) {
				model.addAttribute("name", name);
			}
			model.addAttribute("ref", ref);
			return FbcmsCommonUtils.mobileJspReplace(request, "user/cmm/mem/memberSignUPStep" + step);
		}
	}

	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/user/cmm/mem/sign.do")
	@ResponseBody
	public int sign(@RequestBody Map<String, Object> map) throws Exception {
		String pass = (String)map.get("pass");
		String id = (String)map.get("user_Id");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUSER_ID(id);
		int result = UserSUPService.repetitionCheck(memberVO);
		if(result == 0) {
			pass = EgovFileScrty.encryptPassword(pass, id);
			map.put("pass", pass);
			result = UserSUPService.sign(map);
		}
		return result;
	}
	
	/**
	 * 회원가입 후 권한 insert
	 */
	@RequestMapping(value = "/user/cmm/mem/sign2.do")
	@ResponseBody
	public int sign2(@RequestBody Map<String, Object> map) throws Exception {
		return UserSUPService.sign2(map); 
	}
}
