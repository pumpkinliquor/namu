package fbcms.admin.hpm.sbm.service.Impl;

import egovframework.com.cmm.ComDefaultVO;

public class RelationCenterVO extends ComDefaultVO{
	/*구분 코드 01 진료과*/
	private String MNG_GUBN_CD;
	/*진료과코드*/
	private String MNG_CD;
	/*관리순번*/
	private String MNG_SEQ;
	/*센터코드*/
	private String CENTER_CD;
	/*소개*/
	private String CENTER_BIGO_TX;
	/*정렬순번*/
	private String ORDER_NO;
	
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
	 * @return the mNG_SEQ
	 */
	public String getMNG_SEQ() {
		return MNG_SEQ;
	}
	/**
	 * @param mNG_SEQ the mNG_SEQ to set
	 */
	public void setMNG_SEQ(String mNG_SEQ) {
		MNG_SEQ = mNG_SEQ;
	}
	/**
	 * @return the cENTER_CD
	 */
	public String getCENTER_CD() {
		return CENTER_CD;
	}
	/**
	 * @param cENTER_CD the cENTER_CD to set
	 */
	public void setCENTER_CD(String cENTER_CD) {
		CENTER_CD = cENTER_CD;
	}
	/**
	 * @return the cENTER_BIGO_TX
	 */
	public String getCENTER_BIGO_TX() {
		return CENTER_BIGO_TX;
	}
	/**
	 * @param cENTER_BIGO_TX the cENTER_BIGO_TX to set
	 */
	public void setCENTER_BIGO_TX(String cENTER_BIGO_TX) {
		CENTER_BIGO_TX = cENTER_BIGO_TX;
	}
	/**
	 * @return the oRDER_NO
	 */
	public String getORDER_NO() {
		return ORDER_NO;
	}
	/**
	 * @param oRDER_NO the oRDER_NO to set
	 */
	public void setORDER_NO(String oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
}
