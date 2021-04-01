package fbcms.admin.sym.umt.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 업무사용자VO클래스로서 업무사용자관리 비지니스로직 처리용 항목을 구성한다.
 */
public class AdminAdminManageVO extends AdminAdminDefaultVO {

	private static final long serialVersionUID = 3640820362821490939L;

	/** 이전비밀번호 - 비밀번호 변경시 사용*/
    private String oldPassword = "";

    /**
	 * 가입일
	 */
	private String sbscrbDe;
	
	/**
	 * 사용자고유아이디
	 */
	private String uniqId = "";
	
	/**
	 * 사용자 유형
	 */
	private String userTy;
	
	/**
	 * 지역번호
	 */
	private String areaNo;
	
	/**
	 * 생일
	 */
	private String brth;
	
	/**
	 * 상세주소
	 */
	private String detailAdres;
	
	/**
	 * 이메일주소
	 */
	private String emailAdres;
	
	/**
	 * 사원번호
	 */
	private String emplNo;
	
	/**
	 * 사용자 ID
	 */
	private String emplyrId;
	
	/**
	 * 사용자 명
	 */
	private String emplyrNm;
	
	/**
	 * 사용자 상태
	 */
	private String emplyrSttusCode;
	
	/**
	 * 팩스번호
	 */
	private String fxnum;
	
	/**
	 * 그룹 ID
	 */
	private String groupId;
	
	/**
	 * 집 주소
	 */
	private String homeadres;
	
	/**
	 * 집끝전화번호
	 */
	private String homeendTelno;
	
	/**
	 * 집중간전화번호
	 */
	private String homemiddleTelno;
	
	/**
	 * 주민등록번호
	 */
	private String ihidnum;
	
	/**
	 * 소속기관코드
	 */
	private String insttCode;
	
	/**
	 * 검색조건 회원타입
	 */
	private String mberTy;
	
	/**
	 * 핸드폰번호
	 */
	private String moblphonNo;
	
	/**
	 * 직위명
	 */
	private String ofcpsNm;
	
	/**
	 * 사무실전화번호
	 */
	private String offmTelno;
	
	/**
	 * 조직 ID
	 */
	private String orgnztId;
	
	/**
	 * 비밀번호
	 */
	private String password;
	
	/**
	 * 비밀번호 정답
	 */
	private String passwordCnsr;
	
	/**
	 * 비밀번호 힌트
	 */
	private String passwordHint;
	
	/**
	 * 검색조건 가입일자 시작일
	 */
	private String sbscrbDeBegin;
	
	/**
	 * 검색조건 가입일자 종료일
	 */
	private String sbscrbDeEnd;
	
	/**
	 * 성별코드
	 */
	private String sexdstnCode;
	
	/**
	 * 우편번호
	 */
	private String zip;
	
	/**
	 * DN 값
	 */
	private String subDn;
	
	/**
	 * 잠금여부
	 */
	private String lockAt;
	
	/**
	 * 잠금회수
	 */
	private int lockCnt = 0;
	
	/**
	 * 잠금최종시점
	 */
	private String lockLastPnttm;
	
	/**
	 * 최초등록ID
	 */
	private String frstRegisterId;
	
	/**
	 * 최종수정ID
	 */
	private String lastUpdusrId;
	
	/**
	 * 최종수정시점
	 */
	private String lastUpdtPnttm;
	
	/**
	 * 최종로그인일시
	 */
	private String lastLoginDt;
	
	
	/**
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}


	/**
	 * @param oldPassword the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}


	/**
	 * @return the sbscrbDe
	 */
	public String getSbscrbDe() {
		return sbscrbDe;
	}


	/**
	 * @param sbscrbDe the sbscrbDe to set
	 */
	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
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
	 * @return the userTy
	 */
	public String getUserTy() {
		return userTy;
	}


	/**
	 * @param userTy the userTy to set
	 */
	public void setUserTy(String userTy) {
		this.userTy = userTy;
	}


	/**
	 * @return the areaNo
	 */
	public String getAreaNo() {
		return areaNo;
	}


