package fbcms.com.danal.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fbcms.com.cmm.FbcmsCommonUtils;

/**
 * 다날 결제시스템 페이지 이동 컨트롤러
 * @author 김명진
 * @since 2010.10.30
 */
@Controller
public class DanalController {
	private static final Logger LOGGER = LoggerFactory.getLogger(DanalController.class);
	
	@RequestMapping(value="/danal/Ready.do")
	public String danalReady(HttpServletRequest request,@ModelAttribute ModelMap model) throws Exception {
		
		return FbcmsCommonUtils.mobileJspReplace(request, "fbcms/com/danal/Ready");
	}
	
	@RequestMapping(value="/danal/CPCGI.do", method=RequestMethod.POST)
	public String danalCPCGI(HttpServletRequest request,@ModelAttribute ModelMap model) throws Exception {

		return FbcmsCommonUtils.mobileJspReplace(request, "fbcms/com/danal/CPCGI");
	}
	
	@RequestMapping(value="/danal/BackURL.do")
	public String danalBackURL(HttpServletRequest request,@ModelAttribute ModelMap model) throws Exception {
		
		return FbcmsCommonUtils.mobileJspReplace(request, "fbcms/com/danal/BackURL");
	}
	
	@RequestMapping(value="/danal/Success.do")
	public String danalSuccess(HttpServletRequest request,@ModelAttribute ModelMap model) throws Exception {
		
		model.addAttribute("TID", (String)request.getParameter("TID"));
		model.addAttribute("NAME", (String)request.getParameter("NAME"));
		model.addAttribute("IDEN", (String)request.getParameter("IDEN"));
		model.addAttribute("PHONE", (String)request.getParameter("PHONE"));
		
		return FbcmsCommonUtils.mobileJspReplace(request, "fbcms/com/danal/Success");
	}
}
