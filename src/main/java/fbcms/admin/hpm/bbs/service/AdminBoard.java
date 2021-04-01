package fbcms.admin.hpm.bbs.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.service.FileVO;

/**
 * 게시물에 대한 데이터 처리 모델
 */
@SuppressWarnings("serial")
public class AdminBoard implements Serializable {
	
	/** 게시물 첨부파일 아이디 */
	private String atchFileId = "";
	
	/** 게시물 첨부파일 순번 */
	private String atchFileSn = "";
	
	/** 게시물 첨부파일 확장자 */
	private String atchFileExtsn = "";
	
	/** 게시물 첨부파일 원래 이름 */
	private String atchFileNm = "";
	
	/** 게시판 아이디 */
	private String bbsId = "";
	
	/** 최초등록자 아이디 */
	private String frstRegisterId = "";
	
	/** 최초등록시점 */
	private String frstRegisterPnttm = "";
	
	/** 최종수정자 아이디 */
	private String lastUpdusrId = "";
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";
	
	/** 게시시작일 */
	private String ntceBgnde = "";
	
	/** 게시종료일 */
	private String ntceEndde = "";
	
	/** 게시자 아이디 */
	private String ntcrId = "";
	
	/** 게시자명 */
	private String ntcrNm = "";
	
	/** 게시물 내용 */
	private String nttCn = "";
	
	/** 게시물 아이디 */
	private long nttId = 0L;
	
	/** 게시물 번호 */
	private long nttNo = 0L;
	
	/** 게시물 제목 */
	private String nttSj = "";
	
	/** 부모글번호 */
	private String parnts = "0";
	
	/** 패스워드  */
	private String password = "";
	
	/** 조회수 */
	private int inqireCo = 0;
	
	/** 답장여부 */
	private String replyAt = "";
	
	/** 답장위치 */
	private String replyLc = "0";
	
	/** 정렬순서 */
	private long sortOrdr = 0L;
	
	/** 사용여부 */
	private String useAt = "";
	
	/** 게시 종료일 */
	private String ntceEnddeView = "";
	
	/** 게시 시작일 */
	private String ntceBgndeView = "";
	
	/** 공지사항 여부 */
	private String noticeAt = "";
	
	/** 비밀글 여부 */
	private String secretAt = "";
	
	/** 제목 Bold 여부 */
	private String sjBoldAt = "";
	
	/** 블로그 게시판 여부 */
	private String blogAt = "";
	
	/** 블로그 ID */
    private String blogId = "";
    
    /** 게시여부 */
    private String postingYn = "";
    
    /** custom1 */
    private String custom1 = "";
    
    /** custom2 */
    private String custom2 = "";
    
    /** custom3 */
    private String custom3 = "";
    
    /** custom4 */
    private String custom4 = "";
    
    /** custom5 */
    private String custom5 = "";
    
    /** customDate1 */
    private String customDate1 = "";
    
    /** customDate2 */
    private String customDate2 = "";
    
    /** customDate3 */
    private String customDate3 = "";
    
    /** customDate4 */
    private String customDate4 = "";
    
    /** customDate5 */
    private String customDate5 = "";
    
    /** 태그이름 리스트 */
    private String tagNmList = "";
    
    /** 태그이름 */
    private String tagNm = "";
	
	/** 지원자수 */
	private int appCnt = 0;
	
	/** 부모글 custom1 */
	private String parntsCustom1 = "";
	
	/** 부모글 custom2 */
	private String parntsCustom2 = "";
	
	/** 부모글 custom3 */
	private String parntsCustom3 = "";
	
	/** 부모글 custom4 */
	private String parntsCustom4 = "";
	
	/** 부모글 custom5 */
	private String parntsCustom5 = "";
    
    /** 부모글 customDate1 */
    private String parntsCustomDate1 = "";
    
    /** 부모글 customDate2 */
    private String parntsCustomDate2 = "";
    
    /** 부모글 customDate3 */
    private String parntsCustomDate3 = "";
    
    /** 부모글 customDate4 */
    private String parntsCustomDate4 = "";
    
    /** 부모글 customDate5 */
    private String parntsCustomDate5 = "";
    
    /** file list */
    private List<FileVO> listFile = new ArrayList<FileVO>();
    
	
	/**
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}


	/**
	 * @return the atchFileSn
	 */
	public String getAtchFileSn() {
		return atchFileSn;
	}


	/**
	 * @param atchFileSn the atchFileSn to set
	 */
	public void setAtchFileSn(String atchFileSn) {
		this.atchFileSn = atchFileSn;
	}


	/**
	 * @return the atchFileExtsn
	 */
	public String getAtchFileExtsn() {
		return atchFileExtsn;
	}


	/**
	 * @param atchFileExtsn the atchFileExtsn to set
	 */
	public void setAtchFileExtsn(String atchFileExtsn) {
		this.atchFileExtsn = atchFileExtsn;
	}


