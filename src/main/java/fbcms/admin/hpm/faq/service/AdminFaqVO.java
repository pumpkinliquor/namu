package fbcms.admin.hpm.faq.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * FAQ를 처리하는 VO 클래스
 */
public class AdminFaqVO extends AdminFaq {
	
	private static final long serialVersionUID = 1L;
	
	/** FAQ ID */
	private String faqId;
	
	/** 질문제목 */
	private String qestnSj;
	
	/** 질문내용 */
	private String qestnCn;
	
	/** 답변내용 */
	private String answerCn;
	
	/** 조회횟수 */
	private String inqireCo;
	
	/** 첨부파일ID */
	private String atchFileId;
	
	/** 최초등록시점 */
	private String frstRegisterPnttm;
	
	/** 최초등록자ID */
	private String frstRegisterId;
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm;
	
	/** 최종수정자ID */
	private String lastUpdusrId;
	
    /** 게시여부 */
    private String postingYn = "";
    
    /** 태그이름 리스트 */
    private String tagNmList = "";
    
    /** 태그이름 */
    private String tagNm = "";
    
    /** 카테고리 code */
    private String categoryCode = "";
    
    /** 카테고리 name */
    private String categoryNm = "";
	
    
	/**
	 * @return the faqId
	 */
	public String getFaqId() {
		return faqId;
	}


	/**
	 * @param faqId the faqId to set
	 */
	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}


	/**
	 * @return the qestnSj
	 */
	public String getQestnSj() {
		return qestnSj;
	}


	/**
	 * @param qestnSj the qestnSj to set
	 */
	public void setQestnSj(String qestnSj) {
		this.qestnSj = qestnSj;
	}


	/**
	 * @return the qestnCn
	 */
	public String getQestnCn() {
		return qestnCn;
	}


	/**
	 * @param qestnCn the qestnCn to set
	 */
	public void setQestnCn(String qestnCn) {
		this.qestnCn = qestnCn;
	}


	/**
	 * @return the answerCn
	 */
	public String getAnswerCn() {
		return answerCn;
	}


	/**
	 * @param answerCn the answerCn to set
	 */
	public void setAnswerCn(String answerCn) {
		this.answerCn = answerCn;
	}


	/**
	 * @return the inqireCo
	 */
	public String getInqireCo() {
		return inqireCo;
	}


	/**
	 * @param inqireCo the inqireCo to set
	 */
	public void setInqireCo(String inqireCo) {
		this.inqireCo = inqireCo;
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
	 * @return the tagNmList
	 */
	public String getTagNmList() {
		return tagNmList;
	}


	/**
	 * @param tagNmList the tagNmList to set
	 */
	public void setTagNmList(String tagNmList) {
		this.tagNmList = tagNmList;
	}


	/**
	 * @return the tagNm
	 */
	public String getTagNm() {
		return tagNm;
	}


	/**
	 * @param tagNm the tagNm to set
	 */
	public void setTagNm(String tagNm) {
		this.tagNm = tagNm;
	}


	/**
	 * @return the categoryCd
	 */
	public String getCategoryCode() {
		return categoryCode;
	}


	/**
	 * @param categoryCd the categoryCd to set
	 */
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}


	/**
	 * @return the categoryNm
	 */
	public String getCategoryNm() {
		return categoryNm;
	}


	/**
	 * @param categoryNm the categoryNm to set
	 */
	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
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
