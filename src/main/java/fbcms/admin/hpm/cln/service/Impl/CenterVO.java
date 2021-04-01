package fbcms.admin.hpm.cln.service.Impl;

import java.util.List;

import fbcms.admin.hpm.drm.service.impl.DoctorVO;

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
	/*순번*/
	private String SEQ;
	/*상세 순번*/
	private String DTIL_SEQ;
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
	/*테이블 등록용 Array*/
	private String[] SEARCH_TAG_ARRAY;
	/*등록일*/
	private String REG_DT;
	/*주요 질환*/
	private String MAJOR_DISS_CDS;
	/*의료진*/
	private String DR_IDS;
	private List<CenterTemplVO> TMP_LIST;
	/*사용자ID*/
	private String USER_ID;
	/*질병코드 리스트*/
	private List<String> DISS_CDS_LIST;
	/*의사 리스트*/
	private List<DoctorVO> DR_LIST;
	
	private List<String> DR_LIST2;
	
	private String CODE_NM;
	
	private String CODE_ID;
	
	private String CODE;
	
	
	
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
	/**
	 * @return the sEQ
	 */
	public String getSEQ() {
		return SEQ;
	}
	/**
	 * @param sEQ the sEQ to set
	 */
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	/**
	 * @return the dTIL_SEQ
	 */
	public String getDTIL_SEQ() {
		return DTIL_SEQ;
	}
	/**
	 * @param dTIL_SEQ the dTIL_SEQ to set
	 */
	public void setDTIL_SEQ(String dTIL_SEQ) {
		DTIL_SEQ = dTIL_SEQ;
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
	 * @return the dISS_CDS_LIST // 질병코드관리
	 */
	public List<String> getDISS_CDS_LIST() {
		return DISS_CDS_LIST;
	}
	/**
	 * @param dISS_CDS_LIST the dISS_CDS_LIST to set // 질병코드관리
	 */
	public void setDISS_CDS_LIST(List<String> dISS_CDS_LIST) {
		DISS_CDS_LIST = dISS_CDS_LIST;
	}
	/**
	 * @return the cODE_NM
	 */
	public String getCODE_NM() {
		return CODE_NM;
	}
	/**
	 * @param cODE_NM the cODE_NM to set
	 */
	public void setCODE_NM(String cODE_NM) {
		CODE_NM = cODE_NM;
	}
	/**
	 * @return the cODE_ID
	 */
	public String getCODE_ID() {
		return CODE_ID;
	}
	/**
	 * @param cODE_ID the cODE_ID to set
	 */
	public void setCODE_ID(String cODE_ID) {
		CODE_ID = cODE_ID;
	}
	/**
	 * @return the cODE
	 */
	public String getCODE() {
		return CODE;
	}
	/**
	 * @param cODE the cODE to set
	 */
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	/**
	 * @return the dR_LIST
	 */
	public List<DoctorVO> getDR_LIST() {
		return DR_LIST;
	}
	/**
	 * @param dR_LIST the dR_LIST to set
	 */
	public void setDR_LIST(List<DoctorVO> dR_LIST) {
		DR_LIST = dR_LIST;
	}
	/**
	 * @return the dR_LIST2
	 */
	public List<String> getDR_LIST2() {
		return DR_LIST2;
	}
	/**
	 * @param dR_LIST2 the dR_LIST2 to set
	 */
	public void setDR_LIST2(List<String> dR_LIST2) {
		DR_LIST2 = dR_LIST2;
	}
	
	
	
}
