package egovframework.com.utl.wed.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.SystemUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.utl.fcc.service.EgovFileUploadUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;
import fbcms.com.cmm.service.CmmImageFileVO;

/**
 * 웹에디터 이미지 upload 처리 Controller
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.08.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일                수정자          수정내용
 *  -----------   --------  ---------------------------
 *   2009.08.26   한성곤          최초 생성
 *   2017.08.31   장동한          path, physical 파라미터 노출 암호화 처리
 *   2017.12.12   장동한          출력 모듈 경로 변경 취약점 조치
 *   2018.03.07   신용호          URLEncode 처리
 *   2018.08.17   신용호          URL 암호화 보안 추가 조치
 *   
 * </pre>
 */
@Controller
public class EgovWebEditorImageController {

    /** 로그설정 */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovWebEditorImageController.class);
	
    /** 첨부파일 위치 지정  => globals.properties */
    private final String uploadDir = EgovProperties.getProperty("Globals.fileStorePathDev");
    /** 허용할 확장자를 .확장자 형태로 연달아 기술한다. ex) .gif.jpg.jpeg.png => globals.properties */
    private final String extWhiteList = EgovProperties.getProperty("Globals.fileDownload.Extensions");    

    /** 첨부 최대 파일 크기 지정 */
    private final long maxFileSize = 1024 * 1024 * 100;   //업로드 최대 사이즈 설정 (100M)

	/** 암호화서비스 */
	@Resource(name = "egovEnvCryptoService")
	EgovEnvCryptoService cryptoService;
	
	@Resource(name = "egovEnvPasswordEncoderService")
	EgovPasswordEncoder egovPasswordEncoder;
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /**
     * 이미지 Upload 화면으로 이동한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/utl/wed/insertImage.do", method=RequestMethod.GET)
    public String goInsertImage() throws Exception {

	return "egovframework/com/utl/wed/EgovInsertImage";
    }

    
    /**
     * 이미지 Upload를 처리한다.
     *
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/utl/wed/insertImage.do", method=RequestMethod.POST)
    public String imageUpload(MultipartHttpServletRequest request, Model model) throws Exception {
    	
    	uploadImageFiles(request, model);
    	return "egovframework/com/utl/wed/EgovInsertImage";
    }
    
    /**
     * 이미지 Upload(CK에디터)를 처리한다.
     *
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/utl/wed/insertImageCk.do", method=RequestMethod.POST)
    public String imageUploadCk(@RequestParam(value="CKEditorFuncNum", required=false) String ckEditorFuncNum, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		// Spring multipartResolver 미사용 시 (commons-fileupload 활용)
		//List<EgovFormBasedFileVo> list = EgovFormBasedFileUtil.uploadFiles(request, uploadDir, maxFileSize);
    	model.addAttribute("ckEditorFuncNum", ckEditorFuncNum);
    	uploadImageFiles(request, model);
		return "egovframework/com/utl/wed/EgovUploadImageComplete";
    }

	/**
	 * @param request
	 * @param model
	 * @throws Exception
	 */
	private void uploadImageFiles(HttpServletRequest request, Model model) throws Exception {

		try {
			List<EgovFormBasedFileVo> list = null;
			list = EgovFileUploadUtil.uploadFilesExt(request, uploadDir, maxFileSize, extWhiteList);
			
			if (list.size() > 0) {
				EgovFormBasedFileVo vo = list.get(0);	// 첫번째 이미지

			    /*String url = request.getContextPath()
						    + "/utl/web/imageSrc.do?"
						    + "path=" + this.encrypt(vo.getServerSubPath())
						    + "&physical=" + this.encrypt(vo.getPhysicalName())
						    + "&contentType=" + this.encrypt(vo.getContentType());*/
				String url = request.getContextPath()
					    + "/cmm/fms/getEditorImage.do?"
					    + "fileNm=" + this.encrypt(vo.getServerSubPath());

			    model.addAttribute("url", url);
			    model.addAttribute("msg",egovMessageSource.getMessage("success.file.transfer"));
			}
		} catch (SecurityException e) {
			model.addAttribute("url", "");
			model.addAttribute("msg",egovMessageSource.getMessage("errors.file.extension"));
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			model.addAttribute("url", "");
			model.addAttribute("msg",egovMessageSource.getMessage("errors.file.transfer"));
		}
	}

    /**
     * 이미지 view를 제공한다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value="/utl/web/imageSrc.do",method=RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//2017.12.12 - 출력 모듈 경로 변경 취약점 조치
    	//KISA 보안약점 조치 (2018-10-29, 윤창원)
		String subPath = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("path")));
		String physical = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("physical")));
		String mimeType = this.decrypt(EgovStringUtil.isNullToString(request.getParameter("contentType")));
		
		if (subPath.indexOf("..") >= 0 ) throw new Exception("Security Exception - illegal url called.");
		if (physical.indexOf("..") >= 0 ) throw new Exception("Security Exception - illegal url called.");
		
		String ext = "";
		if ( physical.lastIndexOf(".") > 0 ) {
			ext = physical.substring(physical.lastIndexOf(".") + 1,physical.length()).toLowerCase();
		} 
		if ( ext == null ) throw new FileNotFoundException();
		
		if ( extWhiteList.indexOf(ext) >= 0 ) {
			EgovFormBasedFileUtil.viewFile(response, uploadDir, subPath, physical, mimeType);
		} else {
			throw new FileNotFoundException();
		}
    }
    
    /**
     * 암호화
     *
     * @param encrypt
     */
    private String encrypt(String encrypt) {

    	try {
			return cryptoService.encrypt(encrypt); // Handles URLEncoding.
			//return cryptoService.encryptNone(encrypt); // Does not handle URLEncoding.
        } catch(IllegalArgumentException e) {
    		LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
        } catch (Exception e) {
        	LOGGER.error("[" + e.getClass() +"] :" + e.getMessage());
        }
		return encrypt;
    }
    
    /**
     * 복호화
     *
     * @param decrypt
     */
    private String decrypt(String decrypt){

    	try {
    		//return cryptoService.decrypt(decrypt); // Handles URLDecoding.
    		return cryptoService.decryptNone(decrypt); // Does not handle URLDecoding.
        } catch(IllegalArgumentException e) {
    		LOGGER.error("[IllegalArgumentException] Try/Catch...usingParameters Runing : "+ e.getMessage());
        } catch (Exception e) {
        	LOGGER.error("[" + e.getClass() +"] :" + e.getMessage());
        }
		return decrypt;
    }

    /**
     * 스마트에디터2 이미지 Upload를 처리한다.
     */
    @RequestMapping(value="/utl/wed/insertSEitorImage.do")
    public String insertSEitorImage(final HttpServletRequest request
    		, HttpServletResponse response
    		, CmmImageFileVO fileVO
    		, Model model) throws Exception {

    	String callback = fileVO.getCallback();
    	String callbackFunc = fileVO.getCallbackFunc();
    	String fileResult = "";
    	
    	try {
    		
    		if(fileVO.getFileData() != null && fileVO.getFileData().getOriginalFilename() != null
    				&& fileVO.getFileData().getOriginalFilename().equals("")) {
    			String orignameName = fileVO.getFileData().getOriginalFilename();
    			String ext = orignameName.substring(orignameName.lastIndexOf(".") + 1);
    			
    			Date now = new Date();
    			SimpleDateFormat _formatter = new SimpleDateFormat("yyyy" + File.separator + "MM");
    			SimpleDateFormat _urlFormatter =  new SimpleDateFormat("yyyy/MM");
    			
    			//파일 기본경로
    			String path = uploadDir + "editor" + File.separator + _formatter.format(now) + File.separator;
    			File file = new File(path);
    			
    			if(!file.exists()) {
    				file.mkdirs();
    			}
    			String realName = UUID.randomUUID().toString() + "." + ext;
    			
    			fileVO.getFileData().transferTo(new File(path + realName));
    			fileResult += "&bNewLine=true&sFileName=" + orignameName + "&sFileUrl=/" + _urlFormatter.format(now) + "/" + realName;
    		} else {
    			fileResult += "&errStr=error";
    		}
    		
    	} catch (Exception e) {
    		LOGGER.error("e : {}", e.getMessage());
    	}
    	
    	return "redirect:" + callback + "?callback_func=" + callbackFunc + fileResult;
    }

    /**
     * 스마트에디터2 이미지 Upload를 처리한다.
     */
    @RequestMapping(value="/utl/wed/insertSEitorImage5.do")
    public void insertSEitorImage5(MultipartHttpServletRequest multipartRequest
    		, final HttpServletRequest request
    		, HttpServletResponse response
    		, CmmImageFileVO fileVO
    		, Model model) throws Exception {
    	
    	PrintWriter out = response.getWriter();
    	try {
    		
		    String sFileInfo = "";
		    /*
    		List<EgovFormBasedFileVo> list = null;
    		if(SystemUtils.IS_OS_WINDOWS) {
    			list = EgovFileUploadUtil.uploadFilesExt(request, uploadDirLocal, maxFileSize, extWhiteList);
    		} else {
    			list = EgovFileUploadUtil.uploadFilesExt(request, uploadDirDev, maxFileSize, extWhiteList);
    		}
			if (list.size() > 0) {
				EgovFormBasedFileVo vo = list.get(0);	// 첫번째 이미지

			    String url = request.getContextPath()
						    + "/utl/web/imageSrc.do?"
						    + "path=" + this.encrypt(vo.getServerSubPath())
						    + "&physical=" + this.encrypt(vo.getPhysicalName())
						    + "&contentType=" + this.encrypt(vo.getContentType());
			    LOGGER.debug("url : " + url);
			    sFileInfo += "&bNewLine=true";
				//sFileInfo += "&sFileName="+ realFileNm;; 
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ this.encrypt(vo.getPhysicalName());
				sFileInfo += "&sFileURL="+ url;
			}
			
			out.println(sFileInfo); 
			*/
    		/*
    		String filename = request.getHeader("file-name");
    		//파일 확장자
    		String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
    		//확장자를소문자로 변경
    		filename_ext = filename_ext.toLowerCase();
    		//이미지 검증 배열변수
    		String[] allow_file = {"jpg","png","bmp","gif"};
    		int cnt = 0; for(int i=0; i<allow_file.length; i++) { 
    			if(filename_ext.equals(allow_file[i])){ 
    				cnt++;
    			}
    		}
    		LOGGER.info("insertSEitorImage5 filename : [{}]", filename);
    		
    		//이미지가 아님 
    		if(cnt == 0) { 
    			out.println("NOTALLOW_"+filename); 
    		} else { 
    			//파일 기본경로
    			String dftFilePath = "";
    			if(SystemUtils.IS_OS_WINDOWS) {
    				dftFilePath = uploadDirLocal;
        		} else {
        			dftFilePath = uploadDirDev;
        		}
    			//파일 기본경로 _ 상세경로
    			String filePath = dftFilePath + "editor" + File.separator;
    			File file = new File(filePath);
    			if(!file.exists()) {
    				LOGGER.info("insertSEitorImage5 mkdirs");
    				file.mkdirs();
    			}
    			String realFileNm = "";
    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    			String today= formatter.format(new java.util.Date());
    			realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
    			String rlFileNm = filePath + realFileNm;
    			LOGGER.info("insertSEitorImage5 rlFileNm : [{}]", rlFileNm);
    			
    			///////////////// 서버에 파일쓰기 /////////////////
    			InputStream is = request.getInputStream();
    			OutputStream os = new FileOutputStream(realFileNm);
    			int num;
    			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
    			while ((num = is.read(b, 0, b.length)) != -1) {
    				os.write(b, 0, num);
    			}
    			if(is != null) {
    				is.close();
    			}
    			os.flush();
    			os.close();
    			
    			// 정보 출력 
    			sFileInfo += "&bNewLine=true";
    			//sFileInfo += "&sFileName="+ realFileNm;; 
    			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
    			sFileInfo += "&sFileName="+ filename;
    			sFileInfo += "&sFileURL="+rlFileNm;
    			LOGGER.debug("insertSEitorImage5 sFileInfo : [{}]", sFileInfo);
    			out.println(sFileInfo); 
    		} */

			/* 멀티파트가능일경우 */
		    final Map<String, MultipartFile> files = multipartRequest.getFileMap();
			if (!files.isEmpty()) {
				Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
				MultipartFile multipartFile = null;

				while (itr.hasNext()) {
					Entry<String, MultipartFile> entry = itr.next();

					multipartFile = entry.getValue();
					String orginFileName = multipartFile.getOriginalFilename();
					//파일 확장자
					String filename_ext = orginFileName.substring(orginFileName.lastIndexOf(".")+1);
					//확장자를소문자로 변경
					filename_ext = filename_ext.toLowerCase();
					//이미지 검증 배열변수
					String[] allow_file = {"jpg","png","bmp","gif"};
					int cnt = 0; for(int i=0; i<allow_file.length; i++) {
						if(filename_ext.equals(allow_file[i])) {
							cnt++;
						}
					}
					LOGGER.info("insertSEitorImage5 filename : [{}]", orginFileName);
					//이미지가 아님
					if(cnt == 0) {
						out.println("NOTALLOW_"+orginFileName);
					} else {
						///////////////// 서버에 파일쓰기 ///////////////////파일 기본경로

		    			Date now = new Date();
		    			SimpleDateFormat _formatter = new SimpleDateFormat("yyyy" + File.separator + "MM");
		    			SimpleDateFormat _urlFormatter =  new SimpleDateFormat("yyyy/MM");
		    			
		    			//파일 기본경로
		    			String dftFilePath = uploadDir;
		    			//파일 기본경로 _ 상세경로
		    			String filePath = dftFilePath + "editor" + File.separator + _formatter.format(now) + File.separator;
		    			File file = new File(filePath);
		    			if(!file.exists()) {
		    				LOGGER.info("insertSEitorImage5 mkdirs");
		    				file.mkdirs();
		    			}
		    			String realFileNm = "";
		    			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		    			String today= formatter.format(new java.util.Date());
		    			realFileNm = today+UUID.randomUUID().toString() + orginFileName.substring(orginFileName.lastIndexOf("."));
		    			String rlFileNm = filePath + realFileNm;
		    			LOGGER.info("insertSEitorImage5 rlFileNm : [{}]", rlFileNm);
						//--------------------------------------
						// 원 파일명이 없는 경우 처리
						// (첨부가 되지 않은 input file type)
						//--------------------------------------
						if ("".equals(orginFileName)) {
							continue;
						}
						////------------------------------------
	
						if (!"".equals(orginFileName)) {
							multipartFile.transferTo(new File(EgovWebUtil.filePathBlackList(rlFileNm)));
						}
						///////////////// 서버에 파일쓰기 ///////////////// 
						// 정보 출력 
		    			sFileInfo += "&bNewLine=true"; 
		    			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
		    			sFileInfo += "&sFileName=" + orginFileName;
		    			sFileInfo += "&sFileURL=" + _urlFormatter.format(now) + "/" + realFileNm;
		    			LOGGER.debug("insertSEitorImage5 sFileInfo : [{}]", sFileInfo);
		    			out.println(sFileInfo); 
					}
				}
    		}
    	} catch (Exception e) {
    		LOGGER.error("e : {}", e.getMessage());
    	}
    }
    
}
