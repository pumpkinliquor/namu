package fbcms.admin.hpm.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 *  게시판 속성정보를 담기위한 엔티티 클래스
 */
@SuppressWarnings("serial")
public class AdminBoardMaster implements Serializable {
	
	/** 게시판 아이디 */
	private String bbsId = "";
	
	/** 게시판 소개 */
	private String bbsIntrcn = "";
	
	/** 게시판 명 */
	private String bbsNm = "";
	
	/** 게시판 유형코드 */
	private String bbsTyCode = "";
	
	/** 파일첨부가능여부 */
	private String fileAtchPosblAt = "";
	
	/** 최초등록자 아이디 */
	private String frstRegisterId = "";
	
	/** 최초등록시점 */
	private String frstRegisterPnttm = "";
	
	/** 최종수정자 아이디 */
	public String lastUpdusrId = "";
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";
	
	/** 첨부가능파일숫자 */
	private int atchPosblFileNumber = 0;
	
	/** 첨부가능파일사이즈 */
	private String atchPosblFileSize = "";
	
	/** 답장가능여부 */
	private String replyPosblAt = "";
	
	/** 템플릿 아이디 */
	private String tmplatId = "";
	
	/** 사용여부 */
	private String useAt = "";
	
	/** 사용플래그 */
	private String bbsUseFlag = "";
	
	/** 대상 아이디 */
	private String trgetId = "";
	
	/** 등록구분코드 */
	private String registSeCode = "";
	
	/** 유일 아이디 */
	private String uniqId = "";
	
	/** 템플릿 명 */
	private String tmplatNm = "";
	
	/** 커뮤니티 ID */
	private String cmmntyId;
	
	/** 블로그 ID */
	private String blogId;
	
	/** 블로그 사용 유무 */
	private String blogAt;
	
	/** 추가 option (댓글-comment, 만족도조사-stsfdg) */
	private String option = "";
	
	/** 댓글 여부 */
	private String commentAt = "";
	
	/** 만족도조사 */
	private String stsfdgAt = "";
    
    /** custom1Yn */
    private String custom1Yn = "N";
    
    /** custom2Yn */
    private String custom2Yn = "N";
    
    /** custom3Yn */
    private String custom3Yn = "N";
    
    /** custom4Yn */
    private String custom4Yn = "N";
    
    /** custom5Yn */
    private String custom5Yn = "N";
    
    /** customDate1Yn */
    private String customDate1Yn = "N";
    
    /** customDate2Yn */
    private String customDate2Yn = "N";
    
    /** customDate3Yn */
    private String customDate3Yn = "N";
    
    /** customDate4Yn */
    private String customDate4Yn = "N";
    
    /** customDate5Yn */
    private String customDate5Yn = "N";
	
	
	/**
	 * @return the bbsId
	 */
	public String getBbsId() {
		return bbsId;
	}


