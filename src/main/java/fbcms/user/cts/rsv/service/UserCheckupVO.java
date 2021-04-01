package fbcms.user.cts.rsv.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * Checkup 프로세스 통합 VO
 * 
 * @author 엄국현
 *
 */
public class UserCheckupVO extends ComDefaultVO {
	private static final long serialVersionUID = 1L;
	// 예약일자, 예약가능일자
	private String APPO_SCHE_DT;
	// 건강검진 코드
	private String DTIL_CD;
	// 건강검진 프로그램
	private String DTIL_NM;
	// 구분
	private String reservation;
	// 검진예약 등록가능여부
	private String POSB_YN;
	// 환자 성명
	private String usrNm;
	// 생년월일
	private String usrBd;
	// 성별
	private String gender;
	// 가족관계
	private String APPO_RLT_CD;
	// 휴대폰번호 앞자리
	private String fCtn;
	// 휴대폰번호 중간자리(국번
	private String mCtn;
	// 휴대폰번호 끝자리
	private String lCtn;
	// 전화번호 앞자리
	private String fTel;
	// 전화번호 중간자리 (국번)
	private String mTel;
	// 전화번호 끝자리
	private String lTel;
	// 이메일 아이디
	private String emailDetail;
	// 이메일 도메인
	private String emailDomain;
	// 이메일 Full
	private String EMAIL_ID;
	// 문의 및 전달사항
	private String content;
	// 달력선택
	private String RSVDT;
	// 시간선택
	private String RSVTM;
	// 유저 ID
	private String USER_ID;
	// 우편번호
	private String POST_NO;
	// 주소
	private String ADDR_TX;
	// 상세주소
	private String ADDR_DTIL_TX;
	/**
	 * @return the aPPO_SCHE_DT
	 */
	public String getAPPO_SCHE_DT() {
		return APPO_SCHE_DT;
	}
	/**
	 * @param aPPO_SCHE_DT the aPPO_SCHE_DT to set
	 */
	public void setAPPO_SCHE_DT(String aPPO_SCHE_DT) {
		APPO_SCHE_DT = aPPO_SCHE_DT;
	}
	/**
	 * @return the dTIL_CD
	 */
	public String getDTIL_CD() {
		return DTIL_CD;
	}
	/**
	 * @param dTIL_CD the dTIL_CD to set
	 */
	public void setDTIL_CD(String dTIL_CD) {
		DTIL_CD = dTIL_CD;
	}
	/**
	 * @return the dTIL_NM
	 */
	public String getDTIL_NM() {
		return DTIL_NM;
	}
	/**
	 * @param dTIL_NM the dTIL_NM to set
	 */
	public void setDTIL_NM(String dTIL_NM) {
		DTIL_NM = dTIL_NM;
	}
	/**
	 * @return the reservation
	 */
	public String getReservation() {
		return reservation;
	}
	/**
	 * @param reservation the reservation to set
	 */
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	/**
	 * @return the pOSB_YN
	 */
	public String getPOSB_YN() {
		return POSB_YN;
	}
	/**
	 * @param pOSB_YN the pOSB_YN to set
	 */
	public void setPOSB_YN(String pOSB_YN) {
		POSB_YN = pOSB_YN;
	}
	/**
	 * @return the usrNm
	 */
	public String getUsrNm() {
		return usrNm;
	}
	/**
	 * @param usrNm the usrNm to set
	 */
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	/**
	 * @return the usrBd
	 */
	public String getUsrBd() {
		return usrBd;
	}
	/**
	 * @param usrBd the usrBd to set
	 */
	public void setUsrBd(String usrBd) {
		this.usrBd = usrBd;
	}
	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return the aPPO_RLT_CD
	 */
	public String getAPPO_RLT_CD() {
		return APPO_RLT_CD;
	}
	/**
	 * @param aPPO_RLT_CD the aPPO_RLT_CD to set
	 */
	public void setAPPO_RLT_CD(String aPPO_RLT_CD) {
		APPO_RLT_CD = aPPO_RLT_CD;
	}
	/**
	 * @return the fCtn
	 */
	public String getfCtn() {
		return fCtn;
	}
	/**
	 * @param fCtn the fCtn to set
	 */
	public void setfCtn(String fCtn) {
		this.fCtn = fCtn;
	}
	/**
	 * @return the mCtn
	 */
	public String getmCtn() {
		return mCtn;
	}
	/**
	 * @param mCtn the mCtn to set
	 */
	public void setmCtn(String mCtn) {
		this.mCtn = mCtn;
	}
	/**
	 * @return the lCtn
	 */
	public String getlCtn() {
		return lCtn;
	}
	/**
	 * @param lCtn the lCtn to set
	 */
	public void setlCtn(String lCtn) {
		this.lCtn = lCtn;
	}
	/**
	 * @return the fTel
	 */
	public String getfTel() {
		return fTel;
	}
	/**
	 * @param fTel the fTel to set
	 */
	public void setfTel(String fTel) {
		this.fTel = fTel;
	}
	/**
	 * @return the mTel
	 */
	public String getmTel() {
		return mTel;
	}
	/**
	 * @param mTel the mTel to set
	 */
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	/**
	 * @return the lTel
	 */
	public String getlTel() {
		return lTel;
	}
	/**
	 * @param lTel the lTel to set
	 */
	public void setlTel(String lTel) {
		this.lTel = lTel;
	}
	/**
	 * @return the emailDetail
	 */
	public String getEmailDetail() {
		return emailDetail;
	}
	/**
	 * @param emailDetail the emailDetail to set
	 */
	public void setEmailDetail(String emailDetail) {
		this.emailDetail = emailDetail;
	}
	/**
	 * @return the emailDomain
	 */
	public String getEmailDomain() {
		return emailDomain;
	}
	/**
	 * @param emailDomain the emailDomain to set
	 */
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	/**
	 * @return the eMAIL_ID
	 */
	public String getEMAIL_ID() {
		return EMAIL_ID;
	}
	/**
	 * @param eMAIL_ID the eMAIL_ID to set
	 */
	public void setEMAIL_ID(String eMAIL_ID) {
		EMAIL_ID = eMAIL_ID;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the rSVDT
	 */
	public String getRSVDT() {
		return RSVDT;
	}
	/**
	 * @param rSVDT the rSVDT to set
	 */
	public void setRSVDT(String rSVDT) {
		RSVDT = rSVDT;
	}
	/**
	 * @return the rSVTM
	 */
	public String getRSVTM() {
		return RSVTM;
	}
	/**
	 * @param rSVTM the rSVTM to set
	 */
	public void setRSVTM(String rSVTM) {
		RSVTM = rSVTM;
	}
	/**
	 * @return the uSER_ID
	 */
	public String getUSER_ID() {
		return USER_ID;
	}
	/**
	 * @param uSER_ID the uSER_ID to set
	 */
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	/**
	 * @return the pOST_NO
	 */
	public String getPOST_NO() {
		return POST_NO;
	}
	/**
	 * @param pOST_NO the pOST_NO to set
	 */
	public void setPOST_NO(String pOST_NO) {
		POST_NO = pOST_NO;
	}
	/**
	 * @return the aDDR_TX
	 */
	public String getADDR_TX() {
		return ADDR_TX;
	}
	/**
	 * @param aDDR_TX the aDDR_TX to set
	 */
	public void setADDR_TX(String aDDR_TX) {
		ADDR_TX = aDDR_TX;
	}
	/**
	 * @return the aDDR_DTIL_TX
	 */
	public String getADDR_DTIL_TX() {
		return ADDR_DTIL_TX;
	}
	/**
	 * @param aDDR_DTIL_TX the aDDR_DTIL_TX to set
	 */
	public void setADDR_DTIL_TX(String aDDR_DTIL_TX) {
		ADDR_DTIL_TX = aDDR_DTIL_TX;
	}
	
}