	/**
	 * @param areaNo the areaNo to set
	 */
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}


	/**
	 * @return the brth
	 */
	public String getBrth() {
		return brth;
	}


	/**
	 * @param brth the brth to set
	 */
	public void setBrth(String brth) {
		this.brth = brth;
	}


	/**
	 * @return the detailAdres
	 */
	public String getDetailAdres() {
		return detailAdres;
	}


	/**
	 * @param detailAdres the detailAdres to set
	 */
	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}


	/**
	 * @return the emailAdres
	 */
	public String getEmailAdres() {
		return emailAdres;
	}


	/**
	 * @param emailAdres the emailAdres to set
	 */
	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}


	/**
	 * @return the emplNo
	 */
	public String getEmplNo() {
		return emplNo;
	}


	/**
	 * @param emplNo the emplNo to set
	 */
	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}


	/**
	 * @return the emplyrId
	 */
	public String getEmplyrId() {
		return emplyrId;
	}


	/**
	 * @param emplyrId the emplyrId to set
	 */
	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}


	/**
	 * @return the emplyrNm
	 */
	public String getEmplyrNm() {
		return emplyrNm;
	}


	/**
	 * @param emplyrNm the emplyrNm to set
	 */
	public void setEmplyrNm(String emplyrNm) {
		this.emplyrNm = emplyrNm;
	}


	/**
	 * @return the emplyrSttusCode
	 */
	public String getEmplyrSttusCode() {
		return emplyrSttusCode;
	}


	/**
	 * @param emplyrSttusCode the emplyrSttusCode to set
	 */
	public void setEmplyrSttusCode(String emplyrSttusCode) {
		this.emplyrSttusCode = emplyrSttusCode;
	}


	/**
	 * @return the fxnum
	 */
	public String getFxnum() {
		return fxnum;
	}


	/**
	 * @param fxnum the fxnum to set
	 */
	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}


	/**
	 * @return the groupId
	 */
	public String getGroupId() {
		return groupId;
	}


	/**
	 * @param groupId the groupId to set
	 */
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}


	/**
	 * @return the homeadres
	 */
	public String getHomeadres() {
		return homeadres;
	}


	/**
	 * @param homeadres the homeadres to set
	 */
	public void setHomeadres(String homeadres) {
		this.homeadres = homeadres;
	}


	/**
	 * @return the homeendTelno
	 */
	public String getHomeendTelno() {
		return homeendTelno;
	}


	/**
	 * @param homeendTelno the homeendTelno to set
	 */
	public void setHomeendTelno(String homeendTelno) {
		this.homeendTelno = homeendTelno;
	}


	/**
	 * @return the homemiddleTelno
	 */
	public String getHomemiddleTelno() {
		return homemiddleTelno;
	}


	/**
	 * @param homemiddleTelno the homemiddleTelno to set
	 */
	public void setHomemiddleTelno(String homemiddleTelno) {
		this.homemiddleTelno = homemiddleTelno;
	}


	/**
	 * @return the ihidnum
	 */
	public String getIhidnum() {
		return ihidnum;
	}


	/**
	 * @param ihidnum the ihidnum to set
	 */
	public void setIhidnum(String ihidnum) {
		this.ihidnum = ihidnum;
	}


	/**
	 * @return the insttCode
	 */
	public String getInsttCode() {
		return insttCode;
	}


	/**
	 * @param insttCode the insttCode to set
	 */
	public void setInsttCode(String insttCode) {
		this.insttCode = insttCode;
	}


	/**
	 * @return the mberTy
	 */
	public String getMberTy() {
		return mberTy;
	}


	/**
	 * @param mberTy the mberTy to set
	 */
	public void setMberTy(String mberTy) {
		this.mberTy = mberTy;
	}


	/**
	 * @return the moblphonNo
	 */
	public String getMoblphonNo() {
		return moblphonNo;
	}


	/**
	 * @param moblphonNo the moblphonNo to set
	 */
	public void setMoblphonNo(String moblphonNo) {
		this.moblphonNo = moblphonNo;
	}


	/**
	 * @return the ofcpsNm
	 */
	public String getOfcpsNm() {
		return ofcpsNm;
	}


	/**
	 * @param ofcpsNm the ofcpsNm to set
	 */
	public void setOfcpsNm(String ofcpsNm) {
		this.ofcpsNm = ofcpsNm;
	}


	/**
	 * @return the offmTelno
	 */
	public String getOffmTelno() {
		return offmTelno;
	}


	/**
	 * @param offmTelno the offmTelno to set
	 */
	public void setOffmTelno(String offmTelno) {
		this.offmTelno = offmTelno;
	}


	/**
	 * @return the orgnztId
	 */
	public String getOrgnztId() {
		return orgnztId;
	}


	/**
	 * @param orgnztId the orgnztId to set
	 */
	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
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
	 * @return the passwordCnsr
	 */
	public String getPasswordCnsr() {
		return passwordCnsr;
	}


	/**
	 * @param passwordCnsr the passwordCnsr to set
	 */
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}


	/**
	 * @return the passwordHint
	 */
	public String getPasswordHint() {
		return passwordHint;
	}


	/**
	 * @param passwordHint the passwordHint to set
	 */
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}


	/**
	 * @return the sbscrbDeBegin
	 */
	public String getSbscrbDeBegin() {
		return sbscrbDeBegin;
	}


	/**
	 * @param sbscrbDeBegin the sbscrbDeBegin to set
	 */
	public void setSbscrbDeBegin(String sbscrbDeBegin) {
		this.sbscrbDeBegin = sbscrbDeBegin;
	}


	/**
	 * @return the sbscrbDeEnd
	 */
	public String getSbscrbDeEnd() {
		return sbscrbDeEnd;
	}


	/**
	 * @param sbscrbDeEnd the sbscrbDeEnd to set
	 */
	public void setSbscrbDeEnd(String sbscrbDeEnd) {
		this.sbscrbDeEnd = sbscrbDeEnd;
	}


	/**
	 * @return the sexdstnCode
	 */
	public String getSexdstnCode() {
		return sexdstnCode;
	}


	/**
	 * @param sexdstnCode the sexdstnCode to set
	 */
	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}


	/**
	 * @return the zip
	 */
	public String getZip() {
		return zip;
	}


	/**
	 * @param zip the zip to set
	 */
	public void setZip(String zip) {
		this.zip = zip;
	}


	/**
	 * @return the subDn
	 */
	public String getSubDn() {
		return subDn;
	}


	/**
	 * @param subDn the subDn to set
	 */
	public void setSubDn(String subDn) {
		this.subDn = subDn;
	}


	/**
	 * @return the lockAt
	 */
	public String getLockAt() {
		return lockAt;
	}


	/**
	 * @param lockAt the lockAt to set
	 */
	public void setLockAt(String lockAt) {
		this.lockAt = lockAt;
	}


	/**
	 * @return the lockCnt
	 */
	public int getLockCnt() {
		return lockCnt;
	}


	/**
	 * @param lockCnt the lockCnt to set
	 */
	public void setLockCnt(int lockCnt) {
		this.lockCnt = lockCnt;
	}


	/**
	 * @return the lockLastPnttm
	 */
	public String getLockLastPnttm() {
		return lockLastPnttm;
	}


	/**
	 * @param lockLastPnttm the lockLastPnttm to set
	 */
	public void setLockLastPnttm(String lockLastPnttm) {
		this.lockLastPnttm = lockLastPnttm;
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
	 * @return the lastUpdtPnttm
	 */
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}


	/**
	 * @param lastUpdtPnttm the lastUpdtPnttm to set
	 */
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}


	/**
	 * @return the lastLoginDt
	 */
	public String getLastLoginDt() {
		return lastLoginDt;
	}


	/**
	 * @param lastLoginDt the lastLoginDt to set
	 */
	public void setLastLoginDt(String lastLoginDt) {
		this.lastLoginDt = lastLoginDt;
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