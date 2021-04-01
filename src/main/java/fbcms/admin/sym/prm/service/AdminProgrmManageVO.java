package fbcms.admin.sym.prm.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

/** 
 * 프로그램목록 처리를 위한 VO 클래스르를 정의한다
 */
public class AdminProgrmManageVO {
	
	/** 프로그램파일명 */
	private String progrmFileNm;
	
	/** 프로그램저장경로 */
	private String progrmStrePath;
	
	/** 프로그램한글명 */
	private String progrmKoreanNm;
	
	/** url */
	private String url;
	
	/** 프로그램설명 */	
	private String progrmDc;

	/**
	 * @return the progrmFileNm
	 */
	public String getProgrmFileNm() {
		return progrmFileNm;
	}

	/**
	 * @param progrmFileNm the progrmFileNm to set
	 */
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}

	/**
	 * @return the progrmStrePath
	 */
	public String getProgrmStrePath() {
		return progrmStrePath;
	}

	/**
	 * @param progrmStrePath the progrmStrePath to set
	 */
	public void setProgrmStrePath(String progrmStrePath) {
		this.progrmStrePath = progrmStrePath;
	}

	/**
	 * @return the progrmKoreanNm
	 */
	public String getProgrmKoreanNm() {
		return progrmKoreanNm;
	}

	/**
	 * @param progrmKoreanNm the progrmKoreanNm to set
	 */
	public void setProgrmKoreanNm(String progrmKoreanNm) {
		this.progrmKoreanNm = progrmKoreanNm;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the progrmDc
	 */
	public String getProgrmDc() {
		return progrmDc;
	}

	/**
	 * @param progrmDc the progrmDc to set
	 */
	public void setProgrmDc(String progrmDc) {
		this.progrmDc = progrmDc;
	}
	
	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}