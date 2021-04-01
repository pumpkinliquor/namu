package fbcms.admin.hpm.sns.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * SNS 관리 VO Class 구현
 */
public class AdminSnsManage implements Serializable {

	private static final long serialVersionUID = 1607776015478505197L;

	/** 통합링크 아이디 */
    private String unityLinkId;

    /** 통합링크 그룹 */
    private String unityLinkSeCode;

    /** 통합링크 명 */
    private String unityLinkNm;

    /** 통합링크 URL */
    private String unityLinkUrl;

    /** 통합링크 설명 */
    private String unityLinkDc;

    /** 최초등록시점 */
    private String frstRegisterPnttm;

    /** 최초등록아이디 */
    private String frstRegisterId;

    /** 최종수정일 */
    private String lastUpdusrPnttm;

    /** 최종수정자 아이디 */
    private String lastUpdusrId;

    /** 최종수정자 이름 */
    private String lastUpdusrNm;
    
    
    /**
	 * @return the unityLinkId
	 */
	public String getUnityLinkId() {
		return unityLinkId;
	}


	/**
	 * @param unityLinkId the unityLinkId to set
	 */
	public void setUnityLinkId(String unityLinkId) {
		this.unityLinkId = unityLinkId;
	}


	/**
	 * @return the unityLinkSeCode
	 */
	public String getUnityLinkSeCode() {
		return unityLinkSeCode;
	}


	/**
	 * @param unityLinkSeCode the unityLinkSeCode to set
	 */
	public void setUnityLinkSeCode(String unityLinkSeCode) {
		this.unityLinkSeCode = unityLinkSeCode;
	}


	/**
	 * @return the unityLinkNm
	 */
	public String getUnityLinkNm() {
		return unityLinkNm;
	}


	/**
	 * @param unityLinkNm the unityLinkNm to set
	 */
	public void setUnityLinkNm(String unityLinkNm) {
		this.unityLinkNm = unityLinkNm;
	}


	/**
	 * @return the unityLinkUrl
	 */
	public String getUnityLinkUrl() {
		return unityLinkUrl;
	}


	/**
	 * @param unityLinkUrl the unityLinkUrl to set
	 */
	public void setUnityLinkUrl(String unityLinkUrl) {
		this.unityLinkUrl = unityLinkUrl;
	}


	/**
	 * @return the unityLinkDc
	 */
	public String getUnityLinkDc() {
		return unityLinkDc;
	}


	/**
	 * @param unityLinkDc the unityLinkDc to set
	 */
	public void setUnityLinkDc(String unityLinkDc) {
		this.unityLinkDc = unityLinkDc;
	}


	/**
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}


	/**
	 * @param frstRegisterPnttm the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}


	/**
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}


	/**
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}


	/**
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}


	/**
	 * @param lastUpdusrPnttm the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}


	/**
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}


	/**
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}


	/**
	 * @return the lastUpdusrNm
	 */
	public String getLastUpdusrNm() {
		return lastUpdusrNm;
	}


	/**
	 * @param lastUpdusrNm the lastUpdusrNm to set
	 */
	public void setLastUpdusrNm(String lastUpdusrNm) {
		this.lastUpdusrNm = lastUpdusrNm;
	}


	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
