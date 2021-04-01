package egovframework.com.cmm;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : ComDefaultVO.java
 * @Description : ComDefaultVO class
 * @Modification Information
 * @
 * @  수정일		 수정자				   수정내용
 * @ -------	--------	---------------------------
 * @ 2009.02.01	조재영		 최초 생성
 *
 *  @author 공통서비스 개발팀 조재영
 *  @since 2009.02.01
 *  @version 1.0
 *  @see 
 *  
 */
@SuppressWarnings("serial")
public class ComDefaultVO implements Serializable {
	
	/** 검색조건 */
	private String searchCondition = "";
	
	/** 검색Keyword */
	private String searchKeyword = "";
	
	/** 검색사용여부 */
	private String searchUseYn = "";
	
	/** 현재페이지 */
	private int pageIndex = 1;
	
	/** 페이지갯수 */
	private int pageUnit = 10;
	
	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
	/** 검색KeywordFrom */
	private String searchKeywordFrom = "";	

	/** 검색KeywordTo */
	private String searchKeywordTo = "";  
	
	/** 최초등록자 아이디 */
	private String frstRegisterId = "";
	
	/** 최초등록시점 */
	private String frstRegisterPnttm = "";
	
	/** 최종수정자 아이디 */
	private String lastUpdusrId = "";
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";
	
	/** 삭제 첨부파일 순번 */
	private String deleteFileSn1 = "";
	
	/** 삭제 첨부파일 순번 */
	private String deleteFileSn2 = "";
	
	/** 삭제 첨부파일 순번 */
	private String deleteFileSn3 = "";
	
	/** 삭제 첨부파일 순번 */
	private String deleteFileSn4 = "";
	
	/** 삭제 첨부파일 순번 */
	private String deleteFileSn5 = "";
	
	/** 삭제 첨부파일 여부 */
	private String deleteFileYn1 = "";
	
	/** 삭제 첨부파일 여부 */
	private String deleteFileYn2 = "";
	
	/** 삭제 첨부파일 여부 */
	private String deleteFileYn3 = "";
	
	/** 삭제 첨부파일 여부 */
	private String deleteFileYn4 = "";
	
	/** 삭제 첨부파일 여부 */
	private String deleteFileYn5 = "";
	
	
	/**
	 * @return the searchCondition
	 */
	public String getSearchCondition() {
		return searchCondition;
	}


