package fbcms.com.cmm;

import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.terracotta.agent.repkg.de.schlichtherle.io.FileInputStream;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.sun.star.xml.sax.InputSource;

import egovframework.com.cmm.ComDefaultCodeVO;
import fbcms.admin.hpm.bbs.service.AdminBoardVO;
import fbcms.admin.rcm.cst.web.AdminCSTController;

/**
 * 공통유틸 모음
 */
public class FbcmsCommonUtils {

	private static final Logger LOGGER = LoggerFactory.getLogger(FbcmsCommonUtils.class);

	public final static String ZERO_2 = "00";
	public final static String ZERO_4 = "0000";
	public final static String NODE_TYPE_1 = "1";
	public final static String NODE_NAME_MENU = "menu";
	public final static String NODE_NAME_CHILD = "name";
	

	/**
	 * lnb, gnb, navigation 가져오기
	 */
	public static void getMenuNavigation(HttpServletRequest request
			, ModelMap model
			, String pageId) throws Exception {
		
		getMenuNavigation(request, model, pageId, "");
	}
	
	/**
	 * lnb, gnb, navigation 가져오기
	 */
	public static void getMenuNavigation(HttpServletRequest request
			, ModelMap model
			, String pageId
			, String menuEncoding ) throws Exception {
		
		DocumentBuilder documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document document = documentBuilder.parse(new File(request.getSession().getServletContext().getRealPath("/WEB-INF") + "/config/menu/menu.xml"));
		if(!"".equals(menuEncoding)) {
			document = documentBuilder.parse(new File(request.getSession().getServletContext().getRealPath("/WEB-INF") + "/config/menu/menu_" + menuEncoding + ".xml"));
		}
		
		String depth1Area = pageId.substring(0, 2);
		String depth2Area = pageId.substring(2, 4);
		String depth3Area = pageId.substring(4, 6);
		String depth1Id = "";
		String depth2Id = "";
		String depth3Id = "";
		String depth1Name = "";
		String depth2Name = "";
		String depth3Name = "";
		
		if(!ZERO_2.equals(depth2Area)) {
			if(ZERO_2.equals(depth3Area)) {
				depth1Id = depth1Area + ZERO_4;
				depth2Id = depth1Area + depth2Area + ZERO_2;
			} else {
				depth1Id = depth1Area + ZERO_4;
				depth2Id = depth1Area + depth2Area + ZERO_2;
				depth3Id = pageId;
			}
		} else {
			depth1Id = depth1Area + ZERO_4;
		}

		List<HashMap<String, String>> gnbList = new ArrayList<HashMap<String, String>>();
		List<HashMap<String, String>> lnbList = new ArrayList<HashMap<String, String>>();
		List<HashMap<String, String>> navList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> gnbNodeMap = new HashMap<String, String>();
		HashMap<String, String> lnbNodeMap = new HashMap<String, String>();
		HashMap<String, String> navNodeMap = new HashMap<String, String>();
		
		NodeList nodeList = document.getElementsByTagName(NODE_NAME_MENU);
		for(int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			String menuId = node.getAttributes().item(0).getNodeValue();
			NodeList child = nodeList.item(i).getChildNodes();
			
			// GNB
			gnbNodeMap = initHashMapString();
			for(int j = 0; j < child.getLength(); j++) {
				Node childNode = child.item(j);
				if(NODE_TYPE_1.equals(Short.toString(childNode.getNodeType())) && !NODE_NAME_MENU.equals(childNode.getNodeName())) {
					gnbNodeMap.put(childNode.getNodeName(), childNode.getTextContent());
					
					if(menuId.equals(depth1Id) && "name".equals(childNode.getNodeName())) {
						depth1Name = childNode.getTextContent();
					} else if(menuId.equals(depth2Id) && "name".equals(childNode.getNodeName())) {
						depth2Name = childNode.getTextContent();
					} else if(menuId.equals(depth3Id) && "name".equals(childNode.getNodeName())) {
						depth3Name = childNode.getTextContent();
					}
				}
			}
			gnbNodeMap.put("id",  menuId);
			gnbList.add(gnbNodeMap);
			
			// LNB
			if(depth1Area.equals(menuId.substring(0,  2))) {
				lnbNodeMap = initHashMapString();
				for(int j = 0; j < child.getLength(); j++) {
					Node childNode = child.item(j);
					if(NODE_TYPE_1.equals(Short.toString(childNode.getNodeType())) && !NODE_NAME_MENU.equals(childNode.getNodeName())) {
						lnbNodeMap.put(childNode.getNodeName(), childNode.getTextContent());
					}
				}
				lnbNodeMap.put("id",  menuId);
				lnbList.add(lnbNodeMap);
			}
			
			// NAVIGATION
			if(menuId.equals(depth1Id) || menuId.equals(depth2Id) || menuId.equals(depth3Id)) {
				navNodeMap = initHashMapString();
				for(int j = 0; j < child.getLength(); j++) {
					Node childNode = child.item(j);
					if(NODE_TYPE_1.equals(Short.toString(childNode.getNodeType())) && !NODE_NAME_MENU.equals(childNode.getNodeName())) {
						navNodeMap.put(childNode.getNodeName(), childNode.getTextContent());
					}
				}
				navList.add(navNodeMap);
			}
		}

		model.addAttribute("gnbCnt", gnbList.size());
		model.addAttribute("lnbCnt", lnbList.size());
		model.addAttribute("navCnt", navList.size());
		model.addAttribute("gnbList", gnbList);
		model.addAttribute("lnbList", lnbList);
		model.addAttribute("navList", navList);
		model.addAttribute("depth1Id", depth1Id);
		model.addAttribute("depth2Id", depth2Id);
		model.addAttribute("depth3Id", depth3Id);
		model.addAttribute("depth1Name", depth1Name);
		model.addAttribute("depth2Name", depth2Name);
		model.addAttribute("depth3Name", depth3Name);
	}
	
