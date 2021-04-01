package fbcms.admin.hpm.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 게시물 관리를 위한 VO 클래스
 */
@SuppressWarnings("serial")
public class AdminBoardVO extends AdminBoard implements Serializable {
	
    /** 검색시작일 */
    private String searchBgnDe = "";
    
    /** 검색조건 */
    private String searchCnd = "";
    
    /** 검색종료일 */
    private String searchEndDe = "";
    
    /** 검색단어 */
    private String searchWrd = "";
    
    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 유효여부 */
    private String isExpired = "N";

    /** 상위 정렬 순서 */
    private String parntsSortOrdr = "";

    /** 상위 답변 위치 */
    private String parntsReplyLc = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";
    
    /** 게시판 속성코드 */
    private String bbsAttrbCode = "";

    /** 게시판 명 */
    private String bbsNm = "";

    /** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";
    
    /** 첨부가능파일숫자 */
    private int posblAtchFileNumber = 0;
    
    /** 답장가능여부 */
    private String replyPosblAt = "";
    
    /** 조회 수 증가 여부 */
    private boolean plusCount = false;
    
    /** 익명등록 여부 */
    private String anonymousAt = "";
    
    /** 하위 페이지 인덱스 (댓글 및 만족도 조사 여부 확인용) */
    private String subPageIndex = "";
    
    /** 게시글 댓글갯수 */
    private String commentCo = "";
    
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
	 * @return the searchBgnDe
	 */
	public String getSearchBgnDe() {
		return searchBgnDe;
	}


	/**
	 * @param searchBgnDe the searchBgnDe to set
	 */
	public void setSearchBgnDe(String searchBgnDe) {
		this.searchBgnDe = searchBgnDe;
	}


	/**
	 * @return the searchCnd
	 */
	public String getSearchCnd() {
		return searchCnd;
	}


	/**
	 * @param searchCnd the searchCnd to set
	 */
	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}


	/**
	 * @return the searchEndDe
	 */
	public String getSearchEndDe() {
		return searchEndDe;
	}


	/**
	 * @param searchEndDe the searchEndDe to set
	 */
	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}


	/**
	 * @return the searchWrd
	 */
	public String getSearchWrd() {
		return searchWrd;
	}


	/**
	 * @param searchWrd the searchWrd to set
	 */
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}


	/**
	 * @return the sortOrdr
	 */
	public long getSortOrdr() {
		return sortOrdr;
	}


	/**
	 * @param sortOrdr the sortOrdr to set
	 */
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
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
	 * @return the rowNo
	 */
	public int getRowNo() {
		return rowNo;
	}


	/**
	 * @param rowNo the rowNo to set
	 */
	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}


	/**
	 * @return the frstRegisterNm
	 */
	public String getFrstRegisterNm() {
		return frstRegisterNm;
	}


	/**
	 * @param frstRegisterNm the frstRegisterNm to set
	 */
	public void setFrstRegisterNm(String frstRegisterNm) {
		this.frstRegisterNm = frstRegisterNm;
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
	 * @return the isExpired
	 */
	public String getIsExpired() {
		return isExpired;
	}


	/**
	 * @param isExpired the isExpired to set
	 */
	public void setIsExpired(String isExpired) {
		this.isExpired = isExpired;
	}


	/**
	 * @return the parntsSortOrdr
	 */
	public String getParntsSortOrdr() {
		return parntsSortOrdr;
	}


	/**
	 * @param parntsSortOrdr the parntsSortOrdr to set
	 */
	public void setParntsSortOrdr(String parntsSortOrdr) {
		this.parntsSortOrdr = parntsSortOrdr;
	}


	/**
	 * @return the parntsReplyLc
	 */
	public String getParntsReplyLc() {
		return parntsReplyLc;
	}


	/**
	 * @param parntsReplyLc the parntsReplyLc to set
	 */
	public void setParntsReplyLc(String parntsReplyLc) {
		this.parntsReplyLc = parntsReplyLc;
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
	 * @return the bbsAttrbCode
	 */
	public String getBbsAttrbCode() {
		return bbsAttrbCode;
	}


	/**
	 * @param bbsAttrbCode the bbsAttrbCode to set
	 */
	public void setBbsAttrbCode(String bbsAttrbCode) {
		this.bbsAttrbCode = bbsAttrbCode;
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
	 * @return the posblAtchFileNumber
	 */
	public int getPosblAtchFileNumber() {
		return posblAtchFileNumber;
	}


	/**
	 * @param posblAtchFileNumber the posblAtchFileNumber to set
	 */
	public void setPosblAtchFileNumber(int posblAtchFileNumber) {
		this.posblAtchFileNumber = posblAtchFileNumber;
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
	 * @return the plusCount
	 */
	public boolean isPlusCount() {
		return plusCount;
	}


	/**
	 * @param plusCount the plusCount to set
	 */
	public void setPlusCount(boolean plusCount) {
		this.plusCount = plusCount;
	}


	/**
	 * @return the anonymousAt
	 */
	public String getAnonymousAt() {
		return anonymousAt;
	}


	/**
	 * @param anonymousAt the anonymousAt to set
	 */
	public void setAnonymousAt(String anonymousAt) {
		this.anonymousAt = anonymousAt;
	}


	/**
	 * @return the subPageIndex
	 */
	public String getSubPageIndex() {
		return subPageIndex;
	}


	/**
	 * @param subPageIndex the subPageIndex to set
	 */
	public void setSubPageIndex(String subPageIndex) {
		this.subPageIndex = subPageIndex;
	}


	/**
	 * @return the commentCo
	 */
	public String getCommentCo() {
		return commentCo;
	}


	/**
	 * @param commentCo the commentCo to set
	 */
	public void setCommentCo(String commentCo) {
		this.commentCo = commentCo;
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
