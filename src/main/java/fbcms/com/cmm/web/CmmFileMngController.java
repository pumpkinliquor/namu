package fbcms.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovBrowserUtil;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovFileTool;
import fbcms.com.cmm.MultipartFileSender;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 공통 처리를 위한 컨트롤러 클래스
 */
@Controller
public class CmmFileMngController{
    
	private static final Logger LOGGER = LoggerFactory.getLogger(CmmFileMngController.class);
	
	/** Buffer size */
	public static final int BUFFER_SIZE = 8192;
	
	/** 첨부파일 위치 지정  => globals.properties */
    private final String fileStorePath = EgovProperties.getProperty("Globals.fileStorePathDev");
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;
	
	
	/**
	 * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 */
	@RequestMapping(value = "/cmm/fms/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> commandMap
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		String atchFileId = (String) commandMap.get("atchFileId");
		String fileSn = (String) commandMap.get("fileSn");
		
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileSn(fileSn);
		
		FileVO fvo = fileService.selectFileInf(fileVO);
		File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		long fSize = uFile.length();
		
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			String userAgent = request.getHeader("User-Agent");
			HashMap<String,String> result = EgovBrowserUtil.getBrowser(userAgent);
			if ( !EgovBrowserUtil.MSIE.equals(result.get(EgovBrowserUtil.TYPEKEY)) ) {
				mimetype = "application/x-stuff";
			}
			
			String contentDisposition = EgovBrowserUtil.getDisposition(fvo.getOrignlFileNm(),userAgent,"UTF-8");
			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			response.setContentType(mimetype);
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + contentDisposition + "\"");
			response.setHeader("Content-Disposition", contentDisposition);
			response.setContentLengthLong(fSize);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			
			try {
				
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				
				FileCopyUtils.copy(in, out);
				out.flush();
				
			} catch (IOException ex) {
				// 다음 Exception 무시 처리
				// Connection reset by peer: socket write error
				response.flushBuffer();
				EgovBasicLogger.ignore("IO Exception", ex);
			} finally {
				response.flushBuffer();
				EgovResourceCloseHelper.close(in, out);
			}
		} else {
			response.setContentType("application/x-msdownload");
			
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			
			printwriter.flush();
			printwriter.close();
		}
	}
	
	/**
	 * 첨부된 이미지에 대한 미리보기 기능을 제공한다.
	 */
	@SuppressWarnings("resource")
	@RequestMapping("/cmm/fms/getImage.do")
	public void getImage(@RequestParam Map<String, Object> commandMap
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		String atchFileId = (String)commandMap.get("atchFileId");
		String fileSn = (String)commandMap.get("fileSn");
		
		FileVO vo = new FileVO();
		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);
		
		//------------------------------------------------------------
		// fileSn이 없는 경우 마지막 파일 참조
		//------------------------------------------------------------
		if (fileSn == null || fileSn.equals("")) {
			int newMaxFileSN = fileService.getMaxFileSN(vo);
			vo.setFileSn(Integer.toString(newMaxFileSN - 1));
		}
		//------------------------------------------------------------
		
		FileVO fvo = fileService.selectFileInf(vo);
		if(fvo != null) {
			//String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();
			File file = null;
			FileInputStream fis = null;
			BufferedInputStream in = null;
			ByteArrayOutputStream bStream = null;
			
			try {
				
				String type = "";
				
				if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
					if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
						type = "image/jpeg";
					} else {
						type = "image/" + fvo.getFileExtsn().toLowerCase();
					}
					type = "image/" + fvo.getFileExtsn().toLowerCase();
				} else {
					LOGGER.debug("Image fileType is null.");
				}
				
				if ("gif".equals(fvo.getFileExtsn().toLowerCase())) {
					
					byte[] b = new byte[BUFFER_SIZE];
	
					response.setContentType("application/octet-stream");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + fvo.getStreFileNm() + "\";");
					response.setHeader("Content-Transfer-Encoding", "binary");
					response.setHeader("Pragma", "no-cache");
					response.setHeader("Expires", "0");
	
					BufferedInputStream fin = null;
					BufferedOutputStream outs = null;
	
					try {
						file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
						if( file.exists() ) {
							fin = new BufferedInputStream(new FileInputStream(file));
							outs = new BufferedOutputStream(response.getOutputStream());
		
							int read = 0;
		
							while ((read = fin.read(b)) != -1) {
								outs.write(b, 0, read);
							}
							fis.close();
							in.close();
						}
					} catch (Exception e) {
						response.flushBuffer();
						EgovResourceCloseHelper.close(outs, fin);
					} finally {
						response.flushBuffer();
						EgovResourceCloseHelper.close(outs, fin);
					}
					
				} else {
					
					file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
					if( file.exists() ) {
						fis = new FileInputStream(file);
						
						in = new BufferedInputStream(fis);
						bStream = new ByteArrayOutputStream();
						
						int imgByte;
						while ((imgByte = in.read()) != -1) {
							bStream.write(imgByte);
						}
						fis.close();
						in.close();
						
						response.setHeader("Content-Type", type);
						response.setContentLength(bStream.size());
						
						bStream.writeTo(response.getOutputStream());
						
						response.getOutputStream().flush();
						response.getOutputStream().close();
					}
				}
			} catch (Exception e) {
				response.flushBuffer();
				EgovResourceCloseHelper.close(bStream, in, fis);
				LOGGER.error("getImage Exception : " + e.getMessage());
			} finally { 
				response.flushBuffer();
				EgovResourceCloseHelper.close(bStream, in, fis);
			}
		}
	}
	
	/**
	 * 에디터 이미지에 대한 미리보기 기능을 제공한다.
	 */
	@RequestMapping("/cmm/fms/getEditorImage.do")
	public void getEditorImage(@RequestParam Map<String, Object> commandMap
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		String fileNm = (String)commandMap.get("fileNm");
		
		String ext = "";
		if ( fileNm.lastIndexOf(".") > 0 ) {
			ext = fileNm.substring(fileNm.lastIndexOf(".") + 1,fileNm.length()).toLowerCase();
		} 
		if ( ext == null ) throw new FileNotFoundException();
		
		String extWhiteList = ".gif.jpg.jpeg.png.bmp";
		if ( extWhiteList.indexOf(ext) >= 0 ) {
			String downFileName = fileStorePath + File.separator + "editor" + File.separator + fileNm;
			File file = new File(EgovWebUtil.filePathBlackList(downFileName));

			if (!file.exists()) {
				throw new FileNotFoundException(downFileName);
			}

			if (!file.isFile()) {
				throw new FileNotFoundException(downFileName);
			}
			
			byte[] b = new byte[BUFFER_SIZE];

			fileNm = fileNm.replaceAll("\r", "").replaceAll("\n", "");
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNm + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");

			BufferedInputStream fin = null;
			BufferedOutputStream outs = null;

			try {
				fin = new BufferedInputStream(new FileInputStream(file));
				outs = new BufferedOutputStream(response.getOutputStream());

				int read = 0;

				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
			} finally {
				response.flushBuffer();
				EgovResourceCloseHelper.close(outs, fin);
			}
		} else {
			throw new FileNotFoundException();
		}
	}
	
	/**
	 * 에디터 이미지 부 처리한다
	 */
	@RequestMapping("/cmm/fms/uploadImageFiles.do")
	public String uploadImageFiles(@ModelAttribute("searchVO") FileVO fileVO
			, @RequestParam Map<String, Object> commandMap
			, ModelMap model) throws Exception {
		
		String atchFileId = (String)commandMap.get("atchFileId");
		
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectImageFileList(fileVO);
		
		model.addAttribute("fileList", result);
		
		return "fbcms/com/cmm/fms/EgovImgFileList";
	}
	
	/**
	 * 동영상 파일에 대하여 스트리밍을 제공한다.
	 */
	@RequestMapping(value = "/cmm/fms/videoFileInfo.do")
	public void videoFileInfo(@RequestParam Map<String, Object> commandMap
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		String atchFileId = (String) commandMap.get("atchFileId");
		String fileSn = (String) commandMap.get("fileSn");
		
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileSn(fileSn);
		FileVO fvo = fileService.selectFileInf(fileVO);
		
		File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		long fSize = uFile.length();
		
		if (fSize > 0) {
			try {
				
				MultipartFileSender.fromFile(uFile).with(request).with(response).serveResource();
				
			} catch (IOException ex) {
				// 다음 Exception 무시 처리
				// Connection reset by peer: socket write error
				EgovBasicLogger.ignore("IO Exception", ex);
			} catch (Exception e) {
				if (!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) {
					e.printStackTrace();
				}
			}
		} else {
			response.setContentType("application/x-msdownload");
			
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrignlFileNm() + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			
			printwriter.flush();
			printwriter.close();
		}
	}
	
	/**
	 * 첨부파일에 대한 목록을 조회한다.
	 */
	@RequestMapping("/cmm/fms/selectFileInfs.do")
	public String selectFileInfs(@ModelAttribute("searchVO") FileVO fileVO
			, @RequestParam Map<String, Object> commandMap
			, ModelMap model) throws Exception {
		
		String atchFileId = (String)commandMap.get("param_atchFileId");
		
		fileVO.setAtchFileId(atchFileId);
		List<FileVO> result = fileService.selectFileInfs(fileVO);
		
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		
		return "fbcms/com/cmm/fms/cmmFileList";
	}
	
	/**
	 * 첨부파일 변경을 위한 수정페이지로 이동한다.
	 */
	@RequestMapping("/cmm/fms/selectFileInfsForUpdate.do")
	public String selectFileInfsForUpdate(@ModelAttribute("searchVO") FileVO fileVO
			, @RequestParam Map<String, Object> commandMap
			, ModelMap model) throws Exception {
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			String atchFileId = (String)commandMap.get("param_atchFileId");
			fileVO.setAtchFileId(atchFileId);
			
			List<FileVO> result = fileService.selectFileInfs(fileVO);
			
			model.addAttribute("fileList", result);
			model.addAttribute("updateFlag", "Y");
			model.addAttribute("fileListCnt", result.size());
			model.addAttribute("atchFileId", atchFileId);
			
			return "fbcms/com/cmm/fms/cmmFileList";
		}
		
		return "blank";
	}
	
	/**
	 * 첨부파일에 대한 삭제를 처리한다.
	 */
	@RequestMapping("/cmm/fms/deleteFileInfs.do")
	public String deleteFileInf(@ModelAttribute("searchVO") FileVO fileVO
			, HttpServletRequest request
			, ModelMap model) throws Exception {
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (isAuthenticated) {
			fileService.deleteFileInf(fileVO);
		}
		
		return "blank";
		
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		////return "forward:/cmm/fms/selectFileInfs.do";
		//return "forward:" + returnUrl;
		/* *******************************************************
		 *  modify by jdh
		 *******************************************************
		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath())) {
			return "forward:" + returnUrl;
		}

		if (returnUrl.startsWith(request.getContextPath())) {
			return "forward:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} else {
			return "forward:" + returnUrl;
		}
		*/
		////------------------------------------------
	}

	/**
	 * 이미지 첨부파일에 대한 목록을 조회한다.
	 */
	@RequestMapping("/cmm/fms/selectImageFileInfs.do")
	public String selectImageFileInfs(@ModelAttribute("searchVO") FileVO fileVO
			, @RequestParam Map<String, Object> commandMap
			, ModelMap model) throws Exception {
		
		String atchFileId = (String)commandMap.get("atchFileId");
		fileVO.setAtchFileId(atchFileId);
		
		List<FileVO> result = fileService.selectImageFileList(fileVO);
		
		model.addAttribute("fileList", result);
		
		return "fbcms/com/cmm/fms/cmmImgFileList";
	}

	/**
	 * 컨텐츠 파일 다운로드를 제공한다.
	 */
	@RequestMapping(value = "/cmm/fms/resourceFileDown.do")
	public void resourceFileDown(@RequestParam Map<String, Object> commandMap
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		String resourceFileName = (String) commandMap.get("resourceFileName");
		File uFile = new File(fileStorePath, "resource/" + resourceFileName);
		long fSize = uFile.length();
		
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			String userAgent = request.getHeader("User-Agent");
			HashMap<String,String> result = EgovBrowserUtil.getBrowser(userAgent);
			if ( !EgovBrowserUtil.MSIE.equals(result.get(EgovBrowserUtil.TYPEKEY)) ) {
				mimetype = "application/x-stuff";
			}
			
			String contentDisposition = EgovBrowserUtil.getDisposition(resourceFileName,userAgent,"UTF-8");
			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			response.setContentType(mimetype);
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + contentDisposition + "\"");
			response.setHeader("Content-Disposition", contentDisposition);
			response.setContentLengthLong(fSize);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			
			try {
				
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				
				FileCopyUtils.copy(in, out);
				out.flush();
				
			} catch (IOException ex) {
				// 다음 Exception 무시 처리
				// Connection reset by peer: socket write error
				response.flushBuffer();
				EgovBasicLogger.ignore("IO Exception", ex);
			} finally {
				response.flushBuffer();
				EgovResourceCloseHelper.close(in, out);
			}
		} else {
			response.setContentType("application/x-msdownload");
			
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + resourceFileName + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			
			printwriter.flush();
			printwriter.close();
		}
	}

	/**
	 * 동영상 파일에 대하여 스트리밍을 제공한다.
	 */
	@RequestMapping(value = "/cmm/fms/resourceVideoFileInfo.do")
	public void resourceVideoFileInfo(@RequestParam Map<String, Object> commandMap
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		String resourceVideoName = (String) commandMap.get("resourceVideoName");
		File uFile = new File(fileStorePath, "resource/" + resourceVideoName);
		long fSize = uFile.length();
		
		if (fSize > 0) {
			try {
				
				MultipartFileSender.fromFile(uFile).with(request).with(response).serveResource();
				
			} catch (IOException ex) {
				// 다음 Exception 무시 처리
				// Connection reset by peer: socket write error
				EgovBasicLogger.ignore("IO Exception", ex);
			} catch (Exception e) {
				if (!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) {
					e.printStackTrace();
				}
			}
		} else {
			response.setContentType("application/x-msdownload");
			
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + resourceVideoName + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			
			printwriter.flush();
			printwriter.close();
		}
	}
	
	/**
	 * 첨부된 pdf에 대한 미리보기 기능을 제공한다.
	 */
	@RequestMapping("/com/cmm/ajax/getPdfViewer.do")
	public String getPdfViewer(@RequestParam Map<String, Object> commandMap
			, HttpServletResponse response
			, ModelMap model) throws Exception {
		
		/*String atchFileId = (String)commandMap.get("atchFileId");
		String fileSn = (String)commandMap.get("fileSn");
		
		FileVO vo = new FileVO();
		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);
		
		//------------------------------------------------------------
		// fileSn이 없는 경우 마지막 파일 참조
		//------------------------------------------------------------
		if (fileSn == null || fileSn.equals("")) {
			int newMaxFileSN = fileService.getMaxFileSN(vo);
			vo.setFileSn(Integer.toString(newMaxFileSN - 1));
		}
		//------------------------------------------------------------
		
		FileVO fvo = fileService.selectFileInf(vo);
		String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();
				
		try {
			
			File newFile = new File(fileStorePath, "pdfTemp/" + fvo.getStreFileNm());
			if(newFile.exists()) {
				
			} else {
				EgovFileTool.copyFile(fileLoaction, fileStorePath + "pdfTemp/" + fvo.getStreFileNm());
			}
			model.addAttribute("filePath", "/pdfTemp/" + fvo.getStreFileNm());
		} catch(Exception e) {
			LOGGER.error("Exception : " + e.getMessage());
		} finally {
		}*/
		model.addAttribute("fileNm", "/pdfTemp/" + (String)commandMap.get("fileNm"));
		return "com/cmm/ajax/pdfPreview";
	}
}
