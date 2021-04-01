/**
 * 배너에 대한 model 클래스를 정의한다.
 */
package fbcms.admin.hpm.umm.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.FileVO;

public class AdminBanner extends ComDefaultVO {

	/** serialVersionUID */
	private static final long serialVersionUID = 1L;
	
	/** 배너 ID */
	private String bannerId;
	
	/** 배너 명 */
	private String bannerNm;
	
	/** 링크 URL */
	private String linkUrl;
	
	/** 배너 이미지 */
	private String bannerImage;
	
	/** 배너 이미지 파일 */
	private String bannerImageFile;
	
	/** 배너 설명 */
	private String bannerDc;
	
	/** 정렬 순서 */
	private String sortOrdr;
	
	/** 반영여부 */
	private String reflctAt;
	
	/** 사용자 ID */
	private String userId;
	
	/** 등록일자 */
	private String regDate;
	
	/** 파일첨부여부 */
	private boolean isAtchFile;
	
	/** 게시여부 */
	private String postingYn;
	
	/** 게시시작일 */
	private String ntceBgnde;
	
	/** 게시종료일 */
	private String ntceEndde;
	
	/** 배너타켓여부 */
	private String bannerTargetYn;
    
    /** file list */
    private List<FileVO> listFile = new ArrayList<FileVO>();
	
	
	/**
	 * @return the bannerId
	 */
	public String getBannerId() {
		return bannerId;
	}


	/**
	 * @param bannerId the bannerId to set
	 */
	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}


	/**
	 * @return the bannerNm
	 */
	public String getBannerNm() {
		return bannerNm;
	}


	/**
	 * @param bannerNm the bannerNm to set
	 */
	public void setBannerNm(String bannerNm) {
		this.bannerNm = bannerNm;
	}


	/**
	 * @return the linkUrl
	 */
	public String getLinkUrl() {
		return linkUrl;
	}


	/**
	 * @param linkUrl the linkUrl to set
	 */
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}


	/**
	 * @return the bannerImage
	 */
	public String getBannerImage() {
		return bannerImage;
	}


	/**
	 * @param bannerImage the bannerImage to set
	 */
	public void setBannerImage(String bannerImage) {
		this.bannerImage = bannerImage;
	}


	/**
	 * @return the bannerImageFile
	 */
	public String getBannerImageFile() {
		return bannerImageFile;
	}


	/**
	 * @param bannerImageFile the bannerImageFile to set
	 */
	public void setBannerImageFile(String bannerImageFile) {
		this.bannerImageFile = bannerImageFile;
	}


	/**
	 * @return the bannerDc
	 */
	public String getBannerDc() {
		return bannerDc;
	}


	/**
	 * @param bannerDc the bannerDc to set
	 */
	public void setBannerDc(String bannerDc) {
		this.bannerDc = bannerDc;
	}


	/**
	 * @return the sortOrdr
	 */
	public String getSortOrdr() {
		return sortOrdr;
	}


	/**
	 * @param sortOrdr the sortOrdr to set
	 */
	public void setSortOrdr(String sortOrdr) {
		this.sortOrdr = sortOrdr;
	}


	/**
	 * @return the reflctAt
	 */
	public String getReflctAt() {
		return reflctAt;
	}


	/**
	 * @param reflctAt the reflctAt to set
	 */
	public void setReflctAt(String reflctAt) {
		this.reflctAt = reflctAt;
	}


	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}


	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}


	/**
	 * @return the regDate
	 */
	public String getRegDate() {
		return regDate;
	}


	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	/**
	 * @return the isAtchFile
	 */
	public boolean isAtchFile() {
		return isAtchFile;
	}


	/**
	 * @param isAtchFile the isAtchFile to set
	 */
	public void setAtchFile(boolean isAtchFile) {
		this.isAtchFile = isAtchFile;
	}


	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * @return the postingYn
	 */
	public String getPostingYn() {
		return postingYn;
	}


	/**
	 * @param postingYn the postingYn to set
	 */
	public void setPostingYn(String postingYn) {
		this.postingYn = postingYn;
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
	 * @return the bannerTargetYn
	 */
	public String getBannerTargetYn() {
		return bannerTargetYn;
	}


	/**
	 * @param bannerTargetYn the bannerTargetYn to set
	 */
	public void setBannerTargetYn(String bannerTargetYn) {
		this.bannerTargetYn = bannerTargetYn;
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