	public static String clearXSSMinimum(String value) {
		if (value == null || value.trim().equals("")) {
			return "";
		}

		String returnValue = value;

		returnValue = returnValue.replaceAll("&", "&amp;");
		returnValue = returnValue.replaceAll("<", "&lt;");
		returnValue = returnValue.replaceAll(">", "&gt;");
		returnValue = returnValue.replaceAll("\"", "&#34;");
		returnValue = returnValue.replaceAll("\'", "&#39;");
		returnValue = returnValue.replaceAll("\\.", "&#46;");
		returnValue = returnValue.replaceAll("%2E", "&#46;");
		returnValue = returnValue.replaceAll("%2F", "&#47;");
		return returnValue;
	}
	
	public static String clearXSSMaximum(String value) {
		String returnValue = value;
		returnValue = clearXSSMinimum(returnValue);

		returnValue = returnValue.replaceAll("%00", null);

		returnValue = returnValue.replaceAll("%", "&#37;");

		// \\. => .

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\
		returnValue = returnValue.replaceAll("\\./", ""); // ./
		returnValue = returnValue.replaceAll("%2F", "");

		return returnValue;
	}
	
	public static String filePathBlackList(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("\\.\\.", "");

		return returnValue;
	}
	
	/**
	 * 행안부 보안취약점 점검 조치 방안.
	 */
	public static String filePathReplaceAll(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("/", "");
		returnValue = returnValue.replaceAll("\\", "");
		returnValue = returnValue.replaceAll("\\.\\.", ""); // ..
		returnValue = returnValue.replaceAll("&", "");

		return returnValue;
	}
	
	public static String fileInjectPathReplaceAll(String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		
		returnValue = returnValue.replaceAll("/", "");
		returnValue = returnValue.replaceAll("\\..", ""); // ..
		returnValue = returnValue.replaceAll("\\\\", "");// \
		returnValue = returnValue.replaceAll("&", "");

		return returnValue;
	}
	
	public static String filePathWhiteList(String value) {
		return value;
	}
	
	public static boolean isIPAddress(String str) {
		Pattern ipPattern = Pattern.compile("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}");

		return ipPattern.matcher(str).matches();
    }
	
	public static String removeCRLF(String parameter) {
		return parameter.replaceAll("\r", "").replaceAll("\n", "");
	}
	
