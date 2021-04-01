package fbcms.admin.hpm.drm.service.impl;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 의료진VO
 * @author 김명진
 * @since 2020.10.13
 */
public class DoctorVO extends ComDefaultVO{
	/*의료진아이디*/
	private String DR_ID;
	/*진료과목코드*/
	private String MEDI_SBJ_CD;
	/*진료과*/
	private String MEDI_SBJ_NM;
	/*의료진명*/
	private String DR_NM;
	/*특진*/
	private String SPCL_CLINIC_CT;
	/*분야*/
	private String FIELD_CT;
	/*포지션*/
	private String POSITION_CT;
	/*PC이미지 첨부파일번호*/
	private String PC_IMG_ATCH_NO;
	/*모바일이미지 첨부파일번호*/
	private String MOBILE_IMG_ATCH_NO;
	/*담당센터 (복수의 경우 콤마(,)로 구분)*/
	private String MNG_CENTER_CD;
	/*전문분야*/
	private String SPCL_FIELD_TX;
	/*약력*/
	private String HISTORY_TX;
	/*약력2*/
	private String HISTORY_TX2;
	/*블로그주소*/
	private String BLOG_ADD_TX;
	/*추가노출 설정코드 (복수의 경우 콤마(,)로 구분)*/
	private String ADD_OPEN_SET_CD;
	/*검색태그 (복수의 경우 콤마(,)로 구분)*/
	private String SEARCH_TAG_CT;
	/*테이블 등록용 Array*/
	private String[] SEARCH_TAG_ARRAY;
	/*등록일*/
	private String REG_DT;
	/*삭제여부*/
	private String DEL_YN;
	/*검색 시작일*/
	private String BGN_DATE;
	/*검색 종료일*/
	private String END_DATE;
	/*방송출연*/
	private String BROAD_APPEAR_TX;
	/*블로그사용여부*/
	private String BLOG_USE_YN;
	/*진료예약 문구*/
	private String CLINIC_APPO_WORD_CT;
	/*순서*/
	private int ORDER_NO;
	
	private String FILE_EXTSN;
	
