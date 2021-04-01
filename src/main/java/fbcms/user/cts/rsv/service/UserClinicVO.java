package fbcms.user.cts.rsv.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 클리닉 관리 프로세스 통합 VO
 * 
 * @author 엄국현
 *
 */
public class UserClinicVO extends ComDefaultVO {
	private static final long serialVersionUID = 1L;

	/* 1Depth request */
	/* 예약자 타입 */
	private String reservation;
	/* 이름 */
	private String usrNm;
	/* 생년월일 */
	private String usrBd;
	/* 성별 */
	private String gender;
	/* 예약자 관계여부 */
	private String APPO_RLT_CD;
	/* 휴대폰번호 앞자리 */
	private String fCtn;
	/* 휴대폰번호 중간자리(국번) */
	private String mCtn;
	/* 휴대폰번호 끝자리(국번) */
	private String lCtn;
	/* 전화번호 앞자리 */
	private String fTel;
	/* 전화번호 중간자리 */
	private String mTel;
	/* 전화번호 끝자리 */
	private String lTel;
	
	/*insert 프로시저 - 에러YN*/
	private String errYn;
	/*insert 프로시저 - 에러메시지*/
	private String errMsg;
	/*insert 프로시저 - 초진/재진*/
	private String acnof;
	

	/* 본인인증 OCS DB column */
	/* 리턴 PID */
	private String PID;

	/* 2depth request */
	/* 진료과 코드 */
	private String DPT_CD;
	/* 의사 사번 */
	private String DR_ID;
	/* 의사 이름 */
	private String DR_NM;
	/* 예약일자 */
	private String RSV_DT;
	/* 예약시간*/
	private String RSV_TM;
	/* 진료과 코드 */
	private String MEDI_SBJ_CD;
	/* 진료과 이름*/
	private String MEDI_SBJ_NM;
	/* 예약시간 */
	private String rTime;
	
	/* submit */
	private String EMAIL_ID;
	private String POST_NO;
	private String ADDR_TX;
	private String ADDR_DTIL_TX;
	private String USER_ID;

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
	 * @return the errYn
	 */
	public String getErrYn() {
		return errYn;
	}
	/**
	 * @param errYn the errYn to set
	 */
	public void setErrYn(String errYn) {
		this.errYn = errYn;
	}
	/**
	 * @return the errMsg
	 */
	public String getErrMsg() {
		return errMsg;
	}
	/**
	 * @param errMsg the errMsg to set
	 */
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	/**
	 * @return the acnof
	 */
	public String getAcnof() {
		return acnof;
	}
	/**
	 * @param acnof the acnof to set
	 */
	public void setAcnof(String acnof) {
		this.acnof = acnof;
	}
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
	 * @return the dPT_CD
	 */
	public String getDPT_CD() {
		return DPT_CD;
	}
	/**
	 * @param dPT_CD the dPT_CD to set
	 */
	public void setDPT_CD(String dPT_CD) {
		DPT_CD = dPT_CD;
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
	 * @return the rSV_DT
	 */
	public String getRSV_DT() {
		return RSV_DT;
	}
	/**
	 * @param rSV_DT the rSV_DT to set
	 */
	public void setRSV_DT(String rSV_DT) {
		RSV_DT = rSV_DT;
	}
	/**
	 * @return the rSV_TM
	 */
	public String getRSV_TM() {
		return RSV_TM;
	}
	/**
	 * @param rSV_TM the rSV_TM to set
	 */
	public void setRSV_TM(String rSV_TM) {
		RSV_TM = rSV_TM;
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
	 * @return the rTime
	 */
	public String getrTime() {
		return rTime;
	}
	/**
	 * @param rTime the rTime to set
	 */
	public void setrTime(String rTime) {
		this.rTime = rTime;
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

}
