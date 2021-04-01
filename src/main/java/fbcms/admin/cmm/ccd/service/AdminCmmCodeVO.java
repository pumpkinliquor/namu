package fbcms.admin.cmm.ccd.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 공통코드 모델 클래스
 */
public class AdminCmmCodeVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 분류코드 */
	private String clCode = "";

	/** 코드ID */
    private String codeId = "";

    /** 코드ID명 */
    private String codeIdNm = "";

    /** 상세코드 */
	private String code = "";

	/** 상세코드명 */
    private String codeNm = "";

    /** 상세코드설명 */
    private String codeDc = "";

    /** 사용여부 */
    private String useAt = "";

    /** 최초등록자ID */
    private String frstRegisterId = "";

    /** 최종수정자ID */
    private String lastUpdusrId   = "";
    
    
	/**
	 * @return the clCode
	 */
	public String getClCode() {
		return clCode;
	}

	/**
	 * @param clCode the clCode to set
	 */
	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	/**
	 * @return the codeId
	 */
	public String getCodeId() {
		return codeId;
	}

	/**
	 * @param codeId the codeId to set
	 */
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	/**
	 * @return the codeIdNm
	 */
	public String getCodeIdNm() {
		return codeIdNm;
	}

	/**
	 * @param codeIdNm the codeIdNm to set
	 */
	public void setCodeIdNm(String codeIdNm) {
		this.codeIdNm = codeIdNm;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the codeNm
	 */
	public String getCodeNm() {
		return codeNm;
	}

	/**
	 * @param codeNm the codeNm to set
	 */
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	/**
	 * @return the codeDc
	 */
	public String getCodeDc() {
		return codeDc;
	}

	/**
	 * @param codeDc the codeDc to set
	 */
	public void setCodeDc(String codeDc) {
		this.codeDc = codeDc;
	}

	/**
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
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
