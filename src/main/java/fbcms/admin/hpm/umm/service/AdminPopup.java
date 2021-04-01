package fbcms.admin.hpm.umm.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.FileVO;

/**
 * 팝업창에 대한 model 클래스를 정의한다.
 */
public class AdminPopup extends ComDefaultVO implements Serializable {
	
	private static final long serialVersionUID = -9172690166674188881L;
	
	/** 팝업창아이디 */
	private String popupId;
	
	/** 팝업창 타이틀명 */
	private String popupTitleNm;
	
	/** 실파일 URL */
	private String fileUrl;
	
	/** 팝업창이 화면에 보여지는 가로 위치정보 */
	private String popupWlc;
	
	/** 팝업창이 화면에 보여지는 세로 위치정보 */
	private String popupHlc;
	
	/** 팝업창의 높이 */
	private String popupHSize;
	
	/** 팝업창의 넚이 */
	private String popupWSize;
	
	/** 게시시작일 */
	private String ntceBgnde;
	
	/** 게시종료일 */
	private String ntceEndde;
	
	/** 게시시작일(시간) */
	private String ntceBgndeHH;
	
	/** 게시시작일(분) */
	private String ntceBgndeMM;
	
	/** 게시종료일(시간) */
	private String ntceEnddeHH;
	
	/** 게시종료일(분) */
	private String ntceEnddeMM;
	
	/** 그만보기 설정 여부 */
	private String stopVewAt;
	
	/** 게시여부 */
	private String ntceAt;
	
	/** 첨부파일 아이디 */
	private String atchFileId = "";
	
	/** 팝업타켓여부 */
	private String popupTargetYn = "";
    
    /** file list */
    private List<FileVO> listFile = new ArrayList<FileVO>();
	
	
	/**
	 * @return the popupId
	 */
	public String getPopupId() {
		return popupId;
	}


	/**
	 * @param popupId the popupId to set
	 */
	public void setPopupId(String popupId) {
		this.popupId = popupId;
	}


	/**
	 * @return the popupTitleNm
	 */
	public String getPopupTitleNm() {
		return popupTitleNm;
	}


	/**
	 * @param popupTitleNm the popupTitleNm to set
	 */
	public void setPopupTitleNm(String popupTitleNm) {
		this.popupTitleNm = popupTitleNm;
	}


	/**
	 * @return the fileUrl
	 */
	public String getFileUrl() {
		return fileUrl;
	}


	/**
	 * @param fileUrl the fileUrl to set
	 */
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}


	/**
	 * @return the popupWlc
	 */
	public String getPopupWlc() {
		return popupWlc;
	}


	/**
	 * @param popupWlc the popupWlc to set
	 */
	public void setPopupWlc(String popupWlc) {
		this.popupWlc = popupWlc;
	}


	/**
	 * @return the popupHlc
	 */
	public String getPopupHlc() {
		return popupHlc;
	}


	/**
	 * @param popupHlc the popupHlc to set
	 */
	public void setPopupHlc(String popupHlc) {
		this.popupHlc = popupHlc;
	}


	/**
	 * @return the popupHSize
	 */
	public String getPopupHSize() {
		return popupHSize;
	}


	/**
	 * @param popupHSize the popupHSize to set
	 */
	public void setPopupHSize(String popupHSize) {
		this.popupHSize = popupHSize;
	}


	/**
	 * @return the popupWSize
	 */
	public String getPopupWSize() {
		return popupWSize;
	}


	/**
	 * @param popupWSize the popupWSize to set
	 */
	public void setPopupWSize(String popupWSize) {
		this.popupWSize = popupWSize;
	}


	/**
	 * @return the ntceBgnde
	 */
	public String getNtceBgnde() {
		return ntceBgnde;
	}


	/**
	 * @param ntceBgnde the ntceBgnde to set
	 */
	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}


	/**
	 * @return the ntceEndde
	 */
	public String getNtceEndde() {
		return ntceEndde;
	}


	/**
	 * @param ntceEndde the ntceEndde to set
	 */
	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}


	/**
	 * @return the ntceBgndeHH
	 */
	public String getNtceBgndeHH() {
		return ntceBgndeHH;
	}


	/**
	 * @param ntceBgndeHH the ntceBgndeHH to set
	 */
	public void setNtceBgndeHH(String ntceBgndeHH) {
		this.ntceBgndeHH = ntceBgndeHH;
	}


	/**
	 * @return the ntceBgndeMM
	 */
	public String getNtceBgndeMM() {
		return ntceBgndeMM;
	}


	/**
	 * @param ntceBgndeMM the ntceBgndeMM to set
	 */
	public void setNtceBgndeMM(String ntceBgndeMM) {
		this.ntceBgndeMM = ntceBgndeMM;
	}


	/**
	 * @return the ntceEnddeHH
	 */
	public String getNtceEnddeHH() {
		return ntceEnddeHH;
	}


	/**
	 * @param ntceEnddeHH the ntceEnddeHH to set
	 */
	public void setNtceEnddeHH(String ntceEnddeHH) {
		this.ntceEnddeHH = ntceEnddeHH;
	}


	/**
	 * @return the ntceEnddeMM
	 */
	public String getNtceEnddeMM() {
		return ntceEnddeMM;
	}


	/**
	 * @param ntceEnddeMM the ntceEnddeMM to set
	 */
	public void setNtceEnddeMM(String ntceEnddeMM) {
		this.ntceEnddeMM = ntceEnddeMM;
	}


	/**
	 * @return the stopVewAt
	 */
	public String getStopVewAt() {
		return stopVewAt;
	}


	/**
	 * @param stopVewAt the stopVewAt to set
	 */
	public void setStopVewAt(String stopVewAt) {
		this.stopVewAt = stopVewAt;
	}


	/**
	 * @return the ntceAt
	 */
	public String getNtceAt() {
		return ntceAt;
	}


	/**
	 * @param ntceAt the ntceAt to set
	 */
	public void setNtceAt(String ntceAt) {
		this.ntceAt = ntceAt;
	}


	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}


	/**
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}


	/**
	 * @return the popupTargetYn
	 */
	public String getPopupTargetYn() {
		return popupTargetYn;
	}


	/**
	 * @param popupTargetYn the popupTargetYn to set
	 */
	public void setPopupTargetYn(String popupTargetYn) {
		this.popupTargetYn = popupTargetYn;
	}


	/**
	 * @return the listFile
	 */
	public List<FileVO> getListFile() {
		return listFile;
	}


	/**
	 * @param listFile the listFile to set
	 */
	public void setListFile(List<FileVO> listFile) {
		this.listFile = listFile;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}