	/**
	 * @param bbsId the bbsId to set
	 */
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}


	/**
	 * @return the bbsIntrcn
	 */
	public String getBbsIntrcn() {
		return bbsIntrcn;
	}


	/**
	 * @param bbsIntrcn the bbsIntrcn to set
	 */
	public void setBbsIntrcn(String bbsIntrcn) {
		this.bbsIntrcn = bbsIntrcn;
	}


	/**
	 * @return the bbsNm
	 */
	public String getBbsNm() {
		return bbsNm;
	}


	/**
	 * @param bbsNm the bbsNm to set
	 */
	public void setBbsNm(String bbsNm) {
		this.bbsNm = bbsNm;
	}


	/**
	 * @return the bbsTyCode
	 */
	public String getBbsTyCode() {
		return bbsTyCode;
	}


	/**
	 * @param bbsTyCode the bbsTyCode to set
	 */
	public void setBbsTyCode(String bbsTyCode) {
		this.bbsTyCode = bbsTyCode;
	}


	/**
	 * @return the fileAtchPosblAt
	 */
	public String getFileAtchPosblAt() {
		return fileAtchPosblAt;
	}


	/**
	 * @param fileAtchPosblAt the fileAtchPosblAt to set
	 */
	public void setFileAtchPosblAt(String fileAtchPosblAt) {
		this.fileAtchPosblAt = fileAtchPosblAt;
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
	 * @return the atchPosblFileNumber
	 */
	public int getAtchPosblFileNumber() {
		return atchPosblFileNumber;
	}


	/**
	 * @param atchPosblFileNumber the atchPosblFileNumber to set
	 */
	public void setAtchPosblFileNumber(int atchPosblFileNumber) {
		this.atchPosblFileNumber = atchPosblFileNumber;
	}


	/**
	 * @return the atchPosblFileSize
	 */
	public String getAtchPosblFileSize() {
		return atchPosblFileSize;
	}


	/**
	 * @param atchPosblFileSize the atchPosblFileSize to set
	 */
	public void setAtchPosblFileSize(String atchPosblFileSize) {
		this.atchPosblFileSize = atchPosblFileSize;
	}


	/**
	 * @return the replyPosblAt
	 */
	public String getReplyPosblAt() {
		return replyPosblAt;
	}


	/**
	 * @param replyPosblAt the replyPosblAt to set
	 */
	public void setReplyPosblAt(String replyPosblAt) {
		this.replyPosblAt = replyPosblAt;
	}


	/**
	 * @return the tmplatId
	 */
	public String getTmplatId() {
		return tmplatId;
	}


	/**
	 * @param tmplatId the tmplatId to set
	 */
	public void setTmplatId(String tmplatId) {
		this.tmplatId = tmplatId;
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
	 * @return the bbsUseFlag
	 */
	public String getBbsUseFlag() {
		return bbsUseFlag;
	}


	/**
	 * @param bbsUseFlag the bbsUseFlag to set
	 */
	public void setBbsUseFlag(String bbsUseFlag) {
		this.bbsUseFlag = bbsUseFlag;
	}


	/**
	 * @return the trgetId
	 */
	public String getTrgetId() {
		return trgetId;
	}


	/**
	 * @param trgetId the trgetId to set
	 */
	public void setTrgetId(String trgetId) {
		this.trgetId = trgetId;
	}


	/**
	 * @return the registSeCode
	 */
	public String getRegistSeCode() {
		return registSeCode;
	}


	/**
	 * @param registSeCode the registSeCode to set
	 */
	public void setRegistSeCode(String registSeCode) {
		this.registSeCode = registSeCode;
	}


	/**
	 * @return the uniqId
	 */
	public String getUniqId() {
		return uniqId;
	}


	/**
	 * @param uniqId the uniqId to set
	 */
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}


	/**
	 * @return the tmplatNm
	 */
	public String getTmplatNm() {
		return tmplatNm;
	}


	/**
	 * @param tmplatNm the tmplatNm to set
	 */
	public void setTmplatNm(String tmplatNm) {
		this.tmplatNm = tmplatNm;
	}


	/**
	 * @return the cmmntyId
	 */
	public String getCmmntyId() {
		return cmmntyId;
	}


	/**
	 * @param cmmntyId the cmmntyId to set
	 */
	public void setCmmntyId(String cmmntyId) {
		this.cmmntyId = cmmntyId;
	}


	/**
	 * @return the blogId
	 */
	public String getBlogId() {
		return blogId;
	}


	/**
	 * @param blogId the blogId to set
	 */
	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}


	/**
	 * @return the blogAt
	 */
	public String getBlogAt() {
		return blogAt;
	}


	/**
	 * @param blogAt the blogAt to set
	 */
	public void setBlogAt(String blogAt) {
		this.blogAt = blogAt;
	}


	/**
	 * @return the option
	 */
	public String getOption() {
		return option;
	}


	/**
	 * @param option the option to set
	 */
	public void setOption(String option) {
		this.option = option;
	}


	/**
	 * @return the commentAt
	 */
	public String getCommentAt() {
		return commentAt;
	}


	/**
	 * @param commentAt the commentAt to set
	 */
	public void setCommentAt(String commentAt) {
		this.commentAt = commentAt;
	}


	/**
	 * @return the stsfdgAt
	 */
	public String getStsfdgAt() {
		return stsfdgAt;
	}


	/**
	 * @param stsfdgAt the stsfdgAt to set
	 */
	public void setStsfdgAt(String stsfdgAt) {
		this.stsfdgAt = stsfdgAt;
	}


	/**
	 * @return the custom1Yn
	 */
	public String getCustom1Yn() {
		return custom1Yn;
	}


	/**
	 * @param custom1Yn the custom1Yn to set
	 */
	public void setCustom1Yn(String custom1Yn) {
		this.custom1Yn = custom1Yn;
	}


	/**
	 * @return the custom2Yn
	 */
	public String getCustom2Yn() {
		return custom2Yn;
	}


	/**
	 * @param custom2Yn the custom2Yn to set
	 */
	public void setCustom2Yn(String custom2Yn) {
		this.custom2Yn = custom2Yn;
	}


	/**
	 * @return the custom3Yn
	 */
	public String getCustom3Yn() {
		return custom3Yn;
	}


	/**
	 * @param custom3Yn the custom3Yn to set
	 */
	public void setCustom3Yn(String custom3Yn) {
		this.custom3Yn = custom3Yn;
	}


	/**
	 * @return the custom4Yn
	 */
	public String getCustom4Yn() {
		return custom4Yn;
	}


	/**
	 * @param custom4Yn the custom4Yn to set
	 */
	public void setCustom4Yn(String custom4Yn) {
		this.custom4Yn = custom4Yn;
	}


	/**
	 * @return the custom5Yn
	 */
	public String getCustom5Yn() {
		return custom5Yn;
	}


	/**
	 * @param custom5Yn the custom5Yn to set
	 */
	public void setCustom5Yn(String custom5Yn) {
		this.custom5Yn = custom5Yn;
	}


	/**
	 * @return the customDate1Yn
	 */
	public String getCustomDate1Yn() {
		return customDate1Yn;
	}


	/**
	 * @param customDate1Yn the customDate1Yn to set
	 */
	public void setCustomDate1Yn(String customDate1Yn) {
		this.customDate1Yn = customDate1Yn;
	}


	/**
	 * @return the customDate2Yn
	 */
	public String getCustomDate2Yn() {
		return customDate2Yn;
	}


	/**
	 * @param customDate2Yn the customDate2Yn to set
	 */
	public void setCustomDate2Yn(String customDate2Yn) {
		this.customDate2Yn = customDate2Yn;
	}


	/**
	 * @return the customDate3Yn
	 */
	public String getCustomDate3Yn() {
		return customDate3Yn;
	}


	/**
	 * @param customDate3Yn the customDate3Yn to set
	 */
	public void setCustomDate3Yn(String customDate3Yn) {
		this.customDate3Yn = customDate3Yn;
	}


	/**
	 * @return the customDate4Yn
	 */
	public String getCustomDate4Yn() {
		return customDate4Yn;
	}


	/**
	 * @param customDate4Yn the customDate4Yn to set
	 */
	public void setCustomDate4Yn(String customDate4Yn) {
		this.customDate4Yn = customDate4Yn;
	}


	/**
	 * @return the customDate5Yn
	 */
	public String getCustomDate5Yn() {
		return customDate5Yn;
	}


	/**
	 * @param customDate5Yn the customDate5Yn to set
	 */
	public void setCustomDate5Yn(String customDate5Yn) {
		this.customDate5Yn = customDate5Yn;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
