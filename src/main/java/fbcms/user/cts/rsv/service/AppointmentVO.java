package fbcms.user.cts.rsv.service;

import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

/**
 * HP_APPOINTMENT DB Column
 * 
 * @author 엄국현
 * @since 2020.11.17
 */
public class AppointmentVO extends ComDefaultVO {
	private static final long serialVersionUID = 1L;
	// 환자ID
	private String PID;
	// 환자ID
	private String emrKey;
	// 예약번호 (YYYYMMDD(8)+예약구분(2)+SEQ(3))
	private String APPO_NO;
	// 예약구분 (01:진료예약,02:검진예약)
	private String APPO_GUBN_CD;
	// 진료과목코드 (OCS:진료과설정)
	private String MEDI_SBJ_CD;
	// 진료과목이름
	private String MEDI_SBJ_NM;
	// 의료진아이디
	private String DR_ID;
	// 의료진 명
	private String DR_NM;
	// 예약자명
	private String APPO_PRSN_NM;
	// 예약자관계
	private String APPO_RLT_CD;
	// 성별 (M:남성,F:여성)
	private String GENDER_CD;
	// 예약일자 (YYYYMMDD)
	private String APPO_DT;
	// 예약시간 (HH24MI)
	private String APPO_TIME;
	// 생년월일 (YYYYMMDD)
	private String BIRTH_DT;
	// 휴대전화
	private String MOBILE_PHONE_NO;
	// 전화번호
	private String PHONE_NO;
	// 등록일자
	private Date FIRST_ADD_DT;
	// 예약상태코드
	private String APPO_STAT_CD;
	// 검진프로그램코드
	private String EXMN_PROG_CD;
	// 검진프로그램명
	private String EXMN_PROG_NM;
	// 이메일
	private String EMAIL_ID;
	// 우편번호
	private String POST_NO;
	// 주소
	private String ADDR_TX;
	// 상세주소
	private String ADDR_DTIL_TX;
	// 아이디
	private String USER_ID;
	// 이름
	private String USER_NM;
	// 입력아이디
	private String ADD_ID;
	// 입력일자
	private Date ADD_DT;
	// 수정아이디
	private String UPDT_ID;
	// 수정일자
	private Date UPDT_DT;
	// 삭제여부
	private String DEL_YN;
	// 문의전달사항
	private String INQR_SEND_TX;
	/**
	 * @return the pID
	 */
	public String getPID() {
		return PID;
	}
	/**
	 * @param pID the pID to set
	 */
	public void setPID(String pID) {
		PID = pID;
	}
	/**
	 * @return the emrKey
	 */
	public String getEmrKey() {
		return emrKey;
	}
	/**
	 * @param emrKey the emrKey to set
	 */
	public void setEmrKey(String emrKey) {
		this.emrKey = emrKey;
	}
	/**
	 * @return the aPPO_NO
	 */
	public String getAPPO_NO() {
		return APPO_NO;
	}
	/**
	 * @param aPPO_NO the aPPO_NO to set
	 */
	public void setAPPO_NO(String aPPO_NO) {
		APPO_NO = aPPO_NO;
	}
	/**
	 * @return the aPPO_GUBN_CD
	 */
	public String getAPPO_GUBN_CD() {
		return APPO_GUBN_CD;
	}
	/**
	 * @param aPPO_GUBN_CD the aPPO_GUBN_CD to set
	 */
	public void setAPPO_GUBN_CD(String aPPO_GUBN_CD) {
		APPO_GUBN_CD = aPPO_GUBN_CD;
	}
	/**
	 * @return the mEDI_SBJ_CD
	 */
	public String getMEDI_SBJ_CD() {
		return MEDI_SBJ_CD;
	}
	/**
	 * @param mEDI_SBJ_CD the mEDI_SBJ_CD to set
	 */
	public void setMEDI_SBJ_CD(String mEDI_SBJ_CD) {
		MEDI_SBJ_CD = mEDI_SBJ_CD;
	}
	/**
	 * @return the mEDI_SBJ_NM
	 */
	public String getMEDI_SBJ_NM() {
		return MEDI_SBJ_NM;
	}
	/**
	 * @param mEDI_SBJ_NM the mEDI_SBJ_NM to set
	 */
	public void setMEDI_SBJ_NM(String mEDI_SBJ_NM) {
		MEDI_SBJ_NM = mEDI_SBJ_NM;
	}
	/**
	 * @return the dR_ID
	 */
	public String getDR_ID() {
		return DR_ID;
	}
	/**
	 * @param dR_ID the dR_ID to set
	 */
	public void setDR_ID(String dR_ID) {
		DR_ID = dR_ID;
	}
	/**
	 * @return the dR_NM
	 */
	public String getDR_NM() {
		return DR_NM;
	}
	/**
	 * @param dR_NM the dR_NM to set
	 */
	public void setDR_NM(String dR_NM) {
		DR_NM = dR_NM;
	}
	/**
	 * @return the aPPO_PRSN_NM
	 */
	public String getAPPO_PRSN_NM() {
		return APPO_PRSN_NM;
	}
	/**
	 * @param aPPO_PRSN_NM the aPPO_PRSN_NM to set
	 */
	public void setAPPO_PRSN_NM(String aPPO_PRSN_NM) {
		APPO_PRSN_NM = aPPO_PRSN_NM;
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
	 * @return the gENDER_CD
	 */
	public String getGENDER_CD() {
		return GENDER_CD;
	}
	/**
	 * @param gENDER_CD the gENDER_CD to set
	 */
	public void setGENDER_CD(String gENDER_CD) {
		GENDER_CD = gENDER_CD;
	}
	/**
	 * @return the aPPO_DT
	 */
	public String getAPPO_DT() {
		return APPO_DT;
	}
	/**
	 * @param aPPO_DT the aPPO_DT to set
	 */
	public void setAPPO_DT(String aPPO_DT) {
		APPO_DT = aPPO_DT;
	}
	/**
	 * @return the aPPO_TIME
	 */
	public String getAPPO_TIME() {
		return APPO_TIME;
	}
	/**
	 * @param aPPO_TIME the aPPO_TIME to set
	 */
	public void setAPPO_TIME(String aPPO_TIME) {
		APPO_TIME = aPPO_TIME;
	}
	/**
	 * @return the bIRTH_DT
	 */
	public String getBIRTH_DT() {
		return BIRTH_DT;
	}
	/**
	 * @param bIRTH_DT the bIRTH_DT to set
	 */
	public void setBIRTH_DT(String bIRTH_DT) {
		BIRTH_DT = bIRTH_DT;
	}
	/**
	 * @return the mOBILE_PHONE_NO
	 */
	public String getMOBILE_PHONE_NO() {
		return MOBILE_PHONE_NO;
	}
	/**
	 * @param mOBILE_PHONE_NO the mOBILE_PHONE_NO to set
	 */
	public void setMOBILE_PHONE_NO(String mOBILE_PHONE_NO) {
		MOBILE_PHONE_NO = mOBILE_PHONE_NO;
	}
	/**
	 * @return the pHONE_NO
	 */
	public String getPHONE_NO() {
		return PHONE_NO;
	}
	/**
	 * @param pHONE_NO the pHONE_NO to set
	 */
	public void setPHONE_NO(String pHONE_NO) {
		PHONE_NO = pHONE_NO;
	}
	/**
	 * @return the fIRST_ADD_DT
	 */
	public Date getFIRST_ADD_DT() {
		return FIRST_ADD_DT;
	}
	/**
	 * @param fIRST_ADD_DT the fIRST_ADD_DT to set
	 */
	public void setFIRST_ADD_DT(Date fIRST_ADD_DT) {
		FIRST_ADD_DT = fIRST_ADD_DT;
	}
	/**
	 * @return the aPPO_STAT_CD
	 */
	public String getAPPO_STAT_CD() {
		return APPO_STAT_CD;
	}
	/**
	 * @param aPPO_STAT_CD the aPPO_STAT_CD to set
	 */
	public void setAPPO_STAT_CD(String aPPO_STAT_CD) {
		APPO_STAT_CD = aPPO_STAT_CD;
	}
	/**
	 * @return the eXMN_PROG_CD
	 */
	public String getEXMN_PROG_CD() {
		return EXMN_PROG_CD;
	}
	/**
	 * @param eXMN_PROG_CD the eXMN_PROG_CD to set
	 */
	public void setEXMN_PROG_CD(String eXMN_PROG_CD) {
		EXMN_PROG_CD = eXMN_PROG_CD;
	}
	/**
	 * @return the eXMN_PROG_NM
	 */
	public String getEXMN_PROG_NM() {
		return EXMN_PROG_NM;
	}
	/**
	 * @param eXMN_PROG_NM the eXMN_PROG_NM to set
	 */
	public void setEXMN_PROG_NM(String eXMN_PROG_NM) {
		EXMN_PROG_NM = eXMN_PROG_NM;
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
	 * @return the uSER_NM
	 */
	public String getUSER_NM() {
		return USER_NM;
	}
	/**
	 * @param uSER_NM the uSER_NM to set
	 */
	public void setUSER_NM(String uSER_NM) {
		USER_NM = uSER_NM;
	}
	/**
	 * @return the aDD_ID
	 */
	public String getADD_ID() {
		return ADD_ID;
	}
	/**
	 * @param aDD_ID the aDD_ID to set
	 */
	public void setADD_ID(String aDD_ID) {
		ADD_ID = aDD_ID;
	}
	/**
	 * @return the aDD_DT
	 */
	public Date getADD_DT() {
		return ADD_DT;
	}
	/**
	 * @param aDD_DT the aDD_DT to set
	 */
	public void setADD_DT(Date aDD_DT) {
		ADD_DT = aDD_DT;
	}
	/**
	 * @return the uPDT_ID
	 */
	public String getUPDT_ID() {
		return UPDT_ID;
	}
	/**
	 * @param uPDT_ID the uPDT_ID to set
	 */
	public void setUPDT_ID(String uPDT_ID) {
		UPDT_ID = uPDT_ID;
	}
	/**
	 * @return the uPDT_DT
	 */
	public Date getUPDT_DT() {
		return UPDT_DT;
	}
	/**
	 * @param uPDT_DT the uPDT_DT to set
	 */
	public void setUPDT_DT(Date uPDT_DT) {
		UPDT_DT = uPDT_DT;
	}
	/**
	 * @return the dEL_YN
	 */
	public String getDEL_YN() {
		return DEL_YN;
	}
	/**
	 * @param dEL_YN the dEL_YN to set
	 */
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	/**
	 * @return the iNQR_SEND_TX
	 */
	public String getINQR_SEND_TX() {
		return INQR_SEND_TX;
	}
	/**
	 * @param iNQR_SEND_TX the iNQR_SEND_TX to set
	 */
	public void setINQR_SEND_TX(String iNQR_SEND_TX) {
		INQR_SEND_TX = iNQR_SEND_TX;
	}

}
