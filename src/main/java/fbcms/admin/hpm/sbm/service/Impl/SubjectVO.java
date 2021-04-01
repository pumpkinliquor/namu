package fbcms.admin.hpm.sbm.service.Impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SubjectVO extends ComDefaultVO{
	/*구분 코드 01 진료과*/
	private String MNG_GUBN_CD;
	/*진료과*/
	private String MNG_NM;
	/*진료과코드*/
	private String MNG_CD;
	/*간단소개*/
	private String SIMPLE_INTRO_TX;
	/*소개*/
	private String INTRO_TX;
	/*주요질환코드 (복수의 경우 콤마(,)로 구분)*/
	private String MAJOR_DISS_CDS;
	/*의료진 (복수의 경우 콤마(,)로 구분)*/
	private String DR_IDS;
	/*검색*/
	private String SEARCH_TAGS;
	/*테이블 등록용 Array*/
	private String[] SEARCH_TAG_ARRAY;
	/*등록일*/
	private String REG_DT;
	/*최종수정일*/
	private String UPDT_DT;
	/*관련센터1 코드*/
	private String MNG_CENTER_CD1;
	/*관련센터1 명*/
	private String MNG_CENTER_NM1;
	/*관련센터1 비고*/
	private String MNG_CENTER_CD1_BIGO;
	/*관련센터2 코드*/
	private String MNG_CENTER_CD2;
	/*관련센터2 명*/
	private String MNG_CENTER_NM2;
	/*관련센터2 비고*/
	private String MNG_CENTER_CD2_BIGO;
	/*관련센터3 코드*/
	private String MNG_CENTER_CD3;
	/*관련센터3 명*/
	private String MNG_CENTER_NM3;
	/*관련센터3 비고*/
	private String MNG_CENTER_CD3_BIGO;
	/*질병코드 리스트*/
	private List<String> DISS_CDS_LIST;
	/*진료과 코드 OCS*/
	private String DPTCD;
	/*OCS 진료과 이름*/
	private String DPTNM;
	
	
	/**
	 * @return the dPTCD
	 */
	public String getDPTCD() {
		return DPTCD;
	}
	/**
	 * @param dPTCD the dPTCD to set
	 */
	public void setDPTCD(String dPTCD) {
		DPTCD = dPTCD;
	}
	/**
	 * @return the dPTNM
	 */
	public String getDPTNM() {
		return DPTNM;
	}
	/**
	 * @param dPTNM the dPTNM to set
	 */
	public void setDPTNM(String dPTNM) {
		DPTNM = dPTNM;
	}
	
	/**
	 * @return the dISS_CDS_LIST
	 */
	public List<String> getDISS_CDS_LIST() {
		return DISS_CDS_LIST;
	}
	/**
	 * @param dISS_CDS_LIST the dISS_CDS_LIST to set
	 */
	public void setDISS_CDS_LIST(List<String> dISS_CDS_LIST) {
		DISS_CDS_LIST = dISS_CDS_LIST;
	}
	/**
	 * @return the mNG_CENTER_CD1
	 */
	public String getMNG_CENTER_CD1() {
		return MNG_CENTER_CD1;
	}
	/**
	 * @param mNG_CENTER_CD1 the mNG_CENTER_CD1 to set
	 */
	public void setMNG_CENTER_CD1(String mNG_CENTER_CD1) {
		MNG_CENTER_CD1 = mNG_CENTER_CD1;
	}
	/**
	 * @return the mNG_CENTER_NM1
	 */
	public String getMNG_CENTER_NM1() {
		return MNG_CENTER_NM1;
	}
	/**
	 * @param mNG_CENTER_NM1 the mNG_CENTER_NM1 to set
	 */
	public void setMNG_CENTER_NM1(String mNG_CENTER_NM1) {
		MNG_CENTER_NM1 = mNG_CENTER_NM1;
	}
	/**
	 * @return the mNG_CENTER_CD1_BIGO
	 */
	public String getMNG_CENTER_CD1_BIGO() {
		return MNG_CENTER_CD1_BIGO;
	}
	/**
	 * @param mNG_CENTER_CD1_BIGO the mNG_CENTER_CD1_BIGO to set
	 */
	public void setMNG_CENTER_CD1_BIGO(String mNG_CENTER_CD1_BIGO) {
		MNG_CENTER_CD1_BIGO = mNG_CENTER_CD1_BIGO;
	}
	/**
	 * @return the mNG_CENTER_CD2
	 */
	public String getMNG_CENTER_CD2() {
		return MNG_CENTER_CD2;
	}
	/**
	 * @param mNG_CENTER_CD2 the mNG_CENTER_CD2 to set
	 */
	public void setMNG_CENTER_CD2(String mNG_CENTER_CD2) {
		MNG_CENTER_CD2 = mNG_CENTER_CD2;
	}
	/**
	 * @return the mNG_CENTER_NM2
	 */
	public String getMNG_CENTER_NM2() {
		return MNG_CENTER_NM2;
	}
	/**
	 * @param mNG_CENTER_NM2 the mNG_CENTER_NM2 to set
	 */
	public void setMNG_CENTER_NM2(String mNG_CENTER_NM2) {
		MNG_CENTER_NM2 = mNG_CENTER_NM2;
	}
	/**
	 * @return the mNG_CENTER_CD2_BIGO
	 */
	public String getMNG_CENTER_CD2_BIGO() {
		return MNG_CENTER_CD2_BIGO;
	}
	/**
	 * @param mNG_CENTER_CD2_BIGO the mNG_CENTER_CD2_BIGO to set
	 */
	public void setMNG_CENTER_CD2_BIGO(String mNG_CENTER_CD2_BIGO) {
		MNG_CENTER_CD2_BIGO = mNG_CENTER_CD2_BIGO;
	}
	/**
	 * @return the mNG_CENTER_CD3
	 */
	public String getMNG_CENTER_CD3() {
		return MNG_CENTER_CD3;
	}
	/**
	 * @param mNG_CENTER_CD3 the mNG_CENTER_CD3 to set
	 */
	public void setMNG_CENTER_CD3(String mNG_CENTER_CD3) {
		MNG_CENTER_CD3 = mNG_CENTER_CD3;
	}
	/**
	 * @return the mNG_CENTER_NM3
	 */
	public String getMNG_CENTER_NM3() {
		return MNG_CENTER_NM3;
	}
	/**
	 * @param mNG_CENTER_NM3 the mNG_CENTER_NM3 to set
	 */
	public void setMNG_CENTER_NM3(String mNG_CENTER_NM3) {
		MNG_CENTER_NM3 = mNG_CENTER_NM3;
	}
	/**
	 * @return the mNG_CENTER_CD3_BIGO
	 */
	public String getMNG_CENTER_CD3_BIGO() {
		return MNG_CENTER_CD3_BIGO;
	}
	/**
	 * @param mNG_CENTER_CD3_BIGO the mNG_CENTER_CD3_BIGO to set
	 */
	public void setMNG_CENTER_CD3_BIGO(String mNG_CENTER_CD3_BIGO) {
		MNG_CENTER_CD3_BIGO = mNG_CENTER_CD3_BIGO;
	}
	/**
	 * @return the mNG_GUBN_CD
	 */
	public String getMNG_GUBN_CD() {
		return MNG_GUBN_CD;
	}
	/**
	 * @param mNG_GUBN_CD the mNG_GUBN_CD to set
	 */
	public void setMNG_GUBN_CD(String mNG_GUBN_CD) {
		MNG_GUBN_CD = mNG_GUBN_CD;
	}
	/**
	 * @return the mNG_GUBN_NM
	 */
	public String getMNG_NM() {
		return MNG_NM;
	}
	/**
	 * @param mNG_GUBN_NM the mNG_GUBN_NM to set
	 */
	public void setMNG_NM(String mNG_NM) {
		MNG_NM = mNG_NM;
	}
	/**
	 * @return the mNG_CD
	 */
	public String getMNG_CD() {
		return MNG_CD;
	}
	/**
	 * @param mNG_CD the mNG_CD to set
	 */
	public void setMNG_CD(String mNG_CD) {
		MNG_CD = mNG_CD;
	}
	/**
	 * @return the sIMPLE_INTRO_TX
	 */
	public String getSIMPLE_INTRO_TX() {
		return SIMPLE_INTRO_TX;
	}
	/**
	 * @param sIMPLE_INTRO_TX the sIMPLE_INTRO_TX to set
	 */
	public void setSIMPLE_INTRO_TX(String sIMPLE_INTRO_TX) {
		SIMPLE_INTRO_TX = sIMPLE_INTRO_TX;
	}
	/**
	 * @return the iNTRO_TX
	 */
	public String getINTRO_TX() {
		return INTRO_TX;
	}
	/**
	 * @param iNTRO_TX the iNTRO_TX to set
	 */
	public void setINTRO_TX(String iNTRO_TX) {
		INTRO_TX = iNTRO_TX;
	}
	/**
	 * @return the mAJOR_DISS_CDS
	 */
	public String getMAJOR_DISS_CDS() {
		return MAJOR_DISS_CDS;
	}
	/**
	 * @param mAJOR_DISS_CDS the mAJOR_DISS_CDS to set
	 */
	public void setMAJOR_DISS_CDS(String mAJOR_DISS_CDS) {
		MAJOR_DISS_CDS = mAJOR_DISS_CDS;
	}
	/**
	 * @return the dR_IDS
	 */
	public String getDR_IDS() {
		return DR_IDS;
	}
	/**
	 * @param dR_IDS the dR_IDS to set
	 */
	public void setDR_IDS(String dR_IDS) {
		DR_IDS = dR_IDS;
	}
	/**
	 * @return the sEARCH_TAGS
	 */
	public String getSEARCH_TAGS() {
		return SEARCH_TAGS;
	}
	/**
	 * @param sEARCH_TAGS the sEARCH_TAGS to set
	 */
	public void setSEARCH_TAGS(String sEARCH_TAGS) {
		SEARCH_TAGS = sEARCH_TAGS;
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
	 * @return the uPDT_DT
	 */
	public String getUPDT_DT() {
		return UPDT_DT;
	}
	/**
	 * @param uPDT_DT the uPDT_DT to set
	 */
	public void setUPDT_DT(String uPDT_DT) {
		UPDT_DT = uPDT_DT;
	}
}
