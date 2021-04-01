package fbcms.com.cmm.service;

import org.springframework.web.multipart.MultipartFile;

public class CmmImageFileVO {
	
	private MultipartFile fileData;
	private String callback;
	private String callbackFunc;
	/**
	 * @return the fileData
	 */
	public MultipartFile getFileData() {
		return fileData;
	}
	/**
	 * @param fileData the fileData to set
	 */
	public void setFileData(MultipartFile fileData) {
		this.fileData = fileData;
	}
	/**
	 * @return the callback
	 */
	public String getCallback() {
		return callback;
	}
	/**
	 * @param callback the callback to set
	 */
	public void setCallback(String callback) {
		this.callback = callback;
	}
	/**
	 * @return the callbackFunc
	 */
	public String getCallbackFunc() {
		return callbackFunc;
	}
	/**
	 * @param callbackFunc the callbackFunc to set
	 */
	public void setCallbackFunc(String callbackFunc) {
		this.callbackFunc = callbackFunc;
	}
	
	
}