	private String USER_ID;
	
	
	
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
	 * @return the oRDER_NO
	 */
	public int getORDER_NO() {
		return ORDER_NO;
	}
	/**
	 * @param oRDER_NO the oRDER_NO to set
	 */
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
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
	 * @return the bROAD_APPEAR_TX
	 */
	public String getBROAD_APPEAR_TX() {
		return BROAD_APPEAR_TX;
	}
	/**
	 * @param bROAD_APPEAR_TX the bROAD_APPEAR_TX to set
	 */
	public void setBROAD_APPEAR_TX(String bROAD_APPEAR_TX) {
		BROAD_APPEAR_TX = bROAD_APPEAR_TX;
	}
	/**
	 * @return the bLOG_USE_YN
	 */
	public String getBLOG_USE_YN() {
		return BLOG_USE_YN;
	}
	/**
	 * @param bLOG_USE_YN the bLOG_USE_YN to set
	 */
	public void setBLOG_USE_YN(String bLOG_USE_YN) {
		BLOG_USE_YN = bLOG_USE_YN;
	}
	/**
	 * @return the bGN_DATE
	 */
	public String getBGN_DATE() {
		return BGN_DATE;
	}
	/**
	 * @param bGN_DATE the bGN_DATE to set
	 */
	public void setBGN_DATE(String bGN_DATE) {
		BGN_DATE = bGN_DATE;
	}
	/**
	 * @return the eND_DATE
	 */
	public String getEND_DATE() {
		return END_DATE;
	}
	/**
	 * @param eND_DATE the eND_DATE to set
	 */
	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
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
	 * @return the sPCL_CLINIC_CT
	 */
	public String getSPCL_CLINIC_CT() {
		return SPCL_CLINIC_CT;
	}
	/**
	 * @param sPCL_CLINIC_CT the sPCL_CLINIC_CT to set
	 */
	public void setSPCL_CLINIC_CT(String sPCL_CLINIC_CT) {
		SPCL_CLINIC_CT = sPCL_CLINIC_CT;
	}
	/**
	 * @return the fIELD_CT
	 */
	public String getFIELD_CT() {
		return FIELD_CT;
	}
	/**
	 * @param fIELD_CT the fIELD_CT to set
	 */
	public void setFIELD_CT(String fIELD_CT) {
		FIELD_CT = fIELD_CT;
	}
	/**
	 * @return the pOSITION_CT
	 */
	public String getPOSITION_CT() {
		return POSITION_CT;
	}
	/**
	 * @param pOSITION_CT the pOSITION_CT to set
	 */
	public void setPOSITION_CT(String pOSITION_CT) {
		POSITION_CT = pOSITION_CT;
	}
	/**
	 * @return the pC_IMG_ATCH_NO
	 */
	public String getPC_IMG_ATCH_NO() {
		return PC_IMG_ATCH_NO;
	}
	/**
	 * @param pC_IMG_ATCH_NO the pC_IMG_ATCH_NO to set
	 */
	public void setPC_IMG_ATCH_NO(String pC_IMG_ATCH_NO) {
		PC_IMG_ATCH_NO = pC_IMG_ATCH_NO;
	}
	/**
	 * @return the mOBILE_IMG_ATCH_NO
	 */
	public String getMOBILE_IMG_ATCH_NO() {
		return MOBILE_IMG_ATCH_NO;
	}
	/**
	 * @param mOBILE_IMG_ATCH_NO the mOBILE_IMG_ATCH_NO to set
	 */
	public void setMOBILE_IMG_ATCH_NO(String mOBILE_IMG_ATCH_NO) {
		MOBILE_IMG_ATCH_NO = mOBILE_IMG_ATCH_NO;
	}
	/**
	 * @return the mNG_CENTER_CD
	 */
	public String getMNG_CENTER_CD() {
		return MNG_CENTER_CD;
	}
	/**
	 * @param mNG_CENTER_CD the mNG_CENTER_CD to set
	 */
	public void setMNG_CENTER_CD(String mNG_CENTER_CD) {
		MNG_CENTER_CD = mNG_CENTER_CD;
	}
	/**
	 * @return the sPCL_FIELD_TX
	 */
	public String getSPCL_FIELD_TX() {
		return SPCL_FIELD_TX;
	}
	/**
	 * @param sPCL_FIELD_TX the sPCL_FIELD_TX to set
	 */
	public void setSPCL_FIELD_TX(String sPCL_FIELD_TX) {
		SPCL_FIELD_TX = sPCL_FIELD_TX;
	}
	/**
	 * @return the hISTORY_TX
	 */
	public String getHISTORY_TX() {
		return HISTORY_TX;
	}
	/**
	 * @param hISTORY_TX the hISTORY_TX to set
	 */
	public void setHISTORY_TX(String hISTORY_TX) {
		HISTORY_TX = hISTORY_TX;
	}
	/**
	 * @return the hISTORY_TX
	 */
	public String getHISTORY_TX2() {
		return HISTORY_TX2;
	}
	/**
	 * @param hISTORY_TX the hISTORY_TX to set
	 */
	public void setHISTORY_TX2(String hISTORY_TX2) {
		HISTORY_TX2 = hISTORY_TX2;
	}
	/**
	 * @return the bLOG_ADD_TX
	 */
	public String getBLOG_ADD_TX() {
		return BLOG_ADD_TX;
	}
	/**
	 * @param bLOG_ADD_TX the bLOG_ADD_TX to set
	 */
	public void setBLOG_ADD_TX(String bLOG_ADD_TX) {
		BLOG_ADD_TX = bLOG_ADD_TX;
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
	 * @return the sEARCH_TAG_CT
	 */
	public String getSEARCH_TAG_CT() {
		return SEARCH_TAG_CT;
	}
	/**
	 * @param sEARCH_TAG_CT the sEARCH_TAG_CT to set
	 */
	public void setSEARCH_TAG_CT(String sEARCH_TAG_CT) {
		SEARCH_TAG_CT = sEARCH_TAG_CT;
	}
	/**
	 * @return the sEARCH_TAG_ARRAY
	 */
	public String[] getSEARCH_TAG_ARRAY() {
		return SEARCH_TAG_ARRAY;
	}
	/**
	 * @param sEARCH_TAG_ARRAY the sEARCH_TAG_ARRAY to set
	 */
	public void setSEARCH_TAG_ARRAY(String[] sEARCH_TAG_ARRAY) {
		SEARCH_TAG_ARRAY = sEARCH_TAG_ARRAY;
	}
	/**
	 * @return the rEG_DT
	 */
	public String getREG_DT() {
		return REG_DT;
	}
	/**
	 * @param rEG_DT the rEG_DT to set
	 */
	public void setREG_DT(String rEG_DT) {
		REG_DT = rEG_DT;
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
	 * @return the fILE_EXTSN
	 */
	public String getFILE_EXTSN() {
		return FILE_EXTSN;
	}
	/**
	 * @param fILE_EXTSN the fILE_EXTSN to set
	 */
	public void setFILE_EXTSN(String fILE_EXTSN) {
		FILE_EXTSN = fILE_EXTSN;
	}
	
	
}
