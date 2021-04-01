package fbcms.admin.hpm.ctm.service.Impl;

import java.util.List;

public class CenterVO {
	/*센터관리 Index*/
	private String INDEX;
	/*센터 02 클리닉 03*/
	private String MNG_GUBN_CD;
	/*센터코드*/
	private String MNG_CD;
	/*센터이름*/
	private String MNG_NM;
	/*관리순번*/
	private String MNG_SEQ;
	/*클리닉 명*/
	private String CLINIC_NM;
	/*게시여부*/
	private String POST_YN;
	/*순서변경 index*/
	private int    ORDER_NO;
	/*템플릿코드 (A:A,B:B,C:C)*/
	private String TEMPL_CD;
	/*관련진료과사용여부*/
	private String RLT_MEDI_USE_YN;
	/*주요질환사용여부*/
	private String IMP_DISS_USE_YN;
	/*검색 태그*/
	private String SEARCH_TAGS;
	/*등록일*/
	private String REG_DT;
	/*주요 질환*/
	private String MAJOR_DISS_CDS;
	/*의료진*/
	private String DR_IDS;
	private List<CenterTemplVO> TMP_LIST;
	
	/**
	 * @return the cLINIC_NM
	 */
	public String getCLINIC_NM() {
		return CLINIC_NM;
	}
	/**
	 * @param cLINIC_NM the cLINIC_NM to set
	 */
	public void setCLINIC_NM(String cLINIC_NM) {
		CLINIC_NM = cLINIC_NM;
	}
	/**
	 * @return the pOST_YN
	 */
	public String getPOST_YN() {
		return POST_YN;
	}
	/**
	 * @param pOST_YN the pOST_YN to set
	 */
	public void setPOST_YN(String pOST_YN) {
		POST_YN = pOST_YN;
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
	 * @return the mNG_SEQ
	 */
	public String getMNG_SEQ() {
		return MNG_SEQ;
	}
	/**
	 * @return the tMP_LIST
	 */
	public List<CenterTemplVO> getTMP_LIST() {
		return TMP_LIST;
	}
	/**
	 * @param tMP_LIST the tMP_LIST to set
	 */
	public void setTMP_LIST(List<CenterTemplVO> tMP_LIST) {
		TMP_LIST = tMP_LIST;
	}
	/**
	 * @param mNG_SEQ the mNG_SEQ to set
	 */
	public void setMNG_SEQ(String mNG_SEQ) {
		MNG_SEQ = mNG_SEQ;
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
	 * @return the iNDEX 센터관리 Index
	 */
	public String getINDEX() {
		return INDEX;
	}
	/**
	 * @param iNDEX 센터관리 Index
	 */
	public void setINDEX(String iNDEX) {
		INDEX = iNDEX;
	}
	/**
	 * @return the mNG_CD 센터코드
	 */
	public String getMNG_CD() {
		return MNG_CD;
	}
	/**
	 * @param mNG_CD 센터코드
	 */
	public void setMNG_CD(String mNG_CD) {
		MNG_CD = mNG_CD;
	}
	/**
	 * @return the mNG_NM 센터이름
	 */
	public String getMNG_NM() {
		return MNG_NM;
	}
	/**
	 * @param mNG_NM 센터이름
	 */
	public void setMNG_NM(String mNG_NM) {
		MNG_NM = mNG_NM;
	}
	/**
	 * @return the tEMPL_CD 템플릿코드
	 */
	public String getTEMPL_CD() {
		return TEMPL_CD;
	}
	/**
	 * @param tEMPL_CD 템플릿코드
	 */
	public void setTEMPL_CD(String tEMPL_CD) {
		TEMPL_CD = tEMPL_CD;
	}
	/**
	 * @return the rLT_MEDI_USE_YN 관련진료과사용여부
	 */
	public String getRLT_MEDI_USE_YN() {
		return RLT_MEDI_USE_YN;
	}
	/**
	 * @param rLT_MEDI_USE_YN 관련진료과사용여부
	 */
	public void setRLT_MEDI_USE_YN(String rLT_MEDI_USE_YN) {
		RLT_MEDI_USE_YN = rLT_MEDI_USE_YN;
	}
	/**
	 * @return the iMP_DISS_USE_YN 주요질환사용여부
	 */
	public String getIMP_DISS_USE_YN() {
		return IMP_DISS_USE_YN;
	}
	/**
	 * @param iMP_DISS_USE_YN 주요질환사용여부
	 */
	public void setIMP_DISS_USE_YN(String iMP_DISS_USE_YN) {
		IMP_DISS_USE_YN = iMP_DISS_USE_YN;
	}
	/**
	 * @return the sEARCH_TAGS 검색 태그
	 */
	public String getSEARCH_TAGS() {
		return SEARCH_TAGS;
	}
	/**
	 * @param sEARCH_TAGS 검색 태그
	 */
	public void setSEARCH_TAGS(String sEARCH_TAGS) {
		SEARCH_TAGS = sEARCH_TAGS;
	}
	/**
	 * @return the rEG_DT 등록일
	 */
	public String getREG_DT() {
		return REG_DT;
	}
	/**
	 * @param rEG_DT 등록일
	 */
	public void setREG_DT(String rEG_DT) {
		REG_DT = rEG_DT;
	}
	
	
}
