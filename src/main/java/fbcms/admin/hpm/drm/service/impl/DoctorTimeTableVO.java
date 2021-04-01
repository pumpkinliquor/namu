package fbcms.admin.hpm.drm.service.impl;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 의료진 진료시간표 VO
 * @author 김명진
 * @since 2020.10.18
 */
public class DoctorTimeTableVO extends ComDefaultVO{
	/*진료 과목코드*/
	private String MEDI_SBJ_CD;
	/*진료 과목명*/
	private String MEDI_SBJ_NM;
	/*요일코드*/
	private String DAY_WEEK_CD;
	/*의료진ID*/
	private String DR_ID;
	/*의료진 이름*/
	private String DR_NM;
	/*진료시간 구분 코드 AM PM*/
	private String TIME_GUBN_CD;
	/*가능여부*/
	private String POSB_YN;
	/*요일비고*/
	private String DAY_WEEK_BIGO_TX;
	/*최종 수정일시*/
	private String LAST_MOD_DT;
	/*오전 진료시간*/
	private String AM_CT;
	/*오후 진료시간*/
	private String PM_CT;
	/*분야*/
	private String FIELD_CT;
	/*파일 저장 경로*/
	private String FILE_STRE_COURS;
	/*저장 파일명*/
	private String STRE_FILE_NM;
	/*PC 이미지 첨부파일 번호*/
	private String PC_IMG_ATCH_NO;
	/*첨부파일 ID*/
	private String ATCH_FILE_ID;
	/*파일확장자*/
	private String FILE_EXTSN;
	/*포지션*/
	private String POSITION_CT;
	/*예약일*/
	private String APPO_DT;
	/*예약시간*/
	private String APPO_TIME;
	
	private String AP_YEAR;
	
	private String AP_MONTH;
	
	
	
	/**
	 * @return the aP_YEAR
	 */
	public String getAP_YEAR() {
		return AP_YEAR;
	}
	/**
	 * @param aP_YEAR the aP_YEAR to set
	 */
	public void setAP_YEAR(String aP_YEAR) {
		AP_YEAR = aP_YEAR;
	}
	/**
	 * @return the aP_MONTH
	 */
	public String getAP_MONTH() {
		return AP_MONTH;
	}
	/**
	 * @param aP_MONTH the aP_MONTH to set
	 */
	public void setAP_MONTH(String aP_MONTH) {
		AP_MONTH = aP_MONTH;
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
	 * @return the fILE_STRE_COURS
	 */
	public String getFILE_STRE_COURS() {
		return FILE_STRE_COURS;
	}
	/**
	 * @param fILE_STRE_COURS the fILE_STRE_COURS to set
	 */
	public void setFILE_STRE_COURS(String fILE_STRE_COURS) {
		FILE_STRE_COURS = fILE_STRE_COURS;
	}
	/**
	 * @return the sTRE_FILE_NM
	 */
	public String getSTRE_FILE_NM() {
		return STRE_FILE_NM;
	}
	/**
	 * @param sTRE_FILE_NM the sTRE_FILE_NM to set
	 */
	public void setSTRE_FILE_NM(String sTRE_FILE_NM) {
		STRE_FILE_NM = sTRE_FILE_NM;
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
	 * @return the aTCH_FILE_ID
	 */
	public String getATCH_FILE_ID() {
		return ATCH_FILE_ID;
	}
	/**
	 * @param aTCH_FILE_ID the aTCH_FILE_ID to set
	 */
	public void setATCH_FILE_ID(String aTCH_FILE_ID) {
		ATCH_FILE_ID = aTCH_FILE_ID;
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
	 * @return the dAY_WEEK_CD
	 */
	public String getDAY_WEEK_CD() {
		return DAY_WEEK_CD;
	}
	/**
	 * @param dAY_WEEK_CD the dAY_WEEK_CD to set
	 */
	public void setDAY_WEEK_CD(String dAY_WEEK_CD) {
		DAY_WEEK_CD = dAY_WEEK_CD;
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
	 * @return the tIME_GUBN_CD
	 */
	public String getTIME_GUBN_CD() {
		return TIME_GUBN_CD;
	}
	/**
	 * @param tIME_GUBN_CD the tIME_GUBN_CD to set
	 */
	public void setTIME_GUBN_CD(String tIME_GUBN_CD) {
		TIME_GUBN_CD = tIME_GUBN_CD;
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
	 * @return the dAY_WEEK_BIGO_TX
	 */
	public String getDAY_WEEK_BIGO_TX() {
		return DAY_WEEK_BIGO_TX;
	}
	/**
	 * @param dAY_WEEK_BIGO_TX the dAY_WEEK_BIGO_TX to set
	 */
	public void setDAY_WEEK_BIGO_TX(String dAY_WEEK_BIGO_TX) {
		DAY_WEEK_BIGO_TX = dAY_WEEK_BIGO_TX;
	}
	/**
	 * @return the lAST_MOD_DT
	 */
	public String getLAST_MOD_DT() {
		return LAST_MOD_DT;
	}
	/**
	 * @param lAST_MOD_DT the lAST_MOD_DT to set
	 */
	public void setLAST_MOD_DT(String lAST_MOD_DT) {
		LAST_MOD_DT = lAST_MOD_DT;
	}
	/**
	 * @return the aM_CT
	 */
	public String getAM_CT() {
		return AM_CT;
	}
	/**
	 * @param aM_CT the aM_CT to set
	 */
	public void setAM_CT(String aM_CT) {
		AM_CT = aM_CT;
	}
	/**
	 * @return the pM_CT
	 */
	public String getPM_CT() {
		return PM_CT;
	}
	/**
	 * @param pM_CT the pM_CT to set
	 */
	public void setPM_CT(String pM_CT) {
		PM_CT = pM_CT;
	}
}