	/**
	 * @return the atchFileNm
	 */
	public String getAtchFileNm() {
		return atchFileNm;
	}


	/**
	 * @param atchFileNm the atchFileNm to set
	 */
	public void setAtchFileNm(String atchFileNm) {
		this.atchFileNm = atchFileNm;
	}


	/**
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}


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
	 * @return the ntcrId
	 */
	public String getNtcrId() {
		return ntcrId;
	}


	/**
	 * @param ntcrId the ntcrId to set
	 */
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}


	/**
	 * @return the ntcrNm
	 */
	public String getNtcrNm() {
		return ntcrNm;
	}


	/**
	 * @param ntcrNm the ntcrNm to set
	 */
	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}


	/**
	 * @return the nttCn
	 */
	public String getNttCn() {
		return nttCn;
	}


	/**
	 * @param nttCn the nttCn to set
	 */
	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}


	/**
	 * @return the nttId
	 */
	public long getNttId() {
		return nttId;
	}


	/**
	 * @param nttId the nttId to set
	 */
	public void setNttId(long nttId) {
		this.nttId = nttId;
	}


	/**
	 * @return the nttNo
	 */
	public long getNttNo() {
		return nttNo;
	}


	/**
	 * @param nttNo the nttNo to set
	 */
	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}


	/**
	 * @return the nttSj
	 */
	public String getNttSj() {
		return nttSj;
	}


	/**
	 * @param nttSj the nttSj to set
	 */
	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}


	/**
	 * @return the parnts
	 */
	public String getParnts() {
		return parnts;
	}


	/**
	 * @param parnts the parnts to set
	 */
	public void setParnts(String parnts) {
		this.parnts = parnts;
	}


	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}


	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	/**
	 * @return the inqireCo
	 */
	public int getInqireCo() {
		return inqireCo;
	}


	/**
	 * @param inqireCo the inqireCo to set
	 */
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}


	/**
	 * @return the replyAt
	 */
	public String getReplyAt() {
		return replyAt;
	}


	/**
	 * @param replyAt the replyAt to set
	 */
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}


	/**
	 * @return the replyLc
	 */
	public String getReplyLc() {
		return replyLc;
	}


	/**
	 * @param replyLc the replyLc to set
	 */
	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
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
	 * @return the ntceEnddeView
	 */
	public String getNtceEnddeView() {
		return ntceEnddeView;
	}


	/**
	 * @param ntceEnddeView the ntceEnddeView to set
	 */
	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}


	/**
	 * @return the ntceBgndeView
	 */
	public String getNtceBgndeView() {
		return ntceBgndeView;
	}


	/**
	 * @param ntceBgndeView the ntceBgndeView to set
	 */
	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}


	/**
	 * @return the noticeAt
	 */
	public String getNoticeAt() {
		return noticeAt;
	}


	/**
	 * @param noticeAt the noticeAt to set
	 */
	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}


	/**
	 * @return the secretAt
	 */
	public String getSecretAt() {
		return secretAt;
	}


	/**
	 * @param secretAt the secretAt to set
	 */
	public void setSecretAt(String secretAt) {
		this.secretAt = secretAt;
	}


	/**
	 * @return the sjBoldAt
	 */
	public String getSjBoldAt() {
		return sjBoldAt;
	}


	/**
	 * @param sjBoldAt the sjBoldAt to set
	 */
	public void setSjBoldAt(String sjBoldAt) {
		this.sjBoldAt = sjBoldAt;
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
	 * @return the custom1
	 */
	public String getCustom1() {
		return custom1;
	}


	/**
	 * @param custom1 the custom1 to set
	 */
	public void setCustom1(String custom1) {
		this.custom1 = custom1;
	}


	/**
	 * @return the custom2
	 */
	public String getCustom2() {
		return custom2;
	}


	/**
	 * @param custom2 the custom2 to set
	 */
	public void setCustom2(String custom2) {
		this.custom2 = custom2;
	}


	/**
	 * @return the custom3
	 */
	public String getCustom3() {
		return custom3;
	}


	/**
	 * @param custom3 the custom3 to set
	 */
	public void setCustom3(String custom3) {
		this.custom3 = custom3;
	}


	/**
	 * @return the custom4
	 */
	public String getCustom4() {
		return custom4;
	}


	/**
	 * @param custom4 the custom4 to set
	 */
	public void setCustom4(String custom4) {
		this.custom4 = custom4;
	}


	/**
	 * @return the custom5
	 */
	public String getCustom5() {
		return custom5;
	}


	/**
	 * @param custom5 the custom5 to set
	 */
	public void setCustom5(String custom5) {
		this.custom5 = custom5;
	}


	/**
	 * @return the customDate1
	 */
	public String getCustomDate1() {
		return customDate1;
	}


	/**
	 * @param customDate1 the customDate1 to set
	 */
	public void setCustomDate1(String customDate1) {
		this.customDate1 = customDate1;
	}


	/**
	 * @return the customDate2
	 */
	public String getCustomDate2() {
		return customDate2;
	}


	/**
	 * @param customDate2 the customDate2 to set
	 */
	public void setCustomDate2(String customDate2) {
		this.customDate2 = customDate2;
	}


	/**
	 * @return the customDate3
	 */
	public String getCustomDate3() {
		return customDate3;
	}


	/**
	 * @param customDate3 the customDate3 to set
	 */
	public void setCustomDate3(String customDate3) {
		this.customDate3 = customDate3;
	}


	/**
	 * @return the customDate4
	 */
	public String getCustomDate4() {
		return customDate4;
	}


	/**
	 * @param customDate4 the customDate4 to set
	 */
	public void setCustomDate4(String customDate4) {
		this.customDate4 = customDate4;
	}


	/**
	 * @return the customDate5
	 */
	public String getCustomDate5() {
		return customDate5;
	}


	/**
	 * @param customDate5 the customDate5 to set
	 */
	public void setCustomDate5(String customDate5) {
		this.customDate5 = customDate5;
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
	 * @return the appCnt
	 */
	public int getAppCnt() {
		return appCnt;
	}


	/**
	 * @param appCnt the appCnt to set
	 */
	public void setAppCnt(int appCnt) {
		this.appCnt = appCnt;
	}


	/**
	 * @return the parntsCustom1
	 */
	public String getParntsCustom1() {
		return parntsCustom1;
	}


	/**
	 * @param parntsCustom1 the parntsCustom1 to set
	 */
	public void setParntsCustom1(String parntsCustom1) {
		this.parntsCustom1 = parntsCustom1;
	}


	/**
	 * @return the parntsCustom2
	 */
	public String getParntsCustom2() {
		return parntsCustom2;
	}


	/**
	 * @param parntsCustom2 the parntsCustom2 to set
	 */
	public void setParntsCustom2(String parntsCustom2) {
		this.parntsCustom2 = parntsCustom2;
	}


	/**
	 * @return the parntsCustom3
	 */
	public String getParntsCustom3() {
		return parntsCustom3;
	}


	/**
	 * @param parntsCustom3 the parntsCustom3 to set
	 */
	public void setParntsCustom3(String parntsCustom3) {
		this.parntsCustom3 = parntsCustom3;
	}


	/**
	 * @return the parntsCustom4
	 */
	public String getParntsCustom4() {
		return parntsCustom4;
	}


	/**
	 * @param parntsCustom4 the parntsCustom4 to set
	 */
	public void setParntsCustom4(String parntsCustom4) {
		this.parntsCustom4 = parntsCustom4;
	}


	/**
	 * @return the parntsCustom5
	 */
	public String getParntsCustom5() {
		return parntsCustom5;
	}


	/**
	 * @param parntsCustom5 the parntsCustom5 to set
	 */
	public void setParntsCustom5(String parntsCustom5) {
		this.parntsCustom5 = parntsCustom5;
	}


	/**
	 * @return the parntsCustomDate1
	 */
	public String getParntsCustomDate1() {
		return parntsCustomDate1;
	}


	/**
	 * @param parntsCustomDate1 the parntsCustomDate1 to set
	 */
	public void setParntsCustomDate1(String parntsCustomDate1) {
		this.parntsCustomDate1 = parntsCustomDate1;
	}


	/**
	 * @return the parntsCustomDate2
	 */
	public String getParntsCustomDate2() {
		return parntsCustomDate2;
	}


	/**
	 * @param parntsCustomDate2 the parntsCustomDate2 to set
	 */
	public void setParntsCustomDate2(String parntsCustomDate2) {
		this.parntsCustomDate2 = parntsCustomDate2;
	}


	/**
	 * @return the parntsCustomDate3
	 */
	public String getParntsCustomDate3() {
		return parntsCustomDate3;
	}


	/**
	 * @param parntsCustomDate3 the parntsCustomDate3 to set
	 */
	public void setParntsCustomDate3(String parntsCustomDate3) {
		this.parntsCustomDate3 = parntsCustomDate3;
	}


	/**
	 * @return the parntsCustomDate4
	 */
	public String getParntsCustomDate4() {
		return parntsCustomDate4;
	}


	/**
	 * @param parntsCustomDate4 the parntsCustomDate4 to set
	 */
	public void setParntsCustomDate4(String parntsCustomDate4) {
		this.parntsCustomDate4 = parntsCustomDate4;
	}


	/**
	 * @return the parntsCustomDate5
	 */
	public String getParntsCustomDate5() {
		return parntsCustomDate5;
	}


	/**
	 * @param parntsCustomDate5 the parntsCustomDate5 to set
	 */
	public void setParntsCustomDate5(String parntsCustomDate5) {
		this.parntsCustomDate5 = parntsCustomDate5;
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