	/**
	 * @param searchCondition the searchCondition to set
	 */
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}


	/**
	 * @return the searchKeyword
	 */
	public String getSearchKeyword() {
		return searchKeyword;
	}


	/**
	 * @param searchKeyword the searchKeyword to set
	 */
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	/**
	 * @return the searchUseYn
	 */
	public String getSearchUseYn() {
		return searchUseYn;
	}


	/**
	 * @param searchUseYn the searchUseYn to set
	 */
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}


	/**
	 * @return the pageIndex
	 */
	public int getPageIndex() {
		return pageIndex;
	}


	/**
	 * @param pageIndex the pageIndex to set
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}


	/**
	 * @return the pageUnit
	 */
	public int getPageUnit() {
		return pageUnit;
	}


	/**
	 * @param pageUnit the pageUnit to set
	 */
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}


	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}


	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	/**
	 * @return the firstIndex
	 */
	public int getFirstIndex() {
		return firstIndex;
	}


	/**
	 * @param firstIndex the firstIndex to set
	 */
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}


	/**
	 * @return the lastIndex
	 */
	public int getLastIndex() {
		return lastIndex;
	}


	/**
	 * @param lastIndex the lastIndex to set
	 */
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}


	/**
	 * @return the recordCountPerPage
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}


	/**
	 * @param recordCountPerPage the recordCountPerPage to set
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	/**
	 * @return the searchKeywordFrom
	 */
	public String getSearchKeywordFrom() {
		return searchKeywordFrom;
	}


	/**
	 * @param searchKeywordFrom the searchKeywordFrom to set
	 */
	public void setSearchKeywordFrom(String searchKeywordFrom) {
		this.searchKeywordFrom = searchKeywordFrom;
	}


	/**
	 * @return the searchKeywordTo
	 */
	public String getSearchKeywordTo() {
		return searchKeywordTo;
	}


	/**
	 * @param searchKeywordTo the searchKeywordTo to set
	 */
	public void setSearchKeywordTo(String searchKeywordTo) {
		this.searchKeywordTo = searchKeywordTo;
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
	 * @return the deleteFileSn1
	 */
	public String getDeleteFileSn1() {
		return deleteFileSn1;
	}


	/**
	 * @param deleteFileSn1 the deleteFileSn1 to set
	 */
	public void setDeleteFileSn1(String deleteFileSn1) {
		this.deleteFileSn1 = deleteFileSn1;
	}


	/**
	 * @return the deleteFileSn2
	 */
	public String getDeleteFileSn2() {
		return deleteFileSn2;
	}


	/**
	 * @param deleteFileSn2 the deleteFileSn2 to set
	 */
	public void setDeleteFileSn2(String deleteFileSn2) {
		this.deleteFileSn2 = deleteFileSn2;
	}


	/**
	 * @return the deleteFileSn3
	 */
	public String getDeleteFileSn3() {
		return deleteFileSn3;
	}


	/**
	 * @param deleteFileSn3 the deleteFileSn3 to set
	 */
	public void setDeleteFileSn3(String deleteFileSn3) {
		this.deleteFileSn3 = deleteFileSn3;
	}


	/**
	 * @return the deleteFileSn4
	 */
	public String getDeleteFileSn4() {
		return deleteFileSn4;
	}


	/**
	 * @param deleteFileSn4 the deleteFileSn4 to set
	 */
	public void setDeleteFileSn4(String deleteFileSn4) {
		this.deleteFileSn4 = deleteFileSn4;
	}


	/**
	 * @return the deleteFileSn5
	 */
	public String getDeleteFileSn5() {
		return deleteFileSn5;
	}


	/**
	 * @param deleteFileSn5 the deleteFileSn5 to set
	 */
	public void setDeleteFileSn5(String deleteFileSn5) {
		this.deleteFileSn5 = deleteFileSn5;
	}


	/**
	 * @return the deleteFileYn1
	 */
	public String getDeleteFileYn1() {
		return deleteFileYn1;
	}


	/**
	 * @param deleteFileYn1 the deleteFileYn1 to set
	 */
	public void setDeleteFileYn1(String deleteFileYn1) {
		this.deleteFileYn1 = deleteFileYn1;
	}


	/**
	 * @return the deleteFileYn2
	 */
	public String getDeleteFileYn2() {
		return deleteFileYn2;
	}


	/**
	 * @param deleteFileYn2 the deleteFileYn2 to set
	 */
	public void setDeleteFileYn2(String deleteFileYn2) {
		this.deleteFileYn2 = deleteFileYn2;
	}


	/**
	 * @return the deleteFileYn3
	 */
	public String getDeleteFileYn3() {
		return deleteFileYn3;
	}


	/**
	 * @param deleteFileYn3 the deleteFileYn3 to set
	 */
	public void setDeleteFileYn3(String deleteFileYn3) {
		this.deleteFileYn3 = deleteFileYn3;
	}


	/**
	 * @return the deleteFileYn4
	 */
	public String getDeleteFileYn4() {
		return deleteFileYn4;
	}


	/**
	 * @param deleteFileYn4 the deleteFileYn4 to set
	 */
	public void setDeleteFileYn4(String deleteFileYn4) {
		this.deleteFileYn4 = deleteFileYn4;
	}


	/**
	 * @return the deleteFileYn5
	 */
	public String getDeleteFileYn5() {
		return deleteFileYn5;
	}


	/**
	 * @param deleteFileYn5 the deleteFileYn5 to set
	 */
	public void setDeleteFileYn5(String deleteFileYn5) {
		this.deleteFileYn5 = deleteFileYn5;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