	public static String removeSQLInjectionRisk(String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "").replaceAll("%", "").replaceAll(";", "").replaceAll("-", "").replaceAll("\\+", "").replaceAll(",", "");
	}
	
	public static String removeOSCmdRisk(String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "").replaceAll("|", "").replaceAll(";", "");
	}
	
	/**
	 * XSS 방지 처리.
	 */
	public static String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}
		
		String ret = data;
		
		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
		
		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
		
		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
		
		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		
		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}
	
	/**
	 * 시간을 LIST를 반환한다.
	 */
	public static List<ComDefaultCodeVO> getTimeHH() {
		ArrayList<ComDefaultCodeVO> listHH = new ArrayList<ComDefaultCodeVO>();
		for (int i = 0; i <= 24; i++) {
			String sHH = "";
			String strI = String.valueOf(i);
			if (i < 10) {
				sHH = "0" + strI;
			} else {
				sHH = strI;
			}

			ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
			codeVO.setCode(sHH);
			codeVO.setCodeNm(sHH);

			listHH.add(codeVO);
		}

		return listHH;
	}
	
	/**
	 * 분을 LIST를 반환한다.
	 */
	public static List<ComDefaultCodeVO> getTimeMM() {
		ArrayList<ComDefaultCodeVO> listMM = new ArrayList<ComDefaultCodeVO>();
		for (int i = 0; i <= 60; i++) {

			String sMM = "";
			String strI = String.valueOf(i);
			if (i < 10) {
				sMM = "0" + strI;
			} else {
				sMM = strI;
			}

			ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
			codeVO.setCode(sMM);
			codeVO.setCodeNm(sMM);

			listMM.add(codeVO);
		}
		return listMM;
	}
	
	/**
	 * 0을 붙여 반환
	 */
	public static String dateTypeIntForString(int iInput) {
		String sOutput = "";
		if (Integer.toString(iInput).length() == 1) {
			sOutput = "0" + Integer.toString(iInput);
		} else {
			sOutput = Integer.toString(iInput);
		}

		return sOutput;
	}
	
	/**
	 * HashMap 기본 초기화
	 */
	public static HashMap<String, Object> initHashMap() {
		return new HashMap<String, Object>();
	}
	
	/**
	 * HashMap String 초기화
	 */
	public static HashMap<String, String> initHashMapString() {
		return new HashMap<String, String>();
	}
	
	
	/**
	 * 구글 SMTP 통해서 메일 발송하기
	 */
	public static void sendMailSMTP(HttpServletRequest request
			, Map<String, Object> mailMap
			, ModelMap model) throws Exception {
		
		// 메일 인코딩
	    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
	    final String username = "namuhmarketing@gmail.com";         
	    final String password = "vjotuezkupdggste";
	    
	    // 메일 옵션 설정
	    Properties props = new Properties();    
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	 
	    props.put("mail.smtp.quitwait", "false");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactory.fallback", "false");
	    
	    try {
	    	// 메일 서버  인증 계정 설정
	    	Authenticator auth = new Authenticator() {
	    		protected PasswordAuthentication getPasswordAuthentication() {
	    			return new PasswordAuthentication(username, password);
	    		}
	    	};
	    	
	    	// 메일 세션 생성
	    	Session session = Session.getInstance(props, auth);
	    	
	    	// 메일 송/수신 옵션 설정
	    	Message message = new MimeMessage(session);
	    	message.setFrom(new InternetAddress((String)mailMap.get("fromEmail"), (String)mailMap.get("fromUsername")));
	    	message.setRecipients(RecipientType.TO, InternetAddress.parse((String)mailMap.get("toEmail"), false));
	    	message.setSubject((String)mailMap.get("subject"));
	    	message.setSentDate(new Date());
	    	
	    	// 메일 콘텐츠 설정
	    	Multipart mParts = new MimeMultipart();
	    	MimeBodyPart mTextPart = new MimeBodyPart();
	    	
	    	// 메일 콘텐츠 - 내용
	    	mTextPart.setText((String)mailMap.get("sendHtml"), bodyEncoding, "html");
	    	mParts.addBodyPart(mTextPart);
	    	
	    	// 메일 콘텐츠 설정
	    	message.setContent(mParts);
	    	
	    	// MIME 타입 설정
	    	MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	    	MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	    	MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	    	MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	    	MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	    	MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	    	CommandMap.setDefaultCommandMap(MailcapCmdMap);
	    	
	    	// 메일 발송
	    	Transport.send( message );
	    } catch ( Exception e ) {
	      e.printStackTrace();
	    }
	}
	
	/**
	 * 모바일 체크후 true/false return
	 */
	public static boolean mobileCheck(HttpServletRequest request) {
		
		String userAgent = request.getHeader("user-agent");
		boolean bMobile1 = userAgent.matches(".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean bMobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (bMobile1 || bMobile2) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 모바일 체크후 jsp 호출을 바꿈
	 */
	public static String mobileJspReplace(HttpServletRequest request
			, String returnStr ) {
		
		return mobileJspReplace(request, returnStr, "", "");
	}
	
	/**
	 * 모바일 체크후 jsp 호출을 바꿈
	 */
	public static String mobileJspReplace(HttpServletRequest request
			, String returnStr
			, String encoding
			, String mobileEncoding) {
		
		String userAgent = request.getHeader("user-agent");
		boolean bMobile1 = userAgent.matches(".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean bMobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (bMobile1 || bMobile2) {
			
			if("".equals(mobileEncoding)) {
				return returnStr.replace("user/", "mobile/");
			} else {
				return returnStr.replace(encoding, mobileEncoding);
			}
		} else {
			return returnStr;
		} 
	}
	
	/**
	 * CST 메일전송 html
	 */
	public static StringBuffer sendEmailHtmlCST(HttpServletRequest request
			, HashMap<String, String> map ) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("<!DOCTYPE HTML>");
		sb.append("<html lang=\"ko\">");
		sb.append("<!DOCTYPE HTML>");
		sb.append("<!DOCTYPE HTML>");
		sb.append("<html lang=\"ko\">");
		sb.append("<head>");
		sb.append("	<meta charset=\"UTF-8\">");
		sb.append("	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
		sb.append("	<title>비에비스 나무병원</title>");
		sb.append("	<style>");
		sb.append("		");
		sb.append("		body, #bodywrap{font-family:'Noto Sans KR','Malgun Gothic',arial,helvetica,sans-serif;font-size:16px;font-weight:normal;}");
		sb.append("");
		sb.append("	</style>");
		sb.append("</head>");
		sb.append("<body style=\"margin:0;padding:0;\">");
		sb.append("	<div align=\"center\" id=\"bodywrap\">");
		sb.append("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"700\">");
		sb.append("			<tr>");
		sb.append("				<td style=\"padding:40px\" bgcolor=\"#f4f4f4\">");
		sb.append("					<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("						<tr>");
		sb.append("							<td style=\"padding:30px;border:1px solid #ddd\" bgcolor=\"#fff\">");
		sb.append("								<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("									<tr>");
		sb.append("										<td style=\"padding-bottom:42px\">");
		sb.append("											<a href=\"https://www.namu.com/\" target=\"_blank\"><img src=\"https://www.namu.com/images/fbcms/user/logo.png\" alt=\"비에비스 나무병원\" width=\"149\" height=\"50\"/></a>");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td align=\"center\" style=\"font-size:36px;color:#333;font-weight:bold;line-height:1.5\">");
		sb.append("											비에비스 나무병원<br/>");
		sb.append("											<span style=\"color:#00afaf\">의료상담 답변이 등록</span>되었습니다");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td align=\"center\" style=\"font-size:16px;color:#666;line-height:1.5;padding:20px 0 40px;\">");
		sb.append("											<span style=\"font-weight:bold;color:#333;\">" + map.get("userNm") + "</span>님, 안녕하세요!<br/>");
		sb.append("											<span style=\"font-weight:bold;color:#333;\">" + map.get("custom1") + "</span> 에 등록하신 상담에 답변이 등록되었습니다");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td bgcolor=\"#f8f8f8\" style=\"font-size:18px;color:#333;padding:0 30px;border-bottom:1px solid #ddd\"\" height=\"73\">");
		sb.append("											<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("												<tr>");
		sb.append("													<td width=\"20\" style=\"vertical-align:top\">Q.</td>");
		sb.append("													<td style=\"word-break:keep-all;\">" + map.get("nttSj") + "</td>");
		sb.append("												</tr>");
		sb.append("											</table>");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td bgcolor=\"#f8f8f8\" style=\"padding:20px 30px;\" height=\"120\">");
		sb.append("											<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("												<tr>");
		sb.append("													<td width=\"20\" style=\"font-size:16px;color:#666;vertical-align:top\">A.</td>");
		sb.append("													<td style=\"font-size:16px;color:#666;word-break:keep-all;\">");
		sb.append("													" + map.get("replyNttCn") + "");
		sb.append("													</td>");
		sb.append("												</tr>");
		sb.append("											</table>");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td style=\"padding:60px 0 30px\" align=\"center\">");
		sb.append("											<button type=\"button\" onclick=\"\" style=\"font-size:18px;color:#fff;text-decoration:none;border:0;background:#046a92;width:270px;height:50px;font-weight:bold;outline:none;cursor:pointer\">답변 더보기</button>");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("								</table>");
		sb.append("							</td>");
		sb.append("						</tr>");
		sb.append("						<tr>");
		sb.append("							<td style=\"padding:20px 0;border:1px solid #ddd;border-top:0\" align=\"center\" bgcolor=\"#f8f8f8\">");
		sb.append("								<p style=\"color:#777;font-size:14px;font-weight:bold;\">본 메일은 발신 전용입니다.</p>");
		sb.append("								<address style=\"font-size:13px;color:#999;font-style:normal;font-weight:bold;line-height:1.7;padding:10px 0\">");
		sb.append("									비에비스 나무병원 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;;\">ㅣ</span> ");
		sb.append("									대표 : 홍성수 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									주소 : 서울시 강남구 논현로 627<br/>");
		sb.append("									개인정보보호 실무담당자 : 운영팀 전수경 실장 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									전화번호 : <span style=\"\">02-519-8925</span> ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									<a href=\"mailto:jineyjun@namu.com\" style=\"color:#999;text-decoration:none;font-weight:400\">jineyjun@namu.com</a>");
		sb.append("								</address>");
		sb.append("								<p style=\"font-size:13px;color:#999\">Copyright © VIEVIS NAMUH. All Rights Reserved.</p>");
		sb.append("							</td>");
		sb.append("						</tr>");
		sb.append("					</table>");
		sb.append("				</td>");
		sb.append("			</tr>");
		sb.append("		</table>");
		sb.append("	</div>");
		sb.append("</body>");
		sb.append("</html>");
		
		return sb;
	}
	
	/**
	 * 예약완료 메일전송 html
	 */
	public static StringBuffer sendEmailAdminHtml(HttpServletRequest request
			, HashMap<String, String> map ) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("<!DOCTYPE HTML>");
		sb.append("<html lang=\"ko\">");
		sb.append("<!DOCTYPE HTML>");
		sb.append("<!DOCTYPE HTML>");
		sb.append("<html lang=\"ko\">");
		sb.append("<head>");
		sb.append("	<meta charset=\"UTF-8\">");
		sb.append("	<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">");
		sb.append("	<title>비에비스 나무병원</title>");
		sb.append("	<style>");
		sb.append("		");
		sb.append("		body, #bodywrap{font-family:'Noto Sans KR','Malgun Gothic',arial,helvetica,sans-serif;font-size:16px;font-weight:normal;}");
		sb.append("");
		sb.append("	</style>");
		sb.append("</head>");
		sb.append("<body style=\"margin:0;padding:0;\">");
		sb.append("	<div align=\"center\" id=\"bodywrap\">");
		sb.append("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"700\">");
		sb.append("			<tr>");
		sb.append("				<td style=\"padding:40px\" bgcolor=\"#f4f4f4\">");
		sb.append("					<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("						<tr>");
		sb.append("							<td style=\"padding:30px;border:1px solid #ddd\" bgcolor=\"#fff\">");
		sb.append("								<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
		sb.append("									<tr>");
		sb.append("										<td style=\"padding-bottom:42px\">");
		sb.append("											<a href=\"https://www.namu.com/\" target=\"_blank\"><img src=\"https://www.namu.com/images/fbcms/user/logo.png\" alt=\"비에비스 나무병원\" width=\"149\" height=\"50\"/></a>");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td align=\"center\" style=\"font-size:36px;color:#333;font-weight:bold;line-height:1.5\">");
		sb.append("											비에비스 나무병원<br/>");
		sb.append("											" + map.get("contentsSubject") + "");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("									<tr>");
		sb.append("										<td align=\"center\" style=\"font-size:16px;color:#666;line-height:1.5;padding:20px 0 40px;\">");
		sb.append("											" + map.get("contentsHtml") + "");
		sb.append("										</td>");
		sb.append("									</tr>");
		sb.append("								</table>");
		sb.append("							</td>");
		sb.append("						</tr>");
		sb.append("						<tr>");
		sb.append("							<td style=\"padding:20px 0;border:1px solid #ddd;border-top:0\" align=\"center\" bgcolor=\"#f8f8f8\">");
		sb.append("								<p style=\"color:#777;font-size:14px;font-weight:bold;\">본 메일은 발신 전용입니다.</p>");
		sb.append("								<address style=\"font-size:13px;color:#999;font-style:normal;font-weight:bold;line-height:1.7;padding:10px 0\">");
		sb.append("									비에비스 나무병원 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;;\">ㅣ</span> ");
		sb.append("									대표 : 홍성수 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									주소 : 서울시 강남구 논현로 627<br/>");
		sb.append("									개인정보보호 실무담당자 : 운영팀 전수경 실장 ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									전화번호 : <span style=\"\">02-519-8925</span> ");
		sb.append("									<span style=\"font-weight:normal;font-size:12px;color:#818181;\">ㅣ</span> ");
		sb.append("									<a href=\"mailto:jineyjun@namu.com\" style=\"color:#999;text-decoration:none;font-weight:400\">jineyjun@namu.com</a>");
		sb.append("								</address>");
		sb.append("								<p style=\"font-size:13px;color:#999\">Copyright © VIEVIS NAMUH. All Rights Reserved.</p>");
		sb.append("							</td>");
		sb.append("						</tr>");
		sb.append("					</table>");
		sb.append("				</td>");
		sb.append("			</tr>");
		sb.append("		</table>");
		sb.append("	</div>");
		sb.append("</body>");
		sb.append("</html>");
		
		return sb;
	}
}