package fbcms.user.cts.rsv.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 예약을 처리하는  VO 클래스
 * @author 김명진
 * @since 2020.10.06
 */
public class ReservationVO extends ComDefaultVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*예약번호*/
	private String  APPO_NO;
	/*회원ID*/
	private String	USER_ID;
	/*회원명*/
	private String	USER_NM;
	/*예약구분*/
	private String	APPO_GUBN_CD;
	/*진료과*/
	private String 	MEDI_SBJ_CD;
	/*진료과명*/
	private String 	MEDI_SBJ_NM;
	/*의료진ID*/
	private String	DR_ID;
	/*의료진명*/
	private String	DR_NM;
	/*의료진 분야*/
	private String	FIELD_CT;
	/*의료진 포지션*/
	private String	POSITION_CT;
	/*PC이미지 첨부파일번호*/
	private String	PC_IMG_ATCH_NO;
	/*PC이미지 첨부파일번호*/
	private String	PC_IMG_ATCH_EXT_SN;
	/*모바일이미지 첨부파일번호*/
	private String	MOBILE_IMG_ATCH_NO;
	/*모바일이미지 첨부파일번호*/
	private String	MOBILE_IMG_ATCH_EXT_SN;
	/*예약자이름*/
	private String	APPO_PRSN_NM;
	/*예약자이름*/
	private String	SEL_APPO_PRSN_NM;
	/*본인외예약이름*/
	private String	OTHER_PRSN_NM;
	/*예약자관계*/
	private String	APPO_RLT_CD;
	/*성별*/
	private String 	GENDER_CD;
	/*성별명*/
	private String 	GENDER_NM;
	/*예약일자*/
	private String	APPO_DT;
	/*예약등록일*/
	private String	APPO_TIME;
	/*환자생년월일*/
	private String	BIRTH_DT;	
	/*휴대폰*/
	private String	MOBILE_PHONE_NO;
	/*전화번호*/
	private String	PHONE_NO;
	/*등록일*/
	private String	FIRST_ADD_DT;
	/*예약상태*/
	private String	APPO_STAT_CD;
	/*예약명*/
	private String	APPO_STAT_NM;
	/*검진프로그램 코드*/
	private String  EXMN_PROG_CD;
	/*검진프로그램명*/
	private String  EXMN_PROG_NM;
	/*이메일*/
	private String  EMAIL_ID;
	/*우편번호*/
	private String  POST_NO;
	/*주소*/
	private String  ADDR_TX;
	/*상세주소*/
	private String  ADDR_DTIL_TX;
	/*시작일*/
	private String	BGN_DATE;
	/*종료일*/
	private String  END_DATE;
	/*추가노출 설정코드 (복수의 경우 콤마(,)로 구분)*/
	private String  ADD_OPEN_SET_CD;
	
	private String INQR_SEND_TX;
	
	private String CLINIC_APPO_WORD_CT;
	
	/**
	 * @return 예약번호
	 */
	public String getAPPO_NO() {
		return APPO_NO;
	}
	/**
	 * @param aPPO_NO 예약번호
	 */
	public void setAPPO_NO(String aPPO_NO) {
		APPO_NO = aPPO_NO;
	}
	/**
	 * @return 검진프로그램 코드
	 */
	public String getEXMN_PROG_CD() {
		return EXMN_PROG_CD;
	}
	/**
	 * @param eXMN_PROG_CD 검진프로그램 코드
	 */
	public void setEXMN_PROG_CD(String eXMN_PROG_CD) {
		EXMN_PROG_CD = eXMN_PROG_CD;
	}
	/**
	 * @return 검진프로그램명
	 */
	public String getEXMN_PROG_NM() {
		return EXMN_PROG_NM;
	}
	/**
	 * @param eXMN_PROG_NM 검진프로그램명
	 */
	public void setEXMN_PROG_NM(String eXMN_PROG_NM) {
		EXMN_PROG_NM = eXMN_PROG_NM;
	}
	/**
	 * @return 이메일
	 */
	public String getEMAIL_ID() {
		return EMAIL_ID;
	}
	/**
	 * @param eMAIL_ID 이메일
	 */
	public void setEMAIL_ID(String eMAIL_ID) {
		EMAIL_ID = eMAIL_ID;
	}
	/**
	 * @return 우편번호
	 */
	public String getPOST_NO() {
		return POST_NO;
	}
	/**
	 * @param pOST_NO 우편번호
	 */
	public void setPOST_NO(String pOST_NO) {
		POST_NO = pOST_NO;
	}
	/**
	 * @return 주소
	 */
	public String getADDR_TX() {
		return ADDR_TX;
	}
	/**
	 * @param aDDR_TX 주소
	 */
	public void setADDR_TX(String aDDR_TX) {
		ADDR_TX = aDDR_TX;
	}
	
	/**
	 * @return 상세주소
	 */
	public String getADDR_DTIL_TX() {
		return ADDR_DTIL_TX;
	}
	/**
	 * @param aDDR_DTIL_TX 상세주소
	 */
	public void setADDR_DTIL_TX(String aDDR_DTIL_TX) {
		ADDR_DTIL_TX = aDDR_DTIL_TX;
	}
	/**
	 * @return 등록일
	 */
	public String getFIRST_ADD_DT() {
		return FIRST_ADD_DT;
	}
	/**
	 * @param fIRST_ADD_DT 등록일
	 */
	public void setFIRST_ADD_DT(String fIRST_ADD_DT) {
		FIRST_ADD_DT = fIRST_ADD_DT;
	}
	/**
	 * @return 예약자관계
	 */
	public String getAPPO_RLT_CD() {
		return APPO_RLT_CD;
	}
	/**
	 * @param aPPO_RLT_CD 예약자관계
	 */
	public void setAPPO_RLT_CD(String aPPO_RLT_CD) {
		APPO_RLT_CD = aPPO_RLT_CD;
	}
	/**
	 * @return 예약구분
	 */
	public String getAPPO_GUBN_CD() {
		return APPO_GUBN_CD;
	}
	/**
	 * @param aPPO_GUBN_CD 예약구분
	 */
	public void setAPPO_GUBN_CD(String aPPO_GUBN_CD) {
		APPO_GUBN_CD = aPPO_GUBN_CD;
	}
	/**
	 * @return 검색 시작일
	 */
	public String getBGN_DATE() {
		if(BGN_DATE!=null)
			return BGN_DATE.replaceAll("\\.", "-");
		else return BGN_DATE;
	}
	/**
	 * @param bGN_DATE 검색시작일
	 */
	public void setBGN_DATE(String bGN_DATE) {
		BGN_DATE = bGN_DATE;
	}
	/**
	 * @return 검색 종료일
	 */
	public String getEND_DATE() {
		if(END_DATE!=null)
			return END_DATE.replaceAll("\\.", "-");
		else return END_DATE;
	}
	/**
	 * @param eND_DATE 검색 종료일
	 */
	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}
	/**
	 * @return 진료과
	 */
	public String getMEDI_SBJ_CD() {
		return MEDI_SBJ_CD;
	}
	/**
	 * @param dPT_NAME 진료과
	 */
	public void setMEDI_SBJ_CD(String dPT_NAME) {
		MEDI_SBJ_CD = dPT_NAME;
	}
	/**
	 * @return 진료과명
	 */
	public String getMEDI_SBJ_NM() {
		return MEDI_SBJ_NM;
	}
	/**
	 * @param mEDI_SBJ_NM 진료과명
	 */
	public void setMEDI_SBJ_NM(String mEDI_SBJ_NM) {
		MEDI_SBJ_NM = mEDI_SBJ_NM;
	}
	/**
	 * @return 의료진ID
	 */
	public String getDR_ID() {
		return DR_ID;
	}
	/**
	 * @param dR_ID 의료진ID
	 */
	public void setDR_ID(String dR_ID) {
		DR_ID = dR_ID;
	}
	/**
	 * @return 의료진명
	 */
	public String getDR_NM() {
		return DR_NM;
	}
	/**
	 * @param dR_NM 의료진명
	 */
	public void setDR_NM(String dR_NM) {
		DR_NM = dR_NM;
	}
	/**
	 * @return fIELD_CT 의료진 분야
	 */
	public String getFIELD_CT() {
		return FIELD_CT;
	}
	/**
	 * @param fIELD_CT 의료진 분야
	 */
	public void setFIELD_CT(String fIELD_CT) {
		FIELD_CT = fIELD_CT;
	}
	/**
	 * @return pOSITION_CT 의료진 포지션
	 */
	public String getPOSITION_CT() {
		return POSITION_CT;
	}
	/**
	 * @param pOSITION_CT 의료진 포지션
	 */
	public void setPOSITION_CT(String pOSITION_CT) {
		POSITION_CT = pOSITION_CT;
	}
	/**
	 * @return pC_IMG_ATCH_NO PC이미지 첨부파일번호
	 */
	public String getPC_IMG_ATCH_NO() {
		return PC_IMG_ATCH_NO;
	}
	/**
	 * @param pC_IMG_ATCH_NO PC이미지 첨부파일번호
	 */
	public void setPC_IMG_ATCH_NO(String pC_IMG_ATCH_NO) {
		PC_IMG_ATCH_NO = pC_IMG_ATCH_NO;
	}
	/**
	 * @return the pC_IMG_ATCH_EXT_SN 첨부파일 확장명
	 */
	public String getPC_IMG_ATCH_EXT_SN() {
		return PC_IMG_ATCH_EXT_SN;
	}
	/**
	 * @param pC_IMG_ATCH_EXT_SN the pC_IMG_ATCH_EXT_SN to set 첨부파일 확장명
	 */
	public void setPC_IMG_ATCH_EXT_SN(String pC_IMG_ATCH_EXT_SN) {
		PC_IMG_ATCH_EXT_SN = pC_IMG_ATCH_EXT_SN;
	}
	/**
	 * @return mOBILE_IMG_ATCH_NO 모바일이미지 첨부파일번호
	 */
	public String getMOBILE_IMG_ATCH_NO() {
		return MOBILE_IMG_ATCH_NO;
	}
	/**
	 * @param mOBILE_IMG_ATCH_NO 모바일이미지 첨부파일번호
	 */
	public void setMOBILE_IMG_ATCH_NO(String mOBILE_IMG_ATCH_NO) {
		MOBILE_IMG_ATCH_NO = mOBILE_IMG_ATCH_NO;
	}
	/**
	 * @return the mOBILE_IMG_ATCH_EXT_SN 모바일이미지 확장명
	 */
	public String getMOBILE_IMG_ATCH_EXT_SN() {
		return MOBILE_IMG_ATCH_EXT_SN;
	}
	/**
	 * @param mOBILE_IMG_ATCH_EXT_SN the mOBILE_IMG_ATCH_EXT_SN to set 모바일이미지 확장명
	 */
	public void setMOBILE_IMG_ATCH_EXT_SN(String mOBILE_IMG_ATCH_EXT_SN) {
		MOBILE_IMG_ATCH_EXT_SN = mOBILE_IMG_ATCH_EXT_SN;
	}
	/**
	 * @return 예약시간
	 */
	public String getAPPO_DT() {
		return APPO_DT;
	}
	/**
	 * @param aPPO_DT 예약시간
	 */
	public void setAPPO_DT(String aPPO_DT) {
		APPO_DT = aPPO_DT;
	}
	/**
	 * @return 회원ID
	 */
	public String getUSER_ID() {
		return USER_ID;
	}
	/**
	 * @param uSR_ID 회원ID
	 */
	public void setUSER_ID(String uSR_ID) {
		USER_ID = uSR_ID;
	}
	/**
	 * @return 회원명
	 */
	public String getUSER_NM() {
		return USER_NM;
	}
	/**
	 * @param uSR_ID 회원명
	 */
	public void setUSER_NM(String uSR_NM) {
		USER_NM = uSR_NM;
	}
	/**
	 * @return 예약자이름
	 */
	public String getAPPO_PRSN_NM() {
		return APPO_PRSN_NM;
	}
	/**
	 * @param aPPO_PRSN_NM 예약자이름
	 */
	public void setAPPO_PRSN_NM(String aPPO_PRSN_NM) {
		APPO_PRSN_NM = aPPO_PRSN_NM;
	}
	/**
	 * @return 예약자이름
	 */
	public String getSEL_APPO_PRSN_NM() {
		return SEL_APPO_PRSN_NM;
	}
	/**
	 * @param sEL_APPO_PRSN_NM 예약자이름
	 */
	public void setSEL_APPO_PRSN_NM(String sEL_APPO_PRSN_NM) {
		SEL_APPO_PRSN_NM = sEL_APPO_PRSN_NM;
	}
	/**
	 * @return 본인외예약이름
	 */
	public String getOTHER_PRSN_NM() {
		return OTHER_PRSN_NM;
	}
	/**
	 * @param oTHER_PRSN_NM 본인외예약이름
	 */
	public void setOTHER_PRSN_NM(String oTHER_PRSN_NM) {
		OTHER_PRSN_NM = oTHER_PRSN_NM;
	}
	/**
	 * @return the 예약자 생년월일
	 */
	public String getBIRTH_DT() {
		return BIRTH_DT;
	}
	/**
	 * @param uSR_BIRTH 예약자 생년월일
	 */
	public void setBIRTH_DT(String uSR_BIRTH) {
		BIRTH_DT = uSR_BIRTH;
	}
	/**
	 * @return 휴대전화번호
	 */
	public String getMOBILE_PHONE_NO() {
		return MOBILE_PHONE_NO;
	}
	/**
	 * @param mB_PHONE_NO 휴대전화번호
	 */
	public void setMOBILE_PHONE_NO(String mB_PHONE_NO) {
		MOBILE_PHONE_NO = mB_PHONE_NO;
	}
	/**
	 * @return 전화번호
	 */
	public String getPHONE_NO() {
		return PHONE_NO;
	}
	/**
	 * @param pHONE_NO 전화번호
	 */
	public void setPHONE_NO(String pHONE_NO) {
		PHONE_NO = pHONE_NO;
	}
	/**
	 * @return 성별
	 */
	public String getGENDER_CD() {
		return GENDER_CD;
	}
	/**
	 * @param gENDER_CD 성별
	 */
	public void setGENDER_CD(String gENDER_CD) {
		GENDER_CD = gENDER_CD;
	}
	/**
	 * @return 성별
	 */
	public String getGENDER_NM() {
		return GENDER_NM;
	}
	/**
	 * @param gENDER_NM 성별
	 */
	public void setGENDER_NM(String gENDER_NM) {
		GENDER_NM = gENDER_NM;
	}
	/**
	 * @return 등록일
	 */
	public String getAPPO_TIME() {
		return APPO_TIME;
	}
	/**
	 * @param rGSTR_TIME 등록 일
	 */
	public void setAPPO_TIME(String rGSTR_TIME) {
		APPO_TIME = rGSTR_TIME;
	}
	/**
	 * @return 예약 상태
	 */
	public String getAPPO_STAT_CD() {
		return APPO_STAT_CD;
	}
	/**
	 * @param aPPO_STAT_CD 예약 상태
	 */
	public void setAPPO_STAT_CD(String aPPO_STAT_CD) {
		APPO_STAT_CD = aPPO_STAT_CD;
	}
	/**
	 * @return 예약 상태명
	 */
	public String getAPPO_STAT_NM() {
		return APPO_STAT_NM;
	}
	/**
	 * @param aPPO_STAT_NM 예약 상태명
	 */
	public void setAPPO_STAT_NM(String aPPO_STAT_NM) {
		APPO_STAT_NM = aPPO_STAT_NM;
	}
	/**
	 * @return the aDD_OPEN_SET_CD
	 */
	public String getADD_OPEN_SET_CD() {
		return ADD_OPEN_SET_CD;
	}
	/**
	 * @param aDD_OPEN_SET_CD the aDD_OPEN_SET_CD to set
	 */
	public void setADD_OPEN_SET_CD(String aDD_OPEN_SET_CD) {
		ADD_OPEN_SET_CD = aDD_OPEN_SET_CD;
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
	/**
	 * @return the cLINIC_APPO_WORD_CT
	 */
	public String getCLINIC_APPO_WORD_CT() {
		return CLINIC_APPO_WORD_CT;
	}
	/**
	 * @param cLINIC_APPO_WORD_CT the cLINIC_APPO_WORD_CT to set
	 */
	public void setCLINIC_APPO_WORD_CT(String cLINIC_APPO_WORD_CT) {
		CLINIC_APPO_WORD_CT = cLINIC_APPO_WORD_CT;
	}
	
}
